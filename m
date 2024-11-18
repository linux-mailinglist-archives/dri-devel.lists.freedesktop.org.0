Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE83B9D1BF5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613C710E5B5;
	Mon, 18 Nov 2024 23:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmErJ+oN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0241C10E592;
 Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973052; x=1763509052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k6npIro/CDXRVdYry+Z7wVHzj1KL9gz5MwjkQUsk+8Y=;
 b=QmErJ+oNGVpf3Xo/AyQk3AvaXNx99XveupDettHBdxBnDt+kxUE2l2Jb
 KLcxHGjBW30bWqV7MnCx1mEMsftPK/b+NH+R3CeTlNhX3j3iJSMOqo9LN
 YTOhgx6NSygOL19d6X+dTIHqFTs9N6cyTBjEI+5vaM/pNPcgZWWu1X0tq
 2LEIT2wVWWkLvWvYGn/AE+y5XtZCdiKolyGPyElV1Cfs6kcu3ycOwQw8m
 b1ePMOUWbVYAg98jMoy+W2W76DVmLzBJkwxEXY4eBfdsE72OrbmHVnciE
 nf9Vj9hFtG2S3Bi9D2gwNdvOEjUq2NKmQ1w5ZeEA603Bdx+5uqp430nB/ g==;
X-CSE-ConnectionGUID: y3+dy3ahR8uf5aMpLwP5Pw==
X-CSE-MsgGUID: zyomD7BiSqON0jIJMLsNTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31879040"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31879040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:31 -0800
X-CSE-ConnectionGUID: 4ewmGeeVSXSAonED7NscQw==
X-CSE-MsgGUID: fWWSngICRRqLPLlUCOYldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521783"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 29/29] drm/xe: Add user fence TDR
Date: Mon, 18 Nov 2024 15:37:57 -0800
Message-Id: <20241118233757.2374041-30-matthew.brost@intel.com>
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

We cannot let user fences exported as dma-fence run forever. Add a TDR
to protect against this. If the TDR fires the entire VM is killed as
dma-fences are not tied to an individual queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 164 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  22 +++++
 2 files changed, 179 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5078aeea2bd8..8b475e76bfe0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -30,6 +30,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_hw_fence.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -336,11 +337,15 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	if (unlocked)
 		xe_vm_lock(vm, false);
 
-	vm->flags |= XE_VM_FLAG_BANNED;
-	trace_xe_vm_kill(vm);
+	if (!(vm->flags |= XE_VM_FLAG_BANNED)) {
+		vm->flags |= XE_VM_FLAG_BANNED;
+		trace_xe_vm_kill(vm);
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
-		q->ops->kill(q);
+		list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
+			q->ops->kill(q);
+
+		/* TODO: Unmap usermap doorbells */
+	}
 
 	if (unlocked)
 		xe_vm_unlock(vm);
@@ -1393,6 +1398,9 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void userfence_tdr(struct work_struct *w);
+static void userfence_kill(struct work_struct *w);
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1517,6 +1525,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
+	spin_lock_init(&vm->userfence.lock);
+	INIT_LIST_HEAD(&vm->userfence.pending_list);
+	vm->userfence.timeout = HZ * 5;
+	INIT_DELAYED_WORK(&vm->userfence.tdr, userfence_tdr);
+	INIT_WORK(&vm->userfence.kill_work, userfence_kill);
+
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
@@ -1562,6 +1576,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	flush_work(&vm->preempt.rebind_work);
 
+	flush_delayed_work(&vm->userfence.tdr);
+	flush_work(&vm->userfence.kill_work);
+
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
 		if (vm->q[id])
@@ -3449,6 +3466,114 @@ static int check_semaphores(struct xe_vm *vm, struct xe_sync_entry *syncs,
 	return 0;
 }
 
