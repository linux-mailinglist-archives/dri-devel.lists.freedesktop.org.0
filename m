Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6A9FE92F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73310E538;
	Mon, 30 Dec 2024 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AK3IkuD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165610E533
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2uHCzA+woXEdPjowOlN/PXxYpGOEfDogE3a9OlVqEh4=; b=AK3IkuD8iZIAIxoV48FMooB/yw
 o5I2Z8DlQU0T2yDNWoGgLo9UL8eeYGRSK9jNQr5kufwEadrdodKVeT9bLxIkplnrWnyJU4YSXukQO
 4dGXDIMwbpuvITZWd3Fin5INR7gyXJ+T7N/WGW4D4sB/qlG7KotTsCNJoL9t3jnsrmJBMidHvL0SZ
 Sw6xkudQ8ogpXjDlNjzpItlbUH0cIVOFbXwWO1BAYKDIELmjlT3fzRl59dGcCuYtDYDy/pn2Kkb6b
 qlhQrjSSwUSH446hFfb8CTd/smD+BwqMwIUsEUOVqZiRwaoNkOceWHBMnE6/GP/YRraCMCfJCdSYt
 QK7KF1ig==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0x-009ZwU-NT; Mon, 30 Dec 2024 17:53:11 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
Subject: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
Date: Mon, 30 Dec 2024 16:52:56 +0000
Message-ID: <20241230165259.95855-12-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Now that the scheduling policy is deadline based it feels completely
natural to allow propagating externaly set deadlines to the scheduler.

Scheduler deadlines are not a guarantee but as the dma-fence facility is
already in use by userspace lets wire it up.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 30 +++++++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_fence.c  |  3 +++
 drivers/gpu/drm/scheduler/sched_rq.c     | 16 +++++++++++++
 include/drm/gpu_scheduler.h              |  8 +++++++
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 14bc3f797079..c5a4c04b2455 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -385,7 +385,24 @@ ktime_t
 drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
 				  struct drm_sched_job *job)
 {
-	return __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
+	struct drm_sched_fence *s_fence = job->s_fence;
+	struct dma_fence *fence = &s_fence->finished;
+	ktime_t deadline;
+
+	deadline = __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
+	    ktime_before(s_fence->deadline, deadline))
+		deadline = s_fence->deadline;
+
+	return deadline;
+}
+
+void drm_sched_entity_set_deadline(struct drm_sched_entity *entity,
+				   ktime_t deadline)
+{
+	spin_lock(&entity->lock);
+	drm_sched_rq_update_deadline(entity->rq, entity, deadline);
+	spin_unlock(&entity->lock);
 }
 
 /*
@@ -536,8 +553,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  */
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
+	struct drm_sched_fence *s_fence = sched_job->s_fence;
 	struct drm_sched_entity *entity = sched_job->entity;
+	struct dma_fence *fence = &s_fence->finished;
 	ktime_t submit_ts = ktime_get();
+	ktime_t fence_deadline;
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
@@ -552,6 +572,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	 * Make sure to set the submit_ts first, to avoid a race.
 	 */
 	sched_job->submit_ts = submit_ts;
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags))
+		fence_deadline = s_fence->deadline;
+	else
+		fence_deadline = KTIME_MAX;
+
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
@@ -560,6 +585,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		submit_ts = __drm_sched_entity_get_job_deadline(entity,
 								submit_ts);
+		if (ktime_before(fence_deadline, submit_ts))
+			submit_ts = fence_deadline;
+
 		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
 		if (sched)
 			drm_sched_wakeup(sched);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..dfc7f50d4e0d 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 
 	spin_unlock_irqrestore(&fence->lock, flags);
 
+	drm_sched_entity_set_deadline(fence->entity, deadline);
+
 	/*
 	 * smp_load_aquire() to ensure that if we are racing another
 	 * thread calling drm_sched_fence_set_parent(), that we see
@@ -223,6 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
+	fence->entity = entity;
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 1a454384ab25..e96c8ca9c54b 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -148,6 +148,22 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
 	spin_unlock(&entity->lock);
 }
 
+void drm_sched_rq_update_deadline(struct drm_sched_rq *rq,
+				  struct drm_sched_entity *entity,
+				  ktime_t deadline)
+{
+	lockdep_assert_held(&entity->lock);
+
+	if (ktime_before(deadline, entity->oldest_job_waiting)) {
+		spin_lock(&rq->lock);
+		if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
+			__drm_sched_rq_remove_tree_locked(entity, rq);
+			__drm_sched_rq_add_tree_locked(entity, rq, deadline);
+		}
+		spin_unlock(&rq->lock);
+	}
+}
+
 /**
  * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 85f3a0d5a7be..c68dce8af063 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -291,6 +291,9 @@ struct drm_sched_fence {
          * &drm_sched_fence.finished fence once parent is signalled.
          */
 	struct dma_fence		*parent;
+
+	struct drm_sched_entity		*entity;
+
         /**
          * @sched: the scheduler instance to which the job having this struct
          * belongs to.
@@ -597,6 +600,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
 struct drm_sched_entity *
 drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 			   struct drm_sched_rq *rq);
+void drm_sched_rq_update_deadline(struct drm_sched_rq *rq,
+				  struct drm_sched_entity *entity,
+				  ktime_t deadline);
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
@@ -612,6 +618,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
+void drm_sched_entity_set_deadline(struct drm_sched_entity *entity,
+				   ktime_t deadline);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 ktime_t drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
 					  struct drm_sched_job *job);
-- 
2.47.1

