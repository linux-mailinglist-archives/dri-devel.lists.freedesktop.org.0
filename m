Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21B43B16B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08826E811;
	Tue, 26 Oct 2021 11:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216596E41B;
 Tue, 26 Oct 2021 11:41:07 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc8jV67fS29/WT6CmOPXJHgsxOFvKbPDijWo4CPtDEU=;
 b=hbyQUDGkLldJxlu4+9I8wYMFyVMDQpuxHfmAdb6A5f1IEp44LItyaJssTR9pUXJrALdNME
 I6ZdYw4E1SHev2c5SX0ajbkFpwOP/uSg0+xck5h4W248inS7Lbcs2zDT5um5jwGUVWrU0U
 G0w0ykpjYkh9H91Fvodt4pf3C3/qFfLrj3rUJ34dbEHqjfosyBkgaiD5Tpix0cyMtfiTPd
 aCs27QVDd7alHsUam2XHlJzBu37QyPix7mDY02bCfVyH/o091U8rwHvtyEDxMzTZ8SXoJh
 2hXhSsQeK/jvs0Rg/9PoAGVnjCXJnnnJA4bP8ftpv3/796Iynl0Q02YBUJqLIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635248465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc8jV67fS29/WT6CmOPXJHgsxOFvKbPDijWo4CPtDEU=;
 b=YDsUdJeRFNyeY3qTMYziI95tpczPNh+0dgB+ylAIMMkbBlXOWH1TvnK6HSgO3/ZMwORNPX
 ilUbNKCu9p9DOCBA==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/9] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Date: Tue, 26 Oct 2021 13:40:52 +0200
Message-Id: <20211026114100.2593433-2-bigeasy@linutronix.de>
In-Reply-To: <20211026114100.2593433-1-bigeasy@linutronix.de>
References: <20211026114100.2593433-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

This is a revert of commits
   d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock =
as irqsafe")
   6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by =
timeline->mutex")

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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Suggested--by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/intel_context.h       |  3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 38 +------------------
 drivers/gpu/drm/i915/i915_request.h           |  3 +-
 4 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915=
/gt/intel_context.h
index 246c37d72cd73..8a575629ef1b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -211,7 +211,8 @@ static inline void intel_context_enter(struct intel_con=
text *ce)
=20
 static inline void intel_context_mark_active(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->timeline->mutex);
+	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
+		       test_bit(CONTEXT_IS_PARKED, &ce->flags));
 	++ce->active_count;
 }
=20
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/dr=
m/i915/gt/intel_context_types.h
index 9e0177dc5484e..329f470d125f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -118,6 +118,7 @@ struct intel_context {
 #define CONTEXT_LRCA_DIRTY		9
 #define CONTEXT_GUC_INIT		10
 #define CONTEXT_PERMA_PIN		11
+#define CONTEXT_IS_PARKED		12
=20
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i9=
15/gt/intel_engine_pm.c
index a1334b48dde7b..456f1f5d0c04e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -80,39 +80,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
 	return 0;
 }
=20
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
 	struct i915_request *rq =3D to_request(fence);
@@ -159,7 +126,6 @@ static bool switch_to_kernel_context(struct intel_engin=
e_cs *engine)
 {
 	struct intel_context *ce =3D engine->kernel_context;
 	struct i915_request *rq;
-	unsigned long flags;
 	bool result =3D true;
=20
 	/*
@@ -214,7 +180,7 @@ static bool switch_to_kernel_context(struct intel_engin=
e_cs *engine)
 	 * engine->wakeref.count, we may see the request completion and retire
 	 * it causing an underflow of the engine->wakeref.
 	 */
-	flags =3D __timeline_mark_lock(ce);
+	set_bit(CONTEXT_IS_PARKED, &ce->flags);
 	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
=20
 	rq =3D __i915_request_create(ce, GFP_NOWAIT);
@@ -246,7 +212,7 @@ static bool switch_to_kernel_context(struct intel_engin=
e_cs *engine)
=20
 	result =3D false;
 out_unlock:
-	__timeline_mark_unlock(ce, flags);
+	clear_bit(CONTEXT_IS_PARKED, &ce->flags);
 	return result;
 }
=20
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i91=
5_request.h
index dc359242d1aec..c5898882bb27a 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -642,7 +642,8 @@ i915_request_timeline(const struct i915_request *rq)
 {
 	/* Valid only while the request is being constructed (or retired). */
 	return rcu_dereference_protected(rq->timeline,
-					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex));
+					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||
+					 test_bit(CONTEXT_IS_PARKED, &rq->context->flags));
 }
=20
 static inline struct i915_gem_context *
--=20
2.33.1

