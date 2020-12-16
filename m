Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D852DBAC8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 06:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742246E095;
	Wed, 16 Dec 2020 05:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A90B6E045;
 Wed, 16 Dec 2020 05:38:11 +0000 (UTC)
IronPort-SDR: AhxJWhUMg0amj1TZv3MBiJJUYV9r5hCxsOLQujpLawfS28W0ARMcwBw4LV8uusk/P1dHfCaVB0
 hUgZ/D6hjDTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437356"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:38:11 -0800
IronPort-SDR: 31VhT/LAV2N8VPWfYeg58kE09uQAR2N2NYtHcezbQ4FJ1zx61J3YfOaGMEpAUTvvEckSP13SBU
 Wxy0etVBcxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647203"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:38:08 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 15/15] drm/i915/display: Let PCON convert from RGB to YUV
 if it can
Date: Wed, 16 Dec 2020 11:01:21 +0530
Message-Id: <20201216053121.18819-16-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If PCON has capability to convert RGB->YUV colorspace and also
to 444->420 downsampling then for any YUV420 only mode, we can
let the PCON do all the conversion.

v2: As suggested by Uma Shankar, considered case for colorspace
BT709 and BT2020, and default to BT609. Also appended dir
'display' in commit message.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  3 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 68 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  3 +-
 4 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index fbc07a93504b..17eaa56c5a99 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3644,6 +3644,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 
+	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
 	/*
 	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
@@ -3731,7 +3732,7 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_ddi_init_dp_buf_reg(encoder, crtc_state);
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
-	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state,
 					      true);
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4c01c7c23dfd..2009ae9e9678 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1460,6 +1460,7 @@ struct intel_dp {
 		int pcon_max_frl_bw;
 		u8 max_bpc;
 		bool ycbcr_444_to_420;
+		bool rgb_to_ycbcr;
 	} dfp;
 
 	/* Display stream compression testing */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index abc9b772d1c8..7781245c2afe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -651,6 +651,10 @@ intel_dp_output_format(struct drm_connector *connector,
 	    !drm_mode_is_420_only(info, mode))
 		return INTEL_OUTPUT_FORMAT_RGB;
 
+	if (intel_dp->dfp.rgb_to_ycbcr &&
+	    intel_dp->dfp.ycbcr_444_to_420)
+		return INTEL_OUTPUT_FORMAT_RGB;
+
 	if (intel_dp->dfp.ycbcr_444_to_420)
 		return INTEL_OUTPUT_FORMAT_YCBCR444;
 	else
@@ -4311,7 +4315,8 @@ static void intel_dp_enable_port(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 
-void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp)
+void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 tmp;
@@ -4338,14 +4343,34 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp)
 		drm_dbg_kms(&i915->drm,
 			    "Failed to set protocol converter YCbCr 4:2:0 conversion mode to %s\n",
 			    enableddisabled(intel_dp->dfp.ycbcr_444_to_420));
-
-	tmp = 0;
-
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_PROTOCOL_CONVERTER_CONTROL_2, tmp) <= 0)
+	if (intel_dp->dfp.rgb_to_ycbcr) {
+		bool bt2020, bt709;
+
+		bt2020 = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
+							intel_dp->downstream_ports,
+							DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
+		bt709 = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
+							intel_dp->downstream_ports,
+							DP_DS_HDMI_BT709_RGB_YCBCR_CONV);
+		switch (crtc_state->infoframes.vsc.colorimetry) {
+		case DP_COLORIMETRY_BT2020_RGB:
+		case DP_COLORIMETRY_BT2020_YCC:
+			tmp = bt2020 ? DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE : 0;
+			break;
+		case DP_COLORIMETRY_BT709_YCC:
+		case DP_COLORIMETRY_XVYCC_709:
+			tmp = bt709 ? DP_CONVERSION_BT709_RGB_YCBCR_ENABLE : 0;
+			break;
+		default:
+			tmp = DP_CONVERSION_BT601_RGB_YCBCR_ENABLE;
+		}
+	} else {
+		tmp = 0;
+	}
+	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) <= 0)
 		drm_dbg_kms(&i915->drm,
-			    "Failed to set protocol converter YCbCr 4:2:2 conversion mode to %s\n",
-			    enableddisabled(false));
+			   "Failed to set protocol converter RGB->YCbCr conversion mode to %s\n",
+			   enableddisabled(tmp ? true : false));
 }
 
 static void intel_enable_dp(struct intel_atomic_state *state,
@@ -4385,7 +4410,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 	}
 
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
-	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_configure_protocol_converter(intel_dp, pipe_config);
 	intel_dp_check_frl_training(intel_dp);
 	intel_dp_pcon_dsc_configure(intel_dp, pipe_config);
 	intel_dp_start_link_train(intel_dp, pipe_config);
@@ -6853,7 +6878,7 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
-	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420;
+	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420, rgb_to_ycbcr;
 
 	/* No YCbCr output support on gmch platforms */
 	if (HAS_GMCH(i915))
@@ -6875,14 +6900,26 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 		dp_to_dig_port(intel_dp)->lspcon.active ||
 		drm_dp_downstream_444_to_420_conversion(intel_dp->dpcd,
 							intel_dp->downstream_ports);
+	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
+							intel_dp->downstream_ports,
+							DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
+							DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
+							DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
 
 	if (INTEL_GEN(i915) >= 11) {
+		/* Let PCON convert from RGB->YCbCr if possible */
+		if (is_branch && rgb_to_ycbcr && ycbcr_444_to_420) {
+			intel_dp->dfp.rgb_to_ycbcr = true;
+			intel_dp->dfp.ycbcr_444_to_420 = true;
+			connector->base.ycbcr_420_allowed = true;
+		} else {
 		/* Prefer 4:2:0 passthrough over 4:4:4->4:2:0 conversion */
-		intel_dp->dfp.ycbcr_444_to_420 =
-			ycbcr_444_to_420 && !ycbcr_420_passthrough;
+			intel_dp->dfp.ycbcr_444_to_420 =
+				ycbcr_444_to_420 && !ycbcr_420_passthrough;
 
-		connector->base.ycbcr_420_allowed =
-			!is_branch || ycbcr_444_to_420 || ycbcr_420_passthrough;
+			connector->base.ycbcr_420_allowed =
+				!is_branch || ycbcr_444_to_420 || ycbcr_420_passthrough;
+		}
 	} else {
 		/* 4:4:4->4:2:0 conversion is the only way */
 		intel_dp->dfp.ycbcr_444_to_420 = ycbcr_444_to_420;
@@ -6891,8 +6928,9 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 	}
 
 	drm_dbg_kms(&i915->drm,
-		    "[CONNECTOR:%d:%s] YCbCr 4:2:0 allowed? %s, YCbCr 4:4:4->4:2:0 conversion? %s\n",
+		    "[CONNECTOR:%d:%s] RGB->YcbCr conversion? %s, YCbCr 4:2:0 allowed? %s, YCbCr 4:4:4->4:2:0 conversion? %s\n",
 		    connector->base.base.id, connector->base.name,
+		    yesno(intel_dp->dfp.rgb_to_ycbcr),
 		    yesno(connector->base.ycbcr_420_allowed),
 		    yesno(intel_dp->dfp.ycbcr_444_to_420));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1bfde4f89019..4280a09fd8fd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -51,7 +51,8 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 int intel_dp_retrain_link(struct intel_encoder *encoder,
 			  struct drm_modeset_acquire_ctx *ctx);
 void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode);
-void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp);
+void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state);
 void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
 					   const struct intel_crtc_state *crtc_state,
 					   bool enable);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
