Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21B65487B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4C710E59D;
	Thu, 22 Dec 2022 22:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C610E59F;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/oPzHz71MrIwQxP8hI9wwUrRuvtnT9cOxghZPDpamQE=;
 b=Zdh2yyOtXVSB4zz7X7lSKB2JbZLOz3aEA5gZIbe1pt6FdWwzcc8bUOoW
 gOiE6bmTMqqPuVs8M8axEMoac7hpidz3cQEd5hSnb2FiAF9kS1mNLI7p4
 IHq6X9nSc2ONJJbKr2hKW8xhhXikJMNi4Q4v+gtnOLuwd86cP2+0P1rhR
 W1gwaBQij+fwL9RXt/QCJSFf08xjmFaq1s6J22ZUnCzVUJhGGSTatFZMh
 PnbUmsN2wCpQCBR+08BRVmqK/EtwIRsXSElbUaMO7oMEoTSOAWWBmodxY
 Wg+oSaf6Orgfa39FeE8bNbK8F+cxQ4pK4+y5ukhz23/+sG33Ix8ZUiPqa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472866"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472866"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412332"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412332"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 18/20] drm/i915/display: Remaining changes to make xe
 compile
Date: Thu, 22 Dec 2022 14:21:25 -0800
Message-Id: <20221222222127.34560-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Xe, the new Intel GPU driver, will re-use the i915 display.

At least for now, the plan is to use symbolic links and
adjust the build so we are building the display either for
i915 or for xe.

The display can be split out if needed.
Also the compilation is optional at this time

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rodrigo changed i915_reg_defs.h, commit msg, and rebased]
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |  25 ++-
 .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  23 ++-
 drivers/gpu/drm/i915/display/intel_color.c    |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 150 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
 .../gpu/drm/i915/display/intel_display_core.h |   5 +-
 .../drm/i915/display/intel_display_debugfs.c  |   8 +
 .../drm/i915/display/intel_display_power.c    |  35 ++--
 .../drm/i915/display/intel_display_power.h    |   5 +
 .../i915/display/intel_display_power_map.c    |   7 +
 .../i915/display/intel_display_power_well.c   |  17 +-
 .../drm/i915/display/intel_display_trace.h    |   6 +
 .../drm/i915/display/intel_display_types.h    |  24 ++-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   4 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 ++
 drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
 drivers/gpu/drm/i915/display/intel_dsb.c      | 124 ++++++++++++---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 ++-
 drivers/gpu/drm/i915/display/intel_fb.c       |  96 +++++++++--
 drivers/gpu/drm/i915/display/intel_fbc.c      |  49 +++++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 101 ++++++++++--
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
 .../drm/i915/display/intel_modeset_setup.c    |  11 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 .../gpu/drm/i915/display/intel_pch_display.h  |  16 ++
 .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  21 +++
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
 .../drm/i915/display/skl_universal_plane.c    |  51 +++++-
 drivers/gpu/drm/i915/display/skl_watermark.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
 drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
 44 files changed, 811 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 6621aa245caf..56875afa592f 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -522,7 +522,9 @@ void intel_atomic_state_free(struct drm_atomic_state *_state)
 	drm_atomic_state_default_release(&state->base);
 	kfree(state->global_objs);
 
+#ifdef I915
 	i915_sw_fence_fini(&state->commit_ready);
+#endif
 
 	kfree(state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 10e1fc9d0698..acb32396e73c 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -34,7 +34,9 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
+#ifdef I915
 #include "gt/intel_rps.h"
+#endif
 
 #include "intel_atomic_plane.h"
 #include "intel_cdclk.h"
@@ -107,7 +109,9 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
 
 	intel_state->ggtt_vma = NULL;
+#ifdef I915
 	intel_state->dpt_vma = NULL;
+#endif
 	intel_state->flags = 0;
 
 	/* add reference to fb */
@@ -132,7 +136,9 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
 	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
+#ifdef I915
 	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
+#endif
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
@@ -937,6 +943,7 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 	return 0;
 }
 
+#ifdef I915
 struct wait_rps_boost {
 	struct wait_queue_entry wait;
 
@@ -994,6 +1001,7 @@ static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
 
 	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
 }
+#endif
 
 /**
  * intel_prepare_plane_fb - Prepare fb for usage on plane
@@ -1011,10 +1019,11 @@ static int
 intel_prepare_plane_fb(struct drm_plane *_plane,
 		       struct drm_plane_state *_new_plane_state)
 {
-	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
-	struct intel_plane *plane = to_intel_plane(_plane);
 	struct intel_plane_state *new_plane_state =
 		to_intel_plane_state(_new_plane_state);
+#ifdef I915
+	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
+	struct intel_plane *plane = to_intel_plane(_plane);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_plane_state->uapi.state);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
@@ -1113,6 +1122,12 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	intel_plane_unpin_fb(new_plane_state);
 
 	return ret;
+#else
+	if (!intel_fb_obj(new_plane_state->hw.fb))
+		return 0;
+
+	return intel_plane_pin_fb(new_plane_state);
+#endif
 }
 
 /**
@@ -1128,18 +1143,20 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 {
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(_old_plane_state);
-	struct intel_atomic_state *state =
+	__maybe_unused struct intel_atomic_state *state =
 		to_intel_atomic_state(old_plane_state->uapi.state);
-	struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	__maybe_unused struct drm_i915_private *dev_priv = to_i915(plane->dev);
 	struct drm_i915_gem_object *obj = intel_fb_obj(old_plane_state->hw.fb);
 
 	if (!obj)
 		return;
 
+#ifdef I915
 	if (state->rps_interactive) {
 		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
 		state->rps_interactive = false;
 	}
+#endif
 
 	/* Should only be called after a successful intel_prepare_plane_fb()! */
 	intel_plane_unpin_fb(old_plane_state);
diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 5b7da72c95b8..e63eb43622e0 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -19,7 +19,7 @@
 #include "intel_dp_aux_backlight.h"
 #include "intel_dsi_dcs_backlight.h"
 #include "intel_panel.h"
-#include "intel_pci_config.h"
+#include "../i915/intel_pci_config.h"
 #include "intel_pps.h"
 #include "intel_quirks.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 54e03a3eaa0f..67b4e947589c 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -15,7 +15,7 @@
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "skl_watermark.h"
-#include "intel_mchbar_regs.h"
+#include "../i915/intel_mchbar_regs.h"
 
 /* Parameters for Qclk Geyserville (QGV) */
 struct intel_qgv_point {
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 80e2db6b5ea4..3b6a37403f25 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -23,7 +23,6 @@
 
 #include <linux/time.h>
 
-#include "hsw_ips.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
@@ -33,10 +32,14 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
-#include "intel_mchbar_regs.h"
-#include "intel_pci_config.h"
+#include "../i915/intel_mchbar_regs.h"
+#include "../i915/intel_pci_config.h"
 #include "intel_psr.h"
+
+#ifdef I915
+#include "hsw_ips.h"
 #include "vlv_sideband.h"
+#endif
 
 /**
  * DOC: CDCLK / RAWCLK
@@ -474,6 +477,7 @@ static void hsw_get_cdclk(struct drm_i915_private *dev_priv,
 		cdclk_config->cdclk = 540000;
 }
 
+#ifdef I915
 static int vlv_calc_cdclk(struct drm_i915_private *dev_priv, int min_cdclk)
 {
 	int freq_320 = (dev_priv->hpll_freq <<  1) % 320000 != 0 ?
@@ -712,6 +716,7 @@ static void chv_set_cdclk(struct drm_i915_private *dev_priv,
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_DISPLAY_CORE, wakeref);
 }
+#endif
 
 static int bdw_calc_cdclk(int min_cdclk)
 {
@@ -2375,9 +2380,11 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 
 	min_cdclk = intel_pixel_rate_to_cdclk(crtc_state);
 
+#ifdef I915
 	/* pixel rate mustn't exceed 95% of cdclk with IPS on BDW */
 	if (IS_BROADWELL(dev_priv) && hsw_crtc_state_ips_capable(crtc_state))
 		min_cdclk = DIV_ROUND_UP(min_cdclk * 100, 95);
+#endif
 
 	/* BSpec says "Do not use DisplayPort with CDCLK less than 432 MHz,
 	 * audio enabled, port width x4, and link rate HBR2 (5.4 GHz), or else
@@ -2571,6 +2578,7 @@ static int bxt_compute_min_voltage_level(struct intel_cdclk_state *cdclk_state)
 	return min_voltage_level;
 }
 
+#ifdef I915
 static int vlv_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
@@ -2599,6 +2607,7 @@ static int vlv_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 
 	return 0;
 }
+#endif
 
 static int bdw_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
@@ -3101,12 +3110,14 @@ static int pch_rawclk(struct drm_i915_private *dev_priv)
 	return (intel_de_read(dev_priv, PCH_RAWCLK_FREQ) & RAWCLK_FREQ_MASK) * 1000;
 }
 
+#ifdef I915
 static int vlv_hrawclk(struct drm_i915_private *dev_priv)
 {
 	/* RAWCLK_FREQ_VLV register updated from power well code */
 	return vlv_get_cck_clock_hpll(dev_priv, "hrawclk",
 				      CCK_DISPLAY_REF_CLOCK_CONTROL);
 }
