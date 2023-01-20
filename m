Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A5674AFD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3E10EA2C;
	Fri, 20 Jan 2023 04:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D28810EA23;
 Fri, 20 Jan 2023 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189732; x=1705725732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Csd7jO2LiiP7oIi4BMM0GJxk9oZSbuYEpUm15TZJbu4=;
 b=A+Q3VPYtiC42UychtzD3mi6zR64ZIhzKUpJ28O3+Xb1suGQKmCfXeekX
 ZQrEatp6jjowyUyDq/4Y5vUedbuPEZ0Q77hUFuJYCxwopB5OW/jG5e+Md
 7AtteXcNUmUbKNnepU94wnZ/YVExHfdHock8Rt9BFomi8KJ48oC01Yl1P
 rvZQlFQIE7JsTgroTf8gXsoB48lekuNOEbfFgQbGNDMVFleGcgxPpJuVQ
 wGqXjgwboS2KL1fZ3d5d/5B34cQkzPFX4VJN9V6wkyp12K9DFDmGyoXnE
 iEeZUeZ88C5YgT16lI5Kp4chYfXETNnS1ntHqhDrNyg9ADQU+4xM+//mj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195541"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734954"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734954"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:09 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/16] drm/i915/dp: Get optimal link config to have best
 compressed bpp
Date: Fri, 20 Jan 2023 10:08:35 +0530
Message-Id: <20230120043844.3761895-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we take the max lane, rate and pipe bpp, to get the maximum
compressed bpp possible. We then set the output bpp to this value.
This patch provides support to have max bpp, min rate and min lanes,
that can support the min compressed bpp.

v2:
-Avoid ending up with compressed bpp, same as pipe bpp. (Stan)
-Fix the checks for limits->max/min_bpp while iterating over list of
 valid DSC bpcs. (Stan)

v3:
-Refactor the code to have pipe bpp/compressed bpp computation and slice
count calculation separately for different cases.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 278 ++++++++++++++++++++----
 1 file changed, 232 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c0b96cfb7528..885d2f75ddbf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1476,6 +1476,195 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	return drm_dsc_compute_rc_parameters(vdsc_cfg);
 }
 
