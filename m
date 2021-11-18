Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F68456106
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 17:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EEC6EB58;
	Thu, 18 Nov 2021 16:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4FE6EB76;
 Thu, 18 Nov 2021 16:59:18 +0000 (UTC)
Date: Thu, 18 Nov 2021 17:59:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637254756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=TWH2SMdsYpAkkLervETGftNf/gKTVAoR7kPDuekHSxg=;
 b=g/8AQZFZUPa2freCYnDKbJPmcpMi/AecFLbheGN8vP/tvJl1zwQgkHZc6v74USev1k+YdQ
 8dJqpzczIrbxISsdXTIOKCnTeaP4UyyEF1DHytbhYQ+FTNAAYruVAxPRk+B95gxD03Q+jr
 r/f9M7F6yIPSo9uvoGrXaQuv/fDp79FqSFi99ZKQo+hAorO5ncGHWZ1h0sk5f4pRRXkCq4
 mm7OAV/5HKHFoi2jSh9OlU/tUUy3lAz6VXd95zYrk/V3DJobe8ivgkeRDp6N+YjJvvNN/B
 ivAKZwy7F4GtnXaRx7s4If+Rzz6cG0inY3bIM9p7xeurCFyQUI3iWzdWwqWY5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637254756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=TWH2SMdsYpAkkLervETGftNf/gKTVAoR7kPDuekHSxg=;
 b=P33GgXgjYjCR7fFfdf2PpLdcP8/BukrrFCmykzlvz9ZBNer0VGy4GhbngtASqUP2+lYVel
 0kjjJ1jFIAEGxPCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Message-ID: <20211118165914.pckik75emivsilek@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a revert of commits
   d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")
   6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")

The existing code leads to a different behaviour depending on whether
lockdep is enabled or not. Any following lock that is acquired without
disabling interrupts (but needs to) will not be noticed by lockdep.

This it not just a lockdep annotation but is used but an actual mutex_t
that is properly used as a lock but in case of __timeline_mark_lock()
lockdep is only told that it is acquired but no lock has been acquired.

It appears that its purpose is just satisfy the lockdep_assert_held()
check in intel_context_mark_active(). The other problem with disabling
interrupts is that on PREEMPT_RT interrupts are also disabled which
leads to problems for instance later during memory allocation.

Add a CONTEXT_IS_PARKED bit to intel_engine_cs and set_bit/clear_bit it
instead of mutex_acquire/mutex_release. Use test_bit in the two
identified spots which relied on the lockdep annotation.

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/intel_context.h       |    3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |    1 
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   38 +-------------------------
 drivers/gpu/drm/i915/i915_request.h           |    3 +-
 4 files changed, 7 insertions(+), 38 deletions(-)

--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -211,7 +211,8 @@ static inline void intel_context_enter(s
 
 static inline void intel_context_mark_active(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->timeline->mutex);
+	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
+		       test_bit(CONTEXT_IS_PARKED, &ce->flags));
 	++ce->active_count;
 }
 
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -118,6 +118,7 @@ struct intel_context {
 #define CONTEXT_LRCA_DIRTY		9
 #define CONTEXT_GUC_INIT		10
 #define CONTEXT_PERMA_PIN		11
+#define CONTEXT_IS_PARKED		12
 
 	struct {
 		u64 timeout_us;
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -80,39 +80,6 @@ static int __engine_unpark(struct intel_
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_LOCKDEP)
-
-static unsigned long __timeline_mark_lock(struct intel_context *ce)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	mutex_acquire(&ce->timeline->mutex.dep_map, 2, 0, _THIS_IP_);
-
-	return flags;
-}
-
-static void __timeline_mark_unlock(struct intel_context *ce,
-				   unsigned long flags)
-{
-	mutex_release(&ce->timeline->mutex.dep_map, _THIS_IP_);
-	local_irq_restore(flags);
-}
-
-#else
-
-static unsigned long __timeline_mark_lock(struct intel_context *ce)
-{
-	return 0;
-}
-
-static void __timeline_mark_unlock(struct intel_context *ce,
-				   unsigned long flags)
-{
-}
-
-#endif /* !IS_ENABLED(CONFIG_LOCKDEP) */
-
 static void duration(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct i915_request *rq = to_request(fence);
@@ -159,7 +126,6 @@ static bool switch_to_kernel_context(str
 {
 	struct intel_context *ce = engine->kernel_context;
 	struct i915_request *rq;
-	unsigned long flags;
 	bool result = true;
 
 	/*
@@ -214,7 +180,7 @@ static bool switch_to_kernel_context(str
 	 * engine->wakeref.count, we may see the request completion and retire
 	 * it causing an underflow of the engine->wakeref.
 	 */
-	flags = __timeline_mark_lock(ce);
+	set_bit(CONTEXT_IS_PARKED, &ce->flags);
 	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
 
 	rq = __i915_request_create(ce, GFP_NOWAIT);
@@ -246,7 +212,7 @@ static bool switch_to_kernel_context(str
 
 	result = false;
 out_unlock:
-	__timeline_mark_unlock(ce, flags);
+	clear_bit(CONTEXT_IS_PARKED, &ce->flags);
 	return result;
 }
 
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -642,7 +642,8 @@ i915_request_timeline(const struct i915_
 {
 	/* Valid only while the request is being constructed (or retired). */
 	return rcu_dereference_protected(rq->timeline,
-					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex));
+					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||
+					 test_bit(CONTEXT_IS_PARKED, &rq->context->flags));
 }
 
 static inline struct i915_gem_context *
