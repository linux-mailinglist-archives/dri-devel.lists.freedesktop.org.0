Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C226B1EF9C8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E7A6E8FB;
	Fri,  5 Jun 2020 13:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BCB6E8F4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3FC8AD41;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 10/14] drm/mgag200: Move device init and cleanup to
 mgag200_drv.c
Date: Fri,  5 Jun 2020 15:57:59 +0200
Message-Id: <20200605135803.19811-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
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

Moving the initializer and cleanup functions for device instances
to mgag200_drv.c prepares for the conversion to managed code. No
functional changes are made. Remove mgag200_main.c, which is now
empty.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile       |  3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 68 +++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  4 --
 drivers/gpu/drm/mgag200/mgag200_main.c | 77 --------------------------
 4 files changed, 69 insertions(+), 83 deletions(-)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_main.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index e6a933874a88c..42fedef538826 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mgag200-y   := mgag200_drv.o mgag200_i2c.o mgag200_main.o mgag200_mm.o \
-	       mgag200_mode.o
+mgag200-y   := mgag200_drv.o mgag200_i2c.o mgag200_mm.o mgag200_mode.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ad74e02d8f251..f8bb24199643d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -39,6 +39,74 @@ static struct drm_driver mgag200_driver = {
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
+/*
+ * DRM device
+ */
+
+static int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
+{
+	struct mga_device *mdev;
+	int ret, option;
+
+	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
+	if (mdev == NULL)
+		return -ENOMEM;
+	dev->dev_private = (void *)mdev;
+	mdev->dev = dev;
+
+	mdev->flags = mgag200_flags_from_driver_data(flags);
+	mdev->type = mgag200_type_from_driver_data(flags);
+
+	pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
+	mdev->has_sdram = !(option & (1 << 14));
+
+	/* BAR 0 is the framebuffer, BAR 1 contains registers */
+	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
+	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
+
+	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
+				     mdev->rmmio_size, "mgadrmfb_mmio")) {
+		drm_err(dev, "can't reserve mmio registers\n");
+		return -ENOMEM;
+	}
+
+	mdev->rmmio = pcim_iomap(dev->pdev, 1, 0);
+	if (mdev->rmmio == NULL)
+		return -ENOMEM;
+
+	/* stash G200 SE model number for later use */
+	if (IS_G200_SE(mdev)) {
+		mdev->unique_rev_id = RREG32(0x1e24);
+		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
+			mdev->unique_rev_id);
+	}
+
+	ret = mgag200_mm_init(mdev);
+	if (ret)
+		goto err_mm;
+
+	ret = mgag200_modeset_init(mdev);
+	if (ret) {
+		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
+		goto err_mm;
+	}
+
+	return 0;
+
+err_mm:
+	dev->dev_private = NULL;
+	return ret;
+}
+
+static void mgag200_driver_unload(struct drm_device *dev)
+{
+	struct mga_device *mdev = to_mga_device(dev);
+
+	if (mdev == NULL)
+		return;
+	dev->dev_private = NULL;
+}
+
 /*
  * PCI driver
  */
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 7b6e6827a9a21..b38e5ce4ee20b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -188,10 +188,6 @@ mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
 				/* mgag200_mode.c */
 int mgag200_modeset_init(struct mga_device *mdev);
 
-				/* mgag200_main.c */
-int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
-void mgag200_driver_unload(struct drm_device *dev);
-
 				/* mgag200_i2c.c */
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
 void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
deleted file mode 100644
index 49bcdfcb40a4e..0000000000000
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright 2010 Matt Turner.
- * Copyright 2012 Red Hat
- *
- * Authors: Matthew Garrett
- *          Matt Turner
- *          Dave Airlie
- */
-
-#include <linux/pci.h>
-
-#include "mgag200_drv.h"
-
-int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
-{
-	struct mga_device *mdev;
-	int ret, option;
-
-	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
-	if (mdev == NULL)
-		return -ENOMEM;
-	dev->dev_private = (void *)mdev;
-	mdev->dev = dev;
-
-	mdev->flags = mgag200_flags_from_driver_data(flags);
-	mdev->type = mgag200_type_from_driver_data(flags);
-
-	pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
-	mdev->has_sdram = !(option & (1 << 14));
-
-	/* BAR 0 is the framebuffer, BAR 1 contains registers */
-	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
-	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
-
-	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
-				     mdev->rmmio_size, "mgadrmfb_mmio")) {
-		drm_err(dev, "can't reserve mmio registers\n");
-		return -ENOMEM;
-	}
-
-	mdev->rmmio = pcim_iomap(dev->pdev, 1, 0);
-	if (mdev->rmmio == NULL)
-		return -ENOMEM;
-
-	/* stash G200 SE model number for later use */
-	if (IS_G200_SE(mdev)) {
-		mdev->unique_rev_id = RREG32(0x1e24);
-		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
-			mdev->unique_rev_id);
-	}
-
-	ret = mgag200_mm_init(mdev);
-	if (ret)
-		goto err_mm;
-
-	ret = mgag200_modeset_init(mdev);
-	if (ret) {
-		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
-		goto err_mm;
-	}
-
-	return 0;
-
-err_mm:
-	dev->dev_private = NULL;
-	return ret;
-}
-
-void mgag200_driver_unload(struct drm_device *dev)
-{
-	struct mga_device *mdev = to_mga_device(dev);
-
-	if (mdev == NULL)
-		return;
-	dev->dev_private = NULL;
-}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
