Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C91B89A1B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5F10E9F9;
	Fri, 19 Sep 2025 13:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GO37Y0PK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7CD10E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qkh2fqAneFLY07YdB0pWE5a3KxFbGfZiQPA4iA4d2lg=; b=GO37Y0PKaDnZX+/7Mp1xLriCTR
 IOPR7rF1y4XdAV0atT6GhB1jgMt+lXxWlgLDF5rd7cGvvEZcehX/YNpiOTDys0AUPoSFn1igH+YJS
 JPNFh5ttdzqoK6+9idKPv8ivJttzZUzQ3S1cId4XqnaJX5T4MdsVjuULqVaLS4HysGG+jazK09dEw
 pujCcJJcIbBkHOLMmmHY20Sc5uvCf0HRTHxffyvcljb8fxZ8o9sA1+ZdAGn3mGOrVFezsnpMiHwWM
 aGAmtK53yRzI8e/ywb1jzPHznvDGp6t67yWCdT2pZAi7dZYX7VpUybiNmkpKLuV/Al8GSTvj37Gpu
 ASNc1hWA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzaxg-00E6Nv-Pe; Fri, 19 Sep 2025 15:15:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 4/4] drm/ttm: Tidy usage of local variables a little bit
Date: Fri, 19 Sep 2025 14:15:30 +0100
Message-ID: <20250919131530.91247-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the moment the TTM code has a few places which exibit sub-optimal
patterns regarding local variable usage:

 * Having a local with some object cached but not always using it.
 * Having a local for a single use object member access.
 * Failed opportunities to use a local to cache a pointer.

Lets tidy this a little bit and apply some more consistency.

It is mostly for consistency and redability but I have also checked that
there are not negative code generation effects. In fact there are more
positives:

add/remove: 0/0 grow/shrink: 3/9 up/down: 12/-175 (-163)
Function                                     old     new   delta
ttm_pool_restore_and_alloc                   415     423      +8
ttm_bo_vunmap                                147     149      +2
ttm_bo_evict                                 521     523      +2
ttm_bo_vm_fault_reserved                     972     970      -2
ttm_bo_vm_dummy_page                         155     152      -3
ttm_bo_vm_fault                              203     196      -7
ttm_bo_populate                              158     150      -8
ttm_bo_move_memcpy                           600     592      -8
ttm_bo_kmap                                  667     644     -23
ttm_bo_shrink                                333     305     -28
ttm_bo_release                               750     720     -30
ttm_bo_swapout_cb                            691     625     -66
Total: Before=42717, After=42554, chg -0.38%

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 62 +++++++++++++++---------------
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 47 +++++++++++-----------
 drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
 drivers/gpu/drm/ttm/ttm_pool.c     | 26 +++++++------
 drivers/gpu/drm/ttm/ttm_resource.c |  6 +--
 5 files changed, 77 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e5f5d4aa5a47..942dd480704b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -266,8 +266,8 @@ static void ttm_bo_release(struct kref *kref)
 					      30 * HZ);
 		}
 
-		if (bo->bdev->funcs->release_notify)
-			bo->bdev->funcs->release_notify(bo);
+		if (bdev->funcs->release_notify)
+			bdev->funcs->release_notify(bo);
 
 		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
 		ttm_mem_io_free(bdev, bo->resource);
@@ -281,7 +281,7 @@ static void ttm_bo_release(struct kref *kref)
 			ttm_bo_flush_all_fences(bo);
 			bo->deleted = true;
 
