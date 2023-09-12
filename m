Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B134B79C28E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4510E356;
	Tue, 12 Sep 2023 02:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479D010E265;
 Tue, 12 Sep 2023 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485040; x=1726021040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wV5bGPGafq3nn8oyVOIzjXo7uujwBJQ+X73mvRZKxeY=;
 b=i1PEAUioR13GAh4PW4fmkeCfGID6Wn0aGXspRpBbbFyjXcx37cxpU5Mg
 RcR5lgdc/zt98bKaRwzBPaq0LvXIueE54Y9cHbPRzxujAYlEuRQZkVYng
 JbacuquYx0GnDzbwVQTiCQB5+ZTjuYiB0pf46B+3xUbpaaHtq8uO4K41Y
 FtU61/aj4sN9J+lylxV+GTuR6tYQs/fGj93oBZRKYWXih7NkujzLC1SZo
 I7/4bnopDWxl3qBcVw0gbZn9+enKlMbiMflT8cRChDtF6EBc2MCQGwXaq
 3tBOQxKdVzWj7t0Lx7wZ8+L2hHTaxRh64VI8KEDgbp5L4htRZsQQCQzjK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172543"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255569"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255569"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/sched: Split free_job into own work item
Date: Mon, 11 Sep 2023 19:16:07 -0700
Message-Id: <20230912021615.2086698-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
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
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than call free_job and run_job in same work item have a dedicated
work item for each. This aligns with the design and intended use of work
queues.

v2:
   - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
     timestamp in free_job() work item (Danilo)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 143 ++++++++++++++++++-------
 include/drm/gpu_scheduler.h            |   8 +-
 2 files changed, 110 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3820e9ae12c8..d28b6751256e 100644
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
@@ -936,8 +986,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
@@ -974,8 +1026,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			next->s_fence->scheduled.timestamp =
-				job->s_fence->finished.timestamp;
+			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+				     &next->s_fence->scheduled.flags))
+				next->s_fence->scheduled.timestamp =
+					job->s_fence->finished.timestamp;
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1025,30 +1079,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
@@ -1057,9 +1125,7 @@ static void drm_sched_main(struct work_struct *w)
 		sched_job = drm_sched_entity_pop_job(entity);
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
-				return;	/* No more work */
-			goto again;
+			return;	/* No more work */
 		}
 
 		s_fence = sched_job->s_fence;
@@ -1089,10 +1155,8 @@ static void drm_sched_main(struct work_struct *w)
 		}
 
 		wake_up(&sched->job_scheduled);
+		drm_sched_run_job_queue_if_ready(sched);
 	}
-
-again:
-	drm_sched_submit_queue(sched);
 }
 
 /**
@@ -1151,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	INIT_WORK(&sched->work_submit, drm_sched_main);
+	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
+	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1276,7 +1341,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
 void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, true);
-	cancel_work_sync(&sched->work_submit);
+	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_submit_stop);
 
@@ -1288,6 +1354,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
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

