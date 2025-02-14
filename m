Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87AA35B5B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1910EC3C;
	Fri, 14 Feb 2025 10:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JFP0x9on";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A23A10E2C3;
 Fri, 14 Feb 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ta062PnMEQPks2Bpjq17Rkk7jVNd3KyjBjiB3j8oxrU=; b=JFP0x9ongp1gviiyem4FY7r7j1
 JwJ/lxOzC+n+EElcv8awwnsNK32xjEB5crf5Dd+OhNROiog4scGVReZWkqSPmZkK2yxLfYNoCenN8
 eruCxzIOhjIoDkpcnZBuuBvLJ5euwc1c5bCz0seIgrcfdPimbHzJ9a+xvMunJJqhjPnv3ZHNQpwyL
 SMyuIP5UULjAEfsr9zEQhUoZ5F0A77lTpUlGkp/dkk6yb1VVU7izxNT/EUDL+xXBf0lxQSqi2CJpA
 Yzd/uCEZMt0qSX5U4z8RvMytDWIqUve+4r37CYWAlvvjc41eEcUjLNBa4Qoy0v0rTScJYG7AxbL8x
 IOps0vQg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnR-00HYkz-Mx; Fri, 14 Feb 2025 11:19:51 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 1/6] drm/sched: Add internal job peek/pop API
Date: Fri, 14 Feb 2025 10:19:39 +0000
Message-ID: <20250214101944.19390-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

Idea is to add helpers for peeking and popping jobs from entities with
the goal of decoupling the hidden assumption in the code that queue_node
is the first element in struct drm_sched_job.

That assumption usually comes in the form of:

  while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue))))

Which breaks if the queue_node is re-positioned due to_drm_sched_job
being implemented with a container_of.

This also allows us to remove duplicate definitions of to_drm_sched_job.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 11 +++---
 drivers/gpu/drm/scheduler/sched_internal.h | 46 ++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c     |  7 ++--
 3 files changed, 54 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..a171f05ad761 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -28,11 +28,10 @@
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 
+#include "sched_internal.h"
+
 #include "gpu_scheduler_trace.h"
 
-#define to_drm_sched_job(sched_job)		\
-		container_of((sched_job), struct drm_sched_job, queue_node)
-
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	/* The entity is guaranteed to not be used by the scheduler */
 	prev = rcu_dereference_check(entity->last_scheduled, true);
 	dma_fence_get(prev);
-	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
+	while ((job = drm_sched_entity_queue_pop(entity))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		dma_fence_get(&s_fence->finished);
@@ -477,7 +476,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *sched_job;
 
-	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+	sched_job = drm_sched_entity_queue_peek(entity);
 	if (!sched_job)
 		return NULL;
 
@@ -513,7 +512,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
-		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+		next = drm_sched_entity_queue_peek(entity);
 		if (next) {
 			struct drm_sched_rq *rq;
 
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
new file mode 100644
index 000000000000..815d384845a3
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -0,0 +1,46 @@
+#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
+#define _DRM_GPU_SCHEDULER_INTERNAL_H_
+
+/**
+ * drm_sched_entity_queue_pop - Low level helper for popping queued jobs
+ *
+ * @entity: scheduler entity
+ *
+ * Low level helper for popping queued jobs.
+ *
+ * Returns: The job dequeued or NULL.
+ */
+static inline struct drm_sched_job *
+drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
+{
+	struct spsc_node *node;
+
+	node = spsc_queue_pop(&entity->job_queue);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct drm_sched_job, queue_node);
+}
+
+/**
+ * drm_sched_entity_queue_peek - Low level helper for peeking at the job queue
+ *
+ * @entity: scheduler entity
+ *
+ * Low level helper for peeking at the job queue
+ *
+ * Returns: The job at the head of the queue or NULL.
+ */
+static inline struct drm_sched_job *
+drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
+{
+	struct spsc_node *node;
+
+	node = spsc_queue_peek(&entity->job_queue);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct drm_sched_job, queue_node);
+}
+
+#endif
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8c36a59afb72..c634993f1346 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -78,6 +78,8 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
 
+#include "sched_internal.h"
+
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
@@ -87,9 +89,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
 };
 #endif
 
-#define to_drm_sched_job(sched_job)		\
-		container_of((sched_job), struct drm_sched_job, queue_node)
-
 int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
@@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 {
 	struct drm_sched_job *s_job;
 
-	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+	s_job = drm_sched_entity_queue_peek(entity);
 	if (!s_job)
 		return false;
 
-- 
2.48.0

