Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E395E71597E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A656810E383;
	Tue, 30 May 2023 09:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E01E10E387;
 Tue, 30 May 2023 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437749; x=1716973749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CKyq19lgSdYcg10Xu69zwqdxvM34onNeUCk8m8bwVSo=;
 b=AZ6v1QvezWswY+cYpM4IpUwuSjKXd27bwAe8ci01C6aRqK22lHp1GB5l
 zfqkdvzJdoTj/pmy7zc3J+R2DaI5s8aJfscdVK4L6BOqVDRVIS5EQEbgQ
 k8S3Z81zaDHPLGud2be/SaxPt2jjNJ/e5FDMxNPVmbMD0/2HHC0TFOJJg
 atht9CzT1cB1eoieIFaIvhF3fFqF2dlAaPo7liLQjh1C6/cKD5ei3rBdt
 EVV+i2SBwiZYGesY68l6ml1+H/wvDmzQXTQ3c8AGEQbFXKWyKOdeBYLcK
 4ljrVWkpQ1gMO69wtM206xuSiMzvwozHDHNAJ4h6BTaYJATfUVTocM+2h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872570"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875041"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875041"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/13] drm/i915/sdvo: stop caching has_hdmi_monitor in
 struct intel_sdvo
Date: Tue, 30 May 2023 12:08:19 +0300
Message-Id: <3e9e1dcd554d470bdf474891a431b15e1880f9a0.1685437500.git.jani.nikula@intel.com>
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

Use the information stored in display info.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 34ee9dd82a78..5ce1fed84016 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -117,7 +117,6 @@ struct intel_sdvo {
 
 	enum port port;
 
-	bool has_hdmi_monitor;
 	bool has_hdmi_audio;
 
 	/* DDC bus used by this SDVO encoder */
@@ -1303,10 +1302,13 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 	pipe_config->clock_set = true;
 }
 
-static bool intel_has_hdmi_sink(struct intel_sdvo *sdvo,
+static bool intel_has_hdmi_sink(struct intel_sdvo_connector *intel_sdvo_connector,
 				const struct drm_connector_state *conn_state)
 {
-	return sdvo->has_hdmi_monitor &&
+	struct drm_connector *connector = conn_state->connector;
+
+	return intel_sdvo_connector->is_hdmi &&
+		connector->display_info.is_hdmi &&
 		READ_ONCE(to_intel_digital_connector_state(conn_state)->force_audio) != HDMI_AUDIO_OFF_DVI;
 }
 
@@ -1401,7 +1403,7 @@ static int intel_sdvo_compute_config(struct intel_encoder *encoder,
 	pipe_config->pixel_multiplier =
 		intel_sdvo_get_pixel_multiplier(adjusted_mode);
 
-	pipe_config->has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo, conn_state);
+	pipe_config->has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo_connector, conn_state);
 
 	pipe_config->has_audio =
 		intel_sdvo_has_audio(encoder, pipe_config, conn_state) &&
@@ -1907,7 +1909,7 @@ intel_sdvo_mode_valid(struct drm_connector *connector,
 	struct intel_sdvo_connector *intel_sdvo_connector =
 		to_intel_sdvo_connector(connector);
 	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
-	bool has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo, connector->state);
+	bool has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo_connector, connector->state);
 	int clock = mode->clock;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
@@ -2096,7 +2098,6 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			if (intel_sdvo_connector->is_hdmi) {
-				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
 			}
 		} else
@@ -2148,7 +2149,6 @@ intel_sdvo_detect(struct drm_connector *connector, bool force)
 
 	intel_sdvo->attached_output = response;
 
-	intel_sdvo->has_hdmi_monitor = false;
 	intel_sdvo->has_hdmi_audio = false;
 
 	if ((intel_sdvo_connector->output_flag & response) == 0)
-- 
2.39.2

