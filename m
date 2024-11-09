Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5179C2EC2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045C510E36E;
	Sat,  9 Nov 2024 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka5T3NzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFACB10E357;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AoY1SdHGeG5w1ptfOQPooNP7s2JrJ8K10jQpyOgPu0k=;
 b=Ka5T3NzYyY8U4ZXmCPwDkLfbl7GUXVwnnER39sSICx+W0lxAzW95PEzy
 LfjFm5ICTAXCJCFCq/77BrwcaC1XmUdCe3smveMevoDiNE4tc7BL7QQSj
 hk5pwHjXxy1rIu8LNR5OcowXTmjOXkrKaKNkJVtvQsBX12TZuTBiA7Q78
 rR2asHiWVxZ+2ZTmniS4P+OrezQ2MHgCDt+xMKmMznNGeN2EZfSNcumhK
 hesLnR6VxGNyakXVHT15TqevicoJ60WY57bMRvUZlA8FhF9u7aLwYO4u8
 py/8OdycTSSV8k8WTItmO5Yu37n2hyLqfPxJZi5zvZ72YPwXsvxEdiqsQ g==;
X-CSE-ConnectionGUID: y/F6fdTsTUmgmEzxbIAspA==
X-CSE-MsgGUID: Lgb3hap9QLi7MM8RlRPuSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600139"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:15 -0800
X-CSE-ConnectionGUID: iSHUwmOKQPqD0pTIxDlVEA==
X-CSE-MsgGUID: SHyQiTRDQA6C7DbCYqbGbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499492"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 5/6] drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
Date: Sat,  9 Nov 2024 09:29:41 -0800
Message-Id: <20241109172942.482630-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
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

Use the new DMA_RESV_USAGE_PREEMPT dma-resv slots in Xe for preemptive
fences, and call them in dma-resv/scheduler rather than open-coding the
enabling of signaling before waiting.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 22 +++++-----------------
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c      | 12 ++----------
 drivers/gpu/drm/xe/xe_vm.c      | 22 ++++------------------
 4 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 549866da5cd1..7ab7d27b66c6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -484,23 +484,11 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 				const struct ttm_operation_ctx *ctx)
 {
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	struct drm_gem_object *obj = &bo->ttm.base;
 	struct drm_gpuvm_bo *vm_bo;
 	bool idle = false;
 	int ret = 0;
 
-	dma_resv_assert_held(bo->ttm.base.resv);
-
-	if (!list_empty(&bo->ttm.base.gpuva.list)) {
-		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
-				    DMA_RESV_USAGE_BOOKKEEP);
-		dma_resv_for_each_fence_unlocked(&cursor, fence)
-			dma_fence_enable_sw_signaling(fence);
-		dma_resv_iter_end(&cursor);
-	}
-
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
 		struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
 		struct drm_gpuva *gpuva;
@@ -515,11 +503,11 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 			if (ctx->no_wait_gpu &&
 			    !dma_resv_test_signaled(bo->ttm.base.resv,
-						    DMA_RESV_USAGE_BOOKKEEP))
+						    DMA_RESV_USAGE_PREEMPT))
 				return -EBUSY;
 
 			timeout = dma_resv_wait_timeout(bo->ttm.base.resv,
-							DMA_RESV_USAGE_BOOKKEEP,
+							DMA_RESV_USAGE_PREEMPT,
 							ctx->interruptible,
 							MAX_SCHEDULE_TIMEOUT);
 			if (!timeout)
@@ -723,7 +711,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	if (old_mem_type == XE_PL_TT &&
 	    new_mem->mem_type == XE_PL_SYSTEM) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
