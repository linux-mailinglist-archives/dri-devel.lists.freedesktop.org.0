Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5DCBE83D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98210E55E;
	Mon, 15 Dec 2025 15:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UoYRvOXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC410E54B;
 Mon, 15 Dec 2025 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xFTsHpUXGE0jir1D0Sn1pYrG2OwnfEWUm+h9//EvkRo=; b=UoYRvOXDT+UmW2c237K5niOVxP
 52RKK55UKaxqqoZ2wENDUq2KanZ7vjs01PUfC3UFbxxt60kMr+3WJDt3FsTkg/yXYI6Ofn7Fp4/0i
 ++bw9+gRnQhlWZ99Cgpc8oI9BTowlM8j+zMH3Qd9QRuqntJ4bObQLy0gGCNx4+T4o1sRjtnZ4toHB
 ElF299Mwgc38Vot534SslFuJmUT/TG3A58nb3yml7BtlQ/79rt6/vqL1nAYAmLE6zSCaDIio8qpS8
 NM9QODcGp0zts2wfhcTB967CZ9Qrm6QzfuymlOicDs79WYVzFS0K3gdO+8qVeZ//FSIUWs0PutssS
 EietYzPw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVABa-00Cz97-7l; Mon, 15 Dec 2025 16:08:30 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.or, intel-xe@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 10/28] drm/sched: Favour interactive clients slightly
Date: Mon, 15 Dec 2025 15:07:49 +0000
Message-ID: <20251215150807.58819-11-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
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

GPUs do not always implement preemption and DRM scheduler definitely
does not support it at the front end scheduling level. This means
execution quanta can be quite long and is controlled by userspace,
consequence of which is picking the "wrong" entity to run can have a
larger negative effect than it would have with a virtual runtime based CPU
scheduler.

Another important consideration is that rendering clients often have
shallow submission queues, meaning they will be entering and exiting the
scheduler's runnable queue often.

Relevant scenario here is what happens when an entity re-joins the
runnable queue with other entities already present. One cornerstone of the
virtual runtime algorithm is to let it re-join at the head and rely on the
virtual runtime accounting and timeslicing to sort it out.

However, as explained above, this may not work perfectly in the GPU world.
Entity could always get to overtake the existing entities, or not,
depending on the submission order and rbtree equal key insertion
behaviour.

Allow interactive jobs to overtake entities already queued up for the
limited case when interactive entity is re-joining the queue after
being idle.

This gives more opportunity for the compositors to have their rendering
executed before the GPU hogs even if they have been configured with the
same scheduling priority.

To classify a client as interactive we look at its average job duration
versus the average for the whole scheduler. We can track this easily by
plugging into the existing job runtime tracking and applying the
exponential moving average window on the past submissions. Then, all other
things being equal, we let the more interactive jobs go first.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c   |  1 +
 drivers/gpu/drm/scheduler/sched_internal.h | 15 ++++++++++++---
 drivers/gpu/drm/scheduler/sched_main.c     |  8 +++++++-
 drivers/gpu/drm/scheduler/sched_rq.c       | 22 ++++++++++++++++++++--
 include/drm/gpu_scheduler.h                |  5 +++++
 5 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index fb53dfb0385a..f6099437f6cc 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -60,6 +60,7 @@ static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)
 
 	kref_init(&stats->kref);
 	spin_lock_init(&stats->lock);
+	ewma_drm_sched_avgtime_init(&stats->avg_job_us);
 
 	return stats;
 }
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 593e380a2d59..5654408d6e40 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -14,6 +14,7 @@
  * @runtime: time entity spent on the GPU.
  * @prev_runtime: previous @runtime used to get the runtime delta.
  * @vruntime: virtual runtime as accumulated by the fair algorithm.
+ * @avg_job_us: average job duration.
  *
  * Because jobs and entities have decoupled lifetimes, ie. we cannot access the
  * entity once the job is completed and we know how much time it took on the
@@ -26,6 +27,8 @@ struct drm_sched_entity_stats {
 	ktime_t		runtime;
 	ktime_t		prev_runtime;
 	ktime_t		vruntime;
+
+	struct ewma_drm_sched_avgtime   avg_job_us;
 };
 
 /* Used to choose between FIFO and RR job-scheduling */
@@ -151,20 +154,26 @@ drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
  * @job: Scheduler job to account.
  *
  * Accounts the execution time of @job to its respective entity stats object.
+ *
+ * Return: Job's real duration in micro seconds.
  */
