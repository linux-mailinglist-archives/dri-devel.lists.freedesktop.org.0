Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06B4453A78
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 20:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED5489B60;
	Tue, 16 Nov 2021 19:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D24689B60;
 Tue, 16 Nov 2021 19:55:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="220701121"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="220701121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 11:55:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="506595320"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 11:55:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Drop stealing of bits from i915_sw_fence function
 pointer
Date: Tue, 16 Nov 2021 11:49:29 -0800
Message-Id: <20211116194929.10211-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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

Rather than stealing bits from i915_sw_fence function pointer use
seperate fields for function pointer and flags. If using two different
fields, the 4 byte alignment for the i915_sw_fence function pointer can
also be dropped.

v2:
 (CI)
  - Set new function field rather than flags in __i915_sw_fence_init
v3:
 (Tvrtko)
  - Remove BUG_ON(!fence->flags) in reinit as that will now blow up
  - Only define fence->flags if CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is
    defined
v4:
  - Rebase, resend for CI

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 +-
 drivers/gpu/drm/i915/i915_request.c           |  4 +--
 drivers/gpu/drm/i915/i915_sw_fence.c          | 28 +++++++++++--------
 drivers/gpu/drm/i915/i915_sw_fence.h          | 23 +++++++--------
 drivers/gpu/drm/i915/i915_sw_fence_work.c     |  2 +-
 .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c |  8 +++---
 9 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0ceee8ac6671..6636ac9e9ff8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8791,7 +8791,7 @@ static void intel_atomic_commit_work(struct work_struct *work)
 	intel_atomic_commit_tail(state);
 }
 
-static int __i915_sw_fence_call
+static int
 intel_atomic_commit_ready(struct i915_sw_fence *fence,
 			  enum i915_sw_fence_notify notify)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ebd775cb1661..347dab952e90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1001,7 +1001,7 @@ static void free_engines_rcu(struct rcu_head *rcu)
 	free_engines(engines);
 }
 
-static int __i915_sw_fence_call
+static int
 engines_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct i915_gem_engines *engines =
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 5634d14052bc..331ed688ceab 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -364,7 +364,7 @@ static int __intel_context_active(struct i915_active *active)
 	return 0;
 }
 
-static int __i915_sw_fence_call
+static int
 sw_fence_dummy_notify(struct i915_sw_fence *sf,
 		      enum i915_sw_fence_notify state)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 623273aca09e..08dda8889f4a 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -719,7 +719,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
 	intel_context_cancel_request(rq->context, rq);
 }
 
-static int __i915_sw_fence_call
+static int
 submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct i915_request *request =
@@ -755,7 +755,7 @@ submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 	return NOTIFY_DONE;
 }
 
-static int __i915_sw_fence_call
+static int
 semaphore_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct i915_request *rq = container_of(fence, typeof(*rq), semaphore);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..f10d31818ecc 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -18,7 +18,9 @@
 #define I915_SW_FENCE_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
 #endif
 
+#ifdef CONFIG_DRM_I915_SW_FENCE_CHECK_DAG
 static DEFINE_SPINLOCK(i915_sw_fence_lock);
+#endif
 
 #define WQ_FLAG_BITS \
 	BITS_PER_TYPE(typeof_member(struct wait_queue_entry, flags))
@@ -34,7 +36,7 @@ enum {
 
 static void *i915_sw_fence_debug_hint(void *addr)
 {
-	return (void *)(((struct i915_sw_fence *)addr)->flags & I915_SW_FENCE_MASK);
+	return (void *)(((struct i915_sw_fence *)addr)->fn);
 }
 
 #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
@@ -126,10 +128,7 @@ static inline void debug_fence_assert(struct i915_sw_fence *fence)
 static int __i915_sw_fence_notify(struct i915_sw_fence *fence,
 				  enum i915_sw_fence_notify state)
 {
-	i915_sw_fence_notify_t fn;
-
-	fn = (i915_sw_fence_notify_t)(fence->flags & I915_SW_FENCE_MASK);
-	return fn(fence, state);
+	return fence->fn(fence, state);
 }
 
 #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
@@ -242,10 +241,13 @@ void __i915_sw_fence_init(struct i915_sw_fence *fence,
 			  const char *name,
 			  struct lock_class_key *key)
 {
-	BUG_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
+	BUG_ON(!fn);
 
 	__init_waitqueue_head(&fence->wait, name, key);
-	fence->flags = (unsigned long)fn;
+	fence->fn = fn;
+#ifdef CONFIG_DRM_I915_SW_FENCE_CHECK_DAG
+	fence->flags = 0;
+#endif
 
 	i915_sw_fence_reinit(fence);
 }
@@ -257,7 +259,6 @@ void i915_sw_fence_reinit(struct i915_sw_fence *fence)
 	atomic_set(&fence->pending, 1);
 	fence->error = 0;
 
-	I915_SW_FENCE_BUG_ON(!fence->flags);
 	I915_SW_FENCE_BUG_ON(!list_empty(&fence->wait.head));
 }
 
