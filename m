Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E22A224BD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A3110E8A4;
	Wed, 29 Jan 2025 19:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciFXW1JI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141910E88C;
 Wed, 29 Jan 2025 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180283; x=1769716283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJwWdat2BLVsVLpQYDv4e16XzmVhc4wMEZOg38seIgg=;
 b=ciFXW1JI0bwXWoUZ0FnFr+XoppnMMkUDQTWmqQaC0s16D39OPl0lPYPp
 s039COUEvlsdr2Aby2kgTIyZQjGcT+URQH6R1b6AGUUKljxTV2Symmjc3
 DNumDtLVYHfongdzFqrJQciIUNK5HhenxJKf7jEaDEe15Q4iB+Yta6+iL
 Q2BoOxsxT7msM1PxqYl77f2EVleNAleqLMf8kzIj8dIW8RNjuHiuhV+Q4
 3haNeiDCwOh7/6C9Sxl28eqF0g5bu4oDn0IKYeMOAxFqb8hzoMm0S+mU8
 9BxYTtT0h3ftu8KlDp5BrfWwsWZr1Pytd70kp49MhT3Q7hCg5r7byMZLu Q==;
X-CSE-ConnectionGUID: kVtE6gtMQ2i7mPzzc8bEQA==
X-CSE-MsgGUID: DSiIRcRUTSGKLy1WEH7ljA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132780"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132780"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:22 -0800
X-CSE-ConnectionGUID: CDz4GnXXTgiGaboW1wtFuQ==
X-CSE-MsgGUID: 2Vy5cSGZSfCZze5WKbxNVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392139"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 12/33] drm/xe: Add SVM range invalidation and page fault
 handler
Date: Wed, 29 Jan 2025 11:51:51 -0800
Message-Id: <20250129195212.745731-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add SVM range invalidation vfunc which invalidates PTEs. A new PT layer
function which accepts a SVM range is added to support this. In
addition, add the basic page fault handler which allocates a SVM range
which is used by SVM range invalidation vfunc.

v2:
 - Don't run invalidation if VM is closed
 - Cycle notifier lock in xe_svm_close
 - Drop xe_gt_tlb_invalidation_fence_fini
v3:
 - Better commit message (Thomas)
 - Add lockdep asserts (Thomas)
 - Add kernel doc (Thomas)
 - s/change/changed (Thomas)
 - Use new GPU SVM range / notifier structures
 - Ensure PTEs are zapped / dma mappings are unmapped on VM close (Thomas)
v4:
 - Fix macro (Checkpatch)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  17 +-
 drivers/gpu/drm/xe/xe_pt.c           |  41 +++++
 drivers/gpu/drm/xe/xe_pt.h           |   2 +
 drivers/gpu/drm/xe/xe_svm.c          | 223 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  32 ++++
 drivers/gpu/drm/xe/xe_vm.c           |   4 +
 6 files changed, 313 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 2606cd396df5..7e71bf604ae8 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -18,6 +18,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -124,18 +125,17 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
-				struct xe_vma *vma)
+static int handle_vma_pagefault(struct xe_tile *tile, struct xe_vma *vma,
+				bool atomic)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
-	bool atomic;
 
+	lockdep_assert_held_write(&vm->lock);
 	trace_xe_vma_pagefault(vma);
-	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
 	if (vma_is_valid(tile, vma) && !atomic)
@@ -206,6 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
+	bool atomic;
 
 	/* SW isn't expected to handle TRTT faults */
 	if (pf->trva_fault)
@@ -231,7 +232,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	err = handle_vma_pagefault(tile, pf, vma);
+	atomic = access_is_atomic(pf->access_type);
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		err = xe_svm_handle_pagefault(vm, vma, tile,
+					      pf->page_addr, atomic);
+	else
+		err = handle_vma_pagefault(tile, vma, atomic);
 
 unlock_vm:
 	if (!err)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c5060011ad43..a9aa1678437e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -20,6 +20,7 @@
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_svm.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -844,6 +845,46 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	return xe_walk.needs_invalidate;
 }
 