+#endif
 
 static int i9xx_hrawclk(struct drm_i915_private *dev_priv)
 {
@@ -3188,8 +3199,10 @@ u32 intel_read_rawclk(struct drm_i915_private *dev_priv)
 		freq = cnp_rawclk(dev_priv);
 	else if (HAS_PCH_SPLIT(dev_priv))
 		freq = pch_rawclk(dev_priv);
+#ifdef I915
 	else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		freq = vlv_hrawclk(dev_priv);
+#endif
 	else if (DISPLAY_VER(dev_priv) >= 3)
 		freq = i9xx_hrawclk(dev_priv);
 	else
@@ -3246,6 +3259,7 @@ static const struct intel_cdclk_funcs bdw_cdclk_funcs = {
 	.modeset_calc_cdclk = bdw_modeset_calc_cdclk,
 };
 
+#ifdef I915
 static const struct intel_cdclk_funcs chv_cdclk_funcs = {
 	.get_cdclk = vlv_get_cdclk,
 	.set_cdclk = chv_set_cdclk,
@@ -3257,6 +3271,7 @@ static const struct intel_cdclk_funcs vlv_cdclk_funcs = {
 	.set_cdclk = vlv_set_cdclk,
 	.modeset_calc_cdclk = vlv_modeset_calc_cdclk,
 };
+#endif
 
 static const struct intel_cdclk_funcs hsw_cdclk_funcs = {
 	.get_cdclk = hsw_get_cdclk,
@@ -3378,10 +3393,12 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 		dev_priv->display.funcs.cdclk = &bdw_cdclk_funcs;
 	} else if (IS_HASWELL(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &hsw_cdclk_funcs;
+#ifdef I915
 	} else if (IS_CHERRYVIEW(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &chv_cdclk_funcs;
 	} else if (IS_VALLEYVIEW(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &vlv_cdclk_funcs;
+#endif
 	} else if (IS_SANDYBRIDGE(dev_priv) || IS_IVYBRIDGE(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &fixed_400mhz_cdclk_funcs;
 	} else if (IS_IRONLAKE(dev_priv)) {
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index d57631b0bb9a..22f42ec3ee03 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -26,6 +26,7 @@
 #include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_dpll.h"
 #include "intel_dsb.h"
 
 struct intel_color_funcs {
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 037fc140b585..5214bfe86a13 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -12,8 +12,10 @@
 #include <drm/drm_vblank_work.h>
 
 #include "i915_irq.h"
+#ifdef I915
 #include "i915_vgpu.h"
 #include "i9xx_plane.h"
+#endif
 #include "icl_dsi.h"
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
@@ -306,7 +308,11 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 		primary = skl_universal_plane_create(dev_priv, pipe,
 						     PLANE_PRIMARY);
 	else
+#ifdef I915
 		primary = intel_primary_plane_create(dev_priv, pipe);
+#else
+		BUG_ON(1);
+#endif
 	if (IS_ERR(primary)) {
 		ret = PTR_ERR(primary);
 		goto fail;
@@ -655,13 +661,15 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
 					 false);
 	} else if (new_crtc_state->uapi.event) {
+		unsigned long flags;
+
 		drm_WARN_ON(&dev_priv->drm,
 			    drm_crtc_vblank_get(&crtc->base) != 0);
 
-		spin_lock(&crtc->base.dev->event_lock);
+		spin_lock_irqsave(&crtc->base.dev->event_lock, flags);
 		drm_crtc_arm_vblank_event(&crtc->base,
 					  new_crtc_state->uapi.event);
-		spin_unlock(&crtc->base.dev->event_lock);
+		spin_unlock_irqrestore(&crtc->base.dev->event_lock, flags);
 
 		new_crtc_state->uapi.event = NULL;
 	}
@@ -684,8 +692,10 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 
 	local_irq_enable();
 
+#ifdef I915
 	if (intel_vgpu_active(dev_priv))
 		return;
+#endif
 
 	if (crtc->debug.start_vbl_count &&
 	    crtc->debug.start_vbl_count != end_vbl_count) {
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 371009f8e194..5bdd66e66202 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -31,15 +31,15 @@ static const u32 intel_cursor_formats[] = {
 
 static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv =
+	__maybe_unused struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
-	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
 
+#ifdef I915
 	if (INTEL_INFO(dev_priv)->display.cursor_needs_physical)
-		base = sg_dma_address(obj->mm.pages->sgl);
+		base = sg_dma_address(intel_fb_obj(plane_state->hw.fb)->mm.pages->sgl);
 	else
+#endif
 		base = intel_plane_ggtt_offset(plane_state);
 
 	return base + plane_state->view.color_plane[0].offset;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ef9bab4043ee..5a0a8179b0dc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -46,7 +46,7 @@
 #include <drm/drm_rect.h>
 
 #include "display/intel_audio.h"
-#include "display/intel_crt.h"
+#include "display/intel_backlight.h"
 #include "display/intel_ddi.h"
 #include "display/intel_display_debugfs.h"
 #include "display/intel_display_power.h"
@@ -55,24 +55,36 @@
 #include "display/intel_dpll.h"
 #include "display/intel_dpll_mgr.h"
 #include "display/intel_drrs.h"
+#include "display/intel_dsb.h"
 #include "display/intel_dsi.h"
-#include "display/intel_dvo.h"
 #include "display/intel_fb.h"
 #include "display/intel_gmbus.h"
 #include "display/intel_hdmi.h"
 #include "display/intel_lvds.h"
-#include "display/intel_sdvo.h"
 #include "display/intel_snps_phy.h"
-#include "display/intel_tv.h"
 #include "display/intel_vdsc.h"
 #include "display/intel_vrr.h"
 
+#ifdef I915
+#include "display/intel_crt.h"
+#include "display/intel_dvo.h"
+#include "display/intel_overlay.h"
+#include "display/intel_sdvo.h"
+#include "display/intel_tv.h"
+
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
+#include "i9xx_plane.h"
+#include "vlv_dsi.h"
+#include "vlv_dsi_pll.h"
+#include "vlv_dsi_regs.h"
+#include "vlv_sideband.h"
+#endif
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
@@ -101,7 +113,6 @@
 #include "intel_hti.h"
 #include "intel_modeset_verify.h"
 #include "intel_modeset_setup.h"
-#include "intel_overlay.h"
 #include "intel_panel.h"
 #include "intel_pch_display.h"
 #include "intel_pch_refclk.h"
@@ -114,14 +125,16 @@
 #include "intel_sprite.h"
 #include "intel_tc.h"
 #include "intel_vga.h"
-#include "i9xx_plane.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
+
+#ifdef I915
 #include "vlv_dsi.h"
 #include "vlv_dsi_pll.h"
 #include "vlv_dsi_regs.h"
 #include "vlv_sideband.h"
+#endif
 
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state);
@@ -224,6 +237,7 @@ static int intel_compute_global_watermarks(struct intel_atomic_state *state)
 	return 0;
 }
 
+#ifdef I915
 /* returns HPLL frequency in kHz */
 int vlv_get_hpll_vco(struct drm_i915_private *dev_priv)
 {
@@ -280,6 +294,7 @@ static void intel_update_czclk(struct drm_i915_private *dev_priv)
 	drm_dbg(&dev_priv->drm, "CZ clock rate: %d kHz\n",
 		dev_priv->czclk_freq);
 }
+#endif
 
 static bool is_hdr_mode(const struct intel_crtc_state *crtc_state)
 {
@@ -879,14 +894,17 @@ __intel_display_resume(struct drm_i915_private *i915,
 	return intel_display_commit_duplicated_state(to_intel_atomic_state(state), ctx);
 }
 
+#ifdef I915
 static bool gpu_reset_clobbers_display(struct drm_i915_private *dev_priv)
 {
 	return (INTEL_INFO(dev_priv)->gpu_reset_clobbers_display &&
 		intel_has_gpu_reset(to_gt(dev_priv)));
 }
+#endif
 
 void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
 {
+#ifdef I915
 	struct drm_modeset_acquire_ctx *ctx = &dev_priv->display.restore.reset_ctx;
 	struct drm_atomic_state *state;
 	int ret;
@@ -945,10 +963,12 @@ void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
 
 	dev_priv->display.restore.modeset_state = state;
 	state->acquire_ctx = ctx;
+#endif
 }
 
 void intel_display_finish_reset(struct drm_i915_private *i915)
 {
+#ifdef I915
 	struct drm_modeset_acquire_ctx *ctx = &i915->display.restore.reset_ctx;
 	struct drm_atomic_state *state;
 	int ret;
@@ -996,6 +1016,7 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 	mutex_unlock(&i915->drm.mode_config.mutex);
 
 	clear_bit_unlock(I915_RESET_MODESET, &to_gt(i915)->reset.flags);
+#endif
 }
 
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
@@ -3123,6 +3144,7 @@ static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 		intel_de_read(dev_priv, PFIT_PGM_RATIOS);
 }
 
+#ifdef I915
 static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
@@ -3183,6 +3205,7 @@ static void chv_crtc_clock_get(struct intel_crtc *crtc,
 
 	pipe_config->port_clock = chv_calc_dpll_params(refclk, &clock);
 }
+#endif
 
 static enum intel_output_format
 bdw_get_pipemisc_output_format(struct intel_crtc *crtc)
@@ -3287,7 +3310,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 	intel_get_pipe_src_size(crtc, pipe_config);
 
 	i9xx_get_pfit_config(pipe_config);
-
+#ifdef I915
 	if (DISPLAY_VER(dev_priv) >= 4) {
 		/* No way to read it out on pipes B and C */
 		if (IS_CHERRYVIEW(dev_priv) && crtc->pipe != PIPE_A)
@@ -3329,6 +3352,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 	else if (IS_VALLEYVIEW(dev_priv))
 		vlv_crtc_clock_get(crtc, pipe_config);
 	else
+#endif
 		i9xx_crtc_clock_get(crtc, pipe_config);
 
 	/*
@@ -3987,6 +4011,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config,
 					 struct intel_display_power_domain_set *power_domain_set)
 {
+#ifdef I915
 	struct drm_device *dev = crtc->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder;
@@ -4025,6 +4050,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 		pipe_config->cpu_transcoder = cpu_transcoder;
 		break;
 	}
+#endif
 
 	return transcoder_is_dsi(pipe_config->cpu_transcoder);
 }
@@ -4129,7 +4155,9 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 			ilk_get_pfit_config(pipe_config);
 	}
 
+#ifdef I915
 	hsw_ips_get_config(pipe_config);
+#endif
 
 	if (pipe_config->cpu_transcoder != TRANSCODER_EDP &&
 	    !transcoder_is_dsi(pipe_config->cpu_transcoder)) {
@@ -4762,8 +4790,8 @@ static u16 hsw_linetime_wm(const struct intel_crtc_state *crtc_state)
 	return min(linetime_wm, 0x1ff);
 }
 
-static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
-			       const struct intel_cdclk_state *cdclk_state)
+static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
+				      const struct intel_cdclk_state *cdclk_state)
 {
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
@@ -4806,13 +4834,14 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	const struct intel_cdclk_state *cdclk_state;
+	__maybe_unused const struct intel_cdclk_state *cdclk_state;
 
 	if (DISPLAY_VER(dev_priv) >= 9)
 		crtc_state->linetime = skl_linetime_wm(crtc_state);
 	else
 		crtc_state->linetime = hsw_linetime_wm(crtc_state);
 
+#ifdef I915
 	if (!hsw_crtc_supports_ips(crtc))
 		return 0;
 
@@ -4822,6 +4851,7 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 
 	crtc_state->ips_linetime = hsw_ips_linetime_wm(crtc_state,
 						       cdclk_state);
+#endif
 
 	return 0;
 }
@@ -4890,11 +4920,13 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 			return ret;
 	}
 
+#ifdef I915
 	if (HAS_IPS(dev_priv)) {
 		ret = hsw_ips_compute_config(state, crtc);
 		if (ret)
 			return ret;
 	}
+#endif
 
 	if (DISPLAY_VER(dev_priv) >= 9 ||
 	    IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv)) {
@@ -5503,6 +5535,7 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
+#ifdef I915
 	if (dev_priv->params.fastboot != -1)
 		return dev_priv->params.fastboot;
 
@@ -5516,6 +5549,9 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 
 	/* Disabled by default on all others */
 	return false;
+#else
+	return true;
+#endif
 }
 
 bool
@@ -7333,6 +7369,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	drm_WARN_ON(&dev_priv->drm, update_pipes);
 }
 
+#ifdef I915
 static void intel_atomic_helper_free_state(struct drm_i915_private *dev_priv)
 {
 	struct intel_atomic_state *state, *next;
@@ -7350,9 +7387,11 @@ static void intel_atomic_helper_free_state_worker(struct work_struct *work)
 
 	intel_atomic_helper_free_state(dev_priv);
 }
+#endif
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
+#ifdef I915
 	struct wait_queue_entry wait_fence, wait_reset;
 	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
 
@@ -7376,6 +7415,24 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 	finish_wait(bit_waitqueue(&to_gt(dev_priv)->reset.flags,
 				  I915_RESET_MODESET),
 		    &wait_reset);
+#else
+	struct intel_plane_state *plane_state;
+	struct intel_plane *plane;
+	int i;
+
+	for_each_new_intel_plane_in_state(intel_state, plane, plane_state, i) {
+		struct xe_bo *bo;
+
+		if (plane_state->uapi.fence)
+			dma_fence_wait(plane_state->uapi.fence, false);
+		bo = intel_fb_obj(plane_state->hw.fb);
+		if (!bo)
+			continue;
+
+		/* TODO: May deadlock, need to grab all fences in prepare_plane_fb */
+		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL, false, MAX_SCHEDULE_TIMEOUT);
+	}
+#endif
 }
 
 static void intel_atomic_cleanup_work(struct work_struct *work)
@@ -7394,9 +7451,45 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 	drm_atomic_helper_commit_cleanup_done(&state->base);
 	drm_atomic_state_put(&state->base);
 
+#ifdef I915
 	intel_atomic_helper_free_state(i915);
+#endif
 }
 
+#ifndef I915
+static int i915_gem_object_read_from_page(struct xe_bo *bo,
+					  u32 ofs, u64 *ptr, u32 size)
+{
+	struct ttm_bo_kmap_obj map;
+	void *virtual;
+	bool is_iomem;
+	int ret;
+	struct ww_acquire_ctx ww;
+
+	XE_BUG_ON(size != 8);
+
+	ret = xe_bo_lock(bo, &ww, 0, true);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
+	if (ret)
+		goto out_unlock;
+
+	ofs &= ~PAGE_MASK;
+	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
+	if (is_iomem)
+		*ptr = readq((void __iomem *)(virtual + ofs));
+	else
+		*ptr = *(u64 *)(virtual + ofs);
+
+	ttm_bo_kunmap(&map);
+out_unlock:
+	xe_bo_unlock(bo, &ww);
+	return ret;
+}
+#endif
+
 static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
@@ -7629,6 +7722,7 @@ static void intel_atomic_commit_work(struct work_struct *work)
 	intel_atomic_commit_tail(state);
 }
 
+#ifdef I915
 static int
 intel_atomic_commit_ready(struct i915_sw_fence *fence,
 			  enum i915_sw_fence_notify notify)
@@ -7653,6 +7747,7 @@ intel_atomic_commit_ready(struct i915_sw_fence *fence,
 
 	return NOTIFY_DONE;
 }
+#endif
 
 static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 {
@@ -7677,9 +7772,11 @@ static int intel_atomic_commit(struct drm_device *dev,
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
+#ifdef I915
 	drm_atomic_state_get(&state->base);
 	i915_sw_fence_init(&state->commit_ready,
 			   intel_atomic_commit_ready);
+#endif
 
 	/*
 	 * The intel_legacy_cursor_update() fast path takes care
@@ -7783,7 +7880,7 @@ static void intel_plane_possible_crtcs_init(struct drm_i915_private *dev_priv)
 	}
 }
 
-
+#ifdef I915
 int intel_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file)
 {
@@ -7800,6 +7897,7 @@ int intel_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 }
+#endif
 
 static u32 intel_encoder_possible_clones(struct intel_encoder *encoder)
 {
@@ -7827,7 +7925,7 @@ static u32 intel_encoder_possible_crtcs(struct intel_encoder *encoder)
 	return possible_crtcs;
 }
 
-static bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
+static inline bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
 {
 	if (!IS_MOBILE(dev_priv))
 		return false;
@@ -7841,7 +7939,7 @@ static bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
 	return true;
 }
 
-static bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
+static inline bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
 {
 	if (DISPLAY_VER(dev_priv) >= 9)
 		return false;
@@ -7866,7 +7964,6 @@ static bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
 static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 {
 	struct intel_encoder *encoder;
-	bool dpd_is_edp = false;
 
 	intel_pps_unlock_regs_wa(dev_priv);
 
@@ -7926,7 +8023,9 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
 		intel_ddi_init(dev_priv, PORT_C);
+#ifdef I915
 		vlv_dsi_init(dev_priv);
+#endif
 	} else if (DISPLAY_VER(dev_priv) >= 9) {
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
@@ -7935,9 +8034,10 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_E);
 	} else if (HAS_DDI(dev_priv)) {
 		u32 found;
-
+#ifdef I915
 		if (intel_ddi_crt_present(dev_priv))
 			intel_crt_init(dev_priv);
+#endif
 
 		/* Haswell uses DDI functions to detect digital outputs. */
 		found = intel_de_read(dev_priv, DDI_BUF_CTL(PORT_A)) & DDI_INIT_DISPLAY_DETECTED;
@@ -7953,7 +8053,9 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 			intel_ddi_init(dev_priv, PORT_D);
 		if (found & SFUSE_STRAP_DDIF_DETECTED)
 			intel_ddi_init(dev_priv, PORT_F);
+#ifdef I915
 	} else if (HAS_PCH_SPLIT(dev_priv)) {
+		bool dpd_is_edp = false;
 		int found;
 
 		/*
@@ -8090,6 +8192,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 
 		intel_crt_init(dev_priv);
 		intel_dvo_init(dev_priv);
+#endif
 	}
 
 	for_each_intel_encoder(&dev_priv->drm, encoder) {
@@ -8277,6 +8380,10 @@ static const struct intel_display_funcs skl_display_funcs = {
 	.get_initial_plane_config = skl_get_initial_plane_config,
 };
 
+#ifndef I915
+#define i9xx_get_initial_plane_config skl_get_initial_plane_config
+#endif
+
 static const struct intel_display_funcs ddi_display_funcs = {
 	.get_pipe_config = hsw_get_pipe_config,
 	.crtc_enable = hsw_crtc_enable,
@@ -8661,9 +8768,11 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 	if (ret)
 		goto cleanup_vga_client_pw_domain_dmc;
 
+#ifdef I915
 	init_llist_head(&i915->display.atomic_helper.free_list);
 	INIT_WORK(&i915->display.atomic_helper.free_work,
 		  intel_atomic_helper_free_state_worker);
+#endif
 
 	intel_init_quirks(i915);
 
@@ -8716,7 +8825,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_shared_dpll_init(i915);
 	intel_fdi_pll_freq_update(i915);
 
+#ifdef I915
 	intel_update_czclk(i915);
+#endif
 	intel_modeset_init_hw(i915);
 	intel_dpll_update_ref_clks(i915);
 
@@ -8923,11 +9034,14 @@ void intel_display_resume(struct drm_device *dev)
 		drm_atomic_state_put(state);
 }
 
-static void intel_hpd_poll_fini(struct drm_i915_private *i915)
+void intel_hpd_poll_fini(struct drm_i915_private *i915)
 {
 	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
+	if (!HAS_DISPLAY(i915))
+		return;
+
 	/* Kill all the work that may have been queued by hpd. */
 	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter) {
@@ -8950,8 +9064,10 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 	flush_workqueue(i915->display.wq.flip);
 	flush_workqueue(i915->display.wq.modeset);
 
+#ifdef I915
 	flush_work(&i915->display.atomic_helper.free_work);
 	drm_WARN_ON(&i915->drm, !llist_empty(&i915->display.atomic_helper.free_list));
+#endif
 
 	/*
 	 * MST topology needs to be suspended so we don't have any calls to
@@ -9011,12 +9127,14 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
 {
 	struct drm_privacy_screen *privacy_screen;
 
+#ifdef I915
 	/*
 	 * apple-gmux is needed on dual GPU MacBook Pro
 	 * to probe the panel if we're the inactive GPU.
 	 */
 	if (vga_switcheroo_client_probe_defer(pdev))
 		return true;
+#endif
 
 	/* If the LCD panel has a privacy-screen, wait for it */
 	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index ef73730f32b0..b063d16f4767 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -545,6 +545,7 @@ int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
 		      const char *name, u32 reg, int ref_freq);
 int vlv_get_cck_clock_hpll(struct drm_i915_private *dev_priv,
 			   const char *name, u32 reg);
+void intel_hpd_poll_fini(struct drm_i915_private *i915);
 void intel_init_display_hooks(struct drm_i915_private *dev_priv);
 unsigned int intel_fb_xy_to_linear(int x, int y,
 				   const struct intel_plane_state *state,
@@ -670,10 +671,16 @@ void assert_transcoder(struct drm_i915_private *dev_priv,
  * enable distros and users to tailor their preferred amount of i915 abrt
  * spam.
  */
+#ifdef I915
+#define i915_display_verbose_check (i915_modparams.verbose_state_checks)
+#else
+#define i915_display_verbose_check 1
+#endif
+
 #define I915_STATE_WARN(condition, format...) ({			\
 	int __ret_warn_on = !!(condition);				\
 	if (unlikely(__ret_warn_on))					\
-		if (!WARN(i915_modparams.verbose_state_checks, format))	\
+		if (!WARN(i915_display_verbose_check, format))	\
 			DRM_ERROR(format);				\
 	unlikely(__ret_warn_on);					\
 })
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 57ddce3ba02b..1c65b5b2893e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -227,12 +227,13 @@ struct intel_wm {
 	u16 skl_latency[8];
 
 	/* current hardware state */
+#ifdef I915
 	union {
 		struct ilk_wm_values hw;
 		struct vlv_wm_values vlv;
 		struct g4x_wm_values g4x;
 	};
-
+#endif
 	u8 max_level;
 
 	/*
@@ -274,10 +275,12 @@ struct intel_display {
 	} funcs;
 
 	/* Grouping using anonymous structs. Keep sorted. */
+#ifdef I915
 	struct intel_atomic_helper {
 		struct llist_head free_list;
 		struct work_struct free_work;
 	} atomic_helper;
+#endif
 
 	struct {
 		/* backlight registers and fields in struct intel_panel */
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 7bcd90384a46..6c40ca8a709f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -8,7 +8,11 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
 
+#ifdef I915
 #include "i915_debugfs.h"
+#else
+#define i915_debugfs_describe_obj(a, b) do { } while (0)
+#endif
 #include "i915_irq.h"
 #include "i915_reg.h"
 #include "intel_de.h"
@@ -51,6 +55,7 @@ static int i915_frontbuffer_tracking(struct seq_file *m, void *unused)
 
 static int i915_ips_status(struct seq_file *m, void *unused)
 {
+#ifdef I915
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	intel_wakeref_t wakeref;
 
@@ -74,6 +79,9 @@ static int i915_ips_status(struct seq_file *m, void *unused)
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
 
 	return 0;
+#else
+	return -ENODEV;
+#endif
 }
 
 static int i915_sr_status(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index cdb36e3f96cd..c3a57ec0d2f3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -16,11 +16,17 @@
 #include "intel_display_power_well.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
-#include "intel_mchbar_regs.h"
+#include "../i915/intel_mchbar_regs.h"
 #include "intel_pch_refclk.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
+
+#ifdef I915
 #include "vlv_sideband.h"
+#else
+#define PUNIT_REG_ISPSSPM0 0
+#define PUNIT_REG_VEDSSPM0 0
+#endif
 
 #define for_each_power_domain_well(__dev_priv, __power_well, __domain)	\
 	for_each_power_well(__dev_priv, __power_well)				\
@@ -212,8 +218,10 @@ bool __intel_display_power_is_enabled(struct drm_i915_private *dev_priv,
 	struct i915_power_well *power_well;
 	bool is_enabled;
 
+#ifdef I915
 	if (dev_priv->runtime_pm.suspended)
 		return false;
+#endif
 
 	is_enabled = true;
 
@@ -621,7 +629,6 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	struct drm_i915_private *dev_priv =
 		container_of(power_domains, struct drm_i915_private,
 			     display.power.domains);
-	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	enum intel_display_power_domain domain;
 	intel_wakeref_t wakeref;
 
@@ -630,8 +637,8 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	 * wakeref to make the state checker happy about the HW access during
 	 * power well disabling.
 	 */
-	assert_rpm_raw_wakeref_held(rpm);
-	wakeref = intel_runtime_pm_get(rpm);
+	assert_rpm_raw_wakeref_held(&dev_priv->runtime_pm);
+	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
 	for_each_power_domain(domain, mask) {
 		/* Clear before put, so put's sanity check is happy. */
@@ -639,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 		__intel_display_power_put_domain(dev_priv, domain);
 	}
 
-	intel_runtime_pm_put(rpm, wakeref);
+	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
 }
 
 static void
@@ -649,8 +656,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 		container_of(work, struct drm_i915_private,
 			     display.power.domains.async_put_work.work);
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
-	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
-	intel_wakeref_t new_work_wakeref = intel_runtime_pm_get_raw(rpm);
+	intel_wakeref_t new_work_wakeref = intel_runtime_pm_get_raw(&dev_priv->runtime_pm);
 	intel_wakeref_t old_work_wakeref = 0;
 
 	mutex_lock(&power_domains->lock);
@@ -689,9 +695,9 @@ intel_display_power_put_async_work(struct work_struct *work)
 	mutex_unlock(&power_domains->lock);
 
 	if (old_work_wakeref)
-		intel_runtime_pm_put_raw(rpm, old_work_wakeref);
+		intel_runtime_pm_put_raw(&dev_priv->runtime_pm, old_work_wakeref);
 	if (new_work_wakeref)
-		intel_runtime_pm_put_raw(rpm, new_work_wakeref);
+		intel_runtime_pm_put_raw(&dev_priv->runtime_pm, new_work_wakeref);
 }
 
 /**
@@ -709,8 +715,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     intel_wakeref_t wakeref)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
-	struct intel_runtime_pm *rpm = &i915->runtime_pm;
-	intel_wakeref_t work_wakeref = intel_runtime_pm_get_raw(rpm);
+	intel_wakeref_t work_wakeref = intel_runtime_pm_get_raw(&i915->runtime_pm);
 
 	mutex_lock(&power_domains->lock);
 
@@ -737,9 +742,9 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 	mutex_unlock(&power_domains->lock);
 
 	if (work_wakeref)
-		intel_runtime_pm_put_raw(rpm, work_wakeref);
+		intel_runtime_pm_put_raw(&i915->runtime_pm, work_wakeref);
 
-	intel_runtime_pm_put(rpm, wakeref);
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
 /**
@@ -1830,6 +1835,7 @@ static void vlv_cmnlane_wa(struct drm_i915_private *dev_priv)
 
 static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0)
 {
+#ifdef I915
 	bool ret;
 
 	vlv_punit_get(dev_priv);
@@ -1837,6 +1843,9 @@ static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0
 	vlv_punit_put(dev_priv);
 
 	return ret;
+#else
+	return false;
+#endif
 }
 
 static void assert_ved_power_gated(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index d220f6b16e00..3aae045749f7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -7,6 +7,11 @@
 #define __INTEL_DISPLAY_POWER_H__
 
 #include "intel_wakeref.h"
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include "intel_runtime_pm.h"
 
 enum aux_ch;
 enum dpio_channel;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
index f5d66ca85b19..6e1facc66af3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
@@ -6,7 +6,10 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 
+#ifdef I915
 #include "vlv_sideband_reg.h"
+#else
+#endif
 
 #include "intel_display_power_map.h"
 #include "intel_display_power_well.h"
@@ -197,6 +200,7 @@ I915_DECL_PW_DOMAINS(vlv_pwdoms_dpio_tx_bc_lanes,
 	POWER_DOMAIN_INIT);
 
 static const struct i915_power_well_desc vlv_power_wells_main[] = {
+#ifdef I915
 	{
 		.instances = &I915_PW_INSTANCES(
 			I915_PW("display", &vlv_pwdoms_display,
@@ -224,6 +228,7 @@ static const struct i915_power_well_desc vlv_power_wells_main[] = {
 		),
 		.ops = &vlv_dpio_cmn_power_well_ops,
 	},
+#endif
 };
 
 static const struct i915_power_well_desc_list vlv_power_wells[] = {
@@ -274,6 +279,7 @@ I915_DECL_PW_DOMAINS(chv_pwdoms_dpio_cmn_d,
 	POWER_DOMAIN_INIT);
 
 static const struct i915_power_well_desc chv_power_wells_main[] = {
+#ifdef I915
 	{
 		/*
 		 * Pipe A power well is the new disp2d well. Pipe B and C
@@ -295,6 +301,7 @@ static const struct i915_power_well_desc chv_power_wells_main[] = {
 		),
 		.ops = &chv_dpio_cmn_power_well_ops,
 	},
+#endif
 };
 
 static const struct i915_power_well_desc_list chv_power_wells[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index a1d75956ae97..9683cb661f62 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -8,7 +8,6 @@
 #include "intel_backlight_regs.h"
 #include "intel_combo_phy.h"
 #include "intel_combo_phy_regs.h"
-#include "intel_crt.h"
 #include "intel_de.h"
 #include "intel_display_power_well.h"
 #include "intel_display_types.h"
@@ -22,8 +21,12 @@
 #include "intel_tc.h"
 #include "intel_vga.h"
 #include "skl_watermark.h"
+
+#ifdef I915
+#include "intel_crt.h"
 #include "vlv_sideband.h"
 #include "vlv_sideband_reg.h"
+#endif
 
 struct i915_power_well_regs {
 	i915_reg_t bios;
@@ -1061,6 +1064,7 @@ static void i830_pipes_power_well_sync_hw(struct drm_i915_private *dev_priv,
 		i830_pipes_power_well_disable(dev_priv, power_well);
 }
 
+#ifdef I915
 static void vlv_set_power_well(struct drm_i915_private *dev_priv,
 			       struct i915_power_well *power_well, bool enable)
 {
@@ -1719,6 +1723,7 @@ static void chv_pipe_power_well_disable(struct drm_i915_private *dev_priv,
 
 	chv_set_pipe_power_well(dev_priv, power_well, false);
 }
+#endif
 
 static void
 tgl_tc_cold_request(struct drm_i915_private *i915, bool block)
@@ -1843,17 +1848,21 @@ const struct i915_power_well_ops i9xx_always_on_power_well_ops = {
 };
 
 const struct i915_power_well_ops chv_pipe_power_well_ops = {
+#ifdef I915
 	.sync_hw = chv_pipe_power_well_sync_hw,
 	.enable = chv_pipe_power_well_enable,
 	.disable = chv_pipe_power_well_disable,
 	.is_enabled = chv_pipe_power_well_enabled,
+#endif
 };
 
 const struct i915_power_well_ops chv_dpio_cmn_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
+#ifdef I915
 	.enable = chv_dpio_cmn_power_well_enable,
 	.disable = chv_dpio_cmn_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
+#endif
 };
 
 const struct i915_power_well_ops i830_pipes_power_well_ops = {
@@ -1894,23 +1903,29 @@ const struct i915_power_well_ops bxt_dpio_cmn_power_well_ops = {
 
 const struct i915_power_well_ops vlv_display_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
+#ifdef I915
 	.enable = vlv_display_power_well_enable,
 	.disable = vlv_display_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
+#endif
 };
 
 const struct i915_power_well_ops vlv_dpio_cmn_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
+#ifdef I915
 	.enable = vlv_dpio_cmn_power_well_enable,
 	.disable = vlv_dpio_cmn_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
+#endif
 };
 
 const struct i915_power_well_ops vlv_dpio_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
+#ifdef I915
 	.enable = vlv_power_well_enable,
 	.disable = vlv_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
+#endif
 };
 
 static const struct i915_power_well_regs icl_aux_power_well_regs = {
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 725aba3fa531..391ddb94062b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -185,6 +185,7 @@ TRACE_EVENT(intel_memory_cxsr,
 		      __entry->frame[PIPE_C], __entry->scanline[PIPE_C])
 );
 
+#ifdef I915
 TRACE_EVENT(g4x_wm,
 	    TP_PROTO(struct intel_crtc *crtc, const struct g4x_wm_values *wm),
 	    TP_ARGS(crtc, wm),
@@ -277,6 +278,7 @@ TRACE_EVENT(vlv_wm,
 		      __entry->primary, __entry->sprite0, __entry->sprite1, __entry->cursor,
 		      __entry->sr_plane, __entry->sr_cursor)
 );
+#endif
 
 TRACE_EVENT(vlv_fifo_size,
 	    TP_PROTO(struct intel_crtc *crtc, u32 sprite0_start, u32 sprite1_start, u32 fifo_size),
@@ -648,6 +650,10 @@ TRACE_EVENT(intel_frontbuffer_flush,
 /* This part must be outside protection */
 #undef TRACE_INCLUDE_PATH
 #undef TRACE_INCLUDE_FILE
+#ifdef I915
 #define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
+#else
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe/display
+#endif
 #define TRACE_INCLUDE_FILE intel_display_trace
 #include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 34250a9cf3e1..3bd391d33e42 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,6 +46,7 @@
 #include <drm/i915_mei_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
+#include "i915_utils.h"
 #include "i915_vma.h"
 #include "i915_vma_types.h"
 #include "intel_bios.h"
@@ -141,7 +142,9 @@ struct intel_framebuffer {
 		struct intel_fb_view remapped_view;
 	};
 
+#ifdef I915
 	struct i915_address_space *dpt_vm;
+#endif
 };
 
 enum intel_hotplug_state {
@@ -653,7 +656,9 @@ struct intel_atomic_state {
 
 	bool rps_interactive;
 
+#ifdef I915
 	struct i915_sw_fence commit_ready;
+#endif
 
 	struct llist_node freed;
 };
@@ -679,7 +684,11 @@ struct intel_plane_state {
 	} hw;
 
 	struct i915_vma *ggtt_vma;
+#ifdef I915
 	struct i915_vma *dpt_vma;
+#else
+	struct i915_vma embed_vma;
+#endif
 	unsigned long flags;
 #define PLANE_HAS_FENCE BIT(0)
 
@@ -739,9 +748,9 @@ struct intel_plane_state {
 	 * this plane. They're calculated by the linked plane's wm code.
 	 */
 	u32 planar_slave;
-
+#ifdef I915
 	struct drm_intel_sprite_colorkey ckey;
-
+#endif
 	struct drm_rect psr2_sel_fetch_area;
 
 	/* Clear Color Value */
@@ -851,6 +860,7 @@ struct skl_pipe_wm {
 	bool use_sagv_wm;
 };
 
+#ifdef I915
 enum vlv_wm_level {
 	VLV_WM_LEVEL_PM2,
 	VLV_WM_LEVEL_PM5,
@@ -884,6 +894,7 @@ struct g4x_wm_state {
 	bool hpll_en;
 	bool fbc_en;
 };
+#endif
 
 struct intel_crtc_wm_state {
 	union {
@@ -927,7 +938,7 @@ struct intel_crtc_wm_state {
 			/* pre-icl: for planar Y */
 			struct skl_ddb_entry plane_ddb_y[I915_MAX_PLANES];
 		} skl;
-
+#ifdef I915
 		struct {
 			struct g4x_pipe_wm raw[NUM_VLV_WM_LEVELS]; /* not inverted */
 			struct vlv_wm_state intermediate; /* inverted */
@@ -940,6 +951,7 @@ struct intel_crtc_wm_state {
 			struct g4x_wm_state intermediate;
 			struct g4x_wm_state optimal;
 		} g4x;
+#endif
 	};
 
 	/*
@@ -1387,6 +1399,7 @@ struct intel_crtc {
 	bool pch_fifo_underrun_disabled;
 
 	/* per-pipe watermark state */
+#ifdef I915
 	struct {
 		/* watermarks currently being used  */
 		union {
@@ -1395,6 +1408,7 @@ struct intel_crtc {
 			struct g4x_wm_state g4x;
 		} active;
 	} wm;
+#endif
 
 	struct {
 		struct mutex mutex;
@@ -2053,7 +2067,11 @@ intel_crtc_needs_color_update(const struct intel_crtc_state *crtc_state)
 
 static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	return i915_ggtt_offset(plane_state->ggtt_vma);
+#else
+	return plane_state->ggtt_vma->node.start;
+#endif
 }
 
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 905b5dcdca14..5482ca6ccda7 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -30,6 +30,18 @@
 #include "intel_dmc.h"
 #include "intel_dmc_regs.h"
 
+#ifndef I915
+#include "xe_uc_fw.h"
+
+#define INTEL_UC_FIRMWARE_URL XE_UC_FIRMWARE_URL
+
+__printf(2, 3)
+static inline void
+i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
+{
+}
+#endif
+
 /**
  * DOC: DMC Firmware Support
  *
@@ -262,8 +274,11 @@ static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *i915,
 			struct stepping_info *si)
 {
+#ifdef I915
 	const char *step_name = intel_step_name(RUNTIME_INFO(i915)->step.display_step);
-
+#else
+	const char *step_name = xe_step_name(i915->info.step.display);
+#endif
 	si->stepping = step_name[0];
 	si->substepping = step_name[1];
 	return si;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bf80f296a8fd..55973e9aeca3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -43,8 +43,10 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
+#ifdef I915
 #include "g4x_dp.h"
 #include "i915_debugfs.h"
+#endif
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
@@ -2164,8 +2166,10 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
 
+#ifdef I915
 	if (!HAS_DDI(dev_priv))
 		g4x_dp_set_clock(encoder, pipe_config);
+#endif
 
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
@@ -5209,9 +5213,11 @@ intel_edp_add_properties(struct intel_dp *intel_dp)
 static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
 				      struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	enum pipe pipe = INVALID_PIPE;
 
+#ifdef I915
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
 	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		/*
 		 * Figure out the current pipe for the initial backlight setup.
@@ -5231,6 +5237,7 @@ static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
 			    connector->base.base.id, connector->base.name,
 			    pipe_name(pipe));
 	}
+#endif
 
 	intel_backlight_setup(connector, pipe);
 }
@@ -5427,8 +5434,10 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	intel_dp_set_default_sink_rates(intel_dp);
 	intel_dp_set_default_max_sink_lane_count(intel_dp);
 
+#ifdef I915
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		intel_dp->pps.active_pipe = vlv_active_pipe(intel_dp);
+#endif
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "Adding %s connector on [ENCODER:%d:%s]\n",
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 220aa88c67ee..b4b9d2e1fec7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -5,7 +5,11 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
+#ifdef I915
 #include "i915_trace.h"
+#else
+#define trace_i915_reg_rw(a...) do { } while (0)
+#endif
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dp_aux.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
index 9c7725dacb47..952e8d446425 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
@@ -7,6 +7,7 @@
 #define __INTEL_DPIO_PHY_H__
 
 #include <linux/types.h>
+#include "intel_display.h"
 
 enum pipe;
 enum port;
@@ -26,6 +27,7 @@ enum dpio_phy {
 	DPIO_PHY2,
 };
 
+#ifdef I915
 void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 			     enum dpio_phy *phy, enum dpio_channel *ch);
 void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
@@ -71,4 +73,17 @@ void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 void vlv_phy_reset_lanes(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *old_crtc_state);
 
+#else
+#define bxt_port_to_phy_channel(xe, port, phy, ch) do { *phy = 0; *ch = 0; } while (xe && port && 0)
+static inline void bxt_ddi_phy_set_signal_levels(struct intel_encoder *x,
+						 const struct intel_crtc_state *y) {}
+#define bxt_ddi_phy_init(xe, phy) do { } while (xe && phy && 0)
+#define bxt_ddi_phy_uninit(xe, phy) do { } while (xe && phy && 0)
+#define bxt_ddi_phy_is_enabled(xe, phy) (xe && phy && 0)
+static inline bool bxt_ddi_phy_verify_state(struct xe_device *xe, enum dpio_phy phy) { return false; }
+#define bxt_ddi_phy_calc_lane_lat_optim_mask(x) (x && 0)
+#define bxt_ddi_phy_set_lane_optim_mask(x, y) do { } while (x && y && 0)
+#define bxt_ddi_phy_get_lane_lat_optim_mask(x) (x && 0)
+#endif
+
 #endif /* __INTEL_DPIO_PHY_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index c236aafe9be0..bfc214b36585 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -17,7 +17,10 @@
 #include "intel_panel.h"
 #include "intel_pps.h"
 #include "intel_snps_phy.h"
+
+#ifdef I915
 #include "vlv_sideband.h"
+#endif
 
 struct intel_dpll_funcs {
 	int (*crtc_compute_clock)(struct intel_atomic_state *state,
@@ -1594,6 +1597,7 @@ void i9xx_enable_pll(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+#ifdef I915
 static void vlv_pllb_recal_opamp(struct drm_i915_private *dev_priv,
 				 enum pipe pipe)
 {
@@ -2005,6 +2009,7 @@ void chv_disable_pll(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	vlv_dpio_put(dev_priv);
 }
+#endif
 
 void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 {
@@ -2023,7 +2028,7 @@ void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 	intel_de_posting_read(dev_priv, DPLL(pipe));
 }
 
-
+#ifdef I915
 /**
  * vlv_force_pll_off - forcibly disable just the PLL
  * @dev_priv: i915 private structure
@@ -2039,6 +2044,7 @@ void vlv_force_pll_off(struct drm_i915_private *dev_priv, enum pipe pipe)
 	else
 		vlv_disable_pll(dev_priv, pipe);
 }
+#endif
 
 /* Only for pre-ILK configs */
 static void assert_pll(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 1974eb580ed1..56b4055c9ef4 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -607,6 +607,7 @@ static void hsw_ddi_spll_enable(struct drm_i915_private *dev_priv,
 static void hsw_ddi_wrpll_disable(struct drm_i915_private *dev_priv,
 				  struct intel_shared_dpll *pll)
 {
+#ifdef I915
 	const enum intel_dpll_id id = pll->info->id;
 	u32 val;
 
@@ -620,11 +621,13 @@ static void hsw_ddi_wrpll_disable(struct drm_i915_private *dev_priv,
 	 */
 	if (dev_priv->pch_ssc_use & BIT(id))
 		intel_init_pch_refclk(dev_priv);
+#endif
 }
 
 static void hsw_ddi_spll_disable(struct drm_i915_private *dev_priv,
 				 struct intel_shared_dpll *pll)
 {
+#ifdef I915
 	enum intel_dpll_id id = pll->info->id;
 	u32 val;
 
@@ -638,6 +641,7 @@ static void hsw_ddi_spll_disable(struct drm_i915_private *dev_priv,
 	 */
 	if (dev_priv->pch_ssc_use & BIT(id))
 		intel_init_pch_refclk(dev_priv);
+#endif
 }
 
 static bool hsw_ddi_wrpll_get_hw_state(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 3d63c1bf1e4f..0295348df562 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -4,11 +4,18 @@
  *
  */
 
+// As with intelde_dpt, this depends on some gem internals, fortunately easier to fix..
+#ifdef I915
 #include "gem/i915_gem_internal.h"
+#else
+#include "xe_bo.h"
+#include "xe_gt.h"
+#endif
 
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_de.h"
+#include "intel_dsb.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 
@@ -26,8 +33,12 @@ struct intel_dsb {
 	enum dsb_id id;
 
 	u32 *cmd_buf;
-	struct i915_vma *vma;
 	struct intel_crtc *crtc;
+#ifdef I915
+	struct i915_vma *vma;
+#else
+	struct xe_bo *obj;
+#endif
 
 	/*
 	 * free_pos will point the first free entry position
@@ -70,6 +81,43 @@ struct intel_dsb {
 #define DSB_BYTE_EN_SHIFT		20
 #define DSB_REG_VALUE_MASK		0xfffff
 
+static u32 dsb_ggtt_offset(struct intel_dsb *dsb)
+{
+#ifdef I915
+	return i915_ggtt_offset(dsb->vma);
+#else
+	return xe_bo_ggtt_addr(dsb->obj);
+#endif
+}
+
+static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val)
+{
+#ifdef I915
+	dsb->cmd_buf[idx] = val;
+#else
+	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
+#endif
+}
+
+
+static u32 dsb_read(struct intel_dsb *dsb, u32 idx)
+{
+#ifdef I915
+	return dsb->cmd_buf[idx];
+#else
+	return iosys_map_rd(&dsb->obj->vmap, idx * 4, u32);
+#endif
+}
+
+static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz)
+{
+#ifdef I915
+	memset(&dsb->cmd_buf[idx], val, sz);
+#else
+	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
+#endif
+}
+
 static bool is_dsb_busy(struct drm_i915_private *i915, enum pipe pipe,
 			enum dsb_id id)
 {
@@ -130,8 +178,12 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb,
 {
 	struct intel_crtc *crtc = dsb->crtc;
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	u32 *buf = dsb->cmd_buf;
-	u32 reg_val;
+	u32 reg_val, old_val;
+
+	if (!dsb) {
+		intel_de_write_fw(dev_priv, reg, val);
+		return;
+	}
 
 	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		drm_dbg_kms(&dev_priv->drm, "DSB buffer overflow\n");
@@ -154,7 +206,7 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb,
 	 * we are writing odd no of dwords, Zeros will be added in the end for
 	 * padding.
 	 */
-	reg_val = buf[dsb->ins_start_offset + 1] & DSB_REG_VALUE_MASK;
+	reg_val = dsb_read(dsb, dsb->ins_start_offset + 1) & DSB_REG_VALUE_MASK;
 	if (reg_val != i915_mmio_reg_offset(reg)) {
 		/* Every instruction should be 8 byte aligned. */
 		dsb->free_pos = ALIGN(dsb->free_pos, 2);
@@ -162,26 +214,27 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb,
 		dsb->ins_start_offset = dsb->free_pos;
 
 		/* Update the size. */
-		buf[dsb->free_pos++] = 1;
+		dsb_write(dsb, dsb->free_pos++, 1);
 
 		/* Update the opcode and reg. */
-		buf[dsb->free_pos++] = (DSB_OPCODE_INDEXED_WRITE  <<
-					DSB_OPCODE_SHIFT) |
-					i915_mmio_reg_offset(reg);
+		dsb_write(dsb, dsb->free_pos++,
+			  (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
+			  i915_mmio_reg_offset(reg));
 
 		/* Update the value. */
-		buf[dsb->free_pos++] = val;
+		dsb_write(dsb, dsb->free_pos++, val);
 	} else {
 		/* Update the new value. */
-		buf[dsb->free_pos++] = val;
+		dsb_write(dsb, dsb->free_pos++, val);
 
 		/* Update the size. */
-		buf[dsb->ins_start_offset]++;
+		old_val = dsb_read(dsb, dsb->ins_start_offset);
+		dsb_write(dsb, dsb->ins_start_offset, old_val + 1);
 	}
 
 	/* if number of data words is odd, then the last dword should be 0.*/
 	if (dsb->free_pos & 0x1)
-		buf[dsb->free_pos] = 0;
+		dsb_write(dsb, dsb->free_pos, 0);
 }
 
 /**
@@ -201,7 +254,11 @@ void intel_dsb_reg_write(struct intel_dsb *dsb,
 {
 	struct intel_crtc *crtc = dsb->crtc;
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	u32 *buf = dsb->cmd_buf;
+
+	if (!dsb) {
+		intel_de_write_fw(dev_priv, reg, val);
+		return;
+	}
 
 	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		drm_dbg_kms(&dev_priv->drm, "DSB buffer overflow\n");
@@ -209,10 +266,11 @@ void intel_dsb_reg_write(struct intel_dsb *dsb,
 	}
 
 	dsb->ins_start_offset = dsb->free_pos;
-	buf[dsb->free_pos++] = val;
-	buf[dsb->free_pos++] = (DSB_OPCODE_MMIO_WRITE  << DSB_OPCODE_SHIFT) |
-			       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
-			       i915_mmio_reg_offset(reg);
+	dsb_write(dsb, dsb->free_pos++, val);
+	dsb_write(dsb, dsb->free_pos++,
+		  (DSB_OPCODE_MMIO_WRITE  << DSB_OPCODE_SHIFT) |
+		  (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
+		  i915_mmio_reg_offset(reg));
 }
 
 /**
@@ -240,12 +298,11 @@ void intel_dsb_commit(struct intel_dsb *dsb)
 		goto reset;
 	}
 	intel_de_write(dev_priv, DSB_HEAD(pipe, dsb->id),
-		       i915_ggtt_offset(dsb->vma));
+		       dsb_ggtt_offset(dsb));
 
-	tail = ALIGN(dsb->free_pos * 4, CACHELINE_BYTES);
+	tail = ALIGN(dsb->free_pos * 4, 64);
 	if (tail > dsb->free_pos * 4)
-		memset(&dsb->cmd_buf[dsb->free_pos], 0,
-		       (tail - dsb->free_pos * 4));
+		dsb_memset(dsb, dsb->free_pos, 0, (tail - dsb->free_pos * 4));
 
 	if (is_dsb_busy(dev_priv, pipe, dsb->id)) {
 		drm_err(&dev_priv->drm,
@@ -254,9 +311,9 @@ void intel_dsb_commit(struct intel_dsb *dsb)
 	}
 	drm_dbg_kms(&dev_priv->drm,
 		    "DSB execution started - head 0x%x, tail 0x%x\n",
-		    i915_ggtt_offset(dsb->vma), tail);
+		    dsb_ggtt_offset(dsb), tail);
 	intel_de_write(dev_priv, DSB_TAIL(pipe, dsb->id),
-		       i915_ggtt_offset(dsb->vma) + tail);
+		       dsb_ggtt_offset(dsb) + tail);
 	if (wait_for(!is_dsb_busy(dev_priv, pipe, dsb->id), 1)) {
 		drm_err(&dev_priv->drm,
 			"Timed out waiting for DSB workload completion.\n");
@@ -284,9 +341,9 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc)
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct intel_dsb *dsb;
 	struct drm_i915_gem_object *obj;
-	struct i915_vma *vma;
-	u32 *buf;
+	__maybe_unused struct i915_vma *vma;
 	intel_wakeref_t wakeref;
+	__maybe_unused u32 *buf;
 
 	if (!HAS_DSB(i915))
 		return NULL;
@@ -297,6 +354,7 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc)
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
+#ifdef I915
 	obj = i915_gem_object_create_internal(i915, DSB_BUF_SIZE);
 	if (IS_ERR(obj))
 		goto out_put_rpm;
@@ -319,6 +377,18 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc)
 	dsb->vma = vma;
 	dsb->crtc = crtc;
 	dsb->cmd_buf = buf;
+#else
+	obj = xe_bo_create_pin_map(i915, to_gt(i915), NULL, DSB_BUF_SIZE,
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(i915)) |
+				   XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(obj)) {
+		kfree(dsb);
+		goto out_put_rpm;
+	}
+	dsb->obj = obj;
+#endif
+	dsb->id = DSB1;
 	dsb->free_pos = 0;
 	dsb->ins_start_offset = 0;
 
@@ -343,6 +413,10 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc)
  */
 void intel_dsb_cleanup(struct intel_dsb *dsb)
 {
+#ifdef I915
 	i915_vma_unpin_and_release(&dsb->vma, I915_VMA_RELEASE_MAP);
+#else
+	xe_bo_unpin_map_no_vm(dsb->obj);
+#endif
 	kfree(dsb);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 2cbc1292ab38..b45552d96c0c 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -46,9 +46,11 @@
 #include "intel_dsi.h"
 #include "intel_dsi_vbt.h"
 #include "intel_gmbus_regs.h"
+#ifdef I915
 #include "vlv_dsi.h"
 #include "vlv_dsi_regs.h"
 #include "vlv_sideband.h"
+#endif
 
 #define MIPI_TRANSFER_MODE_SHIFT	0
 #define MIPI_VIRTUAL_CHANNEL_SHIFT	1
@@ -76,6 +78,7 @@ struct gpio_map {
 	bool init;
 };
 
+#ifdef I915
 static struct gpio_map vlv_gpio_table[] = {
 	{ VLV_GPIO_NC_0_HV_DDI0_HPD },
 	{ VLV_GPIO_NC_1_HV_DDI0_DDC_SDA },
@@ -90,6 +93,7 @@ static struct gpio_map vlv_gpio_table[] = {
 	{ VLV_GPIO_NC_10_PANEL1_BKLTEN },
 	{ VLV_GPIO_NC_11_PANEL1_BKLTCTL },
 };
+#endif
 
 struct i2c_adapter_lookup {
 	u16 slave_addr;
@@ -219,10 +223,10 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 		mipi_dsi_dcs_write_buffer(dsi_device, data, len);
 		break;
 	}
-
+#ifdef I915
 	if (DISPLAY_VER(dev_priv) < 11)
 		vlv_dsi_wait_for_fifo_empty(intel_dsi, port);
-
+#endif
 out:
 	data += len;
 
@@ -242,6 +246,7 @@ static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 	return data;
 }
 
+#ifdef I915
 static void vlv_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
@@ -370,6 +375,7 @@ static void bxt_exec_gpio(struct intel_connector *connector,
 
 	gpiod_set_value(gpio_desc, value);
 }
+#endif
 
 static void icl_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
@@ -491,12 +497,14 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 		icl_native_gpio_set_value(dev_priv, gpio_number, value);
 	else if (DISPLAY_VER(dev_priv) >= 11)
 		icl_exec_gpio(connector, gpio_source, gpio_index, value);
+#ifdef I915
 	else if (IS_VALLEYVIEW(dev_priv))
 		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else if (IS_CHERRYVIEW(dev_priv))
 		chv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else
 		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
+#endif
 
 	return data;
 }
@@ -821,8 +829,10 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 		    intel_dsi->clk_lp_to_hs_count);
 	drm_dbg_kms(&i915->drm, "HS to LP Clock Count 0x%x\n",
 		    intel_dsi->clk_hs_to_lp_count);
+#ifdef I915
 	drm_dbg_kms(&i915->drm, "BTA %s\n",
 		    str_enabled_disabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
+#endif
 }
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
@@ -841,9 +851,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 	intel_dsi->eotp_pkt = mipi_config->eot_pkt_disabled ? 0 : 1;
 	intel_dsi->clock_stop = mipi_config->enable_clk_stop ? 1 : 0;
 	intel_dsi->lane_count = mipi_config->lane_cnt + 1;
-	intel_dsi->pixel_format =
-			pixel_format_from_register_bits(
-				mipi_config->videomode_color_format << 7);
+	intel_dsi->pixel_format = mipi_config->videomode_color_format << 7;
 
 	intel_dsi->dual_link = mipi_config->dual_link;
 	intel_dsi->pixel_overlap = mipi_config->pixel_overlap;
@@ -857,7 +865,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 	intel_dsi->init_count = mipi_config->master_init_timer;
 	intel_dsi->bw_timer = mipi_config->dbi_bw_timer;
 	intel_dsi->video_frmt_cfg_bits =
-		mipi_config->bta_enabled ? DISABLE_VIDEO_BTA : 0;
+		mipi_config->bta_enabled ? BIT(3) : 0;
 	intel_dsi->bgr_enabled = mipi_config->rgb_flip;
 
 	/* Starting point, adjusted depending on dual link and burst mode */
@@ -940,6 +948,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
  * If the GOP did not initialize the panel (HDMI inserted) we may need to also
  * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
  */
+#ifdef I915
 static struct gpiod_lookup_table pmic_panel_gpio_table = {
 	/* Intel GFX is consumer */
 	.dev_id = "0000:00:02.0",
@@ -963,9 +972,11 @@ static const struct pinctrl_map soc_pwm_pinctrl_map[] = {
 	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
 			  "pwm0_grp", "pwm"),
 };
+#endif
 
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
+#ifdef I915
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
@@ -1018,10 +1029,12 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 			intel_dsi->gpio_backlight = NULL;
 		}
 	}
+#endif
 }
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
+#ifdef I915
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
@@ -1045,4 +1058,5 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
 		gpiod_remove_lookup_table(&soc_panel_gpio_table);
 	}
+#endif
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 56cdacf33db2..e0a8d9e9df9a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_blend.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper.h>
 
@@ -14,6 +15,16 @@
 #include "intel_fb.h"
 #include "intel_frontbuffer.h"
 
+#ifdef I915
+/*
+ * i915 requires obj->__do_not_access.base,
+ * xe uses obj->ttm.base
+ */
+#define ttm __do_not_access
+#else
+#include <drm/ttm/ttm_bo.h>
+#endif
+
 #define check_array_bounds(i915, a, i) drm_WARN_ON(&(i915)->drm, (i) >= ARRAY_SIZE(a))
 
 /*
@@ -697,6 +708,7 @@ intel_fb_align_height(const struct drm_framebuffer *fb,
 	return ALIGN(height, tile_height);
 }
 
+#ifdef I915
 static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 {
 	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
@@ -716,6 +728,7 @@ static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 		return I915_TILING_NONE;
 	}
 }
+#endif
 
 static bool intel_modifier_uses_dpt(struct drm_i915_private *i915, u64 modifier)
 {
@@ -1234,7 +1247,6 @@ static bool intel_plane_needs_remap(const struct intel_plane_state *plane_state)
 static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int color_plane,
 				      int plane_width, int *x, int *y)
 {
-	struct drm_i915_gem_object *obj = intel_fb_obj(&fb->base);
 	int ret;
 
 	ret = intel_fb_offset_to_xy(x, y, &fb->base, color_plane);
@@ -1258,13 +1270,15 @@ static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int co
 	 * fb layout agrees with the fence layout. We already check that the
 	 * fb stride matches the fence stride elsewhere.
 	 */
-	if (color_plane == 0 && i915_gem_object_is_tiled(obj) &&
+#ifdef I915
+	if (color_plane == 0 && i915_gem_object_is_tiled(intel_fb_obj(&fb->base)) &&
 	    (*x + plane_width) * fb->base.format->cpp[color_plane] > fb->base.pitches[color_plane]) {
 		drm_dbg_kms(fb->base.dev,
 			    "bad fb plane %d offset: 0x%x\n",
 			    color_plane, fb->base.offsets[color_plane]);
 		return -EINVAL;
 	}
+#endif
 
 	return 0;
 }
@@ -1611,10 +1625,10 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 		max_size = max(max_size, offset + size);
 	}
 
-	if (mul_u32_u32(max_size, tile_size) > obj->base.size) {
+	if (mul_u32_u32(max_size, tile_size) > obj->ttm.base.size) {
 		drm_dbg_kms(&i915->drm,
 			    "fb too big for bo (need %llu bytes, have %zu bytes)\n",
-			    mul_u32_u32(max_size, tile_size), obj->base.size);
+			    mul_u32_u32(max_size, tile_size), obj->ttm.base.size);
 		return -EINVAL;
 	}
 
@@ -1830,8 +1844,10 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	drm_framebuffer_cleanup(fb);
 
+#ifdef I915
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
+#endif
 
 	drm_gem_object_put(fb->obj[0]);
 	kfree(intel_fb);
@@ -1842,47 +1858,53 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
+#ifdef I915
 	if (i915_gem_object_is_userptr(obj)) {
-		drm_dbg(&i915->drm,
+		drm_dbg(fb->dev,
 			"attempting to use a userptr for a framebuffer, denied\n");
 		return -EINVAL;
 	}
+#endif
 
-	return drm_gem_handle_create(file, &obj->base, handle);
+	return drm_gem_handle_create(file, &obj->ttm.base, handle);
 }
 
+#ifdef I915
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
 					struct drm_clip_rect *clips,
 					unsigned int num_clips)
 {
-	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-
-	i915_gem_object_flush_if_display(obj);
+	i915_gem_object_flush_if_display(intel_fb_obj(fb));
 	intel_frontbuffer_flush(to_intel_framebuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
 }
+#endif
 
 static const struct drm_framebuffer_funcs intel_fb_funcs = {
 	.destroy = intel_user_framebuffer_destroy,
 	.create_handle = intel_user_framebuffer_create_handle,
+#ifdef I915
 	.dirty = intel_user_framebuffer_dirty,
+#else
+	.dirty = drm_atomic_helper_dirtyfb,
+#endif
 };
 
 int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(obj->ttm.base.dev);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
-	unsigned int tiling, stride;
 	int ret = -EINVAL;
 	int i;
+#ifdef I915
+	unsigned tiling, stride;
 
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
@@ -1909,6 +1931,29 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			goto err;
 		}
 	}
+#else
+	ret = ttm_bo_reserve(&obj->ttm, true, false, NULL);
+	if (ret)
+		goto err;
+	ret = -EINVAL;
+
+	if (!(obj->flags & XE_BO_SCANOUT_BIT)) {
+		/*
+		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
+		 * automatically set when creating FB. We cannot change caching
+		 * mode when the object is VM_BINDed, so we can only set
+		 * coherency with display when unbound.
+		 */
+		if (XE_IOCTL_ERR(dev_priv, !list_empty(&obj->vmas))) {
+			ttm_bo_unreserve(&obj->ttm);
+			goto err;
+		}
+		obj->flags |= XE_BO_SCANOUT_BIT;
+	}
+	ttm_bo_unreserve(&obj->ttm);
+#endif
+
+	atomic_set(&intel_fb->bits, 0);
 
 	if (!drm_any_plane_has_format(&dev_priv->drm,
 				      mode_cmd->pixel_format,
@@ -1919,6 +1964,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
+#ifdef I915
 	/*
 	 * gen2/3 display engine uses the fence if present,
 	 * so the tiling mode must match the fb modifier exactly.
@@ -1929,6 +1975,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    "tiling_mode must match fb modifier exactly on gen2/3\n");
 		goto err;
 	}
+#endif
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
 					 mode_cmd->modifier[0]);
@@ -1941,6 +1988,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err;
 	}
 
+#ifdef I915
 	/*
 	 * If there's a fence, enforce that
 	 * the fb pitch and fence stride match.
@@ -1951,6 +1999,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    mode_cmd->pitches[0], stride);
 		goto err;
 	}
+#endif
 
 	/* FIXME need to adjust LINOFF/TILEOFF accordingly. */
 	if (mode_cmd->offsets[0] != 0) {
@@ -1991,13 +2040,14 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-		fb->obj[i] = &obj->base;
+		fb->obj[i] = &obj->ttm.base;
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
 	if (ret)
 		goto err;
 
+#ifdef I915
 	if (intel_fb_uses_dpt(fb)) {
 		struct i915_address_space *vm;
 
@@ -2009,6 +2059,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
+#endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
@@ -2031,22 +2082,35 @@ intel_user_framebuffer_create(struct drm_device *dev,
 	struct drm_framebuffer *fb;
 	struct drm_i915_gem_object *obj;
 	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
-	struct drm_i915_private *i915;
+	struct drm_i915_private *i915 = to_i915(dev);
 
+#ifdef I915
 	obj = i915_gem_object_lookup(filp, mode_cmd.handles[0]);
 	if (!obj)
 		return ERR_PTR(-ENOENT);
 
 	/* object is backed with LMEM for discrete */
-	i915 = to_i915(obj->base.dev);
 	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		return ERR_PTR(-EREMOTE);
 	}
+#else
+	struct drm_gem_object *gem = drm_gem_object_lookup(filp, mode_cmd.handles[0]);
+	if (!gem)
+		return ERR_PTR(-ENOENT);
+
+	obj = gem_to_xe_bo(gem);
+	/* Require vram exclusive objects, but allow dma-buf imports */
+	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
+	    obj->ttm.type != ttm_bo_type_sg) {
+		drm_gem_object_put(gem);
+		return ERR_PTR(-EREMOTE);
+	}
+#endif
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
+	drm_gem_object_put(&obj->ttm.base);
 
 	return fb;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5e69d3c11d21..77c848b5b7ae 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -45,7 +45,9 @@
 
 #include "i915_drv.h"
 #include "i915_utils.h"
+#ifdef I915
 #include "i915_vgpu.h"
+#endif
 #include "intel_cdclk.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
@@ -53,6 +55,32 @@
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
 
+#ifdef I915
+
+#define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
+
+#else
+
+/* No stolen memory support in xe yet */
+static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)
+{
+	return -ENODEV;
+}
+
+static int i915_gem_stolen_insert_node(struct xe_device *xe, void *ptr, u32 size, u32 align)
+{
+	XE_WARN_ON(1);
+	return -ENODEV;
+}
+
+static void i915_gem_stolen_remove_node(struct xe_device *xe, void *ptr)
+{
+}
+
+#define i915_gem_stolen_initialized(xe) ((xe) && 0)
+
+#endif
+
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
 		for_each_if(RUNTIME_INFO(__dev_priv)->fbc_mask & BIT(__fbc_id))
@@ -329,6 +357,7 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
+#ifdef I915
 	struct drm_i915_private *i915 = fbc->i915;
 
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
@@ -340,6 +369,7 @@ static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 		       i915->dsm.start + fbc->compressed_fb.start);
 	intel_de_write(i915, FBC_LL_BASE,
 		       i915->dsm.start + fbc->compressed_llb.start);
+#endif
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -604,8 +634,10 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
+#ifdef I915
 	if (to_gt(i915)->ggtt->num_fences)
 		snb_fbc_program_fence(fbc);
+#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
@@ -710,10 +742,14 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	 * reserved range size, so it always assumes the maximum (8mb) is used.
 	 * If we enable FBC using a CFB on that memory range we'll get FIFO
 	 * underruns, even if that range is not reserved by the BIOS. */
+#ifdef I915
 	if (IS_BROADWELL(i915) ||
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = resource_size(&i915->dsm) - 8 * 1024 * 1024;
 	else
+#else
+	/* TODO */
+#endif
 		end = U64_MAX;
 
 	return min(end, intel_fbc_cfb_base_max(i915));
@@ -799,7 +835,7 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	if (drm_mm_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
-	if (drm_mm_initialized(&i915->mm.stolen))
+	if (i915_gem_stolen_initialized(i915))
 		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);
 	return -ENOSPC;
 }
@@ -970,7 +1006,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	__maybe_unused struct drm_i915_private *i915 = to_i915(state->base.dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -985,7 +1021,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-
+#ifdef I915
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
@@ -995,6 +1031,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	    plane_state->ggtt_vma->fence)
 		fbc_state->fence_id = plane_state->ggtt_vma->fence->id;
 	else
+#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1004,6 +1041,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1021,6 +1059,9 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
 		 plane_state->ggtt_vma->fence);
+#else
+	return true;
+#endif
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
@@ -1706,7 +1747,7 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
+	if (!i915_gem_stolen_initialized(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
 
 	if (need_fbc_vtd_wa(i915))
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 8ccdf1a964ff..176e0e44a268 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -41,7 +41,11 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 
+#ifdef I915
 #include "gem/i915_gem_lmem.h"
+#else
+#include "xe_gt.h"
+#endif
 
 #include "i915_drv.h"
 #include "intel_display_types.h"
@@ -50,6 +54,14 @@
 #include "intel_fbdev.h"
 #include "intel_frontbuffer.h"
 
+#ifdef I915
+/*
+ * i915 requires obj->__do_not_access.base,
+ * xe uses obj->ttm.base
+ */
+#define ttm __do_not_access
+#endif
+
 struct intel_fbdev {
 	struct drm_fb_helper helper;
 	struct intel_framebuffer *fb;
@@ -147,14 +159,19 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 
+#ifdef I915
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
+#else
+	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
+#endif
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-
+#ifdef I915
 	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
@@ -170,6 +187,13 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 		if (IS_ERR(obj))
 			obj = i915_gem_object_create_shmem(dev_priv, size);
 	}
+#else
+	/* XXX: Care about stolen? */
+	obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+				   ttm_bo_type_kernel,
+				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+				   XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT);
+#endif
 
 	if (IS_ERR(obj)) {
 		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
@@ -177,10 +201,16 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	}
 
 	fb = intel_framebuffer_create(obj, &mode_cmd);
-	i915_gem_object_put(obj);
-	if (IS_ERR(fb))
+	if (IS_ERR(fb)) {
+#ifdef I915
+		i915_gem_object_put(obj);
+#else
+		xe_bo_unpin_map_no_vm(obj);
+#endif
 		return PTR_ERR(fb);
+	}
 
+	drm_gem_object_put(&obj->ttm.base);
 	ifbdev->fb = to_intel_framebuffer(fb);
 	return 0;
 }
@@ -194,7 +224,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -264,6 +293,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 
 	/* setup aperture base/size for vesafb takeover */
 	obj = intel_fb_obj(&intel_fb->base);
+#ifdef I915
 	if (i915_gem_object_is_lmem(obj)) {
 		struct intel_memory_region *mem = obj->mm.region;
 
@@ -276,6 +306,8 @@ static int intelfb_create(struct drm_fb_helper *helper,
 					i915_gem_object_get_dma_address(obj, 0));
 		info->fix.smem_len = obj->base.size;
 	} else {
+		struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
+
 		info->apertures->ranges[0].base = ggtt->gmadr.start;
 		info->apertures->ranges[0].size = ggtt->mappable_end;
 
@@ -284,8 +316,36 @@ static int intelfb_create(struct drm_fb_helper *helper,
 			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
 		info->fix.smem_len = vma->size;
 	}
-
 	vaddr = i915_vma_pin_iomap(vma);
+
+#else
+	/* XXX: Could be pure fiction.. */
+	if (obj->flags & XE_BO_CREATE_VRAM0_BIT) {
+		struct xe_gt *gt = to_gt(dev_priv);
+		bool lmem;
+
+		info->apertures->ranges[0].base = gt->mem.vram.io_start;
+		info->apertures->ranges[0].size = gt->mem.vram.size;
+
+		info->fix.smem_start =
+			(unsigned long)(gt->mem.vram.io_start + xe_bo_addr(obj, 0, 4096, &lmem));
+		info->fix.smem_len = obj->ttm.base.size;
+
+	} else {
+		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+		info->apertures->ranges[0].base = pci_resource_start(pdev, 2);
+		info->apertures->ranges[0].size =
+			pci_resource_end(pdev, 2) - pci_resource_start(pdev, 2);
+
+		info->fix.smem_start = info->apertures->ranges[0].base + xe_bo_ggtt_addr(obj);
+		info->fix.smem_len = obj->ttm.base.size;
+	}
+
+	/* TODO: ttm_bo_kmap? */
+	vaddr = obj->vmap.vaddr;
+#endif
+
 	if (IS_ERR(vaddr)) {
 		drm_err(&dev_priv->drm,
 			"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
@@ -293,7 +353,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unpin;
 	}
 	info->screen_base = vaddr;
-	info->screen_size = vma->size;
+	info->screen_size = obj->ttm.base.size;
 
 	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
 
@@ -301,14 +361,23 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	 * If the object is stolen however, it will be full of whatever
 	 * garbage was left in there.
 	 */
+#ifdef I915
 	if (!i915_gem_object_is_shmem(vma->obj) && !prealloc)
+#else
+	/* XXX: Check stolen bit? */
+	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT) && !prealloc)
+#endif
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
 	drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
 		    ifbdev->fb->base.width, ifbdev->fb->base.height,
+#ifdef I915
 		    i915_ggtt_offset(vma));
+#else
+		    (u32)vma->node.start);
+#endif
 	ifbdev->vma = vma;
 	ifbdev->vma_flags = flags;
 
@@ -339,8 +408,17 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
 	if (ifbdev->vma)
 		intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
 
-	if (ifbdev->fb)
+	if (ifbdev->fb) {
+#ifndef I915
+		struct xe_bo *bo = intel_fb_obj(&ifbdev->fb->base);
+
+		/* Unpin our kernel fb first */
+		xe_bo_lock_no_vm(bo, NULL);
+		xe_bo_unpin(bo);
+		xe_bo_unlock_no_vm(bo);
+#endif
 		drm_framebuffer_remove(&ifbdev->fb->base);
+	}
 
 	kfree(ifbdev);
 }
@@ -387,12 +465,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 			continue;
 		}
 
-		if (obj->base.size > max_size) {
+		if (obj->ttm.base.size > max_size) {
 			drm_dbg_kms(&i915->drm,
 				    "found possible fb from [PLANE:%d:%s]\n",
 				    plane->base.base.id, plane->base.name);
 			fb = to_intel_framebuffer(plane_state->uapi.fb);
-			max_size = obj->base.size;
+			max_size = obj->ttm.base.size;
 		}
 	}
 
@@ -658,8 +736,13 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	 * been restored from swap. If the object is stolen however, it will be
 	 * full of whatever garbage was left in there.
 	 */
+#ifdef I915
 	if (state == FBINFO_STATE_RUNNING &&
 	    !i915_gem_object_is_shmem(intel_fb_obj(&ifbdev->fb->base)))
+#else
+	if (state == FBINFO_STATE_RUNNING &&
+	    !(intel_fb_obj(&ifbdev->fb->base)->flags & XE_BO_CREATE_SYSTEM_BIT))
+#endif
 		memset_io(info->screen_base, 0, info->screen_size);
 
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 0bc4f6b48e80..2d099f4c52cd 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -39,7 +39,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_gmbus.h"
-#include "intel_gmbus_regs.h"
+#include "../i915/display/intel_gmbus_regs.h"
 
 struct intel_gmbus {
 	struct i2c_adapter adapter;
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.h b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
index f848c5038714..1e236df9273b 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.h
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
@@ -12,11 +12,19 @@ enum pipe;
 enum port;
 struct drm_i915_private;
 
+#ifdef I915
 int  intel_lpe_audio_init(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_notify(struct drm_i915_private *dev_priv,
 			    enum pipe pipe, enum port port,
 			    const void *eld, int ls_clock, bool dp_output);
+#else
+#define intel_lpe_audio_init(xe) (-ENODEV)
+#define intel_lpe_audio_teardown(xe) BUG_ON(1)
+#define intel_lpe_audio_irq_handler(xe) do { } while (0)
+#define intel_lpe_audio_notify(xe, a, b, c, d, e) do { } while (0)
+
+#endif
 
 #endif /* __INTEL_LPE_AUDIO_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 96395bfbd41d..6f705acaf225 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -721,18 +721,21 @@ void intel_modeset_setup_hw_state(struct drm_i915_private *i915,
 
 	intel_dpll_sanitize_state(i915);
 
-	if (IS_G4X(i915)) {
+	if (DISPLAY_VER(i915) >= 9) {
+		skl_wm_get_hw_state(i915);
+		skl_wm_sanitize(i915);
+	}
+#ifdef I915
+	else if (IS_G4X(i915)) {
 		g4x_wm_get_hw_state(i915);
 		g4x_wm_sanitize(i915);
 	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_wm_get_hw_state(i915);
 		vlv_wm_sanitize(i915);
-	} else if (DISPLAY_VER(i915) >= 9) {
-		skl_wm_get_hw_state(i915);
-		skl_wm_sanitize(i915);
 	} else if (HAS_PCH_SPLIT(i915)) {
 		ilk_wm_get_hw_state(i915);
 	}
+#endif
 
 	for_each_intel_crtc(&i915->drm, crtc) {
 		struct intel_crtc_state *crtc_state =
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index e0184745632c..057a68237efe 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -37,7 +37,7 @@
 #include "intel_backlight.h"
 #include "intel_display_types.h"
 #include "intel_opregion.h"
-#include "intel_pci_config.h"
+#include "../i915/intel_pci_config.h"
 
 #define OPREGION_HEADER_OFFSET 0
 #define OPREGION_ACPI_OFFSET   0x100
diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.h b/drivers/gpu/drm/i915/display/intel_pch_display.h
index 41a63413cb3d..e8b50e9a4969 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.h
@@ -15,6 +15,7 @@ struct intel_crtc;
 struct intel_crtc_state;
 struct intel_link_m_n;
 
+#ifdef I915
 bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 			     enum pipe pch_transcoder);
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
@@ -41,5 +42,20 @@ void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n);
 
 void intel_pch_sanitize(struct drm_i915_private *i915);
+#else
+#define intel_has_pch_trancoder(xe, pipe) (xe && pipe && 0)
+#define intel_crtc_pch_transcoder(crtc) ((crtc)->pipe)
+#define ilk_pch_pre_enable(state, crtc) do { } while (0)
+#define ilk_pch_enable(state, crtc) do { } while (0)
+#define ilk_pch_disable(state, crtc) do { } while (0)
+#define ilk_pch_post_disable(state, crtc) do { } while (0)
+#define ilk_pch_get_config(crtc) do { } while (0)
+#define lpt_pch_enable(state, crtc) do { } while (0)
+#define lpt_pch_disable(state, crtc) do { } while (0)
+#define lpt_pch_get_config(crtc) do { } while (0)
+#define intel_pch_transcoder_get_m1_n1(crtc, m_n) memset((m_n), 0, sizeof(*m_n))
+#define intel_pch_transcoder_get_m2_n2(crtc, m_n) memset((m_n), 0, sizeof(*m_n))
+#define intel_pch_sanitize(xe) do { } while (0)
+#endif
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.h b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
index 9bcf56629f24..aa4f6e0b1127 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
@@ -11,6 +11,7 @@
 struct drm_i915_private;
 struct intel_crtc_state;
 
+#ifdef I915
 void lpt_program_iclkip(const struct intel_crtc_state *crtc_state);
 void lpt_disable_iclkip(struct drm_i915_private *dev_priv);
 int lpt_get_iclkip(struct drm_i915_private *dev_priv);
@@ -18,5 +19,12 @@ int lpt_iclkip(const struct intel_crtc_state *crtc_state);
 
 void intel_init_pch_refclk(struct drm_i915_private *dev_priv);
 void lpt_disable_clkout_dp(struct drm_i915_private *dev_priv);
+#else
+#define lpt_program_iclkip(cstate) do { } while (0)
+#define lpt_disable_iclkip(xe) do { } while (0)
+#define lpt_get_iclkip(xe) (WARN_ON(-ENODEV))
+#define intel_init_pch_refclk(xe) do { } while (0)
+#define lpt_disable_clkout_dp(xe) do { } while (0)
+#endif
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index e9774670e3f6..a4b7a8ec3720 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -34,6 +34,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_pipe_crc.h"
+#include "i915_irq.h"
 
 static const char * const pipe_crc_sources[] = {
 	[INTEL_PIPE_CRC_SOURCE_NONE] = "none",
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index e6b4d24b9cd0..000561eadcc1 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -43,8 +43,10 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
+#ifdef I915
 #include "i915_vgpu.h"
 #include "i9xx_plane.h"
+#endif
 #include "intel_atomic_plane.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
@@ -112,6 +114,7 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 	return 0;
 }
 
+#ifdef I915
 static void i9xx_plane_linear_gamma(u16 gamma[8])
 {
 	/* The points are not evenly spaced. */
@@ -325,6 +328,7 @@ static u32 vlv_sprite_ctl_crtc(const struct intel_crtc_state *crtc_state)
 static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -396,6 +400,9 @@ static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		sprctl |= SP_SOURCE_KEY;
 
 	return sprctl;
+#else
+	return 0;
+#endif
 }
 
 static void vlv_sprite_update_gamma(const struct intel_plane_state *plane_state)
@@ -447,6 +454,7 @@ vlv_sprite_update_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
@@ -486,6 +494,7 @@ vlv_sprite_update_arm(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, SPCNTR(pipe, plane_id), sprctl);
 	intel_de_write_fw(dev_priv, SPSURF(pipe, plane_id),
 			  intel_plane_ggtt_offset(plane_state) + sprsurf_offset);
+#endif
 
 	vlv_sprite_update_clrc(plane_state);
 	vlv_sprite_update_gamma(plane_state);
@@ -711,6 +720,7 @@ static bool ivb_need_sprite_gamma(const struct intel_plane_state *plane_state)
 static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -780,6 +790,9 @@ static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		sprctl |= SPRITE_SOURCE_KEY;
 
 	return sprctl;
+#else
+	return 0;
+#endif
 }
 
 static void ivb_sprite_linear_gamma(const struct intel_plane_state *plane_state,
@@ -1723,10 +1736,13 @@ static const struct drm_plane_funcs vlv_sprite_funcs = {
 	.format_mod_supported = vlv_sprite_format_mod_supported,
 };
 
+#endif
+
 struct intel_plane *
 intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe, int sprite)
 {
+#ifdef I915
 	struct intel_plane *plane;
 	const struct drm_plane_funcs *plane_funcs;
 	unsigned int supported_rotations;
@@ -1846,4 +1862,9 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 	intel_plane_free(plane);
 
 	return ERR_PTR(ret);
+#else
+	BUG_ON(1);
+	return ERR_PTR(-ENODEV);
+#endif
 }
+
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index a9f44abfc9fc..001de8fe4e64 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -30,7 +30,7 @@
  *
  * Please do NOT include anywhere else.
  */
-#ifndef _INTEL_BIOS_PRIVATE
+#if !defined(_INTEL_BIOS_PRIVATE) && !defined(HDRTEST)
 #error "intel_vbt_defs.h is private to intel_bios.c"
 #endif
 
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index a69bfcac9a94..b15dcc84ae8c 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -101,6 +101,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 static int
 intel_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 {
+#ifdef I915
 	unsigned int reg = DISPLAY_VER(i915) >= 6 ? SNB_GMCH_CTRL : INTEL_GMCH_CTRL;
 	u16 gmch_ctrl;
 
@@ -123,6 +124,10 @@ intel_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 	}
 
 	return 0;
+#else
+	/* Only works on some machines because bios forgets to lock the reg. */
+	return -EIO;
+#endif
 }
 
 static unsigned int
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index d7390067b7d4..8c918734416d 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -244,6 +244,7 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 	if (ret || plane_state->scaler_id < 0)
 		return ret;
 
+#ifdef I915
 	/* check colorkey */
 	if (plane_state->ckey.flags) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -252,6 +253,7 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 			    intel_plane->base.name);
 		return -EINVAL;
 	}
+#endif
 
 	/* Check src format */
 	switch (fb->format->format) {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 2f5524f380b0..b08aa1a06784 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -22,7 +22,11 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
+#ifdef I915
 #include "pxp/intel_pxp.h"
+#else
+// TODO: pxp?
+#endif
 
 static const u32 skl_plane_formats[] = {
 	DRM_FORMAT_C8,
@@ -895,7 +899,9 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
+#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
+#endif
 	u32 plane_ctl;
 
 	plane_ctl = PLANE_CTL_ENABLE;
@@ -919,10 +925,12 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 		plane_ctl |= icl_plane_ctl_flip(rotation &
 						DRM_MODE_REFLECT_MASK);
 
+#ifdef I915
 	if (key->flags & I915_SET_COLORKEY_DESTINATION)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_DESTINATION;
 	else if (key->flags & I915_SET_COLORKEY_SOURCE)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_SOURCE;
+#endif
 
 	/* Wa_22012358565:adl-p */
 	if (DISPLAY_VER(dev_priv) == 13)
@@ -999,9 +1007,13 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
+#ifdef I915
+		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
 		return offset >> 9;
+#else
+		return 0;
+#endif
 	} else {
 		drm_WARN_ON(&i915->drm, offset & 0xfff);
 		return offset;
@@ -1044,26 +1056,35 @@ static u32 skl_plane_aux_dist(const struct intel_plane_state *plane_state,
 
 static u32 skl_plane_keyval(const struct intel_plane_state *plane_state)
 {
+#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 
 	return key->min_value;
+#else
+	return 0;
+#endif
 }
 
 static u32 skl_plane_keymax(const struct intel_plane_state *plane_state)
 {
-	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	u8 alpha = plane_state->hw.alpha >> 8;
+#ifdef I915
+	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 
 	return (key->max_value & 0xffffff) | PLANE_KEYMAX_ALPHA(alpha);
+#else
+	return PLANE_KEYMAX_ALPHA(alpha);
+#endif
 }
 
 static u32 skl_plane_keymsk(const struct intel_plane_state *plane_state)
 {
-	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	u8 alpha = plane_state->hw.alpha >> 8;
-	u32 keymsk;
-
+	u32 keymsk = 0;
+#ifdef I915
+	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	keymsk = key->channel_mask & 0x7ffffff;
+#endif
 	if (alpha < 0xff)
 		keymsk |= PLANE_KEYMSK_ALPHA_ENABLE;
 
@@ -1319,7 +1340,7 @@ skl_plane_async_flip(struct intel_plane *plane,
 			  skl_plane_surf(plane_state, 0));
 }
 
-static bool intel_format_is_p01x(u32 format)
+static inline bool intel_format_is_p01x(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_P010:
@@ -1402,6 +1423,7 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
+#ifdef I915
 	/* Wa_1606054188:tgl,adl-s */
 	if ((IS_ALDERLAKE_S(dev_priv) || IS_TIGERLAKE(dev_priv)) &&
 	    plane_state->ckey.flags & I915_SET_COLORKEY_SOURCE &&
@@ -1410,6 +1432,7 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 			    "Source color keying not supported with P01x formats\n");
 		return -EINVAL;
 	}
+#endif
 
 	return 0;
 }
@@ -1847,9 +1870,14 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 
 static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
+#ifdef I915
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
 	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
+#else
+#define i915_gem_object_is_protected(x) ((x) && 0)
+	return false;
+#endif
 }
 
 static bool pxp_is_borked(struct drm_i915_gem_object *obj)
@@ -1872,7 +1900,12 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 		return ret;
 
 	/* use scaler when colorkey is not required */
-	if (!plane_state->ckey.flags && skl_fb_scalable(fb)) {
+#ifdef I915
+	if (!plane_state->ckey.flags && skl_fb_scalable(fb))
+#else
+	if (skl_fb_scalable(fb))
+#endif
+	{
 		min_scale = 1;
 		max_scale = skl_plane_max_scale(dev_priv, fb);
 	}
@@ -2435,11 +2468,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		fb->modifier = DRM_FORMAT_MOD_LINEAR;
 		break;
 	case PLANE_CTL_TILED_X:
+#ifdef I915
 		plane_config->tiling = I915_TILING_X;
+#endif
 		fb->modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_CTL_TILED_Y:
+#ifdef I915
 		plane_config->tiling = I915_TILING_Y;
+#endif
 		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 			if (DISPLAY_VER(dev_priv) >= 12)
 				fb->modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index e254fb21b47f..381d4f75e7c8 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -16,7 +16,7 @@
 #include "skl_watermark.h"
 
 #include "i915_drv.h"
-#include "i915_fixed.h"
+#include "../i915/i915_fixed.h"
 #include "i915_reg.h"
 #include "intel_pm.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index f8eb807b56f9..3b9e20dd6039 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -7,8 +7,9 @@
 #define __INTEL_GT_REGS__
 
 #include "i915_reg_defs.h"
+#ifdef I915
 #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
-
+#endif
 #define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index be43580a6979..1e3966609844 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -132,9 +132,13 @@ typedef struct {
 
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
 
+#ifdef I915
 typedef struct {
 	u32 reg;
 } i915_mcr_reg_t;
+#else
+#define i915_mcr_reg_t i915_reg_t
+#endif
 
 #define INVALID_MMIO_REG _MMIO(0)
 
@@ -143,8 +147,12 @@ typedef struct {
  * simply operations on the register's offset and don't care about the MCR vs
  * non-MCR nature of the register.
  */
+#ifdef I915
 #define i915_mmio_reg_offset(r) \
 	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
+#else
+#define i915_mmio_reg_offset(r) ((r).reg)
+#endif
 #define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
 #define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
 
-- 
2.37.3

