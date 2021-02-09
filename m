Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D1314EB4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589F76E047;
	Tue,  9 Feb 2021 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B9E6E971
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:10:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F5D1AF49;
 Tue,  9 Feb 2021 12:10:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 2/2] drm/vboxvideo: Implement cursor plane with struct
 drm_shadow_plane_state
Date: Tue,  9 Feb 2021 13:10:42 +0100
Message-Id: <20210209121042.24098-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209121042.24098-1-tzimmermann@suse.de>
References: <20210209121042.24098-1-tzimmermann@suse.de>
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

Functions in the atomic commit tail are not allowed to acquire the
dmabuf's reservation lock. So we cannot legally call the GEM object's
vmap functionality in atomic_update.

Instead use struct drm_shadow_plane_state and friends. It vmaps the
framebuffer BOs in prepare_fb and vunmaps them in cleanup_fb. The
cursor plane state stores the mapping's address. The pinning of the
BO is implicitly done by vmap.

As an extra benefit, there's no source of runtime errors left in
atomic_update.

v2:
	* rebase patch onto struct drm_shadow_plane_state

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 28 +++++++--------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..6e4ad966be71 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -381,14 +382,14 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
 	u32 width = plane->state->crtc_w;
 	u32 height = plane->state->crtc_h;
+	struct drm_shadow_plane_state *shadow_plane_state =
+		to_drm_shadow_plane_state(plane->state);
+	struct dma_buf_map map = shadow_plane_state->map[0];
+	u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
 	size_t data_size, mask_size;
 	u32 flags;
-	struct dma_buf_map map;
-	int ret;
-	u8 *src;
 
 	/*
 	 * VirtualBox uses the host windowing system to draw the cursor so
@@ -401,17 +402,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (ret) {
-		/*
-		 * BUG: we should have pinned the BO in prepare_fb().
-		 */
-		mutex_unlock(&vbox->hw_mutex);
-		DRM_WARN("Could not map cursor bo, skipping update\n");
-		return;
-	}
-	src = map.vaddr; /* TODO: Use mapping abstraction properly */
-
 	/*
 	 * The mask must be calculated based on the alpha
 	 * channel, one bit per ARGB word, and must be 32-bit
@@ -421,7 +411,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, &map);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
@@ -466,17 +455,14 @@ static const struct drm_plane_helper_funcs vbox_cursor_helper_funcs = {
 	.atomic_check	= vbox_cursor_atomic_check,
 	.atomic_update	= vbox_cursor_atomic_update,
 	.atomic_disable	= vbox_cursor_atomic_disable,
-	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 };
 
 static const struct drm_plane_funcs vbox_cursor_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= drm_primary_helper_destroy,
-	.reset		= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static const u32 vbox_primary_plane_formats[] = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
