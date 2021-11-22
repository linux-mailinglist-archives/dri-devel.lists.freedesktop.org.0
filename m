Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7194596FC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 22:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9293989DFB;
	Mon, 22 Nov 2021 21:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358789DFB;
 Mon, 22 Nov 2021 21:51:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="298301898"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="298301898"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:51:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="674220281"
Received: from jbouche-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.199])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:51:33 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/i915: Use to_root_gt() to refer to the root tile
Date: Mon, 22 Nov 2021 23:51:14 +0200
Message-Id: <20211122215114.1812-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211122215114.1812-1-andi.shyti@linux.intel.com>
References: <20211122215114.1812-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Michal=C5=82Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from a patch from Matt to_root_gt() returns the
reference to the root tile in order to abstract the root tile
from th callers.

Being the root tile identified as tile '0', embed the id in the
name so that i915->gt becomes i915->gt0.

The renaming has been mostly done with the following command and
some manual fixes.

sed -i -e sed -i 's/\&i915\->gt\./\&to_root_gt(i915)\->/g' \
	-e sed -i 's/\&dev_priv\->gt\./\&to_root_gt(dev_priv)\->/g' \
	-e 's/\&dev_priv\->gt/to_root_gt(dev_priv)/g' \
	-e 's/\&i915\->gt/to_root_gt(i915)/g' \
	-e 's/dev_priv\->gt\./to_root_gt(dev_priv)\->/g' \
	-e 's/i915\->gt\./to_root_gt(i915)\->/g' \
	`find drivers/gpu/drm/i915/ -name *.[ch]`

Two small changes have been added to this commit:

 1. intel_reset_gpu() in intel_display.c retreives the gt from
    to_scanout_gt()
 2. in set_scheduler_caps() the gt is taken from the engine and
    not from i915.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 23 +++++---
 drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 22 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 12 ++--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  4 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 10 ++--
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 28 +++++-----
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 12 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  3 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         | 10 ++--
 drivers/gpu/drm/i915/gt/selftest_context.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine.c     |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  6 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |  8 +--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  4 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  4 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  6 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  6 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           | 38 ++++++-------
 drivers/gpu/drm/i915/i915_debugfs_params.c    |  4 +-
 drivers/gpu/drm/i915/i915_driver.c            | 30 +++++-----
 drivers/gpu/drm/i915/i915_drv.h               |  9 ++-
 drivers/gpu/drm/i915/i915_gem.c               | 16 +++---
 drivers/gpu/drm/i915/i915_getparam.c          | 10 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  4 +-
 drivers/gpu/drm/i915/i915_irq.c               | 56 +++++++++----------
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c               | 14 ++---
 drivers/gpu/drm/i915/i915_query.c             |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c             | 22 ++++----
 drivers/gpu/drm/i915/intel_gvt.c              |  2 +-
 drivers/gpu/drm/i915/intel_wopcm.c            |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  6 +-
 drivers/gpu/drm/i915/selftests/i915_active.c  |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  2 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  6 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 10 ++--
 .../gpu/drm/i915/selftests/i915_selftest.c    |  4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |  2 +-
 .../gpu/drm/i915/selftests/igt_live_test.c    |  4 +-
 .../drm/i915/selftests/intel_memory_region.c  |  4 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 28 +++++-----
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  6 +-
 drivers/gpu/drm/i915/selftests/mock_uncore.c  |  2 +-
 74 files changed, 275 insertions(+), 257 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e3a0bfb7be841..b04c6a4f77db7 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -818,7 +818,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	 * maximum clocks following a vblank miss (see do_rps_boost()).
 	 */
 	if (!state->rps_interactive) {
-		intel_rps_mark_interactive(&dev_priv->gt.rps, true);
+		intel_rps_mark_interactive(&to_root_gt(dev_priv)->rps, true);
 		state->rps_interactive = true;
 	}
 