+/**
+ * xe_pt_zap_ptes_range() - Zap (zero) gpu ptes of a SVM range
+ * @tile: The tile we're zapping for.
+ * @vm: The VM we're zapping for.
+ * @range: The SVM range we're zapping for.
+ *
+ * SVM invalidation needs to be able to zap the gpu ptes of a given address
+ * range. In order to be able to do that, that function needs access to the
+ * shared page-table entries so it can either clear the leaf PTEs or
+ * clear the pointers to lower-level page-tables. The caller is required
+ * to hold the SVM notifier lock.
+ *
+ * Return: Whether ptes were actually updated and a TLB invalidation is
+ * required.
+ */
+bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
+			  struct xe_svm_range *range)
+{
+	struct xe_pt_zap_ptes_walk xe_walk = {
+		.base = {
+			.ops = &xe_pt_zap_ptes_ops,
+			.shifts = xe_normal_pt_shifts,
+			.max_level = XE_PT_HIGHEST_LEVEL,
+		},
+		.tile = tile,
+	};
+	struct xe_pt *pt = vm->pt_root[tile->id];
+	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
+
+	xe_svm_assert_in_notifier(vm);
+
+	if (!(pt_mask & BIT(tile->id)))
+		return false;
+
+	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.itree.start,
+				range->base.itree.last + 1, &xe_walk.base);
+
+	return xe_walk.needs_invalidate;
+}
+
 static void
 xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
 		       struct iosys_map *map, void *data,
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 8e43912ae8e9..5ecf003d513c 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -45,5 +45,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
+bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
+			  struct xe_svm_range *range);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 79da859f02b1..bd7b9c6ea229 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,18 +3,198 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
+static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
+{
+	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
+}
+
+static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
+{
+	return gpusvm_to_vm(r->gpusvm);
+}
+
+static struct drm_gpusvm_range *
+xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
+{
+	struct xe_svm_range *range;
+
+	range = kzalloc(sizeof(*range), GFP_KERNEL);
+	if (!range)
+		return ERR_PTR(-ENOMEM);
+
+	xe_vm_get(gpusvm_to_vm(gpusvm));
+
+	return &range->base;
+}
+
+static void xe_svm_range_free(struct drm_gpusvm_range *range)
+{
+	xe_vm_put(range_to_vm(range));
+	kfree(range);
+}
+
+static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
+static u8
+xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
+				  const struct mmu_notifier_range *mmu_range,
+				  u64 *adj_start, u64 *adj_end)
+{
+	struct xe_svm_range *range = to_xe_range(r);
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	u8 tile_mask = 0;
+	u8 id;
+
+	xe_svm_assert_in_notifier(vm);
+
+	/* Skip if already unmapped or if no binding exist */
+	if (range->base.flags.unmapped || !range->tile_present)
+		return 0;
+
+	/* Adjust invalidation to range boundaries */
+	if (range->base.itree.start < mmu_range->start)
+		*adj_start = range->base.itree.start;
+	if (range->base.itree.last + 1 > mmu_range->end)
+		*adj_end = range->base.itree.last + 1;
+
+	/*
+	 * XXX: Ideally would zap PTEs in one shot in xe_svm_invalidate but the
+	 * invalidation code can't correctly cope with sparse ranges or
+	 * invalidations spanning multiple ranges.
+	 */
+	for_each_tile(tile, xe, id)
+		if (xe_pt_zap_ptes_range(tile, vm, range)) {
+			tile_mask |= BIT(id);
+			range->tile_invalidated |= BIT(id);
+		}
+
+	return tile_mask;
+}
+
+static void
+xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
+				const struct mmu_notifier_range *mmu_range)
+{
+	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
+
+	xe_svm_assert_in_notifier(vm);
+
+	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
+	/* TODO: Add range to garbage collector if VM is not closed */
+}
+
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			      struct drm_gpusvm_notifier *notifier,
 			      const struct mmu_notifier_range *mmu_range)
 {
-	/* TODO: Implement */
+	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
+	struct xe_device *xe = vm->xe;
+	struct xe_tile *tile;
+	struct drm_gpusvm_range *r, *first;
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
+	u8 tile_mask = 0;
+	u8 id;
+	u32 fence_id = 0;
+	long err;
+
+	xe_svm_assert_in_notifier(vm);
+
+	/* Adjust invalidation to notifier boundaries */
+	if (adj_start < notifier->itree.start)
+		adj_start = notifier->itree.start;
+	if (adj_end > notifier->itree.last + 1)
+		adj_end = notifier->itree.last + 1;
+
+	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
+	if (!first)
+		return;
+
+	/*
+	 * PTs may be getting destroyed so not safe to touch these but PT should
+	 * be invalidated at this point in time. Regardless we still need to
+	 * ensure any dma mappings are unmapped in the here.
+	 */
+	if (xe_vm_is_closed(vm))
+		goto range_notifier_event_end;
+
+	/*
+	 * XXX: Less than ideal to always wait on VM's resv slots if an
+	 * invalidation is not required. Could walk range list twice to figure
+	 * out if an invalidations is need, but also not ideal.
+	 */
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(err <= 0);
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		tile_mask |= xe_svm_range_notifier_event_begin(vm, r, mmu_range,
+							       &adj_start,
+							       &adj_end);
+	if (!tile_mask)
+		goto range_notifier_event_end;
+
+	xe_device_wmb(xe);
+
+	for_each_tile(tile, xe, id) {
+		if (tile_mask & BIT(id)) {
+			int err;
+
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
+							   &fence[fence_id],
+							   adj_start,
+							   adj_end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->media_gt,
+							   &fence[fence_id],
+							   adj_start,
+							   adj_end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+		}
+	}
+
+wait:
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+
+range_notifier_event_end:
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		xe_svm_range_notifier_event_end(vm, r, mmu_range);
 }
 
 static const struct drm_gpusvm_ops gpusvm_ops = {
+	.range_alloc = xe_svm_range_alloc,
+	.range_free = xe_svm_range_free,
 	.invalidate = xe_svm_invalidate,
 };
 
