Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088293DF76C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B16E8F1;
	Tue,  3 Aug 2021 22:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D726E252;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745904"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745904"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512712"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/46] drm/i915/guc: Implement GuC parent-child context pin /
 unpin functions
Date: Tue,  3 Aug 2021 15:29:13 -0700
Message-Id: <20210803222943.27686-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement GuC parent-child context pin / unpin functions in which in any
contexts in the relationship are pinned all the contexts are pinned. The
parent owns most of the pinning / unpinning process and the children
direct any pins / unpins to the parent.

Patch implements a number of unused functions that will be connected
later in the series.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 187 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_context.h       |  43 +---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  25 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  26 +--
 drivers/gpu/drm/i915/gt/intel_lrc.h           |   6 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   5 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |   4 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 183 +++++++++++++++--
 9 files changed, 371 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 8cb92b10b547..bb4c14656067 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -158,8 +158,8 @@ static void __ring_retire(struct intel_ring *ring)
 	intel_ring_unpin(ring);
 }
 
-static int intel_context_pre_pin(struct intel_context *ce,
-				 struct i915_gem_ww_ctx *ww)
+static int __intel_context_pre_pin(struct intel_context *ce,
+				   struct i915_gem_ww_ctx *ww)
 {
 	int err;
 
@@ -190,7 +190,7 @@ static int intel_context_pre_pin(struct intel_context *ce,
 	return err;
 }
 
-static void intel_context_post_unpin(struct intel_context *ce)
+static void __intel_context_post_unpin(struct intel_context *ce)
 {
 	if (ce->state)
 		__context_unpin_state(ce->state);
@@ -199,13 +199,85 @@ static void intel_context_post_unpin(struct intel_context *ce)
 	__ring_retire(ce->ring);
 }
 
-int __intel_context_do_pin_ww(struct intel_context *ce,
-			      struct i915_gem_ww_ctx *ww)
+static int intel_context_pre_pin(struct intel_context *ce,
+				 struct i915_gem_ww_ctx *ww)
 {
-	bool handoff = false;
-	void *vaddr;
+	struct intel_context *child;
+	int err, i = 0;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	for_each_child(ce, child) {
+		err = __intel_context_pre_pin(child, ww);
+		if (unlikely(err))
+			goto unwind;
+		++i;
+	}
+
+	err = __intel_context_pre_pin(ce, ww);
+	if (unlikely(err))
+		goto unwind;
+
+	return 0;
+
+unwind:
+	for_each_child(ce, child) {
+		if (!i--)
+			break;
+		__intel_context_post_unpin(ce);
+	}
+
+	return err;
+}
+
+static void intel_context_post_unpin(struct intel_context *ce)
+{
+	struct intel_context *child;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	for_each_child(ce, child)
+		__intel_context_post_unpin(child);
+
+	__intel_context_post_unpin(ce);
+}
+
+static int __do_ww_lock(struct intel_context *ce,
+			struct i915_gem_ww_ctx *ww)
+{
+	int err = i915_gem_object_lock(ce->timeline->hwsp_ggtt->obj, ww);
+
+	if (!err && ce->ring->vma->obj)
+		err = i915_gem_object_lock(ce->ring->vma->obj, ww);
+	if (!err && ce->state)
+		err = i915_gem_object_lock(ce->state->obj, ww);
+
+	return err;
+}
+
+static int do_ww_lock(struct intel_context *ce,
+		      struct i915_gem_ww_ctx *ww)
+{
+	struct intel_context *child;
 	int err = 0;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	for_each_child(ce, child) {
+		err = __do_ww_lock(child, ww);
+		if (unlikely(err))
+			return err;
+	}
+
+	return __do_ww_lock(ce, ww);
+}
+
+static int __intel_context_do_pin_ww(struct intel_context *ce,
+				     struct i915_gem_ww_ctx *ww)
+{
+	bool handoff = false;
+	int err;
+
 	if (unlikely(!test_bit(CONTEXT_ALLOC_BIT, &ce->flags))) {
 		err = intel_context_alloc_state(ce);
 		if (err)
@@ -217,14 +289,11 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 	 * refcount for __intel_context_active(), which prevent a lock
 	 * inversion of ce->pin_mutex vs dma_resv_lock().
 	 */
+	err = do_ww_lock(ce, ww);
+	if (err)
+		return err;
 
-	err = i915_gem_object_lock(ce->timeline->hwsp_ggtt->obj, ww);
-	if (!err && ce->ring->vma->obj)
-		err = i915_gem_object_lock(ce->ring->vma->obj, ww);
-	if (!err && ce->state)
-		err = i915_gem_object_lock(ce->state->obj, ww);
-	if (!err)
-		err = intel_context_pre_pin(ce, ww);
+	err = intel_context_pre_pin(ce, ww);
 	if (err)
 		return err;
 
@@ -232,7 +301,7 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 	if (err)
 		goto err_ctx_unpin;
 
-	err = ce->ops->pre_pin(ce, ww, &vaddr);
+	err = ce->ops->pre_pin(ce, ww);
 	if (err)
 		goto err_release;
 
@@ -250,7 +319,7 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 		if (unlikely(err))
 			goto err_unlock;
 
-		err = ce->ops->pin(ce, vaddr);
+		err = ce->ops->pin(ce);
 		if (err) {
 			intel_context_active_release(ce);
 			goto err_unlock;
@@ -290,7 +359,7 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 	return err;
 }
 
-int __intel_context_do_pin(struct intel_context *ce)
+static int __intel_context_do_pin(struct intel_context *ce)
 {
 	struct i915_gem_ww_ctx ww;
 	int err;
@@ -337,7 +406,7 @@ static void __intel_context_retire(struct i915_active *active)
 		 intel_context_get_avg_runtime_ns(ce));
 
 	set_bit(CONTEXT_VALID_BIT, &ce->flags);
-	intel_context_post_unpin(ce);
+	__intel_context_post_unpin(ce);
 	intel_context_put(ce);
 }
 
@@ -562,6 +631,88 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	child->parent = parent;
 }
 
+static inline int ____intel_context_pin(struct intel_context *ce)
+{
+	if (likely(intel_context_pin_if_active(ce)))
+		return 0;
+
+	return __intel_context_do_pin(ce);
+}
+
+static inline int __intel_context_pin_ww(struct intel_context *ce,
+					 struct i915_gem_ww_ctx *ww)
+{
+	if (likely(intel_context_pin_if_active(ce)))
+		return 0;
+
+	return __intel_context_do_pin_ww(ce, ww);
+}
+
+static inline void __intel_context_unpin(struct intel_context *ce)
+{
+	if (!ce->ops->sched_disable) {
+		__intel_context_do_unpin(ce, 1);
+	} else {
+		/*
+		 * Move ownership of this pin to the scheduling disable which is
+		 * an async operation. When that operation completes the above
+		 * intel_context_sched_disable_unpin is called potentially
+		 * unpinning the context.
+		 */
+		while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
+			if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
+				ce->ops->sched_disable(ce);
+				break;
+			}
+		}
+	}
+}
+
+/*
+ * FIXME: This is ugly, these branches are only needed for parallel contexts in
+ * GuC submission. Basically the idea is if any of the contexts, that are
+ * configured for parallel submission, are pinned all the contexts need to be
+ * pinned in order to register these contexts with the GuC. We are adding the
+ * layer here while it should probably be pushed to the backend via a vfunc. But
+ * since we already have ce->pin + a layer atop it is confusing. Definitely
+ * needs a bit of rework how to properly layer / structure this code path. What
+ * is in place works but is not ideal.
+ */
+int intel_context_pin(struct intel_context *ce)
+{
+	if (intel_context_is_child(ce)) {
+		if (!atomic_fetch_add(1, &ce->pin_count))
+			return ____intel_context_pin(ce->parent);
+		else
+			return 0;
+	} else {
+		return ____intel_context_pin(ce);
+	}
+}
+
+int intel_context_pin_ww(struct intel_context *ce,
+			 struct i915_gem_ww_ctx *ww)
+{
+	if (intel_context_is_child(ce)) {
+		if (!atomic_fetch_add(1, &ce->pin_count))
+			return __intel_context_pin_ww(ce->parent, ww);
+		else
+			return 0;
+	} else {
+		return __intel_context_pin_ww(ce, ww);
+	}
+}
+
+void intel_context_unpin(struct intel_context *ce)
+{
+	if (intel_context_is_child(ce)) {
+		if (atomic_fetch_add(-1, &ce->pin_count) == 1)
+			__intel_context_unpin(ce->parent);
+	} else {
+		__intel_context_unpin(ce);
+	}
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index ad6ce5ac4824..c208691fc87d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -110,31 +110,15 @@ static inline void intel_context_unlock_pinned(struct intel_context *ce)
 	mutex_unlock(&ce->pin_mutex);
 }
 
