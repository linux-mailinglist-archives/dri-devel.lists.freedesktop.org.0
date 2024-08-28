Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC4961C58
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A7010E479;
	Wed, 28 Aug 2024 02:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3Mu/Y70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A12010E450;
 Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813291; x=1756349291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJEAfp1tAgOY2YyFFIOULX7IqCWYUTyYRhmsLRAPbpA=;
 b=n3Mu/Y70nrdfZLSZEDsSZ/t2jRqfmVNpmS6EImTnR6t1ZbvdjmsE8pvn
 9o5UarqQhEwrqkFtZXoabg8QiucKenlLFMViuq34ayqZOBIahgIMh0X9G
 fndzRJW2Loi1SjDEXtE/Bjr3a2+xaIDzSXNk3SCUVJYYomQL0Zx2AfSYA
 pwrItubalukAw7NVZygm0t5oxpLji6fck4RaI380k+bD2qAM7CFL6C7cX
 Vn9f9uktPiaSa5+3Dszez8qJrzPmuoEwqwYmzOxjda4HE5JGLyhEcal0O
 HRIOdPne2cJgwNF8Lrmm2ieaTHsq0of5k5LgA49NBo0SrPEy9EDLe7aEV A==;
X-CSE-ConnectionGUID: q9sTCFGNQE+PbBV2OHewyg==
X-CSE-MsgGUID: JI7mXSB/QPOo7nkawVSzoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251950"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
X-CSE-ConnectionGUID: M6MbO7anTYSV9n87pELQWg==
X-CSE-MsgGUID: lFFscOVAQ7SSZcaCASAqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224671"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 25/28] drm/xe: Add SVM debug
Date: Tue, 27 Aug 2024 19:48:58 -0700
Message-Id: <20240828024901.2582335-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add some useful SVM debug logging.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 13 ++++--
 drivers/gpu/drm/xe/xe_svm.c | 93 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h |  2 +
 3 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e9195029ea60..e31af84ceb32 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -678,16 +678,20 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	xe_bo_assert_held(bo);
 
 	if (range) {
-		if (is_devmem)
+		if (is_devmem) {
+			xe_svm_range_debug(range, "BIND PREPARE - VRAM");
 			xe_res_first(bo->ttm.resource, 0,
 				     range->base.va.end - range->base.va.start,
 				     &curs);
-		else if (xe_svm_range_has_dma_mapping(range))
+		} else if (xe_svm_range_has_dma_mapping(range)) {
+			xe_svm_range_debug(range, "BIND PREPARE - DMA");
 			xe_res_first_dma(range->base.dma_addr, 0,
 					 range->base.va.end - range->base.va.start,
 					 range->base.order, &curs);
-		else
+		} else {
+			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
 			return -EAGAIN;	/* Invalidation corner case */
+		}
 	} else if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
@@ -1387,10 +1391,13 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
+		xe_svm_range_debug(range, "PRE-COMMIT");
+
 		xe_assert(vm->xe, xe_vma_is_system_allocator(op->map_range.vma));
 		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
 
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
 			xe_svm_notifier_unlock(vm);
 			return -EAGAIN;
 		}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index dc9810828c0a..f9c2bffd1783 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -24,6 +24,23 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d,%d, seqno=%lu, order=%u, start=0x%014llx, end=0x%014llx, size=%llu",	\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       (r__)->base.vram_allocation ? 1 : 0,			\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq, (r__)->base.order,		\
+	       (r__)->base.va.start, (r__)->base.va.end,		\
+	       (r__)->base.va.end - (r__)->base.va.start)
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+	range_debug(range, operation);
+}
+
 static void *xe_svm_devm_owner(struct xe_device *xe)
 {
 	return xe;
@@ -61,6 +78,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	struct xe_device *xe = vm->xe;
 
+	range_debug(range, "GARBAGE COLLECTOR ADD");
+
 	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
@@ -84,10 +103,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	u8 tile_mask = 0;
 	u8 id;
 
+	range_debug(range, "NOTIFIER");
+
 	/* Skip if already unmapped or if no binding exist */
 	if (range->base.flags.unmapped || !range->tile_present)
 		return 0;
 
+	range_debug(range, "NOTIFIER - EXECUTE");
+
 	/* Adjust invalidation to range boundaries */
 	if (range->base.va.start < mmu_range->start)
 		*adj_start = range->base.va.start;
@@ -136,6 +159,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	u32 fence_id = 0;
 	long err;
 
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=0x%016llx, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, (u64)gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	if (adj_start < notifier->interval.start)
 		adj_start = notifier->interval.start;
@@ -220,9 +248,13 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	struct drm_gpusvm_ctx ctx = {};
 	struct dma_fence *fence;
 
+	range_debug(range, "GARBAGE COLLECTOR");
+
 	/* Evict any pages holding references to vram allocation */
-	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
+	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe)) {
+		range_debug(range, "GARBAGE COLLECTOR - EVICT");
 		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm, &range->base, &ctx);
