Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04781390A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C802B6E081;
	Mon, 13 Jan 2020 12:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60B6E063;
 Mon, 13 Jan 2020 12:03:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; 
 d="scan'208,217";a="243980249"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2020 04:03:38 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Subject: [Intel-gfx] [PATCH 5/6] drm/i915: Make WARN* drm specific where
 dev_priv can be extracted.
Date: Mon, 13 Jan 2020 17:25:56 +0530
Message-Id: <20200113115557.32713-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminaryan.bharadiya@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where first function argument is a
struct pointer and has drm_i915_private struct pointer member.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@r exists@
identifier func, s, i;
position p;
@@
func(struct s *i,...) {

<...
\(WARN@p\|WARN_ON@p\|WARN_ONCE@p\|WARN_ON_ONCE@p\)(...)
...>
}

@rr@
identifier r.s,member;
@@

struct s {
        ...
     struct drm_i915_private *member;
        ...
};

@rrr@
identifier r.i, rr.member;
position r.p;
@@
(
-WARN@p
+drm_WARN
   (
+ i915_to_dev(i->member),
...)
|
-WARN_ON@p
+drm_WARN_ON
   (
+ i915_to_dev(i->member),
...)
|
-WARN_ONCE@p
+drm_WARN_ONCE
   (
+ i915_to_dev(i->member),
...)
|
-WARN_ON_ONCE@p
+drm_WARN_ON_ONCE
   (
+ i915_to_dev(i->member),
...)
)

command: spatch  --sp-file <script>  --dir drivers/gpu/drm/i915/ \
   		--in-place  --recursive-includes \
		-I drivers/gpu/drm/i915/ \
		-I drivers/gpu/drm/i915/display/

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c  |  6 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 15 +++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               | 10 ++--
 drivers/gpu/drm/i915/i915_perf.c              |  3 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 55 ++++++++++---------
 8 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index ea7358d92702..fcb2e87b8ad4 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -281,7 +281,7 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 	enum pipe pipe = overlay->crtc->pipe;
 	struct intel_frontbuffer *from = NULL, *to = NULL;
 
-	WARN_ON(overlay->old_vma);
+	drm_WARN_ON(i915_to_dev(overlay->i915), overlay->old_vma);
 
 	if (overlay->vma)
 		from = intel_frontbuffer_get(overlay->vma->obj);
@@ -350,7 +350,7 @@ static void intel_overlay_release_old_vma(struct intel_overlay *overlay)
 	struct i915_vma *vma;
 
 	vma = fetch_and_zero(&overlay->old_vma);
