Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23228F094
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 13:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9C56EC6C;
	Thu, 15 Oct 2020 11:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9781E6EC67;
 Thu, 15 Oct 2020 11:00:29 +0000 (UTC)
IronPort-SDR: J9VonFEjt3WuAYT58QXCRPr9c41U0UdRH4zFPSr41KcrYgW1yGcaVOS2nYFGrBoxrZTQ2FVRJn
 iSmQulYOTgwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="163686115"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="163686115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 04:00:29 -0700
IronPort-SDR: GR8ZwjWSnfxWUGbIGV7xwHREl3Q2D4G5lZOn1TUXQ0Bc/sGLr2T/AxGZ2xBEVRJIdw8knIWyYL
 aioRAdNNcM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="356949765"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2020 04:00:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 13/13] drm/i915: Configure PCON for DSC1.1 to DSC1.2 encoding
Date: Thu, 15 Oct 2020 16:22:59 +0530
Message-Id: <20201015105259.27934-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a source supporting DSC1.1 is connected to DSC1.2 HDMI2.1 sink
via DP HDMI2.1 PCON, the PCON can be configured to decode the
DSC1.1 compressed stream and encode to DSC1.2. It then sends the
DSC1.2 compressed stream to the HDMI2.1 sink.

This patch configures the PCON for DSC1.1 to DSC1.2 encoding, based
on the PCON's DSC encoder capablities and HDMI2.1 sink's DSC decoder
capabilities.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 120 ++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h  |   2 +
 3 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 1834e5de60a7..f8fc2de7ad95 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3485,7 +3485,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 		intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 
 	intel_dp_check_frl_training(intel_dp);
-
+	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
 	/*
 	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b4f8abaea607..2c7f6d04085e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -782,6 +782,16 @@ intel_dp_mode_valid(struct drm_connector *connector,
 							     target_clock,
 							     mode->hdisplay);
 		}
+
+		/*
+		 * TODO: If its a PCON with HDMI sink:
+		 * Assumption : Source only supports DSC1.1
+		 *
+		 * If HDMI supports DSC 1.2 but PCON does not support
+		 * DSC1.1->DSC1.2 encoding Then return MODE_CLOCK_HIGH.
+		 * Otherwise check if the mode can be applied according to
+		 * DSC capablities of the PCON and HDMI Sink combine.
+		 */
 	}
 
 	if ((mode_rate > max_rate && !(dsc_max_output_bpp && dsc_slice_count)) ||
@@ -4116,9 +4126,21 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct drm_connector *connector = &intel_connector->base;
+	int max_frl_rate;
+	int max_lanes, rate_per_lane;
+	int max_dsc_lanes, dsc_rate_per_lane;
+
+	max_lanes = connector->display_info.hdmi.max_lanes;
+	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
+	max_frl_rate = max_lanes * rate_per_lane;
+
+	if (connector->display_info.hdmi.dsc_1p2) {
+		max_dsc_lanes = connector->display_info.hdmi.dsc_max_lanes;
+		dsc_rate_per_lane = connector->display_info.hdmi.dsc_max_frl_rate_per_lane;
+		max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
+	}
 
-	return (connector->display_info.hdmi.max_frl_rate_per_lane *
-		connector->display_info.hdmi.max_lanes);
+	return max_frl_rate;
 }
 
 static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
@@ -4252,6 +4274,98 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 		drm_dbg(&dev_priv->drm, "FRL training Completed\n");
 }
 
+static int
+intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state *crtc_state)
+{
+
+	int vactive = crtc_state->hw.adjusted_mode.vdisplay;
+
+	return intel_hdmi_dsc_get_slice_height(vactive);
+}
+
+static int
+intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
+			     const struct intel_crtc_state *crtc_state)
+{
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_connector *connector = &intel_connector->base;
+	int hdmi_throughput = connector->display_info.hdmi.dsc_clk_per_slice;
+	int hdmi_max_slices = connector->display_info.hdmi.dsc_max_slices;
+	int pcon_max_slices = intel_dp->pcon_dsc.max_slices;
+	int pcon_max_slice_width = intel_dp->pcon_dsc.max_slice_width;
+
+
+	return intel_hdmi_dsc_get_num_slices(crtc_state, pcon_max_slices,
+					     pcon_max_slice_width,
+					     hdmi_max_slices, hdmi_throughput);
+}
+
+static int
+intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state,
+			  int num_slices, int slice_width)
+{
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_connector *connector = &intel_connector->base;
+	int output_format = crtc_state->output_format;
+	bool hdmi_all_bpp = connector->display_info.hdmi.dsc_all_bpp;
+	int pcon_fractional_bpp = intel_dp->pcon_dsc.bpp_precision_incr;
+	int hdmi_max_chunk_bytes =
+		connector->display_info.hdmi.dsc_total_chunk_kbytes * 1024;
+
+	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
+				      num_slices, output_format, hdmi_all_bpp,
+				      hdmi_max_chunk_bytes);
+}
+
+void
+intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
+			    const struct intel_crtc_state *crtc_state)
+{
+	u8 pps_param[6];
+	int slice_height;
+	int slice_width;
+	int num_slices;
+	int bits_per_pixel;
+	int ret;
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_connector *connector = &intel_connector->base;
+	bool hdmi_is_dsc_1_2 = connector->display_info.hdmi.dsc_1p2;
+
+	/* If DSC Not required, return */
+
+	if (!hdmi_is_dsc_1_2)
+		return;
+
+	slice_height = intel_dp_pcon_dsc_enc_slice_height(crtc_state);
+	if (!slice_height)
+		return;
+
+	num_slices = intel_dp_pcon_dsc_enc_slices(intel_dp, crtc_state);
+	if (!num_slices)
+		return;
+
+	slice_width = DIV_ROUND_UP(crtc_state->hw.adjusted_mode.hdisplay,
+				   num_slices);
+
+	bits_per_pixel = intel_dp_pcon_dsc_enc_bpp(intel_dp, crtc_state,
+						  num_slices, slice_width);
+	if (!bits_per_pixel)
+		return;
+
+	pps_param[0] = slice_height >> 8;
+	pps_param[1] = slice_height & 0xFF;
+	pps_param[2] = slice_width >> 8;
+	pps_param[3] = slice_width & 0xFF;
+	pps_param[4] = bits_per_pixel >> 8;
+	pps_param[5] = bits_per_pixel & 0xFF;
+
+	ret = drm_dp_pcon_pps_override_param(&intel_dp->aux, pps_param);
+	if (ret < 0)
+		drm_dbg_kms(&i915->drm, "Failed to set pcon DSC\n");
+}
+
 static void
 g4x_set_link_train(struct intel_dp *intel_dp,
 		   const struct intel_crtc_state *crtc_state,
@@ -4383,6 +4497,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 	intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 	intel_dp_configure_protocol_converter(intel_dp);
 	intel_dp_check_frl_training(intel_dp);
+	intel_dp_pcon_dsc_configure(intel_dp, pipe_config);
 	intel_dp_start_link_train(intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
 
@@ -6328,6 +6443,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 			continue;
 
 		intel_dp_check_frl_training(intel_dp);
+		intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 		intel_dp_start_link_train(intel_dp, crtc_state);
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 81d83d88cd41..2f377334b17d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -144,5 +144,7 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state);
 
 void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_DP_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
