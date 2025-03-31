Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426CA76EF9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585AD10E496;
	Mon, 31 Mar 2025 20:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ImWyEFwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F17510E48C;
 Mon, 31 Mar 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GmzJIEigtZr3d7cCzWfe4NXz1hyj/J50h/gdffd7K/A=; b=ImWyEFwoIOchdfZofPiayA5OON
 h4hmFcS0S9Ma2aHyD65nWCXyoam8Bvzhq7kAb2dauzkxoa/ZjquWoV1iZIuYihgyebpnQeG+4Nt7A
 ThMXHEeORYgCf76t0xkh8lJ7In9JMiMBq9clNNuIboAFyEGIG5zf+mXbQmUUQkoak7GaTg9xJp/sP
 XjCw5NCRgmm1wfqQna7oD0i6acS37dUqMvy8MuRpgbU61BqjHB14gTR0ZzAVPcbAD4kuQ+Lymn6+k
 /+bWeNp4t6TO5AdaOr9qP/Dx4XmxGzUbUTY6tC6H2hRmXw94VHi9Lh0TbJa5vZNheiKWdqNlUZy7N
 MdJz+mSg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZg-009M4S-EF; Mon, 31 Mar 2025 22:17:36 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [RFC v3 14/14] drm/sched: Scale deadlines depending on queue depth
Date: Mon, 31 Mar 2025 21:17:05 +0100
Message-ID: <20250331201705.60663-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
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

So far deadline based scheduling was able to remove the need for separate
run queues (per priority) and alleviate the starvation issues hampering
FIFO when somewhat reasonable clients are concerned.

Because the deadline implementation is however still based on the
submission time as its baseline criteria, since the current DRM scheduler
design makes it difficult to perhaps consider job (or entity) "runnable"
timestamp as an alternative, it shares the same weakness as FIFO with
clients which rapidly submit deep job queues. In those cases deadline
scheduler will be similarly unfair as FIFO is.

One simple approach to somewhat alleviate that and apply some fairness is
to scale the relative deadlines by client queue depth.

Apart from queue depth scaling is based on client priority, where kernel
submissions are aggresively pulled in, while userspace priority levels are
pushed out proportionately to the decrease in priority.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 39 ++++++++++++----------
 drivers/gpu/drm/scheduler/sched_internal.h |  4 ---
 drivers/gpu/drm/scheduler/sched_rq.c       |  4 +--
 include/drm/gpu_scheduler.h                |  6 ++--
 4 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c6ed0d1642f3..98be867dcf41 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -387,21 +387,25 @@ static ktime_t
 __drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
 				    ktime_t submit_ts)
 {
-	static const unsigned int d_us[] = {
-		[DRM_SCHED_PRIORITY_KERNEL] =    100,
-		[DRM_SCHED_PRIORITY_HIGH]   =   1000,
-		[DRM_SCHED_PRIORITY_NORMAL] =   5000,
-		[DRM_SCHED_PRIORITY_LOW]    = 100000,
+	static const long d_us[] = {
+		[DRM_SCHED_PRIORITY_KERNEL] = -1000,
+		[DRM_SCHED_PRIORITY_HIGH]   =  1000,
+		[DRM_SCHED_PRIORITY_NORMAL] =  2500,
+		[DRM_SCHED_PRIORITY_LOW]    = 10000,
 	};
+	static const unsigned int shift[] = {
+		[DRM_SCHED_PRIORITY_KERNEL] = 4,
+		[DRM_SCHED_PRIORITY_HIGH]   = 0,
+		[DRM_SCHED_PRIORITY_NORMAL] = 1,
+		[DRM_SCHED_PRIORITY_LOW]    = 2,
+	};
+	const unsigned int prio = entity->priority;
+	long d;
 
-	return ktime_add_us(submit_ts, d_us[entity->priority]);
-}
+	d = d_us[prio] *
+	    ((spsc_queue_count(&entity->job_queue) + 1) << shift[prio]);
 
-ktime_t
-drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
-				  struct drm_sched_job *job)
-{
-	return __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
+	return ktime_add_us(submit_ts, d);
 }
 
 /*
@@ -575,7 +579,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	struct drm_sched_entity *entity = sched_job->entity;
 	struct drm_gpu_scheduler *sched =
 		container_of(entity->rq, typeof(*sched), rq);
-	ktime_t submit_ts;
+	ktime_t deadline_ts;
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
@@ -585,16 +589,15 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	/*
 	 * After the sched_job is pushed into the entity queue, it may be
 	 * completed and freed up at any time. We can no longer access it.
-	 * Make sure to set the submit_ts first, to avoid a race.
+	 * Make sure to set the deadline_ts first, to avoid a race.
 	 */
-	sched_job->submit_ts = submit_ts = ktime_get();
+	sched_job->deadline_ts = deadline_ts =
+		__drm_sched_entity_get_job_deadline(entity, ktime_get());
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
 	if (first) {
-		submit_ts = __drm_sched_entity_get_job_deadline(entity,
-								submit_ts);
-		sched = drm_sched_rq_add_entity(entity, submit_ts);
+		sched = drm_sched_rq_add_entity(entity, deadline_ts);
 		if (sched)
 			drm_sched_wakeup(sched);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index f50e54bfaccc..3d6e853e87b6 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -28,10 +28,6 @@ void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
 			       struct dma_fence *parent);
 void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
 
-
-ktime_t drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
-					  struct drm_sched_job *job);
-
 /**
  * drm_sched_entity_queue_pop - Low level helper for popping queued jobs
  *
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 4b142a4c89d1..ffec9691d5a7 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -138,7 +138,6 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *next_job;
 	struct drm_sched_rq *rq;
-	ktime_t ts;
 
 	/*
 	 * Update the entity's location in the min heap according to
@@ -148,11 +147,10 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	if (!next_job)
 		return;
 
-	ts = drm_sched_entity_get_job_deadline(entity, next_job);
 	spin_lock(&entity->lock);
 	rq = entity->rq;
 	spin_lock(&rq->lock);
-	drm_sched_rq_update_tree_locked(entity, rq, ts);
+	drm_sched_rq_update_tree_locked(entity, rq, next_job->deadline_ts);
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1e1dd16a0d9a..e0c3d84dd8b1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -331,11 +331,11 @@ struct drm_sched_job {
 	u64				id;
 
 	/**
-	 * @submit_ts:
+	 * @deadline_ts:
 	 *
-	 * When the job was pushed into the entity queue.
+	 * Job deadline set at push time.
 	 */
-	ktime_t                         submit_ts;
+	ktime_t                         deadline_ts;
 
 	/**
 	 * @sched:
-- 
2.48.0

