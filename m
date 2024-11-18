Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1B9D1BE9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BA910E585;
	Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxWSwJNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE910E040;
 Mon, 18 Nov 2024 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973044; x=1763509044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ai1mfcFgevmGKJpWo6ttA0URBdnq6ylMV+L0WkHjHAE=;
 b=YxWSwJNX3N15bO3ZOOOdHANtnXMY+u9ymh+rMG2hkCQ7Obfe5+vFfYXR
 m6dWo/jL0VuvMWyOp3QhII3616XZgGZ2cFvmBuVGHo39rPzyd7hxzQCN2
 fWlO8XvHX0CkssU+z06ZW1BLMLN4zh8eh1I8G2CaUZh7YdBe+Xw/bnlFF
 9fceaIyMsKd5xdpOcdUlzGaAY5mHG02Pe5VWHXaHjIbQyl1dwcexrCLi1
 Bvb3qcDDb0wZuL2C2khNk5gUbXK/ZsaOVHB66ie3JBKe6AvfPAxE31bAt
 Brms1xYkuceHaj7bVUe7OD3bBeqa5e0KEgkymq6Nc2/xYXY+WSGX3hFpQ w==;
X-CSE-ConnectionGUID: 0vaWaVaqRLirB7c1vgcYTg==
X-CSE-MsgGUID: od3euoxkT9KBmEs0lwivRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878863"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
X-CSE-ConnectionGUID: vTVMy150R7GutH79N6O82w==
X-CSE-MsgGUID: 0YbWrGI0RN+bhm79ph4ZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521679"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 03/29] drm/xe: Use dma_fence_preempt base class
Date: Mon, 18 Nov 2024 15:37:31 -0800
Message-Id: <20241118233757.2374041-4-matthew.brost@intel.com>
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

Use the dma_fence_preempt base class in Xe instead of open-coding the
preemption implementation.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-preempt.c         |  5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  3 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c     |  4 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c       | 80 ++++++---------------
 drivers/gpu/drm/xe/xe_preempt_fence.h       |  2 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h | 11 +--
 6 files changed, 34 insertions(+), 71 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
index 6e6ce7ea7421..bcc5e5cec919 100644
--- a/drivers/dma-buf/dma-fence-preempt.c
+++ b/drivers/dma-buf/dma-fence-preempt.c
@@ -8,11 +8,11 @@
 
 static void dma_fence_preempt_work_func(struct work_struct *w)
 {
-	bool cookie = dma_fence_begin_signalling();
 	struct dma_fence_preempt *pfence =
 		container_of(w, typeof(*pfence), work);
 	const struct dma_fence_preempt_ops *ops = pfence->ops;
 	int err = pfence->base.error;
+	bool cookie = dma_fence_begin_signalling();
 
 	if (!err) {
 		err = ops->preempt_wait(pfence);
@@ -23,6 +23,7 @@ static void dma_fence_preempt_work_func(struct work_struct *w)
 	dma_fence_signal(&pfence->base);
 	ops->preempt_finished(pfence);
 
+	/* The entire worker is signaling path, thus annotate the entirety */
 	dma_fence_end_signalling(cookie);
 }
 
@@ -109,7 +110,7 @@ EXPORT_SYMBOL(dma_fence_is_preempt);
  *
  * @fence: Preempt fence
  * @ops: Preempt fence operations
- * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
+ * @wq: Work queue for preempt wait, must have WQ_MEM_RECLAIM set
  * @context: Fence context
  * @seqno: Fence seqence number
  */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f9ecee5364d8..58a3f4bb3887 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1603,6 +1603,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	int ret;
 
+	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q))
+		return -ECANCELED;
+
 	/*
 	 * Likely don't need to check exec_queue_killed() as we clear
 	 * suspend_pending upon kill but to be paranoid but races in which
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 82750520a90a..8ed5410c3964 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -163,7 +163,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
 		q->ops->suspend(q);
 		err = q->ops->suspend_wait(q);
-		if (err)
+		if (err == -ETIME)
 			goto err_suspend;
 
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
@@ -236,7 +236,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			continue;
 
 		err = q->ops->suspend_wait(q);
-		if (err)
+		if (err == -ETIME)
 			goto err_suspend;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 83fbeea5aa20..80a8bc82f3cc 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -4,73 +4,40 @@
  */
 
 #include "xe_preempt_fence.h"
-
-#include <linux/slab.h>
-
 #include "xe_exec_queue.h"
 #include "xe_vm.h"
 
