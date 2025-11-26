Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B39C8C182
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B4610E70C;
	Wed, 26 Nov 2025 21:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRMxdjFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D3210E6F6;
 Wed, 26 Nov 2025 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764193674; x=1795729674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgYfxIarFmtrogpPPU1AjWpJAsXk3WTUEYLNEpLElfk=;
 b=jRMxdjFU7JvQ9Gj3QQvw2p776Mw3Tx7z/iJIhW7V7egwPL7pP491fwJv
 VMWNeP1cUpgLW1fifnOU698su2HTjDxfUFxzzQjMpaOmcPdWb9ZAf+MKh
 cIZlU8Z19tjTJZU6xRMZJYO+oj6bDFGl5+lmg8fxHgwYKQecJ6ePdScsR
 rc1Tn+FFC3YCYiAc0YZUTgO+gm5lZqwFitWsDnw427TyMO7RMfRtXMC48
 aqV1ubSNQ3ValFLnmB8h5xET/isNBmEFoa0Bfuvl8enPdHhWNoBcgtAfF
 d1CTT13CP/NygtwPTNyqbnz+vrJNMQGTxk+ZlFTMOCqmePKYIgjME5+Ej A==;
X-CSE-ConnectionGUID: 60o77hbVT3KEOStPTJxaeg==
X-CSE-MsgGUID: Y3mgeo3hQxWV9hrLJDj56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91721901"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="91721901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:53 -0800
X-CSE-ConnectionGUID: C90vrmI4QhicFQ4Ni5/x3Q==
X-CSE-MsgGUID: 1idrGy9NTLSGkJDFBP4M9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193281178"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 6/8] drm/xe: Do not deregister queues in TDR
Date: Wed, 26 Nov 2025 13:47:46 -0800
Message-Id: <20251126214748.650107-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126214748.650107-1-matthew.brost@intel.com>
References: <20251126214748.650107-1-matthew.brost@intel.com>
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

Deregistering queues in the TDR introduces unnecessary complexity,
requiring reference-counting techniques to function correctly,
particularly to prevent use-after-free (UAF) issues while a
deregistration initiated from the TDR is in progress.

All that's needed in the TDR is to kick the queue off the hardware,
which is achieved by disabling scheduling. Queue deregistration should
be handled in a single, well-defined point in the cleanup path, tied to
the queue's reference count.

v4:
 - Explain why extra ref were needed prior to this patch (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++-------------------------
 1 file changed, 9 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 693e3a892639..8ae1afb90e62 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
-#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
 }
 
-static bool exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
-}
-
-static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
-}
-
-static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
-}
-
 static bool exec_queue_pending_resume(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
@@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
-static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
-		q->guc->id,
-	};
-
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
-
-	set_exec_queue_destroyed(q);
-	trace_xe_exec_queue_deregister(q);
-
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
-}
-
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -1224,6 +1189,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	bool wedged = false, skip_timeout_check;
 
 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -1240,8 +1206,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	/* Must check all state after stopping scheduler */
 	skip_timeout_check = exec_queue_reset(q) ||
-		exec_queue_killed_or_banned_or_wedged(q) ||
-		exec_queue_destroyed(q);
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
@@ -1268,13 +1233,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Engine state now stable, disable scheduling to check timestamp */
-	if (!wedged && exec_queue_registered(q)) {
+	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
+		if (xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
@@ -1324,8 +1289,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			xe_devcoredump(q, job,
 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
 				       q->guc->id, ret, xe_guc_read_stopped(guc));
-			set_exec_queue_extra_ref(q);
-			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
@@ -1378,13 +1341,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		}
 	}
 
-	/* Finish cleaning up exec queue via deregister */
 	set_exec_queue_banned(q);
-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
-		set_exec_queue_extra_ref(q);
-		xe_exec_queue_get(q);
-		__deregister_exec_queue(guc, q);
-	}
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	xe_sched_job_set_error(job, err);
@@ -1928,7 +1885,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
+		if (xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
 			__guc_exec_queue_destroy(guc, q);
@@ -2062,11 +2019,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 
 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
 		clear_exec_queue_destroyed(q);
-		if (exec_queue_extra_ref(q))
-			xe_exec_queue_put(q);
-		else
-			q->guc->needs_cleanup = true;
-		clear_exec_queue_extra_ref(q);
+		q->guc->needs_cleanup = true;
 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
 			  q->guc->id);
 	}
@@ -2499,7 +2452,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
+	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_destroy(guc, q);
-- 
2.34.1

