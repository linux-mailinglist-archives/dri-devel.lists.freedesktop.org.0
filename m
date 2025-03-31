Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB7A76EE9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CD810E47E;
	Mon, 31 Mar 2025 20:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ge7zzRt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05B10E480;
 Mon, 31 Mar 2025 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+TCTpXdisnOh/NR2PxHOBvedU+Qj9xWJ8Lg5Hc4EIw=; b=Ge7zzRt0SV5XxbBzM1ekahjsQM
 0adTyDhgtdSf0BZvgadymUFW6C10me4l4VKqmGxZ0cw0sbiGk/ofdGZ1Zt78K4GNe5E6beS9wc5lU
 arT27/lY4tlYxKkynCn90IMHRt7eVnMtkDPXU3Wd49wDz5cVfb9Fw8I+rudWrfL2tWvYpYijFKyP6
 ZWJ/5hb5Nl41seWv/HCC0BdeH7Nk1mHzSNSo2Uy+8rTPm1yHUnKoDARc//8eqgc5/g1bJr0zhD7kz
 B29TTLSIUgVJOEMw4TFTeY2Hq0Dk2HXVIIj5u2eZegAZi9ZDN3lrobS6tWGNPbktk7133lcM3z5Gd
 Qf/HzAjQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZX-009M2m-Dc; Mon, 31 Mar 2025 22:17:27 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 02/14] drm/sched: Avoid double re-lock on the job free path
Date: Mon, 31 Mar 2025 21:16:53 +0100
Message-ID: <20250331201705.60663-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
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
queue we can simply extend the timestamp check with the full signaled
check and have it return the presence of more jobs to free to the caller.
That way the work item does not have to lock the list again and repeat the
very similar check.

v2:
 * Consolidate to single dma_fence_is_signaled check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 40 ++++++++++----------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ca5028f7a4e9..4a4c07d0163c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -371,22 +371,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
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
@@ -1103,12 +1087,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
 
@@ -1116,22 +1101,24 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 
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
-			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
-				     &next->s_fence->scheduled.flags))
+			if (dma_fence_is_signaled(&next->s_fence->finished)) {
+				*have_more = true;
+				/* make the scheduled timestamp more accurate */
 				next->s_fence->scheduled.timestamp =
 					dma_fence_timestamp(&job->s_fence->finished);
+			}
+
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1190,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
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

