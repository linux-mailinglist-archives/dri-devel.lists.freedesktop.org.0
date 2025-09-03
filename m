Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBAB42519
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918BD10E8D8;
	Wed,  3 Sep 2025 15:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gC76aenj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8E710E8C8;
 Wed,  3 Sep 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uYpClv4VRv1fHm45+MDalJAA1V7De4/iS3rlg6fEqnI=; b=gC76aenj+IP4C7D/fq7k9ihtn5
 xM88sqEL0SMYWU96PLikC02gGOe/Qe6YK7mI/6Ucgj8jUWzJQxvDl7CBGhvl12EKFGDspF2dxoU9j
 BzbebNOE3TpVLboT/Ikq2D0dMuXuryoJjJky2DE5yijWt/eoyd4qo6CTHY0qcfmUlWwU/Rooeh2zO
 a9gBLBld8X0+RsGFIdQC4r4LtuITun88A7OeX0Sguoi+MEYPv6Dz1ne2MCGARWqION06LXwZsrYXt
 hNB94WFniVR/S/mfM38UiuVmhLTl3hWc8u9OhraPb4aenJPe/5qUrvf4XzRwc/I0N4ZJFsXW0ztDU
 sixHEFxQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKi-006GYx-81; Wed, 03 Sep 2025 17:23:36 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 07/21] drm/sched: Account entity GPU time
Date: Wed,  3 Sep 2025 16:23:13 +0100
Message-ID: <20250903152327.66002-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
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
index 7a0a52ba87bf..04ce8b7d436b 100644
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
index 9411676e772a..a5d7706efbea 100644
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