+	}
 
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
@@ -358,16 +390,25 @@ static int xe_svm_copy(struct drm_gpusvm *gpusvm, struct page **pages,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld, asid=%u, gpusvm=0x%016llx",
+					       vram_addr, dma_addr[pos], i - pos + incr,
+					       vm->usm.asid, (u64)gpusvm);
 					__fence = xe_migrate_from_vram(tile->migrate,
 								       i - pos + incr,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld, asid=%u, gpusvm=0x%016llx",
+					       dma_addr[pos], vram_addr, i - pos + incr,
+					       vm->usm.asid, (u64)gpusvm);
 					__fence = xe_migrate_to_vram(tile->migrate,
 								     i - pos + incr,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -385,14 +426,23 @@ static int xe_svm_copy(struct drm_gpusvm *gpusvm, struct page **pages,
 			}
 
 			if (!match && last && dma_addr[i]) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d, asid=%u, gpusvm=0x%016llx",
+					       vram_addr, dma_addr[pos], 1,
+					       vm->usm.asid, (u64)gpusvm);
 					__fence = xe_migrate_from_vram(tile->migrate, 1,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d, asid=%u, gpusvm=0x%016llx",
+					       dma_addr[pos], vram_addr, 1,
+					       vm->usm.asid, (u64)gpusvm);
 					__fence = xe_migrate_to_vram(tile->migrate, 1,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -519,12 +569,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 				       const struct drm_gpusvm_ctx *ctx)
 {
 	struct xe_mem_region *mr = tile_to_mr(tile);
+	struct drm_buddy *buddy = tile_to_buddy(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
 	ktime_t end = 0;
 	int err;
 
+	range_debug(range, "ALLOCATE VRAM");
 retry:
 	xe_vm_lock(vm, false);
 	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.va.end -
@@ -542,8 +594,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	}
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-	list_for_each_entry(block, blocks, link)
+	list_for_each_entry(block, blocks, link) {
+		vm_dbg(&vm->xe->drm, "ALLOC VRAM: asid=%u, gpusvm=0x%016llx, pfn=%llu, npages=%llu",
+		       vm->usm.asid, (u64)&vm->svm.gpusvm,
+		       block_offset_to_pfn(mr, drm_buddy_block_offset(block)),
+		       drm_buddy_block_size(buddy, block) >> PAGE_SHIFT);
 		block->private = mr;
+	}
 
 	/*
 	 * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
@@ -597,6 +654,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (IS_DGFX(vm->xe) && !range->migrated &&
 	    range->base.flags.migrate_vram &&
@@ -606,18 +665,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (IS_ERR(bo)) {
 			drm_info(&vm->xe->drm,
-				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %ld\n",
-				 vm->usm.asid, PTR_ERR(bo));
+				 "VRAM allocation failed, falling back to retrying, asid=%u, gpusvm=0x%016llx, errno %ld\n",
+				 vm->usm.asid, (u64)&vm->svm.gpusvm,
+				 PTR_ERR(bo));
 			bo = NULL;
 			goto retry;
 		}
 	}
 
+	range_debug(range, "GET PAGES");
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
-	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
-	       goto retry;
-	if (err)
+	if (err == -EFAULT || err == -EPERM) {	/* Corner where CPU mappings have change */
+		range_debug(range, "PAGE FAULT - RETRY PAGES");
+		goto retry;
+	}
+	if (err) {
+		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto err_out;
+	}
+
+	range_debug(range, "PAGE FAULT - BIND");
 
 retry_bind:
 	drm_exec_init(&exec, 0, 0);
@@ -633,8 +700,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		if (IS_ERR(fence)) {
 			drm_exec_fini(&exec);
 			err = PTR_ERR(fence);
-			if (err == -EAGAIN)
+			if (err == -EAGAIN) {
+				range_debug(range, "PAGE FAULT - RETRY BIND");
 				goto retry;
+			}
 			if (xe_vm_validate_should_retry(&exec, err, &end))
 				goto retry_bind;
 			goto err_out;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b9cf0e2500da..1ea5d29a6868 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -31,6 +31,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic);
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
-- 
2.34.1

