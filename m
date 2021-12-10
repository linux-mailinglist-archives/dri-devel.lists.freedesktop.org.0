Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24E470C01
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 21:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6B710E9A8;
	Fri, 10 Dec 2021 20:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B54110E9A8;
 Fri, 10 Dec 2021 20:44:21 +0000 (UTC)
Date: Fri, 10 Dec 2021 21:44:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639169058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3cSJZizPM5SOZeTxlCz45Bv+KLOXB999PGicS/fxsc=;
 b=oADI0UF8OB9Mo+qLA5CmW4/TO4nNR386OgJVqnYb0IwZUsntk3X0yDedrPhysAfObb27r0
 td4jDu1inSxAbur0wnLsDru5kV4ai2YJb29RJIvRD00fd97aT+YQ0Qegm3OW2WptVk/ZdI
 L9htPEQsP3Q5AWzEri8eFmj4k+lGtzjw7kKf9Cdt+Pu/Ss9UzlFI5XBwvwhfRw/z5L7wKB
 /jwPs3HM8RjzSpKttaVDop1BVNpyQSY0EYYx2bQRlivm93p+VKTO9FGLjxgvtQVnUErVPG
 LMZpb1okc8LeaFvhkyO9FY1bYqbVmKgtCd0xLV5SeBIBMGQJKV2BoTNdVogJ5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639169058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3cSJZizPM5SOZeTxlCz45Bv+KLOXB999PGicS/fxsc=;
 b=FDLo1uLPWEP9xsSvpNVaJd+ZEwMySkdqp24k/0Wu40p1Ot+1YvpI51y3xuNGhfrEaUrIMq
 YDpR14N7K3HTZpDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v2] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Message-ID: <YbO8Ie1Nj7XcQPNQ@linutronix.de>
References: <20211118165914.pckik75emivsilek@linutronix.de>
 <c34cd01e-ff00-5137-5dc4-0085157328d2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c34cd01e-ff00-5137-5dc4-0085157328d2@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a revert of commits
   d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock =
as irqsafe")
   6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by =
timeline->mutex")
   6dcb85a0ad990 ("drm/i915: Hold irq-off for the entire fake lock period")

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

Add a CONTEXT_IS_PARKING bit to intel_engine_cs and set_bit/clear_bit it
instead of mutex_acquire/mutex_release. Use test_bit in the two
identified spots which relied on the lockdep annotation.

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
v1=E2=80=A6v2:
 - Add commit 6dcb85a0ad990 as reference.
 - Name the bit CONTEXT_IS_PARKING.

 drivers/gpu/drm/i915/gt/intel_context.h       |  3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 38 +------------------
 drivers/gpu/drm/i915/i915_request.h           |  3 +-
 4 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915=
/gt/intel_context.h
index 246c37d72cd73..d8c74bbf9aae2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -211,7 +211,8 @@ static inline void intel_context_enter(struct intel_con=
text *ce)
=20
 static inline void intel_context_mark_active(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->timeline->mutex);
+	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
+		       test_bit(CONTEXT_IS_PARKING, &ce->flags));
 	++ce->active_count;
 }
=20
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/dr=
m/i915/gt/intel_context_types.h
index 9e0177dc5484e..30cd81ad8911a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -118,6 +118,7 @@ struct intel_context {
 #define CONTEXT_LRCA_DIRTY		9
 #define CONTEXT_GUC_INIT		10
 #define CONTEXT_PERMA_PIN		11
+#define CONTEXT_IS_PARKING		12
=20
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i9=
15/gt/intel_engine_pm.c
index a1334b48dde7b..a8a2ad44b7e39 100644
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
+	set_bit(CONTEXT_IS_PARKING, &ce->flags);
 	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
=20
 	rq =3D __i915_request_create(ce, GFP_NOWAIT);
@@ -246,7 +212,7 @@ static bool switch_to_kernel_context(struct intel_engin=
e_cs *engine)
=20
 	result =3D false;
 out_unlock:
-	__timeline_mark_unlock(ce, flags);
+	clear_bit(CONTEXT_IS_PARKING, &ce->flags);
 	return result;
 }
=20
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i91=
5_request.h
index dc359242d1aec..b7fe67405fd32 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -642,7 +642,8 @@ i915_request_timeline(const struct i915_request *rq)
 {
 	/* Valid only while the request is being constructed (or retired). */
 	return rcu_dereference_protected(rq->timeline,
-					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex));
+					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||
+					 test_bit(CONTEXT_IS_PARKING, &rq->context->flags));
 }
=20
 static inline struct i915_gem_context *
--=20
2.34.1

