Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C12AAE9B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 01:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648589354;
	Mon,  9 Nov 2020 00:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6578933C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 00:54:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-rj3gxjUWPmCz-zYdeDrS5Q-1; Sun, 08 Nov 2020 19:54:40 -0500
X-MC-Unique: rj3gxjUWPmCz-zYdeDrS5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9608030CE;
 Mon,  9 Nov 2020 00:54:39 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-30.bne.redhat.com
 [10.64.54.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5552D5C1D7;
 Mon,  9 Nov 2020 00:54:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu/ttm: use multihop
Date: Mon,  9 Nov 2020 10:54:30 +1000
Message-Id: <20201109005432.861936-3-airlied@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 136 +++---------------------
 1 file changed, 13 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ce0d82802333..e1458d575aa9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -512,119 +512,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	return r;
 }
 
-/**
- * amdgpu_move_vram_ram - Copy VRAM buffer to RAM buffer
- *
- * Called by amdgpu_bo_move().
- */
-static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	struct ttm_resource tmp_mem;
-	struct ttm_place placements;
-	struct ttm_placement placement;
-	int r;
-
-	/* create space/pages for new_mem in GTT space */
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
-		pr_err("Failed to find GTT space for blit from VRAM\n");
-		return r;
-	}
-
-	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	/* Bind the memory to the GTT space */
-	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-
-	/* blit VRAM to GTT */
-	r = amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-
-	r = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
-	ttm_bo_assign_mem(bo, new_mem);
-out_cleanup:
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
-/**
- * amdgpu_move_ram_vram - Copy buffer from RAM to VRAM
- *
- * Called by amdgpu_bo_move().
- */
-static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	struct ttm_resource tmp_mem;
-	struct ttm_placement placement;
-	struct ttm_place placements;
-	int r;
-
-	/* make space in GTT for old_mem buffer */
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
-		pr_err("Failed to find GTT space for blit to VRAM\n");
-		return r;
-	}
-
-	/* move/bind old memory to GTT space */
-	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(r))
-		return r;
-
-	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-
-	ttm_bo_assign_mem(bo, &tmp_mem);
-	/* copy to VRAM */
-	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-out_cleanup:
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
 /**
  * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_memcpy
  *
@@ -664,6 +551,17 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
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
 		r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
 		if (r)
@@ -717,16 +615,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		goto memcpy;
 	}
 
-	if (old_mem->mem_type == TTM_PL_VRAM &&
-	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = amdgpu_move_vram_ram(bo, evict, ctx, new_mem);
-	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
-		   new_mem->mem_type == TTM_PL_VRAM) {
-		r = amdgpu_move_ram_vram(bo, evict, ctx, new_mem);
-	} else {
-		r = amdgpu_move_blit(bo, evict,
-				     new_mem, old_mem);
-	}
+	r = amdgpu_move_blit(bo, evict,
+			     new_mem, old_mem);
 
 	if (r) {
 memcpy:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
