Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8D601826
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A463B10EDFA;
	Mon, 17 Oct 2022 19:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D384710E720
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:54:57 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 3EA3433EFAE;
 Mon, 17 Oct 2022 20:54:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666036496; bh=UQsRwJUy38KS5tIb9v83SJyyL5e2+/OVUqS7Z5gQwu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lA1Uyiaw2GVfd71SVIpTNoKGdcHfcxbjn1FWNqhCymxwg3q3ThYCYKxcREGTwvcgg
 LfC5ornhmwMHoyyqsaOUYxlbdVpUc0Os5OObO0eiztpH+zn5Qzn5Cf9pDvBIOdC5c0
 0lQTWvjFgwjOF8JZ+qTaT4V9rw7yQyvosH9IilU5dgHTYWE4q0V5P3tj1lrsWq3B4i
 4KB3WoyYYtAhQB3iaf0fQRzNtwxAyqb4wuVBojpajxToJo/1bapiPQxvQNBzUBI+cf
 sFdxQVxpahS4o0gkWP2TPDwIXPdfbJJgQ4VLhwCA8n0+uGDK34i5LZUDh8i8sZdlH3
 b5BNCQnKall7g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/16] drm/vmwgfx: Support cursor surfaces with mob cursor
Date: Mon, 17 Oct 2022 15:54:32 -0400
Message-Id: <20221017195440.311862-9-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017195440.311862-1-zack@kde.org>
References: <20221017195440.311862-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Banack <banackm@vmware.com>

Add support for cursor surfaces when using mob cursors.

