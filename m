Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B6BE5729
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF9910EA83;
	Thu, 16 Oct 2025 20:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwRHKvR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B7710E35A;
 Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MJF2yfYOAFfCzdmvOcaJz8wovDbk2lJngdSilTe1AU=;
 b=fwRHKvR2/MdFV0hIFpfTAgwdeSU3DAAH22WX8pq0HxjqhvZnhYuVz2Jr
 dXx8w1BtXb9/CEmNRZoighxwRycG9Wl+syENjilvmOOmAJKNxQpyZdvsX
 mxDKOvgr8aQbFauCQHCNxmjZXKU2CQAqSfCma83Sr8Yvm6brUHkTvHn4a
 qVIKgadlsRKPXtiJFPnqc9JcRbRB6qyxUcO79rjGArYAy+KGDmF6FS37o
 mTe1ylGuX1Hz3OfgGHRE7M04tph30NkgTZPgpUCAmmDw0bt6j5RzojUqD
 ijBJ1cf+/E+XHlN6sa7KICx40NSCgeawmJmKUfW1g89i/DVJC2r918bPH Q==;
X-CSE-ConnectionGUID: q3y45yXzRh+fmHLUUDtldg==
X-CSE-MsgGUID: bWRsYS9yTAS6ZEJ//Uyp1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472201"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472201"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
X-CSE-ConnectionGUID: w+f6YXgWSxGD4Lj7Ee8hmQ==
X-CSE-MsgGUID: 9ARvl96lQTacIQxDmqeFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572843"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 6/7] drm/xe: Remove special casing for LR queues in
 submission
Date: Thu, 16 Oct 2025 13:48:25 -0700
Message-Id: <20251016204826.284077-7-matthew.brost@intel.com>
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

Now that LR jobs are tracked by the DRM scheduler, there's no longer a
need to special-case LR queues. This change removes all LR
queue-specific handling, including dedicated TDR logic, reference
counting schemes, and other related mechanisms.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 129 +------------------
 2 files changed, 7 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3b034e4b205..fd0915ed8eb1 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -33,8 +33,6 @@ struct xe_guc_exec_queue {
 	 */
 #define MAX_STATIC_MSG_TYPE	3
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
-	/** @lr_tdr: long running TDR worker */
-	struct work_struct lr_tdr;
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
 	/** @resume_time: time of last resume */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab0f1a2d4871..bb1f2929441c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -674,14 +674,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
 	}
 
-	/*
-	 * We must keep a reference for LR engines if engine is registered with
-	 * the GuC as jobs signal immediately and can't destroy an engine if the
-	 * GuC has a reference to it.
-	 */
-	if (xe_exec_queue_is_lr(q))
-		xe_exec_queue_get(q);
-
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_parallel(q))
@@ -854,7 +846,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
+	bool killed_or_banned_or_wedged =
 		exec_queue_killed_or_banned_or_wedged(q);
 
 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
@@ -871,15 +863,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 		job->skip_emit = false;
 	}
 
-	/*
-	 * We don't care about job-fence ordering in LR VMs because these fences
-	 * are never exported; they are used solely to keep jobs on the pending
-	 * list. Once a queue enters an error state, there's no need to track
-	 * them.
-	 */
-	if (killed_or_banned_or_wedged && lr)
-		xe_sched_job_set_error(job, -ECANCELED);
-
 	return job->fence;
 }
 
@@ -923,8 +906,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
-		if (!xe_exec_queue_is_lr(q))
-			xe_sched_tdr_queue_imm(sched);
+		xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -950,10 +932,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
 	wake_up_all(&xe->ufence_wq);
 
