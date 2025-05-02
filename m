Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD5AA7206
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDF210E90C;
	Fri,  2 May 2025 12:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GtrUblL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A9010E8F4;
 Fri,  2 May 2025 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tp4pky7Txr82VGeaUpTq3BgixZ+mvCgWhQvrlFdCPU0=; b=GtrUblL5HrpKGkjlxS7rk0wXT2
 zO3+bjR7D624AoF97Psa8g2ZWEr0CVEYocRm27s0SQSsT2HelRa6Za/dPUwIMPD0S5cwyKLOKWm+r
 lOamjS3FvcHfgqX23S1lKRSg6dvblCcE4+Y+kJCzaHnrrE068q+/D/c0tbqh3MS+mF0mGL9O/b1kB
 40GioEe5KEbgv1fVYcmJuVsiWocBogEByPXPUFHG2GbrN+NmU+uUAFuO1HBEOKOhzMu2FQ3LxfEUQ
 0YoeL9gntHN8wI7XW7OYuvWorgSsx6GCaxI21ECkJ7y+cF8HLf83TcSE8omDmd30D2qICajPHt4E9
 87VhRpdA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApYp-0025G3-3V; Fri, 02 May 2025 14:34:02 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 04/23] drm/sched: Avoid double re-lock on the job free path
Date: Fri,  2 May 2025 13:32:37 +0100
Message-ID: <20250502123256.50540-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
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

Since drm_sched_get_finished_job() already looks at the second job in the
queue we can simply add the signaled check and have it return the presence
of more jobs to free to the caller. That way the work item does not have
to lock the list again and repeat the signaled check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++---------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1ddf293cf223..d482ecc436d8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -365,22 +365,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
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
@@ -1097,12 +1081,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
 
@@ -1110,22 +1095,27 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
-
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
 		/* cancel this job's TO timer */
 		cancel_delayed_work(&sched->work_tdr);
-		/* make the scheduled timestamp more accurate */
+
+		*have_more = false;
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
-
 		if (next) {
+			/* make the scheduled timestamp more accurate */
 			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
 				     &next->s_fence->scheduled.flags))
 				next->s_fence->scheduled.timestamp =
 					dma_fence_timestamp(&job->s_fence->finished);
+
+			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				     &next->s_fence->finished.flags))
+				*have_more = true;
+
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1184,12 +1174,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
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
2.48.0