-	if (WARN_ON(!vma))
+	if (drm_WARN_ON(i915_to_dev(overlay->i915), !vma))
 		return;
 
 	intel_frontbuffer_flip_complete(overlay->i915,
@@ -396,7 +396,7 @@ static int intel_overlay_off(struct intel_overlay *overlay)
 	struct i915_request *rq;
 	u32 *cs, flip_addr = overlay->flip_addr;
 
-	WARN_ON(!overlay->active);
+	drm_WARN_ON(i915_to_dev(overlay->i915), !overlay->active);
 
 	/* According to intel docs the overlay hw may hang (when switching
 	 * off) without loading the filter coeffs. It is however unclear whether
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d5a0f5ae4a8b..7c7acaa7efec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1374,8 +1374,8 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		    IS_GEN(eb->i915, 6)) {
 			err = i915_vma_bind(target, target->obj->cache_level,
 					    PIN_GLOBAL, NULL);
-			if (WARN_ONCE(err,
-				      "Unexpected failure to bind target VMA!"))
+			if (drm_WARN_ONCE(i915_to_dev(eb->i915), err,
+					  "Unexpected failure to bind target VMA!"))
 				return err;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1d40cba90c1b..a808200241b3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -320,7 +320,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
 	engine->context_size = intel_engine_context_size(gt, engine->class);
-	if (WARN_ON(engine->context_size > BIT(20)))
+	if (drm_WARN_ON(i915_to_dev(gt->i915), engine->context_size > BIT(20)))
 		engine->context_size = 0;
 	if (engine->context_size)
 		DRIVER_CAPS(gt->i915)->has_logical_contexts = true;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index f796bdf1ed30..8203f181e6f1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -80,8 +80,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 	if (instance == OTHER_GTPM_INSTANCE)
 		return gen11_rps_irq_handler(&gt->rps, iir);
 
-	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
-		  instance, iir);
+	drm_WARN_ONCE(i915_to_dev(gt->i915), 1,
+		      "unhandled other interrupt instance=0x%x, iir=0x%x\n",
+		      instance, iir);
 }
 
 static void
@@ -98,8 +99,9 @@ gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
 	if (likely(engine))
 		return cs_irq_handler(engine, iir);
 
-	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
-		  class, instance);
+	drm_WARN_ONCE(i915_to_dev(gt->i915), 1,
+		      "unhandled engine interrupt class=0x%x, instance=0x%x\n",
+		      class, instance);
 }
 
 static void
@@ -118,8 +120,9 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 	if (class == OTHER_CLASS)
 		return gen11_other_irq_handler(gt, instance, intr);
 
-	WARN_ONCE(1, "unknown interrupt class=0x%x, instance=0x%x, intr=0x%x\n",
-		  class, instance, intr);
+	drm_WARN_ONCE(i915_to_dev(gt->i915), 1,
+		      "unknown interrupt class=0x%x, instance=0x%x, intr=0x%x\n",
+		      class, instance, intr);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
index babe866126d7..3b7df720b49e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
@@ -35,7 +35,7 @@ static void gen6_gt_pm_update_irq(struct intel_gt *gt,
 {
 	u32 new_val;
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	drm_WARN_ON(i915_to_dev(gt->i915), enabled_irq_mask & ~interrupt_mask);
 
 	lockdep_assert_held(&gt->irq_lock);
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 3aa1ddfdd69c..4fe690eb7bb1 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -208,8 +208,9 @@ static void gen3_assert_iir_is_zero(struct intel_uncore *uncore, i915_reg_t reg)
 	if (val == 0)
 		return;
 
-	WARN(1, "Interrupt register 0x%x is not zero: 0x%08x\n",
-	     i915_mmio_reg_offset(reg), val);
+	drm_WARN(i915_to_dev(uncore->i915), 1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",
+		 i915_mmio_reg_offset(reg), val);
 	intel_uncore_write(uncore, reg, 0xffffffff);
 	intel_uncore_posting_read(uncore, reg);
 	intel_uncore_write(uncore, reg, 0xffffffff);
@@ -223,8 +224,9 @@ static void gen2_assert_iir_is_zero(struct intel_uncore *uncore)
 	if (val == 0)
 		return;
 
-	WARN(1, "Interrupt register 0x%x is not zero: 0x%08x\n",
-	     i915_mmio_reg_offset(GEN2_IIR), val);
+	drm_WARN(i915_to_dev(uncore->i915), 1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",
+		 i915_mmio_reg_offset(GEN2_IIR), val);
 	intel_uncore_write16(uncore, GEN2_IIR, 0xffff);
 	intel_uncore_posting_read16(uncore, GEN2_IIR);
 	intel_uncore_write16(uncore, GEN2_IIR, 0xffff);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0f556d80ba36..9bf86d1086a4 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3404,7 +3404,8 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 	 * to have _stream_init check the combination of sample flags more
 	 * thoroughly, but still this is the expected result at this point.
 	 */
-	if (WARN_ON(stream->sample_flags != props->sample_flags)) {
+	if (drm_WARN_ON(i915_to_dev(perf->i915),
+			stream->sample_flags != props->sample_flags)) {
 		ret = -ENODEV;
 		goto err_flags;
 	}
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 7a5a1461b9c0..9e26658a4e16 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -324,8 +324,9 @@ static void __gen6_gt_wait_for_thread_c0(struct intel_uncore *uncore)
 	 * w/a for a sporadic read returning 0 by waiting for the GT
 	 * thread to wake up.
 	 */
-	WARN_ONCE(wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
-		  "GT thread status wait timed out\n");
+	drm_WARN_ONCE(i915_to_dev(uncore->i915),
+		      wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
+		      "GT thread status wait timed out\n");
 }
 
 static void fw_domains_get_with_thread_status(struct intel_uncore *uncore,
@@ -441,7 +442,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
 		cond_resched();
 	}
 
-	WARN_ON(active_domains);
+	drm_WARN_ON(i915_to_dev(uncore->i915), active_domains);
 
 	fw = uncore->fw_domains_active;
 	if (fw)
@@ -757,9 +758,9 @@ void assert_forcewakes_inactive(struct intel_uncore *uncore)
 	if (!uncore->funcs.force_wake_get)
 		return;
 
-	WARN(uncore->fw_domains_active,
-	     "Expected all fw_domains to be inactive, but %08x are still on\n",
-	     uncore->fw_domains_active);
+	drm_WARN(i915_to_dev(uncore->i915), uncore->fw_domains_active,
+		 "Expected all fw_domains to be inactive, but %08x are still on\n",
+		 uncore->fw_domains_active);
 }
 
 void assert_forcewakes_active(struct intel_uncore *uncore,
@@ -779,9 +780,10 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
 	assert_rpm_wakelock_held(uncore->rpm);
 
 	fw_domains &= uncore->fw_domains;
-	WARN(fw_domains & ~uncore->fw_domains_active,
-	     "Expected %08x fw_domains to be active, but %08x are off\n",
-	     fw_domains, fw_domains & ~uncore->fw_domains_active);
+	drm_WARN(i915_to_dev(uncore->i915),
+		 fw_domains & ~uncore->fw_domains_active,
+		 "Expected %08x fw_domains to be active, but %08x are off\n",
+		 fw_domains, fw_domains & ~uncore->fw_domains_active);
 
 	/*
 	 * Check that the caller has an explicit wakeref and we don't mistake
@@ -794,9 +796,9 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
 		if (uncore->fw_domains_timer & domain->mask)
 			expect++; /* pending automatic release */
 
-		if (WARN(actual < expect,
-			 "Expected domain %d to be held awake by caller, count=%d\n",
-			 domain->id, actual))
+		if (drm_WARN(i915_to_dev(uncore->i915), actual < expect,
+			     "Expected domain %d to be held awake by caller, count=%d\n",
+			     domain->id, actual))
 			break;
 	}
 
