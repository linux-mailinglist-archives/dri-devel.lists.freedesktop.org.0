Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A22933DF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 06:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C276EC15;
	Tue, 20 Oct 2020 04:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762DC6EC15
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 04:16:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-7jyW-2JqMX-UugahR1S9Kw-1; Tue, 20 Oct 2020 00:16:11 -0400
X-MC-Unique: 7jyW-2JqMX-UugahR1S9Kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC86F1868418;
 Tue, 20 Oct 2020 04:16:10 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69B55D9D2;
 Tue, 20 Oct 2020 04:16:09 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] [RFC/HACK] drm/ttm: avoid multihop moves in drivers.
Date: Tue, 20 Oct 2020 14:16:06 +1000
Message-Id: <20201020041606.1701145-2-airlied@gmail.com>
In-Reply-To: <20201020041606.1701145-1-airlied@gmail.com>
References: <20201020041606.1701145-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 128 +++---------------------
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 106 ++------------------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 110 ++------------------
 drivers/gpu/drm/ttm/ttm_bo.c            |  44 +++++++-
 4 files changed, 77 insertions(+), 311 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 872795affe87..51d55e3fd8c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -515,109 +515,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	return r;
 }
 
-static int amdgpu_move_setup_tt(struct ttm_buffer_object *bo,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *tmp_mem)
-{
-	struct ttm_place placements;
-	struct ttm_placement placement;
-	int r;
-
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = 0;
-	r = ttm_bo_mem_space(bo, &placement, tmp_mem, ctx);
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
-	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
-	return 0;
-out_cleanup:
-	ttm_resource_free(bo, tmp_mem);
-	return r;
-}
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
-	int r;
-
-	/* create space/pages for new_mem in GTT space */
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-
-	r = amdgpu_move_setup_tt(bo, ctx, &tmp_mem);
-	if (unlikely(r))
-		return r;
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
-	int r;
-
-	/* make space in GTT for old_mem buffer */
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-
-	r = amdgpu_move_setup_tt(bo, ctx, &tmp_mem);
-	if (unlikely(r))
-		return r;
-
-	ttm_bo_assign_mem(bo, &tmp_mem);
-	/* copy to VRAM */
-	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
 /**
  * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_memcpy
  *
@@ -656,6 +553,19 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	/* don't go from system->vram in one hop,
+	   report this back to the caller tell it
+	   where to bounce this buffer through. */
+
+	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
+	     new_mem->mem_type == TTM_PL_VRAM) ||
+	    (old_mem->mem_type == TTM_PL_VRAM &&
+	     new_mem->mem_type == TTM_PL_SYSTEM)) {
+		new_mem->mem_type = TTM_PL_TT;
+		new_mem->placement = 0;
+		return -EMULTIHOP;
+	}
+
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
 		if (r)
@@ -709,16 +619,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 038974d9a0d6..c08b3da804fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -862,92 +862,6 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 	NV_INFO(drm, "MM: using %s for buffer copies\n", name);
 }
 
-static int
-nouveau_move_setup_tt(struct ttm_buffer_object *bo,
-		      struct ttm_operation_ctx *ctx,
-		      struct ttm_resource *tmp_reg)
-{
-	struct ttm_place placement_memtype = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_TT,
-		.flags = 0
-	};
-	struct ttm_placement placement;
-	int ret;
-
-	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = placement.busy_placement = &placement_memtype;
-
-	ret = ttm_bo_mem_space(bo, &placement, tmp_reg, ctx);
-	if (ret)
-		return ret;
-
-	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (ret)
-		goto out_cleanup;
-
-	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, tmp_reg);
-	if (ret)
-		goto out_cleanup;
-	return 0;
-out_cleanup:
-	ttm_resource_free(bo, tmp_reg);
-	return ret;
-}
-
-static int
-nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
-		      struct ttm_operation_ctx *ctx,
-		      struct ttm_resource *new_reg)
-{
-	struct ttm_resource tmp_reg;
-	int ret;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-
-	ret = nouveau_move_setup_tt(bo, ctx, &tmp_reg);
-	if (ret)
-		return ret;
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
-	struct ttm_resource tmp_reg;
-	int ret;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-
-	ret = nouveau_move_setup_tt(bo, ctx, &tmp_reg);
-	if (ret)
-		return ret;
-
-	ttm_bo_assign_mem(bo, &tmp_reg);
-	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
-	ttm_resource_free(bo, &tmp_reg);
-	return ret;
-}
-
 static void
 nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
 		     struct ttm_resource *new_reg)
