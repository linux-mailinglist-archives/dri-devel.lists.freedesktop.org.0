Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8254E79C297
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122E10E386;
	Tue, 12 Sep 2023 02:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9EA10E31F;
 Tue, 12 Sep 2023 02:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485042; x=1726021042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jqg6Z/vsMx8+zj4j5RBSTVqEYk+tHzWcEKoOELpXxn8=;
 b=cgOa4B5YTdNv8erijV6uMUSgzKk2YtRYA/4JUcTjYocDU5ZZH5OR5/sP
 udSfk3BZ5ceKiEWx/ktJCNY/4fURCzsix3/xQ4rwqLh2QY8EFTQKLioXl
 /+DVHwulnPs8RBsFehcT9TC5svhnuH/A8T4DEuSvSobh6XTz2RTSbqY57
 mgGlTqx+b/6sm2xMUDrl27a6kVlipa+mIZFG57tecrwrpCB6hMqS8DwY+
 UXU27WFA3zLkpZJO+etYUhNcvKhZyMgBEUY1B/odaTqUWSAQQ7cX9Jt32
 R5lLzi3wtwHGcR0KScrPGfSAH1RGoW1R0IEA7Vj23hOCoQ1SAO7/Zdql3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172600"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172600"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255587"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255587"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete in
 scheduler kill
Date: Mon, 11 Sep 2023 19:16:13 -0700
Message-Id: <20230912021615.2086698-12-matthew.brost@intel.com>
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

Wait for pending jobs to be complete before signaling queued jobs. This
ensures dma-fence signaling order correct and also ensures the entity is
not running on the hardware after drm_sched_entity_flush or
drm_sched_entity_fini returns.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
 drivers/gpu/drm/scheduler/sched_main.c      | 50 ++++++++++++++++++---
 include/drm/gpu_scheduler.h                 | 18 ++++++++
 4 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index fb5dad687168..7835c0da65c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1873,7 +1873,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
 			/* remove job from ring_mirror_list */
-			list_del_init(&s_job->list);
+			drm_sched_remove_pending_job(s_job);
 			sched->ops->free_job(s_job);
 			continue;
 		}
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 1dec97caaba3..37557fbb96d0 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -104,9 +104,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	}
 
 	init_completion(&entity->entity_idle);
+	init_completion(&entity->jobs_done);
 
-	/* We start in an idle state. */
+	/* We start in an idle and jobs done state. */
 	complete_all(&entity->entity_idle);
+	complete_all(&entity->jobs_done);
 
 	spin_lock_init(&entity->rq_lock);
 	spsc_queue_init(&entity->job_queue);
@@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	/* Make sure this entity is not used by the scheduler at the moment */
 	wait_for_completion(&entity->entity_idle);
 
+	/* Make sure all pending jobs are done */
+	wait_for_completion(&entity->jobs_done);
+
 	/* The entity is guaranteed to not be used by the scheduler */
 	prev = rcu_dereference_check(entity->last_scheduled, true);
 	dma_fence_get(prev);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 689fb6686e01..ed6f5680793a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 }
 EXPORT_SYMBOL(drm_sched_resume_timeout);
 
+/**
+ * drm_sched_add_pending_job - Add pending job to scheduler
+ *
+ * @job: scheduler job to add
+ * @tail: add to tail of pending list
+ */
+void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
+{
+	struct drm_gpu_scheduler *sched = job->sched;
+	struct drm_sched_entity *entity = job->entity;
+
+	lockdep_assert_held(&sched->job_list_lock);
+
+	if (tail)
+		list_add_tail(&job->list, &sched->pending_list);
+	else
+		list_add(&job->list, &sched->pending_list);
+	if (!entity->pending_job_count++)
+		reinit_completion(&entity->jobs_done);
+}
+EXPORT_SYMBOL(drm_sched_add_pending_job);
+
+/**
+ * drm_sched_remove_pending_job - Remove pending job from` scheduler
+ *
+ * @job: scheduler job to remove
+ */
+void drm_sched_remove_pending_job(struct drm_sched_job *job)
+{
+	struct drm_gpu_scheduler *sched = job->sched;
+	struct drm_sched_entity *entity = job->entity;
+
+	lockdep_assert_held(&sched->job_list_lock);
+
+	list_del_init(&job->list);
+	if (!--entity->pending_job_count)
+		complete_all(&entity->jobs_done);
+}
+EXPORT_SYMBOL(drm_sched_remove_pending_job);
+
 static void drm_sched_job_begin(struct drm_sched_job *s_job)
 {
 	struct drm_gpu_scheduler *sched = s_job->sched;
 
 	spin_lock(&sched->job_list_lock);
-	list_add_tail(&s_job->list, &sched->pending_list);
+	drm_sched_add_pending_job(s_job, true);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
 		 * is parked at which point it's safe.
 		 */
-		list_del_init(&job->list);
+		drm_sched_remove_pending_job(job);
 		spin_unlock(&sched->job_list_lock);
 
 		status = job->sched->ops->timedout_job(job);
@@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		 * Add at the head of the queue to reflect it was the earliest
 		 * job extracted.
 		 */
-		list_add(&bad->list, &sched->pending_list);
+		drm_sched_add_pending_job(bad, false);
 
 	/*
 	 * Iterate the job list from later to  earlier one and either deactive
@@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 			 * Locking here is for concurrent resume timeout
 			 */
 			spin_lock(&sched->job_list_lock);
-			list_del_init(&s_job->list);
+			drm_sched_remove_pending_job(s_job);
 			spin_unlock(&sched->job_list_lock);
 
 			/*
@@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
-		list_del_init(&job->list);
+		drm_sched_remove_pending_job(job);
 
 		/* cancel this job's TO timer */
 		cancel_delayed_work(&sched->work_tdr);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index b7b818cd81b6..7c628f36fe78 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -233,6 +233,21 @@ struct drm_sched_entity {
 	 */
 	struct completion		entity_idle;
 
+	/**
+	 * @pending_job_count:
+	 *
+	 * Number of pending jobs.
+	 */
+	unsigned int                    pending_job_count;
+
+	/**
+	 * @jobs_done:
+	 *
+	 * Signals when entity has no pending jobs, used to sequence entity
+	 * cleanup in drm_sched_entity_fini().
+	 */
+	struct completion		jobs_done;
+
 	/**
 	 * @oldest_job_waiting:
 	 *
@@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
 drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 		     unsigned int num_sched_list);
 
+void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
+void drm_sched_remove_pending_job(struct drm_sched_job *job);
+
 #endif
-- 
2.34.1

