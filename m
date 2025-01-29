Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F2A224C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E018D10E8BD;
	Wed, 29 Jan 2025 19:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg+Wx142";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB0210E177;
 Wed, 29 Jan 2025 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180284; x=1769716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wYFE+uznCRQIO51a3VPsl08nGQySCGnOUl3/HrsILf4=;
 b=Fg+Wx1426E9O03lRRfOu4wSTaRZBObH+AqcEkL1gkOIzaAtmf12XhBbE
 TAJuI3aSD2QYSpAH9MpU/zrM6JiosNCdZt3nVZnZeSq5txSmqyK9Go71e
 ojkAqIcrUDxy1sCbqgyp1UUga69vzndRE0zhhnsSu5Ae7O4Ka/+Bo3J3e
 ZfqBHtqhl6efEV5gAQROSBe2gTLhrg0TuH3k7hhf5/8IyYWKaP4+AAUKv
 4izPT0c0+QpiF+DHHm6/8AIsl5Cfh4+YCHQNSgd13VqyM1FFWgPc+c4Rw
 /vGVr5+yKL5agDBfowNdDYS2SSRbwu4j3WL+7LEJAl0UpmFyKS2gKh4RU g==;
X-CSE-ConnectionGUID: iaho3g87R120UETou3c8Bg==
X-CSE-MsgGUID: rwDqPnzGTb2T2EXf4oX2MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132805"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
X-CSE-ConnectionGUID: 7bKcHHPYReKIzj1cS/FXXw==
X-CSE-MsgGUID: ms/SBof2R5+jipwhvvL65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392153"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 16/33] drm/xe: Add unbind to SVM garbage collector
Date: Wed, 29 Jan 2025 11:51:55 -0800
Message-Id: <20250129195212.745731-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

v3:
 - s/INVALID_VMA/XE_INVALID_VMA (Thomas)
 - Kernel doc (Thomas)
 - New GPU SVM range structure (Thomas)
 - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
v4:
 - Use xe_vma_op_unmap_range (Himal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
 drivers/gpu/drm/xe/xe_vm.c       | 83 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
 5 files changed, 172 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index cb63596dbfbf..f8d06c70f77d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -957,10 +957,16 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
 	}
 }
 
+#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
+
 static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 {
-	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_vm *vm;
 
+	if (vma == XE_INVALID_VMA)
+		return;
+
+	vm = xe_vma_vm(vma);
 	lockdep_assert_held(&vm->lock);
 
 	if (!xe_vma_has_no_bo(vma))
@@ -986,7 +992,8 @@ static void xe_pt_commit(struct xe_vma *vma,
 		for (j = 0; j < entries[i].qwords; j++) {
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
 
-			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+			xe_pt_destroy(oldpte, (vma == XE_INVALID_VMA) ? 0 :
+				      xe_vma_vm(vma)->flags, deferred);
 		}
 	}
 }
@@ -1419,6 +1426,9 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	list_for_each_entry(op, &vops->list, link) {
 		struct xe_svm_range *range = op->map_range.range;
 
+		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
+			continue;
+
 		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
 		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
 
@@ -1616,7 +1626,9 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  * xe_pt_stage_unbind() - Build page-table update structures for an unbind
  * operation
  * @tile: The tile we're unbinding for.
+ * @vm: The vm
  * @vma: The vma we're unbinding.
+ * @range: The range we're unbinding.
  * @entries: Caller-provided storage for the update structures.
  *
  * Builds page-table update structures for an unbind operation. The function
@@ -1626,9 +1638,14 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
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
+	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
+	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
 	struct xe_pt_stage_unbind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
@@ -1636,14 +1653,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
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
@@ -1885,13 +1902,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
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
@@ -1900,7 +1910,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (err)
 		return err;
 
-	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
+	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
+						vma, NULL, pt_op->entries);
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
@@ -1915,6 +1926,42 @@ static int unbind_op_prepare(struct xe_tile *tile,
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
+	       "Preparing unbind, with range [%lx...%lx)\n",
+	       range->base.itree.start, range->base.itree.last);
+
+	pt_op->vma = XE_INVALID_VMA;
+	pt_op->bind = false;
+	pt_op->rebind = false;
+
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
+						pt_op->entries);
+
+	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+				pt_op->num_entries, false);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
+					 range->base.itree.last + 1);
+	++pt_update_ops->current_op;
+	pt_update_ops->needs_svm_lock = true;
+	pt_update_ops->needs_invalidation = true;
+
+	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
+				    pt_op->num_entries);
+
+	return 0;
+}
+
 static int op_prepare(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -1982,6 +2029,9 @@ static int op_prepare(struct xe_vm *vm,
 			err = bind_range_prepare(vm, tile, pt_update_ops,
 						 op->map_range.vma,
 						 op->map_range.range);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			err = unbind_range_prepare(vm, tile, pt_update_ops,
+						   op->unmap_range.range);
 		}
 		break;
 	default:
@@ -2171,6 +2221,8 @@ static void op_commit(struct xe_vm *vm,
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
 			op->map_range.range->tile_present |= BIT(tile->id);
 			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
+		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+			op->unmap_range.range->tile_present &= ~BIT(tile->id);
 		}
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 3788196b2925..03c5cbcacb0e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -216,7 +216,14 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
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
index bdc9b75e0aee..6fa446884955 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -984,6 +984,89 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	return fence;
 }
 
+static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
+					struct xe_svm_range *range)
+{
+	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = range->tile_present;
+	op->base.op = DRM_GPUVA_OP_DRIVER;
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
+/**
+ * xe_vm_range_unbind() - VM range unbind
+ * @vm: The VM which the range belongs to.
+ * @range: SVM range to rebind.
+ *
+ * Unbind SVM range removing the GPU page tables for the range.
+ *
+ * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
+ * failure
+ */
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
index a82fe743bbe0..3b6316dd9fd6 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -221,6 +221,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 				     struct xe_vma *vma,
 				     struct xe_svm_range *range,
 				     u8 tile_mask);
+struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
+				     struct xe_svm_range *range);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 576316729249..aaba9e5acfb7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -361,6 +361,12 @@ struct xe_vma_op_map_range {
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
@@ -375,6 +381,8 @@ enum xe_vma_op_flags {
 enum xe_vma_subop {
 	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
 	XE_VMA_SUBOP_MAP_RANGE,
+	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
+	XE_VMA_SUBOP_UNMAP_RANGE,
 };
 
 /** struct xe_vma_op - VMA operation */
@@ -397,8 +405,10 @@ struct xe_vma_op {
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
 		struct xe_vma_op_prefetch prefetch;
-		/** @map: VMA map range operation specific data */
+		/** @map_range: VMA map range operation specific data */
 		struct xe_vma_op_map_range map_range;
+		/** @unmap_range: VMA unmap range operation specific data */
+		struct xe_vma_op_unmap_range unmap_range;
 	};
 };
 
-- 
2.34.1

