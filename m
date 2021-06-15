Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C578A3A8BD4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB06E479;
	Tue, 15 Jun 2021 22:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA9A6E432;
 Tue, 15 Jun 2021 22:26:09 +0000 (UTC)
IronPort-SDR: JfHfWmEbaUdXshx31Cpm1U1DURm+nORH+dSlIpq0WeleV2spwPEbfMcxZsj3rDgRilks6RL+qV
 RPCMvkxxifEg==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="186453781"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="186453781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 15:26:08 -0700
IronPort-SDR: huuFSSvphzn4NLk/66r3U80NUlhb4WCIhu5D8pHDlJb4X3ZtI+qjRfdlDctdf/bvbhxXPl39g/
 HlWkXCkLwwXw==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="553827682"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 15:26:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/i915: Update i915_scheduler to operate on
 i915_sched_engine
Date: Tue, 15 Jun 2021 15:43:57 -0700
Message-Id: <20210615224358.83627-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210615224358.83627-1-matthew.brost@intel.com>
References: <20210615224358.83627-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather passing around an intel_engine_cs in the scheduling code, pass
around a i915_sched_engine.

v3:
 (Jason Ekstrand)
  Add READ_ONCE around rq->engine in lock_sched_engine

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 11 +++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 drivers/gpu/drm/i915/i915_scheduler.c         | 46 +++++++++----------
 drivers/gpu/drm/i915/i915_scheduler.h         |  2 +-
 4 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9487d9e0be62..ffad4d98cec0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -382,7 +382,8 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 		GEM_BUG_ON(rq_prio(rq) == I915_PRIORITY_INVALID);
 		if (rq_prio(rq) != prio) {
 			prio = rq_prio(rq);
-			pl = i915_sched_lookup_priolist(engine, prio);
+			pl = i915_sched_lookup_priolist(engine->sched_engine,
+							prio);
 		}
 		GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 
@@ -1096,7 +1097,8 @@ static void defer_active(struct intel_engine_cs *engine)
 	if (!rq)
 		return;
 
-	defer_request(rq, i915_sched_lookup_priolist(engine, rq_prio(rq)));
+	defer_request(rq, i915_sched_lookup_priolist(engine->sched_engine,
+						     rq_prio(rq)));
 }
 
 static bool
@@ -2083,7 +2085,7 @@ static void __execlists_unhold(struct i915_request *rq)
 
 		i915_request_clear_hold(rq);
 		list_move_tail(&rq->sched.link,
-			       i915_sched_lookup_priolist(rq->engine,
+			       i915_sched_lookup_priolist(rq->engine->sched_engine,
 							  rq_prio(rq)));
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 
@@ -2452,7 +2454,8 @@ static void queue_request(struct intel_engine_cs *engine,
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
-		      i915_sched_lookup_priolist(engine, rq_prio(rq)));
+		      i915_sched_lookup_priolist(engine->sched_engine,
+						 rq_prio(rq)));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 60121809e6e2..cb13cc586c67 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -503,7 +503,7 @@ static inline void queue_request(struct intel_engine_cs *engine,
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
-		      i915_sched_lookup_priolist(engine, prio));
+		      i915_sched_lookup_priolist(engine->sched_engine, prio));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 035b88f2e4aa..fa8863df9513 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -61,14 +61,13 @@ static void assert_priolists(struct i915_sched_engine * const sched_engine)
 }
 
 struct list_head *
