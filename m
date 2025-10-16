Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D1BE571D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A4810EA82;
	Thu, 16 Oct 2025 20:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ES2eS2bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C0D10E34A;
 Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F0nkY/eJK3uTcCK+dvpGng0e/Peh/1ODAD7kkhKwchw=;
 b=ES2eS2btNM7tS4dv+ggcJpiT5WI1dyx5wnGbUDiGoDor9hE+P1VzIWkd
 E67VWpbrM3xAo/QvdJsNY48hJs1kbNSALumQEirrHphP/q2YIj83F8gzF
 habMbBBxjzndfR/x9gO1yvY2/V/ZPlfLWnZeALsY37bGu+EUF1Uj0tLdo
 FqsIMhA9P7I0RHdJhCTknyNXSQs5oqDxjdNP1u7nxtqggi8EE+rbguDNw
 6wdmV4FIsEITpuU6eDrMd9XM8unQGedg7/rNQpwthlepyVSRxf5ZytMWd
 vrJR10+Am6/U3pv4acwzG3dF+QxlDYgdkON77kFj1zhxjKkF9GE2SLiXF w==;
X-CSE-ConnectionGUID: EeqTb+qJRT2UrpPbXGO9rw==
X-CSE-MsgGUID: 4711YyJmTDexj1PA4diTAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472194"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: gZLq1ld5R6id8zR3qKu+ag==
X-CSE-MsgGUID: opwHonzLT52TU7Wefuk4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572841"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 4/7] drm/xe: Stop abusing DRM scheduler internals
Date: Thu, 16 Oct 2025 13:48:23 -0700
Message-Id: <20251016204826.284077-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
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

Use new pending job list iterator and new helper functions in Xe to
avoid reaching into DRM scheduler internals.

Part of this change involves removing pending jobs debug information
from debugfs and devcoredump. As agreed, the pending job list should
only be accessed when the scheduler is stopped. However, it's not
straightforward to determine whether the scheduler is stopped from the
shared debugfs/devcoredump code path. Additionally, the pending job list
provides little useful information, as pending jobs can be inferred from
seqnos and ring head/tail positions. Therefore, this debug information
is being removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 74 ++++--------------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
 drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
 drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
 6 files changed, 20 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f4f23317191f..9c8004d5dd91 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -7,7 +7,7 @@
 
 static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->base.pause_submit))
+	if (!drm_sched_is_stopped(&sched->base))
 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
 }
 
@@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
 
-	if (READ_ONCE(sched->base.pause_submit))
+	if (drm_sched_is_stopped(&sched->base))
 		return;
 
 	msg = xe_sched_get_msg(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index b971b6b69419..583372a78140 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		struct drm_sched_fence *s_fence = s_job->s_fence;
-		struct dma_fence *hw_fence = s_fence->parent;
-
+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
 		if (to_xe_sched_job(s_job)->skip_emit ||
-		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
+		    !drm_sched_job_is_signaled(s_job))
 			sched->base.ops->run_job(s_job);
-	}
 }
 
 static inline bool
@@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
 	return drm_sched_invalidate_job(&job->drm, threshold);
 }
 
-static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
-					    struct xe_sched_job *job)
-{
-	spin_lock(&sched->base.job_list_lock);
-	list_add(&job->drm.list, &sched->base.pending_list);
-	spin_unlock(&sched->base.job_list_lock);
-}
-
 /**
  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
  * @sched: Xe GPU scheduler
@@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	struct xe_sched_job *job, *r_job = NULL;
-
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
-		struct drm_sched_fence *s_fence = job->drm.s_fence;
-		struct dma_fence *hw_fence = s_fence->parent;
+	struct drm_sched_job *job;
 
-		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
-			r_job = job;
-			break;
-		}
-	}
-	spin_unlock(&sched->base.job_list_lock);
+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
+		if (!drm_sched_job_is_signaled(job))
+			return to_xe_sched_job(job);
 
-	return r_job;
+	return NULL;
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..680696efc434 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_gpu_scheduler *sched = &ge->sched;
-	struct xe_sched_job *job;
+	struct drm_sched_job *job;
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
@@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
 
-	xe_hw_fence_irq_stop(q->fence_irq);
+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
+		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
 
 	xe_sched_submission_start(sched);
-
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(job, -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
-
-	xe_hw_fence_irq_start(q->fence_irq);
 }
 
 #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
@@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-	struct xe_sched_job *tmp_job;
+	struct drm_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	unsigned int fw_ref;
 	int err = -ETIME;
 	pid_t pid = -1;
-	int i = 0;
 	bool wedged = false, skip_timeout_check;
 
 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
@@ -1395,28 +1388,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		__deregister_exec_queue(guc, q);
 	}
 
-	/* Stop fence signaling */
-	xe_hw_fence_irq_stop(q->fence_irq);
+	/* Mark all outstanding jobs as bad, thus completing them */
+	xe_sched_job_set_error(job, err);
+	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
+		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
 
