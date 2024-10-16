Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4199FF72
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30210E686;
	Wed, 16 Oct 2024 03:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeKXGLtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551110E660;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKwLBqEyfJNmdEtNiy8jm8jT+LKZefPLb51F7dQECMQ=;
 b=jeKXGLtJXwNgr+ZAi9U6hsqU4B6HPqEjTMVu1gd3LR+d3RAzoewn1QgS
 pP4RcFjV/6D8B9TDC32BID7PBt7AhSDO24a+C5we2fEJPdZwgRcgMhABj
 s7a/Q1KzfIuDLNsdsHNqfPyKeFPBa7k1R95k0Or0drjyjiG8NUP6/hrK5
 /HRdqP1cfcRB5y9ineJn0kBlBQ9v3iKfqTfEncJw/gGphg7FL6wHY9ZrQ
 Hs4mNpRBrKAHrMbnTQkDPX/7fhHmQZrOMO7OEAMSibjh3w4oevDdbxaSj
 0JrwTka0ypCAMpBWrAqJHSR2imdHhr2NJynWVdcTrPciHSgnkKn4ttz6n A==;
X-CSE-ConnectionGUID: BYfQwCheSzy52DMnIgJKWw==
X-CSE-MsgGUID: xwaet/iRRlGNcjBETB43iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056484"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: vBKJE3MmRsGylytTyMA/Tg==
X-CSE-MsgGUID: HzXoCRyISxelfRXOwd30xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930278"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 26/29] drm/xe: Add SVM debug
Date: Tue, 15 Oct 2024 20:25:15 -0700
Message-Id: <20241016032518.539495-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

v2:
 - Upadte logging with latest structure layout

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  |   8 +++
 drivers/gpu/drm/xe/xe_svm.c | 101 +++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h |   2 +
 3 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 687abd1a5e74..75f548ebe2b3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -632,6 +632,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		/* Move this entire thing to xe_svm.c? */
 		xe_svm_notifier_lock(xe_vma_vm(vma));
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
 			xe_svm_notifier_unlock(xe_vma_vm(vma));
 			return -EAGAIN;
 		}
@@ -640,6 +641,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 					 range->base.va.end - range->base.va.start,
 					 &curs);
 			is_devmem = xe_res_is_vram(&curs);
+			if (is_devmem)
+				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
+			else
+				xe_svm_range_debug(range, "BIND PREPARE - DMA");
 		} else {
 			xe_assert(xe, false);
 		}
@@ -1397,10 +1402,13 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
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
index 555bc71ae523..acf2a3750f38 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -14,6 +14,18 @@
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
@@ -24,6 +36,23 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014llx, end=0x%014llx, size=%llu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
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
@@ -61,6 +90,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	struct xe_device *xe = vm->xe;
 
+	range_debug(range, "GARBAGE COLLECTOR ADD");
+
 	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
@@ -84,10 +115,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
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
@@ -139,6 +174,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	if (xe_vm_is_closed(vm))
 		return;
 
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=0x%016llx, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, (u64)gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	if (adj_start < notifier->interval.start)
 		adj_start = notifier->interval.start;
@@ -218,8 +258,12 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
-	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
+	range_debug(range, "GARBAGE COLLECTOR");
+
+	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap) {
+		range_debug(range, "GARBAGE COLLECTOT - EVICT");
 		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	}
 
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
@@ -350,16 +394,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != VRAM_ADDR_INVALID) {
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
@@ -377,14 +428,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			}
 
 			if (!match && last && dma_addr[i] && spage) {
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
@@ -554,12 +612,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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
@@ -582,8 +642,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 			       range->base.va.start);
 
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
@@ -637,6 +702,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (IS_DGFX(vm->xe) && !range->migrated &&
 	    range->base.flags.migrate_devmem &&
@@ -646,25 +713,33 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	/* Corner where CPU mappings have change */
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
@@ -680,8 +755,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
index 5b9d5ac9ef72..139acee41b42 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -36,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic);
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
-- 
2.34.1

