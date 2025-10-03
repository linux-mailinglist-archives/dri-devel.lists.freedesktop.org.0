Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7CBB808E
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E574D10E971;
	Fri,  3 Oct 2025 20:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfdPLCu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DFB10E968;
 Fri,  3 Oct 2025 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759522322; x=1791058322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J97dXudr6rWMxvdxCMLFEqFif+oDSKFg+qDNnGu2aUY=;
 b=UfdPLCu6hig6audX7F6X5GGhfv+4qQJ94TWLUFIoTQkxxg7XF6xGsD00
 SmUQtGaoV7GSv+Mj0f7soAX2X4TNtlBd77d07BTeIqAEPoT6hCpBgnKNv
 FwC6EtpuSQ1/B/CkF4hCr0Aju/5a7XRAUgjtrwB4+gc2RbBZeTE6LcVHa
 TP79+zMiWG1mcjMpTOZA1lr495Anu0wrUyGGkC/J/F3TfCn/n45KI+SFt
 MF8EnXK5iYrweTGKrWUCz2IPeE0gYDAIJcOY5Gpg2Ai4S0CmCDFjTblZD
 apx9sWunQH/aJuvybuIm3hKTizjz1WYnPxnps8EaKN1rCk6d5ZWrI1xB1 g==;
X-CSE-ConnectionGUID: qMXYeHS6SdyjgOAIVRr7vQ==
X-CSE-MsgGUID: zuboMv8MQv6L5/N+MG3laA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87265219"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87265219"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
X-CSE-ConnectionGUID: JcfMAVZkQiOtBfXhUNMfnA==
X-CSE-MsgGUID: FoEHOiWJRaGEplyqsDxiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178656986"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [RFC PATCH v2 4/4] drm/xe: Stop abusing DRM scheduler internals
Date: Fri,  3 Oct 2025 13:11:56 -0700
Message-Id: <20251003201156.1995113-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003201156.1995113-1-matthew.brost@intel.com>
References: <20251003201156.1995113-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 27 ++++---------------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 34 +++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  1 -
 3 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 04f85c4f7e80..e077519abf11 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -7,7 +7,7 @@
 #define _XE_GPU_SCHEDULER_H_
 
 #include "xe_gpu_scheduler_types.h"
-#include "xe_sched_job_types.h"
+#include "xe_sched_job.h"
 
 int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  const struct drm_sched_backend_ops *ops,
@@ -54,13 +54,9 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		struct drm_sched_fence *s_fence = s_job->s_fence;
-		struct dma_fence *hw_fence = s_fence->parent;
-
-		if (hw_fence && !dma_fence_is_signaled(hw_fence))
+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL, true)
+		if (!drm_sched_job_is_signaled(s_job))
 			sched->base.ops->run_job(s_job);
-	}
 }
 
 static inline bool
@@ -69,25 +65,12 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
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
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	struct xe_sched_job *job;
-
-	spin_lock(&sched->base.job_list_lock);
-	job = list_first_entry_or_null(&sched->base.pending_list,
-				       struct xe_sched_job, drm.list);
-	spin_unlock(&sched->base.job_list_lock);
+	struct drm_sched_job *job = drm_sched_first_pending_job(&sched->base);
 
-	return job;
+	return job ? to_xe_sched_job(job) : NULL;
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 53024eb5670b..da13c1380cb3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1217,7 +1217,7 @@ static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-	struct xe_sched_job *tmp_job;
+	struct drm_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1226,7 +1226,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	unsigned int fw_ref;
 	int err = -ETIME;
 	pid_t pid = -1;
-	int i = 0;
 	bool wedged = false, skip_timeout_check;
 
 	/*
@@ -1391,21 +1390,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Fence state now stable, stop / start scheduler which cleans up any
 	 * fences that are complete
 	 */
-	xe_sched_add_pending_job(sched, job);
+	xe_sched_job_set_error(job, err);
 	xe_sched_submission_start(sched);
 
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
+	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL, false)
+		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
 
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
 
-	return DRM_GPU_SCHED_STAT_RESET;
+	return DRM_GPU_SCHED_STAT_NO_HANG;
 
 sched_enable:
 	enable_scheduling(q);
@@ -2478,30 +2475,30 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
-	spin_lock(&sched->base.job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
+	snapshot->pending_list_size = drm_sched_pending_job_count(&sched->base);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
 					       sizeof(struct pending_list_snapshot),
 					       GFP_ATOMIC);
 
 	if (snapshot->pending_list) {
 		struct xe_sched_job *job_iter;
+		struct drm_sched_job *drm_job;
 
 		i = 0;
-		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
+		drm_sched_for_each_pending_job(drm_job, &sched->base, NULL, false) {
+			job_iter = to_xe_sched_job(drm_job);
+
+			if (i >= snapshot->pending_list_size)
+				break;
+
 			snapshot->pending_list[i].seqno =
 				xe_sched_job_seqno(job_iter);
 			snapshot->pending_list[i].fence =
 				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
-			snapshot->pending_list[i].finished =
-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
-				? 1 : 0;
 			i++;
 		}
 	}
 
-	spin_unlock(&sched->base.job_list_lock);
-
 	return snapshot;
 }
 
@@ -2562,10 +2559,9 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 
 	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
 	     i++)
-		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
+		drm_printf(p, "\tJob: seqno=%d, fence=%d\n",
 			   snapshot->pending_list[i].seqno,
-			   snapshot->pending_list[i].fence,
-			   snapshot->pending_list[i].finished);
+			   snapshot->pending_list[i].fence);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..59d88dd66e6e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -64,7 +64,6 @@ struct guc_submit_parallel_scratch {
 struct pending_list_snapshot {
 	u32 seqno;
 	bool fence;
-	bool finished;
 };
 
 /**
-- 
2.34.1

