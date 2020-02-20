Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A821663D8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DBE6EDED;
	Thu, 20 Feb 2020 17:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922296EDED;
 Thu, 20 Feb 2020 17:06:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="349202516"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2020 09:06:02 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [Intel-gfx] [PATCH v7 3/8] drm/i915/display/display: Make WARN* drm
 specific where drm_device ptr is available
Date: Thu, 20 Feb 2020 22:25:02 +0530
Message-Id: <20200220165507.16823-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_device or drm_i915_private struct
pointer is readily available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_device *T = ...;
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_device *T,...) {
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule3@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule4@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 237 +++++++++++--------
 1 file changed, 135 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 48fe3d2e0fa3..526097ba5040 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -203,9 +203,9 @@ int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
 	val = vlv_cck_read(dev_priv, reg);
 	divider = val & CCK_FREQUENCY_VALUES;
 
-	WARN((val & CCK_FREQUENCY_STATUS) !=
-	     (divider << CCK_FREQUENCY_STATUS_SHIFT),
-	     "%s change in progress\n", name);
+	drm_WARN(&dev_priv->drm, (val & CCK_FREQUENCY_STATUS) !=
+		 (divider << CCK_FREQUENCY_STATUS_SHIFT),
+		 "%s change in progress\n", name);
 
 	return DIV_ROUND_CLOSEST(ref_freq << 1, divider + 1);
 }
@@ -882,7 +882,7 @@ static bool vlv_PLL_is_optimal(struct drm_device *dev, int target_freq,
 		return calculated_clock->p > best_clock->p;
 	}
 
-	if (WARN_ON_ONCE(!target_freq))
+	if (drm_WARN_ON_ONCE(dev, !target_freq))
 		return false;
 
 	*error_ppm = div_u64(1000000ULL *
@@ -1090,7 +1090,8 @@ intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 		/* Wait for the Pipe State to go off */
 		if (intel_de_wait_for_clear(dev_priv, reg,
 					    I965_PIPECONF_ACTIVE, 100))
-			WARN(1, "pipe_off wait timed out\n");
+			drm_WARN(&dev_priv->drm, 1,
+				 "pipe_off wait timed out\n");
 	} else {
 		intel_wait_for_pipe_scanline_stopped(crtc);
 	}
@@ -1205,7 +1206,7 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 	enum pipe panel_pipe = INVALID_PIPE;
 	bool locked = true;
 