-			spin_lock(&bo->bdev->lru_lock);
+			spin_lock(&bdev->lru_lock);
 
 			/*
 			 * Make pinned bos immediately available to
@@ -297,7 +297,7 @@ static void ttm_bo_release(struct kref *kref)
 			}
 
 			kref_init(&bo->kref);
-			spin_unlock(&bo->bdev->lru_lock);
+			spin_unlock(&bdev->lru_lock);
 
 			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
 
@@ -358,7 +358,6 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 static int ttm_bo_evict(struct ttm_buffer_object *bo,
 			struct ttm_operation_ctx *ctx)
 {
-	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource *evict_mem;
 	struct ttm_placement placement;
 	struct ttm_place hop;
@@ -369,7 +368,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	dma_resv_assert_held(bo->base.resv);
 
 	placement.num_placement = 0;
-	bdev->funcs->evict_flags(bo, &placement);
+	bo->bdev->funcs->evict_flags(bo, &placement);
 
 	if (!placement.num_placement) {
 		ret = ttm_bo_wait_ctx(bo, ctx);
@@ -422,16 +421,16 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
 	struct ttm_resource *res = bo->resource;
-	struct ttm_device *bdev = bo->bdev;
 
 	dma_resv_assert_held(bo->base.resv);
-	if (bo->resource->mem_type == TTM_PL_SYSTEM)
+
+	if (res->mem_type == TTM_PL_SYSTEM)
 		return true;
 
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	return ttm_resource_intersects(bdev, res, place, bo->base.size);
+	return ttm_resource_intersects(bo->bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
@@ -1105,10 +1104,13 @@ struct ttm_bo_swapout_walk {
 static s64
 ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct ttm_resource *res = bo->resource;
+	struct ttm_place place = { .mem_type = res->mem_type };
 	struct ttm_bo_swapout_walk *swapout_walk =
 		container_of(walk, typeof(*swapout_walk), walk);
 	struct ttm_operation_ctx *ctx = walk->arg.ctx;
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_tt *tt = bo->ttm;
 	s64 ret;
 
 	/*
@@ -1117,20 +1119,19 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	 * The driver may use the fact that we're moving from SYSTEM
 	 * as an indication that we're about to swap out.
 	 */
