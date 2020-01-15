Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF813BEE2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C996E933;
	Wed, 15 Jan 2020 11:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECC26E932
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 28EEA3F553;
 Wed, 15 Jan 2020 12:53:48 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=aR94uhrq; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk6h9AG5gzEI; Wed, 15 Jan 2020 12:53:47 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id F369B3F545;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6BA4D360330;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=dJtOHF3IJGqAfPvtLeBicr2rhDY3mp1MwXbxhY01WZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aR94uhrqAr3dRoC3gdEo/rI/ZnAD/qq4Kg1DypOWbG6ToEC+LIZ1bB+bR8BHNZfAM
 D333UvkPqhdfa8y+k7ct3xSEoFL+vRoj+sVsQkzxeUqBRGlz/uKHrx0yvTzCHChIxI
 d+xU337mglqm9YXXgZ62pl1NxkEEB/sBSEFTs7m0=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/vmwgfx: Call vmw_driver_{load,
 unload}() before registering device
Date: Wed, 15 Jan 2020 12:53:22 +0100
Message-Id: <20200115115329.2836-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115115329.2836-1-thomas_os@shipmail.org>
References: <20200115115329.2836-1-thomas_os@shipmail.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

The load/unload callbacks in struct drm_driver are deprecated. Remove
them and call functions explicitly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 42 +++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index e962048f65d2..dc3d04f00683 100644
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
@@ -1211,8 +1211,10 @@ static void vmw_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	drm_dev_unregister(dev);
+	vmw_driver_unload(dev);
+	drm_dev_put(dev);
 	pci_disable_device(pdev);
-	drm_put_dev(dev);
 }
 
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
@@ -1391,8 +1393,6 @@ static const struct file_operations vmwgfx_driver_fops = {
 static struct drm_driver driver = {
 	.driver_features =
 	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
-	.load = vmw_driver_load,
-	.unload = vmw_driver_unload,
 	.get_vblank_counter = vmw_get_vblank_counter,
 	.enable_vblank = vmw_enable_vblank,
 	.disable_vblank = vmw_disable_vblank,
@@ -1431,7 +1431,39 @@ static struct pci_driver vmw_pci_driver = {
 
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
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
