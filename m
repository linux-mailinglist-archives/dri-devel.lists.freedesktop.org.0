Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFE305DCF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C126E2D1;
	Wed, 27 Jan 2021 14:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62C6E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:05:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DE71B719;
 Wed, 27 Jan 2021 14:05:06 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
Date: Wed, 27 Jan 2021 15:05:03 +0100
Message-Id: <20210127140503.31772-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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

Instead vmap the cursor BO in prepare_fb and vunmap it in cleanup_fb.
The cursor plane state stores the mapping's address. The pinning of the
BO is implicitly done by vmap.

As an extra benefit, there's no source of runtime errors left in
atomic_update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 +++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..b5625a7d6cef 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struct drm_plane *plane,
 				    old_state->src_y >> 16);
 }
 
+struct vbox_cursor_plane_state {
+	struct drm_plane_state base;
+
+	/* Transitional state - do not export or duplicate */
+
+	struct dma_buf_map map;
+};
+
+static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vbox_cursor_plane_state, base);
+}
+
 static int vbox_cursor_atomic_check(struct drm_plane *plane,
 				    struct drm_plane_state *new_state)
 {
@@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
 	u32 width = plane->state->crtc_w;
 	u32 height = plane->state->crtc_h;
+	struct vbox_cursor_plane_state *vbox_state = to_vbox_cursor_plane_state(plane->state);
+	struct dma_buf_map map = vbox_state->map;
+	u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
 	size_t data_size, mask_size;
 	u32 flags;
-	struct dma_buf_map map;
-	int ret;
-	u8 *src;
 
 	/*
 	 * VirtualBox uses the host windowing system to draw the cursor so
@@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
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
@@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, &map);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
@@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct drm_plane *plane,
 	mutex_unlock(&vbox->hw_mutex);
 }
 
+static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct drm_plane_state *new_state)
+{
+	struct vbox_cursor_plane_state *new_vbox_state = to_vbox_cursor_plane_state(new_state);
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
+	int ret;
+
+	if (!fb)
+		return 0;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (ret)
+		return ret;
+
+	new_vbox_state->map = map;
+
+	return 0;
+}
+
+static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struct drm_plane_state *old_state)
+{
+	struct vbox_cursor_plane_state *old_vbox_state = to_vbox_cursor_plane_state(old_state);
+	struct drm_framebuffer *fb = old_state->fb;
+	struct dma_buf_map map = old_vbox_state->map;
+	struct drm_gem_vram_object *gbo;
+
+	if (!fb)
+		return;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	drm_gem_vram_vunmap(gbo, &map);
+}
+
 static const u32 vbox_cursor_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
@@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs vbox_cursor_helper_funcs = {
 	.atomic_check	= vbox_cursor_atomic_check,
 	.atomic_update	= vbox_cursor_atomic_update,
 	.atomic_disable	= vbox_cursor_atomic_disable,
-	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
+	.prepare_fb	= vbox_cursor_prepare_fb,
+	.cleanup_fb	= vbox_cursor_cleanup_fb,
 };
 
+static struct drm_plane_state *vbox_cursor_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct vbox_cursor_plane_state *new_vbox_state;
+	struct drm_device *dev = plane->dev;
+
+	if (drm_WARN_ON(dev, !plane->state))
+		return NULL;
+
+	new_vbox_state = kzalloc(sizeof(*new_vbox_state), GFP_KERNEL);
+	if (!new_vbox_state)
+		return NULL;
+	__drm_atomic_helper_plane_duplicate_state(plane, &new_vbox_state->base);
+
+	return &new_vbox_state->base;
+}
+
+static void vbox_cursor_atomic_destroy_state(struct drm_plane *plane,
+					     struct drm_plane_state *state)
+{
+	struct vbox_cursor_plane_state *vbox_state = to_vbox_cursor_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(&vbox_state->base);
+	kfree(vbox_state);
+}
+
 static const struct drm_plane_funcs vbox_cursor_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= drm_primary_helper_destroy,
 	.reset		= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state = vbox_cursor_atomic_duplicate_state,
+	.atomic_destroy_state = vbox_cursor_atomic_destroy_state,
 };
 
 static const u32 vbox_primary_plane_formats[] = {

base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
