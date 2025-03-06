Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1327A53FD9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9210E8B9;
	Thu,  6 Mar 2025 01:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ew6SCpsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC8410E893;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Im9if9jK9zOAr8mbORU9IgWQM/uKxJypoG/keqjiJ8=;
 b=ew6SCpsFEjhRAaBeRKrksx3DgwY3+bLEk/SELqAO5Qg5v/Oed36xuPDW
 MsCmh60sy5jgNB4X8+Z4NeG/Z14sXuvsdlewgIkVceERDGa5PE9Dg0qKW
 CvOovnIdpBxYIoI4rTaNHpYGheY+NPoAa45I77WNKlVwHnjreaW5GvqiO
 3aDvzaZnxuL6U+gwAdcnk9Z42gtezTPKopaCGqNxXUdYmsnvnNvunitC3
 jRLHlMFgW8VHSCfZ6RVKFkdEwtJf/B1qGscxqQh6cUJPC+Yo/K2kYo7QK
 C7NuU4qbjpDyBy09gBlVTe/z2pKOLfRaKHY7vBeWdvGby3M3VkAqZHiJq w==;
X-CSE-ConnectionGUID: AR+x3iNnSTmbe7fZqdqNuw==
X-CSE-MsgGUID: ee8i4OUdScOJhmJxBveTvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427348"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: 3bi+NWnaSFubzTMxsJkN7g==
X-CSE-MsgGUID: x4TzTBMMR5mpX8Am52mPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063276"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 14/32] drm/xe: Add (re)bind to SVM page fault handler
Date: Wed,  5 Mar 2025 17:26:39 -0800
Message-Id: <20250306012657.3505757-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Add (re)bind to SVM page fault handler. To facilitate add support
function to VM layer which (re)binds a SVM range. Also teach PT layer to
understand (re)binds of SVM ranges.

v2:
 - Don't assert BO lock held for range binds
 - Use xe_svm_notifier_lock/unlock helper in xe_svm_close
 - Use drm_pagemap dma cursor
 - Take notifier lock in bind code to check range state
v3:
 - Use new GPU SVM range structure (Thomas)
 - Kernel doc (Thomas)
 - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
v5:
 - Kernel doc (Thomas)
v6:
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Tested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 170 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pt_types.h |   2 +
 drivers/gpu/drm/xe/xe_svm.c      |  44 +++++++-
 drivers/gpu/drm/xe/xe_svm.h      |  28 +++++
 drivers/gpu/drm/xe/xe_vm.c       |  92 +++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |   5 +
 drivers/gpu/drm/xe/xe_vm_types.h |  19 ++++
 7 files changed, 340 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9c3c70de71d0..822f2e956872 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -608,6 +608,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * range.
  * @tile: The tile we're building for.
  * @vma: The vma indicating the address range.
+ * @range: The range indicating the address range.
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
  * @num_entries: On output contains the number of @entries used.
@@ -623,6 +624,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  */
 static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
+		 struct xe_svm_range *range,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_device *xe = tile_to_xe(tile);
@@ -640,14 +642,38 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vm = xe_vma_vm(vma),
 		.tile = tile,
 		.curs = &curs,
-		.va_curs_start = xe_vma_start(vma),
+		.va_curs_start = range ? range->base.itree.start :
+			xe_vma_start(vma),
 		.vma = vma,
 		.wupd.entries = entries,
-		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (range) {
+		/* Move this entire thing to xe_svm.c? */
+		xe_svm_notifier_lock(xe_vma_vm(vma));
+		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_notifier_unlock(xe_vma_vm(vma));
+			return -EAGAIN;
+		}
+		if (xe_svm_range_has_dma_mapping(range)) {
+			xe_res_first_dma(range->base.dma_addr, 0,
+					 range->base.itree.last + 1 - range->base.itree.start,
+					 &curs);
+			is_devmem = xe_res_is_vram(&curs);
+		} else {
+			xe_assert(xe, false);
+		}
+		/*
+		 * Note, when unlocking the resource cursor dma addresses may become
+		 * stale, but the bind will be aborted anyway at commit time.
+		 */
+		xe_svm_notifier_unlock(xe_vma_vm(vma));
+	}
+
+	xe_walk.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem;
+
 	/**
 	 * Default atomic expectations for different allocation scenarios are as follows:
 	 *
@@ -669,7 +695,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			 * gets migrated to LMEM, bind such allocations with
 			 * device atomics enabled.
 			 */