-	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, &place)) {
+	if (bo->pin_count || !bdev->funcs->eviction_valuable(bo, &place)) {
 		ret = -EBUSY;
 		goto out;
 	}
 
-	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
-	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
-	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
+	if (!tt || !ttm_tt_is_populated(tt) ||
+	    tt->page_flags & (TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_SWAPPED)) {
 		ret = -EBUSY;
 		goto out;
 	}
 
 	if (bo->deleted) {
-		pgoff_t num_pages = bo->ttm->num_pages;
+		pgoff_t num_pages = tt->num_pages;
 
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
@@ -1144,7 +1145,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	/*
 	 * Move to system cached
 	 */
-	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
+	if (res->mem_type != TTM_PL_SYSTEM) {
 		struct ttm_resource *evict_mem;
 		struct ttm_place hop;
 
@@ -1171,21 +1172,21 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 		goto out;
 
 	ttm_bo_unmap_virtual(bo);
-	if (bo->bdev->funcs->swap_notify)
-		bo->bdev->funcs->swap_notify(bo);
+	if (bdev->funcs->swap_notify)
+		bdev->funcs->swap_notify(bo);
 
-	if (ttm_tt_is_populated(bo->ttm)) {
-		spin_lock(&bo->bdev->lru_lock);
-		ttm_resource_del_bulk_move(bo->resource, bo);
-		spin_unlock(&bo->bdev->lru_lock);
+	if (ttm_tt_is_populated(tt)) {
+		spin_lock(&bdev->lru_lock);
+		ttm_resource_del_bulk_move(res, bo);
+		spin_unlock(&bdev->lru_lock);
 
-		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
+		ret = ttm_tt_swapout(bdev, tt, swapout_walk->gfp_flags);
 
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(&bdev->lru_lock);
 		if (ret)
-			ttm_resource_add_bulk_move(bo->resource, bo);
-		ttm_resource_move_to_lru_tail(bo->resource);
-		spin_unlock(&bo->bdev->lru_lock);
+			ttm_resource_add_bulk_move(res, bo);
+		ttm_resource_move_to_lru_tail(res);
+		spin_unlock(&bdev->lru_lock);
 	}
 
 out:
@@ -1258,6 +1259,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 int ttm_bo_populate(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx)
 {
+	struct ttm_device *bdev = bo->bdev;
 	struct ttm_tt *tt = bo->ttm;
 	bool swapped;
 	int ret;
@@ -1268,16 +1270,16 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 		return 0;
 
 	swapped = ttm_tt_is_swapped(tt);
-	ret = ttm_tt_populate(bo->bdev, tt, ctx);
+	ret = ttm_tt_populate(bdev, tt, ctx);
 	if (ret)
 		return ret;
 
 	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count &&
 	    bo->resource) {
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(&bdev->lru_lock);
 		ttm_resource_add_bulk_move(bo->resource, bo);
 		ttm_resource_move_to_lru_tail(bo->resource);
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(&bdev->lru_lock);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 94a72db76f52..2772d34001fb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -174,13 +174,13 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 
 	dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
 	if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
-		dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm);
+		dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, ttm);
 	if (IS_ERR(dst_iter))
 		return PTR_ERR(dst_iter);
 
 	src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
 	if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
-		src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm);
+		src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, ttm);
 	if (IS_ERR(src_iter)) {
 		ret = PTR_ERR(src_iter);
 		goto out_src_iter;
@@ -318,11 +318,11 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 {
 	struct ttm_resource *mem = bo->resource;
 
-	if (bo->resource->bus.addr) {
+	if (mem->bus.addr) {
 		map->bo_kmap_type = ttm_bo_map_premapped;
-		map->virtual = ((u8 *)bo->resource->bus.addr) + offset;
+		map->virtual = ((u8 *)mem->bus.addr) + offset;
 	} else {
-		resource_size_t res = bo->resource->bus.offset + offset;
+		resource_size_t res = mem->bus.offset + offset;
 
 		map->bo_kmap_type = ttm_bo_map_iomap;
 		if (mem->bus.caching == ttm_write_combined)
@@ -346,7 +346,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 	struct ttm_operation_ctx ctx = { };
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource_manager *man =
-			ttm_manager_type(bo->bdev, bo->resource->mem_type);
+			ttm_manager_type(bo->bdev, mem->mem_type);
 	pgprot_t prot;
 	int ret;
 
@@ -425,20 +425,21 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 		unsigned long start_page, unsigned long num_pages,
 		struct ttm_bo_kmap_obj *map)
 {
+	struct ttm_resource *res = bo->resource;
 	unsigned long offset, size;
 	int ret;
 
 	map->virtual = NULL;
 	map->bo = bo;
-	if (num_pages > PFN_UP(bo->resource->size))
+	if (num_pages > PFN_UP(res->size))
 		return -EINVAL;
-	if ((start_page + num_pages) > PFN_UP(bo->resource->size))
+	if ((start_page + num_pages) > PFN_UP(res->size))
 		return -EINVAL;
 
-	ret = ttm_mem_io_reserve(bo->bdev, bo->resource);
+	ret = ttm_mem_io_reserve(bo->bdev, res);
 	if (ret)
 		return ret;
-	if (!bo->resource->bus.is_iomem) {
+	if (!res->bus.is_iomem) {
 		return ttm_bo_kmap_ttm(bo, start_page, num_pages, map);
 	} else {
 		offset = start_page << PAGE_SHIFT;
@@ -575,7 +576,7 @@ void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		iounmap(map->vaddr_iomem);
 	iosys_map_clear(map);
 
-	ttm_mem_io_free(bo->bdev, bo->resource);
+	ttm_mem_io_free(bo->bdev, mem);
 }
 EXPORT_SYMBOL(ttm_bo_vunmap);
 
@@ -638,10 +639,9 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 				       struct dma_fence *fence)
 {
-	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *from;
 
-	from = ttm_manager_type(bdev, bo->resource->mem_type);
+	from = ttm_manager_type(bo->bdev, bo->resource->mem_type);
 
 	/**
 	 * BO doesn't have a TTM we need to bind/unbind. Just remember
@@ -713,8 +713,8 @@ EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem)
 {
-	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *man =
+		ttm_manager_type(bo->bdev, new_mem->mem_type);
 	int ret;
 
 	ret = ttm_bo_wait_free_node(bo, man->use_tt);
@@ -818,13 +818,12 @@ static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
 				   struct ttm_buffer_object *bo)
 {
 	struct ttm_lru_walk_arg *arg = curs->arg;
-	struct dma_resv *resv = bo->base.resv;
 	int ret;
 
 	if (arg->ctx->interruptible)
-		ret = dma_resv_lock_interruptible(resv, arg->ticket);
+		ret = dma_resv_lock_interruptible(bo->base.resv, arg->ticket);
 	else
-		ret = dma_resv_lock(resv, arg->ticket);
+		ret = dma_resv_lock(bo->base.resv, arg->ticket);
 
 	if (!ret) {
 		curs->needs_unlock = true;
@@ -1068,7 +1067,7 @@ long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		.num_placement = 1,
 		.placement = &sys_placement_flags,
 	};
-	struct ttm_tt *tt = bo->ttm;
+	struct ttm_device *bdev = bo->bdev;
 	long lret;
 
 	dma_resv_assert_held(bo->base.resv);
@@ -1090,19 +1089,19 @@ long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		return lret;
 
 	if (bo->bulk_move) {
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(&bdev->lru_lock);
 		ttm_resource_del_bulk_move(bo->resource, bo);
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(&bdev->lru_lock);
 	}
 
-	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+	lret = ttm_tt_backup(bdev, bo->ttm, (struct ttm_backup_flags)
 			     {.purge = flags.purge,
 			      .writeback = flags.writeback});
 
 	if (lret <= 0 && bo->bulk_move) {
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(&bdev->lru_lock);
 		ttm_resource_add_bulk_move(bo->resource, bo);
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(&bdev->lru_lock);
 	}
 
 	if (lret < 0 && lret != -EINTR)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b47020fca199..772e1193b0c8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -186,7 +186,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct ttm_device *bdev = bo->bdev;
 	unsigned long page_offset;
 	unsigned long page_last;
 	unsigned long pfn;
@@ -205,7 +204,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	if (unlikely(ret != 0))
 		return ret;
 
-	err = ttm_mem_io_reserve(bdev, bo->resource);
+	err = ttm_mem_io_reserve(bo->bdev, bo->resource);
 	if (unlikely(err != 0))
 		return VM_FAULT_SIGBUS;
 
@@ -293,7 +292,6 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
 	unsigned long address;
 	unsigned long pfn;
@@ -305,7 +303,8 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
 		return VM_FAULT_OOM;
 
 	/* Set the page to be freed using drmm release action */
-	if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
+	if (drmm_add_action_or_reset(bo->base.dev, ttm_bo_release_dummy_page,
+				     page))
 		return VM_FAULT_OOM;
 
 	pfn = page_to_pfn(page);
@@ -322,10 +321,9 @@ EXPORT_SYMBOL(ttm_bo_vm_dummy_page);
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret;
+	pgprot_t prot;
 	int idx;
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
@@ -333,7 +331,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 		return ret;
 
 	prot = vma->vm_page_prot;
-	if (drm_dev_enter(ddev, &idx)) {
+	if (drm_dev_enter(bo->base.dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index baf27c70a419..c5eb2e28ca9d 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -836,32 +836,34 @@ EXPORT_SYMBOL(ttm_pool_alloc);
 int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 			       const struct ttm_operation_ctx *ctx)
 {
+	struct ttm_pool_tt_restore *restore = tt->restore;
 	struct ttm_pool_alloc_state alloc;
 
 	if (WARN_ON(!ttm_tt_is_backed_up(tt)))
 		return -EINVAL;
 
-	if (!tt->restore) {
+	if (!restore) {
 		gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
 
 		ttm_pool_alloc_state_init(tt, &alloc);
 		if (ctx->gfp_retry_mayfail)
 			gfp |= __GFP_RETRY_MAYFAIL;
 
-		tt->restore = kzalloc(sizeof(*tt->restore), gfp);
-		if (!tt->restore)
+		restore = kzalloc(sizeof(*restore), gfp);
+		if (!restore)
 			return -ENOMEM;
 
-		tt->restore->snapshot_alloc = alloc;
-		tt->restore->pool = pool;
-		tt->restore->restored_pages = 1;
-	} else {
-		struct ttm_pool_tt_restore *restore = tt->restore;
-		int ret;
+		restore->snapshot_alloc = alloc;
+		restore->pool = pool;
+		restore->restored_pages = 1;
 
+		tt->restore = restore;
+	} else {
 		alloc = restore->snapshot_alloc;
-		if (ttm_pool_restore_valid(tt->restore)) {
-			ret = ttm_pool_restore_commit(restore, tt->backup, ctx, &alloc);
+		if (ttm_pool_restore_valid(restore)) {
+			int ret = ttm_pool_restore_commit(restore, tt->backup,
+							  ctx, &alloc);
+
 			if (ret)
 				return ret;
 		}
@@ -869,7 +871,7 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 			return 0;
 	}
 
-	return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt->restore);
+	return __ttm_pool_alloc(pool, tt, ctx, &alloc, restore);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 55ce363a73ae..c7025ca02dd8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -611,11 +611,11 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
 			       struct ttm_lru_item *next_lru)
 {
 	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
-	struct ttm_lru_bulk_move *bulk = NULL;
-	struct ttm_buffer_object *bo = next->bo;
+	struct ttm_lru_bulk_move *bulk;
 
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
-	bulk = bo->bulk_move;
+
+	bulk = next->bo->bulk_move;
 
 	if (cursor->bulk != bulk) {
 		if (bulk) {
-- 
2.48.0

