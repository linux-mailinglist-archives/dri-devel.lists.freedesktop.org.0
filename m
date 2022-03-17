Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F54DCB83
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A138710E5C2;
	Thu, 17 Mar 2022 16:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328BA10E2DD;
 Thu, 17 Mar 2022 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647534807; x=1679070807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2sarhHrJZpzyxL/wF9+oXA+rpjO/nQ4dr4lmIQ87uw=;
 b=Fn5XoNiydxzvLeKnO1N/0g1o2XQs6z4xwgrsKGyJ3VFLAiMWTlxHWsRV
 gaZxTLu/HH3rIYGqWrSkLr7SW6OSy0NvqrE9WSw4vsYzZiTnGqXMiVZkY
 zYCBwzoYgmyejmsAXAXoEM5YTuYBvJixmwZ/7SQBy0C4YIH3sPCl3Y7y9
 5YLK6lUdU65f2JYth2o8smawYN/wNu9rBUPS+LdEtOTLziTsBdcOziHYC
 QFI2IXzIZQu6viXnjioXKYgcxdqwbvrwrJzt+wY3GmoelDK0FInxbBJm1
 rOKzaciDfeuQgG4icDg5Xqg44P/aA8Qs+MIcgkJXNxD2CWCMXkXTajEDe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237522826"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237522826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 09:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="558002942"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga008.jf.intel.com with ESMTP; 17 Mar 2022 09:33:20 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Add DSC support to MST path
Date: Thu, 17 Mar 2022 18:33:53 +0200
Message-Id: <20220317163353.4152-3-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
References: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, Stanislav.Lisovskiy@intel.com,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever we are not able to get enough timeslots
for required PBN, let's try to allocate those
using DSC, just same way as we do for SST.

Those patches are experimental yet, i.e not
for merging, still need to be tested with
proper DSC display, submitting those to check
ig nothing else blows up at least.

v2: Add DSC checks to intel_dp_mst_mode_valid_ctx, similar
    to ones we have in intel_dp_mode_valid(Manasi Navare)

v3: Removed redundant edp condition logic from MST DSC
    handling(Manasi Navare)

v4:  - Fixed forgotten force_dsc_en condition which was
       always enabled for testing purposes(Manasi Navare)
     - Properly process ret == EDEADLK, thus fixing the
       regression caused by WARN triggered with modeset_lock.

v5:  - Removed redundant check(Imre Deak)

Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 138 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 146 +++++++++++++++++++-
 3 files changed, 285 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9e19165fd175..b04771e495cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -115,7 +115,6 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
-static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -667,11 +666,12 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
 		return 6144 * 8;
 }
 
-static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
-				       u32 link_clock, u32 lane_count,
-				       u32 mode_clock, u32 mode_hdisplay,
-				       bool bigjoiner,
-				       u32 pipe_bpp)
+u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
+				u32 link_clock, u32 lane_count,
+				u32 mode_clock, u32 mode_hdisplay,
+				bool bigjoiner,
+				u32 pipe_bpp,
+				u32 timeslots)
 {
 	u32 bits_per_pixel, max_bpp_small_joiner_ram;
 	int i;
@@ -683,7 +683,7 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	 * for MST -> TimeSlotsPerMTP has to be calculated
 	 */
 	bits_per_pixel = (link_clock * lane_count * 8) /
-			 intel_dp_mode_to_fec_clock(mode_clock);
+			 (intel_dp_mode_to_fec_clock(mode_clock) * timeslots);
 	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
 
 	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
@@ -737,9 +737,9 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	return bits_per_pixel << 4;
 }
 
-static u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
-				       int mode_clock, int mode_hdisplay,
-				       bool bigjoiner)
+u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
+				int mode_clock, int mode_hdisplay,
+				bool bigjoiner)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 min_slice_count, i;
@@ -902,8 +902,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	return MODE_OK;
 }
 
-static bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
-				    int hdisplay, int clock)
+bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
+			     int hdisplay, int clock)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
@@ -990,7 +990,7 @@ intel_dp_mode_valid(struct drm_connector *connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp) >> 4;
+							    pipe_bpp, 1) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1285,7 +1285,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
+int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i, num_bpc;
@@ -1429,7 +1429,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 						    adjusted_mode->crtc_clock,
 						    adjusted_mode->crtc_hdisplay,
 						    pipe_config->bigjoiner_pipes,
-						    pipe_bpp);
+						    pipe_bpp,
+						    1);
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
@@ -1444,7 +1445,114 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							       dsc_max_output_bpp >> 4,
 							       pipe_config->pipe_bpp);
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
+		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
+			    pipe_config->dsc.compressed_bpp,
+			    pipe_config->dsc.slice_count);
 	}
