Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273579C294
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7910E382;
	Tue, 12 Sep 2023 02:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B971D10E265;
 Tue, 12 Sep 2023 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485040; x=1726021040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Us4juk9vLxwmBOxY65h/Q2t/xrSK6awx9pmmX3UUDWU=;
 b=U+XpxMHF/eIUHMK0Daf4s2nUigX7FdXfBwRtsu+WEg32nwG0c2yxevQZ
 un2vCZwHQtsINQsRVi9zQYAtC5AjcnX1tLAuuJJweaP53DIPOqzRwvw6E
 g5GEfZzHqviWAOYUmgOgz9lgPENS3EkZm1I614coZ/ujtdxk3ca47jVti
 wToYnVwrBI/bR0KZDvrU/p7aNvd2X49h/ntJSNljUfketf2mAxY9Ktfi8
 DnFNOPZoMwbkXCC+kaGrnTfeK9s/Lr5h8jqSA2k1IBRHbrcuARvnofLh5
 re54KHreXFAaUagwBQSBVmDplEOMLJ/ng8oqKaC0hbVsjlt4z/tu/0zCN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172547"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172547"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255572"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255572"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 06/13] drm/sched: Add generic scheduler message interface
Date: Mon, 11 Sep 2023 19:16:08 -0700
Message-Id: <20230912021615.2086698-7-matthew.brost@intel.com>
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

Add generic schedule message interface which sends messages to backend
from the drm_gpu_scheduler main submission thread. The idea is some of
these messages modify some state in drm_sched_entity which is also
modified during submission. By scheduling these messages and submission
in the same thread their is not race changing states in
drm_sched_entity.

This interface will be used in Xe, new Intel GPU driver, to cleanup,
suspend, resume, and change scheduling properties of a drm_sched_entity.

The interface is designed to be generic and extendable with only the
backend understanding the messages.

v2:
 - (Christian) We dedicated work item

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 98 ++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h            | 34 ++++++++-
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d28b6751256e..13697f45bd7b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -340,6 +340,35 @@ static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_process_msg_queue - queue process msg worker
+ *
+ * @sched: scheduler instance to queue process_msg worker
+ */
+static void drm_sched_process_msg_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_process_msg);
+}
+
+/**
+ * drm_sched_process_msg_queue_if_ready - queue process msg worker if ready
+ *
+ * @sched: scheduler instance to queue process_msg worker
+ */
+static void
+drm_sched_process_msg_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_msg *msg;
+
+	spin_lock(&sched->job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs,
+				       struct drm_sched_msg, link);
+	if (msg)
+		drm_sched_process_msg_queue(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -1078,6 +1107,71 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
+	drm_sched_process_msg_queue(sched);
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
+/**
+ * drm_sched_process_msg_work - worker to call process_msg
+ *
+ * @w: process msg work
+ */
+static void drm_sched_process_msg_work(struct work_struct *w)
+{
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_process_msg);
+	struct drm_sched_msg *msg;
+
+	if (READ_ONCE(sched->pause_submit))
+		return;
+
+	msg = drm_sched_get_msg(sched);
+	if (msg) {
+		sched->ops->process_msg(msg);
+
+		drm_sched_process_msg_queue_if_ready(sched);
+	}
+}
+
 /**
  * drm_sched_free_job_work - worker to call free_job
  *
@@ -1212,11 +1306,13 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
+	INIT_LIST_HEAD(&sched->msgs);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
+	INIT_WORK(&sched->work_process_msg, drm_sched_process_msg_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1343,6 +1439,7 @@ void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
 	WRITE_ONCE(sched->pause_submit, true);
 	cancel_work_sync(&sched->work_run_job);
 	cancel_work_sync(&sched->work_free_job);
+	cancel_work_sync(&sched->work_process_msg);
 }
 EXPORT_SYMBOL(drm_sched_submit_stop);
 
@@ -1356,5 +1453,6 @@ void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
 	WRITE_ONCE(sched->pause_submit, false);
 	queue_work(sched->submit_wq, &sched->work_run_job);
 	queue_work(sched->submit_wq, &sched->work_free_job);
+	queue_work(sched->submit_wq, &sched->work_process_msg);
 }
 EXPORT_SYMBOL(drm_sched_submit_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fbc083a92757..5d753ecb5d71 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
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
@@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
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
@@ -482,15 +505,18 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
+ * @msgs: list of messages to be processed in @work_process_msg
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
+ * @submit_wq: workqueue used to queue @work_run_job, @work_free_job, and
+ *             @work_process_msg
  * @timeout_wq: workqueue used to queue @work_tdr
  * @work_run_job: schedules jobs
  * @work_free_job: cleans up jobs
+ * @work_process_msg: processes messages
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -502,6 +528,8 @@ struct drm_sched_backend_ops {
  * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @pause_submit: pause queuing of @work_run_job, @work_free_job, and
+ *                @work_process_msg on @submit_wq
  * @pause_submit: pause queuing of @work_submit on @submit_wq
  * @dev: system &struct device
  *
@@ -514,6 +542,7 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	struct list_head		msgs;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
@@ -521,6 +550,7 @@ struct drm_gpu_scheduler {
 	struct workqueue_struct		*timeout_wq;
 	struct work_struct		work_run_job;
 	struct work_struct		work_free_job;
+	struct work_struct		work_process_msg;
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
@@ -568,6 +598,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
+		       struct drm_sched_msg *msg);
 bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
-- 
2.34.1

