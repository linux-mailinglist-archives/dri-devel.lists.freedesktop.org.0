Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85AA6954AE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 00:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E8F10E78D;
	Mon, 13 Feb 2023 23:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77C10E780;
 Mon, 13 Feb 2023 23:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676330512; x=1707866512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQSfsrg002po4Vfg0NuMOQsTUwx7hvxQxFiWLzDAjVM=;
 b=Y9c1eEo5rKJsE74J/+SP9VaILZGnLYvpEXrh29EtPnwjx/H2avRSMgA8
 pa4o/TEVAtinoQUxZbON4PDbkMOg4HfJWUKfM+OmKM1wAWsiawW2Kdp3b
 TIOyHub7jyZW4S0WGRkMl60Uk+j/e9RAYDYfTpH5eTEve8uBJwzuvE0YV
 dENCK4TFFoipqSOhmKMcDYb7Ue33NYCghKhTA3HyVU9ffvU6T5mJL8Ilk
 BFJzMVJjc6+9OW1SeTckxYDBXmy0r24VxiIlIuwokP0z/IOAX6yNomVB7
 jnex4Ljss4bd1i6orDtt1vNLl/lAKcRYC2vlbaUm7TLkwotau5/Kb3xIa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333161213"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="333161213"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:21:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997860722"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="997860722"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:21:48 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 2/2] drm/i915/active: Serialize access to barrier tasks lists
Date: Tue, 14 Feb 2023 00:21:28 +0100
Message-Id: <20230213232128.59217-3-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213232128.59217-1-janusz.krzysztofik@linux.intel.com>
References: <20230213232128.59217-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Barriers are now deleted from a barrier tasks list by temporarily removing
the list content, traversing that content with skip over the node to be
deleted, then adding the modified content back to the list.  Since that
complex operation is not serialized with other concurrent uses of the
list, functions that depend on the list being either empty or not empty
can take wrong decisions.

One example is intel_engine_flush_barriers(), which is expected to queue
a heartbeat request for an engine unless it finds that engine's barriers
tasks list empty.  Timeouts on infinite __i915_active_wait() occurrences
reported by igt@gem_barrier_race@remote-request subtest seem to be
potentially caused by false positives from those llist_empty() checks.

Protect concurrent access to the list pending those complex barrier delete
operations with a spinlock, and teach other sensitive users of the list to
acquire the lock.  While using a spinlock to protect a lockless list may
be considered suboptimal compared to converting the llist to a regular
list, this approach seems to provide the smallest and least invasive but
effective fix.

Fixes: d8af05ff38ae ("drm/i915: Allow sharing the idle-barrier from other kernel requests")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.4
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  6 +++
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 10 ++++-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  4 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  5 +++
 drivers/gpu/drm/i915/i915_active.c            | 39 +++++++++++++++----
 7 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index d4e29da74612d..f82f6f7b89e7b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1148,6 +1148,7 @@ static int engine_setup_common(struct intel_engine_cs *engine)
 	int err;
 
 	init_llist_head(&engine->barrier_tasks);
+	spin_lock_init(&engine->barriers_lock);
 
 	err = init_status_page(engine);
 	if (err)
@@ -1418,6 +1419,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 	if (engine->kernel_context)
 		intel_engine_destroy_pinned_context(engine->kernel_context);
 
+	/* No concurrent tasks expected on driver remove, no need to lock */
 	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
 	cleanup_status_page(engine);
 
@@ -2240,6 +2242,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	struct i915_gpu_error * const error = &engine->i915->gpu_error;
 	struct i915_request *rq;
 	intel_wakeref_t wakeref;
