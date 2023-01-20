Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31053674AFE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C513610EA30;
	Fri, 20 Jan 2023 04:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DC410EA23;
 Fri, 20 Jan 2023 04:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189731; x=1705725731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jts+eodbh1YIqyk2pnasnp2yzgzQIhJ1JdpCLOJFSRA=;
 b=QLUFp4AcszU+G3rPvJoiYUWa/YidyZYrn8LiLseEdWNpQxpjPFtmYXMP
 akxibrKPr6wnQtBM4QXb9lAHlyjLNUMV+X6U9uAYtNjtSWd7x8DB74awq
 G2Q0q2BnAK8G+uW7/vEMOFt2FlapcxLU1K+ABmdHeb7SKVNuqSZP7mRSQ
 bClu60Vd5inxN3GZ4vU3EDLp+K9Fmiv5NP0Ef01RO+7tYZMhcqTbNq3Lb
 IS2/3joEzzkO+DB7UeYRG0k2kFWdfOoah/rkKw5IcryKrqw7DsJOPGzfS
 1LC8Zi9tZgAvzHj0bWEdkateG5A1KucbOrQPdk3UJju/54XPpIaFme5N3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195527"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195527"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734945"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734945"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:06 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/16] drm/i915/dp: Rename helpers to get DSC max
 pipe_bpp/output_bpp
Date: Fri, 20 Jan 2023 10:08:34 +0530
Message-Id: <20230120043844.3761895-7-ankit.k.nautiyal@intel.com>
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

Currently the required dsc output bpp is set to be the largest
compressed bpp supported for max, lane, rate, and bpp.
The helper intel_dp_dsc_get_output_bpp gets the maximum supported
compressed bpp taking into account link configuration, input bpp,
bigjoiner considerations etc.

Similarly, the helper intel_dp_dsc_compute_bpp gives the maximum
pipe bpp that is allowed with DSC.

Rename the functions to reflect that these return max DSC input and
output bpps.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 48 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_dp.h     | 14 +++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 +++----
 3 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c52e9979f0a4..c0b96cfb7528 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -702,12 +702,12 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 p
 	return bits_per_pixel;
 }
 
-u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
-				u32 link_clock, u32 lane_count,
-				u32 mode_clock, u32 mode_hdisplay,
-				bool bigjoiner,
-				u32 pipe_bpp,
-				u32 timeslots)
+u16 intel_dp_dsc_get_output_bpp_max(struct drm_i915_private *i915,
+				    u32 link_clock, u32 lane_count,
+				    u32 mode_clock, u32 mode_hdisplay,
+				    bool bigjoiner,
+				    u32 pipe_bpp,
+				    u32 timeslots)
 {
 	u32 bits_per_pixel, max_bpp_small_joiner_ram;
 
@@ -1030,7 +1030,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		int pipe_bpp = intel_dp_dsc_get_bpp_max(intel_dp, U8_MAX);
 
 		if (intel_dp_is_edp(intel_dp)) {
 			dsc_max_output_bpp =
@@ -1040,13 +1040,13 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 								true);
 		} else if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
 			dsc_max_output_bpp =
-				intel_dp_dsc_get_output_bpp(dev_priv,
-							    max_link_clock,
-							    max_lanes,
-							    target_clock,
-							    mode->hdisplay,
-							    bigjoiner,
-							    pipe_bpp, 64);
+				intel_dp_dsc_get_output_bpp_max(dev_priv,
+								max_link_clock,
+								max_lanes,
+								target_clock,
+								mode->hdisplay,
+								bigjoiner,
+								pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1375,7 +1375,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
+int intel_dp_dsc_get_bpp_max(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i, num_bpc;
@@ -1518,7 +1518,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		pipe_config->pipe_bpp = forced_bpp;
 		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_config->pipe_bpp);
 	} else if (compute_pipe_bpp) {
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
+		int pipe_bpp = intel_dp_dsc_get_bpp_max(intel_dp, conn_state->max_requested_bpc);
 
 		if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
 			drm_dbg_kms(&dev_priv->drm,
@@ -1548,14 +1548,14 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 
 		if (compute_pipe_bpp) {
 			dsc_max_output_bpp =
-				intel_dp_dsc_get_output_bpp(dev_priv,
-							    pipe_config->port_clock,
-							    pipe_config->lane_count,
-							    adjusted_mode->crtc_clock,
-							    adjusted_mode->crtc_hdisplay,
-							    pipe_config->bigjoiner_pipes,
-							    pipe_config->pipe_bpp,
-							    timeslots);
+				intel_dp_dsc_get_output_bpp_max(dev_priv,
+								pipe_config->port_clock,
+								pipe_config->lane_count,
+								adjusted_mode->crtc_clock,
+								adjusted_mode->crtc_hdisplay,
+								pipe_config->bigjoiner_pipes,
+								pipe_config->pipe_bpp,
+								timeslots);
 			if (!dsc_max_output_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
 					    "Compressed BPP not supported\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ef39e4f7a329..7cb8227a4d1e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -102,13 +102,13 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		       struct intel_crtc_state *crtc_state,
 		       unsigned int type);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
-u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
-				u32 link_clock, u32 lane_count,
-				u32 mode_clock, u32 mode_hdisplay,
-				bool bigjoiner,
-				u32 pipe_bpp,
-				u32 timeslots);
+int intel_dp_dsc_get_bpp_max(struct intel_dp *intel_dp, u8 dsc_max_bpc);
+u16 intel_dp_dsc_get_output_bpp_max(struct drm_i915_private *i915,
+				    u32 link_clock, u32 lane_count,
+				    u32 mode_clock, u32 mode_hdisplay,
+				    bool bigjoiner,
+				    u32 pipe_bpp,
+				    u32 timeslots);
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
 				int mode_clock, int mode_hdisplay,
 				bool bigjoiner);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 5b65e4c2c78f..df19691776ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -911,17 +911,17 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		int pipe_bpp = intel_dp_dsc_get_bpp_max(intel_dp, U8_MAX);
 
 		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
 			dsc_max_output_bpp =
-				intel_dp_dsc_get_output_bpp(dev_priv,
-							    max_link_clock,
-							    max_lanes,
-							    target_clock,
-							    mode->hdisplay,
-							    bigjoiner,
-							    pipe_bpp, 64);
+				intel_dp_dsc_get_output_bpp_max(dev_priv,
+								max_link_clock,
+								max_lanes,
+								target_clock,
+								mode->hdisplay,
+								bigjoiner,
+								pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
-- 
2.25.1