+	/*
+	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
+	 * is greater than the maximum Cdclock and if slice count is even
+	 * then we need to use 2 VDSC instances.
+	 */
+	if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq) {
+		if (pipe_config->dsc.slice_count > 1) {
+			pipe_config->dsc.dsc_split = true;
+		} else {
+			drm_dbg_kms(&dev_priv->drm,
+				    "Cannot split stream to use 2 VDSC instances\n");
+			return -EINVAL;
+		}
+	}
+
+	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
+	if (ret < 0) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "Cannot compute valid DSC parameters for Input Bpp = %d "
+			    "Compressed BPP = %d\n",
+			    pipe_config->pipe_bpp,
+			    pipe_config->dsc.compressed_bpp);
+		return ret;
+	}
+
+	pipe_config->dsc.compression_enable = true;
+	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
+		    "Compressed Bpp = %d Slice Count = %d\n",
+		    pipe_config->pipe_bpp,
+		    pipe_config->dsc.compressed_bpp,
+		    pipe_config->dsc.slice_count);
+
+	return 0;
+}
+
+int intel_dp_mst_dsc_compute_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *pipe_config,
+				    struct drm_connector_state *conn_state,
+				    struct link_config_limits *limits,
+				    int timeslots)
+{
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	const struct drm_display_mode *adjusted_mode =
+		&pipe_config->hw.adjusted_mode;
+	int pipe_bpp;
+	int ret;
+	u16 dsc_max_output_bpp;
+	u8 dsc_dp_slice_count;
+
+	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
+		intel_dp_supports_fec(intel_dp, pipe_config);
+
+	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
+		return -EINVAL;
+
+	pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
+
+	/* Min Input BPC for ICL+ is 8 */
+	if (pipe_bpp < 8 * 3) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "No DSC support for less than 8bpc\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * For now enable DSC for max bpp, max link rate, max lane count.
+	 * Optimize this later for the minimum possible link rate/lane count
+	 * with DSC enabled for the requested mode.
+	 */
+	pipe_config->pipe_bpp = pipe_bpp;
+	pipe_config->port_clock = limits->max_rate;
+	pipe_config->lane_count = limits->max_lane_count;
+
+	dsc_max_output_bpp =
+		intel_dp_dsc_get_output_bpp(dev_priv,
+					    pipe_config->port_clock,
+					    pipe_config->lane_count,
+					    adjusted_mode->crtc_clock,
+					    adjusted_mode->crtc_hdisplay,
+					    pipe_config->bigjoiner_pipes,
+					    pipe_bpp,
+					    timeslots);
+
+	dsc_dp_slice_count =
+		intel_dp_dsc_get_slice_count(intel_dp,
+					     adjusted_mode->crtc_clock,
+					     adjusted_mode->crtc_hdisplay,
+					     pipe_config->bigjoiner_pipes);
+
+	if (!dsc_max_output_bpp || !dsc_dp_slice_count) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "Compressed BPP/Slice Count not supported\n");
+		return -EINVAL;
+	}
+
+	pipe_config->dsc.compressed_bpp = min_t(u16,
+					       dsc_max_output_bpp >> 4,
+					       pipe_config->pipe_bpp);
+
+	pipe_config->dsc.slice_count = dsc_dp_slice_count;
+	drm_dbg_kms(&dev_priv->drm, "MST DSC: compressed bpp %d slice count %d\n",
+		    pipe_config->dsc.compressed_bpp,
+		    pipe_config->dsc.slice_count);
 
 	/* As of today we support DSC for only RGB */
 	if (intel_dp->force_dsc_bpp) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index d457e17bdc57..e4198ebdbd03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -55,6 +55,11 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder);
 int intel_dp_compute_config(struct intel_encoder *encoder,
 			    struct intel_crtc_state *pipe_config,
 			    struct drm_connector_state *conn_state);
+int intel_dp_mst_dsc_compute_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *pipe_config,
+				    struct drm_connector_state *conn_state,
+				    struct link_config_limits *limits,
+				    int timeslots);
 bool intel_dp_is_edp(struct intel_dp *intel_dp);
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
 bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
@@ -94,6 +99,18 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		       struct intel_crtc_state *crtc_state,
 		       unsigned int type);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
+int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
+u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
+				u32 link_clock, u32 lane_count,
+				u32 mode_clock, u32 mode_hdisplay,
+				bool bigjoiner,
+				u32 pipe_bpp,
+				u32 timeslots);
+u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
+				int mode_clock, int mode_hdisplay,
+				bool bigjoiner);
+bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
+			     int hdisplay, int clock);
 
 static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e30e698aa684..8ca41fec6927 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -67,7 +67,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 		crtc_state->pipe_bpp = bpp;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       crtc_state->pipe_bpp,
+						       bpp,
 						       false);
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
@@ -99,6 +99,82 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	return 0;
 }
 
