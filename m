Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196301EF9BE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6628B6E8F1;
	Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696286E8F1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DE09ACF9;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 07/14] drm/mgag200: Switch to managed MM
Date: Fri,  5 Jun 2020 15:57:56 +0200
Message-Id: <20200605135803.19811-8-tzimmermann@suse.de>
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

The memory-management code now cleans up automatically as part of
device destruction.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
 drivers/gpu/drm/mgag200/mgag200_main.c |  5 +----
 drivers/gpu/drm/mgag200/mgag200_mm.c   | 28 ++++++++++++++------------
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index cd786ffe319b8..7b6e6827a9a21 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -198,6 +198,5 @@ void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
 
 				/* mgag200_mm.c */
 int mgag200_mm_init(struct mga_device *mdev);
-void mgag200_mm_fini(struct mga_device *mdev);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index e9ad783c2b44d..49bcdfcb40a4e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -57,13 +57,11 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	ret = mgag200_modeset_init(mdev);
 	if (ret) {
 		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
-		goto err_mgag200_mm_fini;
+		goto err_mm;
 	}
 
 	return 0;
 
-err_mgag200_mm_fini:
-	mgag200_mm_fini(mdev);
 err_mm:
 	dev->dev_private = NULL;
 	return ret;
@@ -75,6 +73,5 @@ void mgag200_driver_unload(struct drm_device *dev)
 
 	if (mdev == NULL)
 		return;
-	mgag200_mm_fini(mdev);
 	dev->dev_private = NULL;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index f56b0456994f4..1b1e5ec5d1ceb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -28,6 +28,8 @@
 
 #include <linux/pci.h>
 
+#include <drm/drm_managed.h>
+
 #include "mgag200_drv.h"
 
 static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
@@ -73,6 +75,18 @@ static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
 	return offset - 65536;
 }
 
+static void mgag200_mm_release(struct drm_device *dev, void *ptr)
+{
+	struct mga_device *mdev = to_mga_device(dev);
+
+	mdev->vram_fb_available = 0;
+	iounmap(mdev->vram);
+	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
+				pci_resource_len(dev->pdev, 0));
+	arch_phys_wc_del(mdev->fb_mtrr);
+	mdev->fb_mtrr = 0;
+}
+
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
@@ -104,22 +118,10 @@ int mgag200_mm_init(struct mga_device *mdev)
 
 	mdev->vram_fb_available = mdev->mc.vram_size;
 
-	return 0;
+	return drmm_add_action_or_reset(dev, mgag200_mm_release, NULL);
 
 err_arch_phys_wc_del:
 	arch_phys_wc_del(mdev->fb_mtrr);
 	arch_io_free_memtype_wc(start, len);
 	return ret;
 }
-
-void mgag200_mm_fini(struct mga_device *mdev)
-{
-	struct drm_device *dev = mdev->dev;
-
-	mdev->vram_fb_available = 0;
-	iounmap(mdev->vram);
-	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-				pci_resource_len(dev->pdev, 0));
-	arch_phys_wc_del(mdev->fb_mtrr);
-	mdev->fb_mtrr = 0;
-}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
