Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA130DAAE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110E6EAAF;
	Wed,  3 Feb 2021 13:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B080D6EAB2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:10:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 492E5B133;
 Wed,  3 Feb 2021 13:10:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 6/6] drm/udl: Move vmap out of commit tail
Date: Wed,  3 Feb 2021 14:10:46 +0100
Message-Id: <20210203131046.22371-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203131046.22371-1-tzimmermann@suse.de>
References: <20210203131046.22371-1-tzimmermann@suse.de>
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

The mapping is provided as GEM SHMEM shadow plane. The enable and prepare
callbacks use the established mapping for damage handling.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/Kconfig       |  1 +
 drivers/gpu/drm/udl/udl_modeset.c | 36 +++++++++++++------------------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
index 1f497d8f1ae5..1b46d93ca61c 100644
--- a/drivers/gpu/drm/udl/Kconfig
+++ b/drivers/gpu/drm/udl/Kconfig
@@ -5,6 +5,7 @@ config DRM_UDL
 	depends on USB
 	depends on USB_ARCH_HAS_HCD
 	select DRM_GEM_SHMEM_HELPER
+	select DRM_GEM_SHMEM_KMS_HELPER
 	select DRM_KMS_HELPER
 	help
 	  This is a KMS driver for the USB displaylink video adapters.
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 9d34ec9d03f6..974dffe86a44 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -17,6 +17,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_shmem_kms_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_vblank.h>
 
@@ -266,18 +267,17 @@ static int udl_aligned_damage_clip(struct drm_rect *clip, int x, int y,
 	return 0;
 }
 
-static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
-			     int width, int height)
+static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+			     int x, int y, int width, int height)
 {
 	struct drm_device *dev = fb->dev;
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
+	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret, tmp_ret;
 	char *cmd;
 	struct urb *urb;
 	struct drm_rect clip;
 	int log_bpp;
-	struct dma_buf_map map;
-	void *vaddr;
 
 	ret = udl_log_cpp(fb->format->cpp[0]);
 	if (ret < 0)
@@ -297,17 +297,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 			return ret;
 	}
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
-	if (ret) {
-		DRM_ERROR("failed to vmap fb\n");
-		goto out_dma_buf_end_cpu_access;
-	}
-	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
-
 	urb = udl_get_urb(dev);
 	if (!urb) {
 		ret = -ENOMEM;
-		goto out_drm_gem_shmem_vunmap;
+		goto out_dma_buf_end_cpu_access;
 	}
 	cmd = urb->transfer_buffer;
 
@@ -320,7 +313,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
-			goto out_drm_gem_shmem_vunmap;
+			goto out_dma_buf_end_cpu_access;
 	}
 
 	if (cmd > (char *)urb->transfer_buffer) {
@@ -336,8 +329,6 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 
 	ret = 0;
 
-out_drm_gem_shmem_vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 out_dma_buf_end_cpu_access:
 	if (import_attach) {
 		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
@@ -375,6 +366,8 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct udl_device *udl = to_udl(dev);
 	struct drm_display_mode *mode = &crtc_state->mode;
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(plane_state);
 	char *buf;
 	char *wrptr;
 	int color_depth = UDL_COLOR_DEPTH_16BPP;
@@ -400,7 +393,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	udl->mode_buf_len = wrptr - buf;
 
-	udl_handle_damage(fb, 0, 0, fb->width, fb->height);
+	udl_handle_damage(fb, &shadow_plane_state->map[0], 0, 0, fb->width, fb->height);
 
 	if (!crtc_state->mode_changed)
 		return;
@@ -435,6 +428,8 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
 
@@ -442,17 +437,16 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, state, &rect))
-		udl_handle_damage(fb, rect.x1, rect.y1, rect.x2 - rect.x1,
-				  rect.y2 - rect.y1);
+		udl_handle_damage(fb, &shadow_plane_state->map[0], rect.x1, rect.y1,
+				  rect.x2 - rect.x1, rect.y2 - rect.y1);
 }
 
-static const
-struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
+static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
 	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
 	.update = udl_simple_display_pipe_update,
-	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+	DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 /*
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
