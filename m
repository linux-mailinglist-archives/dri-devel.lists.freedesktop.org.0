Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B685C805
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5D389EAC;
	Tue, 20 Feb 2024 21:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcMpZb/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30989A72;
 Tue, 20 Feb 2024 21:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463909; x=1739999909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZ3fp9qySi9aWq3cb73QWFdrfjjLlhKJzu6VIP7uz98=;
 b=UcMpZb/ONjoHEzVLaK/zO1TlZ28NoOAdtOzG9BR92PbafUWwgMtSs92r
 gVQy8+Bcbc/4qXY7TEuL8C1xoQv8rTp/hGGXY1lqUCtSk4jVTIlzFr5OT
 67FAM03hX88BIMXjXi9ZjBYSEyHVZfIvCGzd1e6l69uGdGeUfW7qoBXih
 aLLMMEwZDD1VfQ9gw2UsPa3SEfu3HkjHRxynVQBsMnED+602TYFpgOxRj
 5mZ9OrazOlJ2haDYbHxug66sNZDsvetpOxDDjhfaqHiuKZnSyRJ6Lnj9O
 OHBsB2V/Mll16uua34+SYzzB1oKvGt1O4LJkRLEZPIocBZzb68mo3MQwP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738651"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061587"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:28 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 05/21] drm/i915/dp: Use drm_dp_max_dprx_data_rate()
Date: Tue, 20 Feb 2024 23:18:25 +0200
Message-Id: <20240220211841.448846-6-imre.deak@intel.com>
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

Instead of intel_dp_max_data_rate() use the equivalent
drm_dp_max_dprx_data_rate() which was copied from the former one in a
previous patch.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c      | 62 +++-----------------
 drivers/gpu/drm/i915/display/intel_dp.h      |  1 -
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  2 +-
 4 files changed, 10 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2ee26d19c200b..e1a4200f67a7e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2478,7 +2478,7 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
 	u32 data_m = intel_dp_effective_data_rate(pixel_clock, bits_per_pixel_x16,
 						  bw_overhead);
-	u32 data_n = intel_dp_max_data_rate(link_clock, nlanes);
+	u32 data_n = drm_dp_max_dprx_data_rate(link_clock, nlanes);
 
 	/*
 	 * Windows/BIOS uses fixed M/N values always. Follow suit.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 88606e336a920..0a2ee43392142 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -383,52 +383,6 @@ int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
 				1000000 * 16 * 8);
 }
 
-/*
- * Given a link rate and lanes, get the data bandwidth.
- *
- * Data bandwidth is the actual payload rate, which depends on the data
- * bandwidth efficiency and the link rate.
- *
- * For 8b/10b channel encoding, SST and non-FEC, the data bandwidth efficiency
- * is 80%. For example, for a 1.62 Gbps link, 1.62*10^9 bps * 0.80 * (1/8) =
- * 162000 kBps. With 8-bit symbols, we have 162000 kHz symbol clock. Just by
- * coincidence, the port clock in kHz matches the data bandwidth in kBps, and
- * they equal the link bit rate in Gbps multiplied by 100000. (Note that this no
- * longer holds for data bandwidth as soon as FEC or MST is taken into account!)
- *
- * For 128b/132b channel encoding, the data bandwidth efficiency is 96.71%. For
- * example, for a 10 Gbps link, 10*10^9 bps * 0.9671 * (1/8) = 1208875
- * kBps. With 32-bit symbols, we have 312500 kHz symbol clock. The value 1000000
- * does not match the symbol clock, the port clock (not even if you think in
- * terms of a byte clock), nor the data bandwidth. It only matches the link bit
- * rate in units of 10000 bps.
- */
-int
-intel_dp_max_data_rate(int max_link_rate, int max_lanes)
-{
-	int ch_coding_efficiency =
-		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(max_link_rate));
-	int max_link_rate_kbps = max_link_rate * 10;
-
-	/*
-	 * UHBR rates always use 128b/132b channel encoding, and have
-	 * 97.71% data bandwidth efficiency. Consider max_link_rate the
-	 * link bit rate in units of 10000 bps.
-	 */
-	/*
-	 * Lower than UHBR rates always use 8b/10b channel encoding, and have
-	 * 80% data bandwidth efficiency for SST non-FEC. However, this turns
-	 * out to be a nop by coincidence:
-	 *
-	 *	int max_link_rate_kbps = max_link_rate * 10;
-	 *	max_link_rate_kbps = DIV_ROUND_DOWN_ULL(max_link_rate_kbps * 8, 10);
-	 *	max_link_rate = max_link_rate_kbps / 8;
-	 */
-	return DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate_kbps * max_lanes,
-					      ch_coding_efficiency),
-				  1000000 * 8);
-}
-
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
@@ -658,7 +612,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(struct intel_dp *intel_dp,
 	int mode_rate, max_rate;
 
 	mode_rate = intel_dp_link_required(fixed_mode->clock, 18);
-	max_rate = intel_dp_max_data_rate(link_rate, lane_count);
+	max_rate = drm_dp_max_dprx_data_rate(link_rate, lane_count);
 	if (mode_rate > max_rate)
 		return false;
 
@@ -1262,7 +1216,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
+	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(target_clock,
 					   intel_dp_mode_min_output_bpp(connector, mode));
 
@@ -1612,8 +1566,8 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 			for (lane_count = limits->min_lane_count;
 			     lane_count <= limits->max_lane_count;
 			     lane_count <<= 1) {
-				link_avail = intel_dp_max_data_rate(link_rate,
-								    lane_count);
+				link_avail = drm_dp_max_dprx_data_rate(link_rate,
+								       lane_count);
 
 				if (mode_rate <= link_avail) {
 					pipe_config->lane_count = lane_count;
@@ -2467,8 +2421,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			    "DP link rate required %i available %i\n",
 			    intel_dp_link_required(adjusted_mode->crtc_clock,
 						   to_bpp_int_roundup(pipe_config->dsc.compressed_bpp_x16)),
-			    intel_dp_max_data_rate(pipe_config->port_clock,
-						   pipe_config->lane_count));
+			    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
+						      pipe_config->lane_count));
 	} else {
 		drm_dbg_kms(&i915->drm, "DP lane count %d clock %d bpp %d\n",
 			    pipe_config->lane_count, pipe_config->port_clock,
@@ -2478,8 +2432,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			    "DP link rate required %i available %i\n",
 			    intel_dp_link_required(adjusted_mode->crtc_clock,
 						   pipe_config->pipe_bpp),
-			    intel_dp_max_data_rate(pipe_config->port_clock,
-						   pipe_config->lane_count));
+			    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
+						      pipe_config->lane_count));
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index e2875e03afba0..20252984b3b04 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -111,7 +111,6 @@ bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
 int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
 				 int bw_overhead);
-int intel_dp_max_data_rate(int max_link_rate, int max_lanes);
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index c685b64bb7810..b4d4bb90126e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1299,7 +1299,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
 	max_lanes = intel_dp_max_lane_count(intel_dp);
 
-	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
+	max_rate = drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(mode->clock, min_bpp);
 
 	ret = drm_modeset_lock(&mgr->base.lock, ctx);
-- 
2.39.2

