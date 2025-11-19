Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34409C714E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA06D10E6A2;
	Wed, 19 Nov 2025 22:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erKJAH/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9810E271;
 Wed, 19 Nov 2025 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763592074; x=1795128074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fEEfEfSabA+u5q2pKZUg/lKFGfHqhUkC00ebmT0sc4k=;
 b=erKJAH/OS8Sgrt2Ht4wTYAhZKJdrSPt3YVqMZEtBNy4KOwcqFFdpTdMm
 m0Jpi4sAW/ZQX5hp9QVJgGagJPxwYGZxDR1gR3PQ978s7dsI8mQVqFOrY
 5rYra8yLTzpV+kW+7zSxxlG9oNZLBzO55mbsYjSEbpdACgW+SVU2LKCdA
 nBh93CGWReS/PNeRXHY1axUB1OoolLaC1LUArA0L8M84whdDmH0xjejLP
 dg1ZRF7eVHZaf4eGEyshRptmSxPc1qtvQnzTIorSIWXMvzd23+3JHnVNb
 ZVIWlicMgnMonfwYK+bFnUtrLOYLZKouYrdluO1WyhQwVpWvqdoWdOye1 Q==;
X-CSE-ConnectionGUID: kUNVsNBzSOaSmqD0R8rKLQ==
X-CSE-MsgGUID: 7OJl+2UqSuKRM/uFVogYlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76755407"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76755407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:12 -0800
X-CSE-ConnectionGUID: d8l2t5xkR6OjOwh4TD11DQ==
X-CSE-MsgGUID: xHJlmL+OTuSntUqReWhSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228504154"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, umesh.nerlige.ramappa@intel.com,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v4 8/8] drm/xe: Avoid toggling schedule state to check LRC
 timestamp in TDR
Date: Wed, 19 Nov 2025 14:41:06 -0800
Message-Id: <20251119224106.3733883-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119224106.3733883-1-matthew.brost@intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
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

We now have proper infrastructure to accurately check the LRC timestamp
without toggling the scheduling state for non-VFs. For VFs, it is still
possible to get an inaccurate view if the context is on hardware. We
guard against free-running contexts on VFs by banning jobs whose
timestamps are not moving. In addition, VFs have a timeslice quantum
that naturally triggers context switches when more than one VF is
running, thus updating the LRC timestamp.

For multi-queue, it is desirable to avoid scheduling toggling in the TDR
because this scheduling state is shared among many queues. Furthermore,
this change simplifies the GuC state machine. The trade-off for VF cases
seems worthwhile.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      | 100 ++++++------------------
 drivers/gpu/drm/xe/xe_sched_job.c       |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
 3 files changed, 28 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1f2afad1766e..7404716e979f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
-#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -202,21 +200,6 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
 }
 
-static bool exec_queue_check_timeout(struct xe_exec_queue *q)
-{
-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
-}
-
-static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
-{
-	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
-}
-
-static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
-{
-	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
-}
-
 static bool exec_queue_pending_resume(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
@@ -232,21 +215,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
 }
 
-static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
-{
-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
-}
-
-static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
-{
-	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
-}
-
-static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
-{
-	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
-}
-
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -996,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	u32 ctx_timestamp, ctx_job_timestamp;
 	u32 timeout_ms = q->sched_props.job_timeout_ms;
 	u32 diff;
-	u64 running_time_ms;
+	u64 running_time_ms, old_timestamp;
 
 	if (!xe_sched_job_started(job)) {
 		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
@@ -1006,7 +974,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 		return xe_sched_invalidate_job(job, 2);
 	}
 
-	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
+	ctx_timestamp = lower_32_bits(xe_lrc_update_timestamp(q->lrc[0],
+							      &old_timestamp));
+	if (ctx_timestamp == job->sample_timestamp) {
+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			   q->guc->id);
+
+		return xe_sched_invalidate_job(job, 2);
+	}
+
+	job->sample_timestamp = ctx_timestamp;
 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
 
 	/*
@@ -1135,16 +1113,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/*
-	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
-	 * modify scheduling state to read timestamp. We could read the
-	 * timestamp from a register to accumulate current running time but this
-	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
-	 * genuine timeouts.
+	 * Check if job is actually timed out, if so restart job execution and TDR
 	 */
