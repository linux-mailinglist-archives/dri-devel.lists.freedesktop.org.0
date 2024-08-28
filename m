Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414E961C4A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A100A10E45B;
	Wed, 28 Aug 2024 02:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvXfEvxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811210E448;
 Wed, 28 Aug 2024 02:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813289; x=1756349289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqSgQBX2UKF5ScoIm7eLAT82+JupHu63duFHc9kcuTA=;
 b=dvXfEvxqYeGWlJ6b2KQwmqsfRjM22+g7WK0NJkFNiMMzc/iT3JrveCym
 NU/96Or+144l6ke4Ggc3ftGkXlUSIqfV/JNrk8hwnfQJBPe570BDTnpG9
 HBINT688hjCU3l0XnFdn6DYp/7gKacVdRDuX0kBIBM2S9roFTyAcz8Dgw
 dhyn6ZzWvq2SeqlwS3/EmkBqEzNgphzkdm//ErJ6x6BRuHjlTD8uYoIVk
 HYmdBezfIqzy0N/rkXo9Fr5ETgEaBnQij0F9Bk698XGgn0x2pJEEM48gF
 uBsgpsW//FGDENsM8OIzTCPOQ0N0UWSzyqMIiCHgPQKtzOagaw0wWkc18 g==;
X-CSE-ConnectionGUID: EfM2XtujQK2NhgSrPFv5uQ==
X-CSE-MsgGUID: OoCo1sWOQOakJMGMqhNoIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251900"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251900"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
X-CSE-ConnectionGUID: sDIJeYWaShC3XPfGcgOu/Q==
X-CSE-MsgGUID: J3QgokuwT7O/prAyFv/NZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224624"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 13/28] drm/xe: Add unbind to SVM garbage collector
Date: Tue, 27 Aug 2024 19:48:46 -0700
Message-Id: <20240828024901.2582335-14-matthew.brost@intel.com>
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

Add unbind to SVM garbage collector. To facilitate add unbind support
function to VM layer which unbinds a SVM range. Also teach PY layer to
understand unbinds of SVM ranges.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
 drivers/gpu/drm/xe/xe_vm.c       | 73 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
 5 files changed, 162 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d5e444af7e02..fc86adf9f0a6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -905,10 +905,16 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
 	}
 }
 
+#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)
+
 static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 {
-	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_vm *vm;
 
+	if (vma == INVALID_VMA)
+		return;
+
+	vm = xe_vma_vm(vma);
 	lockdep_assert_held(&vm->lock);
 
 	if (!xe_vma_has_no_bo(vma))
@@ -934,7 +940,8 @@ static void xe_pt_commit(struct xe_vma *vma,
 		for (j = 0; j < entries[i].qwords; j++) {
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
 
-			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+			xe_pt_destroy(oldpte, (vma == INVALID_VMA) ? 0 :
+				      xe_vma_vm(vma)->flags, deferred);
 		}
 	}
 }
@@ -1367,6 +1374,9 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	list_for_each_entry(op, &vops->list, link) {
 		struct xe_svm_range *range = op->map_range.range;
 
+		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
+			continue;
+
 		xe_assert(vm->xe, xe_vma_is_system_allocator(op->map_range.vma));
 		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
 
@@ -1565,7 +1575,9 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  * xe_pt_stage_unbind() - Build page-table update structures for an unbind
  * operation
  * @tile: The tile we're unbinding for.
+ * @vm: The vm
  * @vma: The vma we're unbinding.
+ * @range: The range we're unbinding.
  * @entries: Caller-provided storage for the update structures.
  *
  * Builds page-table update structures for an unbind operation. The function
@@ -1575,9 +1587,14 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  *
  * Return: The number of entries used.
  */
-static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
+static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
+				       struct xe_vm *vm,
+				       struct xe_vma *vma,
+				       struct xe_svm_range *range,
 				       struct xe_vm_pgtable_update *entries)
 {
+	u64 start = range ? range->base.va.start : xe_vma_start(vma);
+	u64 end = range ? range->base.va.end : xe_vma_end(vma);
 	struct xe_pt_stage_unbind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
@@ -1585,14 +1602,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.tile = tile,
-		.modified_start = xe_vma_start(vma),
-		.modified_end = xe_vma_end(vma),
+		.modified_start = start,
+		.modified_end = end,
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	struct xe_pt *pt = vm->pt_root[tile->id];
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
+				&xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
@@ -1834,13 +1851,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	       "Preparing unbind, with range [%llx...%llx)\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1);
 
-	/*
-	 * Wait for invalidation to complete. Can corrupt internal page table
-	 * state if an invalidation is running while preparing an unbind.
-	 */
-	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
-		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
-
 	pt_op->vma = vma;
 	pt_op->bind = false;
 	pt_op->rebind = false;
@@ -1849,7 +1859,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (err)
 		return err;
 
-	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
+	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
+						vma, NULL, pt_op->entries);
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
@@ -1864,6 +1875,42 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	return 0;
 }
 
