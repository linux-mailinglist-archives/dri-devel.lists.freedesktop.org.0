Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44296A104D9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786710E124;
	Tue, 14 Jan 2025 11:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cEI/VMhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901110E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=afHFN/G4JOkRg7ZyLsUZgmQtRF+Ck+shJH1gU/auRbw=; b=cEI/VMhDta4hUq/iUJVo7JkS1j
 ndJGfXvEuykcdq+x2y4MFEjfu6CA97oLbpZuEMO6cITn0pMhXkNKtmdpulg15cxTgseEQ00M7EaNE
 Dy1FxQFin2Vlp3oEDJbmZPPrSvX9jvUjrKDoIf9eQ0wBUJNM4yYgHa2E8vamLMrUxcXK9UbQ09+jL
 WZiqyYby6lf5ErruPBgux1FGcFzWx87eCsLKHWVdPiBzXV9W13u6aLrFHwXW9Ar/rtesE/M+K31Ew
 aUi6TPo15XcTuqtSYcjXDE79IaVPAWiLclxxOu7k3OdA+gHF/w/Zq9OL3s5Lpg3kUicR0kRItTV1D
 P919B3Og==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tXeeL-00FbtW-LQ; Tue, 14 Jan 2025 11:59:57 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/sched: Avoid double re-lock on the job free path
Date: Tue, 14 Jan 2025 10:59:54 +0000
Message-ID: <20250114105954.64847-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

Currently the job free work item will lock sched->job_list_lock first time
to see if there are any jobs, free a single job, and then lock again to
decide whether to re-queue itself if there are more finished jobs.

Since drm_sched_get_finished_job() even already looks at the second job in
the queue we can simply make it return its presence to the caller.

That way the caller does not need to lock the list again only to peek into
the same job.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 32 +++++++++-----------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2d3d71e053a6..363e9f272a1b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -383,22 +383,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
-/**
- * drm_sched_run_free_queue - enqueue free-job work if ready
- * @sched: scheduler instance
- */
-static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_job *job;
-
-	spin_lock(&sched->job_list_lock);
-	job = list_first_entry_or_null(&sched->pending_list,
-				       struct drm_sched_job, list);
-	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		__drm_sched_run_free_queue(sched);
-	spin_unlock(&sched->job_list_lock);
-}
-
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -1078,12 +1062,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
+ * @have_more: are there more finished jobs on the list
  *
  * Returns the next finished job from the pending list (if there is one)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1101,14 +1086,16 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 		/* make the scheduled timestamp more accurate */
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
-
 		if (next) {
+			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
 			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
 				     &next->s_fence->scheduled.flags))
 				next->s_fence->scheduled.timestamp =
 					dma_fence_timestamp(&job->s_fence->finished);
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
+		} else {
+			*have_more = false;
 		}
 	} else {
 		job = NULL;
@@ -1165,12 +1152,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
 	struct drm_sched_job *job;
+	bool have_more;
 
-	job = drm_sched_get_finished_job(sched);
-	if (job)
+	job = drm_sched_get_finished_job(sched, &have_more);
+	if (job) {
 		sched->ops->free_job(job);
+		if (have_more)
+			__drm_sched_run_free_queue(sched);
+	}
 
-	drm_sched_run_free_queue(sched);
 	drm_sched_run_job_queue(sched);
 }
 
-- 
2.47.1

