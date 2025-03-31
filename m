Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A762AA76EF7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6282310E491;
	Mon, 31 Mar 2025 20:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G7wJgAis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0FD10E488;
 Mon, 31 Mar 2025 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zSNbGTHH3Kvgrr0UORoi7GrbvCIFv9WqOPNOV9ZcuGU=; b=G7wJgAisfJyxD+uSGD6JhkDWh7
 F5epjMdQ5BN7cnpvj80ZdxWy6yms2T/Ifr8IB1hXuMRPotpb1tVwXARM6u6QquEXMmp/Jis0OvKLL
 jRrs7UIT2bkzq9g4uIzuxCbUpkUrD4o2067r9jKN9dTU8tD2VpjBwXOsXK0/degeD4sNZEGK1BmxT
 3dqwfuRoJnjbCP/4TksQzL2o9aPwcni4tugCQYBxdsO0XOx7/ftw4ixMk5fgdIJB1WpXdS8O5PodE
 4zE1Cdmm7TDoaUS3tzjB1lTYpq5kaYmKA3JauN25rwJNFeQwW3GvDWsublObDfzy2ct3BSC9Fmgof
 SfzFN5IQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZb-009M3f-Vk; Mon, 31 Mar 2025 22:17:32 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 08/14] drm/sched: Move run queue related code into a separate
 file
Date: Mon, 31 Mar 2025 21:16:59 +0100
Message-ID: <20250331201705.60663-9-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/scheduler/sched_main.c     | 213 +-------------------
 drivers/gpu/drm/scheduler/sched_rq.c       | 217 +++++++++++++++++++++
 4 files changed, 227 insertions(+), 212 deletions(-)
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
index 8e7e477bace3..ee13a986b920 100644
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
index 8736c7cd3ddd..f9c82db69300 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -117,8 +117,8 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
  * Return true if we can push at least one more job from @entity, false
  * otherwise.
  */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-				struct drm_sched_entity *entity)
+bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
+			 struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *s_job;
 
@@ -138,215 +138,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
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
-	lockdep_assert_held(&entity->lock);
-	lockdep_assert_held(&rq->lock);
-
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
-static ktime_t
-drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
-{
-	lockdep_assert_held(&rq->lock);
-
-	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
-
-	return rq->rr_deadline;
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
-		ts = drm_sched_rq_get_rr_deadline(rq);
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
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		ts = next_job->submit_ts;
-	else
-		ts = drm_sched_rq_get_rr_deadline(rq);
-
-	spin_lock(&entity->lock);
-	rq = entity->rq;
-	spin_lock(&rq->lock);
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
-	struct drm_sched_entity *entity = NULL;
-	struct rb_node *rb;
-
-	spin_lock(&rq->lock);
-	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
-		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
-		if (drm_sched_entity_is_ready(entity))
-			break;
-		else
-			entity = NULL;
-	}
-	spin_unlock(&rq->lock);
-
-	if (!entity)
-		return NULL;
-
-	/*
-	 * If scheduler cannot take more jobs signal the caller to not consider
-	 * lower priority queues.
-	 */
-	if (!drm_sched_can_queue(sched, entity))
-		return ERR_PTR(-ENOSPC);
-
-	reinit_completion(&entity->entity_idle);
-
-	return entity;
-}
-
 /**
  * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
new file mode 100644
index 000000000000..a3104a4e5da7
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -0,0 +1,217 @@
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
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
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
+static ktime_t
+drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
+{
+	lockdep_assert_held(&rq->lock);
+
+	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
+
+	return rq->rr_deadline;
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
+		ts = drm_sched_rq_get_rr_deadline(rq);
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
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		ts = next_job->submit_ts;
+	else
+		ts = drm_sched_rq_get_rr_deadline(rq);
+
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
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
+	struct drm_sched_entity *entity = NULL;
+	struct rb_node *rb;
+
+	spin_lock(&rq->lock);
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
+		if (drm_sched_entity_is_ready(entity))
+			break;
+		else
+			entity = NULL;
+	}
+	spin_unlock(&rq->lock);
+
+	if (!entity)
+		return NULL;
+
+	/*
+	 * If scheduler cannot take more jobs signal the caller to not consider
+	 * lower priority queues.
+	 */
+	if (!drm_sched_can_queue(sched, entity))
+		return ERR_PTR(-ENOSPC);
+
+	reinit_completion(&entity->entity_idle);
+
+	return entity;
+}
-- 
2.48.0