-			else if (is_devmem && !xe_bo_has_single_placement(bo))
+			else if (is_devmem)
 				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		} else {
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
@@ -685,15 +711,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
-		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
+		xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	}
 
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
 
-	xe_bo_assert_held(bo);
+	if (!range)
+		xe_bo_assert_held(bo);
 
-	if (!xe_vma_is_null(vma)) {
+	if (!xe_vma_is_null(vma) && !range) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
 					xe_vma_size(vma), &curs);
@@ -703,12 +730,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		else
 			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
 					xe_vma_size(vma), &curs);
-	} else {
+	} else if (!range) {
 		curs.size = xe_vma_size(vma);
 	}
 
-	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
-			       xe_vma_end(vma), &xe_walk.base);
+	ret = xe_pt_walk_range(&pt->base, pt->level,
+			       range ? range->base.itree.start : xe_vma_start(vma),
+			       range ? range->base.itree.last + 1 : xe_vma_end(vma),
+			       &xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -941,7 +970,7 @@ static void xe_pt_commit_prepare_locks_assert(struct xe_vma *vma)
 
 	lockdep_assert_held(&vm->lock);
 
-	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
+	if (!xe_vma_has_no_bo(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	xe_vm_assert_held(vm);
@@ -1057,12 +1086,13 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
+		   struct xe_svm_range *range,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, range, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
 
@@ -1168,6 +1198,8 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_PREFETCH:
 		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1372,6 +1404,34 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
+static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vma_op *op;
+	int err;
+
+	err = xe_pt_pre_commit(pt_update);
+	if (err)
+		return err;
+
+	xe_svm_notifier_lock(vm);
+
+	list_for_each_entry(op, &vops->list, link) {
+		struct xe_svm_range *range = op->map_range.range;
+
+		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+
+		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_notifier_unlock(vm);
+			return -EAGAIN;
+		}
+	}
+
+	return 0;
+}
+
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
@@ -1665,12 +1725,12 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 
 static void
 xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
-				 struct xe_vma *vma)
+				 u64 start, u64 end)
 {
+	u64 last;
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int i, level = 0;
-	u64 start, last;
 
 	for (i = 0; i < pt_op->num_entries; i++) {
 		const struct xe_vm_pgtable_update *entry = &pt_op->entries[i];
@@ -1680,8 +1740,8 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 	}
 
 	/* Greedy (non-optimal) calculation but simple */
-	start = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
-	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+	start = ALIGN_DOWN(start, 0x1ull << xe_pt_shift(level));
+	last = ALIGN(end, 0x1ull << xe_pt_shift(level)) - 1;
 
 	if (start < pt_update_ops->start)
 		pt_update_ops->start = start;
@@ -1723,7 +1783,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	if (err)
 		return err;
 
-	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+	err = xe_pt_prepare_bind(tile, vma, NULL, pt_op->entries,
 				 &pt_op->num_entries);
 	if (!err) {
 		xe_tile_assert(tile, pt_op->num_entries <=
@@ -1731,7 +1791,9 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 					pt_op->num_entries, true);
 
-		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+		xe_pt_update_ops_rfence_interval(pt_update_ops,
+						 xe_vma_start(vma),
+						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
 		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 
@@ -1765,6 +1827,48 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	return err;
 }
 
+static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
+			      struct xe_vm_pgtable_update_ops *pt_update_ops,
+			      struct xe_vma *vma, struct xe_svm_range *range)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	int err;
+
+	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing bind, with range [%lx...%lx)\n",
+	       range->base.itree.start, range->base.itree.last);
+
+	pt_op->vma = NULL;
+	pt_op->bind = true;
+	pt_op->rebind = BIT(tile->id) & range->tile_present;
+
+	err = xe_pt_prepare_bind(tile, vma, range, pt_op->entries,
+				 &pt_op->num_entries);
+	if (!err) {
+		xe_tile_assert(tile, pt_op->num_entries <=
+			       ARRAY_SIZE(pt_op->entries));
+		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+					pt_op->num_entries, true);
+
+		xe_pt_update_ops_rfence_interval(pt_update_ops,
+						 range->base.itree.start,
+						 range->base.itree.last + 1);
+		++pt_update_ops->current_op;
+		pt_update_ops->needs_svm_lock = true;
+
+		pt_op->vma = vma;
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
+	}
+
+	return err;
+}
+
 static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
 			     struct xe_vma *vma)
