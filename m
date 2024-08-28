Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67E961C51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0D610E466;
	Wed, 28 Aug 2024 02:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1WwF0xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F0310E43F;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813289; x=1756349289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q8fOjpTfHZ6g2EmIgk1IyKTPeb6OEjoIC8MZfXwxOwk=;
 b=a1WwF0xgdg8oTFgZz1ZwdnbSdav+t1w1fcFbZDYSG0BfduWoQguQ30Qq
 fEvrc/mw7IOjgHj7mv7Km9rwwjGfzO6xIXII7TpNj+d+njRE261JtWYqC
 5GAjDWTGa4N4653WIX+FbU8O9hTnWH1xvww9kht6wTKD67FTWQ1P/OHsg
 +GElZ1PZ6uT5JojWp40VjNJa4FOlexvPRo15T5TvXgGnp0hjUk3rEcT6k
 bM+JJbNLJ2i5YmHaJUqXwDxEtoBt5bsvluYNtTWy24+FftmJWF5CACjDP
 fo2EtNBmGl9JvdC2H7L7hRxBkhlXsfoPDQcDzaI6ZG6G5KD0WYSpGMg+X g==;
X-CSE-ConnectionGUID: U1sugrWCQlyOynVWeYqTSA==
X-CSE-MsgGUID: WyXd12VZQAabA2nRrzV4BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251884"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251884"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
X-CSE-ConnectionGUID: Yso5XPJrSc6vqHZGD6aLWw==
X-CSE-MsgGUID: PO/hx82wQd+QT4/iu0uioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224611"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 09/28] drm/xe: Add SVM range invalidation
Date: Tue, 27 Aug 2024 19:48:42 -0700
Message-Id: <20240828024901.2582335-10-matthew.brost@intel.com>
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

Add SVM range invalidation vfunc.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  17 ++-
 drivers/gpu/drm/xe/xe_pt.c           |  24 ++++
 drivers/gpu/drm/xe/xe_pt.h           |   3 +
 drivers/gpu/drm/xe/xe_svm.c          | 201 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  14 ++
 5 files changed, 253 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0be4687bfc20..e1f32d782f65 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,6 +19,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -125,18 +126,17 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
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
@@ -192,6 +192,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
+	bool atomic;
 
 	/* SW isn't expected to handle TRTT faults */
 	if (pf->trva_fault)
@@ -218,7 +219,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	err = handle_vma_pagefault(tile, pf, vma);
+	atomic = access_is_atomic(pf->access_type);
+
+	if (xe_vma_is_system_allocator(vma))
+		err = xe_svm_handle_pagefault(vm, vma, tile,
+					      pf->page_addr, atomic);
+	else
+		err = handle_vma_pagefault(tile, vma, atomic);
 
 unlock_vm:
 	if (!err)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d21e45efeaab..b2db79251825 100644
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
@@ -829,6 +830,29 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	return xe_walk.needs_invalidate;
 }
 
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
+	if (!(pt_mask & BIT(tile->id)))
+		return false;
+
+	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.va.start,
+				range->base.va.end, &xe_walk.base);
+
+	return xe_walk.needs_invalidate;
+}
+
 static void
 xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
 		       struct iosys_map *map, void *data,
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..5f333eeedf5c 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -13,6 +13,7 @@ struct dma_fence;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
+struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
@@ -42,5 +43,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
+bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
+			  struct xe_svm_range *range);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7166100e3298..3ac84f9615e2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -5,18 +5,189 @@
 
 #include "drm_gpusvm.h"
 
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
+static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
+ {
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
+	/* Skip if already unmapped or if no binding exist */
+	if (range->base.flags.unmapped || !range->tile_present)
+		return 0;
+
+	/* Adjust invalidation to range boundaries */
+	if (range->base.va.start < mmu_range->start)
+		*adj_start = range->base.va.start;
+	if (range->base.va.end > mmu_range->end)
+		*adj_end = range->base.va.end;
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
+	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
+	/* TODO: Add range to garbage collector */
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
+	/* Adjust invalidation to notifier boundaries */
+	if (adj_start < notifier->interval.start)
+		adj_start = notifier->interval.start;
+	if (adj_end > notifier->interval.end)
+		adj_end = notifier->interval.end;
+
+	first = drm_gpusvm_range_find(notifier, adj_start, adj_end);
+	if (!first)
+		return;
+
+	/*
+	 * XXX: Less than ideal to always wait on VM's resv slots if an
+	 * invalidation is not required. Could walk range list twice to figure
+	 * out if an invalidations is need, but also not ideal. Maybe a counter
+	 * within the notifier, seems like that could work.
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
+			if (WARN_ON_ONCE(err < 0)) {
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+				goto wait;
+			}
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
+			if (WARN_ON_ONCE(err < 0)) {
+				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
+				goto wait;
+			}
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
 
@@ -38,3 +209,31 @@ void xe_svm_fini(struct xe_vm *vm)
 {
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
+
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic)
+{
+	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct drm_gpusvm_range *r;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
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
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, false);
+	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
+	       goto retry;
+
+	/* TODO: Issue bind */
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4982d9168095..b053b11692f0 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,9 +6,23 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
+#include "drm_gpusvm.h"
+
+struct xe_tile;
 struct xe_vm;
+struct xe_vma;
+
+struct xe_svm_range {
+	struct drm_gpusvm_range base;
+	u8 tile_present;
+	u8 tile_invalidated;
+};
 
 int xe_svm_init(struct xe_vm *vm);
 void xe_svm_fini(struct xe_vm *vm);
 
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_tile *tile, u64 fault_addr,
+			    bool atomic);
+
 #endif
-- 
2.34.1

