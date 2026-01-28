Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMheHS7ueWmO1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F69FFC9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30C510E676;
	Wed, 28 Jan 2026 11:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I434Wh0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1291010E667;
 Wed, 28 Jan 2026 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AtOjhuflNYOVtSxg5vCZmr2IiNUD4xEBf1WAkT1I62g=; b=I434Wh0zEkNJljUvzH4YPkdzpC
 6m2aRDz+Pb/D+mNfFBjvXqktD3tU5K4JAc0+2xmFx5ki9yXSAd5+VK9LkxH0CZHbyu5lfqS/97Vq9
 heAabY0LNvAXLbm9Izs1D0aoX3QM1a/Ds+sBdHKzSs/DbLrN8U1UVppMdNHbvnoKXfeBZf1huVj+h
 EXuU21TETwKPPRnVr0gWz+0NqKujuJiw+JXmiUiHpJRIdjuTgNo4a5eNBUFQ10zbwAn044fqaPJh6
 26OvJOoxmxPnPPARINRQIzr8RmY3YE2VPh7F0Z92ckpsLFFAyjhbQty6jWWg5PFsWYdIL480IR8fA
 WJkwruUg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vl3PE-00Aqb9-At; Wed, 28 Jan 2026 12:08:16 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v6 10/31] drm/sched: Account entity GPU time
Date: Wed, 28 Jan 2026 11:07:45 +0000
Message-ID: <20260128110806.38350-11-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-]
X-Rspamd-Queue-Id: 105F69FFC9
X-Rspamd-Action: no action

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

The most convenient place to do that is the free job worker for several
reasons. Doing the accounting from the job completion callback would mean
a few locks would need to become irq safe and we would also need to worry
about out of order completions (via dma_fence_is_signaled calls which we
cannot control). In-order completions are critical for GPU time accuracy
which is currently adjusted per fence in the free worker and requires
looking at the next job in the scheduler pending list. We would also need
to add a new lock to protect the scheduler average stats update.

In contrast to those complications, having the accounting done from the
free worker is serialized by definition and all the above complications
are avoided. Downside is there is potential for a time lag between job
completions and GPU time being accounted against the entity. Since that is
partly alleviated by batch processing the completed job queue, and the
scheduling algorithm does not attempt to be completely fair, which would
even be rather impossible to achieve in the GPU world with the current
DRM scheduler design and hardware with no or poor preemption support,
this downside is not considered critical. Plus, in practice the scheduler
is also affected by worker scheduling delays from other angles too. Not
least being able to promptly feed the GPU with new work.

We therefore choose the simple option and can later consider improving
upon it if the need arises.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 58 ++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_internal.h | 48 ++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c     |  6 ++-
 include/drm/gpu_scheduler.h                | 12 +++++
 4 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 768f11510129..591cb9f82608 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -32,6 +32,58 @@
 
 #include "gpu_scheduler_trace.h"
 
+
+/**
+ * drm_sched_entity_stats_release - Entity stats kref release function
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
+ * drm_sched_entity_stats_new - Allocate a new struct drm_sched_entity_stats object
+ *
+ * Return: Pointer to newly allocated struct drm_sched_entity_stats object.
+ */
+static struct drm_sched_entity_stats *drm_sched_entity_stats_new(void)
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
+/**
+ * drm_sched_entity_stats_job_add_gpu_time - Account job execution time to entity
+ * @job: Scheduler job to account.
+ *
+ * Accounts the execution time of @job to its respective entity stats object.
+ */
+void drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
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
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -65,6 +117,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
+
+	entity->stats = drm_sched_entity_stats_new();
+	if (!entity->stats)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
 	entity->guilty = guilty;
@@ -338,6 +395,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	drm_sched_entity_stats_put(entity->stats);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index b683cf813469..be5d99c641c5 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -3,6 +3,26 @@
 #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
+#include <linux/ktime.h>
+#include <linux/kref.h>
+#include <linux/spinlock.h>
+
+/**
+ * struct drm_sched_entity_stats - execution stats for an entity.
+ * @kref: reference count for the object.
+ * @lock: lock guarding the @runtime updates.
+ * @runtime: time entity spent on the GPU.
+ *
+ * Because jobs and entities have decoupled lifetimes, ie. we cannot access the
+ * entity once the job has been de-queued, and we do need know how much GPU time
+ * each entity has spent, we need to track this in a separate object which is
+ * reference counted by both entities and jobs.
+ */
+struct drm_sched_entity_stats {
+	struct kref	kref;
+	spinlock_t	lock;
+	ktime_t		runtime;
+};
 
 /* Used to choose between FIFO and RR job-scheduling */
 extern int drm_sched_policy;
@@ -95,4 +115,32 @@ drm_sched_entity_is_ready(struct drm_sched_entity *entity)
 	return true;
 }
 
+void drm_sched_entity_stats_release(struct kref *kref);
+
+/**
+ * drm_sched_entity_stats_get - Obtain a reference count on &struct drm_sched_entity_stats object
+ * @stats: struct drm_sched_entity_stats pointer
+ *
+ * Return: struct drm_sched_entity_stats pointer
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
+ * drm_sched_entity_stats_put - Release a reference count on &struct drm_sched_entity_stats object
+ * @stats: struct drm_sched_entity_stats pointer
+ */
+static inline void
+drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
+{
+	kref_put(&stats->kref, drm_sched_entity_stats_release);
+}
+
+void drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job);
+
 #endif
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f825ad9e2260..4c10c7ba6704 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
+	job->entity_stats = drm_sched_entity_stats_get(entity->stats);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
@@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 		 * been called.
 		 */
 		dma_fence_put(&job->s_fence->finished);
+		drm_sched_entity_stats_put(job->entity_stats);
 	} else {
 		/* The job was aborted before it has been committed to be run;
 		 * notably, drm_sched_job_arm() has not been called.
@@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct work_struct *w)
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
index 2b3eaf623f68..bf31c4c58a4c 100644
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
2.52.0