-int __intel_context_do_pin(struct intel_context *ce);
-int __intel_context_do_pin_ww(struct intel_context *ce,
-			      struct i915_gem_ww_ctx *ww);
-
 static inline bool intel_context_pin_if_active(struct intel_context *ce)
 {
 	return atomic_inc_not_zero(&ce->pin_count);
 }
 
-static inline int intel_context_pin(struct intel_context *ce)
-{
-	if (likely(intel_context_pin_if_active(ce)))
-		return 0;
-
-	return __intel_context_do_pin(ce);
-}
-
-static inline int intel_context_pin_ww(struct intel_context *ce,
-				       struct i915_gem_ww_ctx *ww)
-{
-	if (likely(intel_context_pin_if_active(ce)))
-		return 0;
+int intel_context_pin(struct intel_context *ce);
 
-	return __intel_context_do_pin_ww(ce, ww);
-}
+int intel_context_pin_ww(struct intel_context *ce,
+			 struct i915_gem_ww_ctx *ww);
 
 static inline void __intel_context_pin(struct intel_context *ce)
 {
@@ -146,28 +130,11 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub);
 
 static inline void intel_context_sched_disable_unpin(struct intel_context *ce)
 {
+	GEM_BUG_ON(intel_context_is_child(ce));
 	__intel_context_do_unpin(ce, 2);
 }
 
