Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2F81ADF8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6510E66A;
	Thu, 21 Dec 2023 04:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665010E653;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFTI+4vG3BRrNxkKNlzHPA05bP2aYXoRLJZ0TZub+CI=;
 b=BbGTmMDEDOU6tY+F396cFQmCC2ozUAGAEBUdCTVz4dyC7Njf767KDcYI
 5L9AgNXp+30g0j7xBzeKvOHMG8333+E/djqDatbsxMzTXFA05Go7XrU0v
 mznhc6EllwegivTb/8lD8exgSoO2mmjz+3HFJQ1EY87IPxHR9DJuVS6Z2
 zSmY6zsuPNR4K1r8RCVzDCuUlPcWyPEEg5R3KKHfPjy29XWDPCYnyBW0d
 Y813gcQOEI9xolHaJxAqE12T/CBkXAd10rstxVbYV8Hn3ZOkYuf7QbubU
 xmLTWiGXmEvZ/iSv1nccHNHn0/ASdRyDnu5miSnmqTzIKY3W42JTfKB9l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069766"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481358"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481358"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 07/22] drm/xe/svm: Add helper for binding hmm range to gpu
Date: Wed, 20 Dec 2023 23:37:57 -0500
Message-Id: <20231221043812.3783313-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper function xe_bind_svm_range to bind a svm range
to gpu. A temporary xe_vma is created locally to re-use
existing page table update functions which are vma-based.

The svm page table update lock design is different from
userptr and bo page table update. A xe_pt_svm_pre_commit
function is introduced for svm range pre-commitment.

A hmm_range pointer is added to xe_vma struct.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 101 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt.h       |   4 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  10 +++
 3 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..65cfac88ab2f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -17,6 +17,7 @@
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_svm.h"
 
 struct xe_pt_dir {
 	struct xe_pt pt;
@@ -617,7 +618,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
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
@@ -1046,6 +1050,28 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
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
@@ -1197,7 +1223,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
 	struct xe_pt_migrate_pt_update bind_pt_update = {
 		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
+			.ops = vma->svm_sg ? &svm_bind_ops :
+					(xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops),
 			.vma = vma,
 			.tile_id = tile->id,
 		},
@@ -1651,3 +1678,73 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 
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
+	fence = __xe_pt_bind_vma(tile, &vma, vm->q[tile->id], NULL, 0, false);
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
index 037fb7168c63..deefe2364667 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,6 +21,7 @@ struct xe_svm;
 struct xe_bo;
 struct xe_sync_entry;
 struct xe_vm;
+struct hmm_range;
 
 #define TEST_VM_ASYNC_OPS_ERROR
 #define FORCE_ASYNC_OP_ERROR	BIT(31)
@@ -112,6 +113,15 @@ struct xe_vma {
 	 * user pointers
 	 */
 	struct xe_userptr userptr;
+
+	/**
+	 * @svm_sgt: a scatter gather table to save svm virtual address range's
+	 * pfns
+	 */
+	struct sg_table svm_sgt;
+	struct sg_table *svm_sg;
+	/** hmm range of this pt update, used by svm */
+	struct hmm_range *hmm_range;
 };
 
 struct xe_device;
-- 
2.26.3

