Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B33A503E6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256DC10E7DE;
	Wed,  5 Mar 2025 15:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nFqJpVOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D352A10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:54:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0ADA6A45A27;
 Wed,  5 Mar 2025 15:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB09C4CED1;
 Wed,  5 Mar 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741190051;
 bh=zIEeetKUTm0IuyongYlHLFcQs8fidnoZvNOum1B6Meo=;
 h=From:To:Cc:Subject:Date:From;
 b=nFqJpVOMRycveemwDsbazoTPRUFoTsgImJC9/7MOjvuExCby4x7ZoLePxanm60LBk
 WpHfohZbhGi9Dc2NVPE2qGIskN8V/IzqkSv/bz2PmNfLyfX+Fhe2Zjv1j+DjwLAu9i
 9YqdUAZchQfxDzMsbGcD/uL97nsJ8ZpdSdzgJIKIKEeedDJ7xjoMl26i3HOKdkxmVE
 zSD7jRicSA3GPZdPQeRx63DYNvks7bJ0LYOB1UqLjf3Upe5IKgUo52gkfYlygh3kZI
 BbwSG5dS6WDbh5uA5iUtLZalMsv/c/dNk73hmKyegBxajFIVFIgrza6Nw+ubBFVyBH
 oIVDCFWMlLY1A==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/sched: Fix outdated comments referencing thread
Date: Wed,  5 Mar 2025 16:53:26 +0100
Message-ID: <20250305155326.153596-2-phasta@kernel.org>
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
Those are leftovers from commit a6149f039369 ("drm/sched: Convert drm
scheduler to use a work queue rather than kthread").

Replace all references to kthreads.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Speak consistently about work items. (Danilo)
  - Remove Fixes: tags. (Danilo)
---
 drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++----
 drivers/gpu/drm/scheduler/sched_main.c   | 24 +++++++++++++-----------
 include/drm/gpu_scheduler.h              | 10 +++++-----
 3 files changed, 22 insertions(+), 20 deletions(-)

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
index c634993f1346..c97655aa7ab4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -389,7 +389,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
  *
- * Finish the job's fence and wake up the worker thread.
+ * Finish the job's fence and resubmit the work items.
  */
 static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 {
@@ -549,9 +549,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	if (job) {
 		/*
-		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
+		 * Remove the bad job so it cannot be freed by a concurrent
+		 * &struct drm_sched_backend_ops.free_job. It will be
+		 * reinserted after the scheduler's work items have been
+		 * cancelled, at which point it's safe.
 		 */
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
@@ -597,10 +598,10 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_finished_job cannot race against us and release the
+	 * drm_sched_get_finished_job() cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
-	 * now until the scheduler thread is unparked.
+	 * (earlier) cleanups and drm_sched_get_finished_job() will not be
+	 * called now until the scheduler's work items are submitted again.
 	 */
 	if (bad && bad->sched == sched)
 		/*
@@ -613,7 +614,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 * Iterate the job list from later to  earlier one and either deactive
 	 * their HW callbacks or remove them from pending list if they already
 	 * signaled.
-	 * This iteration is thread safe as sched thread is stopped.
+	 * This iteration is thread safe as the scheduler's work items have been
+	 * cancelled.
 	 */
 	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
 					 list) {
@@ -678,9 +680,9 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 	struct drm_sched_job *s_job, *tmp;
 
 	/*
-	 * Locking the list is not required here as the sched thread is parked
-	 * so no new jobs are being inserted or removed. Also concurrent
-	 * GPU recovers can't run in parallel.
+	 * Locking the list is not required here as the scheduler's work items
+	 * are currently not running, so no new jobs are being inserted or
+	 * removed. Also concurrent GPU recovers can't run in parallel.
 	 */
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..d8bfd46c1117 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -192,7 +192,7 @@ struct drm_sched_entity {
 	 * @last_scheduled:
 	 *
 	 * Points to the finished fence of the last scheduled job. Only written
-	 * by the scheduler thread, can be accessed locklessly from
+	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
 	 * drm_sched_job_arm() if the queue is empty.
 	 */
 	struct dma_fence __rcu		*last_scheduled;
@@ -426,14 +426,14 @@ struct drm_sched_backend_ops {
 	 * Drivers typically issue a reset to recover from GPU hangs, and this
 	 * procedure usually follows the following workflow:
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
+	 * 1. Stop the scheduler using drm_sched_stop(). This will cancel the
+	 *    scheduler's work items, guaranteeing that nothing is queued while
+	 *    we reset the hardware queue.
 	 * 2. Try to gracefully stop non-faulty jobs (optional)
 	 * 3. Issue a GPU reset (driver-specific)
 	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
 	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 *    jobs can be queued, and the scheduler's work items are resubmitted.
 	 *
 	 * Note that some GPUs have distinct hardware queues but need to reset
 	 * the GPU globally, which requires extra synchronization between the
-- 
2.48.1