-static inline void
+static inline ktime_t
 drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
 {
 	struct drm_sched_entity_stats *stats = job->entity_stats;
 	struct drm_sched_fence *s_fence = job->s_fence;
-	ktime_t start, end;
+	ktime_t start, end, duration;
 
 	start = dma_fence_timestamp(&s_fence->scheduled);
 	end = dma_fence_timestamp(&s_fence->finished);
+	duration = ktime_sub(end, start);
 
 	spin_lock(&stats->lock);
-	stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
+	stats->runtime = ktime_add(stats->runtime, duration);
+	ewma_drm_sched_avgtime_add(&stats->avg_job_us, ktime_to_us(duration));
 	spin_unlock(&stats->lock);
+
+	return duration;
 }
 
 #endif
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 294376bd8d77..840262e06c30 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1003,7 +1003,12 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	struct drm_sched_job *job;
 
 	while ((job = drm_sched_get_finished_job(sched))) {
-		drm_sched_entity_stats_job_add_gpu_time(job);
+		ktime_t duration = drm_sched_entity_stats_job_add_gpu_time(job);
+
+		/* Serialized by the worker. */
+		ewma_drm_sched_avgtime_add(&sched->avg_job_us,
+					   ktime_to_us(duration));
+
 		sched->ops->free_job(job);
 	}
 
@@ -1165,6 +1170,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
+	ewma_drm_sched_avgtime_init(&sched->avg_job_us);
 
 	sched->ready = true;
 	return 0;
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 120cf2b7995e..d50748c4844f 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -145,13 +145,21 @@ drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
 				  enum drm_sched_priority rq_prio)
 {
 	struct drm_sched_entity_stats *stats = entity->stats;
+	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	enum drm_sched_priority prio = entity->priority;
+	unsigned long job_avg_us, sched_avg_us;
 	ktime_t vruntime;
 
 	BUILD_BUG_ON(DRM_SCHED_PRIORITY_NORMAL < DRM_SCHED_PRIORITY_HIGH);
 
 	spin_lock(&stats->lock);
 	vruntime = stats->vruntime;
+	job_avg_us = ewma_drm_sched_avgtime_read(&stats->avg_job_us);
+	/*
+	 * Unlocked read of the scheduler average is fine since it is just
+	 * heuristics and data type is a natural word size.
+	 */
+	sched_avg_us = ewma_drm_sched_avgtime_read(&sched->avg_job_us);
 
 	/*
 	 * Special handling for entities which were picked from the top of the
@@ -161,14 +169,24 @@ drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
 		if (prio > rq_prio) {
 			/*
 			 * Lower priority should not overtake higher when re-
-			 * joining at the top of the queue.
+			 * joining at the top of the queue so push it back
+			 * somewhere behind the "middle" of the run-queue
+			 * proportional to the priority difference and its
+			 * average job duration.
 			 */
-			vruntime = ns_to_ktime(prio - rq_prio);
+			vruntime = us_to_ktime((1 + prio - rq_prio) *
+					       job_avg_us + sched_avg_us + 1);
 		} else if (prio < rq_prio) {
 			/*
 			 * Higher priority can go first.
 			 */
 			vruntime = -ns_to_ktime(rq_prio - prio);
+		} else {
+			/* Favour entity with shorter jobs (interactivity). */
+			if (job_avg_us <= sched_avg_us)
+				vruntime = -ns_to_ktime(1);
+			else
+				vruntime = ns_to_ktime(1);
 		}
 	}
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index dd514a413156..826de4cbbf2d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -25,11 +25,14 @@
 #define _DRM_GPU_SCHEDULER_H_
 
 #include <drm/spsc_queue.h>
+#include <linux/average.h>
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
 #include <linux/xarray.h>
 #include <linux/workqueue.h>
 
+DECLARE_EWMA(drm_sched_avgtime, 6, 4);
+
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
 /**
@@ -582,6 +585,7 @@ struct drm_sched_backend_ops {
  * @job_id_count: used to assign unique id to the each job.
  * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
+ * @avg_job_us: Average job duration.
  * @work_run_job: work which calls run_job op of each scheduler.
  * @work_free_job: work which calls free_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
@@ -613,6 +617,7 @@ struct drm_gpu_scheduler {
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
+	struct ewma_drm_sched_avgtime   avg_job_us;
 	struct work_struct		work_run_job;
 	struct work_struct		work_free_job;
 	struct delayed_work		work_tdr;
-- 
2.51.1

