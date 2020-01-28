Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22714C08B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 20:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD166E10C;
	Tue, 28 Jan 2020 19:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FD46E062;
 Tue, 28 Jan 2020 19:04:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310817817"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:27:59 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [Intel-gfx] [PATCH v5 05/21] drm/i915/display/ddi: Make WARN* drm
 specific where drm_device ptr is available
Date: Tue, 28 Jan 2020 23:45:47 +0530
Message-Id: <20200128181603.27767-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/display/intel_ddi.c | 92 +++++++++++++-----------
 1 file changed, 51 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index b1100950dd0d..6357637d3caa 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -980,18 +980,18 @@ static int intel_ddi_hdmi_level(struct intel_encoder *encoder)
 		intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 		default_entry = 6;
 	} else {
-		WARN(1, "ddi translation table missing\n");
+		drm_WARN(&dev_priv->drm, 1, "ddi translation table missing\n");
 		return 0;
 	}
 
-	if (WARN_ON_ONCE(n_entries == 0))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, n_entries == 0))
 		return 0;
 
 	level = intel_bios_hdmi_level_shift(encoder);
 	if (level < 0)
 		level = default_entry;
 
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	return level;
@@ -1049,9 +1049,9 @@ static void intel_prepare_hdmi_ddi_buffers(struct intel_encoder *encoder,
 
 	ddi_translations = intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	/* If we're boosting the current, set bit 31 of trans1 */
@@ -1183,7 +1183,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 	/* Configure Port Clock Select */
 	ddi_pll_sel = hsw_pll_to_ddi_pll_sel(crtc_state->shared_dpll);
 	I915_WRITE(PORT_CLK_SEL(PORT_E), ddi_pll_sel);
-	WARN_ON(ddi_pll_sel != PORT_CLK_SEL_SPLL);
+	drm_WARN_ON(&dev_priv->drm, ddi_pll_sel != PORT_CLK_SEL_SPLL);
 
 	/* Start the training iterating through available voltages and emphasis,
 	 * testing each value twice. */
@@ -1300,8 +1300,9 @@ intel_ddi_get_crtc_encoder(struct intel_crtc *crtc)
 	}
 
 	if (num_encoders != 1)
-		WARN(1, "%d encoders on crtc for pipe %c\n", num_encoders,
-		     pipe_name(crtc->pipe));
+		drm_WARN(dev, 1, "%d encoders on crtc for pipe %c\n",
+			 num_encoders,
+			 pipe_name(crtc->pipe));
 
 	BUG_ON(ret == NULL);
 	return ret;
@@ -1459,7 +1460,7 @@ int cnl_calc_wrpll_link(struct drm_i915_private *dev_priv,
 	dco_freq += (((pll_state->cfgcr0 & DPLL_CFGCR0_DCO_FRACTION_MASK) >>
 		      DPLL_CFGCR0_DCO_FRACTION_SHIFT) * ref_clock) / 0x8000;
 
-	if (WARN_ON(p0 == 0 || p1 == 0 || p2 == 0))
+	if (drm_WARN_ON(&dev_priv->drm, p0 == 0 || p1 == 0 || p2 == 0))
 		return 0;
 
 	return dco_freq / (p0 * p1 * p2 * 5);
@@ -1647,7 +1648,7 @@ static void cnl_ddi_clock_get(struct intel_encoder *encoder,
 			link_clock = 405000;
 			break;
 		default:
-			WARN(1, "Unsupported link rate\n");
+			drm_WARN(&dev_priv->drm, 1, "Unsupported link rate\n");
 			break;
 		}
 		link_clock *= 2;
@@ -1739,12 +1740,12 @@ static void hsw_ddi_clock_get(struct intel_encoder *encoder,
 		else if (pll == SPLL_FREQ_2700MHz)
 			link_clock = 270000;
 		else {
-			WARN(1, "bad spll freq\n");
+			drm_WARN(&dev_priv->drm, 1, "bad spll freq\n");
 			return;
 		}
 		break;
 	default:
-		WARN(1, "bad port clock sel\n");
+		drm_WARN(&dev_priv->drm, 1, "bad port clock sel\n");
 		return;
 	}
 
@@ -1805,7 +1806,7 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	if (!intel_crtc_has_dp_encoder(crtc_state))
 		return;
 
-	WARN_ON(transcoder_is_dsi(cpu_transcoder));
+	drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder));
 
 	temp = DP_MSA_MISC_SYNC_CLOCK;
 
