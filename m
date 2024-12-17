Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C829F9F5A78
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B50510EAB6;
	Tue, 17 Dec 2024 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/fq+fr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BAA10EAA0;
 Tue, 17 Dec 2024 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478394; x=1766014394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JplUSp29WrW3UM6O8VxUn4up41sDcV4DD/sW3bKpKY=;
 b=J/fq+fr8cnKdxnvkxndeORd6TaTxmH56ICIrSDIna5aD/XUoPTd69Noq
 2K60SZ8NNbsJY7sS5qrXTXWgNu7jWG6oQdiOOPyfwjfqXk0W/CNSnSb6l
 EKiX4mWfwtZbO1Jo2oZkXQplM6sNa7uq5NtY6oaifBeDl2N6RaJPiVwFi
 u1iNWWvg6OcpSxCt4bRWScbgz+gRUbqC+nmHFfoEmNnM1GsuSpBmbFQTW
 M2zvvMoSwdfrlQPfXBm+d6ZjNbLGkkmsUhGyoGwRwlq0wGS+SeDd/CGcf
 AyeD4M7WrnVGWPg+W+7GdwMeU6uoZPJuG3cINZHKPUdsAYVt2yDNcIUqg Q==;
X-CSE-ConnectionGUID: TouWd0XqSGCioRXFuu4Vjw==
X-CSE-MsgGUID: AmDD70PkSjy6l36iXfYfgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517494"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:14 -0800
X-CSE-ConnectionGUID: /XhFO7ioTaKQTIr1gKEmEg==
X-CSE-MsgGUID: ZzQM4lqJRLClIK2adyBPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273465"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 28/30] drm/xe: Add SVM debug
Date: Tue, 17 Dec 2024 15:33:46 -0800
Message-Id: <20241217233348.3519726-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add some useful SVM debug logging fro SVM range which prints the range's
state.

v2:
 - Upadte logging with latest structure layout
v3:
 - Better commit message (Thomas)
 - New range structure (Thomas)
 - s/COLLECTOT/s/COLLECTOR (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c | 95 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h |  2 +
 3 files changed, 96 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9c90dfc81fbe..23a1696a67c0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -647,6 +647,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		/* Move this entire thing to xe_svm.c? */
 		xe_svm_notifier_lock(xe_vma_vm(vma));
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
 			xe_svm_notifier_unlock(xe_vma_vm(vma));
 			return -EAGAIN;
 		}
@@ -655,6 +656,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
 			is_devmem = xe_res_is_vram(&curs);
+			if (is_devmem)
+				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
+			else
+				xe_svm_range_debug(range, "BIND PREPARE - DMA");
 		} else {
 			xe_assert(xe, false);
 		}
@@ -1429,10 +1434,13 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
+		xe_svm_range_debug(range, "PRE-COMMIT");
+
 		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
 		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
 
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
 			xe_svm_notifier_unlock(vm);
 			return -EAGAIN;
 		}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8780a0b2c81e..530ba34a86dc 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,18 @@
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
+static bool xe_svm_range_in_vram(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return range->base.flags.has_devmem_pages;
+}
+
+static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return xe_svm_range_in_vram(range) && range->tile_present;
+}
+
 static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
 {
 	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
@@ -22,6 +34,23 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       (r__)->base.itree.start, (r__)->base.itree.last + 1,	\
+	       (r__)->base.itree.last + 1 - (r__)->base.itree.start)
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+	range_debug(range, operation);
+}
+
 static void *xe_svm_devm_owner(struct xe_device *xe)
 {
 	return xe;
@@ -59,6 +88,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	struct xe_device *xe = vm->xe;
 
+	range_debug(range, "GARBAGE COLLECTOR ADD");
+
 	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
@@ -84,10 +115,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 
 	xe_svm_assert_in_notifier(vm);
 
+	range_debug(range, "NOTIFIER");
+
 	/* Skip if already unmapped or if no binding exist */
 	if (range->base.flags.unmapped || !range->tile_present)
 		return 0;
 
+	range_debug(range, "NOTIFIER - EXECUTE");
+
 	/* Adjust invalidation to range boundaries */
 	if (range->base.itree.start < mmu_range->start)
 		*adj_start = range->base.itree.start;
@@ -140,6 +175,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_svm_assert_in_notifier(vm);
 
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=0x%016llx, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, (u64)gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	if (adj_start < notifier->itree.start)
 		adj_start = notifier->itree.start;
@@ -226,8 +266,12 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
-	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
+	range_debug(range, "GARBAGE COLLECTOR");
+
+	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap) {
+		range_debug(range, "GARBAGE COLLECTOR - EVICT");
 		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	}
 
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
@@ -387,16 +431,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       vram_addr, dma_addr[pos], i - pos + incr);
 					__fence = xe_migrate_from_vram(tile->migrate,
 								       i - pos + incr,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       dma_addr[pos], vram_addr, i - pos + incr);
 					__fence = xe_migrate_to_vram(tile->migrate,
 								     i - pos + incr,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -416,14 +467,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       vram_addr, dma_addr[pos], 1);
 					__fence = xe_migrate_from_vram(tile->migrate, 1,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       dma_addr[pos], vram_addr, 1);
 					__fence = xe_migrate_to_vram(tile->migrate, 1,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -591,12 +649,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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
 	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.itree.last + 1 -
@@ -619,8 +679,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 			       range->base.itree.start);
 
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
 	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
@@ -693,6 +758,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->migrated && range->base.flags.migrate_devmem &&
 	    (range->base.itree.last + 1 - range->base.itree.start) >= SZ_64K) {
@@ -708,18 +775,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 
+	range_debug(range, "GET PAGES");
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP)
+		if (err == -EOPNOTSUPP) {
+			range_debug(range, "PAGE FAULT - EVICT PAGES");
 			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		}
 		drm_info(&vm->xe->drm,
 			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=0x%016llx, errno %d\n",
 			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
+		range_debug(range, "PAGE FAULT - RETRY PAGES");
 		goto retry;
 	}
-	if (err)
+	if (err) {
+		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto err_out;
+	}
+
+	range_debug(range, "PAGE FAULT - BIND");
 
 retry_bind:
 	drm_exec_init(&exec, 0, 0);
@@ -735,8 +810,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
index 9e9d333bb9d3..f9751fb2f0ea 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -56,6 +56,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
-- 
2.34.1

