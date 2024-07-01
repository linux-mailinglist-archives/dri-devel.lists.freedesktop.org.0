Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194C91E65E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ACF10E4BA;
	Mon,  1 Jul 2024 17:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563F410E4B9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:15:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc5-0002p8-2t; Mon, 01 Jul 2024 19:14:49 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc3-006Q8D-Uc; Mon, 01 Jul 2024 19:14:47 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 1/4] drm/scheduler: implement hardware time accounting
Date: Mon,  1 Jul 2024 19:14:44 +0200
Message-Id: <20240701171447.3823888-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Multiple drivers came up with the requirement to measure how
much runtime each entity accumulated on the HW.

A previous attempt of accounting this had to be reverted because
HW submissions can have a lifetime exceeding that of the entity
originally issuing them.

Amdgpu on the other hand solves this task by keeping track of
all the submissions and calculating how much time they have used
on demand.

Move this approach over into the scheduler to provide an easy to
use interface for all drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- rebase to v6.10-rc1
- fix for non-power-of-two number of HW submission
- add comment explaining the logic behind the fence tracking array
- rename some function and fix documentation
---
 drivers/gpu/drm/scheduler/sched_entity.c | 82 +++++++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++++
 include/drm/gpu_scheduler.h              | 31 +++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..d678d0b9b29e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
+	unsigned int i, num_submissions = 0;
+
+	if (!entity || !sched_list)
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -98,6 +100,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 						 (s32) DRM_SCHED_PRIORITY_KERNEL);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
+
+		for (i = 0; i < num_sched_list; ++i) {
+			num_submissions = max(num_submissions,
+					      sched_list[i]->credit_limit);
+		}
 	}
 
 	init_completion(&entity->entity_idle);
@@ -110,11 +117,52 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 
 	atomic_set(&entity->fence_seq, 0);
 	entity->fence_context = dma_fence_context_alloc(2);
+	spin_lock_init(&entity->accounting_lock);
+
+	if (!num_submissions)
+		return 0;
+
+	entity->max_hw_submissions = num_submissions;
+	entity->hw_submissions = kcalloc(num_submissions, sizeof(void *),
+					 GFP_KERNEL);
+	if (!entity->hw_submissions)
+		return -ENOMEM;
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_init);
 
+/**
+ * drm_sched_entity_time_spent - Accumulated HW runtime used by this entity
+ * @entity: scheduler entity to check
+ *
+ * Get the current accumulated HW runtime used by all submissions made through
+ * this entity.
+ */
+ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity)
+{
+	ktime_t result;
+	unsigned int i;
+
+	if (!entity->max_hw_submissions)
+		return ns_to_ktime(0);
+
+	spin_lock(&entity->accounting_lock);
+	result = entity->hw_time_used;
+	for (i = 0; i < entity->max_hw_submissions; ++i) {
+		struct drm_sched_fence *fence = entity->hw_submissions[i];
+
+		if (!fence)
+			continue;
+
+		result = ktime_add(result, drm_sched_fence_get_runtime(fence));
+	}
+	spin_unlock(&entity->accounting_lock);
+
+	return result;
+}
+EXPORT_SYMBOL(drm_sched_entity_time_spent);
+
 /**
  * drm_sched_entity_modify_sched - Modify sched of an entity
  * @entity: scheduler entity to init
@@ -326,6 +374,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
  */
 void drm_sched_entity_fini(struct drm_sched_entity *entity)
 {
+	unsigned int i;
+
 	/*
 	 * If consumption of existing IBs wasn't completed. Forcefully remove
 	 * them here. Also makes sure that the scheduler won't touch this entity
@@ -341,6 +391,9 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	for (i = 0; i < entity->max_hw_submissions; ++i)
+		dma_fence_put(&entity->hw_submissions[i]->scheduled);
+	kfree(entity->hw_submissions);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
@@ -522,6 +575,33 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 */
 	sched_job->entity = NULL;
 
+	if (entity->max_hw_submissions) {
+		struct drm_sched_fence *fence = sched_job->s_fence;
+		unsigned int idx = fence->scheduled.seqno;
+
+		dma_fence_get(&fence->scheduled);
+		idx %= entity->max_hw_submissions;
+
+		spin_lock(&entity->accounting_lock);
+		/*
+		 * The fence seqno is dense and monotonically increasing. By
+		 * cycling through a array sized to match the maximum number of
+		 * submissions queued in the HW we can be sure that once we need
+		 * to reuse a slot the fence stored in this slot refers to a
+		 * retired submission and we can safely sum up the accumulated
+		 * runtime and dispose the fence.
+		 */
+		swap(fence, entity->hw_submissions[idx]);
+		if (fence) {
+			ktime_t runtime = drm_sched_fence_get_runtime(fence);
+
+			entity->hw_time_used = ktime_add(entity->hw_time_used,
+							 runtime);
+			dma_fence_put(&fence->scheduled);
+		}
+		spin_unlock(&entity->accounting_lock);
+	}
+
 	return sched_job;
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..55981ada1829 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -82,6 +82,25 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
 	dma_fence_signal(&fence->finished);
 }
 
+/**
+ * drm_sched_fence_get_runtime - accumulated runtime on HW
+ * @fence: fence
+ *
+ * Calculate how much runtime this fence has accumulated on the HW.
+ */
+ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence)
+{
+	/* When the fence is not scheduled, it can't have accumulated runtime */
+	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->scheduled.flags))
+		return ns_to_ktime(0);
+
+	/* When it is still running, calculate runtime until now */
+	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->finished.flags))
+		return ktime_sub(ktime_get(), fence->scheduled.timestamp);
+
+	return ktime_sub(fence->finished.timestamp, fence->scheduled.timestamp);
+}
+
 static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 {
 	return "drm_sched";
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..52bcff324a92 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -238,6 +238,35 @@ struct drm_sched_entity {
 	 */
 	struct rb_node			rb_tree_node;
 
+	/**
+	 * @accounting_lock:
+	 *
+	 * Protects the array of fences tracking the in-flight HW submissions
+	 * and the accumulator counter.
+	 */
+	spinlock_t			accounting_lock;
+
+	/**
+	 * @hw_time_used:
+	 *
+	 * How much HW runtime has been accumulated by retired submissions
+	 * from this entity.
+	 */
+	ktime_t				hw_time_used;
+
+	/**
+	 * @max_hw_submissions:
+	 *
+	 * Maximum number of submissions queued in the HW.
+	 */
+	unsigned int			max_hw_submissions;
+
+	/**
+	 * @hw_submissions:
+	 *
+	 * Scheduler fences of the HW submissions in flight.
+	 */
+	struct drm_sched_fence		**hw_submissions;
 };
 
 /**
@@ -600,6 +629,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
+ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
@@ -620,6 +650,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
 			       struct dma_fence *parent);
 void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
+ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence);
 
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.39.2

