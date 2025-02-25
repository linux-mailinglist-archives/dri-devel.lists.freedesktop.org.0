Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6972A44044
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBB810E6A4;
	Tue, 25 Feb 2025 13:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n9yBI0JH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5310E67E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:13:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55FAD5C6FC7;
 Tue, 25 Feb 2025 13:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B25FC4CEDD;
 Tue, 25 Feb 2025 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740489224;
 bh=v3vhG6xQGzI0DMMzaxCeUJboG/v/IKUZbpAI+vrakSc=;
 h=From:To:Cc:Subject:Date:From;
 b=n9yBI0JHpqPrL18vMSJt9LxihAY3EpUZS2131sVvk/Qz4+j+k04lIwd20biHupHfo
 hA/aUBQu79CLxPm+whsGJXqXSYU3a6p9HGIxSV+CvqPBsqQIe3t7pQCdJwE0bTt7rd
 SxKKe0wzxips2uw6hpPwFiwNl9fJUUz3dtrw801T5Ct9v9gjg2T3JaLljDnGf09Fx+
 QfsdskoQDL2Oue9PMnfKPUltRhyWfM2MmlerpOUbEu3QZHwxTUZF7hwHtzzxemmNOl
 0frKpBpeHZZfC4lNCkXe8B0TyS1xcYHgGVnpReMBo4lAJVIdpko0yEGJkH8P3Dz4Bh
 wp5U3X3/Ts4ig==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/sched: Fix outdated comments referencing thread
Date: Tue, 25 Feb 2025 14:13:32 +0100
Message-ID: <20250225131332.83415-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

The GPU scheduler's comments refer to a "thread" at various places.
Those are leftovers stemming from a rework in which the scheduler was
ported from using a kthread to workqueues.

Replace all references to kthreads.

Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++----
 drivers/gpu/drm/scheduler/sched_main.c   | 21 +++++++++++----------
 include/drm/gpu_scheduler.h              | 12 ++++++------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 87f88259ddf6..f9811420c787 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -538,10 +538,10 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		return;
 
 	/*
-	 * Only when the queue is empty are we guaranteed that the scheduler
-	 * thread cannot change ->last_scheduled. To enforce ordering we need
-	 * a read barrier here. See drm_sched_entity_pop_job() for the other
-	 * side.
+	 * Only when the queue is empty are we guaranteed that
+	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
+	 * enforce ordering we need a read barrier here. See
+	 * drm_sched_entity_pop_job() for the other side.
 	 */
 	smp_rmb();
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c634993f1346..015ee327fe52 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -389,7 +389,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
  *
- * Finish the job's fence and wake up the worker thread.
+ * Finish the job's fence and wake up the work item.
  */
 static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 {
@@ -550,8 +550,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	if (job) {
 		/*
 		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
+		 * drm_sched_cleanup_jobs. It will be reinserted back after the
+		 * scheduler's workqueues are stopped at which point it's safe.
 		 */
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
@@ -597,10 +597,10 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_finished_job cannot race against us and release the
+	 * drm_sched_get_finished_job() cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
-	 * now until the scheduler thread is unparked.
+	 * (earlier) cleanups and drm_sched_get_finished_job() will not be
+	 * called now until the scheduler's workqueues are unparked.
 	 */
 	if (bad && bad->sched == sched)
 		/*
@@ -613,7 +613,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 * Iterate the job list from later to  earlier one and either deactive
 	 * their HW callbacks or remove them from pending list if they already
 	 * signaled.
-	 * This iteration is thread safe as sched thread is stopped.
+	 * This iteration is thread safe as the scheduler's workqueues are
+	 * stopped.
 	 */
 	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
 					 list) {
@@ -678,9 +679,9 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 	struct drm_sched_job *s_job, *tmp;
 
 	/*
-	 * Locking the list is not required here as the sched thread is parked
-	 * so no new jobs are being inserted or removed. Also concurrent
-	 * GPU recovers can't run in parallel.
+	 * Locking the list is not required here as the scheduler's workqueues
+	 * are paused, so no new jobs are being inserted or removed. Also
+	 * concurrent GPU recovers can't run in parallel.
 	 */
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..7da7b0b52a7e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -192,8 +192,8 @@ struct drm_sched_entity {
 	 * @last_scheduled:
 	 *
 	 * Points to the finished fence of the last scheduled job. Only written
-	 * by the scheduler thread, can be accessed locklessly from
-	 * drm_sched_job_arm() if the queue is empty.
+	 * by &struct drm_gpu_scheduler.submit_wq. Can be accessed locklessly
+	 * from drm_sched_job_arm() if the queue is empty.
 	 */
 	struct dma_fence __rcu		*last_scheduled;
 
@@ -426,14 +426,14 @@ struct drm_sched_backend_ops {
 	 * Drivers typically issue a reset to recover from GPU hangs, and this
 	 * procedure usually follows the following workflow:
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
+	 * 1. Stop the scheduler using drm_sched_stop(). This will stop the
+	 *    scheduler's workqueues and cancel the timeout work, guaranteeing
+	 *    that  nothing is queued while we reset the hardware queue
 	 * 2. Try to gracefully stop non-faulty jobs (optional)
 	 * 3. Issue a GPU reset (driver-specific)
 	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
 	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 *    jobs can be queued, and the scheduler's workqueues be started again.
 	 *
 	 * Note that some GPUs have distinct hardware queues but need to reset
 	 * the GPU globally, which requires extra synchronization between the
-- 
2.48.1

