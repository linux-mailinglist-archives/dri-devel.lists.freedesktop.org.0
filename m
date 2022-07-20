Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503C57B45A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 12:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7149111AA87;
	Wed, 20 Jul 2022 10:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4468611A9AA;
 Wed, 20 Jul 2022 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658312242; x=1689848242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sKTg/cxmjQFFA2PT+4EoY9b2fRVQDMlbYHkI/BKCTMI=;
 b=eUhCnaOwhTVgAOGhClkXLvxp8lIhTqfqHmfG1v5I7przilkOmwGxIf4H
 MmM6L1NH/AGZsImN11xsi0ljFoXgGHG8szZuvSLreJ2qcffwVeeswoiM/
 Ek7aC1gULe4wN7U3BiXqe2BYmrNhYNDqVxiGc4lGEZOAiirqGdYGpNsCb
 nywG1OT1BJ6ZQJ6tcGP9gzw/ZRpJuf0lUOnTkKMPT4Brw+bO5UKwGXcTB
 1+K+UGOXXsUWCjXKt1/riAN9PUiGF3+IkfTriLVse60T+5ZYZqI2DIJLr
 u/kfsuqXlmh9dEUQKBlHTFPDw6s6Kw6wbcnwggpVIlY2SeP3wQQEG0Uwa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269764455"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="269764455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 03:17:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="625604506"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.21.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 03:17:18 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/i915/gem: Perform active shrinking from a
 background thread
Date: Wed, 20 Jul 2022 12:16:52 +0200
Message-Id: <20220720101652.93293-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720101652.93293-1-janusz.krzysztofik@linux.intel.com>
References: <20220720101652.93293-1-janusz.krzysztofik@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

i915 is very greedy and will retain system pages for as long as the user
requires them; once acquired they will be only returned when the object
is freed. In order to respond to system memory pressure, i915 hooks into
the shrinker subsystem, designed to prune the filesystem caches, to
unbind and return system pages. However, we can only do so if the device
is active at that moment, as we cannot resume the device from inside
direct reclaim to unbind pages from the GPU, nor do we want to delay
random processes with unbound waits trying to reclaim active pages. To
workaround that quandary, what we avoided in direct reclaim we
delegated to kswapd, as that is run from process context outside of
direct reclaim and able to sleep and resume the device.

In practice, kswapd also uses fs_reclaim_acquire() around its
shrink_slab calls, prohibiting runtime resume. If we cannot wake the
device from idle, we will retain system memory indefinitely.

As we cannot take advantage of kswapd's decoupled process context to
perform an active reclaim of bound pages, spawn our own kthread to wait
under our wakeref. Similar to kswapd, there is no direct dependency on
the background task to direct reclaim (other than failure to promptly
return pages will implicitly result in oom), as such the task itself does
not inherit the fs-reclaim context. A page reclaimed by i915 will
typically not immediately be available for re-use, as it will require
writeback, and so only a future allocation attempt may benefit.
Concurrent page allocation attempts do not wait for either kswapd or our
own swapper task.

We mark our kthread as a memallocator (allowed to dip into memory
reserves, but not allowed to trigger direct reclaim) and mark up
the call to the shrinker with a fs_reclaim critical section. This
should prevent us from accidentally abusing the background swapper task,
and so the swapper kthread behaves like kswapd with the exception of
being allowed to wake the device up, and being decoupled from the
shrinker_rwsem.

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6449
Fixes: 178a30c90ac7 ("drm/i915: Unbind objects in shrinker only if device is runtime active")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: stable@vger.kernel.org # v4.8+
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 134 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_drv.h              |  15 +++
 2 files changed, 135 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 1030053571a2..bc6c1978e64a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -310,6 +310,113 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	return count;
 }
 
