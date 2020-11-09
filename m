Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D196F2AAE9C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 01:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7767E89341;
	Mon,  9 Nov 2020 00:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4087789341
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 00:54:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-B-bvMZKnOP-q7jqNj9RGNQ-1; Sun, 08 Nov 2020 19:54:41 -0500
X-MC-Unique: B-bvMZKnOP-q7jqNj9RGNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B589809DC3;
 Mon,  9 Nov 2020 00:54:40 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-30.bne.redhat.com
 [10.64.54.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75CBD5C1D7;
 Mon,  9 Nov 2020 00:54:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/nouveau/ttm: use multihop
Date: Mon,  9 Nov 2020 10:54:31 +1000
Message-Id: <20201109005432.861936-4-airlied@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_bo.c | 112 ++++-----------------------
 1 file changed, 13 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fee07b9d19ed..2b7720f412c1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -861,96 +861,6 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 	NV_INFO(drm, "MM: using %s for buffer copies\n", name);
 }
 
-static int
-nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
-		      struct ttm_operation_ctx *ctx,
-		      struct ttm_resource *new_reg)
-{
-	struct ttm_place placement_memtype = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_TT,
-		.flags = 0
-	};
-	struct ttm_placement placement;
-	struct ttm_resource tmp_reg;
-	int ret;
-
-	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = placement.busy_placement = &placement_memtype;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
-	if (ret)
-		return ret;
-
-	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (ret)
-		goto out;
-
-	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
-	if (ret)
-		goto out;
-
-	ret = nouveau_bo_move_m2mf(bo, true, ctx, &tmp_reg);
-	if (ret)
-		goto out;
-
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (ret)
-		goto out;
-
-	nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
-	ttm_bo_assign_mem(bo, &tmp_reg);
-out:
-	ttm_resource_free(bo, &tmp_reg);
-	return ret;
-}
-
-static int
-nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
-		      struct ttm_operation_ctx *ctx,
-		      struct ttm_resource *new_reg)
-{
-	struct ttm_place placement_memtype = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_TT,
-		.flags = 0
-	};
-	struct ttm_placement placement;
-	struct ttm_resource tmp_reg;
-	int ret;
-
-	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = placement.busy_placement = &placement_memtype;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
-	if (ret)
-		return ret;
-
-	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ttm_bo_assign_mem(bo, &tmp_reg);
-	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
-	if (ret)
-		goto out;
-
-out:
-	ttm_resource_free(bo, &tmp_reg);
-	return ret;
-}
-
 static void
 nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
 		     struct ttm_resource *new_reg)
@@ -1032,6 +942,17 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
+	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
+	     new_reg->mem_type == TTM_PL_VRAM) ||
+	    (old_reg->mem_type == TTM_PL_VRAM &&
+	     new_reg->mem_type == TTM_PL_SYSTEM)) {
+		hop->fpfn = 0;
+		hop->lpfn = 0;
+		hop->mem_type = TTM_PL_TT;
+		hop->flags = 0;
+		return -EMULTIHOP;
+	}
+
 	if (new_reg->mem_type == TTM_PL_TT) {
 		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
 		if (ret)
@@ -1074,15 +995,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	/* Hardware assisted copy. */
 	if (drm->ttm.move) {
-		if (new_reg->mem_type == TTM_PL_SYSTEM)
-			ret = nouveau_bo_move_flipd(bo, evict, ctx,
-						    new_reg);
-		else if (old_reg->mem_type == TTM_PL_SYSTEM)
-			ret = nouveau_bo_move_flips(bo, evict, ctx,
-						    new_reg);
-		else
-			ret = nouveau_bo_move_m2mf(bo, evict, ctx,
-						   new_reg);
+		ret = nouveau_bo_move_m2mf(bo, evict, ctx,
+					   new_reg);
 		if (!ret)
 			goto out;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
