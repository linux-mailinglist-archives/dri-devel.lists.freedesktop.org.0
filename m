Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEBB614712
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BCA10E361;
	Tue,  1 Nov 2022 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1910E358;
 Tue,  1 Nov 2022 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667295759; x=1698831759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8JSRDJCm010DA4+4KDg44O9TJhareRe28jv7wP/cf0=;
 b=VseOsj7ct8Xk2jrAkMcsMwLCLQzd6jlClTWCJdKHHAQwvjth/7nZyLVw
 gLlW/51PS5maiE52UAW8xNbzZHX4Pr14FawXOo8oI9VrFdWaIH9HT1gEx
 /0kHFoKf2z/fEfU+oAXuyQf/wFLSyFjDtBkh6S3MToZHZFeIkrB5om+7B
 cUCw8mEGuOE/obqMak+WhixuE+NoL6j3GJ0h8+4JmbRVI+IVFNjDOS12X
 1aHe6PKiRSA/roUKouoUK8hTnG37A/GJd9ck+G0XoYhN8IHUgLedkJ9OD
 lGhVM77eIId40zACZdlzpKzfZvEq1Vimvh2GwZacAGqCwzIfz/eXY8yN4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="373317448"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="373317448"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963076316"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="963076316"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 02:42:36 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915: Bpp/timeslot calculation fixes for DP MST DSC
Date: Tue,  1 Nov 2022 11:42:22 +0200
Message-Id: <20221101094222.22091-7-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101094222.22091-1-stanislav.lisovskiy@intel.com>
References: <20221101094222.22091-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix intel_dp_dsc_compute_config, previously timeslots parameter
was used in fact not as a timeslots, but more like a ratio
timeslots/64, which of course didn't have any effect for SST DSC,
but causes now issues for MST DSC.
Secondly we need to calculate pipe_bpp using intel_dp_dsc_compute_bpp
only for SST DSC case, while for MST case it has been calculated
earlier already with intel_dp_dsc_mst_compute_link_config.
Third we also were wrongly determining sink min bpp/max bpp, those
limites should be intersected with our limits to find common
acceptable bpp's, plus on top of that we should align those with
VESA bpps and only then calculate required timeslots amount.
Some MST hubs started to work only after third change was made.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 52 ++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.h     |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 65 +++++++++++++++++----
 3 files changed, 88 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 71e08e665065..706fa4f7ea62 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -717,9 +717,14 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	 * for SST -> TimeSlotsPerMTP is 1,
 	 * for MST -> TimeSlotsPerMTP has to be calculated
 	 */
-	bits_per_pixel = (link_clock * lane_count * 8) * timeslots /
-			 intel_dp_mode_to_fec_clock(mode_clock);
-	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
+	bits_per_pixel = DIV_ROUND_UP((link_clock * lane_count) * timeslots,
+				      intel_dp_mode_to_fec_clock(mode_clock) * 8);
+
+	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
+				"total bw %u pixel clock %u\n",
+				bits_per_pixel, timeslots,
+				(link_clock * lane_count * 8),
+				intel_dp_mode_to_fec_clock(mode_clock));
 
 	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
 	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) /
@@ -1048,7 +1053,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp, 1) >> 4;
+							    pipe_bpp, 64) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1482,7 +1487,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
 				struct link_config_limits *limits,
-				int timeslots)
+				int timeslots,
+				bool compute_pipe_bpp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
@@ -1497,7 +1503,10 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
 		return -EINVAL;
 
-	pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
+	if (compute_pipe_bpp)
+		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
+	else
+		pipe_bpp = pipe_config->pipe_bpp;
 
 	if (intel_dp->force_dsc_bpc) {
 		pipe_bpp = intel_dp->force_dsc_bpc * 3;
@@ -1531,28 +1540,31 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		u16 dsc_max_output_bpp;
 		u8 dsc_dp_slice_count;
 
-		dsc_max_output_bpp =
-			intel_dp_dsc_get_output_bpp(dev_priv,
-						    pipe_config->port_clock,
-						    pipe_config->lane_count,
-						    adjusted_mode->crtc_clock,
-						    adjusted_mode->crtc_hdisplay,
-						    pipe_config->bigjoiner_pipes,
-						    pipe_bpp,
-						    timeslots);
+		if (compute_pipe_bpp) {
+			dsc_max_output_bpp =
+				intel_dp_dsc_get_output_bpp(dev_priv,
+							    pipe_config->port_clock,
+							    pipe_config->lane_count,
+							    adjusted_mode->crtc_clock,
+							    adjusted_mode->crtc_hdisplay,
+							    pipe_config->bigjoiner_pipes,
+							    pipe_bpp,
+							    timeslots);
+		}
 		dsc_dp_slice_count =
 			intel_dp_dsc_get_slice_count(intel_dp,
 						     adjusted_mode->crtc_clock,
 						     adjusted_mode->crtc_hdisplay,
 						     pipe_config->bigjoiner_pipes);
-		if (!dsc_max_output_bpp || !dsc_dp_slice_count) {
+		if ((!dsc_max_output_bpp && compute_pipe_bpp) || !dsc_dp_slice_count) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "Compressed BPP/Slice Count not supported\n");
 			return -EINVAL;
 		}
