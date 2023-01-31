Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A06822E7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 04:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7AA10E30D;
	Tue, 31 Jan 2023 03:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B1110E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:35:50 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 416D93211E4;
 Tue, 31 Jan 2023 03:35:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675136149; bh=HHEb4W54Kr6Q0gDu4VMnB9nlQlSNachvYwQ5O61QOVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kvIL+Zflw0ESMJKufff56UOwVnV/WXs2NwHIH7ntCN7Q4GuQz7n1frminJhQHXWbL
 DbFCw8WK613g4u5M8E4NkRpngU+BnbgCcanFFIrOk5YCE7IAtdLiVW2dUZ/pte+Aok
 2QNdQomy3abKR6avDnrcgfee0vf85WPuvs87DqV/CQaHj1yw9GWWZ+W1gHLNvCbfSk
 GCpn3Xk8yQ9VbtaAryjPwDrdZU2/4nnnav5qF4iyhVhD0gHu1kdzrgULaNyffA7apU
 tdg9g+tze6cUQ/hGyTtJQpdFPfolFT8wz6gSu2YuH6r86Kg19j2rUzE4gCqWoGzrys
 QqYrRXDgL/5gw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/vmwgfx: Cleanup the vmw bo usage in the cursor
 paths
Date: Mon, 30 Jan 2023 22:35:39 -0500
Message-Id: <20230131033542.953249-6-zack@kde.org>
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

Base mapped count is useless because the ttm unmap functions handle
null maps just fine so completely remove all the code related to it.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index e2dadd68a16d..2ede1e28d7ce 100644
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
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 6780391c57ea..1082218a1cfc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -669,8 +669,7 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
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

