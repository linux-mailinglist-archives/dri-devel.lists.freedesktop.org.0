Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F485C81C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E0B10E585;
	Tue, 20 Feb 2024 21:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eg4HrXrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AFB10E56F;
 Tue, 20 Feb 2024 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463917; x=1739999917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JM1BCSiYFyeNA4xBeuJhZEo4SYV+CN1D7srC6WrVrh0=;
 b=eg4HrXrQ2Qk9SkLwKleNAb2A3dFeW4/5Ixxvff6gSJdDrFLhS1dI1QIm
 RjUU4jEYjUPu45BUXXoK8gvXnhA2DWMV/+Ydw2tekpT5KC4VcUew4rhfR
 PxVKECAdLjJh4cAaL2Al2vog/yaVeI4ik80nU+oasiyoWkBZErk9u04iS
 LuOVrCS3HssI4Cs2fqbzlOPXJfSTj6FLvoi8ZkROilVGGs0wLqSDW674v
 K9eXAHSmLKJEKPRiIZkObOvwZ1hfh9V8cxfI8IG9+sZ0jpRlCm3ewN1L/
 3yRBH2o2uQvYnoHFokzWjHaWU0VPCRrjdmCYEWsXZYA6f04ElKnAt0/dA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738662"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738662"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061608"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:35 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 10/21] drm/i915/dp: Add intel_dp_max_link_data_rate()
Date: Tue, 20 Feb 2024 23:18:30 +0200
Message-Id: <20240220211841.448846-11-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add intel_dp_max_link_data_rate() to get the link BW vs. the sink DPRX
BW used by a follow-up patch enabling the DP tunnel BW allocation mode.
The link BW can be below the DPRX BW due to a BW limitation on a link
shared by multiple sinks.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 32 +++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  3 +-
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 520c04245c2df..d9e75922ff8f5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -383,6 +383,22 @@ int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
 				1000000 * 16 * 8);
 }
 
+/**
+ * intel_dp_max_link_data_rate: Calculate the maximum rate for the given link params
+ * @intel_dp: Intel DP object
+ * @max_dprx_rate: Maximum data rate of the DPRX
+ * @max_dprx_lanes: Maximum lane count of the DPRX
+ *
+ * Calculate the maximum data rate for the provided link parameters.
+ *
+ * Returns the maximum data rate in kBps units.
+ */
+int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
+				int max_dprx_rate, int max_dprx_lanes)
+{
+	return drm_dp_max_dprx_data_rate(max_dprx_rate, max_dprx_lanes);
+}
+
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
@@ -612,7 +628,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(struct intel_dp *intel_dp,
 	int mode_rate, max_rate;
 
 	mode_rate = intel_dp_link_required(fixed_mode->clock, 18);
-	max_rate = drm_dp_max_dprx_data_rate(link_rate, lane_count);
+	max_rate = intel_dp_max_link_data_rate(intel_dp, link_rate, lane_count);
 	if (mode_rate > max_rate)
 		return false;
 
@@ -1216,7 +1232,8 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
+	max_rate = intel_dp_max_link_data_rate(intel_dp, max_link_clock, max_lanes);
+
 	mode_rate = intel_dp_link_required(target_clock,
 					   intel_dp_mode_min_output_bpp(connector, mode));
 
@@ -1566,8 +1583,10 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 			for (lane_count = limits->min_lane_count;
 			     lane_count <= limits->max_lane_count;
 			     lane_count <<= 1) {
-				link_avail = drm_dp_max_dprx_data_rate(link_rate,
-								       lane_count);
+				link_avail = intel_dp_max_link_data_rate(intel_dp,
+									 link_rate,
+									 lane_count);
+
 
 				if (mode_rate <= link_avail) {
 					pipe_config->lane_count = lane_count;
@@ -2427,8 +2446,9 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 		    pipe_config->pipe_bpp,
 		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
 		    intel_dp_config_required_rate(pipe_config),
-		    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
-					      pipe_config->lane_count));
+		    intel_dp_max_link_data_rate(intel_dp,
+						pipe_config->port_clock,
+						pipe_config->lane_count));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 10e859b62bbe9..564a587e2d018 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -115,6 +115,8 @@ bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
 int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
 				 int bw_overhead);
+int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
+				int max_dprx_rate, int max_dprx_lanes);
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b4d4bb90126e9..4b6c8ff974297 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1299,7 +1299,8 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
+	max_rate = intel_dp_max_link_data_rate(intel_dp,
+					       max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(mode->clock, min_bpp);
 
 	ret = drm_modeset_lock(&mgr->base.lock, ctx);
-- 
2.39.2

