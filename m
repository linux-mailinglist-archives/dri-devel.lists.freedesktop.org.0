Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9438838BEB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1066210F265;
	Tue, 23 Jan 2024 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B010EF8F;
 Tue, 23 Jan 2024 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005729; x=1737541729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuEOrWj1+nchzky6mdNsAWGOTxOdI96as9foVp2PyPA=;
 b=HfvQJPijnGus3R3iiwGQSmFnMSR0x8fA8ZZMCZkeoMt0CZDudACivpeH
 HHkpTQ1kVOpWL1LPlRqAbQsnjNDarDG/XdFIJEdYPUwi79tTDcj1u5HtC
 0gvXujO33lWkuczjeu3AYTRNmSGL0OK9gFwmsMy0UKfPMssmzS35YVXER
 rZndP1YZm0iRo510THr/WeJDwTddQpiUS8HNnGKiAkvKstL2Xjh+npV0/
 5hgGWFxN6MUiDCIO13pszJ9kscggeQF/UQH51YRHgAJI1TohkG3H1t7Gl
 Pt9i4et838AfUFiLC6XbAoT3UGmg+MdZbzCB9KN5IoudyMkm7SQM4vwQV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134172"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134172"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283398"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283398"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:47 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] drm/i915/dp: Add intel_dp_max_link_data_rate()
Date: Tue, 23 Jan 2024 12:28:40 +0200
Message-Id: <20240123102850.390126-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add intel_dp_max_link_data_rate() to get the link BW vs. the sink DPRX
BW used by a follow-up patch enabling the DP tunnel BW allocation mode.
The link BW can be below the DPRX BW due to a BW limitation on a link
shared by multiple sinks.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 32 +++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  3 +-
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 23434d0aba188..9cd675c6d0ee8 100644
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
 
@@ -1214,7 +1230,8 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
+	max_rate = intel_dp_max_link_data_rate(intel_dp, max_link_clock, max_lanes);
+
 	mode_rate = intel_dp_link_required(target_clock,
 					   intel_dp_mode_min_output_bpp(connector, mode));
 
@@ -1564,8 +1581,10 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
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
@@ -2422,8 +2441,9 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
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
index 49553e43add22..8b0dfbf06afff 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -117,6 +117,8 @@ bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
 int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
 				 int bw_overhead);
+int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
+				int max_dprx_rate, int max_dprx_lanes);
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index cfcc157b7d41d..520393dc8b453 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1295,7 +1295,8 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
+	max_rate = intel_dp_max_link_data_rate(intel_dp,
+					       max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(mode->clock, min_bpp);
 
 	ret = drm_modeset_lock(&mgr->base.lock, ctx);
-- 
2.39.2

