Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66C2AAE9D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 01:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EEE89369;
	Mon,  9 Nov 2020 00:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E9E89341
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 00:54:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-wPlIw0FgPGy9T_fQ0fNjVw-1; Sun, 08 Nov 2020 19:54:42 -0500
X-MC-Unique: wPlIw0FgPGy9T_fQ0fNjVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A998030C0;
 Mon,  9 Nov 2020 00:54:41 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-30.bne.redhat.com
 [10.64.54.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7495C1D7;
 Mon,  9 Nov 2020 00:54:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/radeon/ttm: use multihop
Date: Mon,  9 Nov 2020 10:54:32 +1000
Message-Id: <20201109005432.861936-5-airlied@gmail.com>
In-Reply-To: <20201109005432.861936-1-airlied@gmail.com>
References: <20201109005432.861936-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This removes the code to move resources directly between
SYSTEM and VRAM in favour of using the core ttm mulithop code.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 119 +++-------------------------
 1 file changed, 13 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 29062dbea299..788655ebafdb 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -206,101 +206,6 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 	return r;
 }
 
-static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
-				bool evict,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	struct ttm_resource tmp_mem;
-	struct ttm_place placements;
-	struct ttm_placement placement;
-	int r;
-
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = 0;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
-	if (unlikely(r)) {
-		return r;
-	}
-
-	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-
-	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-	r = radeon_move_blit(bo, true, &tmp_mem, old_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-	r = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
-	ttm_bo_assign_mem(bo, new_mem);
-out_cleanup:
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
-static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
-				bool evict,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	struct ttm_resource tmp_mem;
-	struct ttm_placement placement;
-	struct ttm_place placements;
-	int r;
-
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = 0;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
-	if (unlikely(r)) {
-		return r;
-	}
-
-	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	ttm_bo_assign_mem(bo, &tmp_mem);
-	r = radeon_move_blit(bo, true, new_mem, old_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-out_cleanup:
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
 static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 			  struct ttm_operation_ctx *ctx,
 			  struct ttm_resource *new_mem,
@@ -311,6 +216,17 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
+	     new_mem->mem_type == TTM_PL_VRAM) ||
+	    (old_mem->mem_type == TTM_PL_VRAM &&
+	     new_mem->mem_type == TTM_PL_SYSTEM)) {
+		hop->fpfn = 0;
+		hop->lpfn = 0;
+		hop->mem_type = TTM_PL_TT;
+		hop->flags = 0;
+		return -EMULTIHOP;
+	}
+
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
 		if (r)
@@ -351,17 +267,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 		goto memcpy;
 	}
 
-	if (old_mem->mem_type == TTM_PL_VRAM &&
-	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = radeon_move_vram_ram(bo, evict, ctx, new_mem);
-	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
-		   new_mem->mem_type == TTM_PL_VRAM) {
-		r = radeon_move_ram_vram(bo, evict, ctx, new_mem);
-	} else {
-		r = radeon_move_blit(bo, evict,
-				     new_mem, old_mem);
-	}
-
+	r = radeon_move_blit(bo, evict,
+			     new_mem, old_mem);
 	if (r) {
 memcpy:
 		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
