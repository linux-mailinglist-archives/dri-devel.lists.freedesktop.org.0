Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A660181F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1EA10EDFC;
	Mon, 17 Oct 2022 19:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557710E71D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:54:57 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 8362E33EFA0;
 Mon, 17 Oct 2022 20:54:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666036496; bh=Askd3+LSvgSYjFMhO6zksmsckUK467JV16BeIQbykZk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m8N/EcwomA8LgxSYQi+HY+YmlOBnw6vmhqNc47lTNbLPfPOSC4KRJLEJjbv9TgoC9
 hiSvB66kGBhJFh9j3cuil2ZIBd7v0ceaYw8vJIkUzbAaNp/cR5/oPmup4CuCRrWNvP
 bIFkldy/m8KeZdFoQz7I3Z24qn68DLBPM3H8s+rwOedIpgPX75Ty1XLLf1+OYLi8MP
 GyLXFl9lNJ27mDsn3Vh6bHqIXg2IMgvyXNdFv4pJXqq9tbjZQo5Gn/VOC00DOUuZ8N
 Onzzbvp57NdvWK1NnYmOufWn/JDMSS0NnoQbf/IURZ4B4oKal1bTLr+RxX1k5NZkT0
 FHZEoi2P0JGpw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/16] drm/vmwgfx: Start diffing new mob cursors against old
 ones
Date: Mon, 17 Oct 2022 15:54:31 -0400
Message-Id: <20221017195440.311862-8-zack@kde.org>
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

Avoid making the SVGA device do extra work if the new cursor image
matches the old one.

Signed-off-by: Michael Banack <banackm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 95 ++++++++++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 12 ++--
 2 files changed, 81 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index d6e14accaaed..355dc807e898 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -52,11 +52,9 @@ void vmw_du_cleanup(struct vmw_display_unit *du)
  * Display Unit Cursor functions
  */
 
-static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
-				  struct vmw_plane_state *vps,
-				  u32 *image, u32 width, u32 height,
-				  u32 hotspotX, u32 hotspotY);
 static int vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps);
+static void vmw_cursor_write_mobid(struct vmw_private *dev_priv,
+				   struct vmw_plane_state *vps);
 
 struct vmw_svga_fifo_cmd_define_cursor {
 	u32 cmd;
@@ -107,9 +105,7 @@ static void vmw_cursor_update_image(struct vmw_private *dev_priv,
 				    u32 hotspotX, u32 hotspotY)
 {
 	if (vps->cursor.bo != NULL)
-		vmw_cursor_update_mob(dev_priv, vps, image,
-				      width, height,
-				      hotspotX, hotspotY);
+		vmw_cursor_write_mobid(dev_priv, vps);
 	else
 		vmw_send_define_cursor_cmd(dev_priv, image, width, height,
 					   hotspotX, hotspotY);
@@ -155,6 +151,21 @@ static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
 	alpha_header->height = height;
 
 	memcpy(header + 1, image, image_size);
+}
+
+
+/**
+ * vmw_cursor_write_mobid - Update cursor via CursorMob mechanism
+ *
+ * Called from inside vmw_du_cursor_plane_atomic_update to actually
+ * make the cursor-image live.
+ *
+ * @dev_priv: device to work with
+ * @vps: DRM plane_state
+ */
+static void vmw_cursor_write_mobid(struct vmw_private *dev_priv,
+				   struct vmw_plane_state *vps)
+{
 	vmw_write(dev_priv, SVGA_REG_CURSOR_MOBID,
 		  vps->cursor.bo->resource->start);
 }
@@ -164,6 +175,39 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
 	return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
 }
 
