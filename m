Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E01C523F
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 11:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F016E198;
	Tue,  5 May 2020 09:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408976E15A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 09:56:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FF59B031;
 Tue,  5 May 2020 09:56:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, cogarre@gmail.com
Subject: [PATCH 4/5] drm/mgag200: Init and finalize devices in
 mgag200_device_{init, fini}()
Date: Tue,  5 May 2020 11:56:48 +0200
Message-Id: <20200505095649.25814-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200505095649.25814-1-tzimmermann@suse.de>
References: <20200505095649.25814-1-tzimmermann@suse.de>
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

Device initialization is now done in mgag200_device_init(). Specifically,
the function allocates the DRM device and sets up the respective fields
in struct mga_device.

A call to mgag200_device_fini() finalizes struct mga_device.

The old function mgag200_driver_load() and mgag200_driver_unload() were
left over from the DRM driver's load callbacks and have now been removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 27 ++++++++++----------
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_main.c | 34 ++++++++++++++++----------
 3 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index c2f0e4b40b052..ad12c1b7c66cc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -51,6 +51,7 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct mga_device *mdev;
 	struct drm_device *dev;
 	int ret;
 
@@ -60,31 +61,28 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&driver, &pdev->dev);
-	if (IS_ERR(dev)) {
-		ret = PTR_ERR(dev);
+	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
+	if (!mdev) {
+		ret = -ENOMEM;
 		goto err_pci_disable_device;
 	}
 
-	dev->pdev = pdev;
-	pci_set_drvdata(pdev, dev);
-
-	ret = mgag200_driver_load(dev, ent->driver_data);
+	ret = mgag200_device_init(mdev, &driver, pdev, ent->driver_data);
 	if (ret)
-		goto err_drm_dev_put;
+		goto err_pci_disable_device;
+
+	dev = mdev->dev;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_mgag200_driver_unload;
+		goto err_mgag200_device_fini;
 
 	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
-err_mgag200_driver_unload:
-	mgag200_driver_unload(dev);
-err_drm_dev_put:
-	drm_dev_put(dev);
+err_mgag200_device_fini:
+	mgag200_device_fini(mdev);
 err_pci_disable_device:
 	pci_disable_device(pdev);
 	return ret;
@@ -93,9 +91,10 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 static void mga_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct mga_device *mdev = to_mga_device(dev);
 
 	drm_dev_unregister(dev);
-	mgag200_driver_unload(dev);
+	mgag200_device_fini(mdev);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 632bbb50465c9..1ce0386669ffa 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -200,8 +200,9 @@ int mgag200_modeset_init(struct mga_device *mdev);
 void mgag200_modeset_fini(struct mga_device *mdev);
 
 				/* mgag200_main.c */
-int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
-void mgag200_driver_unload(struct drm_device *dev);
+int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
+			struct pci_dev *pdev, unsigned long flags);
+void mgag200_device_fini(struct mga_device *mdev);
 
 				/* mgag200_i2c.c */
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 010b309c01fc4..070ff1f433df2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -11,6 +11,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
 #include "mgag200_drv.h"
@@ -96,17 +97,21 @@ static int mga_vram_init(struct mga_device *mdev)
  */
 
 
-int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
+int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
+			struct pci_dev *pdev, unsigned long flags)
 {
-	struct mga_device *mdev;
+	struct drm_device *dev = mdev->dev;
 	int ret, option;
 
-	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
-	if (mdev == NULL)
-		return -ENOMEM;
+	dev = drm_dev_alloc(drv, &pdev->dev);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
 	dev->dev_private = (void *)mdev;
 	mdev->dev = dev;
 
+	dev->pdev = pdev;
+	pci_set_drvdata(pdev, dev);
+
 	mdev->flags = mgag200_flags_from_driver_data(flags);
 	mdev->type = mgag200_type_from_driver_data(flags);
 
@@ -123,12 +128,15 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
 				     mdev->rmmio_size, "mgadrmfb_mmio")) {
 		drm_err(dev, "can't reserve mmio registers\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_drm_dev_put;
 	}
 
 	mdev->rmmio = pcim_iomap(dev->pdev, 1, 0);
-	if (mdev->rmmio == NULL)
-		return -ENOMEM;
+	if (mdev->rmmio == NULL) {
+		ret = -ENOMEM;
+		goto err_drm_dev_put;
+	}
 
 	/* stash G200 SE model number for later use */
 	if (IS_G200_SE(mdev)) {
@@ -139,7 +147,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 	ret = mga_vram_init(mdev);
 	if (ret)
-		return ret;
+		goto err_drm_dev_put;
 
 	mdev->bpp_shifts[0] = 0;
 	mdev->bpp_shifts[1] = 1;
@@ -174,17 +182,17 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	drm_mode_config_cleanup(dev);
 	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
+err_drm_dev_put:
+	drm_dev_put(dev);
 err_mm:
 	dev->dev_private = NULL;
 	return ret;
 }
 
-void mgag200_driver_unload(struct drm_device *dev)
+void mgag200_device_fini(struct mga_device *mdev)
 {
-	struct mga_device *mdev = to_mga_device(dev);
+	struct drm_device *dev = mdev->dev;
 
-	if (mdev == NULL)
-		return;
 	mgag200_modeset_fini(mdev);
 	drm_mode_config_cleanup(dev);
 	mgag200_cursor_fini(mdev);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