-	if (WARN_ON(HAS_DDI(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, HAS_DDI(dev_priv)))
 		return;
 
 	if (HAS_PCH_SPLIT(dev_priv)) {
@@ -1241,7 +1242,8 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		pp_reg = PP_CONTROL(0);
 		port_sel = intel_de_read(dev_priv, PP_ON_DELAYS(0)) & PANEL_PORT_SELECT_MASK;
 
-		WARN_ON(port_sel != PANEL_PORT_SELECT_LVDS);
+		drm_WARN_ON(&dev_priv->drm,
+			    port_sel != PANEL_PORT_SELECT_LVDS);
 		intel_lvds_port_enabled(dev_priv, LVDS, &panel_pipe);
 	}
 
@@ -1482,7 +1484,9 @@ static void chv_enable_pll(struct intel_crtc *crtc,
 		 * DPLLB VGA mode also seems to cause problems.
 		 * We should always have it disabled.
 		 */
-		WARN_ON((intel_de_read(dev_priv, DPLL(PIPE_B)) & DPLL_VGA_MODE_DIS) == 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    (intel_de_read(dev_priv, DPLL(PIPE_B)) &
+			     DPLL_VGA_MODE_DIS) == 0);
 	} else {
 		intel_de_write(dev_priv, DPLL_MD(pipe),
 			       pipe_config->dpll_hw_state.dpll_md);
@@ -1630,10 +1634,11 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 
 	if (intel_de_wait_for_register(dev_priv, dpll_reg,
 				       port_mask, expected_mask, 1000))
-		WARN(1, "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
-		     dport->base.base.base.id, dport->base.base.name,
-		     intel_de_read(dev_priv, dpll_reg) & port_mask,
-		     expected_mask);
+		drm_WARN(&dev_priv->drm, 1,
+			 "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
+			 dport->base.base.base.id, dport->base.base.name,
+			 intel_de_read(dev_priv, dpll_reg) & port_mask,
+			 expected_mask);
 }
 
 static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
@@ -1872,7 +1877,7 @@ void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state)
 	val = intel_de_read(dev_priv, reg);
 	if (val & PIPECONF_ENABLE) {
 		/* we keep both pipes enabled on 830 */
-		WARN_ON(!IS_I830(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_I830(dev_priv));
 		return;
 	}
 
@@ -2218,11 +2223,11 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	unsigned int pinctl;
 	u32 alignment;
 
-	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
+	if (drm_WARN_ON(dev, !i915_gem_object_is_framebuffer(obj)))
 		return ERR_PTR(-EINVAL);
 
 	alignment = intel_surf_alignment(fb, 0);
-	if (WARN_ON(alignment && !is_power_of_2(alignment)))
+	if (drm_WARN_ON(dev, alignment && !is_power_of_2(alignment)))
 		return ERR_PTR(-EINVAL);
 
 	/* Note that the w/a also requires 64 PTE of padding following the
@@ -2393,7 +2398,7 @@ static u32 intel_adjust_aligned_offset(int *x, int *y,
 	struct drm_i915_private *dev_priv = to_i915(fb->dev);
 	unsigned int cpp = fb->format->cpp[color_plane];
 
-	WARN_ON(new_offset > old_offset);
+	drm_WARN_ON(&dev_priv->drm, new_offset > old_offset);
 
 	if (!is_surface_linear(fb, color_plane)) {
 		unsigned int tile_size, tile_width, tile_height;
@@ -3155,7 +3160,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 	src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
 	src_h = drm_rect_height(&plane_state->uapi.src) >> 16;
 
-	WARN_ON(is_ccs_modifier(fb->modifier));
+	drm_WARN_ON(&dev_priv->drm, is_ccs_modifier(fb->modifier));
 
 	/* Make src coordinates relative to the viewport */
 	drm_rect_translate(&plane_state->uapi.src,
@@ -3196,7 +3201,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 						      DRM_MODE_ROTATE_0, tile_size);
 		offset /= tile_size;
 
-		WARN_ON(i >= ARRAY_SIZE(info->plane));
+		drm_WARN_ON(&dev_priv->drm, i >= ARRAY_SIZE(info->plane));
 		info->plane[i].offset = offset;
 		info->plane[i].stride = DIV_ROUND_UP(fb->pitches[i],
 						     tile_width * cpp);
@@ -3847,7 +3852,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 	intel_add_fb_offsets(&x, &y, plane_state, 0);
 	offset = intel_plane_compute_aligned_offset(&x, &y, plane_state, 0);
 	alignment = intel_surf_alignment(fb, 0);
-	if (WARN_ON(alignment && !is_power_of_2(alignment)))
+	if (drm_WARN_ON(&dev_priv->drm, alignment && !is_power_of_2(alignment)))
 		return -EINVAL;
 
 	/*
@@ -4841,7 +4846,7 @@ __intel_display_resume(struct drm_device *dev,
 
 	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
 
-	WARN_ON(ret == -EDEADLK);
+	drm_WARN_ON(dev, ret == -EDEADLK);
 	return ret;
 }
 
@@ -5621,10 +5626,10 @@ static void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	}
 
 	/* This should not happen with any sane values */
-	WARN_ON(SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
-		~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
-	WARN_ON(SBI_SSCDIVINTPHASE_DIR(phasedir) &
-		~SBI_SSCDIVINTPHASE_INCVAL_MASK);
+	drm_WARN_ON(&dev_priv->drm, SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
+		    ~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
+	drm_WARN_ON(&dev_priv->drm, SBI_SSCDIVINTPHASE_DIR(phasedir) &
+		    ~SBI_SSCDIVINTPHASE_INCVAL_MASK);
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "iCLKIP clock: found settings for %dKHz refresh rate: auxdiv=%x, divsel=%x, phasedir=%x, phaseinc=%x\n",
@@ -5730,8 +5735,12 @@ static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool e
 	if (!!(temp & FDI_BC_BIFURCATION_SELECT) == enable)
 		return;
 
-	WARN_ON(intel_de_read(dev_priv, FDI_RX_CTL(PIPE_B)) & FDI_RX_ENABLE);
-	WARN_ON(intel_de_read(dev_priv, FDI_RX_CTL(PIPE_C)) & FDI_RX_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, FDI_RX_CTL(PIPE_B)) &
+		    FDI_RX_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, FDI_RX_CTL(PIPE_C)) &
+		    FDI_RX_ENABLE);
 
 	temp &= ~FDI_BC_BIFURCATION_SELECT;
 	if (enable)
@@ -5880,7 +5889,7 @@ static void ilk_pch_enable(const struct intel_atomic_state *state,
 			temp |= TRANS_DP_VSYNC_ACTIVE_HIGH;
 
 		port = intel_get_crtc_new_encoder(state, crtc_state)->port;
-		WARN_ON(port < PORT_B || port > PORT_D);
+		drm_WARN_ON(dev, port < PORT_B || port > PORT_D);
 		temp |= TRANS_DP_PORT_SEL(port);
 
 		intel_de_write(dev_priv, reg, temp);
@@ -6236,7 +6245,8 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 		int pfit_w, pfit_h, hscale, vscale;
 		int id;
 
-		if (WARN_ON(crtc_state->scaler_state.scaler_id < 0))
+		if (drm_WARN_ON(&dev_priv->drm,
+				crtc_state->scaler_state.scaler_id < 0))
 			return;
 
 		pfit_w = (crtc_state->pch_pfit.size >> 16) & 0xFFFF;
@@ -6300,11 +6310,11 @@ void hsw_enable_ips(const struct intel_crtc_state *crtc_state)
 	 * This function is called from post_plane_update, which is run after
 	 * a vblank wait.
 	 */
-	WARN_ON(!(crtc_state->active_planes & ~BIT(PLANE_CURSOR)));
+	drm_WARN_ON(dev, !(crtc_state->active_planes & ~BIT(PLANE_CURSOR)));
 
 	if (IS_BROADWELL(dev_priv)) {
-		WARN_ON(sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL,
-						IPS_ENABLE | IPS_PCODE_CONTROL));
+		drm_WARN_ON(dev, sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL,
+							 IPS_ENABLE | IPS_PCODE_CONTROL));
 		/* Quoting Art Runyan: "its not safe to expect any particular
 		 * value in IPS_CTL bit 31 after enabling IPS through the
 		 * mailbox." Moreover, the mailbox may return a bogus state,
@@ -6333,7 +6343,8 @@ void hsw_disable_ips(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (IS_BROADWELL(dev_priv)) {
-		WARN_ON(sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL, 0));
+		drm_WARN_ON(dev,
+			    sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL, 0));
 		/*
 		 * Wait for PCODE to finish disabling IPS. The BSpec specified
 		 * 42ms timeout value leads to occasional timeouts so use 100ms
@@ -6846,7 +6857,7 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	/*
@@ -7002,7 +7013,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	bool psl_clkgate_wa;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	intel_encoders_pre_pll_enable(state, crtc);
@@ -7185,7 +7196,8 @@ static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 	 * The panel fitter should only be adjusted whilst the pipe is disabled,
 	 * according to register description and PRM.
 	 */
-	WARN_ON(intel_de_read(dev_priv, PFIT_CONTROL) & PFIT_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, PFIT_CONTROL) & PFIT_ENABLE);
 	assert_pipe_disabled(dev_priv, crtc_state->cpu_transcoder);
 
 	intel_de_write(dev_priv, PFIT_PGM_RATIOS,
@@ -7381,7 +7393,7 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	if (intel_crtc_has_dp_encoder(new_crtc_state))
@@ -7447,7 +7459,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
 		return;
 
 	i9xx_set_pll_dividers(new_crtc_state);
@@ -7593,7 +7605,7 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	temp_crtc_state = intel_atomic_get_crtc_state(state, crtc);
 	ret = drm_atomic_add_affected_connectors(state, &crtc->base);
 
-	WARN_ON(IS_ERR(temp_crtc_state) || ret);
+	drm_WARN_ON(&dev_priv->drm, IS_ERR(temp_crtc_state) || ret);
 
 	dev_priv->display.crtc_disable(to_intel_atomic_state(state), crtc);
 
@@ -7606,7 +7618,8 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	crtc->active = false;
 	crtc->base.enabled = false;
 
-	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
 	crtc_state->uapi.active = false;
 	crtc_state->uapi.connector_mask = 0;
 	crtc_state->uapi.encoder_mask = 0;
@@ -9216,7 +9229,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
 
-	WARN_ON(pipe != crtc->pipe);
+	drm_WARN_ON(dev, pipe != crtc->pipe);
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
@@ -9328,7 +9341,8 @@ bdw_get_pipemisc_output_format(struct intel_crtc *crtc)
 
 	if (tmp & PIPEMISC_YUV420_ENABLE) {
 		/* We support 4:2:0 in full blend mode only */
-		WARN_ON((tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    (tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
 
 		return INTEL_OUTPUT_FORMAT_YCBCR420;
 	} else if (tmp & PIPEMISC_OUTPUT_COLORSPACE_YUV) {
@@ -9755,10 +9769,11 @@ static void lpt_enable_clkout_dp(struct drm_i915_private *dev_priv,
 {
 	u32 reg, tmp;
 
-	if (WARN(with_fdi && !with_spread, "FDI requires downspread\n"))
+	if (drm_WARN(&dev_priv->drm, with_fdi && !with_spread,
+		     "FDI requires downspread\n"))
 		with_spread = true;
-	if (WARN(HAS_PCH_LPT_LP(dev_priv) &&
-	    with_fdi, "LP PCH doesn't have FDI\n"))
+	if (drm_WARN(&dev_priv->drm, HAS_PCH_LPT_LP(dev_priv) &&
+		     with_fdi, "LP PCH doesn't have FDI\n"))
 		with_fdi = false;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -9852,10 +9867,10 @@ static void lpt_bend_clkout_dp(struct drm_i915_private *dev_priv, int steps)
 	u32 tmp;
 	int idx = BEND_IDX(steps);
 
-	if (WARN_ON(steps % 5 != 0))
+	if (drm_WARN_ON(&dev_priv->drm, steps % 5 != 0))
 		return;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(sscdivintphase)))
+	if (drm_WARN_ON(&dev_priv->drm, idx >= ARRAY_SIZE(sscdivintphase)))
 		return;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -10023,8 +10038,8 @@ static void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 	 * This would end up with an odd purple hue over
 	 * the entire display. Make sure we don't do it.
 	 */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		val |= PIPECONF_COLOR_RANGE_SELECT;
@@ -10435,7 +10450,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
 
-	WARN_ON(pipe != crtc->pipe);
+	drm_WARN_ON(dev, pipe != crtc->pipe);
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
@@ -10570,8 +10585,8 @@ static void ilk_get_pfit_config(struct intel_crtc *crtc,
 		 * ivb/hsw (since we don't use the higher upscaling modes which
 		 * differentiates them) so just WARN about this case for now. */
 		if (IS_GEN(dev_priv, 7)) {
-			WARN_ON((tmp & PF_PIPE_SEL_MASK_IVB) !=
-				PF_PIPE_SEL_IVB(crtc->pipe));
+			drm_WARN_ON(dev, (tmp & PF_PIPE_SEL_MASK_IVB) !=
+				    PF_PIPE_SEL_IVB(crtc->pipe));
 		}
 	}
 }
@@ -10669,8 +10684,8 @@ static bool ilk_get_pipe_config(struct intel_crtc *crtc,
 			intel_get_shared_dpll_by_id(dev_priv, pll_id);
 		pll = pipe_config->shared_dpll;
 
-		WARN_ON(!pll->info->funcs->get_hw_state(dev_priv, pll,
-						&pipe_config->dpll_hw_state));
+		drm_WARN_ON(dev, !pll->info->funcs->get_hw_state(dev_priv, pll,
+						 &pipe_config->dpll_hw_state));
 
 		tmp = pipe_config->dpll_hw_state.dpll;
 		pipe_config->pixel_multiplier =
@@ -10727,7 +10742,7 @@ static void cnl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 	temp = intel_de_read(dev_priv, DPCLKA_CFGCR0) & DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port);
 	id = temp >> DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(port);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL2))
+	if (drm_WARN_ON(&dev_priv->drm, id < SKL_DPLL0 || id > SKL_DPLL2))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10754,12 +10769,13 @@ static void icl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 								    port));
 			port_dpll_id = ICL_PORT_DPLL_MG_PHY;
 		} else {
-			WARN_ON(clk_sel < DDI_CLK_SEL_TBT_162);
+			drm_WARN_ON(&dev_priv->drm,
+				    clk_sel < DDI_CLK_SEL_TBT_162);
 			id = DPLL_ID_ICL_TBTPLL;
 			port_dpll_id = ICL_PORT_DPLL_DEFAULT;
 		}
 	} else {
-		WARN(1, "Invalid port %x\n", port);
+		drm_WARN(&dev_priv->drm, 1, "Invalid port %x\n", port);
 		return;
 	}
 