@@ -852,7 +852,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 		return;
 
 	if (state->rps_interactive) {
-		intel_rps_mark_interactive(&dev_priv->gt.rps, false);
+		intel_rps_mark_interactive(&to_root_gt(dev_priv)->rps, false);
 		state->rps_interactive = false;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f3c9208a30b16..897340fe65988 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -124,6 +124,11 @@ static void ilk_pfit_enable(const struct intel_crtc_state *crtc_state);
 static void intel_modeset_setup_hw_state(struct drm_device *dev,
 					 struct drm_modeset_acquire_ctx *ctx);
 
+static struct intel_gt *to_scanout_gt(struct drm_i915_private *i915)
+{
+	return i915->ggtt.vm.gt;
+}
+
 /**
  * intel_update_watermarks - update FIFO watermark values based on current modes
  * @dev_priv: i915 device
@@ -838,7 +843,7 @@ __intel_display_resume(struct drm_device *dev,
 static bool gpu_reset_clobbers_display(struct drm_i915_private *dev_priv)
 {
 	return (INTEL_INFO(dev_priv)->gpu_reset_clobbers_display &&
-		intel_has_gpu_reset(&dev_priv->gt));
+		intel_has_gpu_reset(to_scanout_gt(dev_priv)));
 }
 
 void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
@@ -857,14 +862,14 @@ void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
 		return;
 
 	/* We have a modeset vs reset deadlock, defensively unbreak it. */
-	set_bit(I915_RESET_MODESET, &dev_priv->gt.reset.flags);
+	set_bit(I915_RESET_MODESET, &to_root_gt(dev_priv)->reset.flags);
 	smp_mb__after_atomic();
-	wake_up_bit(&dev_priv->gt.reset.flags, I915_RESET_MODESET);
+	wake_up_bit(&to_root_gt(dev_priv)->reset.flags, I915_RESET_MODESET);
 
 	if (atomic_read(&dev_priv->gpu_error.pending_fb_pin)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Modeset potentially stuck, unbreaking through wedging\n");
-		intel_gt_set_wedged(&dev_priv->gt);
+		intel_gt_set_wedged(to_root_gt(dev_priv));
 	}
 
 	/*
@@ -915,7 +920,7 @@ void intel_display_finish_reset(struct drm_i915_private *dev_priv)
 		return;
 
 	/* reset doesn't touch the display */
-	if (!test_bit(I915_RESET_MODESET, &dev_priv->gt.reset.flags))
+	if (!test_bit(I915_RESET_MODESET, &to_root_gt(dev_priv)->reset.flags))
 		return;
 
 	state = fetch_and_zero(&dev_priv->modeset_restore_state);
@@ -953,7 +958,7 @@ void intel_display_finish_reset(struct drm_i915_private *dev_priv)
 	drm_modeset_acquire_fini(ctx);
 	mutex_unlock(&dev->mode_config.mutex);
 
-	clear_bit_unlock(I915_RESET_MODESET, &dev_priv->gt.reset.flags);
+	clear_bit_unlock(I915_RESET_MODESET, &to_root_gt(dev_priv)->reset.flags);
 }
 
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
@@ -8550,19 +8555,19 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 	for (;;) {
 		prepare_to_wait(&intel_state->commit_ready.wait,
 				&wait_fence, TASK_UNINTERRUPTIBLE);
-		prepare_to_wait(bit_waitqueue(&dev_priv->gt.reset.flags,
+		prepare_to_wait(bit_waitqueue(&to_root_gt(dev_priv)->reset.flags,
 					      I915_RESET_MODESET),
 				&wait_reset, TASK_UNINTERRUPTIBLE);
 
 
 		if (i915_sw_fence_done(&intel_state->commit_ready) ||
-		    test_bit(I915_RESET_MODESET, &dev_priv->gt.reset.flags))
+		    test_bit(I915_RESET_MODESET, &to_root_gt(dev_priv)->reset.flags))
 			break;
 
 		schedule();
 	}
 	finish_wait(&intel_state->commit_ready.wait, &wait_fence);
-	finish_wait(bit_waitqueue(&dev_priv->gt.reset.flags,
+	finish_wait(bit_waitqueue(&to_root_gt(dev_priv)->reset.flags,
 				  I915_RESET_MODESET),
 		    &wait_reset);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 56755788547d2..16c9447fff6f4 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -258,7 +258,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
 
 	vm = &dpt->vm;
 
-	vm->gt = &i915->gt;
+	vm->gt = to_root_gt(i915);
 	vm->i915 = i915;
 	vm->dma = i915->drm.dev;
 	vm->total = (size / sizeof(gen8_pte_t)) * I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 7e3f5c6ca4846..1c6e844cf1697 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1382,7 +1382,7 @@ void intel_overlay_setup(struct drm_i915_private *dev_priv)
 	if (!HAS_OVERLAY(dev_priv))
 		return;
 
-	engine = dev_priv->gt.engine[RCS0];
+	engine = to_root_gt(dev_priv)->engine[RCS0];
 	if (!engine || !engine->kernel_context)
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 28890876bdebf..90c14240f6a4e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1727,7 +1727,7 @@ static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	return intel_pxp_key_check(&i915->gt.pxp, obj, false) == 0;
+	return intel_pxp_key_check(&to_root_gt(i915)->pxp, obj, false) == 0;
 }
 
 static bool pxp_is_borked(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ebd775cb1661c..09a04f5dcc4e2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -237,7 +237,7 @@ static int proto_context_set_persistence(struct drm_i915_private *i915,
 		 * colateral damage, and we should not pretend we can by
 		 * exposing the interface.
 		 */
-		if (!intel_has_reset_engine(&i915->gt))
+		if (!intel_has_reset_engine(to_root_gt(i915)))
 			return -ENODEV;
 
 		pc->user_flags &= ~BIT(UCONTEXT_PERSISTENCE);
@@ -254,7 +254,7 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 
 	if (!protected) {
 		pc->uses_protected_content = false;
-	} else if (!intel_pxp_is_enabled(&i915->gt.pxp)) {
+	} else if (!intel_pxp_is_enabled(&to_root_gt(i915)->pxp)) {
 		ret = -ENODEV;
 	} else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
 		   !(pc->user_flags & BIT(UCONTEXT_BANNABLE))) {
@@ -268,8 +268,8 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 		 */
 		pc->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-		if (!intel_pxp_is_active(&i915->gt.pxp))
-			ret = intel_pxp_start(&i915->gt.pxp);
+		if (!intel_pxp_is_active(&to_root_gt(i915)->pxp))
+			ret = intel_pxp_start(&to_root_gt(i915)->pxp);
 	}
 
 	return ret;
@@ -571,7 +571,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	intel_engine_mask_t prev_mask;
 
 	/* FIXME: This is NIY for execlists */
-	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
+	if (!(intel_uc_uses_guc_submission(&to_root_gt(i915)->uc)))
 		return -ENODEV;
 
 	if (get_user(slot, &ext->engine_index))
@@ -833,7 +833,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
 		sseu = &pc->legacy_rcs_sseu;
 	}
 
-	ret = i915_gem_user_to_context_sseu(&i915->gt, &user_sseu, sseu);
+	ret = i915_gem_user_to_context_sseu(to_root_gt(i915), &user_sseu, sseu);
 	if (ret)
 		return ret;
 
@@ -1044,7 +1044,7 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 						struct intel_sseu rcs_sseu)
 {
-	const struct intel_gt *gt = &ctx->i915->gt;
+	const struct intel_gt *gt = to_root_gt(ctx->i915);
 	struct intel_engine_cs *engine;
 	struct i915_gem_engines *e, *err;
 	enum intel_engine_id id;
@@ -1521,7 +1521,7 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
 		 * colateral damage, and we should not pretend we can by
 		 * exposing the interface.
 		 */
-		if (!intel_has_reset_engine(&ctx->i915->gt))
+		if (!intel_has_reset_engine(to_root_gt(ctx->i915)))
 			return -ENODEV;
 
 		i915_gem_context_clear_persistence(ctx);
@@ -1559,7 +1559,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	} else if (HAS_FULL_PPGTT(i915)) {
 		struct i915_ppgtt *ppgtt;
 
-		ppgtt = i915_ppgtt_create(&i915->gt, 0);
+		ppgtt = i915_ppgtt_create(to_root_gt(i915), 0);
 		if (IS_ERR(ppgtt)) {
 			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
 				PTR_ERR(ppgtt));
@@ -1742,7 +1742,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags)
 		return -EINVAL;
 
-	ppgtt = i915_ppgtt_create(&i915->gt, 0);
+	ppgtt = i915_ppgtt_create(to_root_gt(i915), 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
@@ -2194,7 +2194,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & I915_CONTEXT_CREATE_FLAGS_UNKNOWN)
 		return -EINVAL;
 
-	ret = intel_gt_terminally_wedged(&i915->gt);
+	ret = intel_gt_terminally_wedged(to_root_gt(i915));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 8955d6abcef12..0d9a1fbf76188 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -379,7 +379,7 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
 	if (ext.flags)
 		return -EINVAL;
 
-	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
+	if (!intel_pxp_is_enabled(&to_root_gt(ext_data->i915)->pxp))
 		return -ENODEV;
 
 	ext_data->flags |= I915_BO_PROTECTED;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9f7c6ecadb901..cef3a0b6dfa9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2287,9 +2287,9 @@ static int eb_submit(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int num_vcs_engines(const struct drm_i915_private *i915)
+static int num_vcs_engines(struct drm_i915_private *i915)
 {
-	return hweight_long(VDBOX_MASK(&i915->gt));
+	return hweight_long(VDBOX_MASK(to_root_gt(i915)));
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 65fc6ff5f59da..a0545f61f054e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -645,7 +645,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 		goto insert;
 
 	/* Attempt to reap some mmap space from dead objects */
-	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
+	err = intel_gt_retire_requests_timeout(to_root_gt(i915), MAX_SCHEDULE_TIMEOUT,
 					       NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 7986612f48fad..d85e22c882e37 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -19,6 +19,7 @@
 static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 {
 	struct address_space *mapping = obj->base.filp->f_mapping;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct scatterlist *sg;
 	struct sg_table *st;
 	dma_addr_t dma;
@@ -73,7 +74,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 		dst += PAGE_SIZE;
 	}
 
-	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
+	intel_gt_chipset_flush(to_root_gt(i915));
 
 	/* We're no longer struct page backed */
 	obj->mem_flags &= ~I915_BO_FLAG_STRUCT_PAGE;
@@ -140,6 +141,7 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 {
 	void *vaddr = sg_page(obj->mm.pages->sgl) + args->offset;
 	char __user *user_data = u64_to_user_ptr(args->data_ptr);
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int err;
 
 	err = i915_gem_object_wait(obj,
@@ -159,7 +161,7 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 		return -EFAULT;
 
 	drm_clflush_virt_range(vaddr, args->size);
-	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
+	intel_gt_chipset_flush(to_root_gt(i915));
 
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 726b40e1fbb05..84440bf17ca9e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -35,7 +35,7 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 	 * state. Fortunately, the kernel_context is disposable and we do
 	 * not rely on its state.
 	 */
-	intel_gt_suspend_prepare(&i915->gt);
+	intel_gt_suspend_prepare(to_root_gt(i915));
 
 	i915_gem_drain_freed_objects(i915);
 }
@@ -153,7 +153,7 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 	 * machine in an unusable condition.
 	 */
 
-	intel_gt_suspend_late(&i915->gt);
+	intel_gt_suspend_late(to_root_gt(i915));
 
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
 	for (phase = phases; *phase; phase++) {
@@ -223,7 +223,7 @@ void i915_gem_resume(struct drm_i915_private *i915)
 	 * guarantee that the context image is complete. So let's just reset
 	 * it and start again.
 	 */
-	intel_gt_resume(&i915->gt);
+	intel_gt_resume(to_root_gt(i915));
 
 	ret = lmem_restore(i915, I915_TTM_BACKUP_ALLOW_GPU);
 	GEM_WARN_ON(ret);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index dde0a5c232f85..57d70402b7c88 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -153,7 +153,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	 */
 	if (shrink & I915_SHRINK_ACTIVE)
 		/* Retire requests to unpin all idle contexts */
-		intel_gt_retire_requests(&i915->gt);
+		intel_gt_retire_requests(to_root_gt(i915));
 
 	/*
 	 * As we may completely rewrite the (un)bound list whilst unbinding
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
index 1929d6cf41508..c512f901a119e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
@@ -38,12 +38,13 @@ i915_gem_throttle_ioctl(struct drm_device *dev, void *data,
 {
 	const unsigned long recent_enough = jiffies - DRM_I915_THROTTLE_JIFFIES;
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct i915_gem_context *ctx;
 	unsigned long idx;
 	long ret;
 
 	/* ABI: return -EIO if already wedged */
-	ret = intel_gt_terminally_wedged(&to_i915(dev)->gt);
+	ret = intel_gt_terminally_wedged(to_root_gt(i915));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index ef22d4ed66ad6..83060cbd360e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -166,7 +166,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	enum i915_cache_level src_level, dst_level;
 	int ret;
 
-	if (!i915->gt.migrate.context || intel_gt_is_wedged(&i915->gt))
+	if (!to_root_gt(i915)->migrate.context || intel_gt_is_wedged(to_root_gt(i915)))
 		return ERR_PTR(-EINVAL);
 
 	/* With fail_gpu_migration, we always perform a GPU clear. */
@@ -179,8 +179,8 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		    !I915_SELFTEST_ONLY(fail_gpu_migration))
 			return ERR_PTR(-EINVAL);
 
-		intel_engine_pm_get(i915->gt.migrate.context->engine);
-		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
+		intel_engine_pm_get(to_root_gt(i915)->migrate.context->engine);
+		ret = intel_context_migrate_clear(to_root_gt(i915)->migrate.context, NULL,
 						  dst_st->sgl, dst_level,
 						  i915_ttm_gtt_binds_lmem(dst_mem),
 						  0, &rq);
@@ -192,8 +192,8 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 			return ERR_CAST(src_rsgt);
 
 		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
-		intel_engine_pm_get(i915->gt.migrate.context->engine);
-		ret = intel_context_migrate_copy(i915->gt.migrate.context,
+		intel_engine_pm_get(to_root_gt(i915)->migrate.context->engine);
+		ret = intel_context_migrate_copy(to_root_gt(i915)->migrate.context,
 						 NULL, src_rsgt->table.sgl,
 						 src_level,
 						 i915_ttm_gtt_binds_lmem(bo->resource),
@@ -204,7 +204,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		i915_refct_sgt_put(src_rsgt);
 	}
 
-	intel_engine_pm_put(i915->gt.migrate.context->engine);
+	intel_engine_pm_put(to_root_gt(i915)->migrate.context->engine);
 
 	if (ret && rq) {
 		i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 3173c9f9a0402..8c0b6509c68bd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -529,7 +529,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 		 * On almost all of the older hw, we cannot tell the GPU that
 		 * a page is readonly.
 		 */
-		if (!dev_priv->gt.vm->has_read_only)
+		if (!to_root_gt(dev_priv)->vm->has_read_only)
 			return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 257588b68adc3..68ae88a108894 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1705,7 +1705,7 @@ int i915_gem_huge_page_mock_selftests(void)
 	mkwrite_device_info(dev_priv)->ppgtt_type = INTEL_PPGTT_FULL;
 	mkwrite_device_info(dev_priv)->ppgtt_size = 48;
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
+	ppgtt = i915_ppgtt_create(to_root_gt(dev_priv), 0);
 	if (IS_ERR(ppgtt)) {
 		err = PTR_ERR(ppgtt);
 		goto out_unlock;
@@ -1747,7 +1747,7 @@ int i915_gem_huge_page_live_selftests(struct drm_i915_private *i915)
 		return 0;
 	}
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 8402ed925a69a..6537fc44ddcf4 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -592,7 +592,7 @@ int i915_gem_client_blt_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_client_tiled_blits),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index b32f7fed2d9ce..f4477f7f42a31 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -90,7 +90,7 @@ static int live_nop_switch(void *arg)
 		}
 		if (i915_request_wait(rq, 0, HZ) < 0) {
 			pr_err("Failed to populated %d contexts\n", nctx);
-			intel_gt_set_wedged(&i915->gt);
+			intel_gt_set_wedged(to_root_gt(i915));
 			i915_request_put(rq);
 			err = -EIO;
 			goto out_file;
@@ -146,7 +146,7 @@ static int live_nop_switch(void *arg)
 			if (i915_request_wait(rq, 0, HZ / 5) < 0) {
 				pr_err("Switching between %ld contexts timed out\n",
 				       prime);
-				intel_gt_set_wedged(&i915->gt);
+				intel_gt_set_wedged(to_root_gt(i915));
 				i915_request_put(rq);
 				break;
 			}
@@ -1223,7 +1223,7 @@ __igt_ctx_sseu(struct drm_i915_private *i915,
 		return 0;
 
 	if (flags & TEST_RESET)
-		igt_global_reset_lock(&i915->gt);
+		igt_global_reset_lock(to_root_gt(i915));
 
 	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
 	if (IS_ERR(obj)) {
@@ -1306,7 +1306,7 @@ __igt_ctx_sseu(struct drm_i915_private *i915,
 
 out_unlock:
 	if (flags & TEST_RESET)
-		igt_global_reset_unlock(&i915->gt);
+		igt_global_reset_unlock(to_root_gt(i915));
 
 	if (ret)
 		pr_err("%s: Failed with %d!\n", name, ret);
@@ -1877,7 +1877,7 @@ int i915_gem_context_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_vm_isolation),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 4b8e6b0986597..638469deec6f5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -261,5 +261,5 @@ int i915_gem_migrate_live_selftests(struct drm_i915_private *i915)
 	if (!HAS_LMEM(i915))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 6d30cdfa80f37..7922ae897e12a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -84,6 +84,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 				 struct rnd_state *prng)
 {
 	const unsigned long npages = obj->base.size / PAGE_SIZE;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt_view view;
 	struct i915_vma *vma;
 	unsigned long page;
@@ -141,7 +142,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	if (offset >= obj->base.size)
 		goto out;
 
-	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
+	intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
 	cpu = kmap(p) + offset_in_page(offset);
@@ -173,8 +174,9 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 				  const struct tile *tile,
 				  unsigned long end_time)
 {
-	const unsigned int nreal = obj->scratch / PAGE_SIZE;
 	const unsigned long npages = obj->base.size / PAGE_SIZE;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	const unsigned int nreal = obj->scratch / PAGE_SIZE;
 	struct i915_vma *vma;
 	unsigned long page;
 	int err;
@@ -234,7 +236,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		if (offset >= obj->base.size)
 			continue;
 
-		intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
+		intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
 		cpu = kmap(p) + offset_in_page(offset);
@@ -616,14 +618,14 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 static void disable_retire_worker(struct drm_i915_private *i915)
 {
 	i915_gem_driver_unregister__shrinker(i915);
-	intel_gt_pm_get(&i915->gt);
-	cancel_delayed_work_sync(&i915->gt.requests.retire_work);
+	intel_gt_pm_get(to_root_gt(i915));
+	cancel_delayed_work_sync(&to_root_gt(i915)->requests.retire_work);
 }
 
 static void restore_retire_worker(struct drm_i915_private *i915)
 {
 	igt_flush_test(i915);
-	intel_gt_pm_put(&i915->gt);
+	intel_gt_pm_put(to_root_gt(i915));
 	i915_gem_driver_register__shrinker(i915);
 }
 
@@ -651,8 +653,8 @@ static int igt_mmap_offset_exhaustion(void *arg)
 
 	/* Disable background reaper */
 	disable_retire_worker(i915);
-	GEM_BUG_ON(!i915->gt.awake);
-	intel_gt_retire_requests(&i915->gt);
+	GEM_BUG_ON(!to_root_gt(i915)->awake);
+	intel_gt_retire_requests(to_root_gt(i915));
 	i915_gem_drain_freed_objects(i915);
 
 	/* Trim the device mmap space to only a page */
@@ -728,7 +730,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 
 	/* Now fill with busy dead objects that we expect to reap */
 	for (loop = 0; loop < 3; loop++) {
-		if (intel_gt_is_wedged(&i915->gt))
+		if (intel_gt_is_wedged(to_root_gt(i915)))
 			break;
 
 		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
@@ -942,7 +944,7 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	}
 
 	if (type == I915_MMAP_TYPE_GTT)
-		intel_gt_flush_ggtt_writes(&i915->gt);
+		intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 	err = wc_check(obj);
 	if (err == -ENXIO)
@@ -1049,7 +1051,7 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 		goto out_unmap;
 	}
 
-	intel_gt_flush_ggtt_writes(&i915->gt);
+	intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 	err = access_process_vm(current, addr, &x, sizeof(x), 0);
 	if (err != sizeof(x)) {
@@ -1065,7 +1067,7 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 		goto out_unmap;
 	}
 
-	intel_gt_flush_ggtt_writes(&i915->gt);
+	intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 	err = __get_user(y, ptr);
 	if (err) {
@@ -1165,7 +1167,7 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 	}
 
 	if (type == I915_MMAP_TYPE_GTT)
-		intel_gt_flush_ggtt_writes(&i915->gt);
+		intel_gt_flush_ggtt_writes(to_root_gt(i915));
 
 	for_each_uabi_engine(engine, i915) {
 		struct i915_request *rq;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 8f8bea08e734d..1d764f171d2ed 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -116,7 +116,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 			disabled |= (I915_SCHEDULER_CAP_ENABLED |
 				     I915_SCHEDULER_CAP_PRIORITY);
 
-		if (intel_uc_uses_guc_submission(&i915->gt.uc))
+		if (intel_uc_uses_guc_submission(&engine->gt->uc))
 			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
 
 		for (i = 0; i < ARRAY_SIZE(map); i++) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 555111c3bee50..cae87546bde8d 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1229,7 +1229,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 {
 	int ret;
 
-	ret = ggtt_probe_hw(&i915->ggtt, &i915->gt);
+	ret = ggtt_probe_hw(&i915->ggtt, to_root_gt(i915));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 07ff7ba7b2b71..acdce8ca38132 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2302,7 +2302,7 @@ unsigned long i915_read_mch_val(void)
 		return 0;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		struct intel_ips *ips = &i915->gt.rps.ips;
+		struct intel_ips *ips = &to_root_gt(i915)->rps.ips;
 
 		spin_lock_irq(&mchdev_lock);
 		chipset_val = __ips_chipset_val(ips);
@@ -2329,7 +2329,7 @@ bool i915_gpu_raise(void)
 	if (!i915)
 		return false;
 
-	rps = &i915->gt.rps;
+	rps = &to_root_gt(i915)->rps;
 
 	spin_lock_irq(&mchdev_lock);
 	if (rps->max_freq_softlimit < rps->max_freq)
@@ -2356,7 +2356,7 @@ bool i915_gpu_lower(void)
 	if (!i915)
 		return false;
 
-	rps = &i915->gt.rps;
+	rps = &to_root_gt(i915)->rps;
 
 	spin_lock_irq(&mchdev_lock);
 	if (rps->max_freq_softlimit > rps->min_freq)
@@ -2382,7 +2382,7 @@ bool i915_gpu_busy(void)
 	if (!i915)
 		return false;
 
-	ret = i915->gt.awake;
+	ret = to_root_gt(i915)->awake;
 
 	drm_dev_put(&i915->drm);
 	return ret;
@@ -2405,11 +2405,11 @@ bool i915_gpu_turbo_disable(void)
 	if (!i915)
 		return false;
 
-	rps = &i915->gt.rps;
+	rps = &to_root_gt(i915)->rps;
 
 	spin_lock_irq(&mchdev_lock);
 	rps->max_freq_softlimit = rps->min_freq;
-	ret = !__gen5_rps_set(&i915->gt.rps, rps->min_freq);
+	ret = !__gen5_rps_set(&to_root_gt(i915)->rps, rps->min_freq);
 	spin_unlock_irq(&mchdev_lock);
 
 	drm_dev_put(&i915->drm);
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a9727447c0379..db22ab43b96bd 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -936,7 +936,8 @@ hsw_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 {
-	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
+	const struct sseu_dev_info *sseu = &to_root_gt(i915)->info.sseu;
+
 	unsigned int slice, subslice;
 	u32 mcr, mcr_mask;
 
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index bb99fc03f5039..f3e75e6e42727 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -345,7 +345,7 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 	struct mock_engine *engine;
 
 	GEM_BUG_ON(id >= I915_NUM_ENGINES);
-	GEM_BUG_ON(!i915->gt.uncore);
+	GEM_BUG_ON(!to_root_gt(i915)->uncore);
 
 	engine = kzalloc(sizeof(*engine) + PAGE_SIZE, GFP_KERNEL);
 	if (!engine)
@@ -353,8 +353,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 
 	/* minimal engine setup for requests */
 	engine->base.i915 = i915;
-	engine->base.gt = &i915->gt;
-	engine->base.uncore = i915->gt.uncore;
+	engine->base.gt = to_root_gt(i915);
+	engine->base.uncore = to_root_gt(i915)->uncore;
 	snprintf(engine->base.name, sizeof(engine->base.name), "%s", name);
 	engine->base.id = id;
 	engine->base.mask = BIT(id);
@@ -377,8 +377,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 
 	engine->base.release = mock_engine_release;
 
-	i915->gt.engine[id] = &engine->base;
-	i915->gt.engine_class[0][id] = &engine->base;
+	to_root_gt(i915)->engine[id] = &engine->base;
+	to_root_gt(i915)->engine_class[0][id] = &engine->base;
 
 	/* fake hw queue */
 	spin_lock_init(&engine->hw_lock);
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index fa7b99a671ddd..0a1b311df5316 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -442,7 +442,7 @@ int intel_context_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_active_context),
 		SUBTEST(live_remote_context),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (intel_gt_is_wedged(gt))
 		return 0;
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine.c b/drivers/gpu/drm/i915/gt/selftest_engine.c
index 262764f6d90a6..d49a54c575cc5 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine.c
@@ -12,7 +12,7 @@ int intel_engine_live_selftests(struct drm_i915_private *i915)
 		live_engine_pm_selftests,
 		NULL,
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	typeof(*tests) *fn;
 
 	for (fn = tests; *fn; fn++) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 64abf5feabfaa..63dabfa6d7604 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -361,10 +361,10 @@ int intel_engine_cs_perf_selftests(struct drm_i915_private *i915)
 		SUBTEST(perf_mi_noop),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
 
 static int intel_mmio_bases_check(void *arg)
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index 6e6e4d747ccaf..3a0bb00284cc0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -378,13 +378,13 @@ int intel_heartbeat_live_selftests(struct drm_i915_private *i915)
 	int saved_hangcheck;
 	int err;
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	saved_hangcheck = i915->params.enable_hangcheck;
 	i915->params.enable_hangcheck = INT_MAX;
 
-	err = intel_gt_live_subtests(tests, &i915->gt);
+	err = intel_gt_live_subtests(tests, to_root_gt(i915));
 
 	i915->params.enable_hangcheck = saved_hangcheck;
 	return err;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index b367ecfa42de9..08d8d8c2965b2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -4502,11 +4502,11 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_virtual_reset),
 	};
 
-	if (i915->gt.submission_method != INTEL_SUBMISSION_ELSP)
+	if (to_root_gt(i915)->submission_method != INTEL_SUBMISSION_ELSP)
 		return 0;
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
index b9441217ca3d4..23f4cb0f0776b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
@@ -193,10 +193,10 @@ int intel_gt_pm_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_gt_resume),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
 
 int intel_gt_pm_late_selftests(struct drm_i915_private *i915)
@@ -210,8 +210,8 @@ int intel_gt_pm_late_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_rc6_ctx_wa),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index e5ad4d5a91c05..b3e8db08797b8 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -2018,7 +2018,7 @@ int intel_hangcheck_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_reset_evict_fence),
 		SUBTEST(igt_handle_error),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	intel_wakeref_t wakeref;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index b0977a3b699b8..746392fb6620a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1847,5 +1847,5 @@ int intel_lrc_live_selftests(struct drm_i915_private *i915)
 	if (!HAS_LOGICAL_RING_CONTEXTS(i915))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 12ef2837c89b0..2a570d08c3376 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -441,7 +441,7 @@ int intel_migrate_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(thread_global_copy),
 		SUBTEST(thread_global_clear),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (!gt->migrate.context)
 		return 0;
@@ -657,7 +657,7 @@ int intel_migrate_perf_selftests(struct drm_i915_private *i915)
 		SUBTEST(perf_clear_blt),
 		SUBTEST(perf_copy_blt),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (intel_gt_is_wedged(gt))
 		return 0;
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index 13d25bf2a94aa..ecf00f398341d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -451,5 +451,5 @@ int intel_mocs_live_selftests(struct drm_i915_private *i915)
 	if (!get_mocs_settings(i915, &table))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 7a50c9f4071b4..b791ec4b6a8e8 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -376,7 +376,7 @@ int intel_reset_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_atomic_reset),
 		SUBTEST(igt_atomic_engine_reset),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (!intel_has_gpu_reset(gt))
 		return 0;
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 041954408d0fd..5092e124ef713 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -291,8 +291,8 @@ int intel_ring_submission_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_ctx_switch_wa),
 	};
 
-	if (i915->gt.submission_method > INTEL_SUBMISSION_RING)
+	if (to_root_gt(i915)->submission_method > INTEL_SUBMISSION_RING)
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index 9334bad131a26..1804fb2a4be4d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -39,7 +39,7 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
 static int live_slpc_clamp_min(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
 	struct intel_rps *rps = &gt->rps;
 	struct intel_engine_cs *engine;
@@ -166,7 +166,7 @@ static int live_slpc_clamp_min(void *arg)
 static int live_slpc_clamp_max(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct intel_guc_slpc *slpc;
 	struct intel_rps *rps;
 	struct intel_engine_cs *engine;
@@ -304,7 +304,7 @@ int intel_slpc_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_slpc_clamp_min),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index d0b6a3afcf44e..6d87d6edba05f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -159,7 +159,7 @@ static int mock_hwsp_freelist(void *arg)
 	INIT_RADIX_TREE(&state.cachelines, GFP_KERNEL);
 	state.prng = I915_RND_STATE_INITIALIZER(i915_selftest.random_seed);
 
-	state.gt = &i915->gt;
+	state.gt = to_root_gt(i915);
 
 	/*
 	 * Create a bunch of timelines and check that their HWSP do not overlap.
@@ -1416,8 +1416,8 @@ int intel_timeline_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_hwsp_rollover_user),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 962e91ba3be49..5825f5c710b10 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -1387,8 +1387,8 @@ int intel_workarounds_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_engine_reset_workarounds),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 22c1c12369f2f..97bba7c0e80b8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -623,7 +623,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	if (unlikely(ret < 0))
 		return ret;
 
-	intel_guc_pm_intrmsk_enable(&i915->gt);
+	intel_guc_pm_intrmsk_enable(to_root_gt(i915));
 
 	slpc_get_rp_values(slpc);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index fb0e4a7bd8ca3..10a463f59252f 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -115,7 +115,7 @@ int intel_guc_live_selftests(struct drm_i915_private *i915)
 	static const struct i915_subtest tests[] = {
 		SUBTEST(intel_guc_scrub_ctbs),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (intel_gt_is_wedged(gt))
 		return 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index 50953c8e8b537..eb512cb67a262 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -167,7 +167,7 @@ int intel_guc_multi_lrc_live_selftests(struct drm_i915_private *i915)
 	static const struct i915_subtest tests[] = {
 		SUBTEST(intel_guc_multi_lrc_basic),
 	};
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	if (intel_gt_is_wedged(gt))
 		return 0;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cbac409f6c8a5..09ddd78f7816f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -205,7 +205,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	spin_lock_init(&gvt->scheduler.mmio_context_lock);
 	mutex_init(&gvt->lock);
 	mutex_init(&gvt->sched_lock);
-	gvt->gt = &i915->gt;
+	gvt->gt = to_root_gt(i915);
 	i915->gvt = gvt;
 
 	init_device_info(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6c804102528b1..cb069fb8cccde 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1386,7 +1386,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	enum intel_engine_id i;
 	int ret;
 
-	ppgtt = i915_ppgtt_create(&i915->gt, I915_BO_ALLOC_PM_EARLY);
+	ppgtt = i915_ppgtt_create(to_root_gt(i915), I915_BO_ALLOC_PM_EARLY);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index fe638b5da7c0b..d5594c85b55fb 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -65,7 +65,7 @@ static int i915_capabilities(struct seq_file *m, void *data)
 
 	intel_device_info_print_static(INTEL_INFO(i915), &p);
 	intel_device_info_print_runtime(RUNTIME_INFO(i915), &p);
-	intel_gt_info_print(&i915->gt.info, &p);
+	intel_gt_info_print(&to_root_gt(i915)->info, &p);
 	intel_driver_caps_print(&i915->caps, &p);
 
 	kernel_param_lock(THIS_MODULE);
@@ -293,7 +293,7 @@ static int i915_gpu_info_open(struct inode *inode, struct file *file)
 
 	gpu = NULL;
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		gpu = i915_gpu_coredump(&i915->gt, ALL_ENGINES);
+		gpu = i915_gpu_coredump(to_root_gt(i915), ALL_ENGINES);
 	if (IS_ERR(gpu))
 		return PTR_ERR(gpu);
 
@@ -351,7 +351,7 @@ static const struct file_operations i915_error_state_fops = {
 static int i915_frequency_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *i915 = node_to_i915(m->private);
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	intel_gt_pm_frequency_dump(gt, &p);
@@ -439,11 +439,11 @@ static int i915_swizzle_info(struct seq_file *m, void *data)
 static int i915_rps_boost_info(struct seq_file *m, void *data)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
-	struct intel_rps *rps = &dev_priv->gt.rps;
+	struct intel_rps *rps = &to_root_gt(dev_priv)->rps;
 
 	seq_printf(m, "RPS enabled? %s\n", yesno(intel_rps_is_enabled(rps)));
 	seq_printf(m, "RPS active? %s\n", yesno(intel_rps_is_active(rps)));
-	seq_printf(m, "GPU busy? %s\n", yesno(dev_priv->gt.awake));
+	seq_printf(m, "GPU busy? %s\n", yesno(to_root_gt(dev_priv)->awake));
 	seq_printf(m, "Boosts outstanding? %d\n",
 		   atomic_read(&rps->num_waiters));
 	seq_printf(m, "Interactive? %d\n", READ_ONCE(rps->power.interactive));
@@ -476,7 +476,7 @@ static int i915_runtime_pm_status(struct seq_file *m, void *unused)
 	seq_printf(m, "Runtime power status: %s\n",
 		   enableddisabled(!dev_priv->power_domains.init_wakeref));
 
-	seq_printf(m, "GPU idle: %s\n", yesno(!dev_priv->gt.awake));
+	seq_printf(m, "GPU idle: %s\n", yesno(!to_root_gt(dev_priv)->awake));
 	seq_printf(m, "IRQs disabled: %s\n",
 		   yesno(!intel_irqs_enabled(dev_priv)));
 #ifdef CONFIG_PM
@@ -508,18 +508,18 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
 	seq_printf(m, "GT awake? %s [%d], %llums\n",
-		   yesno(i915->gt.awake),
-		   atomic_read(&i915->gt.wakeref.count),
-		   ktime_to_ms(intel_gt_get_awake_time(&i915->gt)));
+		   yesno(to_root_gt(i915)->awake),
+		   atomic_read(&to_root_gt(i915)->wakeref.count),
+		   ktime_to_ms(intel_gt_get_awake_time(to_root_gt(i915))));
 	seq_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
-		   i915->gt.clock_frequency,
-		   i915->gt.clock_period_ns);
+		   to_root_gt(i915)->clock_frequency,
+		   to_root_gt(i915)->clock_period_ns);
 
 	p = drm_seq_file_printer(m);
 	for_each_uabi_engine(engine, i915)
 		intel_engine_dump(engine, &p, "%s\n", engine->name);
 
-	intel_gt_show_timelines(&i915->gt, &p, i915_request_show_with_schedule);
+	intel_gt_show_timelines(to_root_gt(i915), &p, i915_request_show_with_schedule);
 
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
@@ -558,14 +558,14 @@ static int i915_wedged_get(void *data, u64 *val)
 {
 	struct drm_i915_private *i915 = data;
 
-	return intel_gt_debugfs_reset_show(&i915->gt, val);
+	return intel_gt_debugfs_reset_show(to_root_gt(i915), val);
 }
 
 static int i915_wedged_set(void *data, u64 val)
 {
 	struct drm_i915_private *i915 = data;
 
-	return intel_gt_debugfs_reset_store(&i915->gt, val);
+	return intel_gt_debugfs_reset_store(to_root_gt(i915), val);
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(i915_wedged_fops,
@@ -581,7 +581,7 @@ i915_perf_noa_delay_set(void *data, u64 val)
 	 * This would lead to infinite waits as we're doing timestamp
 	 * difference on the CS with only 32bits.
 	 */
-	if (intel_gt_ns_to_clock_interval(&i915->gt, val) > U32_MAX)
+	if (intel_gt_ns_to_clock_interval(to_root_gt(i915), val) > U32_MAX)
 		return -EINVAL;
 
 	atomic64_set(&i915->perf.noa_programming_delay, val);
@@ -671,7 +671,7 @@ i915_drop_caches_set(void *data, u64 val)
 	DRM_DEBUG("Dropping caches: 0x%08llx [0x%08llx]\n",
 		  val, val & DROP_ALL);
 
-	ret = gt_drop_caches(&i915->gt, val);
+	ret = gt_drop_caches(to_root_gt(i915), val);
 	if (ret)
 		return ret;
 
@@ -702,7 +702,7 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_drop_caches_fops,
 static int i915_sseu_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *i915 = node_to_i915(m->private);
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	return intel_sseu_status(m, gt);
 }
@@ -711,14 +711,14 @@ static int i915_forcewake_open(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
 
-	return intel_gt_pm_debugfs_forcewake_user_open(&i915->gt);
+	return intel_gt_pm_debugfs_forcewake_user_open(to_root_gt(i915));
 }
 
 static int i915_forcewake_release(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
 
-	return intel_gt_pm_debugfs_forcewake_user_release(&i915->gt);
+	return intel_gt_pm_debugfs_forcewake_user_release(to_root_gt(i915));
 }
 
 static const struct file_operations i915_forcewake_fops = {
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 20424275d41eb..9a749865b3603 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -40,8 +40,8 @@ static int notify_guc(struct drm_i915_private *i915)
 {
 	int ret = 0;
 
-	if (intel_uc_uses_guc_submission(&i915->gt.uc))
-		ret = intel_guc_global_policies_update(&i915->gt.uc.guc);
+	if (intel_uc_uses_guc_submission(&to_root_gt(i915)->uc))
+		ret = intel_guc_global_policies_update(&to_root_gt(i915)->uc.guc);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 26e90e55d8ca9..4ac7b84eaf127 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -292,7 +292,7 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
 static void sanitize_gpu(struct drm_i915_private *i915)
 {
 	if (!INTEL_INFO(i915)->gpu_reset_clobbers_display)
-		__intel_gt_reset(&i915->gt, ALL_ENGINES);
+		__intel_gt_reset(to_root_gt(i915), ALL_ENGINES);
 }
 
 /**
@@ -316,7 +316,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	intel_step_init(dev_priv);
 
 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
-	intel_uncore_init_early(&dev_priv->uncore, &dev_priv->gt);
+	intel_uncore_init_early(&dev_priv->uncore, to_root_gt(dev_priv));
 
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
@@ -347,7 +347,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_wopcm_init_early(&dev_priv->wopcm);
 
-	intel_gt_init_early(&dev_priv->gt, dev_priv);
+	intel_gt_init_early(to_root_gt(dev_priv), dev_priv);
 
 	i915_gem_init_early(dev_priv);
 
@@ -368,7 +368,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 err_gem:
 	i915_gem_cleanup_early(dev_priv);
-	intel_gt_driver_late_release(&dev_priv->gt);
+	intel_gt_driver_late_release(to_root_gt(dev_priv));
 	intel_region_ttm_device_fini(dev_priv);
 err_ttm:
 	vlv_suspend_cleanup(dev_priv);
@@ -387,7 +387,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_irq_fini(dev_priv);
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
-	intel_gt_driver_late_release(&dev_priv->gt);
+	intel_gt_driver_late_release(to_root_gt(dev_priv));
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -430,7 +430,7 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 	intel_setup_mchbar(dev_priv);
 	intel_device_info_runtime_init(dev_priv);
 
-	ret = intel_gt_init_mmio(&dev_priv->gt);
+	ret = intel_gt_init_mmio(to_root_gt(dev_priv));
 	if (ret)
 		goto err_uncore;
 
@@ -587,9 +587,9 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_ggtt;
 
-	intel_gt_init_hw_early(&dev_priv->gt, &dev_priv->ggtt);
+	intel_gt_init_hw_early(to_root_gt(dev_priv), &dev_priv->ggtt);
 
-	ret = intel_gt_probe_lmem(&dev_priv->gt);
+	ret = intel_gt_probe_lmem(to_root_gt(dev_priv));
 	if (ret)
 		goto err_mem_regions;
 
@@ -702,7 +702,7 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
-	intel_gt_driver_register(&dev_priv->gt);
+	intel_gt_driver_register(to_root_gt(dev_priv));
 
 	intel_display_driver_register(dev_priv);
 
@@ -730,7 +730,7 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(dev_priv);
 
-	intel_gt_driver_unregister(&dev_priv->gt);
+	intel_gt_driver_unregister(to_root_gt(dev_priv));
 
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
@@ -756,7 +756,7 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 
 		intel_device_info_print_static(INTEL_INFO(dev_priv), &p);
 		intel_device_info_print_runtime(RUNTIME_INFO(dev_priv), &p);
-		intel_gt_info_print(&dev_priv->gt.info, &p);
+		intel_gt_info_print(&to_root_gt(dev_priv)->info, &p);
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG))
@@ -1378,7 +1378,7 @@ static int i915_drm_resume_early(struct drm_device *dev)
 
 	intel_uncore_resume_early(&dev_priv->uncore);
 
-	intel_gt_check_and_clear_faults(&dev_priv->gt);
+	intel_gt_check_and_clear_faults(to_root_gt(dev_priv));
 
 	intel_display_power_resume_early(dev_priv);
 
@@ -1561,7 +1561,7 @@ static int intel_runtime_suspend(struct device *kdev)
 	 */
 	i915_gem_runtime_suspend(dev_priv);
 
-	intel_gt_runtime_suspend(&dev_priv->gt);
+	intel_gt_runtime_suspend(to_root_gt(dev_priv));
 
 	intel_runtime_pm_disable_interrupts(dev_priv);
 
@@ -1577,7 +1577,7 @@ static int intel_runtime_suspend(struct device *kdev)
 
 		intel_runtime_pm_enable_interrupts(dev_priv);
 
-		intel_gt_runtime_resume(&dev_priv->gt);
+		intel_gt_runtime_resume(to_root_gt(dev_priv));
 
 		enable_rpm_wakeref_asserts(rpm);
 
@@ -1665,7 +1665,7 @@ static int intel_runtime_resume(struct device *kdev)
 	 * No point of rolling back things in case of an error, as the best
 	 * we can do is to hope that things will still work (and disable RPM).
 	 */
-	intel_gt_runtime_resume(&dev_priv->gt);
+	intel_gt_runtime_resume(to_root_gt(dev_priv));
 
 	/*
 	 * On VLV/CHV display interrupts are part of the display
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1bfadd9127fc5..51b83d34e22d7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1193,7 +1193,7 @@ struct drm_i915_private {
 	struct i915_perf perf;
 
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
-	struct intel_gt gt;
+	struct intel_gt gt0;
 
 	struct {
 		struct i915_gem_contexts {
@@ -1726,7 +1726,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_PXP(dev_priv)  ((IS_ENABLED(CONFIG_DRM_I915_PXP) && \
 			    INTEL_INFO(dev_priv)->has_pxp) && \
-			    VDBOX_MASK(&dev_priv->gt))
+			    VDBOX_MASK(to_root_gt(dev_priv)))
 
 #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
 
@@ -1752,6 +1752,11 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define INTEL_DISPLAY_ENABLED(dev_priv) \
 	(drm_WARN_ON(&(dev_priv)->drm, !HAS_DISPLAY(dev_priv)), !(dev_priv)->params.disable_display)
 
+static inline struct intel_gt *to_root_gt(struct drm_i915_private *i915)
+{
+	return &i915->gt0;
+}
+
 static inline bool run_as_guest(void)
 {
 	return !hypervisor_is_type(X86_HYPER_NATIVE);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 527228d4da7e9..ea0a87ecc7035 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1049,7 +1049,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	if (ret)
 		return ret;
 
-	intel_uc_fetch_firmwares(&dev_priv->gt.uc);
+	intel_uc_fetch_firmwares(&to_root_gt(dev_priv)->uc);
 	intel_wopcm_init(&dev_priv->wopcm);
 
 	ret = i915_init_ggtt(dev_priv);
@@ -1069,7 +1069,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	 */
 	intel_init_clock_gating(dev_priv);
 
-	ret = intel_gt_init(&dev_priv->gt);
+	ret = intel_gt_init(to_root_gt(dev_priv));
 	if (ret)
 		goto err_unlock;
 
@@ -1085,7 +1085,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	i915_gem_drain_workqueue(dev_priv);
 
 	if (ret != -EIO)
-		intel_uc_cleanup_firmwares(&dev_priv->gt.uc);
+		intel_uc_cleanup_firmwares(&to_root_gt(dev_priv)->uc);
 
 	if (ret == -EIO) {
 		/*
@@ -1093,10 +1093,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 		 * as wedged. But we only want to do this when the GPU is angry,
 		 * for all other failure, such as an allocation failure, bail.
 		 */
-		if (!intel_gt_is_wedged(&dev_priv->gt)) {
+		if (!intel_gt_is_wedged(to_root_gt(dev_priv))) {
 			i915_probe_error(dev_priv,
 					 "Failed to initialize GPU, declaring it wedged!\n");
-			intel_gt_set_wedged(&dev_priv->gt);
+			intel_gt_set_wedged(to_root_gt(dev_priv));
 		}
 
 		/* Minimal basic recovery for KMS */
@@ -1127,7 +1127,7 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 	intel_wakeref_auto_fini(&dev_priv->ggtt.userfault_wakeref);
 
 	i915_gem_suspend_late(dev_priv);
-	intel_gt_driver_remove(&dev_priv->gt);
+	intel_gt_driver_remove(to_root_gt(dev_priv));
 	dev_priv->uabi_engines = RB_ROOT;
 
 	/* Flush any outstanding unpin_work. */
@@ -1138,9 +1138,9 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 
 void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 {
-	intel_gt_driver_release(&dev_priv->gt);
+	intel_gt_driver_release(to_root_gt(dev_priv));
 
-	intel_uc_cleanup_firmwares(&dev_priv->gt.uc);
+	intel_uc_cleanup_firmwares(&to_root_gt(dev_priv)->uc);
 
 	i915_gem_drain_freed_objects(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 77490cb5ff9c4..b474db88267af 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -13,7 +13,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
+	const struct sseu_dev_info *sseu = &to_root_gt(i915)->info.sseu;
 	drm_i915_getparam_t *param = data;
 	int value = 0;
 
@@ -82,8 +82,8 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		break;
 	case I915_PARAM_HAS_GPU_RESET:
 		value = i915->params.enable_hangcheck &&
-			intel_has_gpu_reset(&i915->gt);
-		if (value && intel_has_reset_engine(&i915->gt))
+			intel_has_gpu_reset(to_root_gt(i915));
+		if (value && intel_has_reset_engine(to_root_gt(i915)))
 			value = 2;
 		break;
 	case I915_PARAM_HAS_RESOURCE_STREAMER:
@@ -96,7 +96,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = sseu->min_eu_in_pool;
 		break;
 	case I915_PARAM_HUC_STATUS:
-		value = intel_huc_check_status(&i915->gt.uc.huc);
+		value = intel_huc_check_status(&to_root_gt(i915)->uc.huc);
 		if (value < 0)
 			return value;
 		break;
@@ -158,7 +158,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return -ENODEV;
 		break;
 	case I915_PARAM_CS_TIMESTAMP_FREQUENCY:
-		value = i915->gt.clock_frequency;
+		value = to_root_gt(i915)->clock_frequency;
 		break;
 	case I915_PARAM_MMAP_GTT_COHERENT:
 		value = INTEL_INFO(i915)->has_coherent_ggtt;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a2d7643b5511..7b63a42eeac4b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -504,7 +504,7 @@ static void error_print_context(struct drm_i915_error_state_buf *m,
 				const char *header,
 				const struct i915_gem_context_coredump *ctx)
 {
-	const u32 period = m->i915->gt.clock_period_ns;
+	const u32 period = to_root_gt(m->i915)->clock_period_ns;
 
 	err_printf(m, "%s%s[%d] prio %d, guilty %d active %d, runtime total %lluns, avg %lluns\n",
 		   header, ctx->comm, ctx->pid, ctx->sched_attr.priority,
@@ -1784,7 +1784,7 @@ i915_gpu_coredump_alloc(struct drm_i915_private *i915, gfp_t gfp)
 
 	error->time = ktime_get_real();
 	error->boottime = ktime_get_boottime();
-	error->uptime = ktime_sub(ktime_get(), i915->gt.last_init_time);
+	error->uptime = ktime_sub(ktime_get(), to_root_gt(i915)->last_init_time);
 	error->capture = jiffies;
 
 	capture_gen(error);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 6aea159abc502..b1ba293ff4c6a 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -1040,7 +1040,7 @@ static void ivb_parity_work(struct work_struct *work)
 {
 	struct drm_i915_private *dev_priv =
 		container_of(work, typeof(*dev_priv), l3_parity.error_work);
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	u32 error_status, row, bank, subbank;
 	char *parity_event[6];
 	u32 misccpctl;
@@ -1718,9 +1718,9 @@ static irqreturn_t valleyview_irq_handler(int irq, void *arg)
 		intel_uncore_write(&dev_priv->uncore, VLV_MASTER_IER, MASTER_INTERRUPT_ENABLE);
 
 		if (gt_iir)
-			gen6_gt_irq_handler(&dev_priv->gt, gt_iir);
+			gen6_gt_irq_handler(to_root_gt(dev_priv), gt_iir);
 		if (pm_iir)
-			gen6_rps_irq_handler(&dev_priv->gt.rps, pm_iir);
+			gen6_rps_irq_handler(&to_root_gt(dev_priv)->rps, pm_iir);
 
 		if (hotplug_status)
 			i9xx_hpd_irq_handler(dev_priv, hotplug_status);
@@ -1777,7 +1777,7 @@ static irqreturn_t cherryview_irq_handler(int irq, void *arg)
 		ier = intel_uncore_read(&dev_priv->uncore, VLV_IER);
 		intel_uncore_write(&dev_priv->uncore, VLV_IER, 0);
 
-		gen8_gt_irq_handler(&dev_priv->gt, master_ctl);
+		gen8_gt_irq_handler(to_root_gt(dev_priv), master_ctl);
 
 		if (iir & I915_DISPLAY_PORT_INTERRUPT)
 			hotplug_status = i9xx_hpd_irq_ack(dev_priv);
@@ -2108,7 +2108,7 @@ static void ilk_display_irq_handler(struct drm_i915_private *dev_priv,
 	}
 
 	if (DISPLAY_VER(dev_priv) == 5 && de_iir & DE_PCU_EVENT)
-		gen5_rps_irq_handler(&dev_priv->gt.rps);
+		gen5_rps_irq_handler(&to_root_gt(dev_priv)->rps);
 }
 
 static void ivb_display_irq_handler(struct drm_i915_private *dev_priv,
@@ -2189,9 +2189,9 @@ static irqreturn_t ilk_irq_handler(int irq, void *arg)
 	if (gt_iir) {
 		raw_reg_write(regs, GTIIR, gt_iir);
 		if (GRAPHICS_VER(i915) >= 6)
-			gen6_gt_irq_handler(&i915->gt, gt_iir);
+			gen6_gt_irq_handler(to_root_gt(i915), gt_iir);
 		else
-			gen5_gt_irq_handler(&i915->gt, gt_iir);
+			gen5_gt_irq_handler(to_root_gt(i915), gt_iir);
 		ret = IRQ_HANDLED;
 	}
 
@@ -2209,7 +2209,7 @@ static irqreturn_t ilk_irq_handler(int irq, void *arg)
 		u32 pm_iir = raw_reg_read(regs, GEN6_PMIIR);
 		if (pm_iir) {
 			raw_reg_write(regs, GEN6_PMIIR, pm_iir);
-			gen6_rps_irq_handler(&i915->gt.rps, pm_iir);
+			gen6_rps_irq_handler(&to_root_gt(i915)->rps, pm_iir);
 			ret = IRQ_HANDLED;
 		}
 	}
@@ -2635,7 +2635,7 @@ static irqreturn_t gen8_irq_handler(int irq, void *arg)
 	}
 
 	/* Find, queue (onto bottom-halves), then clear each source */
-	gen8_gt_irq_handler(&dev_priv->gt, master_ctl);
+	gen8_gt_irq_handler(to_root_gt(dev_priv), master_ctl);
 
 	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
 	if (master_ctl & ~GEN8_GT_IRQS) {
@@ -2715,7 +2715,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private *i915 = arg;
 	void __iomem * const regs = i915->uncore.regs;
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	u32 master_ctl;
 	u32 gu_misc_iir;
 
@@ -2771,7 +2771,7 @@ static inline void dg1_master_intr_enable(void __iomem * const regs)
 static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private * const i915 = arg;
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	void __iomem * const regs = gt->uncore->regs;
 	u32 master_tile_ctl, master_ctl;
 	u32 gu_misc_iir;
@@ -3075,7 +3075,7 @@ static void ilk_irq_reset(struct drm_i915_private *dev_priv)
 		intel_uncore_write(uncore, EDP_PSR_IIR, 0xffffffff);
 	}
 
-	gen5_gt_irq_reset(&dev_priv->gt);
+	gen5_gt_irq_reset(to_root_gt(dev_priv));
 
 	ibx_irq_reset(dev_priv);
 }
@@ -3085,7 +3085,7 @@ static void valleyview_irq_reset(struct drm_i915_private *dev_priv)
 	intel_uncore_write(&dev_priv->uncore, VLV_MASTER_IER, 0);
 	intel_uncore_posting_read(&dev_priv->uncore, VLV_MASTER_IER);
 
-	gen5_gt_irq_reset(&dev_priv->gt);
+	gen5_gt_irq_reset(to_root_gt(dev_priv));
 
 	spin_lock_irq(&dev_priv->irq_lock);
 	if (dev_priv->display_irqs_enabled)
@@ -3119,7 +3119,7 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
 
 	gen8_master_intr_disable(dev_priv->uncore.regs);
 
-	gen8_gt_irq_reset(&dev_priv->gt);
+	gen8_gt_irq_reset(to_root_gt(dev_priv));
 	gen8_display_irq_reset(dev_priv);
 	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
 
@@ -3173,7 +3173,7 @@ static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 
 static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 
 	gen11_master_intr_disable(dev_priv->uncore.regs);
@@ -3187,7 +3187,7 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
@@ -3252,7 +3252,7 @@ static void cherryview_irq_reset(struct drm_i915_private *dev_priv)
 	intel_uncore_write(&dev_priv->uncore, GEN8_MASTER_IRQ, 0);
 	intel_uncore_posting_read(&dev_priv->uncore, GEN8_MASTER_IRQ);
 
-	gen8_gt_irq_reset(&dev_priv->gt);
+	gen8_gt_irq_reset(to_root_gt(dev_priv));
 
 	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
 
@@ -3709,7 +3709,7 @@ static void ilk_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	ibx_irq_postinstall(dev_priv);
 
-	gen5_gt_irq_postinstall(&dev_priv->gt);
+	gen5_gt_irq_postinstall(to_root_gt(dev_priv));
 
 	GEN3_IRQ_INIT(uncore, DE, dev_priv->irq_mask,
 		      display_mask | extra_mask);
@@ -3746,7 +3746,7 @@ void valleyview_disable_display_irqs(struct drm_i915_private *dev_priv)
 
 static void valleyview_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	gen5_gt_irq_postinstall(&dev_priv->gt);
+	gen5_gt_irq_postinstall(to_root_gt(dev_priv));
 
 	spin_lock_irq(&dev_priv->irq_lock);
 	if (dev_priv->display_irqs_enabled)
@@ -3852,7 +3852,7 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 	else if (HAS_PCH_SPLIT(dev_priv))
 		ibx_irq_postinstall(dev_priv);
 
-	gen8_gt_irq_postinstall(&dev_priv->gt);
+	gen8_gt_irq_postinstall(to_root_gt(dev_priv));
 	gen8_de_irq_postinstall(dev_priv);
 
 	gen8_master_intr_enable(dev_priv->uncore.regs);
@@ -3871,7 +3871,7 @@ static void gen11_de_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
@@ -3889,7 +3889,7 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
@@ -3910,7 +3910,7 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	gen8_gt_irq_postinstall(&dev_priv->gt);
+	gen8_gt_irq_postinstall(to_root_gt(dev_priv));
 
 	spin_lock_irq(&dev_priv->irq_lock);
 	if (dev_priv->display_irqs_enabled)
@@ -4073,7 +4073,7 @@ static irqreturn_t i8xx_irq_handler(int irq, void *arg)
 		intel_uncore_write16(&dev_priv->uncore, GEN2_IIR, iir);
 
 		if (iir & I915_USER_INTERRUPT)
-			intel_engine_cs_irq(dev_priv->gt.engine[RCS0], iir);
+			intel_engine_cs_irq(to_root_gt(dev_priv)->engine[RCS0], iir);
 
 		if (iir & I915_MASTER_ERROR_INTERRUPT)
 			i8xx_error_irq_handler(dev_priv, eir, eir_stuck);
@@ -4181,7 +4181,7 @@ static irqreturn_t i915_irq_handler(int irq, void *arg)
 		intel_uncore_write(&dev_priv->uncore, GEN2_IIR, iir);
 
 		if (iir & I915_USER_INTERRUPT)
-			intel_engine_cs_irq(dev_priv->gt.engine[RCS0], iir);
+			intel_engine_cs_irq(to_root_gt(dev_priv)->engine[RCS0], iir);
 
 		if (iir & I915_MASTER_ERROR_INTERRUPT)
 			i9xx_error_irq_handler(dev_priv, eir, eir_stuck);
@@ -4326,11 +4326,11 @@ static irqreturn_t i965_irq_handler(int irq, void *arg)
 		intel_uncore_write(&dev_priv->uncore, GEN2_IIR, iir);
 
 		if (iir & I915_USER_INTERRUPT)
-			intel_engine_cs_irq(dev_priv->gt.engine[RCS0],
+			intel_engine_cs_irq(to_root_gt(dev_priv)->engine[RCS0],
 					    iir);
 
 		if (iir & I915_BSD_USER_INTERRUPT)
-			intel_engine_cs_irq(dev_priv->gt.engine[VCS0],
+			intel_engine_cs_irq(to_root_gt(dev_priv)->engine[VCS0],
 					    iir >> 25);
 
 		if (iir & I915_MASTER_ERROR_INTERRUPT)
@@ -4381,7 +4381,7 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
 
 	/* pre-gen11 the guc irqs bits are in the upper 16 bits of the pm reg */
 	if (HAS_GT_UC(dev_priv) && GRAPHICS_VER(dev_priv) < 11)
-		dev_priv->gt.pm_guc_events = GUC_INTR_GUC2HOST << 16;
+		to_root_gt(dev_priv)->pm_guc_events = GUC_INTR_GUC2HOST << 16;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 2f01b8c0284c8..aac1a2a1cbd8d 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4443,7 +4443,7 @@ void i915_perf_init(struct drm_i915_private *i915)
 		mutex_init(&perf->lock);
 
 		/* Choose a representative limit */
-		oa_sample_rate_hard_limit = i915->gt.clock_frequency / 2;
+		oa_sample_rate_hard_limit = to_root_gt(i915)->clock_frequency / 2;
 
 		mutex_init(&perf->metrics_lock);
 		idr_init_base(&perf->metrics_idr, 1);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 0b488d49694ca..db890fecc7e14 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -210,8 +210,8 @@ static void init_rc6(struct i915_pmu *pmu)
 	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
 	intel_wakeref_t wakeref;
 
-	with_intel_runtime_pm(i915->gt.uncore->rpm, wakeref) {
-		pmu->sample[__I915_SAMPLE_RC6].cur = __get_rc6(&i915->gt);
+	with_intel_runtime_pm(to_root_gt(i915)->uncore->rpm, wakeref) {
+		pmu->sample[__I915_SAMPLE_RC6].cur = __get_rc6(to_root_gt(i915));
 		pmu->sample[__I915_SAMPLE_RC6_LAST_REPORTED].cur =
 					pmu->sample[__I915_SAMPLE_RC6].cur;
 		pmu->sleep_last = ktime_get_raw();
@@ -222,7 +222,7 @@ static void park_rc6(struct drm_i915_private *i915)
 {
 	struct i915_pmu *pmu = &i915->pmu;
 
-	pmu->sample[__I915_SAMPLE_RC6].cur = __get_rc6(&i915->gt);
+	pmu->sample[__I915_SAMPLE_RC6].cur = __get_rc6(to_root_gt(i915));
 	pmu->sleep_last = ktime_get_raw();
 }
 
@@ -419,7 +419,7 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
 	struct drm_i915_private *i915 =
 		container_of(hrtimer, struct drm_i915_private, pmu.timer);
 	struct i915_pmu *pmu = &i915->pmu;
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	unsigned int period_ns;
 	ktime_t now;
 
@@ -476,7 +476,7 @@ engine_event_status(struct intel_engine_cs *engine,
 static int
 config_status(struct drm_i915_private *i915, u64 config)
 {
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 
 	switch (config) {
 	case I915_PMU_ACTUAL_FREQUENCY:
@@ -601,10 +601,10 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 			val = READ_ONCE(pmu->irq_count);
 			break;
 		case I915_PMU_RC6_RESIDENCY:
-			val = get_rc6(&i915->gt);
+			val = get_rc6(to_root_gt(i915));
 			break;
 		case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
-			val = ktime_to_ns(intel_gt_get_awake_time(&i915->gt));
+			val = ktime_to_ns(intel_gt_get_awake_time(to_root_gt(i915)));
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 51b368be0fc4a..868b30f5d07ff 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -31,7 +31,7 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
 static int query_topology_info(struct drm_i915_private *dev_priv,
 			       struct drm_i915_query_item *query_item)
 {
-	const struct sseu_dev_info *sseu = &dev_priv->gt.info.sseu;
+	const struct sseu_dev_info *sseu = &to_root_gt(dev_priv)->info.sseu;
 	struct drm_i915_query_topology_info topo;
 	u32 slice_length, subslice_length, eu_length, total_length;
 	int ret;
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 59d441cedc753..cc0fb8e7c6112 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -52,7 +52,7 @@ static u32 calc_residency(struct drm_i915_private *dev_priv,
 	u64 res = 0;
 
 	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
-		res = intel_rc6_residency_us(&dev_priv->gt.rc6, reg);
+		res = intel_rc6_residency_us(&to_root_gt(dev_priv)->rc6, reg);
 
 	return DIV_ROUND_CLOSEST_ULL(res, 1000);
 }
@@ -260,7 +260,7 @@ static ssize_t gt_act_freq_mhz_show(struct device *kdev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &i915->gt.rps;
+	struct intel_rps *rps = &to_root_gt(i915)->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
 }
@@ -269,7 +269,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &i915->gt.rps;
+	struct intel_rps *rps = &to_root_gt(i915)->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
 }
@@ -277,7 +277,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
 static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &i915->gt.rps;
+	struct intel_rps *rps = &to_root_gt(i915)->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
 }
@@ -287,7 +287,7 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
 				       const char *buf, size_t count)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &dev_priv->gt.rps;
+	struct intel_rps *rps = &to_root_gt(dev_priv)->rps;
 	ssize_t ret;
 	u32 val;
 
@@ -304,7 +304,7 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
 				     struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &dev_priv->gt.rps;
+	struct intel_rps *rps = &to_root_gt(dev_priv)->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
 }
@@ -312,7 +312,7 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
 static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_rps *rps = &gt->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
@@ -323,7 +323,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
 				     const char *buf, size_t count)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_gt *gt = to_root_gt(dev_priv);
 	struct intel_rps *rps = &gt->rps;
 	ssize_t ret;
 	u32 val;
@@ -340,7 +340,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
 static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct intel_rps *rps = &gt->rps;
 
 	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
@@ -351,7 +351,7 @@ static ssize_t gt_min_freq_mhz_store(struct device *kdev,
 				     const char *buf, size_t count)
 {
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &i915->gt.rps;
+	struct intel_rps *rps = &to_root_gt(i915)->rps;
 	ssize_t ret;
 	u32 val;
 
@@ -381,7 +381,7 @@ static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
 static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &dev_priv->gt.rps;
+	struct intel_rps *rps = &to_root_gt(dev_priv)->rps;
 	u32 val;
 
 	if (attr == &dev_attr_gt_RP0_freq_mhz)
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2ed..8bbc7f28d33cd 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -109,7 +109,7 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return 0;
 	}
 
-	if (intel_uc_wants_guc_submission(&dev_priv->gt.uc)) {
+	if (intel_uc_wants_guc_submission(&to_root_gt(dev_priv)->uc)) {
 		drm_err(&dev_priv->drm,
 			"i915 GVT-g loading failed due to Graphics virtualization is not yet supported with GuC submission\n");
 		return -EIO;
diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index 5e511bb891f95..b06995fd0eee7 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -220,7 +220,7 @@ static bool __wopcm_regs_locked(struct intel_uncore *uncore,
 void intel_wopcm_init(struct intel_wopcm *wopcm)
 {
 	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
 	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
 	u32 ctx_rsvd = context_reserved_size(i915);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 5d169624ad60b..6895384c00d9d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -14,9 +14,11 @@
 #include "intel_pxp_tee.h"
 #include "intel_pxp_tee_interface.h"
 
-static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
+static struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
 {
-	return &kdev_to_i915(i915_kdev)->gt.pxp;
+	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
+
+	return &to_root_gt(i915)->pxp;
 }
 
 static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 61bf4560d8af3..a4e8918af301f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -254,7 +254,7 @@ int i915_active_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_active_barrier),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 152d9ab135b1d..f582a10c1ebdf 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -248,7 +248,7 @@ int i915_gem_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_gem_ww_ctx),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 7e0658a776593..575187d3f11ef 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -545,7 +545,7 @@ int i915_gem_evict_mock_selftests(void)
 		return -ENOMEM;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		err = i915_subtests(tests, &i915->gt);
+		err = i915_subtests(tests, to_root_gt(i915));
 
 	mock_destroy_device(i915);
 	return err;
@@ -557,8 +557,8 @@ int i915_gem_evict_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_evict_contexts),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 46f4236039a9e..e78c820d2c42e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -155,7 +155,7 @@ static int igt_ppgtt_alloc(void *arg)
 	if (!HAS_PPGTT(dev_priv))
 		return 0;
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
+	ppgtt = i915_ppgtt_create(to_root_gt(dev_priv), 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
@@ -1053,7 +1053,7 @@ static int exercise_ppgtt(struct drm_i915_private *dev_priv,
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
+	ppgtt = i915_ppgtt_create(to_root_gt(dev_priv), 0);
 	if (IS_ERR(ppgtt)) {
 		err = PTR_ERR(ppgtt);
 		goto out_free;
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 9e9a6cb1d9e59..a336e1ea05697 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -424,7 +424,7 @@ int i915_perf_live_selftests(struct drm_i915_private *i915)
 	if (!perf->metrics_kobj || !perf->ops.enable_metric_set)
 		return 0;
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	err = alloc_empty_config(&i915->perf);
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 6496671a113ca..76e18a79b6c5e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -831,7 +831,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 	__i915_gem_object_flush_map(obj, 0, 64);
 	i915_gem_object_unpin_map(obj);
 
-	intel_gt_chipset_flush(&i915->gt);
+	intel_gt_chipset_flush(to_root_gt(i915));
 
 	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
 	if (IS_ERR(vma)) {
@@ -972,7 +972,7 @@ static struct i915_vma *recursive_batch(struct drm_i915_private *i915)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	vma = i915_vma_instance(obj, i915->gt.vm, NULL);
+	vma = i915_vma_instance(obj, to_root_gt(i915)->vm, NULL);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
 		goto err;
@@ -1004,7 +1004,7 @@ static struct i915_vma *recursive_batch(struct drm_i915_private *i915)
 	__i915_gem_object_flush_map(obj, 0, 64);
 	i915_gem_object_unpin_map(obj);
 
-	intel_gt_chipset_flush(&i915->gt);
+	intel_gt_chipset_flush(to_root_gt(i915));
 
 	return vma;
 
@@ -1690,7 +1690,7 @@ int i915_request_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_breadcrumbs_smoketest),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_subtests(tests, i915);
@@ -3081,7 +3081,7 @@ int i915_request_perf_selftests(struct drm_i915_private *i915)
 		SUBTEST(perf_parallel_engines),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 484759c9409c0..38d32a37a1131 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -298,10 +298,10 @@ int __i915_live_setup(void *data)
 	struct drm_i915_private *i915 = data;
 
 	/* The selftests expect an idle system */
-	if (intel_gt_pm_wait_for_idle(&i915->gt))
+	if (intel_gt_pm_wait_for_idle(to_root_gt(i915)))
 		return -EIO;
 
-	return intel_gt_terminally_wedged(&i915->gt);
+	return intel_gt_terminally_wedged(to_root_gt(i915));
 }
 
 int __i915_live_teardown(int err, void *data)
diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
index a6c71fca61aac..469a8fcde05a5 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
@@ -14,7 +14,7 @@
 
 int igt_flush_test(struct drm_i915_private *i915)
 {
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	int ret = intel_gt_is_wedged(gt) ? -EIO : 0;
 
 	cond_resched();
diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
index 1c721542e277c..5f817d5eae290 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
@@ -16,7 +16,7 @@ int igt_live_test_begin(struct igt_live_test *t,
 			const char *func,
 			const char *name)
 {
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 	int err;
@@ -57,7 +57,7 @@ int igt_live_test_end(struct igt_live_test *t)
 		return -EIO;
 	}
 
-	for_each_engine(engine, &i915->gt, id) {
+	for_each_engine(engine, to_root_gt(i915), id) {
 		if (t->reset_engine[id] ==
 		    i915_reset_engine_count(&i915->gpu_error, engine))
 			continue;
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 418caae847597..b69ae2a7c615b 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -1217,7 +1217,7 @@ int intel_memory_region_live_selftests(struct drm_i915_private *i915)
 		return 0;
 	}
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
@@ -1229,7 +1229,7 @@ int intel_memory_region_perf_selftests(struct drm_i915_private *i915)
 		SUBTEST(perf_memcpy),
 	};
 
-	if (intel_gt_is_wedged(&i915->gt))
+	if (intel_gt_is_wedged(to_root_gt(i915)))
 		return 0;
 
 	return i915_live_subtests(tests, i915);
diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
index bc8128170a99a..903490c6ef865 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -344,5 +344,5 @@ int intel_uncore_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_forcewake_domains),
 	};
 
-	return intel_gt_live_subtests(tests, &i915->gt);
+	return intel_gt_live_subtests(tests, to_root_gt(i915));
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index cdbeac375240c..3457fe6c87ced 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -45,7 +45,7 @@
 
 void mock_device_flush(struct drm_i915_private *i915)
 {
-	struct intel_gt *gt = &i915->gt;
+	struct intel_gt *gt = to_root_gt(i915);
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 
@@ -64,7 +64,7 @@ static void mock_device_release(struct drm_device *dev)
 		goto out;
 
 	mock_device_flush(i915);
-	intel_gt_driver_remove(&i915->gt);
+	intel_gt_driver_remove(to_root_gt(i915));
 
 	i915_gem_drain_workqueue(i915);
 	i915_gem_drain_freed_objects(i915);
@@ -73,7 +73,7 @@ static void mock_device_release(struct drm_device *dev)
 	destroy_workqueue(i915->wq);
 
 	intel_region_ttm_device_fini(i915);
-	intel_gt_driver_late_release(&i915->gt);
+	intel_gt_driver_late_release(to_root_gt(i915));
 	intel_memory_regions_driver_release(i915);
 
 	drm_mode_config_cleanup(&i915->drm);
@@ -178,10 +178,10 @@ struct drm_i915_private *mock_gem_device(void)
 	spin_lock_init(&i915->gpu_error.lock);
 
 	i915_gem_init__mm(i915);
-	intel_gt_init_early(&i915->gt, i915);
+	intel_gt_init_early(to_root_gt(i915), i915);
 	mock_uncore_init(&i915->uncore, i915);
-	atomic_inc(&i915->gt.wakeref.count); /* disable; no hw support */
-	i915->gt.awake = -ENODEV;
+	atomic_inc(&to_root_gt(i915)->wakeref.count); /* disable; no hw support */
+	to_root_gt(i915)->awake = -ENODEV;
 
 	ret = intel_region_ttm_device_init(i915);
 	if (ret)
@@ -194,19 +194,19 @@ struct drm_i915_private *mock_gem_device(void)
 	mock_init_contexts(i915);
 
 	mock_init_ggtt(i915, &i915->ggtt);
-	i915->gt.vm = i915_vm_get(&i915->ggtt.vm);
+	to_root_gt(i915)->vm = i915_vm_get(&i915->ggtt.vm);
 
 	mkwrite_device_info(i915)->platform_engine_mask = BIT(0);
-	i915->gt.info.engine_mask = BIT(0);
+	to_root_gt(i915)->info.engine_mask = BIT(0);
 
-	i915->gt.engine[RCS0] = mock_engine(i915, "mock", RCS0);
-	if (!i915->gt.engine[RCS0])
+	to_root_gt(i915)->engine[RCS0] = mock_engine(i915, "mock", RCS0);
+	if (!to_root_gt(i915)->engine[RCS0])
 		goto err_unlock;
 
-	if (mock_engine_init(i915->gt.engine[RCS0]))
+	if (mock_engine_init(to_root_gt(i915)->engine[RCS0]))
 		goto err_context;
 
-	__clear_bit(I915_WEDGED, &i915->gt.reset.flags);
+	__clear_bit(I915_WEDGED, &to_root_gt(i915)->reset.flags);
 	intel_engines_driver_register(i915);
 
 	i915->do_release = true;
@@ -215,13 +215,13 @@ struct drm_i915_private *mock_gem_device(void)
 	return i915;
 
 err_context:
-	intel_gt_driver_remove(&i915->gt);
+	intel_gt_driver_remove(to_root_gt(i915));
 err_unlock:
 	destroy_workqueue(i915->wq);
 err_drv:
 	intel_region_ttm_device_fini(i915);
 err_ttm:
-	intel_gt_driver_late_release(&i915->gt);
+	intel_gt_driver_late_release(to_root_gt(i915));
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
 	mock_destroy_device(i915);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index cc047ec594f93..5e0d9114a2fc9 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -70,7 +70,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	if (!ppgtt)
 		return NULL;
 
-	ppgtt->vm.gt = &i915->gt;
+	ppgtt->vm.gt = to_root_gt(i915);
 	ppgtt->vm.i915 = i915;
 	ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
 	ppgtt->vm.dma = i915->drm.dev;
@@ -109,7 +109,7 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
 {
 	memset(ggtt, 0, sizeof(*ggtt));
 
-	ggtt->vm.gt = &i915->gt;
+	ggtt->vm.gt = to_root_gt(i915);
 	ggtt->vm.i915 = i915;
 	ggtt->vm.is_ggtt = true;
 
@@ -130,7 +130,7 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
 	ggtt->vm.vma_ops.clear_pages = clear_pages;
 
 	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
-	i915->gt.ggtt = ggtt;
+	to_root_gt(i915)->ggtt = ggtt;
 }
 
 void mock_fini_ggtt(struct i915_ggtt *ggtt)
diff --git a/drivers/gpu/drm/i915/selftests/mock_uncore.c b/drivers/gpu/drm/i915/selftests/mock_uncore.c
index b3790ef137e41..085fb6341544f 100644
--- a/drivers/gpu/drm/i915/selftests/mock_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/mock_uncore.c
@@ -42,7 +42,7 @@ __nop_read(64)
 void mock_uncore_init(struct intel_uncore *uncore,
 		      struct drm_i915_private *i915)
 {
-	intel_uncore_init_early(uncore, &i915->gt);
+	intel_uncore_init_early(uncore, to_root_gt(i915));
 
 	ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
 	ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
-- 
2.33.1

