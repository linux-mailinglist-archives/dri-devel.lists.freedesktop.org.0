Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EC7D7B67
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D498D10E761;
	Thu, 26 Oct 2023 04:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A448810E751;
 Thu, 26 Oct 2023 04:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698293531; x=1729829531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDsQVl7UkZetELHLCi4G6hi8EdBLFGgBbcLPAumocWQ=;
 b=dkfe+IPjSg3MLXgS2A0bpSd4bY7cOZ1ltQvYrtfzru6Woyb7nvZrk+pY
 soLXOR9jWFhVw2rd83jtJmZMeF/ZPiN5PZdLxPLrGEci3mT5I7g0CkiUD
 vOqviMvb3/paXx34j1fXM73WfeVDXl8hvxHPsg8D96z4avQUX02F4wfaX
 VCr1eoEqDILJ+2A+jldRM9xS4ryekEsV6cazcg2dAmhB+j9bNmNwc7h7V
 1+OPv9pNCBbIcnN0ryJ9cLFSfRWPDKnMPiBsnRvJWA9RKOt2wZqRD1U2u
 RHN0xiFsiidsiKXqBDl2S/J4bpBn1s8gUgy2bHs4JzHhFeJQJS4ZHFbOm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377823041"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377823041"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762685135"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762685135"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v7 4/6] drm/sched: Split free_job into own work item
Date: Wed, 25 Oct 2023 21:12:34 -0700
Message-Id: <20231026041236.1273694-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026041236.1273694-1-matthew.brost@intel.com>
References: <20231026041236.1273694-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than call free_job and run_job in same work item have a dedicated
work item for each. This aligns with the design and intended use of work
queues.

v2:
   - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
     timestamp in free_job() work item (Danilo)
v3:
  - Drop forward dec of drm_sched_select_entity (Boris)
  - Return in drm_sched_run_job_work if entity NULL (Boris)
v4:
  - Replace dequeue with peek and invert logic (Luben)
  - Wrap to 100 lines (Luben)
  - Update comments for *_queue / *_queue_if_ready functions (Luben)
v5:
  - Drop peek argument, blindly blindly reinit idle (Luben)
  - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)
  - Update work_run_job & work_free_job kernel doc (Luben)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 241 +++++++++++++++----------
 include/drm/gpu_scheduler.h            |   8 +-
 2 files changed, 151 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b22157e920d4..3d89420d4ffb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -257,12 +257,89 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 /**
  * drm_sched_run_job_queue - enqueue scheduler submission
+ * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
 static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
-		queue_work(sched->submit_wq, &sched->work_submit);
+		queue_work(sched->submit_wq, &sched->work_run_job);
+}
+
+/**
+ * drm_sched_can_queue -- Can we queue more to the hardware?
+ * @sched: scheduler instance
+ *
+ * Return true if we can push more jobs to the hw, otherwise false.
+ */
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
+{
+	return atomic_read(&sched->hw_rq_count) <
+		sched->hw_submission_limit;
+}
+
+/**
+ * drm_sched_select_entity - Select next entity to process
+ *
+ * @sched: scheduler instance
+ *
+ * Returns the entity to process or NULL if none are found.
+ */
+static struct drm_sched_entity *
+drm_sched_select_entity(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_entity *entity;
+	int i;
+
+	if (!drm_sched_can_queue(sched))
+		return NULL;
+
+	/* Kernel run queue has higher priority than normal run queue*/
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
+		if (entity)
+			break;
+	}
+
+	return entity;
+}
+
+/**
+ * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	if (drm_sched_select_entity(sched))
+		drm_sched_run_job_queue(sched);
+}
+
+/**
+ * drm_sched_free_job_queue - enqueue free-job work
+ * @sched: scheduler instance
+ */
+static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_free_job);
+}
+
+/**
+ * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
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
@@ -284,7 +361,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_run_job_queue(sched);
+	drm_sched_free_job_queue(sched);
 }
 
 /**
@@ -550,7 +627,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 				drm_sched_job_done(s_job, fence->error);
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
+					      r);
 		} else
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
@@ -862,18 +939,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- *
- * Return true if we can push more jobs to the hw, otherwise false.
- */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
-{
-	return atomic_read(&sched->hw_rq_count) <
-		sched->hw_submission_limit;
-}
-
 /**
  * drm_sched_wakeup_if_can_queue - Wake up the scheduler
  * @sched: scheduler instance
@@ -886,34 +951,6 @@ void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 		drm_sched_run_job_queue(sched);
 }
 
-/**
- * drm_sched_select_entity - Select next entity to process
- *
- * @sched: scheduler instance
- *
- * Returns the entity to process or NULL if none are found.
- */
-static struct drm_sched_entity *
-drm_sched_select_entity(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_entity *entity;
-	int i;
-
-	if (!drm_sched_can_queue(sched))
-		return NULL;
-
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
-		if (entity)
-			break;
-	}
-
-	return entity;
-}
-
 /**
  * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
  *
@@ -943,8 +980,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			next->s_fence->scheduled.timestamp =
-				dma_fence_timestamp(&job->s_fence->finished);
+			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+				     &next->s_fence->scheduled.flags))
+				next->s_fence->scheduled.timestamp =
+					dma_fence_timestamp(&job->s_fence->finished);
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -994,74 +1033,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
-
-	if (!entity && !cleanup_job)
-		return;	/* No more work */
-
-	if (cleanup_job)
+	if (cleanup_job) {
 		sched->ops->free_job(cleanup_job);
 
-	if (entity) {
-		struct dma_fence *fence;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-
-		sched_job = drm_sched_entity_pop_job(entity);
-		if (!sched_job) {
-			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
-				return;	/* No more work */
-			goto again;
-		}
+		drm_sched_free_job_queue_if_done(sched);
+		drm_sched_run_job_queue_if_ready(sched);
+	}
+}
 