@@ -1028,6 +942,15 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
+	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
+	     new_reg->mem_type == TTM_PL_VRAM) ||
+	    (old_reg->mem_type == TTM_PL_VRAM &&
+	     new_reg->mem_type == TTM_PL_SYSTEM)) {
+		new_reg->mem_type = TTM_PL_TT;
+		new_reg->placement = 0;
+		return -EMULTIHOP;
+	}
+	
 	if (new_reg->mem_type == TTM_PL_TT) {
 		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
 		if (ret)
@@ -1070,15 +993,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
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
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index efe5046e3268..d36321b699e0 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -207,94 +207,6 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 	return r;
 }
 
-static int radeon_move_setup_tt(struct ttm_buffer_object *bo,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *tmp_mem)
-{
-	struct ttm_place placements;
-	struct ttm_placement placement;
-	int r;
-
-	placement.num_placement = 1;
-	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = 0;
-	placements.mem_type = TTM_PL_TT;
-	placements.flags = 0;
-
-	r = ttm_bo_mem_space(bo, &placement, tmp_mem, ctx);
-	if (unlikely(r))
-		return r;
-
-	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(r))
-		goto out_cleanup;
-
-	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, tmp_mem);
-	if (unlikely(r))
-		goto out_cleanup;
-	return 0;
-out_cleanup:
-	ttm_resource_free(bo, tmp_mem);
-	return r;
-}
-
-static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
-				bool evict,
-				struct ttm_operation_ctx *ctx,
-				struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	struct ttm_resource tmp_mem;
-	int r;
-
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-
-	r = radeon_move_setup_tt(bo, ctx, &tmp_mem);
-	if (unlikely(r))
-		return r;
-
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
-	int r;
-
-	tmp_mem = *new_mem;
-	tmp_mem.mm_node = NULL;
-
-	r = radeon_move_setup_tt(bo, ctx, &tmp_mem);
-	if (unlikely(r))
-		return r;
-
-	ttm_bo_assign_mem(bo, &tmp_mem);
-	r = radeon_move_blit(bo, true, new_mem, old_mem);
-	ttm_resource_free(bo, &tmp_mem);
-	return r;
-}
-
 static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 			  struct ttm_operation_ctx *ctx,
 			  struct ttm_resource *new_mem)
@@ -304,6 +216,15 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
+	     new_mem->mem_type == TTM_PL_VRAM) ||
+	    (old_mem->mem_type == TTM_PL_VRAM &&
+	     new_mem->mem_type == TTM_PL_SYSTEM)) {
+		new_mem->mem_type = TTM_PL_TT;
+		new_mem->placement = 0;
+		return -EMULTIHOP;
+	}
+
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
 		if (r)
@@ -344,17 +265,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
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
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9b2be4e44bea..f4a6d5f29be8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -260,8 +260,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	}
 
 	ret = bdev->driver->move(bo, evict, ctx, mem);
-	if (ret)
+	if (ret) {
+		if (ret == -EMULTIHOP)
+			return ret;
 		goto out_err;
+	}
 
 	ctx->bytes_moved += bo->mem.num_pages << PAGE_SHIFT;
 	return 0;
@@ -936,6 +939,33 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
 
+static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
+				     struct ttm_resource *mem,
+				     struct ttm_operation_ctx *ctx)
+{
+	struct ttm_place placement_memtype = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = mem->mem_type,
+		.flags = mem->placement,
+	};
+	struct ttm_placement bounce_placement;
+	int ret;
+
+	bounce_placement.num_placement = bounce_placement.num_busy_placement = 1;
+	bounce_placement.placement = bounce_placement.busy_placement = &placement_memtype;
+
+	/* find space in the bounce domain */
+	ret = ttm_bo_mem_space(bo, &bounce_placement, mem, ctx);
+	if (ret)
+		return ret;
+	/* move to the bounce domain */
+	ret = ttm_bo_handle_move_mem(bo, mem, false, ctx);
+	if (ret)
+		return ret;
+	return 0;
+}
+
 static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 			      struct ttm_placement *placement,
 			      struct ttm_operation_ctx *ctx)
@@ -954,11 +984,18 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	/*
 	 * Determine where to move the buffer.
 	 */
+bounce:
 	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
 	if (ret)
-		goto out_unlock;
+		return ret;
 	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx);
-out_unlock:
+	if (ret == -EMULTIHOP) {
+		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx);
+		if (ret)
+			return ret;
+		/* try and move to final place now. */
+		goto bounce;
+	}
 	if (ret)
 		ttm_resource_free(bo, &mem);
 	return ret;
@@ -1478,4 +1515,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
-
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