@@ -279,6 +280,7 @@ static int i915_sw_fence_wake(wait_queue_entry_t *wq, unsigned mode, int flags,
 	return 0;
 }
 
+#ifdef CONFIG_DRM_I915_SW_FENCE_CHECK_DAG
 static bool __i915_sw_fence_check_if_after(struct i915_sw_fence *fence,
 				    const struct i915_sw_fence * const signaler)
 {
@@ -322,9 +324,6 @@ static bool i915_sw_fence_check_if_after(struct i915_sw_fence *fence,
 	unsigned long flags;
 	bool err;
 
-	if (!IS_ENABLED(CONFIG_DRM_I915_SW_FENCE_CHECK_DAG))
-		return false;
-
 	spin_lock_irqsave(&i915_sw_fence_lock, flags);
 	err = __i915_sw_fence_check_if_after(fence, signaler);
 	__i915_sw_fence_clear_checked_bit(fence);
@@ -332,6 +331,13 @@ static bool i915_sw_fence_check_if_after(struct i915_sw_fence *fence,
 
 	return err;
 }
+#else
+static bool i915_sw_fence_check_if_after(struct i915_sw_fence *fence,
+					 const struct i915_sw_fence * const signaler)
+{
+	return false;
+}
+#endif
 
 static int __i915_sw_fence_await_sw_fence(struct i915_sw_fence *fence,
 					  struct i915_sw_fence *signaler,
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index 30a863353ee6..a7c603bc1b01 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -17,26 +17,27 @@
 
 struct completion;
 struct dma_resv;
+struct i915_sw_fence;
+
+enum i915_sw_fence_notify {
+	FENCE_COMPLETE,
+	FENCE_FREE
+};
+
+typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
+				      enum i915_sw_fence_notify state);
 
 struct i915_sw_fence {
 	wait_queue_head_t wait;
+	i915_sw_fence_notify_t fn;
+#ifdef CONFIG_DRM_I915_SW_FENCE_CHECK_DAG
 	unsigned long flags;
+#endif
 	atomic_t pending;
 	int error;
 };
 
 #define I915_SW_FENCE_CHECKED_BIT	0 /* used internally for DAG checking */
-#define I915_SW_FENCE_PRIVATE_BIT	1 /* available for use by owner */
-#define I915_SW_FENCE_MASK		(~3)
-
-enum i915_sw_fence_notify {
-	FENCE_COMPLETE,
-	FENCE_FREE
-};
-
-typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
-				      enum i915_sw_fence_notify state);
-#define __i915_sw_fence_call __aligned(4)
 
 void __i915_sw_fence_init(struct i915_sw_fence *fence,
 			  i915_sw_fence_notify_t fn,
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index 5b33ef23d54c..d2e56b387993 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -23,7 +23,7 @@ static void fence_work(struct work_struct *work)
 	dma_fence_put(&f->dma);
 }
 
-static int __i915_sw_fence_call
+static int
 fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct dma_fence_work *f = container_of(fence, typeof(*f), chain);
diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index cbf45d85cbff..daa985e5a19b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -28,7 +28,7 @@
 
 #include "../i915_selftest.h"
 
-static int __i915_sw_fence_call
+static int
 fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	switch (state) {
diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
index 080b90b63d16..bf2752cc1e0b 100644
--- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
@@ -26,7 +26,7 @@
 
 /* Small library of different fence types useful for writing tests */
 
-static int __i915_sw_fence_call
+static int
 nop_fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	return NOTIFY_DONE;
@@ -41,12 +41,12 @@ void __onstack_fence_init(struct i915_sw_fence *fence,
 	__init_waitqueue_head(&fence->wait, name, key);
 	atomic_set(&fence->pending, 1);
 	fence->error = 0;
-	fence->flags = (unsigned long)nop_fence_notify;
+	fence->fn = nop_fence_notify;
 }
 
 void onstack_fence_fini(struct i915_sw_fence *fence)
 {
-	if (!fence->flags)
+	if (!fence->fn)
 		return;
 
 	i915_sw_fence_commit(fence);
@@ -89,7 +89,7 @@ struct heap_fence {
 	};
 };
 
-static int __i915_sw_fence_call
+static int
 heap_fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct heap_fence *h = container_of(fence, typeof(*h), fence);
-- 
2.33.1

