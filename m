Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5E5A93F7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91DB10E68A;
	Thu,  1 Sep 2022 10:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F03710E688;
 Thu,  1 Sep 2022 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662027066; x=1693563066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FdAsfv9qLIN5AY11isHT73S5icO2JLtfLAU6hmVNOaY=;
 b=BNsN1Rk6kVlTDoYUNmv7m7EYrQXrBT9LWTI5zXGD15o1xlIv+Flogd9k
 2bmw3jyQ1rtHeYOUSg2JOiEzwQ+fbumXmTltxWxcQ2pJnmPnxTLynUmty
 ZfII4YX2xNVCV34EUjHSuj/8cFo4ci3HEstn2HcnahwP71BPqwdhy66GY
 GhU1wwDFrd86TBPSMgV772rgnALTp2inCWPLqGM8pTzTiN1cds2ySxG8C
 jMfopv+4F62awWiZ8gH/7GIoaP+EbCCyVPbopTvdHcjNMyidDiZf9cf35
 6SmO/0jHrpf1hpO2IZxVkzZxZwIrAARow+q2eFKAkoD9An918L/NJ+1O+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="359635670"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="359635670"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="673784312"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2022 03:11:03 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Add DSC support to MST path
Date: Thu,  1 Sep 2022 13:11:43 +0300
Message-Id: <20220901101143.32316-5-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901101143.32316-1-stanislav.lisovskiy@intel.com>
References: <20220901101143.32316-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever we are not able to get enough timeslots
for required PBN, let's try to allocate those
using DSC, just same way as we do for SST.

v2: Removed intel_dp_mst_dsc_compute_config and refactored
    intel_dp_dsc_compute_config to support timeslots as a
    parameter(Ville Syrjälä)

v3: - Rebased
    - Added a debug to see that we at least try reserving
      VCPI slots using DSC, because currently its not visible
      from the logs, thus making debugging more tricky.
    - Moved timeslots to numerator, where it should be.

v4: - Call drm_dp_mst_atomic_check already during link
      config computation, because we need to know already
      by this moment if uncompressed amount of VCPI slots
      needed can fit, otherwise we need to use DSC.
      (thanks to Vinod Govindapillai for pointing this out)

v5: - Put pipe_config->bigjoiner_pipes back to original
      condition in intel_dp_dsc_compute_config
      (don't remember when I lost it)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  73 +++++------
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 136 ++++++++++++++++++++
 3 files changed, 184 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d4e037450ac5..a155c39ff285 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -116,7 +116,6 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
-static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -687,11 +686,12 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
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
@@ -702,8 +702,9 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	 * for SST -> TimeSlotsPerMTP is 1,
 	 * for MST -> TimeSlotsPerMTP has to be calculated
 	 */
-	bits_per_pixel = (link_clock * lane_count * 8) /
+	bits_per_pixel = (link_clock * lane_count * 8) * timeslots /
 			 intel_dp_mode_to_fec_clock(mode_clock);
+	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
 
 	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
 	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) /
@@ -752,9 +753,9 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
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
@@ -961,8 +962,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	return MODE_OK;
 }
 
-static bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
-				    int hdisplay, int clock)
+bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
+			     int hdisplay, int clock)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
@@ -1049,7 +1050,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp) >> 4;
+							    pipe_bpp, 1) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1354,7 +1355,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
+int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i, num_bpc;
@@ -1454,10 +1455,11 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	return drm_dsc_compute_rc_parameters(vdsc_cfg);
 }
 
-static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
-				       struct intel_crtc_state *pipe_config,
-				       struct drm_connector_state *conn_state,
-				       struct link_config_limits *limits)
+int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
+				struct intel_crtc_state *pipe_config,
+				struct drm_connector_state *conn_state,
+				struct link_config_limits *limits,
+				int timeslots)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
@@ -1508,7 +1510,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 						    adjusted_mode->crtc_clock,
 						    adjusted_mode->crtc_hdisplay,
 						    pipe_config->bigjoiner_pipes,
-						    pipe_bpp);
+						    pipe_bpp,
+						    timeslots);
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
@@ -1520,27 +1523,13 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 			return -EINVAL;
 		}
 		pipe_config->dsc.compressed_bpp = min_t(u16,
-							       dsc_max_output_bpp >> 4,
-							       pipe_config->pipe_bpp);
+							dsc_max_output_bpp >> 4,
+							pipe_config->pipe_bpp);
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
+		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
+			    pipe_config->dsc.compressed_bpp,
+			    pipe_config->dsc.slice_count);
 	}
