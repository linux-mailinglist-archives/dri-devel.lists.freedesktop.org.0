Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7730FD9F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741246E0CB;
	Thu,  4 Feb 2021 20:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669376EE5D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 20:03:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1C3FAE03;
 Thu,  4 Feb 2021 20:03:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 4/6] drm/cirrus: Move vmap out of commit tail
Date: Thu,  4 Feb 2021 21:03:06 +0100
Message-Id: <20210204200308.24216-5-tzimmermann@suse.de>
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
 drivers/gpu/drm/tiny/cirrus.c | 43 ++++++++++++++---------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index a043e602199e..ad922c3ec681 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -33,8 +33,9 @@
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
@@ -311,22 +312,15 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	return 0;
 }
 
-static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
+static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
-	struct dma_buf_map map;
-	void *vmap;
-	int idx, ret;
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	int idx;
 
-	ret = -ENODEV;
 	if (!drm_dev_enter(&cirrus->dev, &idx))
-		goto out;
-
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
-	if (ret)
-		goto out_dev_exit;
-	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
+		return -ENODEV;
 
 	if (cirrus->cpp == fb->format->cpp[0])
 		drm_fb_memcpy_dstclip(cirrus->vram,
@@ -345,16 +339,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
-	ret = 0;
-
-out_dev_exit:
 	drm_dev_exit(idx);
-out:
-	return ret;
+
+	return 0;
 }
 
-static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb)
+static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb, const struct dma_buf_map *map)
 {
 	struct drm_rect fullscreen = {
 		.x1 = 0,
@@ -362,7 +352,7 @@ static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb)
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	return cirrus_fb_blit_rect(fb, &fullscreen);
+	return cirrus_fb_blit_rect(fb, map, &fullscreen);
 }
 
 static int cirrus_check_size(int width, int height,
@@ -441,9 +431,10 @@ static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *plane_state)
 {
 	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
-	cirrus_fb_blit_fullscreen(plane_state->fb);
+	cirrus_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->map[0]);
 }
 
 static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -451,16 +442,15 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 {
 	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
-	if (pipe->plane.state->fb &&
-	    cirrus->cpp != cirrus_cpp(pipe->plane.state->fb))
-		cirrus_mode_set(cirrus, &crtc->mode,
-				pipe->plane.state->fb);
+	if (state->fb && cirrus->cpp != cirrus_cpp(state->fb))
+		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		cirrus_fb_blit_rect(pipe->plane.state->fb, &rect);
+		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->map[0], &rect);
 }
 
 static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
@@ -468,6 +458,7 @@ static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
 	.check	    = cirrus_pipe_check,
 	.enable	    = cirrus_pipe_enable,
 	.update	    = cirrus_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 static const uint32_t cirrus_formats[] = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