-static inline void intel_context_unpin(struct intel_context *ce)
-{
-	if (!ce->ops->sched_disable) {
-		__intel_context_do_unpin(ce, 1);
-	} else {
-		/*
-		 * Move ownership of this pin to the scheduling disable which is
-		 * an async operation. When that operation completes the above
-		 * intel_context_sched_disable_unpin is called potentially
-		 * unpinning the context.
-		 */
-		while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
-			if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
-				ce->ops->sched_disable(ce);
-				break;
-			}
-		}
-	}
-}
+void intel_context_unpin(struct intel_context *ce);
 
 void intel_context_enter_engine(struct intel_context *ce);
 void intel_context_exit_engine(struct intel_context *ce);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 66b22b370a72..eb82be15b7a2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -39,8 +39,8 @@ struct intel_context_ops {
 
 	void (*ban)(struct intel_context *ce, struct i915_request *rq);
 
-	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
-	int (*pin)(struct intel_context *ce, void *vaddr);
+	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww);
+	int (*pin)(struct intel_context *ce);
 	void (*unpin)(struct intel_context *ce);
 	void (*post_unpin)(struct intel_context *ce);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index baa1797af1c8..fc74ca28f245 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2554,16 +2554,17 @@ static void execlists_submit_request(struct i915_request *request)
 static int
 __execlists_context_pre_pin(struct intel_context *ce,
 			    struct intel_engine_cs *engine,
-			    struct i915_gem_ww_ctx *ww, void **vaddr)
+			    struct i915_gem_ww_ctx *ww)
 {
 	int err;
 
-	err = lrc_pre_pin(ce, engine, ww, vaddr);
+	err = lrc_pre_pin(ce, engine, ww);
 	if (err)
 		return err;
 
 	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags)) {
-		lrc_init_state(ce, engine, *vaddr);
+		lrc_init_state(ce, engine, ce->lrc_reg_state -
+			       LRC_STATE_OFFSET / sizeof(*ce->lrc_reg_state));
 
 		 __i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
 	}
@@ -2572,15 +2573,14 @@ __execlists_context_pre_pin(struct intel_context *ce,
 }
 
 static int execlists_context_pre_pin(struct intel_context *ce,
-				     struct i915_gem_ww_ctx *ww,
-				     void **vaddr)
+				     struct i915_gem_ww_ctx *ww)
 {
-	return __execlists_context_pre_pin(ce, ce->engine, ww, vaddr);
+	return __execlists_context_pre_pin(ce, ce->engine, ww);
 }
 