+	if (!skip_timeout_check && !check_timeout(q, job))
+		goto rearm;
+
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
-	/* Engine state now stable, disable scheduling to check timestamp */
+	set_exec_queue_banned(q);
+
+	/* Kick job / queue off hardware */
 	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
 		int ret;
 
@@ -1166,13 +1145,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
-			/*
-			 * Flag communicates to G2H handler that schedule
-			 * disable originated from a timeout check. The G2H then
-			 * avoid triggering cleanup or deregistering the exec
-			 * queue.
-			 */
-			set_exec_queue_check_timeout(q);
 			disable_scheduling(q, skip_timeout_check);
 		}
 
@@ -1201,22 +1173,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			xe_devcoredump(q, job,
 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
 				       q->guc->id, ret, xe_guc_read_stopped(guc));
-			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
 			goto rearm;
 		}
 	}
 
-	/*
-	 * Check if job is actually timed out, if so restart job execution and TDR
-	 */
-	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
-	    !exec_queue_reset(q) && exec_queue_registered(q)) {
-		clear_exec_queue_check_timeout(q);
-		goto sched_enable;
-	}
-
 	if (q->vm && q->vm->xef) {
 		process_name = q->vm->xef->process_name;
 		pid = q->vm->xef->pid;
@@ -1247,14 +1209,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
 		if (!xe_sched_invalidate_job(job, 2)) {
-			clear_exec_queue_check_timeout(q);
 			xe_gt_reset_async(q->gt);
 			goto rearm;
 		}
 	}
 
-	set_exec_queue_banned(q);
-
 	/* Mark all outstanding jobs as bad, thus completing them */
 	xe_sched_job_set_error(job, err);
 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
@@ -1269,9 +1228,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 
-sched_enable:
-	set_exec_queue_pending_tdr_exit(q);
-	enable_scheduling(q);
 rearm:
 	/*
 	 * XXX: Ideally want to adjust timeout based on current execution time
@@ -1903,8 +1859,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 			  q->guc->id);
 	}
 
-	if (pending_enable && !pending_resume &&
-	    !exec_queue_pending_tdr_exit(q)) {
+	if (pending_enable && !pending_resume) {
 		clear_exec_queue_registered(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
 			  q->guc->id);
@@ -1913,7 +1868,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 	if (pending_enable) {
 		clear_exec_queue_enabled(q);
 		clear_exec_queue_pending_resume(q);
-		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
 			  q->guc->id);
@@ -1939,7 +1893,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 		if (!pending_enable)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
-		clear_exec_queue_check_timeout(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
 			  q->guc->id);
 	}
@@ -2263,13 +2216,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 
 		q->guc->resume_time = ktime_get();
 		clear_exec_queue_pending_resume(q);
-		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
-		bool check_timeout = exec_queue_check_timeout(q);
-
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
@@ -2277,11 +2227,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 			suspend_fence_signal(q);
 			clear_exec_queue_pending_disable(q);
 		} else {
-			if (exec_queue_banned(q) || check_timeout) {
+			if (exec_queue_banned(q)) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
-			if (!check_timeout && exec_queue_destroyed(q)) {
+			if (exec_queue_destroyed(q)) {
 				/*
 				 * Make sure to clear the pending_disable only
 				 * after sampling the destroyed state. We want
@@ -2391,7 +2341,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -2472,7 +2422,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cb674a322113..39aec7f6d86d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -110,6 +110,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 		return ERR_PTR(-ENOMEM);
 
 	job->q = q;
+	job->sample_timestamp = U64_MAX;
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index d26612abb4ca..ad5eee8a8cdb 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -59,6 +59,8 @@ struct xe_sched_job {
 	u32 lrc_seqno;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
+	/** @sample_timestamp: Sampling of job timestamp in TDR */
+	u64 sample_timestamp;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
 	/** @ggtt: mapped in ggtt. */
-- 
2.34.1

