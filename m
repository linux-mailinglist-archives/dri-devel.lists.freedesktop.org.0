Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44E777926
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0298A10E51F;
	Thu, 10 Aug 2023 13:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717E110E523;
 Thu, 10 Aug 2023 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672894; x=1723208894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjsmYOKSfewKKecR6JTXir4OnP0/8W5nzhi1rpZyPXc=;
 b=ZifaPKbe3UxUoPM087i7UhM+4MYvYO60/W3Fwxbvl/nn6qT3cMtUArJv
 WkeH5wALipA0uSgt3fF+DY0MrME3SlYHOWoqO5k5TY+hTJZ8pmmzT2W1e
 alpBacup88QUNcMph+8w0wpS3WT3Dyub9FJ/AYIgEjhXc+wWdotHro/an
 lkg1x9EvMgp6yYUvNd5Bpm+XpuC+h97qt+tlJrzym0HFW9lUO5qSDy+4M
 37BLawS3g2UQieWhl7cmgBqOwit56ASIZrWqLNav6d9MDRR6gYWCHCUZg
 Dmx4Eun6MfxjQ+JJhzceN+gB0fnRCVBYTr84phnXnj3c54xAvxtOif1MC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358600"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358600"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143290"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143290"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/20] drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc
 also
Date: Thu, 10 Aug 2023 18:33:10 +0530
Message-Id: <20230810130319.3708392-12-ankit.k.nautiyal@intel.com>
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

For DSC the min BPC is 8 for ICL+ and so the min pipe_bpp is 24.
Check this condition for cases where bpc is forced by debugfs flag
dsc_force_bpc. If the check fails, then WARN and ignore the debugfs
flag.

For MST case the pipe_bpp is already computed (hardcoded to be 24),
and this check is not required.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 48 ++++++++++++++++---------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b414d09b5e80..d0cf0021df70 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1694,6 +1694,12 @@ u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
 	return HAS_DSC(i915) ? 8 : 0;
 }
 
+static
+bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
+{
+	return pipe_bpp >= intel_dp_dsc_min_src_input_bpc(i915) * 3;
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1705,7 +1711,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
-	int pipe_bpp;
 	int ret;
 
 	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
@@ -1717,28 +1722,37 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
-	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
-			    intel_dp->force_dsc_bpc);
-	} else if (compute_pipe_bpp) {
-		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	} else {
-		pipe_bpp = pipe_config->pipe_bpp;
-	}
+	if (compute_pipe_bpp) {
+		int pipe_bpp;
+		int forced_bpp = intel_dp->force_dsc_bpc * 3;
 
-	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Computed BPC less than min supported by source for DSC\n");
-		return -EINVAL;
+		if (forced_bpp && is_dsc_pipe_bpp_sufficient(dev_priv, forced_bpp)) {
+			pipe_bpp = forced_bpp;
+			drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
+				    intel_dp->force_dsc_bpc);
+		} else {
+			drm_WARN(&dev_priv->drm, forced_bpp,
+				 "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
+				 intel_dp->force_dsc_bpc);
+
+			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
+							    conn_state->max_requested_bpc);
+
+			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
+				drm_dbg_kms(&dev_priv->drm,
+					    "Computed BPC less than min supported by source for DSC\n");
+				return -EINVAL;
+			}
+		}
+
+		pipe_config->pipe_bpp = pipe_bpp;
 	}
 
 	/*
-	 * For now enable DSC for max bpp, max link rate, max lane count.
+	 * For now enable DSC for max link rate, max lane count.
 	 * Optimize this later for the minimum possible link rate/lane count
 	 * with DSC enabled for the requested mode.
 	 */
-	pipe_config->pipe_bpp = pipe_bpp;
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
 
@@ -1767,7 +1781,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 								    adjusted_mode->crtc_hdisplay,
 								    pipe_config->bigjoiner_pipes,
 								    pipe_config->output_format,
-								    pipe_bpp,
+								    pipe_config->pipe_bpp,
 								    timeslots);
 			if (!dsc_max_compressed_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
-- 
2.40.1