-						     DMA_RESV_USAGE_BOOKKEEP,
+						     DMA_RESV_USAGE_PREEMPT,
 						     true,
 						     MAX_SCHEDULE_TIMEOUT);
 		if (timeout < 0) {
@@ -1056,7 +1044,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	 * unbind.
 	 */
 	dma_resv_for_each_fence(&cursor, ttm_bo->base.resv,
-				DMA_RESV_USAGE_BOOKKEEP, fence) {
+				DMA_RESV_USAGE_PREEMPT, fence) {
 		if (xe_fence_is_xe_preempt(fence) &&
 		    !dma_fence_is_signaled(fence)) {
 			if (!replacement)
@@ -1065,7 +1053,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 			dma_resv_replace_fences(ttm_bo->base.resv,
 						fence->context,
 						replacement,
-						DMA_RESV_USAGE_BOOKKEEP);
+						DMA_RESV_USAGE_PREEMPT);
 		}
 	}
 	dma_fence_put(replacement);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..75067c584581 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -895,10 +895,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_sched_job_add_migrate_flush(job, flush_flags);
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
-						    DMA_RESV_USAGE_BOOKKEEP);
+						    DMA_RESV_USAGE_PREEMPT);
 			if (!err && src_bo != dst_bo)
 				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
-							    DMA_RESV_USAGE_BOOKKEEP);
+							    DMA_RESV_USAGE_PREEMPT);
 			if (err)
 				goto err_job;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f27f579f4d85..00358e748d0d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1115,7 +1115,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (pt_update_ops->wait_vm_bookkeep || pt_update_ops->wait_vm_kernel) {
 		err = job_test_add_deps(job, xe_vm_resv(vm),
 					pt_update_ops->wait_vm_bookkeep ?
-					DMA_RESV_USAGE_BOOKKEEP :
+					DMA_RESV_USAGE_PREEMPT :
 					DMA_RESV_USAGE_KERNEL);
 		if (err)
 			return err;
@@ -1231,18 +1231,10 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 		spin_unlock(&vm->userptr.invalidated_lock);
 
 		if (xe_vm_in_preempt_fence_mode(vm)) {
-			struct dma_resv_iter cursor;
-			struct dma_fence *fence;
 			long err;
 
-			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
-					    DMA_RESV_USAGE_BOOKKEEP);
-			dma_resv_for_each_fence_unlocked(&cursor, fence)
-				dma_fence_enable_sw_signaling(fence);
-			dma_resv_iter_end(&cursor);
-
 			err = dma_resv_wait_timeout(xe_vm_resv(vm),
-						    DMA_RESV_USAGE_BOOKKEEP,
+						    DMA_RESV_USAGE_PREEMPT,
 						    false, MAX_SCHEDULE_TIMEOUT);
 			XE_WARN_ON(err <= 0);
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 624133fae5f5..568395530c49 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -195,7 +195,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 		if (q->lr.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
 					   q->lr.pfence,
-					   DMA_RESV_USAGE_BOOKKEEP);
+					   DMA_RESV_USAGE_PREEMPT);
 		}
 
 	return 0;
@@ -213,7 +213,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
 		q->ops->resume(q);
 
 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->lr.pfence,
-					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
+					 DMA_RESV_USAGE_PREEMPT, DMA_RESV_USAGE_PREEMPT);
 	}
 }
 
@@ -250,7 +250,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	down_read(&vm->userptr.notifier_lock);
 
 	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
-				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
+				 DMA_RESV_USAGE_PREEMPT, DMA_RESV_USAGE_PREEMPT);
 
 	/*
 	 * Check to see if a preemption on VM is in flight or userptr
@@ -588,8 +588,6 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma), userptr);
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	long err;
 
 	xe_assert(vm->xe, xe_vma_is_userptr(vma));
@@ -625,20 +623,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 
 	up_write(&vm->userptr.notifier_lock);
 
-	/*
-	 * Preempt fences turn into schedule disables, pipeline these.
-	 * Note that even in fault mode, we need to wait for binds and
-	 * unbinds to complete, and those are attached as BOOKMARK fences
-	 * to the vm.
-	 */
-	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
-			    DMA_RESV_USAGE_BOOKKEEP);
-	dma_resv_for_each_fence_unlocked(&cursor, fence)
-		dma_fence_enable_sw_signaling(fence);
-	dma_resv_iter_end(&cursor);
-
 	err = dma_resv_wait_timeout(xe_vm_resv(vm),
-				    DMA_RESV_USAGE_BOOKKEEP,
+				    DMA_RESV_USAGE_PREEMPT,
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-- 
2.34.1