@@ -10802,7 +10818,7 @@ static void skl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 	temp = intel_de_read(dev_priv, DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_SEL_MASK(port);
 	id = temp >> (port * 3 + 1);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL3))
+	if (drm_WARN_ON(&dev_priv->drm, id < SKL_DPLL0 || id > SKL_DPLL3))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10896,8 +10912,9 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 
 		switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
 		default:
-			WARN(1, "unknown pipe linked to transcoder %s\n",
-			     transcoder_name(panel_transcoder));
+			drm_WARN(dev, 1,
+				 "unknown pipe linked to transcoder %s\n",
+				 transcoder_name(panel_transcoder));
 			/* fall through */
 		case TRANS_DDI_EDP_INPUT_A_ONOFF:
 			force_thru = true;
@@ -10925,11 +10942,11 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 	/*
 	 * Valid combos: none, eDP, DSI0, DSI1, DSI0+DSI1
 	 */
-	WARN_ON((enabled_panel_transcoders & BIT(TRANSCODER_EDP)) &&
-		enabled_panel_transcoders != BIT(TRANSCODER_EDP));
+	drm_WARN_ON(dev, (enabled_panel_transcoders & BIT(TRANSCODER_EDP)) &&
+		    enabled_panel_transcoders != BIT(TRANSCODER_EDP));
 
 	power_domain = POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder);
