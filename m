Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E551C854D
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2286E95A;
	Thu,  7 May 2020 09:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEF76E0D3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 270A4AE0F;
 Thu,  7 May 2020 09:03:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 3/6] drm/mgag200: Integrate init function into load function
Date: Thu,  7 May 2020 11:03:12 +0200
Message-Id: <20200507090315.21274-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200507090315.21274-1-tzimmermann@suse.de>
References: <20200507090315.21274-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Done to simplify initialization code before embedding the DRM device
instance in struct mga_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_main.c | 59 +++++++++-----------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 51919b5c1d97f..186197b8ffd35 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -90,12 +90,17 @@ static int mga_vram_init(struct mga_device *mdev)
 	return 0;
 }
 
-static int mgag200_device_init(struct drm_device *dev,
-			       uint32_t flags)
+int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 {
-	struct mga_device *mdev = to_mga_device(dev);
+	struct mga_device *mdev;
 	int ret, option;
 
+	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
+	if (mdev == NULL)
+		return -ENOMEM;
+	dev->dev_private = (void *)mdev;
+	mdev->dev = dev;
+
 	mdev->flags = mgag200_flags_from_driver_data(flags);
 	mdev->type = mgag200_type_from_driver_data(flags);
 
@@ -122,8 +127,8 @@ static int mgag200_device_init(struct drm_device *dev,
 	/* stash G200 SE model number for later use */
 	if (IS_G200_SE(mdev)) {
 		mdev->unique_rev_id = RREG32(0x1e24);
-		DRM_DEBUG("G200 SE unique revision id is 0x%x\n",
-			  mdev->unique_rev_id);
+		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
+			mdev->unique_rev_id);
 	}
 
 	ret = mga_vram_init(mdev);
@@ -134,33 +139,9 @@ static int mgag200_device_init(struct drm_device *dev,
 	mdev->bpp_shifts[1] = 1;
 	mdev->bpp_shifts[2] = 0;
 	mdev->bpp_shifts[3] = 2;
-	return 0;
-}
-
-/*
- * Functions here will be called by the core once it's bound the driver to
- * a PCI device
- */
-
 
-int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
-{
-	struct mga_device *mdev;
-	int r;
-
-	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
-	if (mdev == NULL)
-		return -ENOMEM;
-	dev->dev_private = (void *)mdev;
-	mdev->dev = dev;
-
-	r = mgag200_device_init(dev, flags);
-	if (r) {
-		dev_err(&dev->pdev->dev, "Fatal error during GPU init: %d\n", r);
-		return r;
-	}
-	r = mgag200_mm_init(mdev);
-	if (r)
+	ret = mgag200_mm_init(mdev);
+	if (ret)
 		goto err_mm;
 
 	drm_mode_config_init(dev);
@@ -171,16 +152,15 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 		dev->mode_config.preferred_depth = 32;
 	dev->mode_config.prefer_shadow = 1;
 
-	r = mgag200_modeset_init(mdev);
-	if (r) {
-		dev_err(&dev->pdev->dev, "Fatal error during modeset init: %d\n", r);
+	ret = mgag200_modeset_init(mdev);
+	if (ret) {
+		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
 		goto err_modeset;
 	}
 
-	r = mgag200_cursor_init(mdev);
-	if (r)
-		dev_warn(&dev->pdev->dev,
-			"Could not initialize cursors. Not doing hardware cursors.\n");
+	ret = mgag200_cursor_init(mdev);
+	if (ret)
+		drm_err(dev, "Could not initialize cursors. Not doing hardware cursors.\n");
 
 	return 0;
 
@@ -190,8 +170,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	mgag200_mm_fini(mdev);
 err_mm:
 	dev->dev_private = NULL;
-
-	return r;
+	return ret;
 }
 
 void mgag200_driver_unload(struct drm_device *dev)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