+static int unbind_range_prepare(struct xe_vm *vm,
+				struct xe_tile *tile,
+				struct xe_vm_pgtable_update_ops *pt_update_ops,
+				struct xe_svm_range *range)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+
+	if (!(range->tile_present & BIT(tile->id)))
+		return 0;
+
+	vm_dbg(&vm->xe->drm,
+	       "Preparing unbind, with range [%llx...%llx)\n",
+	       range->base.va.start, range->base.va.end - 1);
+
+	pt_op->vma = INVALID_VMA;
+	pt_op->bind = false;
+	pt_op->rebind = false;
+
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
+						pt_op->entries);
+
+	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+				pt_op->num_entries, false);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.va.start,
+					 range->base.va.end);
+	++pt_update_ops->current_op;
+	pt_update_ops->needs_svm_lock = true;
+	pt_update_ops->needs_invalidation = true;
+
+	xe_pt_commit_prepare_unbind(INVALID_VMA, pt_op->entries,
+				    pt_op->num_entries);
+
+	return 0;
+}
+
 static int op_prepare(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -1931,6 +1978,9 @@ static int op_prepare(struct xe_vm *vm,
 			err = bind_range_prepare(vm, tile, pt_update_ops,
 						 op->map_range.vma,
 						 op->map_range.range);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			err = unbind_range_prepare(vm, tile, pt_update_ops,
+						   op->unmap_range.range);
 		}
 		break;
 	default:
@@ -2119,6 +2169,8 @@ static void op_commit(struct xe_vm *vm,
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
 			op->map_range.range->tile_present |= BIT(tile->id);
 			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			op->unmap_range.range->tile_present &= ~BIT(tile->id);
 		}
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 20010c09e125..7188aa590fa5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -209,7 +209,14 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
 				      struct xe_svm_range *range)
 {
-	/* TODO: Do unbind */
+	struct dma_fence *fence;
+
+	xe_vm_lock(vm, false);
+	fence = xe_vm_range_unbind(vm, range);
+	xe_vm_unlock(vm);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+	dma_fence_put(fence);
 
 	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1fd2c99245f2..6916cdfe4be3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -972,6 +972,79 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	return fence;
 }
 
+static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
+					struct xe_svm_range *range)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = range->tile_present;
+	op->base.op = DRM_GPUVA_OP_USER;
+	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
+	op->unmap_range.range = range;
+}
+
+static int
+xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
+			   struct xe_svm_range *range)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	xe_vm_populate_range_unbind(op, range);
+	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+
+	return 0;
+}
+
+struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
+				     struct xe_svm_range *range)
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
+
+	if (!range->tile_present)
+		return dma_fence_get_stub();
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[tile->id].q =
+			xe_tile_migrate_exec_queue(tile);
+	}
+
+	err = xe_vm_ops_add_range_unbind(&vops, range);
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
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 8bd921b33090..d577ca9e3d65 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -222,6 +222,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 				     struct xe_vma *vma,
 				     struct xe_svm_range *range,
 				     u8 tile_mask);
+struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
+				     struct xe_svm_range *range);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2eae3575c409..d38cf7558f62 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -348,6 +348,12 @@ struct xe_vma_op_map_range {
 	struct xe_svm_range *range;
 };
 
+/** struct xe_vma_op_unmap_range - VMA unmap range operation */
+struct xe_vma_op_unmap_range {
+	/** @range: SVM range to unmap */
+	struct xe_svm_range *range;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -362,6 +368,8 @@ enum xe_vma_op_flags {
 enum xe_vma_subop {
 	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
 	XE_VMA_SUBOP_MAP_RANGE,
+	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
+	XE_VMA_SUBOP_UNMAP_RANGE,
 };
 
 /** struct xe_vma_op - VMA operation */
@@ -384,8 +392,10 @@ struct xe_vma_op {
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
 		struct xe_vma_op_prefetch prefetch;
-		/** @map: VMA map range operation specific data */
+		/** @map_range: VMA map range operation specific data */
 		struct xe_vma_op_map_range map_range;
+		/** @unmap_range: VMA unmap range operation specific data */
+		struct xe_vma_op_map_range unmap_range;
 	};
 };
 
-- 
2.34.1