+static bool is_dsc_bw_sufficient(int link_rate, int lane_count, int compressed_bpp,
+				 const struct drm_display_mode *adjusted_mode)
+{
+	int mode_rate = intel_dp_link_required(adjusted_mode->crtc_clock, compressed_bpp);
+	int link_avail = intel_dp_max_data_rate(link_rate, lane_count);
+
+	return mode_rate <= link_avail;
+}
+
+static int dsc_compute_link_config(struct intel_dp *intel_dp,
+				   struct intel_crtc_state *pipe_config,
+				   struct link_config_limits *limits,
+				   int pipe_bpp,
+				   u16 compressed_bpp)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&pipe_config->hw.adjusted_mode;
+	int link_rate, lane_count;
+	int dsc_max_bpp;
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	int i;
+
+	for (i = 0; i < intel_dp->num_common_rates; i++) {
+		link_rate = intel_dp_common_rate(intel_dp, i);
+		if (link_rate < limits->min_rate || link_rate > limits->max_rate)
+			continue;
+
+		for (lane_count = limits->min_lane_count;
+		     lane_count <= limits->max_lane_count;
+		     lane_count <<= 1) {
+			dsc_max_bpp = intel_dp_dsc_get_output_bpp_max(dev_priv,
+								      link_rate,
+								      lane_count,
+								      adjusted_mode->crtc_clock,
+								      adjusted_mode->crtc_hdisplay,
+								      pipe_config->bigjoiner_pipes,
+								      pipe_bpp, 64);
+			if (compressed_bpp > dsc_max_bpp)
+				continue;
+
+			if (!is_dsc_bw_sufficient(link_rate, lane_count,
+						  compressed_bpp, adjusted_mode))
+				continue;
+
+			pipe_config->lane_count = lane_count;
+			pipe_config->port_clock = link_rate;
+
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static u16 dsc_max_sink_compressed_bppx16(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					  struct intel_crtc_state *pipe_config,
+					  int bpc)
+{
+	u16 max_bppx16 = dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_LOW - DP_DSC_SUPPORT] |
+			 (dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] &
+			  DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK << DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT);
+
+	if (max_bppx16)
+		return max_bppx16;
+	/*
+	 * If support not given in DPCD 67h, 68h use the Maximum Allowed bit rate
+	 * values as given in spec Table 2-157 DP v2.0
+	 */
+	switch (pipe_config->output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return (3 * bpc) << 4;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return (3 * (bpc / 2)) << 4;
+	default:
+		MISSING_CASE(pipe_config->output_format);
+		break;
+	}
+
+	return 0;
+}
+
+static u16 dsc_min_compressed_bppx16(struct intel_crtc_state *pipe_config)
+{
+	switch (pipe_config->output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return 8 << 4;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return 6 << 4;
+	default:
+		MISSING_CASE(pipe_config->output_format);
+		break;
+	}
+
+	return 0;
+}
+
+static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
+				      struct intel_crtc_state *pipe_config,
+				      struct link_config_limits *limits,
+				      int pipe_bpp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	u16 compressed_bpp;
+	int dsc_min_bpp, dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
+	int ret;
+
+	dsc_min_bpp = max(dsc_min_compressed_bppx16(pipe_config) >> 4, 8);
+	if (DISPLAY_VER(dev_priv) <= 12)
+		dsc_src_max_bpp = 23;
+	else
+		dsc_src_max_bpp = 27;
+	dsc_sink_max_bpp = dsc_max_sink_compressed_bppx16(intel_dp->dsc_dpcd,
+							  pipe_config, pipe_bpp / 3) >> 4;
+
+	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
+
+	/* Compressed BPP should be less than the Input DSC bpp */
+	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
+
+	for (compressed_bpp = dsc_max_bpp;
+	     compressed_bpp >= dsc_min_bpp;
+	     compressed_bpp--) {
+		ret = dsc_compute_link_config(intel_dp,
+					      pipe_config,
+					      limits,
+					      pipe_bpp,
+					      compressed_bpp);
+		if (ret == 0) {
+			pipe_config->dsc.compressed_bpp = compressed_bpp;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
+					 struct intel_crtc_state *pipe_config,
+					 struct drm_connector_state *conn_state,
+					 struct link_config_limits *limits)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u8 dsc_bpc[3] = {0};
+	u8 dsc_max_bpc, dsc_max_bpp;
+	u8 dsc_min_bpc, dsc_min_bpp;
+	u8 max_req_bpc = conn_state->max_requested_bpc;
+	int i, bpp, ret;
+	int num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
+							   dsc_bpc);
+
+	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+	if (DISPLAY_VER(i915) >= 12)
+		dsc_max_bpc = min_t(u8, 12, max_req_bpc);
+	else
+		dsc_max_bpc = min_t(u8, 10, max_req_bpc);
+
+	dsc_max_bpp = min(dsc_max_bpc * 3, limits->max_bpp);
+
+	/* Min DSC Input BPC for ICL+ is 8 */
+	dsc_min_bpc = 8;
+	dsc_min_bpp = max(dsc_min_bpc * 3, limits->min_bpp);
+
+	/*
+	 * Get the maximum DSC bpc that will be supported by any valid
+	 * link configuration and compressed bpp.
+	 */
+	for (i = 0; i < num_bpc; i++) {
+		bpp = dsc_bpc[i] * 3;
+
+		if (bpp < dsc_min_bpp)
+			break;
+
+		if (bpp > dsc_max_bpp)
+			continue;
+
+		ret = dsc_compute_compressed_bpp(intel_dp, pipe_config,
+						 limits, bpp);
+		if (ret == 0) {
+			pipe_config->pipe_bpp = bpp;
+
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static
 bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
 {
@@ -1502,6 +1691,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
 		return -EINVAL;
 
+	/* Compute DSC input BPP and output/compressed BPP */
 	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
 		int forced_bpc = intel_dp->force_dsc_bpc;
 		int forced_bpp = forced_bpc * 3;
@@ -1515,53 +1705,61 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				    intel_dp->force_dsc_bpc);
 			return -EINVAL;
 		}
+		if (dsc_compute_compressed_bpp(intel_dp, pipe_config,
+					       limits, forced_bpp)) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "Compressed BPP not supported with forced bpc = %d\n",
+				    intel_dp->force_dsc_bpc);
+			return -EINVAL;
+		}
+
 		pipe_config->pipe_bpp = forced_bpp;
 		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_config->pipe_bpp);
 	} else if (compute_pipe_bpp) {
+		/*
+		 * compute pipe bpp is set to false for DP MST DSC case
+		 * and compressed_bpp is calculated same time once
+		 * vpci timeslots are allocated, because overall bpp
+		 * calculation procedure is bit different for MST case.
+		 */
 		int pipe_bpp = intel_dp_dsc_get_bpp_max(intel_dp, conn_state->max_requested_bpc);
 
-		if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
-			drm_dbg_kms(&dev_priv->drm,
-				    "No DSC support for less than 8bpc\n");
-			return -EINVAL;
+		if (intel_dp_is_edp(intel_dp)) {
+			/* For eDP use max bpp that can be supported with DSC. */
+			pipe_bpp = intel_dp_dsc_get_bpp_max(intel_dp,
+							    conn_state->max_requested_bpc);
+			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
+				drm_dbg_kms(&dev_priv->drm,
+					    "No DSC support for less than 8bpc\n");
+				return -EINVAL;
+			}
+			pipe_config->pipe_bpp = pipe_bpp;
+			pipe_config->port_clock = limits->max_rate;
+			pipe_config->lane_count = limits->max_lane_count;
+			pipe_config->dsc.compressed_bpp =
+				min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
+				      pipe_config->pipe_bpp);
+		} else {
+			/*
+			 * For DP compute the optimal pipe bpp, link rate and
+			 * num lanes with DSC.
+			 */
+			ret = intel_dp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
+							    conn_state, limits);
+			if (ret) {
+				drm_dbg_kms(&dev_priv->drm,
+					    "No Valid pipe bpp for given mode\n");
+				return ret;
+			}
 		}
