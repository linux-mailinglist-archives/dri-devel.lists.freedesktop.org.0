Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15F0777944
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49E010E541;
	Thu, 10 Aug 2023 13:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8094710E529;
 Thu, 10 Aug 2023 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672896; x=1723208896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hz63ZNXMH6WULCUS3K8icbkQErafyG9r+sLah+I529o=;
 b=hyzR6yv2YZU5DLclmKlyiI8gzRkNwwQ6HqBudF17ZEs6c1Mzlmkg+HhW
 LIFl5IdYN+I/hAJkFat/8WtGDPxQ/I+KuA1+fE+Oet3f3ATkqYz8C5J/n
 TkWbdobQDezYiBLIjCabilBUTyhC86GsCD9YKHkxWi3CdatxqHYVJTz8i
 uZr0QZd27ckmSrJa94AV59R5F/PEWwCXPxbf4wkLl9bv6NST8tCf1rus3
 j0mzUEEIK0V98WDXJW5LK92/DBRKdvz/M4q8ZYTmEs4LN+pNtPoffRtF5
 jd0ttVK2RYgsjgY9XTkHW+CYxVNd3XGOZ5/3+hjxc+pATRAho0wjKKMgw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358623"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143460"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143460"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/20] drm/i915/dp: Separate out functions for edp/DP for
 computing DSC bpp
Date: Thu, 10 Aug 2023 18:33:13 +0530
Message-Id: <20230810130319.3708392-15-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

Refactor code to separate functions for eDP and DP for computing
pipe_bpp/compressed bpp when DSC is involved.

This will help to optimize the link configuration for DP later.

v2: Fix checkpatch warning.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 191 ++++++++++++++++--------
 1 file changed, 126 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fd321b314f91..f4870c9b0db6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1696,6 +1696,115 @@ bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
 	return pipe_bpp >= intel_dp_dsc_min_src_input_bpc(i915) * 3;
 }
 
+static
+int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int forced_bpp;
+
+	if (!intel_dp->force_dsc_bpc)
+		return 0;
+
+	forced_bpp = intel_dp->force_dsc_bpc * 3;
+
+	if (is_dsc_pipe_bpp_sufficient(i915, forced_bpp)) {
+		drm_dbg_kms(&i915->drm, "Input DSC BPC forced to %d\n", intel_dp->force_dsc_bpc);
+		return forced_bpp;
+	}
+
+	drm_dbg_kms(&i915->drm, "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
+		    intel_dp->force_dsc_bpc);
+
+	return 0;
+}
+
+static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
+					 struct intel_crtc_state *pipe_config,
+					 struct drm_connector_state *conn_state,
+					 struct link_config_limits *limits,
+					 int timeslots)
+{
+	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u16 output_bpp, dsc_max_compressed_bpp = 0;
+	int forced_bpp, pipe_bpp;
+
+	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
+
+	if (forced_bpp) {
+		pipe_bpp = forced_bpp;
+	} else {
+		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, conn_state->max_requested_bpc);
+
+		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
+			drm_dbg_kms(&i915->drm,
+				    "Computed BPC less than min supported by source for DSC\n");
+			return -EINVAL;
+		}
+	}
+	/*
+	 * For now enable DSC for max link rate, max lane count.
+	 * Optimize this later for the minimum possible link rate/lane count
+	 * with DSC enabled for the requested mode.
+	 */
+	pipe_config->port_clock = limits->max_rate;
+	pipe_config->lane_count = limits->max_lane_count;
+	dsc_max_compressed_bpp = intel_dp_dsc_get_max_compressed_bpp(i915,
+								     pipe_config->port_clock,
+								     pipe_config->lane_count,
+								     adjusted_mode->crtc_clock,
+								     adjusted_mode->crtc_hdisplay,
+								     pipe_config->bigjoiner_pipes,
+								     pipe_config->output_format,
+								     pipe_bpp,
+								     timeslots);
+	if (!dsc_max_compressed_bpp) {
+		drm_dbg_kms(&i915->drm, "Compressed BPP not supported\n");
+		return -EINVAL;
+	}
+
+	output_bpp = intel_dp_output_bpp(pipe_config->output_format, pipe_bpp);
+
+	pipe_config->dsc.compressed_bpp = min_t(u16, dsc_max_compressed_bpp, output_bpp);
+
+	pipe_config->pipe_bpp = pipe_bpp;
+
+	return 0;
+}
+
+static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
+					  struct intel_crtc_state *pipe_config,
+					  struct drm_connector_state *conn_state,
+					  struct link_config_limits *limits)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int pipe_bpp, forced_bpp;
+
+	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
+
+	if (forced_bpp) {
+		pipe_bpp = forced_bpp;
+	} else {
+		/* For eDP use max bpp that can be supported with DSC. */
+		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
+							conn_state->max_requested_bpc);
+		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
+			drm_dbg_kms(&i915->drm,
+				    "Computed BPC less than min supported by source for DSC\n");
+			return -EINVAL;
+		}
+	}
+	pipe_config->port_clock = limits->max_rate;
+	pipe_config->lane_count = limits->max_lane_count;
+	pipe_config->dsc.compressed_bpp =
+		min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
+		      pipe_bpp);
+
+	pipe_config->pipe_bpp = pipe_bpp;
+
+	return 0;
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1718,44 +1827,28 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
+	/*
+	 * compute pipe bpp is set to false for DP MST DSC case
+	 * and compressed_bpp is calculated same time once
+	 * vpci timeslots are allocated, because overall bpp
+	 * calculation procedure is bit different for MST case.
+	 */
 	if (compute_pipe_bpp) {
-		int pipe_bpp;
-		int forced_bpp = intel_dp->force_dsc_bpc * 3;
-
-		if (forced_bpp && is_dsc_pipe_bpp_sufficient(dev_priv, forced_bpp)) {
-			pipe_bpp = forced_bpp;
-			drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
-				    intel_dp->force_dsc_bpc);
-		} else {
-			drm_WARN(&dev_priv->drm, forced_bpp,
-				 "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
-				 intel_dp->force_dsc_bpc);
-
-			pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
-								conn_state->max_requested_bpc);
-
-			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
-				drm_dbg_kms(&dev_priv->drm,
-					    "Computed BPC less than min supported by source for DSC\n");
-				return -EINVAL;
-			}
+		if (intel_dp_is_edp(intel_dp))
+			ret = intel_edp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
+							     conn_state, limits);
+		else
+			ret = intel_dp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
+							    conn_state, limits, timeslots);
+		if (ret) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "No Valid pipe bpp for given mode ret = %d\n", ret);
+			return ret;
 		}
-
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
@@ -1765,26 +1858,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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
-			if (!dsc_max_compressed_bpp) {
-				drm_dbg_kms(&dev_priv->drm,
-					    "Compressed BPP not supported\n");
-				return -EINVAL;
-			}
-		}
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
@@ -1796,20 +1871,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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
2.40.1