+static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
+						 struct intel_crtc_state *crtc_state,
+						 struct drm_connector_state *conn_state,
+						 struct link_config_limits *limits)
+{
+	struct drm_atomic_state *state = crtc_state->uapi.state;
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
+					   DP_DPCD_QUIRK_CONSTANT_N);
+	int bpp, slots = -EINVAL;
+	int i, num_bpc;
+	u8 dsc_bpc[3] = {0};
+	int min_bpp, max_bpp;
+	u8 dsc_max_bpc;
+
+	crtc_state->lane_count = limits->max_lane_count;
+	crtc_state->port_clock = limits->max_rate;
+
+	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+	if (DISPLAY_VER(i915) >= 12)
+		dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
+	else
+		dsc_max_bpc = min_t(u8, 10, conn_state->max_requested_bpc);
+
+	max_bpp = min_t(u8, dsc_max_bpc * 3, limits->max_bpp);
+	min_bpp = limits->min_bpp;
+
+	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
+						       dsc_bpc);
+	for (i = 0; i < num_bpc; i++) {
+		if (max_bpp >= dsc_bpc[i] * 3)
+			if (min_bpp > dsc_bpc[i] * 3)
+				min_bpp = dsc_bpc[i] * 3;
+	}
+	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
+				min_bpp, max_bpp);
+	for (bpp = max_bpp; bpp >= min_bpp; bpp -= 2 * 3) {
+		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
+						       bpp << 4,
+						       true);
+
+		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
+						      connector->port,
+						      crtc_state->pbn, 0);
+
+		drm_dbg_kms(&i915->drm, "Trying bpp %d got %d pbn %d slots\n",
+					bpp, crtc_state->pbn, slots);
+
+		if (slots == -EDEADLK)
+			return slots;
+		if (slots >= 0)
+			break;
+	}
+
+	if (slots < 0) {
+		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
+			    slots);
+		return slots;
+	}
+
+	intel_link_compute_m_n(crtc_state->pipe_bpp,
+			       crtc_state->lane_count,
+			       adjusted_mode->crtc_clock,
+			       crtc_state->port_clock,
+			       &crtc_state->dp_m_n,
+			       constant_n, crtc_state->fec_enable);
+	crtc_state->dp_m_n.tu = slots;
+
+	return 0;
+}
 static int intel_dp_mst_update_slots(struct intel_encoder *encoder,
 				     struct intel_crtc_state *crtc_state,
 				     struct drm_connector_state *conn_state)
@@ -175,6 +251,27 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	ret = intel_dp_mst_compute_link_config(encoder, pipe_config,
 					       conn_state, &limits);
+
+	if (ret == -EDEADLK)
+		return ret;
+
+	/* enable compression if the mode doesn't fit available BW */
+	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
+	if (ret || intel_dp->force_dsc_en) {
+		/*
+		 * Try to get at least some timeslots and then see, if
+		 * we can fit there with DSC.
+		 */
+		ret = intel_dp_dsc_mst_compute_link_config(encoder, pipe_config,
+							   conn_state, &limits);
+		if (ret < 0)
+			return ret;
+
+		ret = intel_dp_mst_dsc_compute_config(intel_dp, pipe_config,
+						      conn_state, &limits,
+						      pipe_config->dp_m_n.tu);
+	}
+
 	if (ret)
 		return ret;
 
@@ -715,6 +812,10 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	int ret;
+	bool dsc = false, bigjoiner = false;
+	u16 dsc_max_output_bpp = 0;
+	u8 dsc_slice_count = 0;
+	int target_clock = mode->clock;
 
 	if (drm_connector_is_unregistered(connector)) {
 		*status = MODE_ERROR;
@@ -752,6 +853,49 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		return 0;
 	}
 
+	if (intel_dp_need_bigjoiner(intel_dp, mode->hdisplay, target_clock)) {
+		bigjoiner = true;
+		max_dotclk *= 2;
+	}
+
+	if (DISPLAY_VER(dev_priv) >= 10 &&
+	    drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)) {
+		/*
+		 * TBD pass the connector BPC,
+		 * for now U8_MAX so that max BPC on that platform would be picked
+		 */
+		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+
+		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
+			dsc_max_output_bpp =
+				intel_dp_dsc_get_output_bpp(dev_priv,
+							    max_link_clock,
+							    max_lanes,
+							    target_clock,
+							    mode->hdisplay,
+							    bigjoiner,
+							    pipe_bpp, 1) >> 4;
+			dsc_slice_count =
+				intel_dp_dsc_get_slice_count(intel_dp,
+							     target_clock,
+							     mode->hdisplay,
+							     bigjoiner);
+		}
+
+		dsc = dsc_max_output_bpp && dsc_slice_count;
+	}
+
+	/*
+	 * Big joiner configuration needs DSC for TGL which is not true for
+	 * XE_LPD where uncompressed joiner is supported.
+	 */
+	if (DISPLAY_VER(dev_priv) < 13 && bigjoiner && !dsc)
+		return MODE_CLOCK_HIGH;
+
+	if (mode_rate > max_rate && !dsc)
+		return MODE_CLOCK_HIGH;
+
+
 	*status = intel_mode_valid_max_plane_size(dev_priv, mode, false);
 	return 0;
 }
-- 
2.24.1.485.gad05a3d8e5