+struct tdr_item {
+	struct dma_fence *fence;
+	struct xe_vm *vm;
+	struct list_head link;
+	struct dma_fence_cb cb;
+	u64 deadline;
+};
+
+static void userfence_kill(struct work_struct *w)
+{
+	struct xe_vm *vm =
+		container_of(w, struct xe_vm, userfence.kill_work);
+
+	down_write(&vm->lock);
+	xe_vm_kill(vm, true);
+	up_write(&vm->lock);
+}
+
+static void userfence_tdr(struct work_struct *w)
+{
+	struct xe_vm *vm =
+		container_of(w, struct xe_vm, userfence.tdr.work);
+	struct tdr_item *tdr_item;
+	bool timeout = false, cookie = dma_fence_begin_signalling();
+
+	xe_hw_fence_irq_stop(&vm->xe->user_fence_irq);
+
+	spin_lock_irq(&vm->userfence.lock);
+	list_for_each_entry(tdr_item, &vm->userfence.pending_list, link) {
+		if (!dma_fence_is_signaled(tdr_item->fence)) {
+			drm_notice(&vm->xe->drm,
+				   "Timedout usermap fence: seqno=%llu, deadline=%llu, jiffies=%llu",
+				   tdr_item->fence->seqno, tdr_item->deadline,
+				   get_jiffies_64());
+			dma_fence_set_error(tdr_item->fence, -ETIME);
+			timeout = true;
+			vm->userfence.timeout = 0;
+		}
+	}
+	spin_unlock_irq(&vm->userfence.lock);
+
+	xe_hw_fence_irq_start(&vm->xe->user_fence_irq);
+
+	/*
+	 * This is dma-fence signaling path so we cannot take the locks requires
+	 * to kill a VM. Defer killing to a worker.
+	 */
+	if (timeout)
+		schedule_work(&vm->userfence.kill_work);
+
+	dma_fence_end_signalling(cookie);
+}
+
+static void userfence_fence_cb(struct dma_fence *fence,
+			       struct dma_fence_cb *cb)
+{
+	struct tdr_item *next, *tdr_item = container_of(cb, struct tdr_item, cb);
+	struct xe_vm *vm = tdr_item->vm;
+	struct xe_gt *gt = xe_device_get_gt(vm->xe, 0);
+
+	if (fence)
+		spin_lock(&vm->userfence.lock);
+	else
+		spin_lock_irq(&vm->userfence.lock);
+
+	list_del(&tdr_item->link);
+	next = list_first_entry_or_null(&vm->userfence.pending_list,
+					typeof(*next), link);
+	if (next)
+		mod_delayed_work(gt->ordered_wq, &vm->userfence.tdr,
+				 next->deadline - get_jiffies_64());
+	else
+		cancel_delayed_work(&vm->userfence.tdr);
+
+	if (fence)
+		spin_unlock(&vm->userfence.lock);
+	else
+		spin_unlock_irq(&vm->userfence.lock);
+
+	dma_fence_put(tdr_item->fence);
+	xe_vm_put(tdr_item->vm);
+	kfree(tdr_item);
+}
+
+static void userfence_tdr_add(struct xe_vm *vm, struct tdr_item *tdr_item,
+			      struct dma_fence *fence)
+{
+	struct xe_gt *gt = xe_device_get_gt(vm->xe, 0);
+	int ret;
+
+	tdr_item->fence = dma_fence_get(fence);
+	tdr_item->vm = xe_vm_get(vm);
+	INIT_LIST_HEAD(&tdr_item->link);
+	tdr_item->deadline = vm->userfence.timeout + get_jiffies_64();
+
+	spin_lock_irq(&vm->userfence.lock);
+	list_add_tail(&tdr_item->link, &vm->userfence.pending_list);
+	if (list_is_singular(&vm->userfence.pending_list))
+		mod_delayed_work(gt->ordered_wq,
+				 &vm->userfence.tdr,
+				 vm->userfence.timeout);
+	spin_unlock_irq(&vm->userfence.lock);
+
+	ret = dma_fence_add_callback(fence, &tdr_item->cb, userfence_fence_cb);
+	if (ret == -ENOENT)
+		userfence_fence_cb(NULL, &tdr_item->cb);
+}
+
 int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file)
 {
@@ -3459,6 +3584,7 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_semaphore __user *semaphores_user;
 	struct xe_sync_entry *syncs = NULL;
 	struct xe_vm *vm;
+	struct tdr_item **tdr_items = NULL;
 	int err = 0, i, num_syncs = 0;
 	bool done = false;
 	struct drm_exec exec;
@@ -3493,6 +3619,12 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 		goto release_vm_lock;
 	}
 
