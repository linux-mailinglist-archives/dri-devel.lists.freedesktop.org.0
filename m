Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092519C2EC1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6E210E36C;
	Sat,  9 Nov 2024 17:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cspT+nq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEFE10E357;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riqz8eY/siyAhQVH1HHpAKOLT3Phpq/w4bOO076Xg54=;
 b=cspT+nq/VdD1rpbUo0DfwFTim/or0fE+plvy1gm97munVboQ9IfpShj4
 6fYJLrQgkB3VMHZws86GXt0VeO72se2PcfD+Kn8Y22BfsL2OwsFJdtn7R
 LUvrF+rUaWQSkQq7vzK1YjhcUTS2PbrQHvFOzQzvY/8IcPZ5oXz8p5reG
 b88B5oRbj4aLilnn2jV2h0xdon/In9+GOlAwighPvTZ5GIwK11bcPsp9M
 1l2WiDmtqo4GpcXc6+ZDFxeh9knaE6mZRVdCCEmzwZ2YWJYNS8LQQ5F3r
 /5I2fRSpwCpzueF+qF+wyScGUiWX5V9+MvTxmgOaM0LCHSmWNfsFXOe72 Q==;
X-CSE-ConnectionGUID: piS6RrjeSs6U7q1nSgEoHw==
X-CSE-MsgGUID: 1yvXiiW7Sry8JcfcFMzaKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600147"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600147"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:15 -0800
X-CSE-ConnectionGUID: uvn8IVJhSK6vnjGPd8IE6Q==
X-CSE-MsgGUID: JvxwK6OzTAGQ+rmBUxrYdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499494"
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
Subject: [RFC PATCH 6/6] drm/xe: Use dma_fence_preempt base class
Date: Sat,  9 Nov 2024 09:29:42 -0800
Message-Id: <20241109172942.482630-7-matthew.brost@intel.com>
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

Use the dma_fence_preempt base class in Xe instead of open-coding the
preemption implementation.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c          |  3 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c     |  4 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c       | 81 ++++++---------------
 drivers/gpu/drm/xe/xe_preempt_fence.h       |  2 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h | 11 +--
 5 files changed, 32 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e0f86f3778b..0411ec9ed705 100644
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
index 83fbeea5aa20..34418454d65c 100644
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
@@ -134,11 +100,12 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 {
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
-	spin_lock_init(&pfence->lock);
-	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &pfence->lock, context, seqno);
 
-	return &pfence->base;
+	dma_fence_preempt_init(&pfence->base, &xe_preempt_fence_ops,
+			       xe_vm_resv(q->vm), q->vm->xe->preempt_fence_wq,
+			       context, seqno);
+
+	return &pfence->base.base;
 }
 
 /**
@@ -169,5 +136,5 @@ xe_preempt_fence_create(struct xe_exec_queue *q,
 
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