-	WARN_ON(*power_domain_mask & BIT_ULL(power_domain));
+	drm_WARN_ON(dev, *power_domain_mask & BIT_ULL(power_domain));
 
 	wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (!wf)
@@ -10963,7 +10980,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 			cpu_transcoder = TRANSCODER_DSI_C;
 
 		power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
-		WARN_ON(*power_domain_mask & BIT_ULL(power_domain));
+		drm_WARN_ON(dev, *power_domain_mask & BIT_ULL(power_domain));
 
 		wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 		if (!wf)
@@ -11032,7 +11049,8 @@ static void hsw_get_ddi_port_state(struct intel_crtc *crtc,
 
 	pll = pipe_config->shared_dpll;
 	if (pll) {
-		WARN_ON(!pll->info->funcs->get_hw_state(dev_priv, pll,
+		drm_WARN_ON(&dev_priv->drm,
+			    !pll->info->funcs->get_hw_state(dev_priv, pll,
 						&pipe_config->dpll_hw_state));
 	}
 
@@ -11103,8 +11121,9 @@ static void icl_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 		intel_display_power_put(dev_priv, power_domain, trans_wakeref);
 	}
 
-	WARN_ON(crtc_state->master_transcoder != INVALID_TRANSCODER &&
-		crtc_state->sync_mode_slaves_mask);
+	drm_WARN_ON(&dev_priv->drm,
+		    crtc_state->master_transcoder != INVALID_TRANSCODER &&
+		    crtc_state->sync_mode_slaves_mask);
 }
 
 static bool hsw_get_pipe_config(struct intel_crtc *crtc,
@@ -11135,7 +11154,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	if (IS_GEN9_LP(dev_priv) &&
 	    bxt_get_dsi_transcoder_state(crtc, pipe_config,
 					 &power_domain_mask, wakerefs)) {
-		WARN_ON(active);
+		drm_WARN_ON(&dev_priv->drm, active);
 		active = true;
 	}
 
@@ -11202,7 +11221,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 			REG_FIELD_GET(HSW_IPS_LINETIME_MASK, tmp);
 
 	power_domain = POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe);
-	WARN_ON(power_domain_mask & BIT_ULL(power_domain));
+	drm_WARN_ON(&dev_priv->drm, power_domain_mask & BIT_ULL(power_domain));
 
 	wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (wf) {
@@ -11449,8 +11468,8 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	WARN_ON(plane_state->uapi.visible &&
-		plane_state->color_plane[0].stride != fb->pitches[0]);
+	drm_WARN_ON(&i915->drm, plane_state->uapi.visible &&
+		    plane_state->color_plane[0].stride != fb->pitches[0]);
 
 	switch (fb->pitches[0]) {
 	case 256:
@@ -11666,8 +11685,8 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	WARN_ON(plane_state->uapi.visible &&
-		plane_state->color_plane[0].stride != fb->pitches[0]);
+	drm_WARN_ON(&dev_priv->drm, plane_state->uapi.visible &&
+		    plane_state->color_plane[0].stride != fb->pitches[0]);
 
 	if (fb->pitches[0] !=
 	    drm_rect_width(&plane_state->uapi.dst) * fb->format->cpp[0]) {
@@ -11886,7 +11905,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 
 	old->restore_state = NULL;
 
-	WARN_ON(!drm_modeset_is_locked(&config->connection_mutex));
+	drm_WARN_ON(dev, !drm_modeset_is_locked(&config->connection_mutex));
 
 	/*
 	 * Algorithm gets a little messy:
@@ -12330,7 +12349,7 @@ int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_stat
 	was_visible = old_plane_state->uapi.visible;
 	visible = plane_state->uapi.visible;
 
-	if (!was_crtc_enabled && WARN_ON(was_visible))
+	if (!was_crtc_enabled && drm_WARN_ON(&dev_priv->drm, was_visible))
 		was_visible = false;
 
 	/*
@@ -12676,7 +12695,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (mode_changed && crtc_state->hw.enable &&
 	    dev_priv->display.crtc_compute_clock &&
-	    !WARN_ON(crtc_state->shared_dpll)) {
+	    !drm_WARN_ON(&dev_priv->drm, crtc_state->shared_dpll)) {
 		ret = dev_priv->display.crtc_compute_clock(crtc, crtc_state);
 		if (ret)
 			return ret;
@@ -12706,7 +12725,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	}
 
 	if (dev_priv->display.compute_intermediate_wm) {
-		if (WARN_ON(!dev_priv->display.compute_pipe_wm))
+		if (drm_WARN_ON(&dev_priv->drm,
+				!dev_priv->display.compute_pipe_wm))
 			return 0;
 
 		/*
@@ -13141,12 +13161,12 @@ static bool check_digital_port_conflicts(struct intel_atomic_state *state)
 
 		encoder = to_intel_encoder(connector_state->best_encoder);
 
-		WARN_ON(!connector_state->crtc);
+		drm_WARN_ON(dev, !connector_state->crtc);
 
 		switch (encoder->type) {
 			unsigned int port_mask;
 		case INTEL_OUTPUT_DDI:
-			if (WARN_ON(!HAS_DDI(to_i915(dev))))
+			if (drm_WARN_ON(dev, !HAS_DDI(to_i915(dev))))
 				break;
 			/* else, fall through */
 		case INTEL_OUTPUT_DP:
@@ -13365,7 +13385,8 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 	}
 
 	if (ret == RETRY) {
-		if (WARN(!retry, "loop in pipe configuration computation\n"))
+		if (drm_WARN(&i915->drm, !retry,
+			     "loop in pipe configuration computation\n"))
 			return -EINVAL;
 
 		drm_dbg_kms(&i915->drm, "CRTC bw constrained, retrying\n");
@@ -13925,9 +13946,10 @@ static void intel_pipe_config_sanity_check(struct drm_i915_private *dev_priv,
 		 * FDI already provided one idea for the dotclock.
 		 * Yell if the encoder disagrees.
 		 */
-		WARN(!intel_fuzzy_clock_check(fdi_dotclock, dotclock),
-		     "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
-		     fdi_dotclock, dotclock);
+		drm_WARN(&dev_priv->drm,
+			 !intel_fuzzy_clock_check(fdi_dotclock, dotclock),
+			 "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
+			 fdi_dotclock, dotclock);
 	}
 }
 
@@ -15054,7 +15076,8 @@ static struct intel_crtc *intel_get_slave_crtc(const struct intel_crtc_state *ne
 	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->dev);
 	enum transcoder slave_transcoder;
 
-	WARN_ON(!is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
+	drm_WARN_ON(&dev_priv->drm,
+		    !is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
 
 	slave_transcoder = ffs(new_crtc_state->sync_mode_slaves_mask) - 1;
 	return intel_get_crtc_for_pipe(dev_priv,
@@ -15222,8 +15245,8 @@ static void intel_update_trans_port_sync_crtcs(struct intel_crtc *crtc,
 	struct intel_crtc_state *old_slave_crtc_state =
 		intel_atomic_get_old_crtc_state(state, slave_crtc);
 
-	WARN_ON(!slave_crtc || !new_slave_crtc_state ||
-		!old_slave_crtc_state);
+	drm_WARN_ON(&i915->drm, !slave_crtc || !new_slave_crtc_state ||
+		    !old_slave_crtc_state);
 
 	drm_dbg_kms(&i915->drm,
 		    "Updating Transcoder Port Sync Master CRTC = %d %s and Slave CRTC %d %s\n",
@@ -15361,8 +15384,8 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		    is_trans_port_sync_slave(new_crtc_state))
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, pipe));
+		drm_WARN_ON(&dev_priv->drm, skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+									entries, num_pipes, pipe));
 
 		entries[pipe] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -15396,8 +15419,8 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		if ((modeset_pipes & BIT(pipe)) == 0)
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, pipe));
+		drm_WARN_ON(&dev_priv->drm, skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+									entries, num_pipes, pipe));
 
 		entries[pipe] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -15405,7 +15428,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		intel_update_crtc(crtc, state, old_crtc_state, new_crtc_state);
 	}
 
