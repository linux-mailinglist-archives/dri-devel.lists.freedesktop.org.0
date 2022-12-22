Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7F65487A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A1F10E5AE;
	Thu, 22 Dec 2022 22:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1017010E59B;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=s4S/8EAmsXBk2hLt6odMkz7dZjsBO7IlqdFy6RdQy18=;
 b=FPmzZdeHENyMHkUAJRehARg4tqNT0RPtlilxHTMu6hfk2m4xRQ19jnPr
 DCeVhuFw+QZEMxOXGSC4xeB8meC762PO8FT1rJYPQJF9F6UOVlEslZH4e
 cBqpP6db3m0wjK5q1Lqa724MBkuKjVzIDknXghoGwPAUZzpAEa0UDdyPq
 LuqEqjEoWLOzCLZVKcrDDUR41SdOFBZCPMnyXP9IbyFayDKt8R6Sz+AQS
 p1yCohYvLwqSLfyRwTk+5pEbXDGCoIR4/WbcYqGQzoYI8N0z30tKEz0SQ
 ctK1dwKLhngBQaYgU/oCsBo6YtFTT+F7VdZIGXyCV9RqH0G3P6Ahj9g3u g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472850"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412312"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412312"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 05/20] drm/sched: Add generic scheduler message interface
Date: Thu, 22 Dec 2022 14:21:12 -0800
Message-Id: <20221222222127.34560-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

Add generic schedule message interface which sends messages to backend
from the drm_gpu_scheduler main submission thread. The idea is some of
these messages modify some state in drm_sched_entity which is also
modified during submission. By scheduling these messages and submission
in the same thread their is not race changing states in
drm_sched_entity.

This interface will be used in XE, new Intel GPU driver, to cleanup,
suspend, resume, and change scheduling properties of a drm_sched_entity.

The interface is designed to be generic and extendable with only the
backend understanding the messages.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 58 +++++++++++++++++++++++++-
 include/drm/gpu_scheduler.h            | 29 ++++++++++++-
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8c64045d0692..8e688c2fc482 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -987,6 +987,54 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
+/**
+ * drm_sched_add_msg - add scheduler message
+ *
+ * @sched: scheduler instance
+ * @msg: message to be added
+ *
+ * Can and will pass an jobs waiting on dependencies or in a runnable queue.
+ * Messages processing will stop if schedule run wq is stopped and resume when
+ * run wq is started.
+ */
+void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
+		       struct drm_sched_msg *msg)
+{
+	spin_lock(&sched->job_list_lock);
+	list_add_tail(&msg->link, &sched->msgs);
+	spin_unlock(&sched->job_list_lock);
+
+	/*
+	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
+	 * paused, harmless if this races
+	 */
+	if (!sched->pause_run_wq)
+		queue_work(sched->run_wq, &sched->work_run);
+}
+EXPORT_SYMBOL(drm_sched_add_msg);
+
+/**
+ * drm_sched_get_msg - get scheduler message
+ *
+ * @sched: scheduler instance
+ *
+ * Returns NULL or message
+ */
+static struct drm_sched_msg *
+drm_sched_get_msg(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_msg *msg;
+
+	spin_lock(&sched->job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs,
+				       struct drm_sched_msg, link);
+	if (msg)
+		list_del(&msg->link);
+	spin_unlock(&sched->job_list_lock);
+
+	return msg;
+}
+
 /**
  * drm_sched_main - main scheduler thread
  *
@@ -1000,6 +1048,7 @@ static void drm_sched_main(struct work_struct *w)
 
 	while (!READ_ONCE(sched->pause_run_wq)) {
 		struct drm_sched_entity *entity;
+		struct drm_sched_msg *msg;
 		struct drm_sched_fence *s_fence;
 		struct drm_sched_job *sched_job;
 		struct dma_fence *fence;
@@ -1007,12 +1056,16 @@ static void drm_sched_main(struct work_struct *w)
 
 		cleanup_job = drm_sched_get_cleanup_job(sched);
 		entity = drm_sched_select_entity(sched);
+		msg = drm_sched_get_msg(sched);
 
 		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
 
+		if (msg)
+			sched->ops->process_msg(msg);
+
 		if (!entity) {
-			if (!cleanup_job)
+			if (!cleanup_job && !msg)
 				break;
 			continue;
 		}
@@ -1021,7 +1074,7 @@ static void drm_sched_main(struct work_struct *w)
 
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
+			if (!cleanup_job && !msg)
 				break;
 			continue;
 		}
@@ -1097,6 +1150,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
+	INIT_LIST_HEAD(&sched->msgs);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ff50f3c289cd..31448deb9412 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -369,6 +369,23 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
 
+/**
+ * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
+ * message
+ *
+ * Generic enough for backend defined messages, backend can expand if needed.
+ */
+struct drm_sched_msg {
+	/** @link: list link into the gpu scheduler list of messages */
+	struct list_head		link;
+	/**
+	 * @private_data: opaque pointer to message private data (backend defined)
+	 */
+	void				*private_data;
+	/** @opcode: opcode of message (backend defined) */
+	unsigned int			opcode;
+};
+
 /**
  * struct drm_sched_backend_ops - Define the backend operations
  *	called by the scheduler
@@ -446,6 +463,12 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @process_msg: Process a message. Allowed to block, it is this
+	 * function's responsibility to free message if dynamically allocated.
+	 */
+	void (*process_msg)(struct drm_sched_msg *msg);
 };
 
 /**
@@ -456,6 +479,7 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
+ * @msgs: list of messages to be processed in @work_run
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
@@ -463,7 +487,7 @@ struct drm_sched_backend_ops {
  * @job_id_count: used to assign unique id to the each job.
  * @run_wq: workqueue used to queue @work_run
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_run: schedules jobs and cleans up entities
+ * @work_run: schedules jobs, cleans up jobs, and processes messages
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -485,6 +509,7 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	struct list_head		msgs;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
@@ -530,6 +555,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
+		       struct drm_sched_msg *msg);
 void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-- 
2.37.3

