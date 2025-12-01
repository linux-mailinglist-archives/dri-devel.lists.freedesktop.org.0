Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF0C98BEF
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495D10E467;
	Mon,  1 Dec 2025 18:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPxuYVcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811910E459;
 Mon,  1 Dec 2025 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614400; x=1796150400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g3B0laWoK0DrPpzQaFCXJFbqylTOOIHy4Tz9332MPyc=;
 b=NPxuYVcn9BwjhzOu+o/vQs6cCRyhfR816Nqc574ILR8BQFXY2szVPQyO
 6rr7zM5+kc0LMSfsOhDN6UQxMyPzyaWUx/vz6PDp9XkRtnqdtwQw1TnhU
 oOZTxu1sqWCcCfMSJSJeDKq0MCbociZ9anJKYn+nnoeGl8SgchFa+JaH1
 osUN/8O82OJk3Lk8iRX1GbeEU+GYSgFII0F6XMFc+FiGyy1h3VUTRRf9r
 sEdGOQv3XDWB7GHe7fUmmuhak2kpy75Ui01685dvsqsTDvH6z0jwLOMJo
 EoUezmpKw6nqzP/bfPAT9JttsJxB9g+Ax8uKzyooScKrhWOTRHcTavjFJ w==;
X-CSE-ConnectionGUID: cVwmo9aeQPeQzp15NPaR2w==
X-CSE-MsgGUID: CTeTNLdhTemDZbfVv+fWSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78031151"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="78031151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:40:00 -0800
X-CSE-ConnectionGUID: 90qDtd9iSXClGdByvlVvtA==
X-CSE-MsgGUID: 2ZErqLEkQ9Kg7YvA+3LWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194359109"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:40:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 9/9] drm/xe: Avoid toggling schedule state to check LRC
 timestamp in TDR
Date: Mon,  1 Dec 2025 10:39:54 -0800
Message-Id: <20251201183954.852637-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201183954.852637-1-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
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

v5:
 - Add xe_lrc_timestamp helper (Umesh)
v6:
 - Reduce number of tries on stuck timestamp (VF testing)
 - Convert job timestamp save to a memory copy (VF testing)
v7:
 - Save ctx timestamp to LRC when start VF job (VF testing)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      | 97 ++++++-------------------
 drivers/gpu/drm/xe/xe_lrc.c             | 42 +++++++----
 drivers/gpu/drm/xe/xe_lrc.h             |  3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        | 25 +++++--
 drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
 6 files changed, 76 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8190f2afbaed..dc4bf3126450 100644
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
@@ -1006,7 +974,16 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 		return xe_sched_invalidate_job(job, 2);
 	}
 
-	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
+	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
+	if (ctx_timestamp == job->sample_timestamp) {
+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			   q->guc->id);
+
+		return xe_sched_invalidate_job(job, 0);
+	}
+
+	job->sample_timestamp = ctx_timestamp;
 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
 
 	/*
@@ -1132,16 +1109,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
@@ -1163,13 +1141,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
@@ -1198,22 +1169,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1244,14 +1205,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1266,9 +1224,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 
-sched_enable:
-	set_exec_queue_pending_tdr_exit(q);
-	enable_scheduling(q);
 rearm:
 	/*
 	 * XXX: Ideally want to adjust timeout based on current execution time
@@ -1898,8 +1853,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 			  q->guc->id);
 	}
 
-	if (pending_enable && !pending_resume &&
-	    !exec_queue_pending_tdr_exit(q)) {
+	if (pending_enable && !pending_resume) {
 		clear_exec_queue_registered(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
 			  q->guc->id);
@@ -1908,7 +1862,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 	if (pending_enable) {
 		clear_exec_queue_enabled(q);
 		clear_exec_queue_pending_resume(q);
-		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
 			  q->guc->id);
@@ -1934,7 +1887,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 		if (!pending_enable)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
-		clear_exec_queue_check_timeout(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
 			  q->guc->id);
 	}
@@ -2308,13 +2260,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 
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
 
@@ -2322,11 +2271,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
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
@@ -2436,7 +2385,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -2517,7 +2466,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 166353455f8f..38b0c536f6fb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -852,7 +852,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
  *
  * Returns: ctx timestamp value
  */