@@ -1802,7 +1906,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
-	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
+					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
@@ -1872,6 +1977,15 @@ static int op_prepare(struct xe_vm *vm,
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	}
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+
+			err = bind_range_prepare(vm, tile, pt_update_ops,
+						 op->map_range.vma,
+						 op->map_range.range);
+		}
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -2054,6 +2168,14 @@ static void op_commit(struct xe_vm *vm,
 				       fence2);
 		break;
 	}
+	case DRM_GPUVA_OP_DRIVER:
+	{
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			op->map_range.range->tile_present |= BIT(tile->id);
+			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
+		}
+		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -2071,6 +2193,12 @@ static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_svm_pre_commit,
+};
+
 /**
  * xe_pt_update_ops_run() - Run PT update operations
  * @tile: Tile of PT update operations
@@ -2096,7 +2224,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vma_op *op;
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
-		.ops = pt_update_ops->needs_userptr_lock ?
+		.ops = pt_update_ops->needs_svm_lock ?
+			&svm_migrate_ops :
+			pt_update_ops->needs_userptr_lock ?
 			&userptr_migrate_ops :
 			&migrate_ops,
 		.vops = vops,
@@ -2217,6 +2347,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				  &ifence->base.base, &mfence->base.base);
 	}
 
+	if (pt_update_ops->needs_svm_lock)
+		xe_svm_notifier_unlock(vm);
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..69eab6f37cfe 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -104,6 +104,8 @@ struct xe_vm_pgtable_update_ops {
 	u32 num_ops;
 	/** @current_op: current operations */
 	u32 current_op;
+	/** @needs_svm_lock: Needs SVM lock */
+	bool needs_svm_lock;
 	/** @needs_userptr_lock: Needs userptr lock */
 	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 866872f75d5e..401583cf8e73 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -258,6 +258,12 @@ void xe_svm_fini(struct xe_vm *vm)
 	drm_gpusvm_fini(&vm->svm.gpusvm);
 }
 
+static bool xe_svm_range_is_valid(struct xe_svm_range *range,
+				  struct xe_tile *tile)
+{
+	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -275,7 +281,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic)
 {
 	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
+	struct drm_exec exec;
+	struct dma_fence *fence;
+	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -290,11 +300,43 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
+	range = to_xe_range(r);
+	if (xe_svm_range_is_valid(range, tile))
+		return 0;
+
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
 		goto retry;
+	if (err)
+		goto err_out;
+
+retry_bind:
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			drm_exec_fini(&exec);
+			goto err_out;
+		}
+
+		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+		if (IS_ERR(fence)) {
+			drm_exec_fini(&exec);
+			err = PTR_ERR(fence);
+			if (err == -EAGAIN)
+				goto retry;
+			if (xe_vm_validate_should_retry(&exec, err, &end))
+				goto retry_bind;
+			goto err_out;
+		}
+	}
+	drm_exec_fini(&exec);
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
 
-	/* TODO: Issue bind */
+err_out:
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 31090967b83c..e03699becb3d 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -32,6 +32,17 @@ struct xe_svm_range {
 };
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
+/**
+ * xe_svm_range_pages_valid() - SVM range pages valid
+ * @range: SVM range
+ *
+ * Return: True if SVM range pages are valid, False otherwise
+ */
+static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
+}
+
 int xe_svm_init(struct xe_vm *vm);
 
 void xe_svm_fini(struct xe_vm *vm);
@@ -42,6 +53,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic);
 #else
+static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
+{
+	return false;
+}
+
 static inline
 int xe_svm_init(struct xe_vm *vm)
 {
@@ -67,6 +83,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 }
 #endif
 