-i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
+i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio)
 {
-	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct i915_priolist *p;
 	struct rb_node **parent, *rb;
 	bool first = true;
 
-	lockdep_assert_held(&engine->sched_engine->lock);
+	lockdep_assert_held(&sched_engine->lock);
 	assert_priolists(sched_engine);
 
 	if (unlikely(sched_engine->no_priolist))
@@ -130,13 +129,13 @@ struct sched_cache {
 	struct list_head *priolist;
 };
 
-static struct intel_engine_cs *
-sched_lock_engine(const struct i915_sched_node *node,
-		  struct intel_engine_cs *locked,
+static struct i915_sched_engine *
+lock_sched_engine(struct i915_sched_node *node,
+		  struct i915_sched_engine *locked,
 		  struct sched_cache *cache)
 {
 	const struct i915_request *rq = node_to_request(node);
-	struct intel_engine_cs *engine;
+	struct i915_sched_engine *sched_engine;
 
 	GEM_BUG_ON(!locked);
 
@@ -146,14 +145,14 @@ sched_lock_engine(const struct i915_sched_node *node,
 	 * engine lock. The simple ploy we use is to take the lock then
 	 * check that the rq still belongs to the newly locked engine.
 	 */
-	while (locked != (engine = READ_ONCE(rq->engine))) {
-		spin_unlock(&locked->sched_engine->lock);
+	while (locked != (sched_engine = READ_ONCE(rq->engine)->sched_engine)) {
+		spin_unlock(&locked->lock);
 		memset(cache, 0, sizeof(*cache));
-		spin_lock(&engine->sched_engine->lock);
-		locked = engine;
+		spin_lock(&sched_engine->lock);
+		locked = sched_engine;
 	}
 
-	GEM_BUG_ON(locked != engine);
+	GEM_BUG_ON(locked != sched_engine);
 	return locked;
 }
 
@@ -161,7 +160,7 @@ static void __i915_schedule(struct i915_sched_node *node,
 			    const struct i915_sched_attr *attr)
 {
 	const int prio = max(attr->priority, node->attr.priority);
-	struct intel_engine_cs *engine;
+	struct i915_sched_engine *sched_engine;
 	struct i915_dependency *dep, *p;
 	struct i915_dependency stack;
 	struct sched_cache cache;
@@ -236,23 +235,24 @@ static void __i915_schedule(struct i915_sched_node *node,
 	}
 
 	memset(&cache, 0, sizeof(cache));
-	engine = node_to_request(node)->engine;
-	spin_lock(&engine->sched_engine->lock);
+	sched_engine = node_to_request(node)->engine->sched_engine;
+	spin_lock(&sched_engine->lock);
 
 	/* Fifo and depth-first replacement ensure our deps execute before us */
-	engine = sched_lock_engine(node, engine, &cache);
+	sched_engine = lock_sched_engine(node, sched_engine, &cache);
 	list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
 		INIT_LIST_HEAD(&dep->dfs_link);
 
 		node = dep->signaler;
-		engine = sched_lock_engine(node, engine, &cache);
-		lockdep_assert_held(&engine->sched_engine->lock);
+		sched_engine = lock_sched_engine(node, sched_engine, &cache);
+		lockdep_assert_held(&sched_engine->lock);
 
 		/* Recheck after acquiring the engine->timeline.lock */
 		if (prio <= node->attr.priority || node_signaled(node))
 			continue;
 
-		GEM_BUG_ON(node_to_request(node)->engine != engine);
+		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
+			   sched_engine);
 
 		WRITE_ONCE(node->attr.priority, prio);
 
@@ -270,17 +270,17 @@ static void __i915_schedule(struct i915_sched_node *node,
 		if (i915_request_in_priority_queue(node_to_request(node))) {
 			if (!cache.priolist)
 				cache.priolist =
-					i915_sched_lookup_priolist(engine,
+					i915_sched_lookup_priolist(sched_engine,
 								   prio);
 			list_move_tail(&node->link, cache.priolist);
 		}
 
 		/* Defer (tasklet) submission until after all of our updates. */
-		if (engine->sched_engine->kick_backend)
-			engine->sched_engine->kick_backend(node_to_request(node), prio);
+		if (sched_engine->kick_backend)
+			sched_engine->kick_backend(node_to_request(node), prio);
 	}
 
-	spin_unlock(&engine->sched_engine->lock);
+	spin_unlock(&sched_engine->lock);
 }
 
 void i915_schedule(struct i915_request *rq, const struct i915_sched_attr *attr)
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 713c38c99de9..0014745bda30 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -39,7 +39,7 @@ void i915_schedule(struct i915_request *request,
 		   const struct i915_sched_attr *attr);
 
 struct list_head *
-i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio);
+i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio);
 
 void __i915_priolist_free(struct i915_priolist *p);
 static inline void i915_priolist_free(struct i915_priolist *p)
-- 
2.28.0

