Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E37BE5720
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE610EA84;
	Thu, 16 Oct 2025 20:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWcvjWeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD43610E34A;
 Thu, 16 Oct 2025 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647711; x=1792183711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OGvyvowFB1zrrkLTak2iNN5tf8cSg/TfSowmVzqYyW8=;
 b=TWcvjWeg9Lgl20QVmVwgxjX7AsN41Z5qh51PZr5DK8aCOjWxxoeX2vF3
 b7hUI9w8zdFCUZbkVsE7uhutPcAA0DDWI/1QqiPd8edhVf6yj1EIdZVEd
 h+bJymkY5YVggAn56q4T/nH4IqsvVg7aalTC4IXL5W2aBTXyVg1JixyHw
 KW+pDPt+ptdyp2njLXl+r8QpEEN3X5gBToIROsAIxrFRQLk2drFo6AyF3
 K2Ps2TiGksbQLHBsNcPC0/XjEJ3DWjCtjD7C85ma7bgRjvRhE2o3djKL5
 3jax94opd9MS8iLiG9gZLJ16hB2erFd/KnDyvOuRl7Qq/HI4q5IITdF1D A==;
X-CSE-ConnectionGUID: Pu3sTSHoSDu7p74meIC7CA==
X-CSE-MsgGUID: 5Mz9oGUnT9OniIJIgE7oXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472186"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: YxHwakvgS+SViA12sXo8Lg==
X-CSE-MsgGUID: 25iNYEA0RsuVU2Jw0vgu+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572839"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 2/7] drm/sched: Add several job helpers to avoid drivers
 touching scheduler state
Date: Thu, 16 Oct 2025 13:48:21 -0700
Message-Id: <20251016204826.284077-3-matthew.brost@intel.com>
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

Add helpers to see if scheduler is stopped and a jobs signaled state.
Expected to be used driver side on recovery and debug flows.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
 include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..69bd6e482268 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
  */
 static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->pause_submit))
+	if (!drm_sched_is_stopped(sched))
 		queue_work(sched->submit_wq, &sched->work_run_job);
 }
 
@@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
  */
 static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->pause_submit))
+	if (!drm_sched_is_stopped(sched))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7f31eba3bd61..d1a2d7f61c1d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -700,6 +700,17 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 /* Inlines */
 
+/**
+ * drm_sched_is_stopped() - DRM is stopped
+ * @sched: DRM scheduler
+ *
+ * Return: True if sched is stopped, False otherwise
+ */
+static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
+{
+	return READ_ONCE(sched->pause_submit);
+}
+
 /**
  * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
  * @sched: DRM scheduler associated with pending job iterator
@@ -716,7 +727,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
 		.sched = sched,
 	};
 
-	WARN_ON(!READ_ONCE(sched->pause_submit));
+	WARN_ON(!drm_sched_is_stopped(sched));
 	return iter;
 }
 
@@ -724,7 +735,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
 static inline void
 __drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
 {
-	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
+	WARN_ON(!drm_sched_is_stopped(iter.sched));
 }
 
 DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
@@ -750,4 +761,21 @@ class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T
 		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
 			for_each_if(!(__entity) || (__job)->entity == (__entity))
 
+/**
+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
+ * @job: DRM scheduler job
+ *
+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
+ * to obtain a stable snapshot of state.
+ *
+ * Return: True if job is signaled, False otherwise
+ */
+static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
+{
+	struct drm_sched_fence *s_fence = job->s_fence;
+
+	WARN_ON(!drm_sched_is_stopped(job->sched));
+	return dma_fence_is_signaled(&s_fence->finished);
+}
+
 #endif
-- 
2.34.1

