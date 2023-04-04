Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23D6D5582
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE11610E08C;
	Tue,  4 Apr 2023 00:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CE310E08A;
 Tue,  4 Apr 2023 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567744; x=1712103744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bCWnPihC2yKjoD/PHDXw9txgKVWfGootNC5roVYYdgw=;
 b=YKE2cZiUhr3rpYqJFn6dZdBPZEik/cTwF136pOD+/MKBTL1zy4mNUCMr
 zzd39GkHRKf3IUw+g1oGZywMY1TpYLbykR5LUUoTA8DDMCNN73oBD9nbK
 hQTjeJwAq2kujSq9IoCWHHWcwIBYkX53eSotJ0RqqdTrrsbIdII3zCEVE
 woJ9+IDSE9gsFXfP5KRZb61ETUukxXjgWp/sSPuvGpCD5QvDbQHotMsmI
 yy+Y+xotClFFwYpFlG7lI1y4v+sUcqlcZ1IlVxicBVYWD1oc3EKVMQHaz
 4n6nd8XJvIYNFuSmmLSfyI5Au5o0eA6RPxq3i9Er0892QWm/LRJUQU6Tn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810551"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810551"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460315"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460315"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 09/10] drm/sched: Support long-running sched entities
Date: Mon,  3 Apr 2023 17:22:10 -0700
Message-Id: <20230404002211.3611376-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Make the drm scheduler aware of long-running dma fences by

* Enable marking a sched entity as producing long-running fences.
* Disallowing long-running fences as dependencies for non-long-running
  sched entities, while long-running sched entities allow those.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 44 +++++++++++++++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c  |  4 +++
 drivers/gpu/drm/scheduler/sched_main.c   |  9 ++---
 include/drm/gpu_scheduler.h              | 36 +++++++++++++++++++
 include/linux/dma-fence.h                |  5 +++
 5 files changed, 86 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ccea4d079d0f..0640fc9d4491 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -174,6 +174,32 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 	job->sched->ops->free_job(job);
 }
 
+/**
+ * drm_sched_entity_add_fence_cb() - Helper to add a fence callback
+ * @entity: The sched entity
+ * @f: The possbily long-running dma-fence on which to add a callback
+ * @cb: The struct dma_fence_cb to use for the callback
+ * @func: The callback function.
+ *
+ * This function calls the proper dma_fence add callback function
+ * depending on whether @entity is marked as long-running or not. If it
+ * is not, this will make sure we get a warning if trying to add a
+ * callback on a long-running dma-fence.
+ *
+ * Return: Zero on success, -ENOENT if already signaled and -EINVAL in case
+ * of error.
+ */
+int drm_sched_entity_add_fence_cb(struct drm_sched_entity *entity,
+				  struct dma_fence *f,
+				  struct dma_fence_cb *cb,
+				  dma_fence_func_t func)
+{
+	if (drm_sched_entity_is_lr(entity))
+		return dma_fence_lr_add_callback(f, cb, func);
+
+	return dma_fence_add_callback(f, cb, func);
+}
+
 /* Signal the scheduler finished fence when the entity in question is killed. */
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb)
@@ -187,8 +213,8 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	/* Wait for all dependencies to avoid data corruptions */
 	while (!xa_empty(&job->dependencies)) {
 		f = xa_erase(&job->dependencies, job->last_dependency++);
-		r = dma_fence_add_callback(f, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb);
+		r = drm_sched_entity_add_fence_cb(job->entity, f, &job->finish_cb,
+						  drm_sched_entity_kill_jobs_cb);
 		if (!r)
 			return;
 
@@ -226,8 +252,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 		dma_fence_set_error(&s_fence->finished, -ESRCH);
 
 		dma_fence_get(&s_fence->finished);
-		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb))
+		if (!prev || drm_sched_entity_add_fence_cb(job->entity, prev,
+							   &job->finish_cb,
+							   drm_sched_entity_kill_jobs_cb))
 			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
 
 		prev = &s_fence->finished;