-static int execlists_context_pin(struct intel_context *ce, void *vaddr)
+static int execlists_context_pin(struct intel_context *ce)
 {
-	return lrc_pin(ce, ce->engine, vaddr);
+	return lrc_pin(ce, ce->engine);
 }
 
 static int execlists_context_alloc(struct intel_context *ce)
@@ -3570,20 +3570,19 @@ static int virtual_context_alloc(struct intel_context *ce)
 }
 
 static int virtual_context_pre_pin(struct intel_context *ce,
-				   struct i915_gem_ww_ctx *ww,
-				   void **vaddr)
+				   struct i915_gem_ww_ctx *ww)
 {
 	struct virtual_engine *ve = container_of(ce, typeof(*ve), context);
 
 	 /* Note: we must use a real engine class for setting up reg state */
-	return __execlists_context_pre_pin(ce, ve->siblings[0], ww, vaddr);
+	return __execlists_context_pre_pin(ce, ve->siblings[0], ww);
 }
 
-static int virtual_context_pin(struct intel_context *ce, void *vaddr)
+static int virtual_context_pin(struct intel_context *ce)
 {
 	struct virtual_engine *ve = container_of(ce, typeof(*ve), context);
 
-	return lrc_pin(ce, ve->siblings[0], vaddr);
+	return lrc_pin(ce, ve->siblings[0]);
 }
 
 static void virtual_context_enter(struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index bb4af4977920..c466fc966005 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -947,30 +947,30 @@ void lrc_reset(struct intel_context *ce)
 int
 lrc_pre_pin(struct intel_context *ce,
 	    struct intel_engine_cs *engine,
-	    struct i915_gem_ww_ctx *ww,
-	    void **vaddr)
+	    struct i915_gem_ww_ctx *ww)
 {
+	void *vaddr;
 	GEM_BUG_ON(!ce->state);
 	GEM_BUG_ON(!i915_vma_is_pinned(ce->state));
 
-	*vaddr = i915_gem_object_pin_map(ce->state->obj,
-					 i915_coherent_map_type(ce->engine->i915,
-								ce->state->obj,
-								false) |
-					 I915_MAP_OVERRIDE);
+	vaddr = i915_gem_object_pin_map(ce->state->obj,
+					i915_coherent_map_type(ce->engine->i915,
+							       ce->state->obj,
+							       false) |
+					I915_MAP_OVERRIDE);
 
-	return PTR_ERR_OR_ZERO(*vaddr);
+	ce->lrc_reg_state = vaddr + LRC_STATE_OFFSET;
+
+	return PTR_ERR_OR_ZERO(vaddr);
 }
 
 int
 lrc_pin(struct intel_context *ce,
-	struct intel_engine_cs *engine,
-	void *vaddr)
+	struct intel_engine_cs *engine)
 {
-	ce->lrc_reg_state = vaddr + LRC_STATE_OFFSET;
-
 	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags))
-		lrc_init_state(ce, engine, vaddr);
+		lrc_init_state(ce, engine,
+			       (void *)ce->lrc_reg_state - LRC_STATE_OFFSET);
 
 	ce->lrc.lrca = lrc_update_regs(ce, engine, ce->ring->tail);
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
index 7f697845c4cf..837fcf00270d 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
@@ -38,12 +38,10 @@ void lrc_destroy(struct kref *kref);
 int
 lrc_pre_pin(struct intel_context *ce,
 	    struct intel_engine_cs *engine,
-	    struct i915_gem_ww_ctx *ww,
-	    void **vaddr);
+	    struct i915_gem_ww_ctx *ww);
 int
 lrc_pin(struct intel_context *ce,
-	struct intel_engine_cs *engine,
-	void *vaddr);
+	struct intel_engine_cs *engine);
 void lrc_unpin(struct intel_context *ce);
 void lrc_post_unpin(struct intel_context *ce);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 2958e2fae380..f4f301bfb9f7 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -472,8 +472,7 @@ static int ring_context_init_default_state(struct intel_context *ce,
 }
 
 static int ring_context_pre_pin(struct intel_context *ce,
-				struct i915_gem_ww_ctx *ww,
-				void **unused)
+				struct i915_gem_ww_ctx *ww)
 {
 	struct i915_address_space *vm;
 	int err = 0;
@@ -576,7 +575,7 @@ static int ring_context_alloc(struct intel_context *ce)
 	return 0;
 }
 