+	unsigned long flags;
 	ktime_t dummy;
 
 	if (header) {
@@ -2254,8 +2257,11 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 		drm_printf(m, "*** WEDGED ***\n");
 
 	drm_printf(m, "\tAwake? %d\n", atomic_read(&engine->wakeref.count));
+	/* Serialize against ____active_del_barrier() for debugging accuracy */
+	spin_lock_irqsave(&engine->barriers_lock, flags);
 	drm_printf(m, "\tBarriers?: %s\n",
 		   str_yes_no(!llist_empty(&engine->barrier_tasks)));
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
 	drm_printf(m, "\tLatency: %luus\n",
 		   ewma__engine_latency_read(&engine->latency));
 	if (intel_engine_supports_stats(engine))
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 9a527e1f5be65..ae1d4ffff2139 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -378,9 +378,17 @@ int intel_engine_flush_barriers(struct intel_engine_cs *engine)
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_MIN };
 	struct intel_context *ce = engine->kernel_context;
 	struct i915_request *rq;
+	unsigned long flags;
 	int err;
 
-	if (llist_empty(&engine->barrier_tasks))
+	/*
+	 * Serialize against ____active_del_barrier()
+	 * or we risk the barriers not flushed.
+	 */
+	spin_lock_irqsave(&engine->barriers_lock, flags);
+	err = !llist_empty(&engine->barrier_tasks);
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
+	if (!err)
 		return 0;
 
 	if (!intel_engine_pm_get_if_awake(engine))
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index e971b153fda97..209fb3f2bb786 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -236,6 +236,10 @@ static void call_idle_barriers(struct intel_engine_cs *engine)
 {
 	struct llist_node *node, *next;
 
+	/*
+	 * Locking around llist_del_all() not needed as long as we always
+	 * call ____active_del_barrier() with engine's wakeref acquired.
+	 */
 	llist_for_each_safe(node, next, llist_del_all(&engine->barrier_tasks)) {
 		struct dma_fence_cb *cb =
 			container_of((struct list_head *)node,
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 4fd54fb8810fb..ab9e0a6de70d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -396,6 +396,7 @@ struct intel_engine_cs {
 	struct intel_context *hung_ce;
 
 	struct llist_head barrier_tasks;
+	spinlock_t barriers_lock;
 
 	struct intel_context *kernel_context; /* pinned */
 
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index c0637bf799a33..383a27b64634f 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -394,6 +394,8 @@ int mock_engine_init(struct intel_engine_cs *engine)
 {
 	struct intel_context *ce;
 
+	spin_lock_init(&engine->barriers_lock);
+
 	INIT_LIST_HEAD(&engine->pinned_contexts_list);
 
 	engine->sched_engine = i915_sched_engine_create(ENGINE_MOCK);
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index 273d440a53e3f..cbc03662fc693 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -90,6 +90,7 @@ static void pulse_unlock_wait(struct pulse *p)
 static int __live_idle_pulse(struct intel_engine_cs *engine,
 			     int (*fn)(struct intel_engine_cs *cs))
 {
+	unsigned long flags;
 	struct pulse *p;
 	int err;
 
@@ -113,13 +114,17 @@ static int __live_idle_pulse(struct intel_engine_cs *engine,
 	i915_active_release(&p->active);
 
 	GEM_BUG_ON(i915_active_is_idle(&p->active));
+	spin_lock_irqsave(&engine->barriers_lock, flags);
 	GEM_BUG_ON(llist_empty(&engine->barrier_tasks));
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
 
 	err = fn(engine);
 	if (err)
 		goto out;
 
+	spin_lock_irqsave(&engine->barriers_lock, flags);
 	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
 
 	if (engine_sync_barrier(engine)) {
 		struct drm_printer m = drm_err_printer("pulse");
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index f9282b8c87c1c..35d6954a7b912 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -370,24 +370,34 @@ static bool ____active_del_barrier(struct i915_active *ref,
 {
 	struct llist_node *head = NULL, *tail = NULL;
 	struct llist_node *pos, *next;
+	unsigned long flags;
 
+	/* Must be serialized via pm wakeref with call_idle_barriers() */
+	GEM_BUG_ON(!intel_engine_pm_is_awake(engine));
 	GEM_BUG_ON(node->timeline != engine->kernel_context->timeline->fence_context);
 
 	/*
 	 * Rebuild the llist excluding our node. We may perform this
 	 * outside of the kernel_context timeline mutex and so someone
 	 * else may be manipulating the engine->barrier_tasks, in
-	 * which case either we or they will be upset :)
+	 * which case either we or they could be upset :)
 	 *
-	 * A second __active_del_barrier() will report failure to claim
-	 * the active_node and the caller will just shrug and know not to
+	 * A second __active_del_barrier() would report failure to claim
+	 * the active_node and the caller would just shrug and know not to
 	 * claim ownership of its node.
 	 *
-	 * A concurrent i915_request_add_active_barriers() will miss adding
-	 * any of the tasks, but we will try again on the next -- and since
-	 * we are actively using the barrier, we know that there will be
+	 * A concurrent i915_request_add_active_barriers() would miss adding
+	 * any of the tasks, but we would try again on the next -- and since
+	 * we were actively using the barrier, we knew that there would be
 	 * at least another opportunity when we idle.
+	 *
+	 * However, users that check for the list to be empty can be misleaded
+	 * and can take wrong decisions, like e.g. intel_engine_flush_barriers()
+	 * not submitting a flushing heartbeat when it finds the list empty
+	 * while it is being rebuilt.  To avoid such races, we protect sensitive
+	 * users with a dedicated spinlock.
 	 */
+	spin_lock_irqsave(&engine->barriers_lock, flags);
 	llist_for_each_safe(pos, next, llist_del_all(&engine->barrier_tasks)) {
 		if (node == barrier_from_ll(pos)) {
 			node = NULL;
@@ -401,6 +411,7 @@ static bool ____active_del_barrier(struct i915_active *ref,
 	}
 	if (head)
 		llist_add_batch(head, tail, &engine->barrier_tasks);
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
 
 	return !node;
 }
@@ -881,6 +892,9 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 		struct llist_node *prev = first;
 		struct active_node *node;
 
+		/* Serialize with call_idle_barriers() via pm wakeref */
+		intel_engine_pm_get(engine);
+
 		rcu_read_lock();
 		node = reuse_idle_barrier(ref, idx);
 		rcu_read_unlock();
@@ -916,7 +930,6 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 		first->next = prev;
 		if (!last)
 			last = first;
-		intel_engine_pm_get(engine);
 	}
 
 	GEM_BUG_ON(!llist_empty(&ref->preallocated_barriers));
@@ -976,6 +989,12 @@ void i915_active_acquire_barrier(struct i915_active *ref)
 		spin_unlock_irqrestore(&ref->tree_lock, flags);
 
 		GEM_BUG_ON(!intel_engine_pm_is_awake(engine));
+		/*
+		 * As long as we serialize concurrent processing of
+		 * barrier_tasks by multiple ____active_del_barrier(),
+		 * it should be safe to add a new node without locking,
+		 * even while the llist is temporarily emptied.
+		 */
 		llist_add(barrier_to_ll(node), &engine->barrier_tasks);
 		intel_engine_pm_put_delay(engine, 2);
 	}
@@ -996,7 +1015,13 @@ void i915_request_add_active_barriers(struct i915_request *rq)
 	GEM_BUG_ON(intel_engine_is_virtual(engine));
 	GEM_BUG_ON(i915_request_timeline(rq) != engine->kernel_context->timeline);
 
+	/*
+	 * Serialize against ____active_del_barrier() or we risk
+	 * the barriers left intact, not replaced with the request.
+	 */
+	spin_lock_irqsave(&engine->barriers_lock, flags);
 	node = llist_del_all(&engine->barrier_tasks);
+	spin_unlock_irqrestore(&engine->barriers_lock, flags);
 	if (!node)
 		return;
 	/*
-- 
2.25.1

