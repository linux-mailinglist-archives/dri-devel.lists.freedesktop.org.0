Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB351182BF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B752C6E865;
	Tue, 10 Dec 2019 08:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2316E860
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C0BBB0DA;
 Tue, 10 Dec 2019 08:49:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 6/9] drm/udl: Convert to drm_atomic_helper_dirtyfb()
Date: Tue, 10 Dec 2019 09:49:02 +0100
Message-Id: <20191210084905.5570-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210084905.5570-1-tzimmermann@suse.de>
References: <20191210084905.5570-1-tzimmermann@suse.de>
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
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The infrastruture for atomic modesetting allows us to use the generic
code for dirty-FB and damage handling. Switch over udl and remove the
driver's implementation. The simple-pipe's update function now picks up
the primary plane's damage and updates a minimal region of the screen.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.h     |  5 ---
 drivers/gpu/drm/udl/udl_fb.c      | 52 -------------------------------
 drivers/gpu/drm/udl/udl_modeset.c | 11 +++++--
 3 files changed, 8 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 89c0539c758e..1ade917cd8d7 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -83,11 +83,6 @@ void udl_urb_completion(struct urb *urb);
 int udl_init(struct udl_device *udl);
 void udl_fini(struct drm_device *dev);
 
-struct drm_framebuffer *
-udl_fb_user_fb_create(struct drm_device *dev,
-		      struct drm_file *file,
-		      const struct drm_mode_fb_cmd2 *mode_cmd);
-
 int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
 		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index 32a4551447b5..98cc2ab3a916 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -11,12 +11,8 @@
 #include <linux/moduleparam.h>
 #include <linux/dma-buf.h>
 
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
-#include <drm/drm_modeset_helper.h>
 
 #include "udl_drv.h"
 
@@ -172,51 +168,3 @@ int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 
 	return ret;
 }
-
-static int udl_user_framebuffer_dirty(struct drm_framebuffer *fb,
-				      struct drm_file *file,
-				      unsigned flags, unsigned color,
-				      struct drm_clip_rect *clips,
-				      unsigned num_clips)
-{
-	struct udl_device *udl = fb->dev->dev_private;
-	int i;
-	int ret = 0;
-
-	drm_modeset_lock_all(fb->dev);
-
-	spin_lock(&udl->active_fb_16_lock);
-	if (udl->active_fb_16 != fb) {
-		spin_unlock(&udl->active_fb_16_lock);
-		goto unlock;
-	}
-	spin_unlock(&udl->active_fb_16_lock);
-
-	for (i = 0; i < num_clips; i++) {
-		ret = udl_handle_damage(fb, clips[i].x1, clips[i].y1,
-					clips[i].x2 - clips[i].x1,
-					clips[i].y2 - clips[i].y1);
-		if (ret)
-			break;
-	}
-
- unlock:
-	drm_modeset_unlock_all(fb->dev);
-
-	return ret;
-}
-
-static const struct drm_framebuffer_funcs udlfb_funcs = {
-	.destroy	= drm_gem_fb_destroy,
-	.create_handle	= drm_gem_fb_create_handle,
-	.dirty		= udl_user_framebuffer_dirty,
-};
-
-struct drm_framebuffer *
-udl_fb_user_fb_create(struct drm_device *dev,
-		   struct drm_file *file,
-		   const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
-					    &udlfb_funcs);
-}
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 943e937837e1..75f239e92c89 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_vblank.h>
@@ -332,7 +333,9 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_device *dev = pipe->crtc.dev;
 	struct udl_device *udl = dev->dev_private;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_rect rect;
 
 	spin_lock(&udl->active_fb_16_lock);
 	udl->active_fb_16 = fb;
@@ -341,7 +344,9 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
-	udl_handle_damage(fb, 0, 0, fb->width, fb->height);
+	if (drm_atomic_helper_damage_merged(old_plane_state, state, &rect))
+		udl_handle_damage(fb, rect.x1, rect.y1, rect.x2 - rect.x1,
+				  rect.y2 - rect.y1);
 }
 
 static const
@@ -359,7 +364,7 @@ struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
  */
 
 static const struct drm_mode_config_funcs udl_mode_funcs = {
-	.fb_create = udl_fb_user_fb_create,
+	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check  = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
