Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2354CB0FC6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 21:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9C10E638;
	Tue,  9 Dec 2025 20:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAdCFCYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B945F10E5E9;
 Tue,  9 Dec 2025 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310446; x=1796846446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xAEamYzlIjSgYI/xOoOc44VcPwPPoprMhSDBRrXFuRc=;
 b=BAdCFCYXS4YmSliV5GhfOW3w+kLFzwrrnbJ5l7fnWBXUpUkGCtN8kmdc
 3oi2+QXYtHPNIj4i95cgVqnLCSuQq9F+Pv2+7hFdhkbu7kssJNrxknbXL
 g+YKVHYMYK/6YqM2EyTYSym5OlOyfHMIlcI2L7Ys9Q4eFBe+MZ9A/gz0s
 nfa6v7rha5GK+ui2OMeH3cXgcnSwUOWx4CQnacUlEDNSQ3/mdG6kvweM6
 Q3Kmxz+gWmQXN2PILH9Af4y0w2VSsSiUeGOtjCoHfx3cJuGRf2E8z31yn
 ZKmr3Tcrw8a46k83KGe1f8BZqXQWNkNmTxhnKobwNpAB5oEYc/HckRn8t A==;
X-CSE-ConnectionGUID: +5bE1ggqQw6ZmigJBWFr8A==
X-CSE-MsgGUID: ejWt7n0OTkS1TSATaBVF3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70897454"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="70897454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
X-CSE-ConnectionGUID: lnd5GxAERlOcZglNYDYzew==
X-CSE-MsgGUID: s5iXyQMyTByl5hBKuyvoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="201243126"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v9 1/2] drm/sched: Add several job helpers to avoid drivers
 touching scheduler state
Date: Tue,  9 Dec 2025 12:00:38 -0800
Message-Id: <20251209200039.1366764-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209200039.1366764-1-matthew.brost@intel.com>
References: <20251209200039.1366764-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In the past, drivers used to reach into scheduler internals—this must
end because it makes it difficult to change scheduler internals, as
driver-side code must also be updated.

Add helpers to check if the scheduler is stopped and to query a job’s
signaled state to avoid reaching into scheduler internals. These are
expected to be used driver-side in recovery and debug flows.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---

v4:
 - Reorder patch to first in series (Niranjana)
 - Also check parent fence for signaling (Niranjana)
v8:
 - Fixup kernel doc (Philipp)
 - Move chnage log (Philipp)
 - Better commit (Philipp)
 - Drop inlines (Philipp)
---
 drivers/gpu/drm/scheduler/sched_main.c | 36 ++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..5f08719a35f5 100644
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
 
@@ -1567,3 +1567,35 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
+
+/**
+ * drm_sched_is_stopped() - Checks whether drm_sched is stopped
+ * @sched: DRM scheduler
+ *
+ * Return: true if sched is stopped, false otherwise
+ */
+bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
+{
+	return READ_ONCE(sched->pause_submit);
+}
+EXPORT_SYMBOL(drm_sched_is_stopped);
+
+/**
+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
+ * @job: DRM scheduler job
+ *
+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
+ * to obtain a stable snapshot of state. Both parent fence (hardware fence) and
+ * finished fence (software fence) are checked to determine signaling state.
+ *
+ * Return: true if job is signaled, false otherwise
+ */
+bool drm_sched_job_is_signaled(struct drm_sched_job *job)
+{
+	struct drm_sched_fence *s_fence = job->s_fence;
+
+	WARN_ON(!drm_sched_is_stopped(job->sched));
+	return (s_fence->parent && dma_fence_is_signaled(s_fence->parent)) ||
+		dma_fence_is_signaled(&s_fence->finished);
+}
+EXPORT_SYMBOL(drm_sched_job_is_signaled);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..86b6075ce799 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -645,6 +645,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
+bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched);
 
 struct drm_gpu_scheduler *
 drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
@@ -674,6 +675,7 @@ bool drm_sched_job_has_dependency(struct drm_sched_job *job,
 				  struct dma_fence *fence);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
+bool drm_sched_job_is_signaled(struct drm_sched_job *job);
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
 					    int threshold)
-- 
2.34.1

