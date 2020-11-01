Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07342A1D2D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 11:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5CA6EA95;
	Sun,  1 Nov 2020 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEE36EA95;
 Sun,  1 Nov 2020 10:14:11 +0000 (UTC)
IronPort-SDR: k30YtS5wPdJPv/dqaoHMPwIYOOCBwLqT6cpyiMb63ifrx+YaUlwE2KWqhwZZGY9iFfwNbifZQm
 XyKYuKYr3nVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="167997875"
X-IronPort-AV: E=Sophos;i="5.77,441,1596524400"; d="scan'208";a="167997875"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 02:14:11 -0800
IronPort-SDR: T4RlCzCorp1iK2DwWaeMtq3uNoRCWmxpkclHOnnfL+zalqilbPrZ/NeaOGynoPlCOIH659DQfy
 mfroV7IWanFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,441,1596524400"; d="scan'208";a="425738694"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2020 02:14:09 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/13] drm/i915: Configure PCON for DSC1.1 to DSC1.2
 encoding
Date: Sun,  1 Nov 2020 15:36:57 +0530
Message-Id: <20201101100657.12087-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
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

v2: Rebase

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c  | 128 ++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h  |   2 +
 3 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 3e76fb1117df..dbf28d021d08 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3493,6 +3493,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
 
 	intel_dp_check_frl_training(intel_dp);
+	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 
 	/*
 	 * 7.i Follow DisplayPort specification training sequence (see notes for
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2e7ddb062efe..bc1f1afc35ad 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -788,6 +788,16 @@ intel_dp_mode_valid(struct drm_connector *connector,
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
@@ -3936,9 +3946,21 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
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
+	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
+		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
+		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
+		max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
+	}
 
-	return (connector->display_info.hdmi.max_frl_rate_per_lane *
-		connector->display_info.hdmi.max_lanes);
+	return max_frl_rate;
 }
 
 static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
@@ -4071,6 +4093,106 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	}
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
+	int hdmi_throughput = connector->display_info.hdmi.dsc_cap.clk_per_slice;
+	int hdmi_max_slices = connector->display_info.hdmi.dsc_cap.max_slices;
+	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
+	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
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
+	bool hdmi_all_bpp = connector->display_info.hdmi.dsc_cap.all_bpp;
+	int pcon_fractional_bpp = drm_dp_pcon_dsc_bpp_incr(intel_dp->pcon_dsc_dpcd);
+	int hdmi_max_chunk_bytes =
+		connector->display_info.hdmi.dsc_cap.total_chunk_kbytes * 1024;
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
+	u8 buf;
+	int version_major, version_minor;
+	int slice_height;
+	int slice_width;
+	int num_slices;
+	int bits_per_pixel;
+	int ret;
+	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_connector *connector = &intel_connector->base;
+	bool hdmi_is_dsc_1_2 = connector->display_info.hdmi.dsc_cap.v_1p2;
+
+
+	buf = intel_dp->pcon_dsc_dpcd[DP_PCON_DSC_VERSION - DP_PCON_DSC_ENCODER];
+	version_major = (buf & DP_PCON_DSC_MAJOR_MASK) >> DP_PCON_DSC_MAJOR_SHIFT;
+	version_minor = (buf & DP_PCON_DSC_MINOR_MASK) >> DP_PCON_DSC_MINOR_SHIFT;
+
+
+	/* Only if PCON encoder and HDMI decoder both support DSC 1.2 */
+	if ((version_major != 1 || version_minor != 2) ||
+	    (!hdmi_is_dsc_1_2))
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
@@ -4202,6 +4324,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 	intel_dp_configure_protocol_converter(intel_dp);
 	intel_dp_check_frl_training(intel_dp);
+	intel_dp_pcon_dsc_configure(intel_dp, pipe_config);
 	intel_dp_start_link_train(intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
 
@@ -6149,6 +6272,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 			continue;
 
 		intel_dp_check_frl_training(intel_dp);
+		intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 		intel_dp_start_link_train(intel_dp, crtc_state);
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index a667d3f578d6..3515e057447e 100644
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
