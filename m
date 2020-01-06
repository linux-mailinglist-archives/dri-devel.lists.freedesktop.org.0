Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3C131266
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 13:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560796E29A;
	Mon,  6 Jan 2020 12:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048E6894FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:58:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADE1AAFE0;
 Mon,  6 Jan 2020 12:58:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 4/8] drm/hisilicon/hibmc: Implement hibmc_dumb_create()
 with generic helpers
Date: Mon,  6 Jan 2020 13:57:41 +0100
Message-Id: <20200106125745.13797-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106125745.13797-1-tzimmermann@suse.de>
References: <20200106125745.13797-1-tzimmermann@suse.de>
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

The hibmc driver aligns scanlines to 16 bytes. By using the new pitch_align
argument of drm_gem_vram_fill_create_dumb(), convert hibmc over.

v2:
	* move changes to VRAM helpers into separate patch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  4 --
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 48 +------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 8eb7258b236a..50a0c1f9d211 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -18,7 +18,6 @@
 #include <drm/drm_framebuffer.h>
 
 struct drm_device;
-struct drm_gem_object;
 
 struct hibmc_drm_private {
 	/* hw */
@@ -41,9 +40,6 @@ void hibmc_set_current_gate(struct hibmc_drm_private *priv,
 int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
-int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
-		     struct drm_gem_object **obj);
-
 int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index f6d25b85c209..0af5d966a480 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -47,55 +47,11 @@ void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
 	drm_vram_helper_release_mm(hibmc->dev);
 }
 
-int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
-		     struct drm_gem_object **obj)
-{
-	struct drm_gem_vram_object *gbo;
-	int ret;
-
-	*obj = NULL;
-
-	size = roundup(size, PAGE_SIZE);
-	if (size == 0)
-		return -EINVAL;
-
-	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
-	if (IS_ERR(gbo)) {
-		ret = PTR_ERR(gbo);
-		if (ret != -ERESTARTSYS)
-			DRM_ERROR("failed to allocate GEM object: %d\n", ret);
-		return ret;
-	}
-	*obj = &gbo->bo.base;
-	return 0;
-}
-
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 		      struct drm_mode_create_dumb *args)
 {
-	struct drm_gem_object *gobj;
-	u32 handle;
-	int ret;
-
-	args->pitch = ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 16);
-	args->size = args->pitch * args->height;
-
-	ret = hibmc_gem_create(dev, args->size, false,
-			       &gobj);
-	if (ret) {
-		DRM_ERROR("failed to create GEM object: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_gem_handle_create(file, gobj, &handle);
-	drm_gem_object_put_unlocked(gobj);
-	if (ret) {
-		DRM_ERROR("failed to unreference GEM object: %d\n", ret);
-		return ret;
-	}
-
-	args->handle = handle;
-	return 0;
+	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
+					     0, 16, false, args);
 }
 
 const struct drm_mode_config_funcs hibmc_mode_funcs = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
