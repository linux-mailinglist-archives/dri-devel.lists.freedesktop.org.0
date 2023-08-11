Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ADF77856E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 04:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89F10E632;
	Fri, 11 Aug 2023 02:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439F410E623;
 Fri, 11 Aug 2023 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691721101; x=1723257101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3aMEmMkj+6m2f6jDH+9+Z9CpZnqmjg7WCvsHkkchaw=;
 b=T9XyMcmsErCjdAvVNBCAFJiMW4vGwJWukEXaSdD5shuyBubggmcnfdYv
 RDkVDckFizDl+NbYKd6I4I3Zhw6Qvh9U7qZNe177rQmGbUNgpcb5xnRVR
 O6vRCJlPK3Wyl6foHMo2LhyMiBUvykT9AAD7GhUgCbgmfw7UxJmnUzwfH
 N+dOx07ytO62TkEPNbxSsnI6+WeoHhGaoukcPN88M4QsguJ8vWKFozrYO
 HN9zQVDBhya27p6A6W/mj62CEPtCJMmYDsKH3Jp992jDG6UwyFDHXZ5cW
 +VajyfprJdHq7wDTOTwxAggQCNIP/R6vy+PQycKnxR6U35yYQ/h5qO9dA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714820"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="361714820"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797838403"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="797838403"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Date: Thu, 10 Aug 2023 19:31:32 -0700
Message-Id: <20230811023137.659037-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than call free_job and run_job in same work item have a dedicated
work item for each. This aligns with the design and intended use of work
queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
 include/drm/gpu_scheduler.h            |   8 +-
 2 files changed, 106 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cede47afc800..b67469eac179 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
  * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
  * @rq: scheduler run queue to check.
+ * @dequeue: dequeue selected entity
  *
  * Try to find a ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
 {
 	struct drm_sched_entity *entity;
 
@@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	if (entity) {
 		list_for_each_entry_continue(entity, &rq->entities, list) {
 			if (drm_sched_entity_is_ready(entity)) {
-				rq->current_entity = entity;
-				reinit_completion(&entity->entity_idle);
+				if (dequeue) {
+					rq->current_entity = entity;
+					reinit_completion(&entity->entity_idle);
+				}
 				spin_unlock(&rq->lock);
 				return entity;
 			}
@@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	list_for_each_entry(entity, &rq->entities, list) {
 
 		if (drm_sched_entity_is_ready(entity)) {
-			rq->current_entity = entity;
-			reinit_completion(&entity->entity_idle);
+			if (dequeue) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+			}
 			spin_unlock(&rq->lock);
 			return entity;
 		}
@@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
  * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
  *
  * @rq: scheduler run queue to check.
+ * @dequeue: dequeue selected entity
  *
  * Find oldest waiting ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
 {
 	struct rb_node *rb;
 
@@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
 		if (drm_sched_entity_is_ready(entity)) {
-			rq->current_entity = entity;
-			reinit_completion(&entity->entity_idle);
+			if (dequeue) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+			}
 			break;
 		}
 	}
@@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * drm_sched_submit_queue - scheduler queue submission
+ * drm_sched_run_job_queue - queue job submission
  * @sched: scheduler instance
  */
-static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
-		queue_work(sched->submit_wq, &sched->work_submit);
+		queue_work(sched->submit_wq, &sched->work_run_job);
+}
+
+static struct drm_sched_entity *
+drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
+
+/**
+ * drm_sched_run_job_queue_if_ready - queue job submission if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	if (drm_sched_select_entity(sched, false))
+		drm_sched_run_job_queue(sched);
+}
+
+/**
+ * drm_sched_free_job_queue - queue free job
+ *
+ * @sched: scheduler instance to queue free job
+ */
+static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_free_job);
+}
+
+/**
+ * drm_sched_free_job_queue_if_ready - queue free job if ready
+ *
+ * @sched: scheduler instance to queue free job
+ */
+static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_job *job;
+
+	spin_lock(&sched->job_list_lock);
+	job = list_first_entry_or_null(&sched->pending_list,
+				       struct drm_sched_job, list);
+	if (job && dma_fence_is_signaled(&job->s_fence->finished))
+		drm_sched_free_job_queue(sched);
+	spin_unlock(&sched->job_list_lock);
 }
 
 /**
@@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_submit_queue(sched);
+	drm_sched_free_job_queue(sched);
 }
 
 /**
@@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		drm_sched_submit_queue(sched);
+		drm_sched_run_job_queue(sched);
 }
 
 /**
  * drm_sched_select_entity - Select next entity to process
  *
  * @sched: scheduler instance
+ * @dequeue: dequeue selected entity
  *
  * Returns the entity to process or NULL if none are found.
  */
 static struct drm_sched_entity *
-drm_sched_select_entity(struct drm_gpu_scheduler *sched)
+drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
 {
 	struct drm_sched_entity *entity;
 	int i;
@@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
+							dequeue) :
+			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
+						      dequeue);
 		if (entity)
 			break;
 	}
@@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_main - main scheduler thread
+ * drm_sched_free_job_work - worker to call free_job
  *
- * @param: scheduler instance
+ * @w: free job work
  */
-static void drm_sched_main(struct work_struct *w)
+static void drm_sched_free_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
-		container_of(w, struct drm_gpu_scheduler, work_submit);
-	struct drm_sched_entity *entity;
+		container_of(w, struct drm_gpu_scheduler, work_free_job);
 	struct drm_sched_job *cleanup_job;
-	int r;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
 	cleanup_job = drm_sched_get_cleanup_job(sched);
-	entity = drm_sched_select_entity(sched);
+	if (cleanup_job) {
+		sched->ops->free_job(cleanup_job);
+
+		drm_sched_free_job_queue_if_ready(sched);
+		drm_sched_run_job_queue_if_ready(sched);
+	}
+}
 
-	if (!entity && !cleanup_job)
-		return;	/* No more work */
+/**
+ * drm_sched_run_job_work - worker to call run_job
+ *
+ * @w: run job work
+ */
+static void drm_sched_run_job_work(struct work_struct *w)
+{
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	struct drm_sched_entity *entity;
+	int r;
 
-	if (cleanup_job)
-		sched->ops->free_job(cleanup_job);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
+	entity = drm_sched_select_entity(sched, true);
 	if (entity) {
 		struct dma_fence *fence;
 		struct drm_sched_fence *s_fence;
@@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
 		sched_job = drm_sched_entity_pop_job(entity);
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
-				return;	/* No more work */
-			goto again;
+			return;	/* No more work */
 		}
 
 		s_fence = sched_job->s_fence;
@@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
 		}
 
 		wake_up(&sched->job_scheduled);
+		drm_sched_run_job_queue_if_ready(sched);
 	}
-
-again:
-	drm_sched_submit_queue(sched);
 }
 
 /**
@@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	INIT_WORK(&sched->work_submit, drm_sched_main);
+	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
+	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
 void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, true);
-	cancel_work_sync(&sched->work_submit);
+	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_submit_stop);
 
@@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
 void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, false);
-	queue_work(sched->submit_wq, &sched->work_submit);
+	queue_work(sched->submit_wq, &sched->work_run_job);
+	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_submit_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 04eec2d7635f..fbc083a92757 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @submit_wq: workqueue used to queue @work_submit
+ * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_submit: schedules jobs and cleans up entities
+ * @work_run_job: schedules jobs
+ * @work_free_job: cleans up jobs
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
-	struct work_struct		work_submit;
+	struct work_struct		work_run_job;
+	struct work_struct		work_free_job;
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
-- 
2.34.1

