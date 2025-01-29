Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87637A224CC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6331110E885;
	Wed, 29 Jan 2025 19:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaGVs4rY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33C10E8A7;
 Wed, 29 Jan 2025 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180287; x=1769716287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2Fd8WJ8lZTh8Za8SwurnPFoA3J2xJJSCQ0Y1WHKePg=;
 b=IaGVs4rYQJ3OOKY04qtfY91kQw9Mv4lmNtyCzD5FPJZQ+VNALXjVY1gY
 XZp/xHYCRyIglQscNMZDBKILfcrNpy0oEKJPRRoDPIyk4/mgdCXRlJTjp
 fGZAvC6p4ch97xsEJRH6QQCAQZ64KwQxMcEr6HuoN8jnGU6zrjQ8WqGmI
 IbbxTFT4K718dCoNf57QszsENM7cGkAz0wouBwARHCJy8rAuDLm5UTvtd
 iG5QGZaM984/vv5kFcdquWn9PGn2NZkf124jPbxxSm01XfSay22Zg8v0h
 smIUk6lWBL5cO47aa12A1OG0YGZaFPiidpgQq6+ZVvTCcNUKUKxXLqedu w==;
X-CSE-ConnectionGUID: vs+D5Ku5TvigGt6QfNNadg==
X-CSE-MsgGUID: o/WyIOL1RLaGGkwAUGkYBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132890"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:26 -0800
X-CSE-ConnectionGUID: H0MTqyBUQ5G0PKq5XkKoqA==
X-CSE-MsgGUID: Dnu8eHVvRsqbGZDca5CM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392201"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 30/33] drm/xe: Add SVM debug
Date: Wed, 29 Jan 2025 11:52:09 -0800
Message-Id: <20250129195212.745731-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
v4:
 - Drop partial evict message (Thomas)
 - Use %p for pointers print (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c | 91 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h |  2 +
 3 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f8d06c70f77d..29ade504e1c1 100644
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
index dafc5061eb42..0df924ca8ed1 100644
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
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
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
+	       "INVALIDATE: asid=%u, gpusvm=%p, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	if (adj_start < notifier->itree.start)
 		adj_start = notifier->itree.start;
@@ -226,6 +266,8 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
+	range_debug(range, "GARBAGE COLLECTOR");
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -385,16 +427,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
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
@@ -414,14 +463,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
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
@@ -591,12 +647,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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
@@ -619,8 +677,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 			       range->base.itree.start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-	list_for_each_entry(block, blocks, link)
+	list_for_each_entry(block, blocks, link) {
+		vm_dbg(&vm->xe->drm, "ALLOC VRAM: asid=%u, gpusvm=%p, pfn=%llu, npages=%llu",
+		       vm->usm.asid, &vm->svm.gpusvm,
+		       block_offset_to_pfn(mr, drm_buddy_block_offset(block)),
+		       drm_buddy_block_size(buddy, block) >> PAGE_SHIFT);
 		block->private = mr;
+	}
 
 	/*
 	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
@@ -693,6 +756,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->migrated && range->base.flags.migrate_devmem &&
 	    (range->base.itree.last + 1 - range->base.itree.start) >= SZ_64K) {
@@ -708,18 +773,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
 			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
 			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
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
@@ -735,8 +808,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
index 77dec5aae0ee..f16b76dcc55b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -57,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
-- 
2.34.1

