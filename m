Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C9130DAAD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0896EAB5;
	Wed,  3 Feb 2021 13:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48C46EAAB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:10:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B402B12C;
 Wed,  3 Feb 2021 13:10:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 3/6] drm/mgag200: Move vmap out of commit tail
Date: Wed,  3 Feb 2021 14:10:43 +0100
Message-Id: <20210203131046.22371-4-tzimmermann@suse.de>
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
 drivers/gpu/drm/mgag200/Kconfig        |  1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 25 ++++++++++---------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index eec59658a938..b4e5a1eb57ce 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -3,6 +3,7 @@ config DRM_MGAG200
 	tristate "Matrox G200"
 	depends on DRM && PCI && MMU
 	select DRM_GEM_SHMEM_HELPER
+	select DRM_GEM_SHMEM_KMS_HELPER
 	select DRM_KMS_HELPER
 	help
 	 This is a KMS driver for Matrox G200 chips. It supports the original
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1dfc42170059..70040a02ee98 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -18,6 +18,7 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_kms_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1549,22 +1550,12 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 
 static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
-		      struct drm_rect *clip)
+		      struct drm_rect *clip, const struct dma_buf_map *map)
 {
-	struct drm_device *dev = &mdev->base;
-	struct dma_buf_map map;
-	void *vmap;
-	int ret;
-
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
-	if (drm_WARN_ON(dev, ret))
-		return; /* BUG: SHMEM BO should always be vmapped */
-	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 
 	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
-
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
@@ -1580,6 +1571,8 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(plane_state);
 	struct drm_rect fullscreen = {
 		.x1 = 0,
 		.x2 = fb->width,
@@ -1608,7 +1601,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	mga_crtc_load_lut(crtc);
 	mgag200_enable_display(mdev);
 
-	mgag200_handle_damage(mdev, fb, &fullscreen);
+	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->map[0]);
 }
 
 static void
@@ -1649,6 +1642,8 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_plane_state *state = plane->state;
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect damage;
 
@@ -1656,7 +1651,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
-		mgag200_handle_damage(mdev, fb, &damage);
+		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->map[0]);
 }
 
 static const struct drm_simple_display_pipe_funcs
@@ -1666,7 +1661,7 @@ mgag200_simple_display_pipe_funcs = {
 	.disable    = mgag200_simple_display_pipe_disable,
 	.check	    = mgag200_simple_display_pipe_check,
 	.update	    = mgag200_simple_display_pipe_update,
-	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+	DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 static const uint32_t mgag200_simple_display_pipe_formats[] = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