+
+static bool vmw_du_cursor_plane_mob_has_changed(struct vmw_plane_state *old_vps,
+						struct vmw_plane_state *new_vps)
+{
+	void *old_mob;
+	void *new_mob;
+	bool dummy;
+	u32 size;
+
+	// If either of them aren't using CursorMobs, assume changed.
+	if (old_vps->cursor.bo == NULL || new_vps->cursor.bo == NULL)
+		return true;
+
+	// If either of them failed to map, assume changed.
+	if (!old_vps->cursor.mapped || !new_vps->cursor.mapped)
+		return true;
+
+	if (old_vps->base.crtc_w != new_vps->base.crtc_w ||
+	    old_vps->base.crtc_h != new_vps->base.crtc_h)
+	    return true;
+
+	size = vmw_du_cursor_mob_size(new_vps->base.crtc_w,
+				      new_vps->base.crtc_h);
+
+	old_mob = ttm_kmap_obj_virtual(&old_vps->cursor.map, &dummy);
+	new_mob = ttm_kmap_obj_virtual(&new_vps->cursor.map, &dummy);
+
+	if (memcmp(old_mob, new_mob, size) != 0)
+		return true;
+
+	return false;
+}
+
 static void vmw_du_destroy_cursor_mob(struct ttm_buffer_object **bo)
 {
 	if (*bo == NULL)
@@ -704,9 +748,10 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
+	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
 	s32 hotspot_x, hotspot_y;
-	void *virtual;
 	bool dummy;
+	void *image;
 
 	hotspot_x = du->hotspot_x;
 	hotspot_y = du->hotspot_y;
@@ -726,23 +771,32 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 
 	if (vps->surf != NULL) {
 		du->cursor_age = du->cursor_surface->snooper.age;
+		image = vps->surf->snooper.image;
+	} else
+		image = ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
 
-		vmw_cursor_update_image(dev_priv, vps,
-					vps->surf->snooper.image,
+	if (vps->cursor.bo != NULL)
+		vmw_cursor_update_mob(dev_priv, vps, image,
+				      new_state->crtc_w,
+				      new_state->crtc_h,
+				      hotspot_x, hotspot_y);
+
+	if (!vmw_du_cursor_plane_mob_has_changed(old_vps, vps)) {
+		/*
+		 * If it hasn't changed, avoid making the device do extra
+		 * work by keeping the old mob active.
+		 */
+		struct vmw_cursor_plane_state tmp = old_vps->cursor;
+		old_vps->cursor = vps->cursor;
+		vps->cursor = tmp;
+	} else if (image != NULL)
+		vmw_cursor_update_image(dev_priv, vps, image,
 					new_state->crtc_w,
 					new_state->crtc_h,
 					hotspot_x, hotspot_y);
-	} else {
 
-		virtual = ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
-		if (virtual) {
-			vmw_cursor_update_image(dev_priv, vps, virtual,
-						new_state->crtc_w,
-						new_state->crtc_h,
-						hotspot_x, hotspot_y);
-			atomic_dec(&vps->bo->base_mapped_count);
-		}
-	}
+	if (image != NULL && vps->bo != NULL)
+		atomic_dec(&vps->bo->base_mapped_count);
 
 	du->cursor_x = new_state->crtc_x + du->set_gui_x;
 	du->cursor_y = new_state->crtc_y + du->set_gui_y;
@@ -1062,7 +1116,6 @@ vmw_du_plane_destroy_state(struct drm_plane *plane,
 {
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(state);
 
-
 	/* Should have been freed by cleanup_fb */
 	if (vps->surf)
 		vmw_surface_unreference(&vps->surf);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index a9bcc91f978b..fb4c9f9e3493 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -272,6 +272,12 @@ struct vmw_crtc_state {
 	struct drm_crtc_state base;
 };
 
+struct vmw_cursor_plane_state {
+	struct ttm_buffer_object *bo;
+	struct ttm_bo_kmap_obj map;
+	bool mapped;
+};
+
 /**
  * Derived class for plane state object
  *
@@ -295,11 +301,7 @@ struct vmw_plane_state {
 	/* For CPU Blit */
 	unsigned int cpp;
 
-	struct {
-		struct ttm_buffer_object *bo;
-		struct ttm_bo_kmap_obj map;
-		bool mapped;
-	} cursor;
+	struct vmw_cursor_plane_state cursor;
 };
 
 
-- 
2.34.1

