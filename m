Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F670F8B2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD72610E68C;
	Wed, 24 May 2023 14:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4434510E68B;
 Wed, 24 May 2023 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938425; x=1716474425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJrIlCYx/fJsXPekkst5mSA3TRhkiREEzLqYXho2FG8=;
 b=jYSQ1lCrJX5LWFGxEIqZkMahXtYzMfCCm4bpFjOSwIf/50q7U2bAZ2VV
 1MHA4wlD8RbxMFdsrwvUiktTJijUq9c+Ebgf9uwbjFo4NRE83d7RAc6tX
 Ka6Y7uzR3D0gMBTs4bA+33EMtxHyX0DdhEa44x1gFiA7cccwz6qzb3IaW
 zWlAVWN6HyiYIbuVpIst/9BAMyaTa+9FQCjkeyirdxktGHyGJDh73dtyQ
 l5aijkPsubXXiwTpcwLkMQb54eaANmKCCStOChTOJWwPCwQkeExHzJpik
 2Fgvb1EW8+u7Ye/YbLFWJhZewNFiZHwf2q8RItcLEl3r1NPvsHe/1TVMC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806499"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806499"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556070"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556070"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:27:00 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] drm/i915/dp: Get optimal link config to have best
 compressed bpp
Date: Wed, 24 May 2023 19:52:09 +0530
Message-Id: <20230524142210.3779331-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
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

v4:
-Separate the pipe_bpp calculation for eDP and DP.

v5:
-Get rid of magic numbers for max and min bpp,
and improve documentation. (Stan).
-Use functions for {src_sink}_{min_max}_compressed_bpp (Ville).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 331 +++++++++++++++++++-----
 1 file changed, 271 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4b3328cfc1f9..32863bf7c016 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1643,6 +1643,235 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
 	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
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
+				   u16 compressed_bpp,
+				   int timeslots)
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
+			dsc_max_bpp = intel_dp_dsc_get_max_compressed_bpp(dev_priv,
+									  link_rate,
+									  lane_count,
+									  adjusted_mode->crtc_clock,
+									  adjusted_mode->crtc_hdisplay,
+									  pipe_config->bigjoiner_pipes,
+									  pipe_config->output_format,
+									  pipe_bpp, timeslots);
+			/*
+			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
+			 * supported PPS value can be 63.9375 and with the further
+			 * mention that bpp should be programmed double the target bpp
+			 * restricting our target bpp to be 31.9375 at max
+			 */
+			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+				dsc_max_bpp = min_t(u16, dsc_max_bpp, 31);
+
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
+static
+u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
+					    struct intel_crtc_state *pipe_config,
+					    int bpc)
+{
+	u16 max_bppx16 = drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd);
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
+static int dsc_sink_min_compressed_bpp(struct intel_crtc_state *pipe_config)
+{
+	/* From Mandatory bit rate range Support Table 2-157 (DP v2.0) */
+	switch (pipe_config->output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return 8;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		return 6;
+	default:
+		MISSING_CASE(pipe_config->output_format);
+		break;
+	}
+
+	return 0;
+}
+
+static int dsc_sink_max_compressed_bpp(struct intel_dp *intel_dp,
+				       struct intel_crtc_state *pipe_config,
+				       int bpc)
+{
+	return intel_dp_dsc_max_sink_compressed_bppx16(intel_dp,
+						       pipe_config, bpc) >> 4;
+}
+
+static int dsc_src_min_compressed_bpp(void)
+{
+	/* Min Compressed bpp supported by source is 8 */
+	return 8;
+}
+
+static int dsc_src_max_compressed_bpp(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	/*
+	 * Max Compressed bpp for Gen 13+ is 27bpp.
+	 * For earlier platform is 23bpp. (Bspec:49259).
+	 */
+	if (DISPLAY_VER(i915) <= 12)
+		return 23;
+	else
+		return 27;
+}
+
+static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
+				      struct intel_crtc_state *pipe_config,
+				      struct link_config_limits *limits,
+				      int pipe_bpp,
+				      int timeslots)
+{
+	u16 compressed_bpp;
+	int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
+	int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
+	int ret;
+
+	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
+	dsc_sink_min_bpp = dsc_sink_min_compressed_bpp(pipe_config);
+	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
+
+	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
+	dsc_sink_max_bpp = dsc_sink_max_compressed_bpp(intel_dp, pipe_config, pipe_bpp / 3);
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
+					      compressed_bpp,
+					      timeslots);
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
+					 struct link_config_limits *limits,
+					 int timeslots)
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
+						 limits, bpp, timeslots);
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
 bool is_dsc_pipe_bpp_sufficient(int pipe_bpp)
 {
@@ -1650,6 +1879,31 @@ bool is_dsc_pipe_bpp_sufficient(int pipe_bpp)
 	return (pipe_bpp < 8 * 3);
 }
 
