Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2E1316C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD286E4E6;
	Mon,  6 Jan 2020 17:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92F36E4D0;
 Mon,  6 Jan 2020 17:28:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; 
 d="scan'208,217";a="225496114"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:29 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 4/7] drm/i915: Make WARN* device specific where
 drm_device ptr available
Date: Mon,  6 Jan 2020 22:53:23 +0530
Message-Id: <20200106172326.32592-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Device specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific dev_WARN*
variants in functions where drm_device struct pointer is readily
available.

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
+dev_WARN(T->dev,
...)
|
-WARN_ON(
+dev_WARN_ON(T->dev,
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(T->dev,
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(T->dev,
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
+dev_WARN(T->dev,
...)
|
-WARN_ON(
+dev_WARN_ON(T->dev,
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(T->dev,
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(T->dev,
...)
)
...>
}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915 \
					--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 .../gpu/drm/i915/display/intel_connector.c    |  3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 10 +--
 drivers/gpu/drm/i915/display/intel_display.c  | 66 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  2 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 15 +++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++--
 drivers/gpu/drm/i915/display/intel_hotplug.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  4 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  5 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  7 +-
 drivers/gpu/drm/i915/i915_irq.c               |  2 +-
 13 files changed, 87 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 1133c4e97bb4..5ebd5d8e5b87 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -162,7 +162,8 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector)
 {
 	struct drm_device *dev = connector->base.dev;
 
-	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
+	dev_WARN_ON(dev->dev,
+		    !drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
 	if (!connector->base.state->crtc)
 		return INVALID_PIPE;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 23f091e64498..5832faf74fdf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1260,8 +1260,9 @@ intel_ddi_get_crtc_encoder(struct intel_crtc *crtc)
 	}
 
 	if (num_encoders != 1)
-		WARN(1, "%d encoders on crtc for pipe %c\n", num_encoders,
-		     pipe_name(crtc->pipe));
+		dev_WARN(dev->dev, 1, "%d encoders on crtc for pipe %c\n",
+			 num_encoders,
+			 pipe_name(crtc->pipe));
 
 	BUG_ON(ret == NULL);
 	return ret;
@@ -1983,10 +1984,11 @@ int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
 
 	wakeref = intel_display_power_get_if_enabled(dev_priv,
 						     intel_encoder->power_domain);
-	if (WARN_ON(!wakeref))
+	if (dev_WARN_ON(dev->dev, !wakeref))
 		return -ENXIO;
 
-	if (WARN_ON(!intel_encoder->get_hw_state(intel_encoder, &pipe))) {
+	if (dev_WARN_ON(dev->dev, !intel_encoder->get_hw_state(intel_encoder,
+							       &pipe))) {
 		ret = -EIO;
 		goto out;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ed755d54e4e5..817f49425bfb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -890,7 +890,7 @@ static bool vlv_PLL_is_optimal(struct drm_device *dev, int target_freq,
 		return calculated_clock->p > best_clock->p;
 	}
 
-	if (WARN_ON_ONCE(!target_freq))
+	if (dev_WARN_ON_ONCE(dev->dev, !target_freq))
 		return false;
 
 	*error_ppm = div_u64(1000000ULL *
@@ -2190,7 +2190,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	unsigned int pinctl;
 	u32 alignment;
 
-	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
+	if (dev_WARN_ON(dev->dev, !i915_gem_object_is_framebuffer(obj)))
 		return ERR_PTR(-EINVAL);
 
 	alignment = intel_surf_alignment(fb, 0);
@@ -4656,7 +4656,7 @@ __intel_display_resume(struct drm_device *dev,
 
 	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
 
-	WARN_ON(ret == -EDEADLK);
+	dev_WARN_ON(dev->dev, ret == -EDEADLK);
 	return ret;
 }
 
@@ -5677,7 +5677,7 @@ static void ilk_pch_enable(const struct intel_atomic_state *state,
 			temp |= TRANS_DP_VSYNC_ACTIVE_HIGH;
 
 		port = intel_get_crtc_new_encoder(state, crtc_state)->port;
-		WARN_ON(port < PORT_B || port > PORT_D);
+		dev_WARN_ON(dev->dev, port < PORT_B || port > PORT_D);
 		temp |= TRANS_DP_PORT_SEL(port);
 
 		I915_WRITE(reg, temp);
@@ -6083,11 +6083,15 @@ void hsw_enable_ips(const struct intel_crtc_state *crtc_state)
 	 * This function is called from post_plane_update, which is run after
 	 * a vblank wait.
 	 */
-	WARN_ON(!(crtc_state->active_planes & ~BIT(PLANE_CURSOR)));
+	dev_WARN_ON(dev->dev,
+		    !(crtc_state->active_planes & ~BIT(PLANE_CURSOR)));
 
 	if (IS_BROADWELL(dev_priv)) {
-		WARN_ON(sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL,
-						IPS_ENABLE | IPS_PCODE_CONTROL));
+		dev_WARN_ON(dev->dev,
+			    sandybridge_pcode_write(dev_priv,
+						    DISPLAY_IPS_CONTROL,
+						    IPS_ENABLE |
+						    IPS_PCODE_CONTROL));
 		/* Quoting Art Runyan: "its not safe to expect any particular
 		 * value in IPS_CTL bit 31 after enabling IPS through the
 		 * mailbox." Moreover, the mailbox may return a bogus state,
@@ -6115,7 +6119,9 @@ void hsw_disable_ips(const struct intel_crtc_state *crtc_state)
 		return;
 
 	if (IS_BROADWELL(dev_priv)) {
-		WARN_ON(sandybridge_pcode_write(dev_priv, DISPLAY_IPS_CONTROL, 0));
+		dev_WARN_ON(dev->dev,
+			    sandybridge_pcode_write(dev_priv,
+						    DISPLAY_IPS_CONTROL, 0));
 		/*
 		 * Wait for PCODE to finish disabling IPS. The BSpec specified
 		 * 42ms timeout value leads to occasional timeouts so use 100ms
@@ -8952,7 +8958,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
 
-	WARN_ON(pipe != crtc->pipe);
+	dev_WARN_ON(dev->dev, pipe != crtc->pipe);
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
@@ -10149,7 +10155,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
 
-	WARN_ON(pipe != crtc->pipe);
+	dev_WARN_ON(dev->dev, pipe != crtc->pipe);
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
@@ -10278,8 +10284,8 @@ static void ilk_get_pfit_config(struct intel_crtc *crtc,
 		 * ivb/hsw (since we don't use the higher upscaling modes which
 		 * differentiates them) so just WARN about this case for now. */
 		if (IS_GEN(dev_priv, 7)) {
-			WARN_ON((tmp & PF_PIPE_SEL_MASK_IVB) !=
-				PF_PIPE_SEL_IVB(crtc->pipe));
+			dev_WARN_ON(dev->dev, (tmp & PF_PIPE_SEL_MASK_IVB) !=
+				    PF_PIPE_SEL_IVB(crtc->pipe));
 		}
 	}
 }
@@ -10376,7 +10382,8 @@ static bool ilk_get_pipe_config(struct intel_crtc *crtc,
 			intel_get_shared_dpll_by_id(dev_priv, pll_id);
 		pll = pipe_config->shared_dpll;
 
-		WARN_ON(!pll->info->funcs->get_hw_state(dev_priv, pll,
+		dev_WARN_ON(dev->dev,
+			    !pll->info->funcs->get_hw_state(dev_priv, pll,
 						&pipe_config->dpll_hw_state));
 
 		tmp = pipe_config->dpll_hw_state.dpll;
@@ -10601,8 +10608,9 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 
 		switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
 		default:
-			WARN(1, "unknown pipe linked to transcoder %s\n",
-			     transcoder_name(panel_transcoder));
+			dev_WARN(dev->dev, 1,
+				 "unknown pipe linked to transcoder %s\n",
+				 transcoder_name(panel_transcoder));
 			/* fall through */
 		case TRANS_DDI_EDP_INPUT_A_ONOFF:
 			force_thru = true;
@@ -10630,11 +10638,12 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 	/*
 	 * Valid combos: none, eDP, DSI0, DSI1, DSI0+DSI1
 	 */
-	WARN_ON((enabled_panel_transcoders & BIT(TRANSCODER_EDP)) &&
-		enabled_panel_transcoders != BIT(TRANSCODER_EDP));
+	dev_WARN_ON(dev->dev,
+		    (enabled_panel_transcoders & BIT(TRANSCODER_EDP)) &&
+		    enabled_panel_transcoders != BIT(TRANSCODER_EDP));
 
 	power_domain = POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder);
-	WARN_ON(*power_domain_mask & BIT_ULL(power_domain));
+	dev_WARN_ON(dev->dev, *power_domain_mask & BIT_ULL(power_domain));
 
 	wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (!wf)
@@ -10668,7 +10677,8 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 			cpu_transcoder = TRANSCODER_DSI_C;
 
 		power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
-		WARN_ON(*power_domain_mask & BIT_ULL(power_domain));
+		dev_WARN_ON(dev->dev,
+			    *power_domain_mask & BIT_ULL(power_domain));
 
 		wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 		if (!wf)
@@ -11569,7 +11579,8 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 
 	old->restore_state = NULL;
 
-	WARN_ON(!drm_modeset_is_locked(&config->connection_mutex));
+	dev_WARN_ON(dev->dev,
+		    !drm_modeset_is_locked(&config->connection_mutex));
 
 	/*
 	 * Algorithm gets a little messy:
@@ -12786,12 +12797,12 @@ static bool check_digital_port_conflicts(struct intel_atomic_state *state)
 
 		encoder = to_intel_encoder(connector_state->best_encoder);
 
-		WARN_ON(!connector_state->crtc);
+		dev_WARN_ON(dev->dev, !connector_state->crtc);
 
 		switch (encoder->type) {
 			unsigned int port_mask;
 		case INTEL_OUTPUT_DDI:
-			if (WARN_ON(!HAS_DDI(to_i915(dev))))
+			if (dev_WARN_ON(dev->dev, !HAS_DDI(to_i915(dev))))
 				break;
 			/* else, fall through */
 		case INTEL_OUTPUT_DP:
@@ -17036,12 +17047,12 @@ static void sanitize_watermarks(struct drm_device *dev)
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
 		goto retry;
-	} else if (WARN_ON(ret)) {
+	} else if (dev_WARN_ON(dev->dev, ret)) {
 		goto fail;
 	}
 
 	state = drm_atomic_helper_duplicate_state(dev, &ctx);
-	if (WARN_ON(IS_ERR(state)))
+	if (dev_WARN_ON(dev->dev, IS_ERR(state)))
 		goto fail;
 
 	intel_state = to_intel_atomic_state(state);
@@ -17067,7 +17078,8 @@ static void sanitize_watermarks(struct drm_device *dev)
 		 * If this actually happens, we'll have to just leave the
 		 * BIOS-programmed watermarks untouched and hope for the best.
 		 */
-		WARN(true, "Could not determine valid watermarks for inherited state\n");
+		dev_WARN(dev->dev, true,
+			 "Could not determine valid watermarks for inherited state\n");
 		goto put_state;
 	}
 
@@ -17885,7 +17897,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 
 		if (crtc_state->hw.active) {
 			min_cdclk = intel_crtc_compute_min_cdclk(crtc_state);
-			if (WARN_ON(min_cdclk < 0))
+			if (dev_WARN_ON(dev->dev, min_cdclk < 0))
 				min_cdclk = 0;
 		}
 
@@ -18096,7 +18108,7 @@ intel_modeset_setup_hw_state(struct drm_device *dev,
 		u64 put_domains;
 
 		put_domains = modeset_get_crtc_power_domains(crtc_state);
-		if (WARN_ON(put_domains))
+		if (dev_WARN_ON(dev->dev, put_domains))
 			modeset_put_power_domains(dev_priv, put_domains);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 991f343579ef..255de50fcf84 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7331,7 +7331,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 * with an already powered-on LVDS power sequencer.
 	 */
 	if (intel_get_lvds_encoder(dev_priv)) {
-		WARN_ON(!(HAS_PCH_IBX(dev_priv) || HAS_PCH_CPT(dev_priv)));
+		dev_WARN_ON(dev->dev,
+			    !(HAS_PCH_IBX(dev_priv) || HAS_PCH_CPT(dev_priv)));
 		DRM_INFO("LVDS was detected, not registering eDP\n");
 
 		return false;
@@ -7459,10 +7460,10 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 	INIT_WORK(&intel_connector->modeset_retry_work,
 		  intel_dp_modeset_retry_work_fn);
 
-	if (WARN(intel_dig_port->max_lanes < 1,
-		 "Not enough lanes (%d) for DP on [ENCODER:%d:%s]\n",
-		 intel_dig_port->max_lanes, intel_encoder->base.base.id,
-		 intel_encoder->base.name))
+	if (dev_WARN(dev->dev, intel_dig_port->max_lanes < 1,
+		     "Not enough lanes (%d) for DP on [ENCODER:%d:%s]\n",
+		     intel_dig_port->max_lanes, intel_encoder->base.base.id,
+		     intel_encoder->base.name))
 		return false;
 
 	intel_dp_set_source_rates(intel_dp);
@@ -7480,7 +7481,7 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 		 * Currently we don't support eDP on TypeC ports, although in
 		 * theory it could work on TypeC legacy ports.
 		 */
-		WARN_ON(intel_phy_is_tc(dev_priv, phy));
+		dev_WARN_ON(dev->dev, intel_phy_is_tc(dev_priv, phy));
 		type = DRM_MODE_CONNECTOR_eDP;
 	} else {
 		type = DRM_MODE_CONNECTOR_DisplayPort;
@@ -7498,9 +7499,10 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 		intel_encoder->type = INTEL_OUTPUT_EDP;
 
 	/* eDP only on port B and/or C on vlv/chv */
-	if (WARN_ON((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
-		    intel_dp_is_edp(intel_dp) &&
-		    port != PORT_B && port != PORT_C))
+	if (dev_WARN_ON(dev->dev, (IS_VALLEYVIEW(dev_priv) ||
+				   IS_CHERRYVIEW(dev_priv)) &&
+			intel_dp_is_edp(intel_dp) &&
+			port != PORT_B && port != PORT_C))
 		return false;
 
 	DRM_DEBUG_KMS("Adding %s connector on [ENCODER:%d:%s]\n",
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 728a4b045de7..2cae30d2669c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -3777,7 +3777,7 @@ void intel_shared_dpll_init(struct drm_device *dev)
 	dpll_info = dpll_mgr->dpll_info;
 
 	for (i = 0; dpll_info[i].name; i++) {
-		WARN_ON(i != dpll_info[i].id);
+		dev_WARN_ON(dev->dev, i != dpll_info[i].id);
 		dev_priv->shared_dplls[i].info = &dpll_info[i];
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index bb3fd8b786a2..39ce0ad9ca6e 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -166,7 +166,7 @@ int intel_dsi_dcs_init_backlight_funcs(struct intel_connector *intel_connector)
 	if (dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_DSI_DCS)
 		return -ENODEV;
 
-	if (WARN_ON(encoder->type != INTEL_OUTPUT_DSI))
+	if (dev_WARN_ON(dev->dev, encoder->type != INTEL_OUTPUT_DSI))
 		return -EINVAL;
 
 	panel->backlight.setup = dcs_setup_backlight;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 1e98e432c9fa..bb5ef7d1b7ea 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -191,7 +191,8 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		drm_framebuffer_put(&intel_fb->base);
 		intel_fb = ifbdev->fb = NULL;
 	}
-	if (!intel_fb || WARN_ON(!intel_fb_obj(&intel_fb->base))) {
+	if (!intel_fb || dev_WARN_ON(dev->dev,
+				     !intel_fb_obj(&intel_fb->base))) {
 		DRM_DEBUG_KMS("no BIOS fb, allocating a new one\n");
 		ret = intelfb_alloc(helper, sizes);
 		if (ret)
@@ -410,9 +411,9 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 		if (!crtc->state->active)
 			continue;
 
-		WARN(!crtc->primary->state->fb,
-		     "re-used BIOS config but lost an fb on crtc %d\n",
-		     crtc->base.id);
+		dev_WARN(dev->dev, !crtc->primary->state->fb,
+			 "re-used BIOS config but lost an fb on crtc %d\n",
+			 crtc->base.id);
 	}
 
 
@@ -439,7 +440,9 @@ int intel_fbdev_init(struct drm_device *dev)
 	struct intel_fbdev *ifbdev;
 	int ret;
 
-	if (WARN_ON(!HAS_DISPLAY(dev_priv) || !INTEL_DISPLAY_ENABLED(dev_priv)))
+	if (dev_WARN_ON(dev->dev,
+			!HAS_DISPLAY(dev_priv) ||
+			!INTEL_DISPLAY_ENABLED(dev_priv)))
 		return -ENODEV;
 
 	ifbdev = kzalloc(sizeof(struct intel_fbdev), GFP_KERNEL);
@@ -569,7 +572,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 		 * to all the printk activity.  Try to keep it out of the hot
 		 * path of resume if possible.
 		 */
-		WARN_ON(state != FBINFO_STATE_RUNNING);
+		dev_WARN_ON(dev->dev, state != FBINFO_STATE_RUNNING);
 		if (!console_trylock()) {
 			/* Don't block our own workqueue as this can
 			 * be run in parallel with other i915.ko tasks.
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 685589064d10..715b854b24a0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -72,8 +72,8 @@ assert_hdmi_port_disabled(struct intel_hdmi *intel_hdmi)
 
 	enabled_bits = HAS_DDI(dev_priv) ? DDI_BUF_CTL_ENABLE : SDVO_ENABLE;
 
-	WARN(I915_READ(intel_hdmi->hdmi_reg) & enabled_bits,
-	     "HDMI port enabled, expecting disabled\n");
+	dev_WARN(dev->dev, I915_READ(intel_hdmi->hdmi_reg) & enabled_bits,
+		 "HDMI port enabled, expecting disabled\n");
 }
 
 static void
@@ -3138,13 +3138,13 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	DRM_DEBUG_KMS("Adding HDMI connector on [ENCODER:%d:%s]\n",
 		      intel_encoder->base.base.id, intel_encoder->base.name);
 
-	if (INTEL_GEN(dev_priv) < 12 && WARN_ON(port == PORT_A))
+	if (INTEL_GEN(dev_priv) < 12 && dev_WARN_ON(dev->dev, port == PORT_A))
 		return;
 
-	if (WARN(intel_dig_port->max_lanes < 4,
-		 "Not enough lanes (%d) for HDMI on [ENCODER:%d:%s]\n",
-		 intel_dig_port->max_lanes, intel_encoder->base.base.id,
-		 intel_encoder->base.name))
+	if (dev_WARN(dev->dev, intel_dig_port->max_lanes < 4,
+		     "Not enough lanes (%d) for HDMI on [ENCODER:%d:%s]\n",
+		     intel_dig_port->max_lanes, intel_encoder->base.base.id,
+		     intel_encoder->base.name))
 		return;
 
 	intel_hdmi->ddc_bus = intel_hdmi_ddc_pin(dev_priv, port);
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index fc29046d48ea..3a5e0db8888a 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -281,7 +281,7 @@ intel_encoder_hotplug(struct intel_encoder *encoder,
 	struct drm_device *dev = connector->base.dev;
 	enum drm_connector_status old_status;
 
-	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
+	dev_WARN_ON(dev->dev, !mutex_is_locked(&dev->mode_config.mutex));
 	old_status = connector->base.status;
 
 	connector->base.status =
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 10696bb99dcf..a320b8d76a64 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -827,8 +827,8 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 
 	/* Skip init on machines we know falsely report LVDS */
 	if (dmi_check_system(intel_no_lvds)) {
-		WARN(!dev_priv->vbt.int_lvds_support,
-		     "Useless DMI match. Internal LVDS support disabled by VBT\n");
+		dev_WARN(dev->dev, !dev_priv->vbt.int_lvds_support,
+			 "Useless DMI match. Internal LVDS support disabled by VBT\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 2746512f4466..283416c73205 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -110,8 +110,9 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 				*source = INTEL_PIPE_CRC_SOURCE_DP_D;
 				break;
 			default:
-				WARN(1, "nonexisting DP port %c\n",
-				     port_name(dig_port->base.port));
+				dev_WARN(dev->dev, 1,
+					 "nonexisting DP port %c\n",
+					 port_name(dig_port->base.port));
 				break;
 			}
 			break;
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 8758ee2a4442..9b510a4cf8c5 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1667,9 +1667,10 @@ static void intel_sdvo_get_config(struct intel_encoder *encoder,
 		}
 	}
 
-	WARN(encoder_pixel_multiplier != pipe_config->pixel_multiplier,
-	     "SDVO pixel multiplier mismatch, port: %i, encoder: %i\n",
-	     pipe_config->pixel_multiplier, encoder_pixel_multiplier);
+	dev_WARN(dev->dev,
+		 encoder_pixel_multiplier != pipe_config->pixel_multiplier,
+		 "SDVO pixel multiplier mismatch, port: %i, encoder: %i\n",
+		 pipe_config->pixel_multiplier, encoder_pixel_multiplier);
 
 	if (sdvox & HDMI_COLOR_RANGE_16_235)
 		pipe_config->limited_color_range = true;
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index afc6aad9bf8c..d1a254de182d 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -777,7 +777,7 @@ bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
 		IS_G4X(dev_priv) || IS_GEN(dev_priv, 2) ||
 		mode->private_flags & I915_MODE_FLAG_USE_SCANLINE_COUNTER;
 
-	if (WARN_ON(!mode->crtc_clock)) {
+	if (dev_WARN_ON(dev->dev, !mode->crtc_clock)) {
 		DRM_DEBUG_DRIVER("trying to get scanoutpos for disabled "
 				 "pipe %c\n", pipe_name(pipe));
 		return false;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
