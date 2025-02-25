Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FEA43450
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D91110E57C;
	Tue, 25 Feb 2025 04:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORmfaVZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFBA10E546;
 Tue, 25 Feb 2025 04:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458533; x=1771994533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLlIUcuc1YJ/HmETnK+9obiSdGRAzWpU69VWvTNt/mQ=;
 b=ORmfaVZdLBes/qiMRT31D8dyKmUBQxAqaqtVaF5un8wCbWgb8lZwXbCJ
 SD0dCmFT6udxpoHsidr2xxP8eRWIKR6F+tFLt2Ql/Qcd5SOgmJsTi9sHf
 Jn8/FBvcIppgaLzMrkJf0mgLR5fPuIBopwGGqLCJg4c3zVCdmO2gl40hL
 FgoXt9oQE1dashi0TBjc90ERRuAdr9jIQziopqkEX5tV3C45bypG9PkJn
 0Z89YemCXeMP13MzMXBAdfN/4CBt/pzcz5D+2FMPdBVIWX35OUZcq1X9o
 KzEasfKclTEkRzJdwh1mz+OnigLfQrMt5Fsim3l4xsrQ4SjVxUJMwJW8F g==;
X-CSE-ConnectionGUID: fwsNFjFPR2G6Fy6GlKNx9Q==
X-CSE-MsgGUID: 9IZhxf8SQBC0JxFZwQmrVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51884973"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51884973"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:12 -0800
X-CSE-ConnectionGUID: pMV2cIZsQsyT5gKEg7Otzw==
X-CSE-MsgGUID: qDK6Zh5YT2+wZakS8/zKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290281"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 12/32] drm/xe: Add SVM range invalidation and page fault
Date: Mon, 24 Feb 2025 20:42:51 -0800
Message-Id: <20250225044311.3178695-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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
v5:
 - Use range start/end helpers (Thomas)
 - Use notifier start/end helpers (Thomas)
v6:
 - Use min/max helpers (Himal)
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  18 ++-
 drivers/gpu/drm/xe/xe_pt.c           |  41 +++++
 drivers/gpu/drm/xe/xe_pt.h           |   2 +
 drivers/gpu/drm/xe/xe_svm.c          | 229 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  40 +++++
 drivers/gpu/drm/xe/xe_vm.c           |   4 +
 6 files changed, 328 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 46701ca11ce0..3047b1ac024c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,6 +19,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -125,8 +126,8 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
-				struct xe_vma *vma)
+static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
+				bool atomic)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -134,13 +135,13 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
-	bool atomic;
+
+	lockdep_assert_held_write(&vm->lock);
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
 
 	trace_xe_vma_pagefault(vma);
-	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
 	if (vma_is_valid(tile, vma) && !atomic)
@@ -210,6 +211,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
+	bool atomic;
 
 	/* SW isn't expected to handle TRTT faults */
 	if (pf->trva_fault)
@@ -235,7 +237,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	err = handle_vma_pagefault(gt, pf, vma);
+	atomic = access_is_atomic(pf->access_type);
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		err = xe_svm_handle_pagefault(vm, vma, gt_to_tile(gt),
+					      pf->page_addr, atomic);
+	else
+		err = handle_vma_pagefault(gt, vma, atomic);
 
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
index 79da859f02b1..866872f75d5e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,18 +3,204 @@
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
+static unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_start(&range->base);
+}
+
+static unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_end(&range->base);
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
+	*adj_start = min(xe_svm_range_start(range), mmu_range->start);
+	*adj_end = max(xe_svm_range_end(range), mmu_range->end);
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
+	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
+	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
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
 
@@ -71,3 +257,44 @@ void xe_svm_fini(struct xe_vm *vm)
 
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
index d361a78a6839..31090967b83c 100644
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
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
 int xe_svm_init(struct xe_vm *vm);
@@ -18,6 +37,10 @@ int xe_svm_init(struct xe_vm *vm);
 void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
+
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic);
 #else
 static inline
 int xe_svm_init(struct xe_vm *vm)
@@ -34,6 +57,23 @@ static inline
 void xe_svm_close(struct xe_vm *vm)
 {
 }
+
+static inline
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic)
+{
+	return 0;
+}
 #endif
 
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
index f06b77a757bd..b89b0933dff6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1584,6 +1584,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_lock(vm);
 
 	vm->size = 0;
 
@@ -1605,6 +1607,8 @@ static void xe_vm_close(struct xe_vm *vm)
 			xe_gt_tlb_invalidation_vm(gt, vm);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_notifier_unlock(vm);
 	up_write(&vm->lock);
 }
 
-- 
2.34.1