-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
+static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	struct iosys_map map;
@@ -2380,35 +2380,31 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
 }
 
 /**
- * xe_lrc_update_timestamp() - Update ctx timestamp
+ * xe_lrc_timestamp() - Current ctx timestamp
  * @lrc: Pointer to the lrc.
- * @old_ts: Old timestamp value
  *
- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
- * update saved value. With support for active contexts, the calculation may be
- * slightly racy, so follow a read-again logic to ensure that the context is
- * still active before returning the right timestamp.
+ * Return latest ctx timestamp. With support for active contexts, the
+ * calculation may bb slightly racy, so follow a read-again logic to ensure that
+ * the context is still active before returning the right timestamp.
  *
  * Returns: New ctx timestamp value
  */
-u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 {
-	u64 lrc_ts, reg_ts;
+	u64 lrc_ts, reg_ts, new_ts;
 	u32 engine_id;
 
-	*old_ts = lrc->ctx_timestamp;
-
 	lrc_ts = xe_lrc_ctx_timestamp(lrc);
 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
 	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
-		lrc->ctx_timestamp = lrc_ts;
+		new_ts = lrc_ts;
 		goto done;
 	}
 
 	if (lrc_ts == CONTEXT_ACTIVE) {
 		engine_id = xe_lrc_engine_id(lrc);
 		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
-			lrc->ctx_timestamp = reg_ts;
+			new_ts = reg_ts;
 
 		/* read lrc again to ensure context is still active */
 		lrc_ts = xe_lrc_ctx_timestamp(lrc);
@@ -2419,9 +2415,27 @@ u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	 * be a separate if condition.
 	 */
 	if (lrc_ts != CONTEXT_ACTIVE)
-		lrc->ctx_timestamp = lrc_ts;
+		new_ts = lrc_ts;
 
 done:
+	return new_ts;
+}
+
+/**
+ * xe_lrc_update_timestamp() - Update ctx timestamp
+ * @lrc: Pointer to the lrc.
+ * @old_ts: Old timestamp value
+ *
+ * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
+ * update saved value.
+ *
+ * Returns: New ctx timestamp value
+ */
+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
+{
+	*old_ts = lrc->ctx_timestamp;
+	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
+
 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
 
 	return lrc->ctx_timestamp;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a32472b92242..93c1234e2706 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -142,7 +142,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
 u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
 int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
@@ -162,4 +161,6 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
  */
 u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
 
+u64 xe_lrc_timestamp(struct xe_lrc *lrc);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ac0c6dcffe15..3dacfc2da75c 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -233,13 +233,26 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 	return 0;
 }
 
-static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
+static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
+			       u32 *dw, int i)
 {
 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
 	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
 
+	/*
+	 * Ensure CTX timestamp >= Job timestamp during VF sampling to avoid
+	 * arithmetic wraparound in TDR.
+	 */
+	if (IS_SRIOV_VF(xe)) {
+		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
+			MI_SRM_ADD_CS_OFFSET;
+		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+		dw[i++] = 0;
+	}
+
 	return i;
 }
 
@@ -253,7 +266,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	*head = lrc->ring.tail;
 
-	i = emit_copy_timestamp(lrc, dw, i);
+	i = emit_copy_timestamp(gt_to_xe(gt), lrc, dw, i);
 
 	if (job->ring_ops_flush_tlb) {
 		dw[i++] = preparser_disable(true);
@@ -308,7 +321,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	*head = lrc->ring.tail;
 
-	i = emit_copy_timestamp(lrc, dw, i);
+	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
 
@@ -362,7 +375,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	*head = lrc->ring.tail;
 
-	i = emit_copy_timestamp(lrc, dw, i);
+	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
@@ -406,12 +419,14 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 *head,
 				     u32 seqno)
 {
+	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	*head = lrc->ring.tail;
 
-	i = emit_copy_timestamp(lrc, dw, i);
+	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
 
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
index 7c4c54fe920a..13c2970e81a8 100644
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

