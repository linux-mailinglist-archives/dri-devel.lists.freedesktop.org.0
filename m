Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B986B42510
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86B810E8C8;
	Wed,  3 Sep 2025 15:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YO56WrXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C464F10E8BD;
 Wed,  3 Sep 2025 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HTmORYBvquJJVI327T7atd3PscMKGIYR0DQBivt8+bU=; b=YO56WrXwzMyVPX04AZ0KDhwTAx
 gAsRQXzGLpVD9/LdC7Eju3A2c88DT7byO7NUrAzjd20Z1rWIA+zihL4+it7hWjnXl/dY0wo5NwrRd
 K+NzoRugjCjqiY/b1qXvimzBo7CxPMJ/R/9n4cJyiuCfTHcx7qE8vBPAgxOFcDSmjKSpcU1rWGRlf
 kd9/i2igmSESoZ19M6UEh3pJwtQXjOac13aqVuq9DONigSyuZbIEIXvLJKW8nzzadrwGLsGG1WhfR
 1ssmQ8P3SXa+WlvS738vVBEkBjQgDfk22Kb/eHprKGYtCphC7Kq4/L9IJ8yXLI3an0n2xclZSGAE8
 b5ueZluA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKg-006GYg-Pb; Wed, 03 Sep 2025 17:23:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 05/21] drm/sched: Move run queue related code into a separate
 file
Date: Wed,  3 Sep 2025 16:23:11 +0100
Message-ID: <20250903152327.66002-6-tvrtko.ursulin@igalia.com>
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

Lets move all the code dealing with struct drm_sched_rq into a separate
compilation unit. Advantage being sched_main.c is left with a clearer set
of responsibilities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/Makefile         |   2 +-
 drivers/gpu/drm/scheduler/sched_internal.h |   7 +
 drivers/gpu/drm/scheduler/sched_main.c     | 218 +-------------------
 drivers/gpu/drm/scheduler/sched_rq.c       | 222 +++++++++++++++++++++
 4 files changed, 232 insertions(+), 217 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c

diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
index 6e13e4c63e9d..74e75eff6df5 100644
--- a/drivers/gpu/drm/scheduler/Makefile
+++ b/drivers/gpu/drm/scheduler/Makefile
@@ -20,7 +20,7 @@
 # OTHER DEALINGS IN THE SOFTWARE.
 #
 #
-gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
+gpu-sched-y := sched_main.o sched_fence.o sched_entity.o sched_rq.o
 
 obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
 
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 8269c5392a82..703ee48fbc58 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -10,8 +10,15 @@ extern int drm_sched_policy;
 #define DRM_SCHED_POLICY_RR    0
 #define DRM_SCHED_POLICY_FIFO  1
 
+bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
+			 struct drm_sched_entity *entity);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
+		       struct drm_sched_rq *rq);
+struct drm_sched_entity *
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
+			   struct drm_sched_rq *rq);
 struct drm_gpu_scheduler *
 drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c53931e63458..97bec2f86502 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -112,8 +112,8 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
  * Return true if we can push at least one more job from @entity, false
  * otherwise.
  */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-				struct drm_sched_entity *entity)
+bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
+			 struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *s_job;
 
@@ -133,220 +133,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 	return drm_sched_available_credits(sched) >= s_job->credits;
 }
 