-	/*
-	 * Fence state now stable, stop / start scheduler which cleans up any
-	 * fences that are complete
-	 */
-	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
-
 	xe_guc_exec_queue_trigger_cleanup(q);
 
-	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
-
-	/* Start fence signaling */
-	xe_hw_fence_irq_start(q->fence_irq);
-
-	return DRM_GPU_SCHED_STAT_RESET;
+	return DRM_GPU_SCHED_STAT_NO_HANG;
 
 sched_enable:
 	set_exec_queue_pending_tdr_exit(q);
@@ -2244,7 +2224,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	struct drm_sched_job *s_job;
 	struct xe_sched_job *job = NULL;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
 		job = to_xe_sched_job(s_job);
 
 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
@@ -2349,7 +2329,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 		 * created after resfix done.
 		 */
 		if (q->guc->id != index ||
-		    !READ_ONCE(q->guc->sched.base.pause_submit))
+		    !drm_sched_is_stopped(&q->guc->sched.base))
 			continue;
 
 		guc_exec_queue_unpause(guc, q);
@@ -2771,30 +2751,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
-	spin_lock(&sched->base.job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
-	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
-					       sizeof(struct pending_list_snapshot),
-					       GFP_ATOMIC);
-
-	if (snapshot->pending_list) {
-		struct xe_sched_job *job_iter;
-
-		i = 0;
-		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
-			snapshot->pending_list[i].seqno =
-				xe_sched_job_seqno(job_iter);
-			snapshot->pending_list[i].fence =
-				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
-			snapshot->pending_list[i].finished =
-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
-				? 1 : 0;
-			i++;
-		}
-	}
-
-	spin_unlock(&sched->base.job_list_lock);
-
 	return snapshot;
 }
 
@@ -2852,13 +2808,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_print(snapshot, p);
-
-	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
-	     i++)
-		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   snapshot->pending_list[i].seqno,
-			   snapshot->pending_list[i].fence,
-			   snapshot->pending_list[i].finished);
 }
 
 /**
@@ -2881,7 +2830,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
 			xe_lrc_snapshot_free(snapshot->lrc[i]);
 		kfree(snapshot->lrc);
 	}
-	kfree(snapshot->pending_list);
 	kfree(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..0b08c79cf3b9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
-struct pending_list_snapshot {
-	u32 seqno;
-	bool fence;
-	bool finished;
-};
-
 /**
  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
  */
@@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
 		/** @wq: Workqueue Items */
 		u32 wq[WQ_SIZE / sizeof(u32)];
 	} parallel;
-
-	/** @pending_list_size: Size of the pending list snapshot array */
-	int pending_list_size;
-	/** @pending_list: snapshot of the pending list info */
-	struct pending_list_snapshot *pending_list;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index b2a0c46dfcd4..e65dfcdfdbc5 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
 	irq_work_queue(&irq->work);
 }
 
-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
-{
-	spin_lock_irq(&irq->lock);
-	irq->enabled = false;
-	spin_unlock_irq(&irq->lock);
-}
-
-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
-{
-	spin_lock_irq(&irq->lock);
-	irq->enabled = true;
-	spin_unlock_irq(&irq->lock);
-
-	irq_work_queue(&irq->work);
-}
-
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..599492c13f80 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
 
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name);
-- 
2.34.1

