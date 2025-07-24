Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94AB10D25
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7B010E990;
	Thu, 24 Jul 2025 14:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AwoTA1zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF8E10E987;
 Thu, 24 Jul 2025 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a7LInpjd7LKvd30DcI7R6kjuEFimIxJGjRKTfp5r3Is=; b=AwoTA1zi/AT2LzJZeOSwiZtVox
 XaN6NkSn2CubAGa/vWP5TgV3+mGgmVgyCf7i3SJB2FwMwrAy+cFPBYGTHZbtvfmN+6EsCRcm10BHJ
 wFNhOW7y9Ag1bS98zTET/Ju3wy5oKy692akeb853HBFHokzXV4H5RWVA7zNlDgEWu09vucLyzEboB
 RZfxLwY6C5fQ+D+kdRH7thKqSLg7RSUtLMq4jPseshPWqlDLVU8Duiq4+wNQJzCVypZznmx7zXcxK
 3ELHnLQ77+U/wsSo8pDz7uv1Lfb6CFztHkE8lY+ZzoXtSuTsaxYCeJl/TfLcHCZ+3U4BPUSK65nNP
 rB4GAe3Q==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uewnA-003DsC-OR; Thu, 24 Jul 2025 16:19:28 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v7 07/12] drm/sched: Account entity GPU time
Date: Thu, 24 Jul 2025 15:19:16 +0100
Message-ID: <20250724141921.75583-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
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

To implement fair scheduling we need a view into the GPU time consumed by
entities. Problem we have is that jobs and entities objects have decoupled
lifetimes, where at the point we have a view into accurate GPU time, we
cannot link back to the entity any longer.

Solve this by adding a light weight entity stats object which is reference
counted by both entity and the job and hence can safely be used from
either side.

With that, the only other thing we need is to add a helper for adding the
job's GPU time into the respective entity stats object, and call it once
the accurate GPU time has been calculated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 39 +++++++++++++
 drivers/gpu/drm/scheduler/sched_internal.h | 66 ++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c     |  6 +-
 include/drm/gpu_scheduler.h                | 12 ++++
 4 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c42ba7ed16ac..75f24b9db5f2 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -32,6 +32,39 @@
 
 #include "gpu_scheduler_trace.h"
 
+
+/**
+ * drm_sched_entity_stats_release - Entity stats kref release function
+ *
+ * @kref: Entity stats embedded kref pointer
+ */
+void drm_sched_entity_stats_release(struct kref *kref)
+{
+	struct drm_sched_entity_stats *stats =
+		container_of(kref, typeof(*stats), kref);
+
+	kfree(stats);
+}
+
+/**
+ * drm_sched_entity_stats_alloc - Allocate a new struct drm_sched_entity_stats object
+ *
+ * Returns: Pointer to newly allocated struct drm_sched_entity_stats object.
+ */
+static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)
+{
+	struct drm_sched_entity_stats *stats;
+
+	stats = kzalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats)
+		return NULL;
+
+	kref_init(&stats->kref);
+	spin_lock_init(&stats->lock);
+
+	return stats;
+}
+
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -65,6 +98,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
+
+	entity->stats = drm_sched_entity_stats_alloc();
+	if (!entity->stats)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
 	entity->guilty = guilty;
@@ -338,6 +376,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	drm_sched_entity_stats_put(entity->stats);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 703ee48fbc58..27c8460a3601 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -3,6 +3,22 @@
 #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
+#include <linux/ktime.h>
+#include <linux/kref.h>
+#include <linux/spinlock.h>
+
+/**
+ * struct drm_sched_entity_stats - execution stats for an entity.
+ *
+ * @kref: reference count for the object.
+ * @lock: lock guarding the @runtime updates.
+ * @runtime: time entity spent on the GPU.
+ */
+struct drm_sched_entity_stats {
+	struct kref	kref;
+	spinlock_t	lock;
+	ktime_t		runtime;
+};
 
 /* Used to choose between FIFO and RR job-scheduling */
 extern int drm_sched_policy;
@@ -93,4 +109,54 @@ drm_sched_entity_is_ready(struct drm_sched_entity *entity)
 	return true;
 }
 
+void drm_sched_entity_stats_release(struct kref *kref);
+
+/**
+ * drm_sched_entity_stats_get - Obtain a reference count on struct drm_sched_entity_stats object
+ *
+ * @stats: struct drm_sched_entity_stats pointer
+ *
+ * Returns: struct drm_sched_entity_stats pointer
+ */
+static inline struct drm_sched_entity_stats *
+drm_sched_entity_stats_get(struct drm_sched_entity_stats *stats)
+{
+	kref_get(&stats->kref);
+
+	return stats;
+}
+
+/**
+ * drm_sched_entity_stats_put - Release a reference count on struct drm_sched_entity_stats object
+ *
+ * @stats: struct drm_sched_entity_stats pointer
+ */
+static inline void
+drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
+{
+	kref_put(&stats->kref, drm_sched_entity_stats_release);
+}
+
+/**
+ * drm_sched_entity_stats_job_add_gpu_time - Account job execution time to entity
+ *
+ * @job: Scheduler job to account.
+ *
+ * Accounts the execution time of @job to its respective entity stats object.
+ */
+static inline void
+drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
+{
+	struct drm_sched_entity_stats *stats = job->entity_stats;
+	struct drm_sched_fence *s_fence = job->s_fence;
+	ktime_t start, end;
+
+	start = dma_fence_timestamp(&s_fence->scheduled);
+	end = dma_fence_timestamp(&s_fence->finished);
+
+	spin_lock(&stats->lock);
+	stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
+	spin_unlock(&stats->lock);
+}
+
 #endif
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 70d0ca2e77a4..bb210ef3986d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -658,6 +658,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
+	job->entity_stats = drm_sched_entity_stats_get(entity->stats);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
@@ -846,6 +847,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 		 * been called.
 		 */
 		dma_fence_put(&job->s_fence->finished);
+		drm_sched_entity_stats_put(job->entity_stats);
 	} else {
 		/* The job was aborted before it has been committed to be run;
 		 * notably, drm_sched_job_arm() has not been called.
@@ -997,8 +999,10 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
 	struct drm_sched_job *job;
 
-	while ((job = drm_sched_get_finished_job(sched)))
+	while ((job = drm_sched_get_finished_job(sched))) {
+		drm_sched_entity_stats_job_add_gpu_time(job);
 		sched->ops->free_job(job);
+	}
 
 	drm_sched_run_job_queue(sched);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 802a0060db55..f33c78473867 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -71,6 +71,8 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_COUNT
 };
 
+struct drm_sched_entity_stats;
+
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -110,6 +112,11 @@ struct drm_sched_entity {
 	 */
 	struct drm_sched_rq		*rq;
 
+	/**
+	 * @stats: Stats object reference held by the entity and jobs.
+	 */
+	struct drm_sched_entity_stats	*stats;
+
 	/**
 	 * @sched_list:
 	 *
@@ -365,6 +372,11 @@ struct drm_sched_job {
 	struct drm_sched_fence		*s_fence;
 	struct drm_sched_entity         *entity;
 
+	/**
+	 * @entity_stats: Stats object reference held by the job and entity.
+	 */
+	struct drm_sched_entity_stats	*entity_stats;
+
 	enum drm_sched_priority		s_priority;
 	u32				credits;
 	/** @last_dependency: tracks @dependencies as they signal */
-- 
2.48.0

