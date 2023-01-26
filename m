Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203967D359
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EF810E955;
	Thu, 26 Jan 2023 17:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6236810E955
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:38:24 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B9FC8324AA7;
 Thu, 26 Jan 2023 17:38:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1674754703; bh=3zwIAT04JXpi0zVQcZYKNL3Til1aPSHyO+SgS15GXOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LrO6Gb32vsi/t7alpA6jSUojUB5aC7LXt4457BV/a5QdELWOlQP4tRFInsEv+fQQd
 4eZDhPBufU+LFsLUAdqmeRJQZFMDpNS/+IqcM2EAJowPoefhYCltUpyEt79LCjz1vQ
 mUpr1tEPLB1qE4vpzDDsIuLagjDiVFPzG5Wv6Awc2Ej6RXBn9QvpKIm/Fv3BEfPIZx
 sFmRT/a982vDzamHgG8ijj/z82Mz24xYcJbL/Iw73r31MYngIfLmqLfYLFwTbFOy45
 EKY8tljaL5FPfdX8bdum0k6UQ0amV235k7ri1YS4eukWu3SDfh0d+nrmFbMz3OZG89
 Hcr1dJt+ACjfQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
Date: Thu, 26 Jan 2023 12:38:11 -0500
Message-Id: <20230126173813.602748-6-zack@kde.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230126173813.602748-1-zack@kde.org>
References: <20230126173813.602748-1-zack@kde.org>
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

From: Zack Rusin <zackr@vmware.com>

Base mapped count is useless because the ttm unmap functions handle
null maps just fine so completely remove all the code related to it.
Rename dummy to is_iomem because that's what it is even if we're not
activelly using it. Makes the code easier to read.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  4 ----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 28 +++++++++-------------------
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index db85609ec01c..4dcf37235cb0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -44,7 +44,6 @@ struct vmw_resource;
  * struct vmw_bo - TTM buffer object with vmwgfx additions
  * @base: The TTM buffer object
  * @res_tree: RB tree of resources using this buffer object as a backing MOB
- * @base_mapped_count: ttm BO mapping count; used by KMS atomic helpers.
  * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
  * increased. May be decreased without reservation.
  * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
@@ -55,8 +54,6 @@ struct vmw_resource;
 struct vmw_bo {
 	struct ttm_buffer_object base;
 	struct rb_root res_tree;
-	/* For KMS atomic helpers: ttm bo mapping count */
-	atomic_t base_mapped_count;
 
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
@@ -67,7 +64,6 @@ struct vmw_bo {
 	struct vmw_bo_dirty *dirty;
 };
 
-
 int vmw_bo_create_kernel(struct vmw_private *dev_priv,
 			 unsigned long size,
 			 struct ttm_placement *placement,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 6780391c57ea..e83286e08837 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -153,9 +153,9 @@ static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
 	SVGAGBCursorHeader *header;
 	SVGAGBAlphaCursorHeader *alpha_header;
 	const u32 image_size = width * height * sizeof(*image);
-	bool dummy;
+	bool is_iomem;
 
-	header = ttm_kmap_obj_virtual(&vps->cursor.map, &dummy);
+	header = ttm_kmap_obj_virtual(&vps->cursor.map, &is_iomem);
 	alpha_header = &header->header.alphaHeader;
 
 	memset(header, 0, sizeof(*header));
@@ -185,13 +185,13 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
  */
 static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
 {
-	bool dummy;
+	bool is_iomem;
 	if (vps->surf) {
 		if (vps->surf_mapped)
 			return vmw_bo_map_and_cache(vps->surf->res.backup);
 		return vps->surf->snooper.image;
 	} else if (vps->bo)
-		return ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
+		return ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem);
 	return NULL;
 }
 
@@ -364,7 +364,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	SVGA3dCopyBox *box;
 	unsigned box_count;
 	void *virtual;
-	bool dummy;
+	bool is_iomem;
 	struct vmw_dma_cmd {
 		SVGA3dCmdHeader header;
 		SVGA3dCmdSurfaceDMA dma;
@@ -424,7 +424,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	if (unlikely(ret != 0))
 		goto err_unreserve;
 
-	virtual = ttm_kmap_obj_virtual(&map, &dummy);
+	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
 
 	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
 		memcpy(srf->snooper.image, virtual,
@@ -658,19 +658,18 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
 {
 	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
-	bool dummy;
+	bool is_iomem;
 
 	if (vps->surf_mapped) {
 		vmw_bo_unmap(vps->surf->res.backup);
 		vps->surf_mapped = false;
 	}
 
-	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &dummy)) {
+	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem)) {
 		const int ret = ttm_bo_reserve(&vps->bo->base, true, false, NULL);
 
 		if (likely(ret == 0)) {
-			if (atomic_read(&vps->bo->base_mapped_count) == 0)
-			    ttm_bo_kunmap(&vps->bo->map);
+			ttm_bo_kunmap(&vps->bo->map);
 			ttm_bo_unreserve(&vps->bo->base);
 		}
 	}
@@ -744,9 +743,6 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 
 		ret = ttm_bo_kmap(&vps->bo->base, 0, PFN_UP(size), &vps->bo->map);
 
-		if (likely(ret == 0))
-			atomic_inc(&vps->bo->base_mapped_count);
-
 		ttm_bo_unreserve(&vps->bo->base);
 
 		if (unlikely(ret != 0))
@@ -786,7 +782,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
 	s32 hotspot_x, hotspot_y;
-	bool dummy;
 
 	hotspot_x = du->hotspot_x;
 	hotspot_y = du->hotspot_y;
@@ -828,11 +823,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 						hotspot_x, hotspot_y);
 	}
 
-	if (vps->bo) {
-		if (ttm_kmap_obj_virtual(&vps->bo->map, &dummy))
-			atomic_dec(&vps->bo->base_mapped_count);
-	}
-
 	du->cursor_x = new_state->crtc_x + du->set_gui_x;
 	du->cursor_y = new_state->crtc_y + du->set_gui_y;
 
-- 
2.38.1

