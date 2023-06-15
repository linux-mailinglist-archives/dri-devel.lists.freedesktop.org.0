Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB67317F2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFA910E184;
	Thu, 15 Jun 2023 11:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C410E184
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:56:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9745ba45cd1so250894966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686830192; x=1689422192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OpboWIhZz5qPBgJdBGeJ22Rcj0KDJXFFSiPI4t0i8cU=;
 b=ksdIuCjXo1w7NWCGFjpg7KFOYrFbCQi94jilXPp6GgFXmtE+KeSgw1rZaqjvnBANPT
 YwVZS8iQ5VAdjak9mzl5HGn0Wasls4XEhjNdmKwE2lsCBJZwtmpXtbiDmXwyf5k8rIOY
 5/J3IOs8FGc9uWx4tBMohWdXFxp6zR3ie1StA8ZPPLHTs3mQWN2o5dmSufPBV2r0/OdP
 jCwQHrccReInwKTaT81JaAQ/fvA8nFeTz3hpBhd9g+9rymvuJJ7djkaItSrJVlyT0viz
 pjVHY6CIgbqmN2VX/EMadt7qSRPUro1nGIvQdirpFtyQBlC9eXyyCxXimyDIdxVoaUKx
 NXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686830192; x=1689422192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpboWIhZz5qPBgJdBGeJ22Rcj0KDJXFFSiPI4t0i8cU=;
 b=jyFh3GFVCUFyScTWuE9JEopnYa77LdnRb37ohD5WlImtF4zDpEv1F+dnbkynC4fq4F
 Le/HziYxyhZkTqDAvWsj9E6cM+jQl0DaivrcYvmpKsqlWMLQRH1cMTM4SeyMi+m7QF9u
 S8mmsITelkylxlRL6nklROl1IengFRTWJbTXfrDJHpqph+XeteiOS1sCLZY0BPXwAnHI
 yhu/EvmrV3CYDElRoeAsfawg0Mkcih+G/PGN438LJWsdoTYnJyP3G8xFwIZtZvc0fOWi
 mtnCJofRjq4Y0gJbInffqmWWtOskgVv1mXfaLgMMtR7seLEFcvDuopjYYwDwutkiuRfG
 mkAA==
X-Gm-Message-State: AC+VfDxPISvt3P57pGaYqfXaEaE8ZafAusS3UJ/+PszG3dvwJBnyOOOf
 1Hcv/3xOvwLdJOB7stiMzjo=
X-Google-Smtp-Source: ACHHUZ5fMcta1pRt5TSGuidq5actr5g1XOEwN7NJLa2M1IkZTfTPM4OTeFtmxzVW7ncnylZsUPrDJA==
X-Received: by 2002:a17:907:6d9a:b0:982:9fbb:216 with SMTP id
 sb26-20020a1709076d9a00b009829fbb0216mr1495374ejc.19.1686830192012; 
 Thu, 15 Jun 2023 04:56:32 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1502:3e00:829a:ba2f:339a:9ad7])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a17090634c700b00965d4b2bd4csm9431961ejb.141.2023.06.15.04.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:56:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Luben.Tuikov@amd.com, l.stach@pengutronix.de,
 tvrtko.ursulin@linux.intel.com, robdclark@chromium.org
Subject: [PATCH 1/3] drm/scheduler: implement hw time accounting
Date: Thu, 15 Jun 2023 13:56:28 +0200
Message-Id: <20230615115630.164098-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple drivers came up with the requirement to measure how
much time each submission spend on the hw.

A previous attempt of accounting this had to be reverted because
hw submissions can live longer than the entity originally
issuing them.

Amdgpu on the other hand solves this task by keeping track of
all the submissions and calculating how much time they have used
on demand.

Move this approach over into the scheduler to provide an easy to
use interface for all drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 89 ++++++++++++++++++++++--
 drivers/gpu/drm/scheduler/sched_fence.c  | 19 +++++
 include/drm/gpu_scheduler.h              | 29 ++++++++
 3 files changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..67307022a505 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
+	unsigned int i, num_submissions;
+
+	if (!entity || !sched_list)
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -75,9 +77,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
-
 	init_completion(&entity->entity_idle);
 
 	/* We start in an idle state. */
@@ -88,11 +87,68 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 
 	atomic_set(&entity->fence_seq, 0);
 	entity->fence_context = dma_fence_context_alloc(2);