@@ -420,8 +447,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 		fence = dma_fence_get(&s_fence->scheduled);
 		dma_fence_put(entity->dependency);
 		entity->dependency = fence;
-		if (!dma_fence_add_callback(fence, &entity->cb,
-					    drm_sched_entity_clear_dep))
+		if (!drm_sched_entity_add_fence_cb(entity, fence, &entity->cb,
+						   drm_sched_entity_clear_dep))
 			return true;
 
 		/* Ignore it when it is already scheduled */
@@ -429,8 +456,9 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 		return false;
 	}
 
-	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
-				    drm_sched_entity_wakeup))
+	if (!drm_sched_entity_add_fence_cb(entity, entity->dependency,
+					   &entity->cb,
+					   drm_sched_entity_wakeup))
 		return true;
 
 	dma_fence_put(entity->dependency);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index d7cfc0441885..a566723ecc2c 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -217,8 +217,12 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
+	if (drm_sched_entity_is_lr(entity))
+		dma_fence_set_lr(&fence->scheduled);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
 		       &fence->lock, entity->fence_context + 1, seq);
+	if (drm_sched_entity_is_lr(entity))
+		dma_fence_set_lr(&fence->finished);
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d61880315d8d..76336a31aa82 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -618,8 +618,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			continue;
 
 		if (fence) {
-			r = dma_fence_add_callback(fence, &s_job->cb,
-						   drm_sched_job_done_cb);
+			r = drm_sched_entity_add_fence_cb(s_job->entity, fence,
+							  &s_job->cb, drm_sched_job_done_cb);
 			if (r == -ENOENT)
 				drm_sched_job_done(s_job);
 			else if (r)
@@ -1180,8 +1180,9 @@ static void drm_sched_main(struct work_struct *w)
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
 
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
+			r = drm_sched_entity_add_fence_cb(sched_job->entity, fence,
+							  &sched_job->cb,
+							  drm_sched_job_done_cb);
 			if (r == -ENOENT)
 				drm_sched_job_done(sched_job);
 			else if (r)
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6258e324bd7c..546507852771 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -142,6 +142,16 @@ struct drm_sched_entity {
 	 */
 	unsigned int                    num_sched_list;
 
+	/**
+	 * @flags: Flags to govern the behaviour:
+	 *
+	 * DRM_SCHED_ENTITY_LR: The entity handles long-running jobs and
+	 * produces long-running completion fences, as well as accepts
+	 * long-running dependency fences.
+	 */
+	u32                             flags;
+#define DRM_SCHED_ENTITY_LR             BIT(0)
+
 	/**
 	 * @priority:
 	 *
@@ -253,6 +263,32 @@ struct drm_sched_entity {
 
 };
 
+/**
+ * drm_sched_entity_is_lr() - Whether the entity manages long-running jobs.
+ * @entity: The entity.
+ *
+ * Return: true if managing long-running jobs. Otherwise false.
+ */
+static inline bool drm_sched_entity_is_lr(const struct drm_sched_entity *entity)
+{
+	return entity->flags & DRM_SCHED_ENTITY_LR;
+}
+
+/**
+ * drm_sched_entity_set_lr() - Mark the entity as managing long-running jobs.
+ * @entity: The entity.
+ *
+ */
+static inline void drm_sched_entity_set_lr(struct drm_sched_entity *entity)
+{
+	entity->flags |= DRM_SCHED_ENTITY_LR;
+}
+
+int drm_sched_entity_add_fence_cb(struct drm_sched_entity *entity,
+				  struct dma_fence *f,
+				  struct dma_fence_cb *cb,
+				  dma_fence_func_t func);
+
 /**
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 08d21e26782b..b513811ce536 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -285,6 +285,11 @@ static inline bool dma_fence_is_lr(const struct dma_fence *fence)
 	return test_bit(DMA_FENCE_FLAG_LR_BIT, &fence->flags);
 }
 
+static inline void dma_fence_set_lr(struct dma_fence *fence)
+{
+	__set_bit(DMA_FENCE_FLAG_LR_BIT, &fence->flags);
+}
+
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
-- 
2.34.1