-	if (xe_exec_queue_is_lr(q))
-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
-	else
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+	xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
 /**
@@ -1009,78 +988,6 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 	return true;
 }
 
-static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
-{
-	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, lr_tdr);
-	struct xe_exec_queue *q = ge->q;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_gpu_scheduler *sched = &ge->sched;
-	struct drm_sched_job *job;
-	bool wedged = false;
-
-	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
-
-	if (vf_recovery(guc))
-		return;
-
-	trace_xe_exec_queue_lr_cleanup(q);
-
-	if (!exec_queue_killed(q))
-		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
-
-	/* Kill the run_job / process_msg entry points */
-	xe_sched_submission_stop(sched);
-
-	/*
-	 * Engine state now mostly stable, disable scheduling / deregister if
-	 * needed. This cleanup routine might be called multiple times, where
-	 * the actual async engine deregister drops the final engine ref.
-	 * Calling disable_scheduling_deregister will mark the engine as
-	 * destroyed and fire off the CT requests to disable scheduling /
-	 * deregister, which we only want to do once. We also don't want to mark
-	 * the engine as pending_disable again as this may race with the
-	 * xe_guc_deregister_done_handler() which treats it as an unexpected
-	 * state.
-	 */
-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
-		struct xe_guc *guc = exec_queue_to_guc(q);
-		int ret;
-
-		set_exec_queue_banned(q);
-		disable_scheduling_deregister(guc, q);
-
-		/*
-		 * Must wait for scheduling to be disabled before signalling
-		 * any fences, if GT broken the GT reset code should signal us.
-		 */
-		ret = wait_event_timeout(guc->ct.wq,
-					 !exec_queue_pending_disable(q) ||
-					 xe_guc_read_stopped(guc) ||
-					 vf_recovery(guc), HZ * 5);
-		if (vf_recovery(guc))
-			return;
-
-		if (!ret) {
-			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
-				   q->guc->id);
-			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
-				       q->guc->id);
-			xe_sched_submission_start(sched);
-			xe_gt_reset_async(q->gt);
-			return;
-		}
-	}
-
-	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
-		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
-
-	drm_sched_for_each_pending_job(job, &sched->base, NULL)
-		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
-
-	xe_sched_submission_start(sched);
-}
-
 #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
 
 static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
@@ -1150,8 +1057,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
-		if (!xe_exec_queue_is_lr(q))
-			xe_sched_tdr_queue_imm(&q->guc->sched);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
 	}
 }
 
@@ -1189,8 +1095,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	pid_t pid = -1;
 	bool wedged = false, skip_timeout_check;
 
-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
-
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled. Add back to pending
@@ -1395,8 +1299,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
-	if (xe_exec_queue_is_lr(q))
-		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
@@ -1629,9 +1531,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_sched;
 
-	if (xe_exec_queue_is_lr(q))
-		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
-
 	mutex_lock(&guc->submission_state.lock);
 
 	err = alloc_guc_id(guc, q);
@@ -1885,9 +1784,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if (xe_exec_queue_is_lr(q))
-			xe_exec_queue_put(q);
-		else if (exec_queue_destroyed(q))
+		if (exec_queue_destroyed(q))
 			__guc_exec_queue_destroy(guc, q);
 	}
 	if (q->guc->suspend_pending) {
@@ -1917,9 +1814,6 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				trace_xe_sched_job_ban(job);
 				ban = true;
 			}
-		} else if (xe_exec_queue_is_lr(q) &&
-			   !xe_lrc_ring_is_idle(q->lrc[0])) {
-			ban = true;
 		}
 
 		if (ban) {
@@ -2002,8 +1896,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 	if (pending_enable && !pending_resume &&
 	    !exec_queue_pending_tdr_exit(q)) {
 		clear_exec_queue_registered(q);
-		if (xe_exec_queue_is_lr(q))
-			xe_exec_queue_put(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
 			  q->guc->id);
 	}
@@ -2060,10 +1952,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
-	if (xe_exec_queue_is_lr(q))
-		cancel_work_sync(&q->guc->lr_tdr);
-	else
-		cancel_delayed_work_sync(&sched->base.work_tdr);
+	cancel_delayed_work_sync(&sched->base.work_tdr);
 
 	guc_exec_queue_revert_pending_state_change(guc, q);
 
@@ -2435,11 +2324,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_deregister_done(q);
 
 	clear_exec_queue_registered(q);
-
-	if (xe_exec_queue_is_lr(q))
-		xe_exec_queue_put(q);
-	else
-		__guc_exec_queue_destroy(guc, q);
+	__guc_exec_queue_destroy(guc, q);
 }
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
-- 
2.34.1