-static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
-							    const struct rb_node *b)
-{
-	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
-	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
-
-	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
-}
-
-static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
-					    struct drm_sched_rq *rq)
-{
-	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
-		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
-		RB_CLEAR_NODE(&entity->rb_tree_node);
-	}
-}
-
-static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-					    struct drm_sched_rq *rq,
-					    ktime_t ts)
-{
-	/*
-	 * Both locks need to be grabbed, one to protect from entity->rq change
-	 * for entity from within concurrent drm_sched_entity_select_rq and the
-	 * other to update the rb tree structure.
-	 */
-	lockdep_assert_held(&entity->lock);
-	lockdep_assert_held(&rq->lock);
-
-	drm_sched_rq_remove_fifo_locked(entity, rq);
-
-	entity->oldest_job_waiting = ts;
-
-	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
-		      drm_sched_entity_compare_before);
-}
-
-/**
- * drm_sched_rq_init - initialize a given run queue struct
- *
- * @sched: scheduler instance to associate with this run queue
- * @rq: scheduler run queue
- *
- * Initializes a scheduler runqueue.
- */
-static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
-			      struct drm_sched_rq *rq)
-{
-	spin_lock_init(&rq->lock);
-	INIT_LIST_HEAD(&rq->entities);
-	rq->rb_tree_root = RB_ROOT_CACHED;
-	rq->sched = sched;
-}
-
-/**
- * drm_sched_rq_add_entity - add an entity
- *
- * @entity: scheduler entity
- * @ts: submission timestamp
- *
- * Adds a scheduler entity to the run queue.
- *
- * Returns a DRM scheduler pre-selected to handle this entity.
- */
-struct drm_gpu_scheduler *
-drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
-{
-	struct drm_gpu_scheduler *sched;
-	struct drm_sched_rq *rq;
-
-	/* Add the entity to the run queue */
-	spin_lock(&entity->lock);
-	if (entity->stopped) {
-		spin_unlock(&entity->lock);
-
-		DRM_ERROR("Trying to push to a killed entity\n");
-		return NULL;
-	}
-
-	rq = entity->rq;
-	spin_lock(&rq->lock);
-	sched = rq->sched;
-
-	if (list_empty(&entity->list)) {
-		atomic_inc(sched->score);
-		list_add_tail(&entity->list, &rq->entities);
-	}
-
-	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
-		ts = entity->rr_ts;
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
-
-	spin_unlock(&rq->lock);
-	spin_unlock(&entity->lock);
-
-	return sched;
-}
-
-/**
- * drm_sched_rq_remove_entity - remove an entity
- *
- * @rq: scheduler run queue
- * @entity: scheduler entity
- *
- * Removes a scheduler entity from the run queue.
- */
-void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
-				struct drm_sched_entity *entity)
-{
-	lockdep_assert_held(&entity->lock);
-
-	if (list_empty(&entity->list))
-		return;
-
-	spin_lock(&rq->lock);
-
-	atomic_dec(rq->sched->score);
-	list_del_init(&entity->list);
-
-	drm_sched_rq_remove_fifo_locked(entity, rq);
-
-	spin_unlock(&rq->lock);
-}
-
-static ktime_t
-drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
-{
-	ktime_t ts;
-
-	lockdep_assert_held(&entity->lock);
-	lockdep_assert_held(&rq->lock);
-
-	ts = ktime_add_ns(rq->rr_ts, 1);
-	entity->rr_ts = ts;
-	rq->rr_ts = ts;
-
-	return ts;
-}
-
-/**
- * drm_sched_rq_pop_entity - pops an entity
- *
- * @entity: scheduler entity
- *
- * To be called every time after a job is popped from the entity.
- */
-void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
-{
-	struct drm_sched_job *next_job;
-	struct drm_sched_rq *rq;
-	ktime_t ts;
-
-	/*
-	 * Update the entity's location in the min heap according to
-	 * the timestamp of the next job, if any.
-	 */
-	next_job = drm_sched_entity_queue_peek(entity);
-	if (!next_job)
-		return;
-
-	spin_lock(&entity->lock);
-	rq = entity->rq;
-	spin_lock(&rq->lock);
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		ts = next_job->submit_ts;
-	else
-		ts = drm_sched_rq_get_rr_ts(rq, entity);
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
-	spin_unlock(&rq->lock);
-	spin_unlock(&entity->lock);
-}
-
-/**
- * drm_sched_rq_select_entity - Select an entity which provides a job to run
- *
- * @sched: the gpu scheduler
- * @rq: scheduler run queue to check.
- *
- * Find oldest waiting ready entity.
- *
- * Return an entity if one is found; return an error-pointer (!NULL) if an
- * entity was ready, but the scheduler had insufficient credits to accommodate
- * its job; return NULL, if no ready entity was found.
- */
-static struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
-			   struct drm_sched_rq *rq)
-{
-	struct rb_node *rb;
-
-	spin_lock(&rq->lock);
-	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
-		struct drm_sched_entity *entity;
-
-		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
-		if (drm_sched_entity_is_ready(entity)) {
-			/* If we can't queue yet, preserve the current entity in
-			 * terms of fairness.
-			 */
-			if (!drm_sched_can_queue(sched, entity)) {
-				spin_unlock(&rq->lock);
-				return ERR_PTR(-ENOSPC);
-			}
-
-			reinit_completion(&entity->entity_idle);
-			break;
-		}
-	}
-	spin_unlock(&rq->lock);
-
-	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
-}
-
 /**
  * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
new file mode 100644
index 000000000000..16d57461765e
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -0,0 +1,222 @@
+#include <linux/rbtree.h>
+
+#include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
+
+#include "sched_internal.h"
+
+static __always_inline bool
+drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
+{
+	struct drm_sched_entity *ea =
+		rb_entry((a), struct drm_sched_entity, rb_tree_node);
+	struct drm_sched_entity *eb =
+		rb_entry((b), struct drm_sched_entity, rb_tree_node);
+
+	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
+}
+
+static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+					    struct drm_sched_rq *rq)
+{
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
+		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
+		RB_CLEAR_NODE(&entity->rb_tree_node);
+	}
+}
+
+static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+					    struct drm_sched_rq *rq,
+					    ktime_t ts)
+{
+	/*
+	 * Both locks need to be grabbed, one to protect from entity->rq change
+	 * for entity from within concurrent drm_sched_entity_select_rq and the
+	 * other to update the rb tree structure.
+	 */
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
+	drm_sched_rq_remove_fifo_locked(entity, rq);
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
+		      drm_sched_entity_compare_before);
+}
+
+/**
+ * drm_sched_rq_init - initialize a given run queue struct
+ *
+ * @sched: scheduler instance to associate with this run queue
+ * @rq: scheduler run queue
+ *
+ * Initializes a scheduler runqueue.
+ */
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
+		       struct drm_sched_rq *rq)
+{
+	spin_lock_init(&rq->lock);
+	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
+	rq->sched = sched;
+}
+
+/**
+ * drm_sched_rq_add_entity - add an entity
+ *
+ * @entity: scheduler entity
+ * @ts: submission timestamp
+ *
+ * Adds a scheduler entity to the run queue.
+ *
+ * Returns a DRM scheduler pre-selected to handle this entity.
+ */
+struct drm_gpu_scheduler *
+drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
+{
+	struct drm_gpu_scheduler *sched;
+	struct drm_sched_rq *rq;
+
+	/* Add the entity to the run queue */
+	spin_lock(&entity->lock);
+	if (entity->stopped) {
+		spin_unlock(&entity->lock);
+
+		DRM_ERROR("Trying to push to a killed entity\n");
+		return NULL;
+	}
+
+	rq = entity->rq;
+	spin_lock(&rq->lock);
+	sched = rq->sched;
+
+	if (list_empty(&entity->list)) {
+		atomic_inc(sched->score);
+		list_add_tail(&entity->list, &rq->entities);
+	}
+
+	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+		ts = entity->rr_ts;
+	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+
+	return sched;
+}
+
+/**
+ * drm_sched_rq_remove_entity - remove an entity
+ *
+ * @rq: scheduler run queue
+ * @entity: scheduler entity
+ *
+ * Removes a scheduler entity from the run queue.
+ */
+void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
+				struct drm_sched_entity *entity)
+{
+	lockdep_assert_held(&entity->lock);
+
+	if (list_empty(&entity->list))
+		return;
+
+	spin_lock(&rq->lock);
+
+	atomic_dec(rq->sched->score);
+	list_del_init(&entity->list);
+
+	drm_sched_rq_remove_fifo_locked(entity, rq);
+
+	spin_unlock(&rq->lock);
+}
+
+static ktime_t
+drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
+{
+	ktime_t ts;
+
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
+	ts = ktime_add_ns(rq->rr_ts, 1);
+	entity->rr_ts = ts;
+	rq->rr_ts = ts;
+
+	return ts;
+}
+
+/**
+ * drm_sched_rq_pop_entity - pops an entity
+ *
+ * @entity: scheduler entity
+ *
+ * To be called every time after a job is popped from the entity.
+ */
+void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *next_job;
+	struct drm_sched_rq *rq;
+	ktime_t ts;
+
+	/*
+	 * Update the entity's location in the min heap according to
+	 * the timestamp of the next job, if any.
+	 */
+	next_job = drm_sched_entity_queue_peek(entity);
+	if (!next_job)
+		return;
+
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		ts = next_job->submit_ts;
+	else
+		ts = drm_sched_rq_get_rr_ts(rq, entity);
+	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+}
+
+/**
+ * drm_sched_rq_select_entity - Select an entity which provides a job to run
+ *
+ * @sched: the gpu scheduler
+ * @rq: scheduler run queue to check.
+ *
+ * Find oldest waiting ready entity.
+ *
+ * Return an entity if one is found; return an error-pointer (!NULL) if an
+ * entity was ready, but the scheduler had insufficient credits to accommodate
+ * its job; return NULL, if no ready entity was found.
+ */
+struct drm_sched_entity *
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
+			   struct drm_sched_rq *rq)
+{
+	struct rb_node *rb;
+
+	spin_lock(&rq->lock);
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		struct drm_sched_entity *entity;
+
+		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
+		if (drm_sched_entity_is_ready(entity)) {
+			/* If we can't queue yet, preserve the current entity in
+			 * terms of fairness.
+			 */
+			if (!drm_sched_can_queue(sched, entity)) {
+				spin_unlock(&rq->lock);
+				return ERR_PTR(-ENOSPC);
+			}
+
+			reinit_completion(&entity->entity_idle);
+			break;
+		}
+	}
+	spin_unlock(&rq->lock);
+
+	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
+}
-- 
2.48.0