+	tdr_items = kcalloc(args->num_syncs, sizeof(*tdr_items), GFP_KERNEL);
+	if (!tdr_items) {
+		err = -ENOMEM;
+		goto release_vm_lock;
+	}
+
 	syncs_user = u64_to_user_ptr(args->syncs);
 	semaphores_user = u64_to_user_ptr(args->semaphores);
 	for (i = 0; i < args->num_syncs; i++, num_syncs++) {
@@ -3505,6 +3637,15 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 		if (err)
 			goto release_syncs;
 
+		if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) {
+			tdr_items[i] = kmalloc(sizeof(struct tdr_item),
+					       GFP_KERNEL);
+			if (!tdr_items[i]) {
+				xe_sync_entry_cleanup(&syncs[i]);
+				goto release_syncs;
+			}
+		}
+
 		err = xe_sync_semaphore_parse(xe, xef, semaphore_sync,
 					      &semaphores_user[i],
 					      sync->flags);
@@ -3591,6 +3732,10 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 				&semaphore_sync->chain_fence->base;
 			semaphore_sync->chain_fence = NULL;
 
+			userfence_tdr_add(vm, tdr_items[i],
+					  semaphore_sync->fence);
+			tdr_items[i] = 0;
+
 			semaphore_sync->fence = NULL;   /* Ref owned by chain */
 		} else {
 			xe_sync_entry_signal(semaphore_sync, sync->fence);
@@ -3617,9 +3762,13 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 out_unlock:
 	drm_exec_fini(&exec);
 release_syncs:
-	while (err != -EAGAIN && num_syncs--) {
-		xe_sync_entry_cleanup(&syncs[num_syncs]);
-		xe_sync_entry_cleanup(&syncs[args->num_syncs + num_syncs]);
+	if (err != -EAGAIN) {
+		for (i = 0; i < num_syncs; ++i)
+			kfree(tdr_items[i]);
+		while (num_syncs--) {
+			xe_sync_entry_cleanup(&syncs[num_syncs]);
+			xe_sync_entry_cleanup(&syncs[args->num_syncs + num_syncs]);
+		}
 	}
 release_vm_lock:
 	if (err == -EAGAIN)
@@ -3629,6 +3778,7 @@ int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
 	xe_vm_put(vm);
 	free_preempt_fences(&preempt_fences);
 	kfree(syncs);
+	kfree(tdr_items);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c5cb83722706..49cac5716f72 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -260,6 +260,28 @@ struct xe_vm {
 		struct dma_fence *exported_fence;
 	} preempt;
 
+	/** @userfence: User fence state */
+	struct {
+		/**
+		 * @userfence.lock: fence lock
+		 */
+		spinlock_t lock;
+		/**
+		 * @userfence.pending_list: pending fence list, protected by
+		 * userfence.lock
+		 */
+		struct list_head pending_list;
+		/** @userfence.tdr: fence TDR */
+		struct delayed_work tdr;
+		/** @userfence.kill_work */
+		struct work_struct kill_work;
+		/**
+		 * @userfence.timeout: Fence timeout period, protected by
+		 * userfence.lock
+		 */
+		u32 timeout;
+	} userfence;
+
 	/** @um: unified memory state */
 	struct {
 		/** @asid: address space ID, unique to each VM */
-- 
2.34.1

