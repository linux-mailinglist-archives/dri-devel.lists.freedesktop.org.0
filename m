Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28466422BB1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C456EB88;
	Tue,  5 Oct 2021 15:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05E46E41B;
 Tue,  5 Oct 2021 15:00:53 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIBdNbRo3qEtIskojock8csyDFFmX2v2M3GWFBdGtCQ=;
 b=1e6ueLYJHvqorRh7sSvC3BbHwLvMlXYWcdJ+rNURK88XdrMa+2BcgOrlIhKwTFPInpCYOa
 F86YQBKFwzrUIUo+NoiZLWC6U0Zp7UziU4Zdtm6U3ZSyg71lM3/axr1tn9qFNxyryo34Ok
 bIgiWKppikDf1OtdeZn40i2bKn13XQJlRtJRC5LGyYVxcbyXEpU9nwJuyBzvrZlnUHfNaE
 IH7N39pnksjt52SuKNJcFqAwNDpxK9Ft003qiZjH73XNGPc89In14hedkJoYQ8hmWSmvY6
 sFMgTOxCONtl7hOZ4GWorxr74mPLb7xQAvSSBIz8cuTCToS2mhG9ZCDu1U27JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIBdNbRo3qEtIskojock8csyDFFmX2v2M3GWFBdGtCQ=;
 b=+S1jox+CCWYO4vPB2neLGLR9diOIyc4CIncZ4a8/+mSvci2Hz+KBGK3l2F+YLoksaabsIB
 QDBo7X0H1gHrEoAA==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 8/8] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Date: Tue,  5 Oct 2021 17:00:46 +0200
Message-Id: <20211005150046.1000285-9-bigeasy@linutronix.de>
In-Reply-To: <20211005150046.1000285-1-bigeasy@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
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

The existing code leads to a different behaviour depending on wheather
lockdep is enabled or not. Any following lock that is acquired without
disabling interrupts (but needs to) will not be noticed by lockdep.

This it not just a lockdep annotation but is used but an actual mutex_t
that is properly used as a lock but in case of __timeline_mark_lock()
lockdep is only told that it is acquired but no lock has been acquired.

It appears that its purporse is just satisfy the lockdep_assert_held()
check in intel_context_mark_active(). The other problem with disabling
interrupts is that on PREEMPT_RT interrupts are also disabled which
leads to problems for instance later during memory allocation.

Add an argument to intel_context_mark_active() which is true if the lock
must have been acquired, false if other magic is involved and the lock
is not needed. Use the `false' argument only from within
switch_to_kernel_context() and remove __timeline_mark_lock().

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/intel_context.h       |  6 ++-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 38 +------------------
 drivers/gpu/drm/i915/i915_request.c           |  7 ++--
 drivers/gpu/drm/i915/i915_request.h           |  3 +-
 5 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915=
/gt/intel_context.h
index c410989507466..bed60dff93eff 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -161,9 +161,11 @@ static inline void intel_context_enter(struct intel_co=
ntext *ce)
 		ce->ops->enter(ce);
 }
=20
-static inline void intel_context_mark_active(struct intel_context *ce)
+static inline void intel_context_mark_active(struct intel_context *ce,
+					     bool timeline_mutex_needed)
 {
-	lockdep_assert_held(&ce->timeline->mutex);
+	if (timeline_mutex_needed)
+		lockdep_assert_held(&ce->timeline->mutex);
 	++ce->active_count;
 }
=20
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu=
/drm/i915/gt/intel_engine_heartbeat.c
index 74775ae961b2b..02c0ab9fbb4b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -42,7 +42,7 @@ heartbeat_create(struct intel_context *ce, gfp_t gfp)
 	struct i915_request *rq;
=20
 	intel_context_enter(ce);
-	rq =3D __i915_request_create(ce, gfp);
+	rq =3D __i915_request_create(ce, gfp, true);
 	intel_context_exit(ce);
=20
 	return rq;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i9=
15/gt/intel_engine_pm.c
index 1f07ac4e0672a..d75638d1d561e 100644
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
 	/* GPU is pointing to the void, as good as in the kernel context. */
@@ -201,10 +167,9 @@ static bool switch_to_kernel_context(struct intel_engi=
ne_cs *engine)
 	 * engine->wakeref.count, we may see the request completion and retire
 	 * it causing an underflow of the engine->wakeref.
 	 */
-	flags =3D __timeline_mark_lock(ce);
 	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
=20
-	rq =3D __i915_request_create(ce, GFP_NOWAIT);
+	rq =3D __i915_request_create(ce, GFP_NOWAIT, false);
 	if (IS_ERR(rq))
 		/* Context switch failed, hope for the best! Maybe reset? */
 		goto out_unlock;
@@ -233,7 +198,6 @@ static bool switch_to_kernel_context(struct intel_engin=
e_cs *engine)
=20
 	result =3D false;
 out_unlock:
-	__timeline_mark_unlock(ce, flags);
 	return result;
 }
=20
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i91=
5_request.c
index b9dd6100c6d17..3bab8f651b4e7 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -833,7 +833,8 @@ static void __i915_request_ctor(void *arg)
 }
=20
 struct i915_request *
-__i915_request_create(struct intel_context *ce, gfp_t gfp)
+__i915_request_create(struct intel_context *ce, gfp_t gfp,
+		      bool timeline_mutex_needed)
 {
 	struct intel_timeline *tl =3D ce->timeline;
 	struct i915_request *rq;
@@ -957,7 +958,7 @@ __i915_request_create(struct intel_context *ce, gfp_t g=
fp)
=20
 	rq->infix =3D rq->ring->emit; /* end of header; start of user payload */
=20
-	intel_context_mark_active(ce);
+	intel_context_mark_active(ce, timeline_mutex_needed);
 	list_add_tail_rcu(&rq->link, &tl->requests);
=20
 	return rq;
@@ -993,7 +994,7 @@ i915_request_create(struct intel_context *ce)
 		i915_request_retire(rq);
=20
 	intel_context_enter(ce);
-	rq =3D __i915_request_create(ce, GFP_KERNEL);
+	rq =3D __i915_request_create(ce, GFP_KERNEL, true);
 	intel_context_exit(ce); /* active reference transferred to request */
 	if (IS_ERR(rq))
 		goto err_unlock;
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i91=
5_request.h
index 1bc1349ba3c25..ba1ced79c8d2c 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -320,7 +320,8 @@ static inline bool dma_fence_is_i915(const struct dma_f=
ence *fence)
 struct kmem_cache *i915_request_slab_cache(void);
=20
 struct i915_request * __must_check
-__i915_request_create(struct intel_context *ce, gfp_t gfp);
+__i915_request_create(struct intel_context *ce, gfp_t gfp,
+		      bool timeline_mutex_needed);
 struct i915_request * __must_check
 i915_request_create(struct intel_context *ce);
=20
--=20
2.33.0