+/**
+ * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
+ * @range: SVM range
+ *
+ * Return: True if SVM range has a DMA mapping, False otherwise
+ */
+static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
+	return range->base.flags.has_dma_mapping;
+}
+
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 112a5d5fe41e..32fcfaf761e2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -949,6 +949,96 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	return fence;
 }
 
+static void xe_vm_populate_range_rebind(struct xe_vma_op *op,
+					struct xe_vma *vma,
+					struct xe_svm_range *range,
+					u8 tile_mask)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = tile_mask;
+	op->base.op = DRM_GPUVA_OP_DRIVER;
+	op->subop = XE_VMA_SUBOP_MAP_RANGE;
+	op->map_range.vma = vma;
+	op->map_range.range = range;
+}
+
+static int
+xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
+			   struct xe_vma *vma,
+			   struct xe_svm_range *range,
+			   u8 tile_mask)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
+	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+
+	return 0;
+}
+
+/**
+ * xe_vm_range_rebind() - VM range (re)bind
+ * @vm: The VM which the range belongs to.
+ * @vma: The VMA which the range belongs to.
+ * @range: SVM range to rebind.
+ * @tile_mask: Tile mask to bind the range to.
+ *
+ * (re)bind SVM range setting up GPU page tables for the range.
+ *
+ * Return: dma fence for rebind to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
+				     struct xe_vma *vma,
+				     struct xe_svm_range *range,
+				     u8 tile_mask)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_exec_queue(tile);
+	}
+
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	if (err)
+		return ERR_PTR(err);
+
+	err = xe_vma_ops_alloc(&vops, false);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
+	fence = ops_execute(vm, &vops);
+
+free_ops:
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
+	}
+	xe_vma_ops_fini(&vops);
+
+	return fence;
+}
+
 static void xe_vma_free(struct xe_vma *vma)
 {
 	if (xe_vma_is_userptr(vma))
@@ -2632,6 +2722,8 @@ static void op_trace(struct xe_vma_op *op)
 	case DRM_GPUVA_OP_PREFETCH:
 		trace_xe_vma_bind(gpuva_to_vma(op->base.prefetch.va));
 		break;
+	case DRM_GPUVA_OP_DRIVER:
+		break;
 	default:
 		XE_WARN_ON("NOT POSSIBLE");
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 2148303a9035..ce142a97fac4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -23,6 +23,7 @@ struct dma_fence;
 struct xe_exec_queue;
 struct xe_file;
 struct xe_sync_entry;
+struct xe_svm_range;
 struct drm_exec;
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
@@ -218,6 +219,10 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm);
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
+struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
+				     struct xe_vma *vma,
+				     struct xe_svm_range *range,
+				     u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 96ba631da68a..c9009b7db585 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -19,6 +19,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
@@ -339,6 +340,14 @@ struct xe_vma_op_prefetch {
 	u32 region;
 };
 
+/** struct xe_vma_op_map_range - VMA map range operation */
+struct xe_vma_op_map_range {
+	/** @vma: VMA to map (system allocator VMA) */
+	struct xe_vma *vma;
+	/** @range: SVM range to map */
+	struct xe_svm_range *range;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -349,6 +358,12 @@ enum xe_vma_op_flags {
 	XE_VMA_OP_NEXT_COMMITTED	= BIT(2),
 };
 
+/** enum xe_vma_subop - VMA sub-operation */
+enum xe_vma_subop {
+	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
+	XE_VMA_SUBOP_MAP_RANGE,
+};
+
 /** struct xe_vma_op - VMA operation */
 struct xe_vma_op {
 	/** @base: GPUVA base operation */
@@ -357,6 +372,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
+	/** @subop: user defined sub-operation */
+	enum xe_vma_subop subop;
 	/** @tile_mask: Tile mask for operation */
 	u8 tile_mask;
 
@@ -367,6 +384,8 @@ struct xe_vma_op {
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
 		struct xe_vma_op_prefetch prefetch;
+		/** @map_range: VMA map range operation specific data */
+		struct xe_vma_op_map_range map_range;
 	};
 };
 
-- 
2.34.1