+static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
+					  struct intel_crtc_state *pipe_config,
+					  struct drm_connector_state *conn_state,
+					  struct link_config_limits *limits)
+{
+	/* For eDP use max bpp that can be supported with DSC. */
+	int pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
+						    conn_state->max_requested_bpc);
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	if (!is_dsc_pipe_bpp_sufficient(pipe_bpp)) {
+		drm_dbg_kms(&i915->drm,
+			    "No DSC support for less than 8bpc\n");
+		return -EINVAL;
+	}
+	pipe_config->pipe_bpp = pipe_bpp;
+	pipe_config->port_clock = limits->max_rate;
+	pipe_config->lane_count = limits->max_lane_count;
+	pipe_config->dsc.compressed_bpp =
+		min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
+		      pipe_config->pipe_bpp);
+
+	return 0;
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1672,6 +1926,12 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
+	/*
+	 * compute pipe bpp is set to false for DP MST DSC case
+	 * and compressed_bpp is calculated same time once
+	 * vpci timeslots are allocated, because overall bpp
+	 * calculation procedure is bit different for MST case.
+	 */
 	if (compute_pipe_bpp) {
 		int pipe_bpp;
 		int forced_bpp = intel_dp->force_dsc_bpc * 3;
@@ -1684,31 +1944,25 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				 forced_bpp && !is_dsc_pipe_bpp_sufficient(forced_bpp),
 				 "Cannot force dsc bpc:%d, due to dsc bpc limits\n",
 				 intel_dp->force_dsc_bpc);
-
-			pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
-								conn_state->max_requested_bpc);
-
-			if (!is_dsc_pipe_bpp_sufficient(pipe_bpp)) {
-				drm_dbg_kms(&dev_priv->drm, "No DSC support for less than 8bpc\n");
-				return -EINVAL;
+			if (intel_dp_is_edp(intel_dp))
+				ret = intel_edp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
+								     conn_state, limits);
+			else
+				ret = intel_dp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
+								    conn_state, limits, timeslots);
+			if (ret) {
+				drm_dbg_kms(&dev_priv->drm,
+					    "No Valid pipe bpp for given mode ret = %d\n", ret);
+				return ret;
 			}
 		}
-
-		pipe_config->pipe_bpp = pipe_bpp;
 	}
 
-	/*
-	 * For now enable DSC for max link rate, max lane count.
-	 * Optimize this later for the minimum possible link rate/lane count
-	 * with DSC enabled for the requested mode.
-	 */
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
 
+	/* Calculate Slice count */
 	if (intel_dp_is_edp(intel_dp)) {
-		pipe_config->dsc.compressed_bpp =
-			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-			      pipe_config->pipe_bpp);
 		pipe_config->dsc.slice_count =
 			drm_dp_dsc_sink_max_slice_count(intel_dp->dsc_dpcd,
 							true);
@@ -1718,37 +1972,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 			return -EINVAL;
 		}
 	} else {
-		u16 dsc_max_compressed_bpp = 0;
 		u8 dsc_dp_slice_count;
 
-		if (compute_pipe_bpp) {
-			dsc_max_compressed_bpp =
-				intel_dp_dsc_get_max_compressed_bpp(dev_priv,
-								    pipe_config->port_clock,
-								    pipe_config->lane_count,
-								    adjusted_mode->crtc_clock,
-								    adjusted_mode->crtc_hdisplay,
-								    pipe_config->bigjoiner_pipes,
-								    pipe_config->output_format,
-								    pipe_config->pipe_bpp,
-								    timeslots);
-			/*
-			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
-			 * supported PPS value can be 63.9375 and with the further
-			 * mention that bpp should be programmed double the target bpp
-			 * restricting our target bpp to be 31.9375 at max
-			 */
-			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
-				dsc_max_compressed_bpp = min_t(u16,
-							       dsc_max_compressed_bpp,
-							       31);
-
-			if (!dsc_max_compressed_bpp) {
-				drm_dbg_kms(&dev_priv->drm,
-					    "Compressed BPP not supported\n");
-				return -EINVAL;
-			}
-		}
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
@@ -1760,20 +1985,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 			return -EINVAL;
 		}
 
-		/*
-		 * compute pipe bpp is set to false for DP MST DSC case
-		 * and compressed_bpp is calculated same time once
-		 * vpci timeslots are allocated, because overall bpp
-		 * calculation procedure is bit different for MST case.
-		 */
-		if (compute_pipe_bpp) {
-			u16 output_bpp = intel_dp_output_bpp(pipe_config->output_format,
-							     pipe_config->pipe_bpp);
-
-			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_compressed_bpp,
-								output_bpp);
-		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
 	}
 	/*
-- 
2.25.1