-static int ring_context_pin(struct intel_context *ce, void *unused)
+static int ring_context_pin(struct intel_context *ce)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 2c1af030310c..826b5d7a4573 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -167,12 +167,12 @@ static int mock_context_alloc(struct intel_context *ce)
 }
 
 static int mock_context_pre_pin(struct intel_context *ce,
-				struct i915_gem_ww_ctx *ww, void **unused)
+				struct i915_gem_ww_ctx *ww)
 {
 	return 0;
 }
 
-static int mock_context_pin(struct intel_context *ce, void *unused)
+static int mock_context_pin(struct intel_context *ce)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index dec757d319a2..c5c73c42bcf7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1905,6 +1905,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	GEM_BUG_ON(!engine->mask);
 	GEM_BUG_ON(context_guc_id_invalid(ce));
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -2008,15 +2009,13 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 static int __guc_context_pre_pin(struct intel_context *ce,
 				 struct intel_engine_cs *engine,
-				 struct i915_gem_ww_ctx *ww,
-				 void **vaddr)
+				 struct i915_gem_ww_ctx *ww)
 {
-	return lrc_pre_pin(ce, engine, ww, vaddr);
+	return lrc_pre_pin(ce, engine, ww);
 }
 
 static int __guc_context_pin(struct intel_context *ce,
-			     struct intel_engine_cs *engine,
-			     void *vaddr)
+			     struct intel_engine_cs *engine)
 {
 	if (i915_ggtt_offset(ce->state) !=
 	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
@@ -2027,20 +2026,33 @@ static int __guc_context_pin(struct intel_context *ce,
 	 * explaination of why.
 	 */
 
-	return lrc_pin(ce, engine, vaddr);
+	return lrc_pin(ce, engine);
+}
+
+static void __guc_context_unpin(struct intel_context *ce)
+{
+	lrc_unpin(ce);
+}
+
+static void __guc_context_post_unpin(struct intel_context *ce)
+{
+	lrc_post_unpin(ce);
 }
 
 static int guc_context_pre_pin(struct intel_context *ce,
-			       struct i915_gem_ww_ctx *ww,
-			       void **vaddr)
+			       struct i915_gem_ww_ctx *ww)
 {
-	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
+	return __guc_context_pre_pin(ce, ce->engine, ww);
 }
 
-static int guc_context_pin(struct intel_context *ce, void *vaddr)
+static int guc_context_pin(struct intel_context *ce)
 {
-	int ret = __guc_context_pin(ce, ce->engine, vaddr);
+	int ret;
 
+	GEM_BUG_ON(intel_context_is_parent(ce) ||
+		   intel_context_is_child(ce));
+
+	ret = __guc_context_pin(ce, ce->engine);
 	if (likely(!ret && !intel_context_is_barrier(ce)))
 		intel_engine_pm_get(ce->engine);
 
@@ -2054,7 +2066,7 @@ static void guc_context_unpin(struct intel_context *ce)
 	GEM_BUG_ON(context_enabled(ce));
 
 	unpin_guc_id(guc, ce, true);
-	lrc_unpin(ce);
+	__guc_context_unpin(ce);
 
 	if (likely(!intel_context_is_barrier(ce)))
 		intel_engine_pm_put(ce->engine);
@@ -2062,7 +2074,141 @@ static void guc_context_unpin(struct intel_context *ce)
 
 static void guc_context_post_unpin(struct intel_context *ce)
 {
-	lrc_post_unpin(ce);
+	__guc_context_post_unpin(ce);
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static int guc_parent_context_pre_pin(struct intel_context *ce,
+				      struct i915_gem_ww_ctx *ww)
+{
+	struct intel_context *child;
+	int err, i = 0, j = 0;
+
+	for_each_child(ce, child) {
+		err = i915_active_acquire(&child->active);
+		if (unlikely(err))
+			goto unwind_active;
+		++i;
+	}
+
+	for_each_child(ce, child) {
+		err = __guc_context_pre_pin(child, child->engine, ww);
+		if (unlikely(err))
+			goto unwind_pre_pin;
+		++j;
+	}
+
+	err = __guc_context_pre_pin(ce, ce->engine, ww);
+	if (unlikely(err))
+		goto unwind_pre_pin;
+
+	return 0;
+
+unwind_pre_pin:
+	for_each_child(ce, child) {
+		if (!j--)
+			break;
+		__guc_context_post_unpin(child);
+	}
+
+unwind_active:
+	for_each_child(ce, child) {
+		if (!i--)
+			break;
+		i915_active_release(&child->active);
+	}
+
+	return err;
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static void guc_parent_context_post_unpin(struct intel_context *ce)
+{
+	struct intel_context *child;
+
+	for_each_child(ce, child)
+		__guc_context_post_unpin(child);
+	__guc_context_post_unpin(ce);
+
+	for_each_child(ce, child) {
+		intel_context_get(child);
+		i915_active_release(&child->active);
+		intel_context_put(child);
+	}
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static int guc_parent_context_pin(struct intel_context *ce)
+{
+	int ret, i = 0, j = 0;
+	struct intel_context *child;
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	for_each_child(ce, child) {
+		ret = __guc_context_pin(child, child->engine);
+		if (unlikely(ret))
+			goto unwind_pin;
+		++i;
+	}
+	ret = __guc_context_pin(ce, ce->engine);
+	if (unlikely(ret))
+		goto unwind_pin;
+
+	for_each_child(ce, child)
+		if (test_bit(CONTEXT_LRCA_DIRTY, &child->flags)) {
+			set_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
+			break;
+		}
+
+	for_each_engine_masked(engine, ce->engine->gt,
+			       ce->engine->mask, tmp)
+		intel_engine_pm_get(engine);
+	for_each_child(ce, child)
+		for_each_engine_masked(engine, child->engine->gt,
+				       child->engine->mask, tmp)
+			intel_engine_pm_get(engine);
+
+	return 0;
+
+unwind_pin:
+	for_each_child(ce, child) {
+		if (++j > i)
+			break;
+		__guc_context_unpin(child);
+	}
+
+	return ret;
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static void guc_parent_context_unpin(struct intel_context *ce)
+{
+	struct intel_context *child;
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+	GEM_BUG_ON(context_enabled(ce));
+
+	unpin_guc_id(ce_to_guc(ce), ce, true);
+	for_each_child(ce, child)
+		__guc_context_unpin(child);
+	__guc_context_unpin(ce);
+
+	for_each_engine_masked(engine, ce->engine->gt,
+			       ce->engine->mask, tmp)
+		intel_engine_pm_put(engine);
+	for_each_child(ce, child)
+		for_each_engine_masked(engine, child->engine->gt,
+				       child->engine->mask, tmp)
+			intel_engine_pm_put(engine);
 }
 
 static void __guc_context_sched_enable(struct intel_guc *guc,
@@ -2993,18 +3139,17 @@ static int guc_request_alloc(struct i915_request *rq)
 }
 
 static int guc_virtual_context_pre_pin(struct intel_context *ce,
-				       struct i915_gem_ww_ctx *ww,
-				       void **vaddr)
+				       struct i915_gem_ww_ctx *ww)
 {
 	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
 
-	return __guc_context_pre_pin(ce, engine, ww, vaddr);
+	return __guc_context_pre_pin(ce, engine, ww);
 }
 
-static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
+static int guc_virtual_context_pin(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
-	int ret = __guc_context_pin(ce, engine, vaddr);
+	int ret = __guc_context_pin(ce, engine);
 	intel_engine_mask_t tmp, mask = ce->engine->mask;
 
 	if (likely(!ret))
@@ -3024,7 +3169,7 @@ static void guc_virtual_context_unpin(struct intel_context *ce)
 	GEM_BUG_ON(intel_context_is_barrier(ce));
 
 	unpin_guc_id(guc, ce, true);
-	lrc_unpin(ce);
+	__guc_context_unpin(ce);
 
 	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
 		intel_engine_pm_put(engine);
-- 
2.28.0