@@ -71,3 +251,44 @@ void xe_svm_fini(struct xe_vm *vm)
 
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
+
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @tile: The tile upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic)
+{
+	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct drm_gpusvm_range *r;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+
+retry:
+	/* TODO: Run garbage collector */
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
+					    xe_vma_start(vma), xe_vma_end(vma),
+					    &ctx);
+	if (IS_ERR(r))
+		return PTR_ERR(r);
+
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
+		goto retry;
+
+	/* TODO: Issue bind */
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4569931db622..caf02138ae4f 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -7,10 +7,29 @@
 #define _XE_SVM_H_
 
 #include <drm/drm_pagemap.h>
+#include <drm/drm_gpusvm.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_tile;
 struct xe_vm;
+struct xe_vma;
+
+/** struct xe_svm_range - SVM range */
+struct xe_svm_range {
+	/** @base: base drm_gpusvm_range */
+	struct drm_gpusvm_range base;
+	/**
+	 * @tile_present: Tile mask of binding is present for this range.
+	 * Protected by GPU SVM notifier lock.
+	 */
+	u8 tile_present;
+	/**
+	 * @tile_invalidated: Tile mask of binding is invalidated for this
+	 * range. Protected by GPU SVM notifier lock.
+	 */
+	u8 tile_invalidated;
+};
 
 int xe_svm_init(struct xe_vm *vm);
 
@@ -18,4 +37,17 @@ void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
 
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic);
+
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 82026c5a154d..8a8d2e6032bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1540,6 +1540,8 @@ static void xe_vm_close(struct xe_vm *vm)
 	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
 
 	down_write(&vm->lock);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_lock(vm);
 
 	vm->size = 0;
 
@@ -1561,6 +1563,8 @@ static void xe_vm_close(struct xe_vm *vm)
 			xe_gt_tlb_invalidation_vm(gt, vm);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_unlock(vm);
 	up_write(&vm->lock);
 }
 
-- 
2.34.1

