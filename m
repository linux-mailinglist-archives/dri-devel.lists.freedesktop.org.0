Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949261188A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17B76E044;
	Tue, 10 Dec 2019 12:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7386E044
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:43:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C72FB1AD;
 Tue, 10 Dec 2019 12:43:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/vmwgfx: Call vmw_driver_{load,
 unload}() before registering device
Date: Tue, 10 Dec 2019 13:43:22 +0100
Message-Id: <20191210124322.8857-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The load/unload callbacks in struct drm_driver are deprecated. Remove
them and call functions explicitly.

v2:
	* remove accidental whitespace fix

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 42 +++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 81a95651643f..01b266cfd267 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -28,10 +28,10 @@
 #include <linux/console.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_pci.h>
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_module.h>
@@ -1212,8 +1212,10 @@ static void vmw_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	drm_dev_unregister(dev);
+	vmw_driver_unload(dev);
+	drm_dev_put(dev);
 	pci_disable_device(pdev);
-	drm_put_dev(dev);
 }
 
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
@@ -1392,8 +1394,6 @@ static const struct file_operations vmwgfx_driver_fops = {
 static struct drm_driver driver = {
 	.driver_features =
 	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
-	.load = vmw_driver_load,
-	.unload = vmw_driver_unload,
 	.get_vblank_counter = vmw_get_vblank_counter,
 	.enable_vblank = vmw_enable_vblank,
 	.disable_vblank = vmw_disable_vblank,
@@ -1432,7 +1432,39 @@ static struct pci_driver vmw_pci_driver = {
 
 static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	return drm_get_pci_dev(pdev, ent, &driver);
+	struct drm_device *dev;
+	int ret;
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	dev = drm_dev_alloc(&driver, &pdev->dev);
+	if (IS_ERR(dev)) {
+		ret = PTR_ERR(dev);
+		goto err_pci_disable_device;
+	}
+
+	dev->pdev = pdev;
+	pci_set_drvdata(pdev, dev);
+
+	ret = vmw_driver_load(dev, ent->driver_data);
+	if (ret)
+		goto err_drm_dev_put;
+
+	ret = drm_dev_register(dev, ent->driver_data);
+	if (ret)
+		goto err_vmw_driver_unload;
+
+	return 0;
+
+err_vmw_driver_unload:
+	vmw_driver_unload(dev);
+err_drm_dev_put:
+	drm_dev_put(dev);
+err_pci_disable_device:
+	pci_disable_device(pdev);
+	return ret;
 }
 
 static int __init vmwgfx_init(void)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
