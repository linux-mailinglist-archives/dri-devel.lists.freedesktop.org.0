Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93044B070E6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977B10E740;
	Wed, 16 Jul 2025 08:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K+S4VeCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE5110E73F;
 Wed, 16 Jul 2025 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kx+Dsrd801uDjjReDn1lOMCiduTKlgtO81lIrGUIndw=; b=K+S4VeCv7MfexifV/m7tjQNBMb
 Pa6XjJuGyD9pQ7u8CuKgQkBGYq86iL9ERZxRe8/YCDgUVW9gkv387UEYmVALsDnVrddoZd0C893nX
 hzUlHeIZVGjUpLaW0J+2O+bbrbDmPdmH+bsI7YvBgwmLQwIWaAcCwbX3jpqK/fn22YFpPLWlXNObJ
 l4Yok9UM0gvbw3HSJElsGadLsBH6d+8Y8PhFBL/W4wD7tvPX4/p8GyS+hm3pv7O9YbMkx0t+s1QPT
 6AQDAUY+aRuw3Iw907zslkYbUT46zCGP8rvHTjd5cB3PojhDCkwNk115BQ/0oCt5+5X4OonyBGZ/U
 iOtFI0Ag==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubxrF-00HElS-89; Wed, 16 Jul 2025 10:51:21 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Avoid double re-lock on the job free path
Date: Wed, 16 Jul 2025 09:51:17 +0100
Message-ID: <20250716085117.56864-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
of more jobs to be freed to the caller. That way the work item does not
have to lock the list again and repeat the signaled check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
v2:
 * Improve commit text and kerneldoc. (Philipp)
 * Rename run free work helper. (Philipp)

v3:
 * Rebase on top of Maira's changes.
---
 drivers/gpu/drm/scheduler/sched_main.c | 53 ++++++++++----------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e2cda28a1af4..5a550fd76bf0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -349,34 +349,13 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * __drm_sched_run_free_queue - enqueue free-job work
- * @sched: scheduler instance
- */
-static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
-{
-	if (!READ_ONCE(sched->pause_submit))
-		queue_work(sched->submit_wq, &sched->work_free_job);
-}
-
-/**
- * drm_sched_run_free_queue - enqueue free-job work if ready
+ * drm_sched_run_free_queue - enqueue free-job work
  * @sched: scheduler instance
  */
 static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_job *job;
-
-	job = list_first_entry_or_null(&sched->pending_list,
-				       struct drm_sched_job, list);
-	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		__drm_sched_run_free_queue(sched);
-}
-
-static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
-{
-	spin_lock(&sched->job_list_lock);
-	drm_sched_run_free_queue(sched);
-	spin_unlock(&sched->job_list_lock);
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
 /**
@@ -398,7 +377,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	__drm_sched_run_free_queue(sched);
+	drm_sched_run_free_queue(sched);
 }
 
 /**
@@ -1134,12 +1113,16 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
+ * @have_more: are there more finished jobs on the list
+ *
+ * Informs the caller through @have_more whether there are more finished jobs
+ * besides the returned one.
  *
  * Returns the next finished job from the pending list (if there is one)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1147,22 +1130,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 
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
+			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
+
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1221,12 +1207,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
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
+			drm_sched_run_free_queue(sched);
+	}
 
-	drm_sched_run_free_queue_unlocked(sched);
 	drm_sched_run_job_queue(sched);
 }
 
-- 
2.48.0

