Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B86822E9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 04:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D6310E30F;
	Tue, 31 Jan 2023 03:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC4410E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:35:51 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id EECE332123F;
 Tue, 31 Jan 2023 03:35:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675136150; bh=YjOzM+PgkUI1HfvW1kNrHOy0AAMzmcgmHqVkrewOdco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EPw8j6mG6+kTD8dY7BLbdL1zbmYlovxHaaJc6FqIFwJzCbOMkIpSGpYQn2dYmGcnu
 P14oxg3SiNItilFi4uEa2ElUfjw9My8iTSUsH06dAdyjVZ/7ajPUkDmQE3NBJIjcKO
 JjWy3qgaLfTIVIoC8iHgfiPEHvi28Xbo3Drz8x1HsgslC5Xliz3b6CNr1ZxKoLcMXg
 rF0UZBt3eMYyZGdn2pqPdEvq/2WrjxqgwtqYF64pVWw7fzVs1OAuzPKMTV35Cvhdyb
 Ih2XXIIaF24+BHWf0rw23ZJHZM5aPj5QWb9Ow67D+lX62s/frYh+XRCQaWwWYs7nfq
 IDeI8ddQPTYtw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/vmwgfx: Rename dummy to is_iomem
Date: Mon, 30 Jan 2023 22:35:40 -0500
Message-Id: <20230131033542.953249-7-zack@kde.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230131033542.953249-1-zack@kde.org>
References: <20230131033542.953249-1-zack@kde.org>
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

Rename dummy to is_iomem because that's what it is even if we're not
activelly using it. Makes the code easier to read.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 1082218a1cfc..e83286e08837 100644
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
@@ -658,14 +658,14 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
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
-- 
2.38.1

