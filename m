Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8722131263
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 13:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B478F894E0;
	Mon,  6 Jan 2020 12:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39174882A9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:58:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E96B4AF36;
 Mon,  6 Jan 2020 12:57:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 2/8] drm/hisilicon/hibmc: Replace struct hibmc_framebuffer
 with generic code
Date: Mon,  6 Jan 2020 13:57:39 +0100
Message-Id: <20200106125745.13797-3-tzimmermann@suse.de>
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

The hibmc driver's struct hibmc_framebuffer stores a DRM framebuffer
with an associated GEM object. This functionality is also provided by
generic code. Switch hibmc over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   | 11 ---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 69 +------------------
 3 files changed, 3 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 6527a97f68a3..7fa7d4933f60 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -99,14 +99,12 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	s64 gpu_addr = 0;
 	unsigned int line_l;
 	struct hibmc_drm_private *priv = plane->dev->dev_private;
-	struct hibmc_framebuffer *hibmc_fb;
 	struct drm_gem_vram_object *gbo;
 
 	if (!state->fb)
 		return;
 
-	hibmc_fb = to_hibmc_framebuffer(state->fb);
-	gbo = drm_gem_vram_of_gem(hibmc_fb->obj);
+	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
 
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (WARN_ON_ONCE(gpu_addr < 0))
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index b34493ead30b..8eb7258b236a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -20,11 +20,6 @@
 struct drm_device;
 struct drm_gem_object;
 
-struct hibmc_framebuffer {
-	struct drm_framebuffer fb;
-	struct drm_gem_object *obj;
-};
-
 struct hibmc_drm_private {
 	/* hw */
 	void __iomem   *mmio;
@@ -38,8 +33,6 @@ struct hibmc_drm_private {
 	bool mode_config_initialized;
 };
 
-#define to_hibmc_framebuffer(x) container_of(x, struct hibmc_framebuffer, fb)
-
 void hibmc_set_power_mode(struct hibmc_drm_private *priv,
 			  unsigned int power_mode);
 void hibmc_set_current_gate(struct hibmc_drm_private *priv,
@@ -50,10 +43,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
 int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
 		     struct drm_gem_object **obj);
-struct hibmc_framebuffer *
-hibmc_framebuffer_init(struct drm_device *dev,
-		       const struct drm_mode_fb_cmd2 *mode_cmd,
-		       struct drm_gem_object *obj);
 
 int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 21b684eab5c9..f6d25b85c209 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_print.h>
 
@@ -97,74 +98,8 @@ int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 	return 0;
 }
 
-static void hibmc_user_framebuffer_destroy(struct drm_framebuffer *fb)
-{
-	struct hibmc_framebuffer *hibmc_fb = to_hibmc_framebuffer(fb);
-
-	drm_gem_object_put_unlocked(hibmc_fb->obj);
-	drm_framebuffer_cleanup(fb);
-	kfree(hibmc_fb);
-}
-
-static const struct drm_framebuffer_funcs hibmc_fb_funcs = {
-	.destroy = hibmc_user_framebuffer_destroy,
-};
-
-struct hibmc_framebuffer *
-hibmc_framebuffer_init(struct drm_device *dev,
-		       const struct drm_mode_fb_cmd2 *mode_cmd,
-		       struct drm_gem_object *obj)
-{
-	struct hibmc_framebuffer *hibmc_fb;
-	int ret;
-
-	hibmc_fb = kzalloc(sizeof(*hibmc_fb), GFP_KERNEL);
-	if (!hibmc_fb) {
-		DRM_ERROR("failed to allocate hibmc_fb\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	drm_helper_mode_fill_fb_struct(dev, &hibmc_fb->fb, mode_cmd);
-	hibmc_fb->obj = obj;
-	ret = drm_framebuffer_init(dev, &hibmc_fb->fb, &hibmc_fb_funcs);
-	if (ret) {
-		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
-		kfree(hibmc_fb);
-		return ERR_PTR(ret);
-	}
-
-	return hibmc_fb;
-}
-
-static struct drm_framebuffer *
-hibmc_user_framebuffer_create(struct drm_device *dev,
-			      struct drm_file *filp,
-			      const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct drm_gem_object *obj;
-	struct hibmc_framebuffer *hibmc_fb;
-
-	DRM_DEBUG_DRIVER("%dx%d, format %c%c%c%c\n",
-			 mode_cmd->width, mode_cmd->height,
-			 (mode_cmd->pixel_format) & 0xff,
-			 (mode_cmd->pixel_format >> 8)  & 0xff,
-			 (mode_cmd->pixel_format >> 16) & 0xff,
-			 (mode_cmd->pixel_format >> 24) & 0xff);
-
-	obj = drm_gem_object_lookup(filp, mode_cmd->handles[0]);
-	if (!obj)
-		return ERR_PTR(-ENOENT);
-
-	hibmc_fb = hibmc_framebuffer_init(dev, mode_cmd, obj);
-	if (IS_ERR(hibmc_fb)) {
-		drm_gem_object_put_unlocked(obj);
-		return ERR_PTR((long)hibmc_fb);
-	}
-	return &hibmc_fb->fb;
-}
-
 const struct drm_mode_config_funcs hibmc_mode_funcs = {
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
-	.fb_create = hibmc_user_framebuffer_create,
+	.fb_create = drm_gem_fb_create,
 };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