@@ -1828,8 +1829,8 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	}
 
 	/* nonsense combination */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		temp |= DP_MSA_MISC_COLOR_CEA_RGB;
@@ -1945,7 +1946,8 @@ intel_ddi_transcoder_func_reg_val_get(const struct intel_crtc_state *crtc_state)
 			enum transcoder master;
 
 			master = crtc_state->mst_master_transcoder;
-			WARN_ON(master == INVALID_TRANSCODER);
+			drm_WARN_ON(&dev_priv->drm,
+				    master == INVALID_TRANSCODER);
 			temp |= TRANS_DDI_MST_TRANSPORT_SELECT(master);
 		}
 	} else {
@@ -2024,10 +2026,11 @@ int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
 
 	wakeref = intel_display_power_get_if_enabled(dev_priv,
 						     intel_encoder->power_domain);
-	if (WARN_ON(!wakeref))
+	if (drm_WARN_ON(dev, !wakeref))
 		return -ENXIO;
 
-	if (WARN_ON(!intel_encoder->get_hw_state(intel_encoder, &pipe))) {
+	if (drm_WARN_ON(dev,
+			!intel_encoder->get_hw_state(intel_encoder, &pipe))) {
 		ret = -EIO;
 		goto out;
 	}
@@ -2262,7 +2265,8 @@ static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
 	 * happen since fake-MST encoders don't set their get_power_domains()
 	 * hook.
 	 */
-	if (WARN_ON(intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
 		return;
 
 	dig_port = enc_to_dig_port(encoder);
@@ -2356,9 +2360,9 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 		else
 			ddi_translations = intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 
-		if (WARN_ON_ONCE(!ddi_translations))
+		if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 			return;
-		if (WARN_ON_ONCE(level >= n_entries))
+		if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 			level = n_entries - 1;
 
 		iboost = ddi_translations[level].i_boost;
@@ -2391,9 +2395,9 @@ static void bxt_ddi_vswing_sequence(struct intel_encoder *encoder,
 	else
 		ddi_translations = bxt_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	bxt_ddi_phy_set_signal_level(dev_priv, port,
@@ -2440,9 +2444,10 @@ u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
 			intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 	}
 
-	if (WARN_ON(n_entries < 1))
+	if (drm_WARN_ON(&dev_priv->drm, n_entries < 1))
 		n_entries = 1;
-	if (WARN_ON(n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
 		n_entries = ARRAY_SIZE(index_to_dp_signal_levels);
 
 	return index_to_dp_signal_levels[n_entries - 1] &
@@ -2485,9 +2490,9 @@ static void cnl_ddi_vswing_program(struct intel_encoder *encoder,
 	else
 		ddi_translations = cnl_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
 		level = n_entries - 1;
 
 	/* Set PORT_TX_DW5 Scaling Mode Sel to 010b. */
@@ -3011,7 +3016,8 @@ static void icl_map_plls_to_ports(struct intel_encoder *encoder,
 	mutex_lock(&dev_priv->dpll_lock);
 
 	val = I915_READ(ICL_DPCLKA_CFGCR0);
-	WARN_ON((val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    (val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
 
 	if (intel_phy_is_combo(dev_priv, phy)) {
 		/*
@@ -3070,7 +3076,7 @@ static void icl_sanitize_port_clk_off(struct drm_i915_private *dev_priv,
 		 * Punt on the case now where clock is gated, but it would
 		 * be needed by the port. Something else is really broken then.
 		 */
-		if (WARN_ON(ddi_clk_needed))
+		if (drm_WARN_ON(&dev_priv->drm, ddi_clk_needed))
 			continue;
 
 		DRM_NOTE("PHY %c is disabled/in DSI mode with an ungated DDI clock, gate it\n",
@@ -3102,7 +3108,7 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 		 * In the unlikely case that BIOS enables DP in MST mode, just
 		 * warn since our MST HW readout is incomplete.
 		 */
-		if (WARN_ON(is_mst))
+		if (drm_WARN_ON(&dev_priv->drm, is_mst))
 			return;
 	}
 
@@ -3121,7 +3127,8 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 			if (other_encoder == encoder)
 				continue;
 
-			if (WARN_ON(port_mask & BIT(other_encoder->port)))
+			if (drm_WARN_ON(&dev_priv->drm,
+					port_mask & BIT(other_encoder->port)))
 				return;
 		}
 		/*
@@ -3143,7 +3150,7 @@ static void intel_ddi_clk_select(struct intel_encoder *encoder,
 	u32 val;
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(!pll))
+	if (drm_WARN_ON(&dev_priv->drm, !pll))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
@@ -3243,7 +3250,8 @@ icl_program_mg_dp_mode(struct intel_digital_port *intel_dig_port,
 
 	switch (pin_assignment) {
 	case 0x0:
-		WARN_ON(intel_dig_port->tc_mode != TC_PORT_LEGACY);
+		drm_WARN_ON(&dev_priv->drm,
+			    intel_dig_port->tc_mode != TC_PORT_LEGACY);
 		if (width == 1) {
 			ln1 |= MG_DP_MODE_CFG_DP_X1_MODE;
 		} else {
@@ -3498,9 +3506,10 @@ static void hsw_ddi_pre_enable_dp(struct intel_encoder *encoder,
 	int level = intel_ddi_dp_level(intel_dp);
 
 	if (INTEL_GEN(dev_priv) < 11)
-		WARN_ON(is_mst && (port == PORT_A || port == PORT_E));
+		drm_WARN_ON(&dev_priv->drm,
+			    is_mst && (port == PORT_A || port == PORT_E));
 	else
-		WARN_ON(is_mst && port == PORT_A);
+		drm_WARN_ON(&dev_priv->drm, is_mst && port == PORT_A);
 
 	intel_dp_set_link_params(intel_dp, crtc_state->port_clock,
 				 crtc_state->lane_count, is_mst);
@@ -3636,7 +3645,7 @@ static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 	 *   the DP link parameteres
 	 */
 
-	WARN_ON(crtc_state->has_pch_encoder);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->has_pch_encoder);
 
 	if (INTEL_GEN(dev_priv) >= 11)
 		icl_map_plls_to_ports(encoder, crtc_state);
@@ -3906,9 +3915,9 @@ gen9_chicken_trans_reg_by_port(struct drm_i915_private *dev_priv,
 		[PORT_E] = TRANSCODER_A,
 	};
 
-	WARN_ON(INTEL_GEN(dev_priv) < 9);
+	drm_WARN_ON(&dev_priv->drm, INTEL_GEN(dev_priv) < 9);
 
-	if (WARN_ON(port < PORT_A || port > PORT_E))
+	if (drm_WARN_ON(&dev_priv->drm, port < PORT_A || port > PORT_E))
 		port = PORT_A;
 
 	return CHICKEN_TRANS(trans[port]);
@@ -4228,7 +4237,7 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 	u32 temp, flags = 0;
 
 	/* XXX: DSI transcoder paranoia */
-	if (WARN_ON(transcoder_is_dsi(cpu_transcoder)))
+	if (drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder)))
 		return;
 
 	intel_dsc_get_config(encoder, pipe_config);
@@ -4525,7 +4534,8 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 
 	crtc_state = to_intel_crtc_state(crtc->base.state);
 
-	WARN_ON(!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
+	drm_WARN_ON(&dev_priv->drm,
+		    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
 
 	if (!crtc_state->hw.active)
 		return 0;
@@ -4774,7 +4784,7 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 		encoder->update_complete = intel_ddi_update_complete;
 	}
 
-	WARN_ON(port > PORT_I);
+	drm_WARN_ON(&dev_priv->drm, port > PORT_I);
 	intel_dig_port->ddi_io_power_domain = POWER_DOMAIN_PORT_DDI_A_IO +
 					      port - PORT_A;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
