Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84180605601
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F8610E2EF;
	Thu, 20 Oct 2022 03:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FE10E2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:45 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id AEC5533EF9C;
 Thu, 20 Oct 2022 04:41:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237304; bh=VMLOr6PjeShVuqsyKmUc+qWcvkM2Y12weJW5JTKdaQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dJ77lbL7UonA0EhbtSAWnrKxaQzqmO2fUyW9Oo1oXGUJ2LUQe0euSFDOjs7iDsCc6
 sEqeuJzZjH3VHVLGB/nTYvmytIgtCJol5gFMkOI/gxVYP1G2HLA6iYL7FR1DZzwOh8
 OyT5WnYh1twnZm1gSXQydXl7PXUO1OjGurLQ+7JZQ1xYLndSa+SkcRaGlhKBPKheYP
 xxtVtRRAIvcF1S9OdD5ltq7r/Ot7r5ejTcWaXQioZOx11GSm6dpU5/GZ5LY1MDx67A
 jmjlzZpc0XXfOI6f92nT3/K9r/uayu2rqZqwzC9HAx275zfLfrKBo9Y1TBr83yPz5O
 ekBqyrsmqkOtQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/16] drm/vmwgfx: Diff cursors when using cmds
Date: Wed, 19 Oct 2022 23:41:24 -0400
Message-Id: <20221020034131.491973-10-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020034131.491973-1-zack@kde.org>
References: <20221020034131.491973-1-zack@kde.org>
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

Extend the cursor diffing support to support the command-path.

Signed-off-by: Michael Banack <banackm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 120 ++++++++++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |   2 +
 2 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 6c41c5b5a913..ff79668ad334 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -53,8 +53,10 @@ void vmw_du_cleanup(struct vmw_display_unit *du)
  */
 
 static int vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps);
