Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9D830EFA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD610E8BF;
	Wed, 17 Jan 2024 22:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6673A10E88E;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NlSNUzmtbb0LloT0UI8um7kADD6uSFV4tUPlRFVMeoI=;
 b=flYwp9QjUFAGjPj4M3HTIP6HCKZnyOupFZI+zQvHpyzMEx4WeGJo3jUQ
 TAfrYOfwTVwvlo8iU2SNh/0zRWpvq9ugMsnry+aosAeaAM2rCWd9f/9Kb
 BTw9KWkyMcM0l/m1dKd+2Daj0nnpopGVAdm13HFy+/E+4/91iNsGdBk21
 8Kv/AKxSDGBEWsDdx/WFdqGXnSTDoasv4IFA2g0V6iyVR1uDepWSX+zil
 slc5A4P1WWEv6mFRB3wSmNGofQhwckF5KbkYaLj5XyDMXtpoMycsiOGAt
 HgwmOLwBSbvHHnr0U9JRcC0/GGgJeLk5hMe0HxVx3OaIuHU95Oy0xTrxL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657620"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657620"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089237"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089237"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 07/23] drm/xe/svm: Add helper for binding hmm range to gpu
Date: Wed, 17 Jan 2024 17:12:07 -0500
Message-Id: <20240117221223.18540-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper function xe_bind_svm_range to bind a svm range
to gpu. A temporary xe_vma is created locally to re-use
existing page table update functions which are vma-based.

The svm page table update lock design is different from
userptr and bo page table update. A xe_pt_svm_pre_commit
function is introduced for svm range pre-commitment.

A hmm_range pointer is added to xe_vma struct.

v1: Make userptr member to be the last member of xe_vma struct

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 114 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pt.h       |   4 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  13 +++-
 3 files changed, 126 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..f1e479fa3001 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -17,6 +17,7 @@
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_svm.h"
 
 struct xe_pt_dir {
 	struct xe_pt pt;
@@ -582,8 +583,15 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
-	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
-		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
+	/*
+	 * FIXME: Right now assume all svm ranges bound to GPU is backed
+	 * by device memory. This assumption will change once migration
+	 * policy is implemented. A svm range's backing store can be a
+	 * mixture of device memory and system memory, page by page based.
+	 * We probably need a separate stage_bind function for svm.
+	 */
+	bool is_devmem = vma->svm_sg || (!xe_vma_is_userptr(vma) && bo &&
+		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo)));
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
@@ -617,7 +625,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	xe_bo_assert_held(bo);
 
 	if (!xe_vma_is_null(vma)) {
-		if (xe_vma_is_userptr(vma))
+		if (vma->svm_sg)
+			xe_res_first_sg(vma->svm_sg, 0, xe_vma_size(vma),
+					&curs);
+		else if (xe_vma_is_userptr(vma))
 			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
 					&curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
@@ -1046,6 +1057,28 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return 0;
 }
 
+static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vma *vma = pt_update->vma;
+	struct hmm_range *range = vma->hmm_range;
+
+	if (mmu_interval_read_retry(range->notifier,
+		    range->notifier_seq)) {
+		/*
+		 * FIXME: is this really necessary? We didn't update GPU
+		 * page table yet...
+		 */
+		xe_vm_invalidate_vma(vma);
+		return -EAGAIN;
+	}
+	return 0;
+}
+
+static const struct xe_migrate_pt_update_ops svm_bind_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.pre_commit = xe_pt_svm_pre_commit,
+};
+
 static const struct xe_migrate_pt_update_ops bind_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.pre_commit = xe_pt_pre_commit,
@@ -1197,7 +1230,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
 	struct xe_pt_migrate_pt_update bind_pt_update = {
 		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
+			.ops = vma->svm_sg ? &svm_bind_ops :
+					(xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops),
 			.vma = vma,
 			.tile_id = tile->id,
 		},
@@ -1651,3 +1685,75 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 
 	return fence;
 }
+
+/**
+ * xe_bind_svm_range() - bind an address range to vm
+ *
+ * @vm: the vm to bind this address range
+ * @tile: the tile to bind this address range to
+ * @range: a hmm_range which includes all the information
+ * needed for binding: virtual address range and physical
+ * pfns to back up this virtual address range.
+ * @flags: the binding flags to set in pte
+ *
+ * This is a helper function used by svm sub-system
+ * to bind a svm range to gpu vm. svm sub-system
+ * doesn't have xe_vma, thus helpers such as
+ * __xe_pt_bind_vma can't be used directly. So this
+ * helper is written for svm sub-system to use.
+ *
+ * This is a synchronous function. When this function
+ * returns, either the svm range is bound to GPU, or
+ * error happened.
+ *
+ * Return: 0 for success or error code for failure
+ * If -EAGAIN returns, it means mmu notifier was called (
+ * aka there was concurrent cpu page table update) during
+ * this function, caller has to retry hmm_range_fault
+ */
+int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
+			struct hmm_range *range, u64 flags)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_svm *svm = vm->svm;
+	int ret = 0;
+	/*
+	 * Create a temp vma to reuse page table helpers such as
+	 * __xe_pt_bind_vma
+	 */
+	struct xe_vma vma = {
+		.gpuva = {
+			.va = {
+				.addr = range->start,
+				.range = range->end - range->start + 1,
+			},
+			.vm = &vm->gpuvm,
+			.flags = flags,
+		},
+		.tile_mask = 0x1 << tile->id,
+		.hmm_range = range,
+	};
+
+	xe_svm_build_sg(range, &vma.svm_sgt);
+	vma.svm_sg = &vma.svm_sgt;
+
+	mutex_lock(&svm->mutex);
+	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
+		ret = -EAGAIN;
+		goto unlock;
+	}
+	xe_vm_lock(vm, true);
+	fence = __xe_pt_bind_vma(tile, &vma, vm->q[tile->id], NULL, 0, false);
+	xe_vm_unlock(vm);
+
+unlock:
+	mutex_unlock(&svm->mutex);
+	sg_free_table(vma.svm_sg);
+
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 71a4fbfcff43..775d08707466 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -17,6 +17,8 @@ struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
+struct xe_svm;
+struct hmm_range;
 
 /* Largest huge pte is currently 1GiB. May become device dependent. */
 #define MAX_HUGEPTE_LEVEL 2
@@ -45,4 +47,6 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
+int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
+			struct hmm_range *range, u64 flags);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 037fb7168c63..68c7484b2110 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,6 +21,7 @@ struct xe_svm;
 struct xe_bo;
 struct xe_sync_entry;
 struct xe_vm;
+struct hmm_range;
 
 #define TEST_VM_ASYNC_OPS_ERROR
 #define FORCE_ASYNC_OP_ERROR	BIT(31)
@@ -107,9 +108,19 @@ struct xe_vma {
 	 */
 	u16 pat_index;
 
+	/**
+	 * @svm_sgt: a scatter gather table to save svm virtual address range's
+	 * pfns
+	 */
+	struct sg_table svm_sgt;
+	struct sg_table *svm_sg;
+	/** hmm range of this pt update, used by svm */
+	struct hmm_range *hmm_range;
+
 	/**
 	 * @userptr: user pointer state, only allocated for VMAs that are
-	 * user pointers
+	 * user pointers. When you add new members to xe_vma struct, userptr
+	 * has to be the last member, xe_vma_create assumes this.
 	 */
 	struct xe_userptr userptr;
 };
-- 
2.26.3