Signed-off-by: Michael Banack <banackm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 78 ++++++++++++++++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  1 +
 2 files changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 355dc807e898..966625943c09 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -79,7 +79,7 @@ static void vmw_send_define_cursor_cmd(struct vmw_private *dev_priv,
 	   other fallible KMS-atomic resources at prepare_fb */
 	cmd = VMW_CMD_RESERVE(dev_priv, cmd_size);
 
-	if (unlikely(cmd == NULL))
+	if (unlikely(!cmd))
 		return;
 
 	memset(cmd, 0, sizeof(*cmd));
@@ -104,7 +104,7 @@ static void vmw_cursor_update_image(struct vmw_private *dev_priv,
 				    u32 *image, u32 width, u32 height,
 				    u32 hotspotX, u32 hotspotY)
 {
-	if (vps->cursor.bo != NULL)
+	if (vps->cursor.bo)
 		vmw_cursor_write_mobid(dev_priv, vps);
 	else
 		vmw_send_define_cursor_cmd(dev_priv, image, width, height,
@@ -185,7 +185,7 @@ static bool vmw_du_cursor_plane_mob_has_changed(struct vmw_plane_state *old_vps,
 	u32 size;
 
 	// If either of them aren't using CursorMobs, assume changed.
-	if (old_vps->cursor.bo == NULL || new_vps->cursor.bo == NULL)
+	if (!old_vps->cursor.bo || !new_vps->cursor.bo)
 		return true;
 
 	// If either of them failed to map, assume changed.
@@ -210,7 +210,7 @@ static bool vmw_du_cursor_plane_mob_has_changed(struct vmw_plane_state *old_vps,
 
 static void vmw_du_destroy_cursor_mob(struct ttm_buffer_object **bo)
 {
-	if (*bo == NULL)
+	if (!(*bo))
 		return;
 
 	ttm_bo_unpin(*bo);
@@ -224,14 +224,14 @@ static void vmw_du_put_cursor_mob(struct vmw_cursor_plane *vcp,
 {
 	u32 i;
 
-	if (vps->cursor.bo == NULL)
+	if (!vps->cursor.bo)
 		return;
 
 	vmw_du_cursor_plane_unmap_cm(vps);
 
 	/* Look for a free slot to return this mob to the cache. */
 	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
-		if (vcp->cursor_mobs[i] == NULL) {
+		if (!vcp->cursor_mobs[i]) {
 			vcp->cursor_mobs[i] = vps->cursor.bo;
 			vps->cursor.bo = NULL;
 			return;
@@ -273,7 +273,7 @@ static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 	    vps->base.crtc_h > cursor_max_dim)
 		return -EINVAL;
 
-	if (vps->cursor.bo != NULL) {
+	if (vps->cursor.bo) {
 		if (vps->cursor.bo->base.size >= size)
 			return 0;
 		vmw_du_put_cursor_mob(vcp, vps);
@@ -281,7 +281,7 @@ static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 
 	/* Look for an unused mob in the cache. */
 	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
-		if (vcp->cursor_mobs[i] != NULL &&
+		if (vcp->cursor_mobs[i] &&
 		    vcp->cursor_mobs[i]->base.size >= size) {
 			vps->cursor.bo = vcp->cursor_mobs[i];
 			vcp->cursor_mobs[i] = NULL;
@@ -359,7 +359,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 
 	cmd = container_of(header, struct vmw_dma_cmd, header);
 
-	/* No snooper installed */
+	/* No snooper installed, nothing to copy */
 	if (!srf->snooper.image)
 		return;
 
@@ -459,7 +459,8 @@ void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		du = vmw_crtc_to_du(crtc);
 		if (!du->cursor_surface ||
-		    du->cursor_age == du->cursor_surface->snooper.age)
+		    du->cursor_age == du->cursor_surface->snooper.age ||
+		    !du->cursor_surface->snooper.image)
 			continue;
 
 		du->cursor_age = du->cursor_surface->snooper.age;
@@ -555,7 +556,7 @@ vmw_du_cursor_plane_map_cm(struct vmw_plane_state *vps)
 	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
 	struct ttm_buffer_object *bo = vps->cursor.bo;
 
-	if (bo == NULL)
+	if (!bo)
 		return -EINVAL;
 
 	if (bo->base.size < size)
@@ -607,7 +608,7 @@ vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps)
 	if (!vps->cursor.mapped)
 		return 0;
 
-	if (bo == NULL)
+	if (!bo)
 		return 0;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
@@ -639,7 +640,12 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
 	bool dummy;
 
-	if (vps->bo != NULL && ttm_kmap_obj_virtual(&vps->bo->map, &dummy) != NULL) {
+	if (vps->surf_mapped) {
+		vmw_bo_unmap(vps->surf->res.backup);
+		vps->surf_mapped = false;
+	}
+
+	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &dummy)) {
 		const int ret = ttm_bo_reserve(&vps->bo->base, true, false, NULL);
 
 		if (likely(ret == 0)) {
@@ -654,12 +660,12 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
 
 	vmw_du_plane_unpin_surf(vps, false);
 
-	if (vps->surf != NULL) {
+	if (vps->surf) {
 		vmw_surface_unreference(&vps->surf);
 		vps->surf = NULL;
 	}
 
-	if (vps->bo != NULL) {
+	if (vps->bo) {
 		vmw_bo_unreference(&vps->bo);
 		vps->bo = NULL;
 	}
@@ -703,7 +709,7 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	if (vps->surf == NULL && vps->bo != NULL) {
+	if (!vps->surf && vps->bo) {
 		const u32 size = new_state->crtc_w * new_state->crtc_h * sizeof(u32);
 
 		/*
@@ -725,9 +731,18 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 
 		if (unlikely(ret != 0))
 			return -ENOMEM;
+	} else if (vps->surf && !vps->bo && vps->surf->res.backup) {
+
+		ret = ttm_bo_reserve(&vps->surf->res.backup->base, true, false,
+				     NULL);
+		if (unlikely(ret != 0))
+			return -ENOMEM;
+		vmw_bo_map_and_cache(vps->surf->res.backup);
+		ttm_bo_unreserve(&vps->surf->res.backup->base);
+		vps->surf_mapped = true;
 	}
 
-	if (vps->surf != NULL || vps->bo != NULL) {
+	if (vps->surf || vps->bo) {
 		vmw_du_get_cursor_mob(vcp, vps);
 		vmw_du_cursor_plane_map_cm(vps);
 	}
@@ -764,18 +779,20 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	du->cursor_surface = vps->surf;
 	du->cursor_bo = vps->bo;
 
-	if (vps->surf == NULL && vps->bo == NULL) {
+	if (!vps->surf && !vps->bo) {
 		vmw_cursor_update_position(dev_priv, false, 0, 0);
 		return;
 	}
 
-	if (vps->surf != NULL) {
+	if (vps->surf) {
 		du->cursor_age = du->cursor_surface->snooper.age;
 		image = vps->surf->snooper.image;
+		if (vps->surf_mapped)
+			image = vmw_bo_map_and_cache(vps->surf->res.backup);
 	} else
 		image = ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
 
-	if (vps->cursor.bo != NULL)
+	if (vps->cursor.bo)
 		vmw_cursor_update_mob(dev_priv, vps, image,
 				      new_state->crtc_w,
 				      new_state->crtc_h,
@@ -789,13 +806,13 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 		struct vmw_cursor_plane_state tmp = old_vps->cursor;
 		old_vps->cursor = vps->cursor;
 		vps->cursor = tmp;
-	} else if (image != NULL)
+	} else if (image)
 		vmw_cursor_update_image(dev_priv, vps, image,
 					new_state->crtc_w,
 					new_state->crtc_h,
 					hotspot_x, hotspot_y);
 
-	if (image != NULL && vps->bo != NULL)
+	if (image && vps->bo)
 		atomic_dec(&vps->bo->base_mapped_count);
 
 	du->cursor_x = new_state->crtc_x + du->set_gui_x;
@@ -895,12 +912,16 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	if (!vmw_framebuffer_to_vfb(fb)->bo)
+	if (!vmw_framebuffer_to_vfb(fb)->bo) {
 		surface = vmw_framebuffer_to_vfbs(fb)->surface;
 
-	if (surface && !surface->snooper.image) {
-		DRM_ERROR("surface not suitable for cursor\n");
-		return -EINVAL;
+		WARN_ON(!surface);
+
+		if (!surface ||
+		    (!surface->snooper.image && !surface->res.backup)) {
+			DRM_ERROR("surface not suitable for cursor\n");
+			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -1063,10 +1084,10 @@ vmw_du_plane_duplicate_state(struct drm_plane *plane)
 	memset(&vps->cursor, 0, sizeof(vps->cursor));
 
 	/* Each ref counted resource needs to be acquired again */
-	if (vps->surf != NULL)
+	if (vps->surf)
 		(void) vmw_surface_reference(vps->surf);
 
-	if (vps->bo != NULL)
+	if (vps->bo)
 		(void) vmw_bo_reference(vps->bo);
 
 	state = &vps->base;
@@ -2211,7 +2232,6 @@ int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
 	struct drm_crtc *crtc;
 	int ret = 0;
 
-
 	mutex_lock(&dev->mode_config.mutex);
 	if (arg->flags & DRM_VMW_CURSOR_BYPASS_ALL) {
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index fb4c9f9e3493..c5e4665a956c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -301,6 +301,7 @@ struct vmw_plane_state {
 	/* For CPU Blit */
 	unsigned int cpp;
 
+	bool surf_mapped;
 	struct vmw_cursor_plane_state cursor;
 };
 
-- 
2.34.1

