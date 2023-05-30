Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6071597A
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271110E37B;
	Tue, 30 May 2023 09:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962B810E371;
 Tue, 30 May 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437743; x=1716973743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvBQkcLY38A0X5ssyV8uuRAV4penhDPOWYZTPpbFkxM=;
 b=GCL+8RIV8JdcaEO7c1DJu5LXmz7lXkSvlUX05SfhbMxAgplG6/2NyOp8
 jiPy/Mnq4CbcmRYPYk3ieyVZKRmcIBpKj22IvQkWFJUbuGNxPBgEqs3MW
 ci0o2hY1bGAh3WPbN88PB63WHFQf4wneZlt7uvrusXRR90G197v1NCc2c
 rk4RuXC0R7PLt4fAH8d/X9WK6ieoH/q2i/xGoATlTbKuW567RlCpHl6kT
 g4mUJHhrsP3RvrSbjLNPNxrHSwJh8jlCvmv+MaysQeeatSxZWmUqk/3y+
 hyQzxoLOdGgxojXD+eIpz7ecsr2/TX/co7SY6f6uVKljnLErrZyZx9Av8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335208832"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335208832"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850684674"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="850684674"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/13] drm/i915/dp: stop caching has_hdmi_sink in struct
 intel_dp
Date: Tue, 30 May 2023 12:08:16 +0300
Message-Id: <748103fda572b3552e5bbdafb300d8508d4eeaf4.1685437500.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the information stored in display info. Add intel_dp_has_hdmi_sink()
helper to access it.

v2: Rebased

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  6 +++---
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c       | 21 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d1a9a3cf94b5..70d44edd8c6e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2801,7 +2801,7 @@ static void intel_ddi_pre_enable(struct intel_atomic_state *state,
 
 		/* FIXME precompute everything properly */
 		/* FIXME how do we turn infoframes off again? */
-		if (dig_port->lspcon.active && dig_port->dp.has_hdmi_sink)
+		if (dig_port->lspcon.active && intel_dp_has_hdmi_sink(&dig_port->dp))
 			dig_port->set_infoframes(encoder,
 						 crtc_state->has_infoframe,
 						 crtc_state, conn_state);
@@ -3110,7 +3110,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 	drm_connector_update_privacy_screen(conn_state);
 	intel_edp_backlight_on(crtc_state, conn_state);
 
-	if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
+	if (!dig_port->lspcon.active || intel_dp_has_hdmi_sink(&dig_port->dp))
 		intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 
 	intel_audio_codec_enable(encoder, crtc_state, conn_state);
@@ -3738,7 +3738,7 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 				    pipe_config->fec_enable);
 		}
 
-		if (dig_port->lspcon.active && dig_port->dp.has_hdmi_sink)
+		if (dig_port->lspcon.active && intel_dp_has_hdmi_sink(&dig_port->dp))
 			pipe_config->infoframes.enable |=
 				intel_lspcon_infoframes_enabled(encoder, pipe_config);
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 94a59febc987..c5bd0c7be2fa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1707,7 +1707,6 @@ struct intel_dp {
 	u8 lane_count;
 	u8 sink_count;
 	bool link_trained;
-	bool has_hdmi_sink;
 	bool reset_link_params;
 	bool use_max_params;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index aa1445ad9da8..8445a37d9d01 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1287,6 +1287,13 @@ void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
 	}
 }
 
+bool intel_dp_has_hdmi_sink(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	return connector->base.display_info.is_hdmi;
+}
+
 static bool intel_dp_source_supports_fec(struct intel_dp *intel_dp,
 					 const struct intel_crtc_state *pipe_config)
 {
@@ -1342,7 +1349,7 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 
 	for (; bpc >= 8; bpc -= 2) {
 		if (intel_hdmi_bpc_possible(crtc_state, bpc,
-					    intel_dp->has_hdmi_sink) &&
+					    intel_dp_has_hdmi_sink(intel_dp)) &&
 		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state->sink_format,
 					      respect_downstream_limits) == MODE_OK)
 			return bpc;
@@ -2732,7 +2739,7 @@ static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
 static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp)
 {
 	if (drm_dp_is_branch(intel_dp->dpcd) &&
-	    intel_dp->has_hdmi_sink &&
+	    intel_dp_has_hdmi_sink(intel_dp) &&
 	    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
 		return true;
 
@@ -2900,13 +2907,12 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 	if (!drm_dp_is_branch(intel_dp->dpcd))
 		return;
 
-	tmp = intel_dp->has_hdmi_sink ?
-		DP_HDMI_DVI_OUTPUT_CONFIG : 0;
+	tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
 
 	if (drm_dp_dpcd_writeb(&intel_dp->aux,
 			       DP_PROTOCOL_CONVERTER_CONTROL_0, tmp) != 1)
 		drm_dbg_kms(&i915->drm, "Failed to %s protocol converter HDMI mode\n",
-			    str_enable_disable(intel_dp->has_hdmi_sink));
+			    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
 
 	if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		switch (crtc_state->output_format) {
@@ -4812,9 +4818,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 
 	/* FIXME: Get rid of drm_edid_raw() */
 	edid = drm_edid_raw(drm_edid);
-	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
-		intel_dp->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
-	}
 
 	drm_dp_cec_set_edid(&intel_dp->aux, edid);
 }
@@ -4828,8 +4831,6 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	drm_edid_free(connector->detect_edid);
 	connector->detect_edid = NULL;
 
-	intel_dp->has_hdmi_sink = false;
-
 	intel_dp->dfp.max_bpc = 0;
 	intel_dp->dfp.max_dotclock = 0;
 	intel_dp->dfp.min_tmds_clock = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 5f86157a10d2..22099de3ca45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -65,6 +65,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct link_config_limits *limits,
 				int timeslots,
 				bool recompute_pipe_bpp);
+bool intel_dp_has_hdmi_sink(struct intel_dp *intel_dp);
 bool intel_dp_is_edp(struct intel_dp *intel_dp);
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
 bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
-- 
2.39.2

