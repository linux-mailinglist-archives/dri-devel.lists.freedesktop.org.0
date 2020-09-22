Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195BC2744D6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73D16E89F;
	Tue, 22 Sep 2020 14:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7886E89C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:57:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85926ACC2;
 Tue, 22 Sep 2020 14:57:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 1/3] drm/vram-helper: Integrate drm_gem_vram_init() into
 drm_gem_vram_create()
Date: Tue, 22 Sep 2020 16:56:58 +0200
Message-Id: <20200922145700.25413-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922145700.25413-1-tzimmermann@suse.de>
References: <20200922145700.25413-1-tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_vram_create() function is the only caller of the internal
helper drm_gem_vram_init(). Streamline the code by putting all code into
the create function.

v2:
	* rebased onto latest drm-tip
	* fixed typo in commit message (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 77 ++++++++++-----------------
 1 file changed, 29 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 375c79e23ca5..9fa7f0ec9308 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -167,52 +167,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	}
 }
 
-/*
- * Note that on error, drm_gem_vram_init will free the buffer object.
- */
-
-static int drm_gem_vram_init(struct drm_device *dev,
-			     struct drm_gem_vram_object *gbo,
-			     size_t size, unsigned long pg_align)
-{
-	struct drm_vram_mm *vmm = dev->vram_mm;
-	struct ttm_bo_device *bdev;
-	int ret;
-	size_t acc_size;
-
-	if (WARN_ONCE(!vmm, "VRAM MM not initialized")) {
-		kfree(gbo);
-		return -EINVAL;
-	}
-	bdev = &vmm->bdev;
-
-	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
-
-	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
-	if (ret) {
-		kfree(gbo);
-		return ret;
-	}
-
-	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
-
-	gbo->bo.bdev = bdev;
-	drm_gem_vram_placement(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-			       DRM_GEM_VRAM_PL_FLAG_SYSTEM);
-
-	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, false, acc_size,
-			  NULL, NULL, ttm_buffer_object_destroy);
-	if (ret)
-		/*
-		 * A failing ttm_bo_init will call ttm_buffer_object_destroy
-		 * to release gbo->bo.base and kfree gbo.
-		 */
-		return ret;
-
-	return 0;
-}
-
 /**
  * drm_gem_vram_create() - Creates a VRAM-backed GEM object
  * @dev:		the DRM device
@@ -228,7 +182,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						unsigned long pg_align)
 {
 	struct drm_gem_vram_object *gbo;
+	struct drm_vram_mm *vmm = dev->vram_mm;
+	struct ttm_bo_device *bdev;
 	int ret;
+	size_t acc_size;
+
+	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
+		return ERR_PTR(-EINVAL);
 
 	if (dev->driver->gem_create_object) {
 		struct drm_gem_object *gem =
@@ -242,8 +202,29 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 			return ERR_PTR(-ENOMEM);
 	}
 
-	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
-	if (ret < 0)
+	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
+
+	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
+	if (ret) {
+		kfree(gbo);
+		return ERR_PTR(ret);
+	}
+
+	bdev = &vmm->bdev;
+	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
+
+	gbo->bo.bdev = bdev;
+	drm_gem_vram_placement(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+			       DRM_GEM_VRAM_PL_FLAG_SYSTEM);
+
+	/*
+	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
+	 * to release gbo->bo.base and kfree gbo.
+	 */
+	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
+			  &gbo->placement, pg_align, false, acc_size,
+			  NULL, NULL, ttm_buffer_object_destroy);
+	if (ret)
 		return ERR_PTR(ret);
 
 	return gbo;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
