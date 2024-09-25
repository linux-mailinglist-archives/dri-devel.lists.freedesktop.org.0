Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EB9858E9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D914E10E945;
	Wed, 25 Sep 2024 11:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LiM3pxZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EC010E945;
 Wed, 25 Sep 2024 11:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D48465C59CB;
 Wed, 25 Sep 2024 11:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0EFC4AF09;
 Wed, 25 Sep 2024 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264895;
 bh=+unPNRl+03wb8ZotHv2pXBjh8TBrWALw0LqejKzpHdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LiM3pxZkChfgDREr1qBtj8pIsSrhrGPfUvz+MAOvxE0PA6j17OF188YBRWLIwHXzH
 JKduJMPvr+L+l3lyYV5c2NU0IOSEJ14CVFd96yIzqeoChvu4a6UM9JfpeOie03DcWP
 4t+Kw4LqDIsOR7PjdUunNqCU0uFfKZc+r50EXBsIiz2WfV6Q/U4hnAfy0UZIyjyNTb
 9VQHZhgba3MIPrckPLXkWQfHThTkM+UiZy8paxHI2pxpTAejXFok61huinwdt3CQn5
 USL7PU/GPI2a7Cp516Rjjdc575Wu0hx+Foo0MysePjLuEm7m3wzi8YbR0DLGPdP8p4
 AbBGBW01dwN0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 176/244] drm/xe: Add timeout to preempt fences
Date: Wed, 25 Sep 2024 07:26:37 -0400
Message-ID: <20240925113641.1297102-176-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Matthew Brost <matthew.brost@intel.com>

[ Upstream commit 627c961d672d3304564455ba471f5e4405170eec ]

To adhere to dma fencing rules that fences must signal within a
reasonable amount of time, add a 5 second timeout to preempt fences. If
this timeout occurs, kill the associated VM as this fatal to the VM.

v2:
 - Add comment for smp_wmb (Checkpatch)
 - Fix kernel doc typo (Inspection)
 - Add comment for killed check (Niranjana)
v3:
 - Drop smp_wmb (Matthew Auld)
 - Don't take vm->lock in preempt fence worker (Matthew Auld)
 - Drop RB given changes to patch
v4:
 - Add WRITE/READ_ONCE (Niranjana)
 - Don't export xe_vm_kill (Niranjana)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240626004137.4060806-1-matthew.brost@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_preempt_fence.c    | 12 ++++++--
 drivers/gpu/drm/xe/xe_vm.c               | 12 +++++++-
 5 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index f6ee0ae80fd63..fc2a1a20b7e4b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -169,9 +169,11 @@ struct xe_exec_queue_ops {
 	int (*suspend)(struct xe_exec_queue *q);
 	/**
 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
-	 * call after suspend.
+	 * call after suspend. In dma-fencing path thus must return within a
+	 * reasonable amount of time. -ETIME return shall indicate an error
+	 * waiting for suspend resulting in associated VM getting killed.
 	 */
-	void (*suspend_wait)(struct xe_exec_queue *q);
+	int (*suspend_wait)(struct xe_exec_queue *q);
 	/**
 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
 	 * state and dma fence returned from most recent suspend call must be
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d6..7502e3486eafa 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
-static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
+static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 {
 	/* NIY */
+	return 0;
 }
 
 static void execlist_exec_queue_resume(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 59b36c7998c24..2e56d097df0e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1312,6 +1312,15 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 	kfree(msg);
 }
 
+static void __suspend_fence_signal(struct xe_exec_queue *q)
+{
+	if (!q->guc->suspend_pending)
+		return;
+
+	WRITE_ONCE(q->guc->suspend_pending, false);
+	wake_up(&q->guc->suspend_wait);
+}
+
 static void suspend_fence_signal(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1321,9 +1330,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 		  guc_read_stopped(guc));
 	xe_assert(xe, q->guc->suspend_pending);
 
-	q->guc->suspend_pending = false;
-	smp_wmb();
-	wake_up(&q->guc->suspend_wait);
+	__suspend_fence_signal(q);
 }
 
 static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
@@ -1480,6 +1487,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
+	__suspend_fence_signal(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -1578,12 +1586,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
-static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	int ret;
+
+	/*
+	 * Likely don't need to check exec_queue_killed() as we clear
+	 * suspend_pending upon kill but to be paranoid but races in which
+	 * suspend_pending is set after kill also check kill here.
+	 */
+	ret = wait_event_timeout(q->guc->suspend_wait,
+				 !READ_ONCE(q->guc->suspend_pending) ||
+				 exec_queue_killed(q) ||
+				 guc_read_stopped(guc),
+				 HZ * 5);
 
-	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
-		   guc_read_stopped(guc));
+	if (!ret) {
+		xe_gt_warn(guc_to_gt(guc),
+			   "Suspend fence, guc_id=%d, failed to respond",
+			   q->guc->id);
+		/* XXX: Trigger GT reset? */
+		return -ETIME;
+	}
+
+	return 0;
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index c453f45328b1c..83fbeea5aa201 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -17,10 +17,16 @@ static void preempt_fence_work_func(struct work_struct *w)
 		container_of(w, typeof(*pfence), preempt_work);
 	struct xe_exec_queue *q = pfence->q;
 
-	if (pfence->error)
+	if (pfence->error) {
 		dma_fence_set_error(&pfence->base, pfence->error);
-	else
-		q->ops->suspend_wait(q);
+	} else if (!q->ops->reset_status(q)) {
+		int err = q->ops->suspend_wait(q);
+
+		if (err)
+			dma_fence_set_error(&pfence->base, err);
+	} else {
+		dma_fence_set_error(&pfence->base, -ENOENT);
+	}
 
 	dma_fence_signal(&pfence->base);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 50e8fc49ba6c1..234184557eeb2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -133,8 +133,10 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 		if (q->lr.pfence) {
 			long timeout = dma_fence_wait(q->lr.pfence, false);
 
-			if (timeout < 0)
+			/* Only -ETIME on fence indicates VM needs to be killed */
+			if (timeout < 0 || q->lr.pfence->error == -ETIME)
 				return -ETIME;
+
 			dma_fence_put(q->lr.pfence);
 			q->lr.pfence = NULL;
 		}
@@ -311,6 +313,14 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
+/*
+ * xe_vm_kill() - VM Kill
+ * @vm: The VM.
+ * @unlocked: Flag indicates the VM's dma-resv is not held
+ *
+ * Kill the VM by setting banned flag indicated VM is no longer available for
+ * use. If in preempt fence mode, also kill all exec queue attached to the VM.
+ */
 static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
-- 
2.43.0

