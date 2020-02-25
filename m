Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0116C30D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15196EAD0;
	Tue, 25 Feb 2020 13:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBC6EAC7;
 Tue, 25 Feb 2020 13:58:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153119"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:29 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [Intel-gfx][PATCH 07/10] drm/i915/display: Make MISSING_CASE
 backtrace i915 specific
Date: Tue, 25 Feb 2020 19:17:06 +0530
Message-Id: <20200225134709.6153-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_MISSING_CASE macro includes the device information in the
backtrace, so we know what device the warnings originate from.

Covert MISSING_CASE calls with i915 specific i915_MISSING_CASE variant
in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c         |  8 +++++---
 drivers/gpu/drm/i915/display/intel_bios.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_bw.c        |  6 +++---
 drivers/gpu/drm/i915/display/intel_combo_phy.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c  | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_hotplug.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_tc.c        |  2 +-
 8 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index d842e280699d..66af45885a83 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -708,7 +708,8 @@ gen11_dsi_configure_transcoder(struct intel_encoder *encoder,
 		} else {
 			switch (intel_dsi->pixel_format) {
 			default:
-				MISSING_CASE(intel_dsi->pixel_format);
+				i915_MISSING_CASE(dev_priv,
+						  intel_dsi->pixel_format);
 				/* fallthrough */
 			case MIPI_DSI_FMT_RGB565:
 				tmp |= PIX_FMT_RGB565;
@@ -735,7 +736,8 @@ gen11_dsi_configure_transcoder(struct intel_encoder *encoder,
 			tmp &= ~OP_MODE_MASK;
 			switch (intel_dsi->video_mode_format) {
 			default:
-				MISSING_CASE(intel_dsi->video_mode_format);
+				i915_MISSING_CASE(dev_priv,
+						  intel_dsi->video_mode_format);
 				/* fallthrough */
 			case VIDEO_MODE_NON_BURST_WITH_SYNC_EVENTS:
 				tmp |= VIDEO_MODE_SYNC_EVENT;
@@ -776,7 +778,7 @@ gen11_dsi_configure_transcoder(struct intel_encoder *encoder,
 		tmp &= ~TRANS_DDI_EDP_INPUT_MASK;
 		switch (pipe) {
 		default:
-			MISSING_CASE(pipe);
+			i915_MISSING_CASE(dev_priv, pipe);
 			/* fallthrough */
 		case PIPE_A:
 			tmp |= TRANS_DDI_EDP_INPUT_A_ON;
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 2049cf5b54f3..3737b0d1741d 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1742,7 +1742,7 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 
 		switch (child->hdmi_max_data_rate) {
 		default:
-			MISSING_CASE(child->hdmi_max_data_rate);
+			i915_MISSING_CASE(dev_priv, child->hdmi_max_data_rate);
 			/* fall through */
 		case HDMI_MAX_DATA_RATE_PLATFORM:
 			max_tmds_clock = 0;
@@ -2619,7 +2619,7 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *dev_priv,
 		aux_ch = AUX_CH_G;
 		break;
 	default:
-		MISSING_CASE(info->alternate_aux_channel);
+		i915_MISSING_CASE(dev_priv, info->alternate_aux_channel);
 		aux_ch = AUX_CH_A;
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 58b264bc318d..5bd120919175 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -50,7 +50,7 @@ static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv,
 			qi->dram_type = INTEL_DRAM_LPDDR3;
 			break;
 		default:
-			MISSING_CASE(val & 0xf);
+			i915_MISSING_CASE(dev_priv, val & 0xf);
 			break;
 		}
 	} else if (IS_GEN(dev_priv, 11)) {
@@ -68,11 +68,11 @@ static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv,
 			qi->dram_type = INTEL_DRAM_LPDDR4;
 			break;
 		default:
-			MISSING_CASE(val & 0xf);
+			i915_MISSING_CASE(dev_priv, val & 0xf);
 			break;
 		}
 	} else {
-		MISSING_CASE(INTEL_GEN(dev_priv));
+		i915_MISSING_CASE(dev_priv, INTEL_GEN(dev_priv));
 		qi->dram_type = INTEL_DRAM_LPDDR3; /* Conservative default */
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 9ff05ec12115..590fb3637381 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -51,7 +51,7 @@ cnl_get_procmon_ref_values(struct drm_i915_private *dev_priv, enum phy phy)
 	val = intel_de_read(dev_priv, ICL_PORT_COMP_DW3(phy));
 	switch (val & (PROCESS_INFO_MASK | VOLTAGE_INFO_MASK)) {
 	default:
-		MISSING_CASE(val);
+		i915_MISSING_CASE(dev_priv, val);
 		/* fall through */
 	case VOLTAGE_INFO_0_85V | PROCESS_INFO_DOT_0:
 		procmon = &cnl_procmon_values[PROCMON_0_85V_DOT_0];
@@ -272,7 +272,7 @@ void intel_combo_phy_power_up_lanes(struct drm_i915_private *dev_priv,
 			lane_mask = PWR_DOWN_LN_3;
 			break;
 		default:
-			MISSING_CASE(lane_count);
+			i915_MISSING_CASE(dev_priv, lane_count);
 			/* fall-through */
 		case 4:
 			lane_mask = PWR_UP_ALL_LANES;
@@ -289,7 +289,7 @@ void intel_combo_phy_power_up_lanes(struct drm_i915_private *dev_priv,
 						    PWR_DOWN_LN_3_2;
 			break;
 		default:
-			MISSING_CASE(lane_count);
+			i915_MISSING_CASE(dev_priv, lane_count);
 			/* fall-through */
 		case 4:
 			lane_mask = PWR_UP_ALL_LANES;
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e5bfe5245276..72a54b90dba2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -2591,7 +2591,7 @@ static bool icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
 		}
 	}
 
-	MISSING_CASE(clock);
+	i915_MISSING_CASE(dev_priv, clock);
 	return false;
 }
 
@@ -2603,7 +2603,7 @@ static bool icl_calc_tbt_pll(struct intel_crtc_state *crtc_state,
 	if (INTEL_GEN(dev_priv) >= 12) {
 		switch (dev_priv->cdclk.hw.ref) {
 		default:
-			MISSING_CASE(dev_priv->cdclk.hw.ref);
+			i915_MISSING_CASE(dev_priv, dev_priv->cdclk.hw.ref);
 			/* fall-through */
 		case 19200:
 		case 38400:
@@ -2616,7 +2616,7 @@ static bool icl_calc_tbt_pll(struct intel_crtc_state *crtc_state,
 	} else {
 		switch (dev_priv->cdclk.hw.ref) {
 		default:
-			MISSING_CASE(dev_priv->cdclk.hw.ref);
+			i915_MISSING_CASE(dev_priv, dev_priv->cdclk.hw.ref);
 			/* fall-through */
 		case 19200:
 		case 38400:
@@ -2827,7 +2827,7 @@ static bool icl_calc_mg_pll_state(struct intel_crtc_state *crtc_state,
 		iref_pulse_w = 1;
 		break;
 	default:
-		MISSING_CASE(refclk_khz);
+		i915_MISSING_CASE(dev_priv, refclk_khz);
 		return false;
 	}
 
@@ -3123,7 +3123,7 @@ static bool icl_get_dplls(struct intel_atomic_state *state,
 	else if (intel_phy_is_tc(dev_priv, phy))
 		return icl_get_tc_phy_dplls(state, crtc, encoder);
 
-	MISSING_CASE(phy);
+	i915_MISSING_CASE(dev_priv, phy);
 
 	return false;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 8af0ae61e1bb..c0718b02cb1d 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -111,7 +111,7 @@ enum hpd_pin intel_hpd_pin_default(struct drm_i915_private *dev_priv,
 	case PORT_I:
 		return HPD_PORT_I;
 	default:
-		MISSING_CASE(port);
+		i915_MISSING_CASE(dev_priv, port);
 		return HPD_NONE;
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 7abeefe8dce5..2a05c70ad958 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1395,7 +1395,7 @@ static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		sprctl |= SPRITE_FORMAT_YUV422 | SPRITE_YUV_ORDER_VYUY;
 		break;
 	default:
-		MISSING_CASE(fb->format->format);
+		i915_MISSING_CASE(dev_priv, fb->format->format);
 		return 0;
 	}
 
@@ -1706,7 +1706,7 @@ static u32 g4x_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		dvscntr |= DVS_FORMAT_YUV422 | DVS_YUV_ORDER_VYUY;
 		break;
 	default:
-		MISSING_CASE(fb->format->format);
+		i915_MISSING_CASE(dev_priv, fb->format->format);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 9b850c11aa78..560b0c2fe62a 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -142,7 +142,7 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 		val |= DFLEXDPMLE1_DPMLETC_ML3_0(dig_port->tc_phy_fia_idx);
 		break;
 	default:
-		MISSING_CASE(required_lanes);
+		i915_MISSING_CASE(i915, required_lanes);
 	}
 
 	intel_uncore_write(uncore,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