+	spin_lock_init(&entity->accounting_lock);
+
+	/* We need to be able to init even unused entities */
+	if (!num_sched_list)
+		return 0;
+
+	entity->rq = &sched_list[0]->sched_rq[entity->priority];
+
+	num_submissions = 0;
+	for (i = 0; i < num_sched_list; ++i) {
+		if (!sched_list[i])
+			return -EINVAL;
+
+		num_submissions = max(num_submissions,
+				      sched_list[i]->hw_submission_limit);
+	}
+
+	/* FIXME: Entity initialized before the scheduler. */
+	if (!num_submissions)
+		return 0;
+
+	entity->num_hw_submissions = num_submissions;
+	entity->hw_submissions = kcalloc(num_submissions, sizeof(void *),
+					 GFP_KERNEL);
+	if (!entity->hw_submissions)
+		return -ENOMEM;
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_init);
 
+/**
+ * drm_sched_entity_time_spend - Accumulated hw time used by this entity
+ * @entity: scheduler entity to check
+ *
+ * Get the current accumulated hw time used by all submissions made through this
+ * entity.
+ */
+ktime_t drm_sched_entity_time_spend(struct drm_sched_entity *entity)
+{
+	ktime_t result;
+	unsigned int i;
+
+	if (!entity->num_hw_submissions)
+		return ns_to_ktime(0);
+
+	spin_lock(&entity->accounting_lock);
+	result = entity->hw_time_used;
+	for (i = 0; i < entity->num_hw_submissions; ++i) {
+		struct drm_sched_fence *fence = entity->hw_submissions[i];
+
+		if (!fence)
+			continue;
+
+		result = ktime_add(result, drm_sched_fence_time_spend(fence));
+	}
+	spin_unlock(&entity->accounting_lock);
+
+	return result;
+}
+EXPORT_SYMBOL(drm_sched_entity_time_spend);
+
 /**
  * drm_sched_entity_modify_sched - Modify sched of an entity
  * @entity: scheduler entity to init
@@ -288,6 +344,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
  */
 void drm_sched_entity_fini(struct drm_sched_entity *entity)
 {
+	unsigned int i;
+
 	/*
 	 * If consumption of existing IBs wasn't completed. Forcefully remove
 	 * them here. Also makes sure that the scheduler won't touch this entity
@@ -303,6 +361,9 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	for (i = 0; i < entity->num_hw_submissions; ++i)
+		dma_fence_put(&entity->hw_submissions[i]->scheduled);
+	kfree(entity->hw_submissions);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
@@ -427,6 +488,8 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *sched_job;
+	struct drm_sched_fence *fence;
+	unsigned int idx;
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 	if (!sched_job)
@@ -475,6 +538,24 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 */
 	sched_job->entity = NULL;
 
+	if (entity->num_hw_submissions) {
+		fence = sched_job->s_fence;
+		dma_fence_get(&fence->scheduled);
+		idx = fence->scheduled.seqno;
+		idx &= entity->num_hw_submissions - 1;
+
+		spin_lock(&entity->accounting_lock);
+		swap(fence, entity->hw_submissions[idx]);
+		if (fence) {
+			ktime_t spend = drm_sched_fence_time_spend(fence);
+
+			entity->hw_time_used = ktime_add(entity->hw_time_used,
+							 spend);
+			dma_fence_put(&fence->scheduled);
+		}
+		spin_unlock(&entity->accounting_lock);
+	}
+
 	return sched_job;
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index ef120475e7c6..9abd076923f5 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -60,6 +60,25 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
 	dma_fence_signal(&fence->finished);
 }
 
+/**
+ * drm_sched_fence_time_spend - calculate time spend on the hw
+ * @fence: fence to use
+ *
+ * Calculate how much time this fence has spend using the hw.
+ */
+ktime_t drm_sched_fence_time_spend(struct drm_sched_fence *fence)
+{
+	/* When the fence is not even scheduled, it can't have spend time */
+	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->scheduled.flags))
+		return ns_to_ktime(0);
+
+	/* When it is still running account how much already spend */
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
index e95b4837e5a3..7f9296202841 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -239,6 +239,33 @@ struct drm_sched_entity {
 	 */
 	struct rb_node			rb_tree_node;
 
+	/**
+	 * @accounting_lock:
+	 *
+	 * Protecting the array of hw submissions and the time spend
+	 */
+	spinlock_t			accounting_lock;
+
+	/**
+	 * @hw_time_used:
+	 *
+	 * how much hw time previous submissions have already used
+	 */
+	ktime_t				hw_time_used;
+
+	/**
+	 * @max_hw_submissions:
+	 *
+	 * Maximum number of submissions currently in worked on bye the hw
+	 */
+	unsigned int			num_hw_submissions;
+
+	/**
+	 * @hw_submissions:
+	 *
+	 * Scheduler fences of the hw submissions in flight
+	 */
+	struct drm_sched_fence		**hw_submissions;
 };
 
 /**
@@ -572,6 +599,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
+ktime_t drm_sched_entity_time_spend(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
@@ -593,6 +621,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
 
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
+ktime_t drm_sched_fence_time_spend(struct drm_sched_fence *fence);
 
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
-- 
2.34.1