@@ -866,9 +868,10 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
 	if (entry->domains == FORCEWAKE_ALL)
 		return uncore->fw_domains;
 
-	WARN(entry->domains & ~uncore->fw_domains,
-	     "Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
-	     entry->domains & ~uncore->fw_domains, offset);
+	drm_WARN(i915_to_dev(uncore->i915),
+		 entry->domains & ~uncore->fw_domains,
+		 "Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
+		 entry->domains & ~uncore->fw_domains, offset);
 
 	return entry->domains;
 }
@@ -1158,10 +1161,11 @@ __unclaimed_reg_debug(struct intel_uncore *uncore,
 		      const bool read,
 		      const bool before)
 {
-	if (WARN(check_for_unclaimed_mmio(uncore) && !before,
-		 "Unclaimed %s register 0x%x\n",
-		 read ? "read from" : "write to",
-		 i915_mmio_reg_offset(reg)))
+	if (drm_WARN(i915_to_dev(uncore->i915),
+		     check_for_unclaimed_mmio(uncore) && !before,
+		     "Unclaimed %s register 0x%x\n",
+		     read ? "read from" : "write to",
+		     i915_mmio_reg_offset(reg)))
 		/* Only report the first N failures */
 		i915_modparams.mmio_debug--;
 }
@@ -1436,8 +1440,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
 	if (!d)
 		return -ENOMEM;
 
-	WARN_ON(!i915_mmio_reg_valid(reg_set));
-	WARN_ON(!i915_mmio_reg_valid(reg_ack));
+	drm_WARN_ON(i915_to_dev(uncore->i915), !i915_mmio_reg_valid(reg_set));
+	drm_WARN_ON(i915_to_dev(uncore->i915), !i915_mmio_reg_valid(reg_ack));
 
 	d->uncore = uncore;
 	d->wake_count = 0;
@@ -1482,8 +1486,8 @@ static void fw_domain_fini(struct intel_uncore *uncore,
 		return;
 
 	uncore->fw_domains &= ~BIT(domain_id);
-	WARN_ON(d->wake_count);
-	WARN_ON(hrtimer_cancel(&d->timer));
+	drm_WARN_ON(i915_to_dev(uncore->i915), d->wake_count);
+	drm_WARN_ON(i915_to_dev(uncore->i915), hrtimer_cancel(&d->timer));
 	kfree(d);
 }
 
@@ -2108,7 +2112,7 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
 {
 	enum forcewake_domains fw_domains = 0;
 
-	WARN_ON(!op);
+	drm_WARN_ON(i915_to_dev(uncore->i915), !op);
 
 	if (!intel_uncore_has_forcewake(uncore))
 		return 0;
@@ -2119,7 +2123,8 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
 	if (op & FW_REG_WRITE)
 		fw_domains |= uncore->funcs.write_fw_domains(uncore, reg);
 
-	WARN_ON(fw_domains & ~uncore->fw_domains);
+	drm_WARN_ON(i915_to_dev(uncore->i915),
+		    fw_domains & ~uncore->fw_domains);
 
 	return fw_domains;
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