-
-	/* As of today we support DSC for only RGB */
-	if (intel_dp->force_dsc_bpp) {
-		if (intel_dp->force_dsc_bpp >= 8 &&
-		    intel_dp->force_dsc_bpp < pipe_bpp) {
-			drm_dbg_kms(&dev_priv->drm,
-				    "DSC BPP forced to %d",
-				    intel_dp->force_dsc_bpp);
-			pipe_config->dsc.compressed_bpp =
-						intel_dp->force_dsc_bpp;
-		} else {
-			drm_dbg_kms(&dev_priv->drm,
-				    "Invalid DSC BPP %d",
-				    intel_dp->force_dsc_bpp);
-		}
-	}
-
 	/*
 	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
 	 * is greater than the maximum Cdclock and if slice count is even
@@ -1548,13 +1537,13 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	 */
 	if (adjusted_mode->crtc_clock > dev_priv->display.cdclk.max_cdclk_freq ||
 	    pipe_config->bigjoiner_pipes) {
-		if (pipe_config->dsc.slice_count < 2) {
+		if (pipe_config->dsc.slice_count > 1) {
+			pipe_config->dsc.dsc_split = true;
+		} else {
 			drm_dbg_kms(&dev_priv->drm,
 				    "Cannot split stream to use 2 VDSC instances\n");
 			return -EINVAL;
 		}
-
-		pipe_config->dsc.dsc_split = true;
 	}
 
 	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
@@ -1643,7 +1632,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
 			    str_yes_no(intel_dp->force_dsc_en));
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
-						  conn_state, &limits);
+						  conn_state, &limits, 1);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index a54902c713a3..c6539a6915e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -56,6 +56,11 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder);
 int intel_dp_compute_config(struct intel_encoder *encoder,
 			    struct intel_crtc_state *pipe_config,
 			    struct drm_connector_state *conn_state);
+int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
+				struct intel_crtc_state *pipe_config,
+				struct drm_connector_state *conn_state,
+				struct link_config_limits *limits,
+				int timeslots);
 bool intel_dp_is_edp(struct intel_dp *intel_dp);
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
 bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
@@ -96,6 +101,18 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
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
index 72d63f293987..d73bd529cd6d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -144,6 +144,63 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	return 0;
 }
 
+static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
+						struct intel_crtc_state *crtc_state,
+						struct drm_connector_state *conn_state,
+						struct link_config_limits *limits)
+{
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
+					   DP_DPCD_QUIRK_CONSTANT_N);
+	int slots = -EINVAL;
+	int i, num_bpc;
+	u8 dsc_bpc[3] = {0};
+	int min_bpp, max_bpp;
+	u8 dsc_max_bpc;
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
+
+	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
+		    min_bpp, max_bpp);
+
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp,
+						     min_bpp, limits,
+						     conn_state, 2 * 3, true);
+
+	if (slots < 0)
+		return slots;
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
@@ -172,6 +229,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 				       struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_atomic_state *state = pipe_config->uapi.state;
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct intel_connector *connector =
@@ -220,6 +278,38 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	ret = intel_dp_mst_compute_link_config(encoder, pipe_config,
 					       conn_state, &limits);
+
+	if (ret == -EDEADLK)
+		return ret;
+
+	/*
+	 * We need to check if VCPI slots allocated can actually fit already
+	 * here, to decide whether we use DSC or not.
+	 * If either intel_dp_mst_compute_link_config or that one fails,
+	 * then we try DSC as last resort.
+	 */
+	if (!ret)
+		ret = drm_dp_mst_atomic_check(state);
+
+	/* enable compression if the mode doesn't fit available BW */
+	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
+	if (ret || intel_dp->force_dsc_en) {
+		/*
+		 * Try to get at least some timeslots and then see, if
+		 * we can fit there with DSC.
+		 */
+		drm_dbg_kms(&dev_priv->drm, "Trying to find VCPI slots in DSC mode\n");
+
+		ret = intel_dp_dsc_mst_compute_link_config(encoder, pipe_config,
+							   conn_state, &limits);
+		if (ret < 0)
+			return ret;
+
+		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
+						  conn_state, &limits,
+						  pipe_config->dp_m_n.tu);
+	}
+
 	if (ret)
 		return ret;
 
@@ -729,6 +819,10 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	int ret;
+	bool dsc = false, bigjoiner = false;
+	u16 dsc_max_output_bpp = 0;
+	u8 dsc_slice_count = 0;
+	int target_clock = mode->clock;
 
 	if (drm_connector_is_unregistered(connector)) {
 		*status = MODE_ERROR;
@@ -766,6 +860,48 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
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
 	*status = intel_mode_valid_max_plane_size(dev_priv, mode, false);
 	return 0;
 }
-- 
2.37.3