-		pipe_config->dsc.compressed_bpp = min_t(u16,
-							dsc_max_output_bpp >> 4,
-							pipe_config->pipe_bpp);
+		if (compute_pipe_bpp)
+			pipe_config->dsc.compressed_bpp = min_t(u16,
+								dsc_max_output_bpp >> 4,
+								pipe_config->pipe_bpp);
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
 		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
 			    pipe_config->dsc.compressed_bpp,
@@ -1660,7 +1672,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
 			    str_yes_no(intel_dp->force_dsc_en));
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
-						  conn_state, &limits, 1);
+						  conn_state, &limits, 1, true);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0fe10d93b75c..75098001685a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -60,7 +60,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
 				struct link_config_limits *limits,
-				int timeslots);
+				int timeslots,
+				bool recompute_pipe_bpp);
 bool intel_dp_is_edp(struct intel_dp *intel_dp);
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
 bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 61b2bd504e80..5b081659ca7a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -80,12 +80,12 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	}
 
 	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
-		crtc_state->pipe_bpp = bpp;
-
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       dsc ? bpp << 4 : crtc_state->pipe_bpp,
+						       dsc ? bpp << 4 : bpp,
 						       dsc);
 
+		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
+
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
 						      crtc_state->pbn);
@@ -110,6 +110,13 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	if (slots < 0)
 		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
 			    slots);
+        else {
+                if (!dsc)
+			crtc_state->pipe_bpp = bpp;
+		else
+			crtc_state->dsc.compressed_bpp = bpp;
+		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
+	}
 
 	return slots;
 }
@@ -157,8 +164,10 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	int slots = -EINVAL;
 	int i, num_bpc;
 	u8 dsc_bpc[3] = {0};
-	int min_bpp, max_bpp;
+	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
 	u8 dsc_max_bpc;
+	bool need_timeslot_recalc = false;
+	u32 last_compressed_bpp;
 
 	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
 	if (DISPLAY_VER(i915) >= 12)
@@ -171,14 +180,26 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 
 	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
 						       dsc_bpc);
-	for (i = 0; i < num_bpc; i++) {
-		if (max_bpp >= dsc_bpc[i] * 3)
-			if (min_bpp > dsc_bpc[i] * 3)
-				min_bpp = dsc_bpc[i] * 3;
+
+	drm_dbg_kms(&i915->drm, "DSC Source supported min bpp %d max bpp %d\n",
+		    min_bpp, max_bpp);
+
+	sink_min_bpp = sink_max_bpp = dsc_bpc[0] * 3;
+	for (i = 1; i < num_bpc; i++) {
+		if (sink_min_bpp > dsc_bpc[i] * 3)
+			sink_min_bpp = dsc_bpc[i] * 3;
+		if (sink_max_bpp < dsc_bpc[i] * 3)
+			sink_max_bpp = dsc_bpc[i] * 3;
 	}
 
 	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
-		    min_bpp, max_bpp);
+		    sink_min_bpp, sink_max_bpp);
+
+	if (min_bpp < sink_min_bpp)
+		min_bpp = sink_min_bpp;
+
+	if (max_bpp > sink_max_bpp)
+		max_bpp = sink_max_bpp;
 
 	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp,
 						     min_bpp, limits,
@@ -187,6 +208,28 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	if (slots < 0)
 		return slots;
 
+	last_compressed_bpp = crtc_state->dsc.compressed_bpp;
+
+	crtc_state->dsc.compressed_bpp = intel_dp_dsc_nearest_vesa_bpp(i915,
+								       last_compressed_bpp,
+								       crtc_state->pipe_bpp);
+
+	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
+		need_timeslot_recalc = true;
+
+	/*
+	 * Apparently some MST hubs dislike if vcpi slots are not matching precisely
+	 * the actual compressed bpp we use.
+	 */
+	if (need_timeslot_recalc) {
+		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
+							     crtc_state->dsc.compressed_bpp,
+							     crtc_state->dsc.compressed_bpp,
+							     limits, conn_state, 2 * 3, true);
+		if (slots < 0)
+			return slots;
+	}
+
 	intel_link_compute_m_n(crtc_state->pipe_bpp,
 			       crtc_state->lane_count,
 			       adjusted_mode->crtc_clock,
@@ -293,7 +336,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
 						  conn_state, &limits,
-						  pipe_config->dp_m_n.tu);
+						  pipe_config->dp_m_n.tu, false);
 	}
 
 	if (ret)
@@ -868,7 +911,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp, 1) >> 4;
+							    pipe_bpp, 64) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
-- 
2.37.3

