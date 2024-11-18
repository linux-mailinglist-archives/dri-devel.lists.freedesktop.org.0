Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613C9D1BF7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CD110E5B4;
	Mon, 18 Nov 2024 23:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLyenX8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FAB10E585;
 Mon, 18 Nov 2024 23:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973049; x=1763509049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CfghZNeiZ/DK/IeKHwi+ZoI/7jLbVs/H+RcKIZeBk8=;
 b=bLyenX8oX4Zc5hs7E/X0nBRp24yCGpjuH32yAdgnWDFk+tMhX9Mrw669
 YH+MCi8RxjGJELZXgJk0pf5QcUNR6MmL03+zrCKiHSntZ+pN19RfAUemu
 2pgPkatiVV/GhR6jf0iXvIRkU4FAYXvmFEX+Ch3qvDIb/rUQo9r0F9f7D
 LL1cqFxSB2yKCtQ2fhQhs3WxTA/JkyipVE1BHjUiEGy5/4F24JnlZgRDy
 BA4+5zlNF63NwokgcAjxI+ez6zrwFCXOOEe6fLbgZN6ndQSQseD1yWvM9
 MPPclIjxWzZaXEkMidgIhUHY1FIDdEIVtzDXE/3z+4WDFKJwcQURcV+G2 g==;
X-CSE-ConnectionGUID: nJCT9MhXTQ6Q/45tF3t3CA==
X-CSE-MsgGUID: /HGdwq34S9y2Ao+cTUGiFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878985"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878985"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
X-CSE-ConnectionGUID: +AHPvOiWR0KGnh/+KkCv0g==
X-CSE-MsgGUID: hugmTivTTHObyNN8UJGazw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521750"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 21/29] drm/xe: Enable preempt fences on usermap queues
Date: Mon, 18 Nov 2024 15:37:49 -0800
Message-Id: <20241118233757.2374041-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Preempt fences are used by usermap queues to implement dynamic memory
(BO eviction, userptr invalidation), enable preempt fences on usermap
queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c         |  3 +--
 drivers/gpu/drm/xe/xe_vm.c         | 18 ++++++++----------
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a22f089ccec6..987584090263 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -794,7 +794,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (IS_ERR(q))
 			return PTR_ERR(q);
 
-		if (xe_vm_in_preempt_fence_mode(vm)) {
+		if (xe_vm_in_preempt_fence_mode(vm) ||
+		    xe_exec_queue_is_usermap(q)) {
 			q->lr.context = dma_fence_context_alloc(1);
 
 			err = xe_vm_add_compute_exec_queue(vm, q);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 684dc075deac..a75667346ab3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1882,8 +1882,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	 * the rebind worker
 	 */
 	if (pt_update_ops->wait_vm_bookkeep &&
-	    xe_vm_in_preempt_fence_mode(vm) &&
-	    !current->mm)
+	    vm->preempt.num_exec_queues && !current->mm)
 		xe_vm_queue_rebind_worker(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e67648ed512..16bc1b82d950 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -229,7 +229,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	int err;
 	bool wait;
 
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm) ||
+		  xe_exec_queue_is_usermap(q));
 
 	down_write(&vm->lock);
 	err = drm_gpuvm_exec_lock(&vm_exec);
@@ -280,7 +281,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  */
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!xe_vm_in_preempt_fence_mode(vm))
+	if (!xe_vm_in_preempt_fence_mode(vm) && !xe_exec_queue_is_usermap(q))
 		return;
 
 	down_write(&vm->lock);
@@ -487,7 +488,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	down_write(&vm->lock);
@@ -1467,10 +1468,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (vm->flags & XE_VM_FLAG_LR_MODE) {
-		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+	INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		vm->batch_invalidate_tlb = false;
-	}
 
 	/* Fill pt_root after allocating scratch tables */
 	for_each_tile(tile, xe, id) {
@@ -1543,8 +1543,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
 	xe_vm_close(vm);
-	if (xe_vm_in_preempt_fence_mode(vm))
-		flush_work(&vm->preempt.rebind_work);
+	flush_work(&vm->preempt.rebind_work);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1644,8 +1643,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
-	if (xe_vm_in_preempt_fence_mode(vm))
-		flush_work(&vm->preempt.rebind_work);
+	flush_work(&vm->preempt.rebind_work);
 
 	mutex_destroy(&vm->snap_mutex);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..4391dbaeba51 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -216,7 +216,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
-- 
2.34.1