-		pipe_config->pipe_bpp = pipe_bpp;
 	}
-	/*
-	 * For now enable DSC for max link rate, max lane count.
-	 * Optimize this later for the minimum possible link rate/lane count
-	 * with DSC enabled for the requested mode.
-	 */
-	pipe_config->port_clock = limits->max_rate;
-	pipe_config->lane_count = limits->max_lane_count;
-
+	/* Calculate Slice count */
 	if (intel_dp_is_edp(intel_dp)) {
-		pipe_config->dsc.compressed_bpp =
-			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-			      pipe_config->pipe_bpp);
 		pipe_config->dsc.slice_count =
 			drm_dp_dsc_sink_max_slice_count(intel_dp->dsc_dpcd,
 							true);
 	} else {
-		u16 dsc_max_output_bpp = 0;
 		u8 dsc_dp_slice_count;
-
-		if (compute_pipe_bpp) {
-			dsc_max_output_bpp =
-				intel_dp_dsc_get_output_bpp_max(dev_priv,
-								pipe_config->port_clock,
-								pipe_config->lane_count,
-								adjusted_mode->crtc_clock,
-								adjusted_mode->crtc_hdisplay,
-								pipe_config->bigjoiner_pipes,
-								pipe_config->pipe_bpp,
-								timeslots);
-			if (!dsc_max_output_bpp) {
-				drm_dbg_kms(&dev_priv->drm,
-					    "Compressed BPP not supported\n");
-				return -EINVAL;
-			}
-		}
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
@@ -1572,18 +1770,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				    "Compressed Slice Count not supported\n");
 			return -EINVAL;
 		}
-
-		/*
-		 * compute pipe bpp is set to false for DP MST DSC case
-		 * and compressed_bpp is calculated same time once
-		 * vpci timeslots are allocated, because overall bpp
-		 * calculation procedure is bit different for MST case.
-		 */
-		if (compute_pipe_bpp) {
-			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_output_bpp,
-								pipe_config->pipe_bpp);
-		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
 	}
 	/*
-- 
2.25.1

