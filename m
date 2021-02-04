Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201830FDA0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AF86EE61;
	Thu,  4 Feb 2021 20:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214D6EE5D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 20:03:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBAD4AE14;
 Thu,  4 Feb 2021 20:03:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 5/6] drm/gm12u320: Move vmap out of commit tail
Date: Thu,  4 Feb 2021 21:03:07 +0100
Message-Id: <20210204200308.24216-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204200308.24216-1-tzimmermann@suse.de>
References: <20210204200308.24216-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmap operations may acquire the dmabuf reservation lock, which is not
allowed within atomic commit-tail functions. Therefore move vmap and
vunmap from the damage handler into prepare_fb and cleanup_fb callbacks.

The mapping is provided as GEM shadow-buffered plane. The functions in
the commit tail use the pre-established mapping for damage handling.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/gm12u320.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 33f65f4626e5..0b4f4f2af1ef 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -16,8 +16,9 @@
 #include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -94,6 +95,7 @@ struct gm12u320_device {
 		struct drm_rect          rect;
 		int frame;
 		int draw_status_timeout;
+		struct dma_buf_map src_map;
 	} fb_update;
 };
 
@@ -250,7 +252,6 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 {
 	int block, dst_offset, len, remain, ret, x1, x2, y1, y2;
 	struct drm_framebuffer *fb;
-	struct dma_buf_map map;
 	void *vaddr;
 	u8 *src;
 
@@ -264,20 +265,14 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	x2 = gm12u320->fb_update.rect.x2;
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
-
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
-	if (ret) {
-		GM12U320_ERR("failed to vmap fb: %d\n", ret);
-		goto put_fb;
-	}
-	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
+	vaddr = gm12u320->fb_update.src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (fb->obj[0]->import_attach) {
 		ret = dma_buf_begin_cpu_access(
 			fb->obj[0]->import_attach->dmabuf, DMA_FROM_DEVICE);
 		if (ret) {
 			GM12U320_ERR("dma_buf_begin_cpu_access err: %d\n", ret);
-			goto vunmap;
+			goto put_fb;
 		}
 	}
 
@@ -321,8 +316,6 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		if (ret)
 			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
 	}
-vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
@@ -410,7 +403,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 		GM12U320_ERR("Frame update error: %d\n", ret);
 }
 
-static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
+static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb, const struct dma_buf_map *map,
 				   struct drm_rect *dirty)
 {
 	struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
@@ -424,6 +417,7 @@ static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
 		drm_framebuffer_get(fb);
 		gm12u320->fb_update.fb = fb;
 		gm12u320->fb_update.rect = *dirty;
+		gm12u320->fb_update.src_map = *map;
 		wakeup = true;
 	} else {
 		struct drm_rect *rect = &gm12u320->fb_update.rect;
@@ -452,6 +446,7 @@ static void gm12u320_stop_fb_update(struct gm12u320_device *gm12u320)
 	mutex_lock(&gm12u320->fb_update.lock);
 	old_fb = gm12u320->fb_update.fb;
 	gm12u320->fb_update.fb = NULL;
+	dma_buf_map_clear(&gm12u320->fb_update.src_map);
 	mutex_unlock(&gm12u320->fb_update.lock);
 
 	drm_framebuffer_put(old_fb);
@@ -564,9 +559,10 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
 	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
-	gm12u320_fb_mark_dirty(plane_state->fb, &rect);
+	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->map[0], &rect);
 }
 
 static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
@@ -580,16 +576,18 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		gm12u320_fb_mark_dirty(pipe->plane.state->fb, &rect);
+		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->map[0], &rect);
 }
 
 static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
 	.enable	    = gm12u320_pipe_enable,
 	.disable    = gm12u320_pipe_disable,
 	.update	    = gm12u320_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 static const uint32_t gm12u320_pipe_formats[] = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