-	WARN_ON(modeset_pipes);
+	drm_WARN_ON(&dev_priv->drm, modeset_pipes);
 
 }
 
@@ -16666,7 +16689,7 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	intel_color_init(crtc);
 
-	WARN_ON(drm_crtc_index(&crtc->base) != crtc->pipe);
+	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
 	return 0;
 
@@ -17533,7 +17556,7 @@ static void sanitize_watermarks(struct drm_i915_private *dev_priv)
 		return;
 
 	state = drm_atomic_state_alloc(&dev_priv->drm);
-	if (WARN_ON(!state))
+	if (drm_WARN_ON(&dev_priv->drm, !state))
 		return;
 
 	intel_state = to_intel_atomic_state(state);
@@ -17585,7 +17608,8 @@ static void sanitize_watermarks(struct drm_i915_private *dev_priv)
 	 * If this actually happens, we'll have to just leave the
 	 * BIOS-programmed watermarks untouched and hope for the best.
 	 */
-	WARN(ret, "Could not determine valid watermarks for inherited state\n");
+	drm_WARN(&dev_priv->drm, ret,
+		 "Could not determine valid watermarks for inherited state\n");
 
 	drm_atomic_state_put(state);
 
@@ -17880,7 +17904,8 @@ void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	u32 dpll, fp;
 	int i;
 