-		s_fence = sched_job->s_fence;
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
+	struct dma_fence *fence;
+	struct drm_sched_fence *s_fence;
+	struct drm_sched_job *sched_job;
+	int r;
 
-		atomic_inc(&sched->hw_rq_count);
-		drm_sched_job_begin(sched_job);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-		trace_drm_run_job(sched_job, entity);
-		fence = sched->ops->run_job(sched_job);
+	entity = drm_sched_select_entity(sched);
+	if (!entity)
+		return;
+
+	sched_job = drm_sched_entity_pop_job(entity);
+	if (!sched_job) {
 		complete_all(&entity->entity_idle);
-		drm_sched_fence_scheduled(s_fence, fence);
+		return;	/* No more work */
+	}
 
-		if (!IS_ERR_OR_NULL(fence)) {
-			/* Drop for original kref_init of the fence */
-			dma_fence_put(fence);
+	s_fence = sched_job->s_fence;
 
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(sched_job, fence->error);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
-		} else {
-			drm_sched_job_done(sched_job, IS_ERR(fence) ?
-					   PTR_ERR(fence) : 0);
-		}
+	atomic_inc(&sched->hw_rq_count);
+	drm_sched_job_begin(sched_job);
 
-		wake_up(&sched->job_scheduled);
+	trace_drm_run_job(sched_job, entity);
+	fence = sched->ops->run_job(sched_job);
+	complete_all(&entity->entity_idle);
+	drm_sched_fence_scheduled(s_fence, fence);
+
+	if (!IS_ERR_OR_NULL(fence)) {
+		/* Drop for original kref_init of the fence */
+		dma_fence_put(fence);
+
+		r = dma_fence_add_callback(fence, &sched_job->cb,
+					   drm_sched_job_done_cb);
+		if (r == -ENOENT)
+			drm_sched_job_done(sched_job, fence->error);
+		else if (r)
+			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+	} else {
+		drm_sched_job_done(sched_job, IS_ERR(fence) ?
+				   PTR_ERR(fence) : 0);
 	}
 
-again:
-	drm_sched_run_job_queue(sched);
+	wake_up(&sched->job_scheduled);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
@@ -1146,7 +1194,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	INIT_WORK(&sched->work_submit, drm_sched_main);
+	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
+	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1273,7 +1322,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, true);
-	cancel_work_sync(&sched->work_submit);
+	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
@@ -1285,6 +1335,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, false);
-	queue_work(sched->submit_wq, &sched->work_submit);
+	queue_work(sched->submit_wq, &sched->work_run_job);
+	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1d52b8bbb06c..37749f561866 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -480,9 +480,10 @@ struct drm_sched_backend_ops {
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @submit_wq: workqueue used to queue @work_submit
+ * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_submit: schedules jobs and cleans up entities
+ * @work_run_job: work which calls run_job op of each scheduler.
+ * @work_free_job: work which calls free_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -511,7 +512,8 @@ struct drm_gpu_scheduler {
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