+static unsigned long run_swapper(struct drm_i915_private *i915,
+				 unsigned long target,
+				 unsigned long *nr_scanned)
+{
+	return i915_gem_shrink(NULL, i915,
+			       target, nr_scanned,
+			       I915_SHRINK_ACTIVE |
+			       I915_SHRINK_BOUND |
+			       I915_SHRINK_UNBOUND |
+			       I915_SHRINK_WRITEBACK);
+}
+
+static int swapper(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	atomic_long_t *target = &i915->mm.swapper.target;
+	unsigned int noreclaim_state;
+
+	/*
+	 * For us to be running the swapper implies that the system is under
+	 * enough memory pressure to be swapping. At that point, we both want
+	 * to ensure we make forward progress in order to reclaim pages from
+	 * the device and not contribute further to direct reclaim pressure. We
+	 * mark ourselves as a memalloc task in order to not trigger direct
+	 * reclaim ourselves, but dip into the system memory reserves for
+	 * shrinkers.
+	 */
+	noreclaim_state = memalloc_noreclaim_save();
+
+	do {
+		intel_wakeref_t wakeref;
+
+		___wait_var_event(target,
+				  atomic_long_read(target) ||
+				  kthread_should_stop(),
+				  TASK_IDLE, 0, 0, schedule());
+		if (kthread_should_stop())
+			break;
+
+		with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+			unsigned long nr_scan = atomic_long_xchg(target, 0);
+
+			/*
+			 * Now that we have woken up the device hierarchy,
+			 * act as a normal shrinker. Our shrinker is primarily
+			 * focussed on supporting direct reclaim (low latency,
+			 * avoiding contention that may lead to more reclaim,
+			 * or prevent that reclaim from making forward progress)
+			 * and we wish to continue that good practice even
+			 * here where we could accidentally sleep holding locks.
+			 *
+			 * Let lockdep know and warn us about any bad practice
+			 * that may lead to high latency in direct reclaim, or
+			 * anywhere else.
+			 *
+			 * While the swapper is active, direct reclaim from
+			 * other threads will also be running in parallel
+			 * through i915_gem_shrink(), scouring for idle pages.
+			 */
+			fs_reclaim_acquire(GFP_KERNEL);
+			run_swapper(i915, nr_scan, &nr_scan);
+			fs_reclaim_release(GFP_KERNEL);
+		}
+	} while (1);
+
+	memalloc_noreclaim_restore(noreclaim_state);
+	return 0;
+}
+
+static void start_swapper(struct drm_i915_private *i915)
+{
+	i915->mm.swapper.tsk = kthread_run(swapper, i915, "i915-swapd");
+	if (IS_ERR(i915->mm.swapper.tsk))
+		drm_err(&i915->drm,
+			"Failed to launch swapper; memory reclaim may be degraded\n");
+}
+
+static unsigned long kick_swapper(struct drm_i915_private *i915,
+				  unsigned long nr_scan,
+				  unsigned long *scanned)
+{
+	/* Run immediately under kswap if disabled */
+	if (IS_ERR_OR_NULL(i915->mm.swapper.tsk))
+		/*
+		 * Note that as we are still inside kswapd, we are still
+		 * inside a fs_reclaim context and cannot forcibly wake the
+		 * device and so can only opportunitiscally reclaim bound
+		 * memory.
+		 */
+		return run_swapper(i915, nr_scan, scanned);
+
+	if (!atomic_long_fetch_add(nr_scan, &i915->mm.swapper.target))
+		wake_up_var(&i915->mm.swapper.target);
+
+	return 0;
+}
+
+static void stop_swapper(struct drm_i915_private *i915)
+{
+	struct task_struct *tsk = fetch_and_zero(&i915->mm.swapper.tsk);
+
+	if (IS_ERR_OR_NULL(tsk))
+		return;
+
+	kthread_stop(tsk);
+}
+
 static unsigned long
 i915_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
@@ -318,27 +425,22 @@ i915_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	unsigned long freed;
 
 	sc->nr_scanned = 0;
-
 	freed = i915_gem_shrink(NULL, i915,
 				sc->nr_to_scan,
 				&sc->nr_scanned,
 				I915_SHRINK_BOUND |
 				I915_SHRINK_UNBOUND);
-	if (sc->nr_scanned < sc->nr_to_scan && current_is_kswapd()) {
-		intel_wakeref_t wakeref;
+	if (!sc->nr_scanned) /* nothing left to reclaim */
+		return SHRINK_STOP;
 
-		with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-			freed += i915_gem_shrink(NULL, i915,
-						 sc->nr_to_scan - sc->nr_scanned,
-						 &sc->nr_scanned,
-						 I915_SHRINK_ACTIVE |
-						 I915_SHRINK_BOUND |
-						 I915_SHRINK_UNBOUND |
-						 I915_SHRINK_WRITEBACK);
-		}
-	}
+	/* Pages still bound and system is failing with direct reclaim? */
+	if (sc->nr_scanned < sc->nr_to_scan && current_is_kswapd())
+		/* Defer high latency tasks to a background thread. */
+		freed += kick_swapper(i915,
+				      sc->nr_to_scan - sc->nr_scanned,
+				      &sc->nr_scanned);
 
-	return sc->nr_scanned ? freed : SHRINK_STOP;
+	return freed;
 }
 
 static int
@@ -434,10 +536,14 @@ void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 	i915->mm.vmap_notifier.notifier_call = i915_gem_shrinker_vmap;
 	drm_WARN_ON(&i915->drm,
 		    register_vmap_purge_notifier(&i915->mm.vmap_notifier));
+
+	start_swapper(i915);
 }
 
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 {
+	stop_swapper(i915);
+
 	drm_WARN_ON(&i915->drm,
 		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
 	drm_WARN_ON(&i915->drm,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3364a6e5169b..976983ab67a9 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -283,6 +283,21 @@ struct i915_gem_mm {
 	/* shrinker accounting, also useful for userland debugging */
 	u64 shrink_memory;
 	u32 shrink_count;
+
+	/* background task for returning bound system pages */
+	struct {
+		struct task_struct *tsk; /* our kswapd equivalent */
+
+		/*
+		 * Track the number of pages do_shrink_slab() has asked us
+		 * to reclaim, and we have failed to find. This count of
+		 * outstanding reclaims is passed to the swapper thread,
+		 * which then blocks as it tries to achieve that goal.
+		 * It is likely that the target overshoots due to the
+		 * latency between our thread and kswapd making new requests.
+		 */
+		atomic_long_t target;
+	} swapper;
 };
 
 #define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
-- 
2.25.1