-	WARN_ON(i9xx_calc_dpll_params(48000, &clock) != 25154);
+	drm_WARN_ON(&dev_priv->drm,
+		    i9xx_calc_dpll_params(48000, &clock) != 25154);
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "enabling pipe %c due to force quirk (vco=%d dot=%d)\n",
@@ -17945,11 +17970,19 @@ void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	drm_dbg_kms(&dev_priv->drm, "disabling pipe %c due to force quirk\n",
 		    pipe_name(pipe));
 
-	WARN_ON(intel_de_read(dev_priv, DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(intel_de_read(dev_priv, DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(intel_de_read(dev_priv, DSPCNTR(PLANE_C)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(intel_de_read(dev_priv, CURCNTR(PIPE_A)) & MCURSOR_MODE);
-	WARN_ON(intel_de_read(dev_priv, CURCNTR(PIPE_B)) & MCURSOR_MODE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, DSPCNTR(PLANE_A)) &
+		    DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, DSPCNTR(PLANE_B)) &
+		    DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, DSPCNTR(PLANE_C)) &
+		    DISPLAY_PLANE_ENABLE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, CURCNTR(PIPE_A)) & MCURSOR_MODE);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, CURCNTR(PIPE_B)) & MCURSOR_MODE);
 
 	intel_de_write(dev_priv, PIPECONF(pipe), 0);
 	intel_de_posting_read(dev_priv, PIPECONF(pipe));
@@ -18453,7 +18486,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 
 		if (crtc_state->hw.active) {
 			min_cdclk = intel_crtc_compute_min_cdclk(crtc_state);
-			if (WARN_ON(min_cdclk < 0))
+			if (drm_WARN_ON(dev, min_cdclk < 0))
 				min_cdclk = 0;
 		}
 
@@ -18667,7 +18700,7 @@ intel_modeset_setup_hw_state(struct drm_device *dev,
 		u64 put_domains;
 
 		put_domains = modeset_get_crtc_power_domains(crtc_state);
-		if (WARN_ON(put_domains))
+		if (drm_WARN_ON(dev, put_domains))
 			modeset_put_power_domains(dev_priv, put_domains);
 	}
 
@@ -18734,7 +18767,7 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 	flush_workqueue(i915->modeset_wq);
 
 	flush_work(&i915->atomic_helper.free_work);
-	WARN_ON(!llist_empty(&i915->atomic_helper.free_list));
+	drm_WARN_ON(&i915->drm, !llist_empty(&i915->atomic_helper.free_list));
 }
 
 /* part #2: call after irq uninstall */
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
