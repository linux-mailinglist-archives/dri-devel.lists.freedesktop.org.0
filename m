Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C4BE5723
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E510EA86;
	Thu, 16 Oct 2025 20:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6XSmt9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DCB10E34E;
 Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdKv5bOLuS4Sqi0Al1pvB4/PJ3qRcH+11DZzBVMHUlI=;
 b=S6XSmt9RKAiy1r6RQBV0dXWQtt5ne2YlTU0kUQlaMcMJ+kpk+Z6wU2FG
 x1WvWTi8U9/nLaeLaWTu+aH5ppKTPowH0NSI5cNA0XJNeuGN9MRMcYj/p
 zUhUgCyN99GkecGhx/OXcniJZ0Mzrmjja5USRpNAfXVR15aUtBl0EUVL6
 3Bj0hJqIPXF0u5kZGKaFIhKL4m9DtQqWxk+wQxyt2AWqwXGs8q87t8kxp
 QbsYXu/tCmKRYeaee9b/Aym4UVdbtl7d6e5JFpYSaPkjKILfsBjrD/KPG
 02uzHXPwbruXru6ZcGASEW/+WInvzsITtG/y6Dru00sD7p6wgPtnAq60l g==;
X-CSE-ConnectionGUID: tmDxb7FPTJeRLRaFgt+gxw==
X-CSE-MsgGUID: w7/Kj5cmTYac3e1F/d2GEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472198"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
X-CSE-ConnectionGUID: muEkKp6BRw2jtdtQ6u+YWg==
X-CSE-MsgGUID: yJhRG1btS++YoWQWN8aLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572842"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 5/7] drm/xe: Do not deregister queues in TDR
Date: Thu, 16 Oct 2025 13:48:24 -0700
Message-Id: <20251016204826.284077-6-matthew.brost@intel.com>
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

Deregistering queues in the TDR introduces unnecessary complexity,
requiring reference counting tricks to function correctly. All that's
needed in the TDR is to kick the queue off the hardware, which is
achieved by disabling scheduling. Queue deregistration should be handled
in a single, well-defined point in the cleanup path, tied to the queue's
reference count.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 57 +++---------------------------
 1 file changed, 5 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 680696efc434..ab0f1a2d4871 100644
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
@@ -1326,8 +1291,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			xe_devcoredump(q, job,
 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
 				       q->guc->id, ret, xe_guc_read_stopped(guc));
-			set_exec_queue_extra_ref(q);
-			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
@@ -1380,13 +1343,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -2483,7 +2436,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
+	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_destroy(guc, q);
-- 
2.34.1