-static void preempt_fence_work_func(struct work_struct *w)
+static struct xe_exec_queue *to_exec_queue(struct dma_fence_preempt *fence)
 {
-	bool cookie = dma_fence_begin_signalling();
-	struct xe_preempt_fence *pfence =
-		container_of(w, typeof(*pfence), preempt_work);
-	struct xe_exec_queue *q = pfence->q;
-
-	if (pfence->error) {
-		dma_fence_set_error(&pfence->base, pfence->error);
-	} else if (!q->ops->reset_status(q)) {
-		int err = q->ops->suspend_wait(q);
-
-		if (err)
-			dma_fence_set_error(&pfence->base, err);
-	} else {
-		dma_fence_set_error(&pfence->base, -ENOENT);
-	}
-
-	dma_fence_signal(&pfence->base);
-	/*
-	 * Opt for keep everything in the fence critical section. This looks really strange since we
-	 * have just signalled the fence, however the preempt fences are all signalled via single
-	 * global ordered-wq, therefore anything that happens in this callback can easily block
-	 * progress on the entire wq, which itself may prevent other published preempt fences from
-	 * ever signalling.  Therefore try to keep everything here in the callback in the fence
-	 * critical section. For example if something below grabs a scary lock like vm->lock,
-	 * lockdep should complain since we also hold that lock whilst waiting on preempt fences to
-	 * complete.
-	 */
-	xe_vm_queue_rebind_worker(q->vm);
-	xe_exec_queue_put(q);
-	dma_fence_end_signalling(cookie);
+	return container_of(fence, struct xe_preempt_fence, base)->q;
 }
 
-static const char *
-preempt_fence_get_driver_name(struct dma_fence *fence)
+static int xe_preempt_fence_preempt(struct dma_fence_preempt *fence)
 {
-	return "xe";
+	struct xe_exec_queue *q = to_exec_queue(fence);
+
+	return q->ops->suspend(q);
 }
 
-static const char *
-preempt_fence_get_timeline_name(struct dma_fence *fence)
+static int xe_preempt_fence_preempt_wait(struct dma_fence_preempt *fence)
 {
-	return "preempt";
+	struct xe_exec_queue *q = to_exec_queue(fence);
+
+	return q->ops->suspend_wait(q);
 }
 
-static bool preempt_fence_enable_signaling(struct dma_fence *fence)
+static void xe_preempt_fence_preempt_finished(struct dma_fence_preempt *fence)
 {
-	struct xe_preempt_fence *pfence =
-		container_of(fence, typeof(*pfence), base);
-	struct xe_exec_queue *q = pfence->q;
+	struct xe_exec_queue *q = to_exec_queue(fence);
 
-	pfence->error = q->ops->suspend(q);
-	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
-	return true;
+	xe_vm_queue_rebind_worker(q->vm);
+	xe_exec_queue_put(q);
 }
 
-static const struct dma_fence_ops preempt_fence_ops = {
-	.get_driver_name = preempt_fence_get_driver_name,
-	.get_timeline_name = preempt_fence_get_timeline_name,
-	.enable_signaling = preempt_fence_enable_signaling,
+static const struct dma_fence_preempt_ops xe_preempt_fence_ops = {
+	.preempt = xe_preempt_fence_preempt,
+	.preempt_wait = xe_preempt_fence_preempt_wait,
+	.preempt_finished = xe_preempt_fence_preempt_finished,
 };
 
 /**
@@ -95,7 +62,6 @@ struct xe_preempt_fence *xe_preempt_fence_alloc(void)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&pfence->link);
-	INIT_WORK(&pfence->preempt_work, preempt_fence_work_func);
 
 	return pfence;
 }
@@ -134,11 +100,11 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 {
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
-	spin_lock_init(&pfence->lock);
-	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &pfence->lock, context, seqno);
 
-	return &pfence->base;
+	dma_fence_preempt_init(&pfence->base, &xe_preempt_fence_ops,
+			       q->vm->xe->preempt_fence_wq, context, seqno);
+
+	return &pfence->base.base;
 }
 
 /**
@@ -169,5 +135,5 @@ xe_preempt_fence_create(struct xe_exec_queue *q,
 
 bool xe_fence_is_xe_preempt(const struct dma_fence *fence)
 {
-	return fence->ops == &preempt_fence_ops;
+	return dma_fence_is_preempt(fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.h b/drivers/gpu/drm/xe/xe_preempt_fence.h
index 9406c6fea525..7b56d12c0786 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.h
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.h
@@ -25,7 +25,7 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 static inline struct xe_preempt_fence *
 to_preempt_fence(struct dma_fence *fence)
 {
-	return container_of(fence, struct xe_preempt_fence, base);
+	return container_of(fence, struct xe_preempt_fence, base.base);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence_types.h b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
index 312c3372a49f..f12b89f7dc35 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
@@ -6,8 +6,7 @@
 #ifndef _XE_PREEMPT_FENCE_TYPES_H_
 #define _XE_PREEMPT_FENCE_TYPES_H_
 
-#include <linux/dma-fence.h>
-#include <linux/workqueue.h>
+#include <linux/dma-fence-preempt.h>
 
 struct xe_exec_queue;
 
@@ -18,17 +17,11 @@ struct xe_exec_queue;
  */
 struct xe_preempt_fence {
 	/** @base: dma fence base */
-	struct dma_fence base;
+	struct dma_fence_preempt base;
 	/** @link: link into list of pending preempt fences */
 	struct list_head link;
 	/** @q: exec queue for this preempt fence */
 	struct xe_exec_queue *q;
-	/** @preempt_work: work struct which issues preemption */
-	struct work_struct preempt_work;
-	/** @lock: dma-fence fence lock */
-	spinlock_t lock;
-	/** @error: preempt fence is in error state */
-	int error;
 };
 
 #endif
-- 
2.34.1