-static void vmw_cursor_write_mobid(struct vmw_private *dev_priv,
-				   struct vmw_plane_state *vps);
+static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
+				  struct vmw_plane_state *vps,
+				  u32 *image, u32 width, u32 height,
+				  u32 hotspotX, u32 hotspotY);
 
 struct vmw_svga_fifo_cmd_define_cursor {
 	u32 cmd;
@@ -118,7 +120,10 @@ static void vmw_cursor_update_image(struct vmw_private *dev_priv,
 				    u32 hotspotX, u32 hotspotY)
 {
 	if (vps->cursor.bo)
-		vmw_cursor_write_mobid(dev_priv, vps);
+		vmw_cursor_update_mob(dev_priv, vps, image,
+				      vps->base.crtc_w, vps->base.crtc_h,
+				      hotspotX, hotspotY);
+
 	else
 		vmw_send_define_cursor_cmd(dev_priv, image, width, height,
 					   hotspotX, hotspotY);
@@ -163,61 +168,58 @@ static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
 	alpha_header->height = height;
 
 	memcpy(header + 1, image, image_size);
-}
-
-
-/**
- * vmw_cursor_write_mobid - Update cursor via CursorMob mechanism
- *
- * Called from inside vmw_du_cursor_plane_atomic_update to actually
- * make the cursor-image live.
- *
- * @dev_priv: device to work with
- * @vps: DRM plane_state
- */
-static void vmw_cursor_write_mobid(struct vmw_private *dev_priv,
-				   struct vmw_plane_state *vps)
-{
 	vmw_write(dev_priv, SVGA_REG_CURSOR_MOBID,
 		  vps->cursor.bo->resource->start);
 }
 
+
 static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
 {
 	return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
 }
 
-
-static bool vmw_du_cursor_plane_mob_has_changed(struct vmw_plane_state *old_vps,
-						struct vmw_plane_state *new_vps)
+/**
+ * vmw_du_cursor_plane_acquire_image -- Acquire the image data
+ * @vps: cursor plane state
+ */
+static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
 {
-	void *old_mob;
-	void *new_mob;
 	bool dummy;
-	u32 size;
-
-	// If either of them aren't using CursorMobs, assume changed.
-	if (!old_vps->cursor.bo || !new_vps->cursor.bo)
-		return true;
+	if (vps->surf) {
+		if (vps->surf_mapped)
+			return vmw_bo_map_and_cache(vps->surf->res.backup);
+		return vps->surf->snooper.image;
+	} else if (vps->bo)
+		return ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
+	return NULL;
+}
 
-	// If either of them failed to map, assume changed.
-	if (!old_vps->cursor.mapped || !new_vps->cursor.mapped)
-		return true;
+static bool vmw_du_cursor_plane_has_changed(struct vmw_plane_state *old_vps,
+					    struct vmw_plane_state *new_vps)
+{
+	void *old_image;
+	void *new_image;
+	u32 size;
+	bool changed;
 
 	if (old_vps->base.crtc_w != new_vps->base.crtc_w ||
 	    old_vps->base.crtc_h != new_vps->base.crtc_h)
 	    return true;
 
-	size = vmw_du_cursor_mob_size(new_vps->base.crtc_w,
-				      new_vps->base.crtc_h);
+	if (old_vps->cursor.hotspot_x != new_vps->cursor.hotspot_x ||
+	    old_vps->cursor.hotspot_y != new_vps->cursor.hotspot_y)
+	    return true;
 
-	old_mob = ttm_kmap_obj_virtual(&old_vps->cursor.map, &dummy);
-	new_mob = ttm_kmap_obj_virtual(&new_vps->cursor.map, &dummy);
+	size = new_vps->base.crtc_w * new_vps->base.crtc_h * sizeof(u32);
 
-	if (memcmp(old_mob, new_mob, size) != 0)
-		return true;
+	old_image = vmw_du_cursor_plane_acquire_image(old_vps);
+	new_image = vmw_du_cursor_plane_acquire_image(new_vps);
 
-	return false;
+	changed = false;
+	if (old_image && new_image)
+		changed = memcmp(old_image, new_image, size) != 0;
+
+	return changed;
 }
 
 static void vmw_du_destroy_cursor_mob(struct ttm_buffer_object **bo)
@@ -745,6 +747,7 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 			return -ENOMEM;
 	} else if (vps->surf && !vps->bo && vps->surf->res.backup) {
 
+		WARN_ON(vps->surf->snooper.image);
 		ret = ttm_bo_reserve(&vps->surf->res.backup->base, true, false,
 				     NULL);
 		if (unlikely(ret != 0))
@@ -778,7 +781,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
 	s32 hotspot_x, hotspot_y;
 	bool dummy;
-	void *image;
 
 	hotspot_x = du->hotspot_x;
 	hotspot_y = du->hotspot_y;
@@ -796,36 +798,34 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
+	vps->cursor.hotspot_x = hotspot_x;
+	vps->cursor.hotspot_y = hotspot_y;
+
 	if (vps->surf) {
 		du->cursor_age = du->cursor_surface->snooper.age;
-		image = vps->surf->snooper.image;
-		if (vps->surf_mapped)
-			image = vmw_bo_map_and_cache(vps->surf->res.backup);
-	} else
-		image = ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
-
-	if (vps->cursor.bo)
-		vmw_cursor_update_mob(dev_priv, vps, image,
-				      new_state->crtc_w,
-				      new_state->crtc_h,
-				      hotspot_x, hotspot_y);
+	}
 
-	if (!vmw_du_cursor_plane_mob_has_changed(old_vps, vps)) {
+	if (!vmw_du_cursor_plane_has_changed(old_vps, vps)) {
 		/*
 		 * If it hasn't changed, avoid making the device do extra
-		 * work by keeping the old mob active.
+		 * work by keeping the old cursor active.
 		 */
 		struct vmw_cursor_plane_state tmp = old_vps->cursor;
 		old_vps->cursor = vps->cursor;
 		vps->cursor = tmp;
-	} else if (image)
-		vmw_cursor_update_image(dev_priv, vps, image,
-					new_state->crtc_w,
-					new_state->crtc_h,
-					hotspot_x, hotspot_y);
-
-	if (image && vps->bo)
-		atomic_dec(&vps->bo->base_mapped_count);
+	} else {
+		void *image = vmw_du_cursor_plane_acquire_image(vps);
+		if (image)
+			vmw_cursor_update_image(dev_priv, vps, image,
+						new_state->crtc_w,
+						new_state->crtc_h,
+						hotspot_x, hotspot_y);
+	}
+
+	if (vps->bo) {
+		if (ttm_kmap_obj_virtual(&vps->bo->map, &dummy))
+			atomic_dec(&vps->bo->base_mapped_count);
+	}
 
 	du->cursor_x = new_state->crtc_x + du->set_gui_x;
 	du->cursor_y = new_state->crtc_y + du->set_gui_y;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index c5e4665a956c..13a265ffd9f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -276,6 +276,8 @@ struct vmw_cursor_plane_state {
 	struct ttm_buffer_object *bo;
 	struct ttm_bo_kmap_obj map;
 	bool mapped;
+	s32 hotspot_x;
+	s32 hotspot_y;
 };
 
 /**
-- 
2.34.1

