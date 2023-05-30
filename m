Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7EC71597F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED0C10E376;
	Tue, 30 May 2023 09:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D3A10E386;
 Tue, 30 May 2023 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437753; x=1716973753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G40JUlWrd6QdGQ7Y8fZ1hiUD3Qu6LHnQA99GFGpTX/Y=;
 b=QlX+XXRETX+wDBAkvf7mCccHOkFzWGCaT70v9WEZEGbz1H4M09R332TI
 SlYqrfelBKe6DshB8tBubaQmJfEaCNxIxes9nIQjZ3KpSEat4PwVSE9hL
 u7AY6JgDHrgtWuYzl/yz8TG3BRzrsBunxWQUJjHRzHS/UZriC6CJHSEt7
 7Or1CpYdXk+yFBUgSQuaqCl15RclTvtKoVeQJJzU9hV3WGB+KlEJ/+3HG
 Hxkc3mmidscQpLSBnf8Xz1k7miqbphJhmibHd21ZuxykteqoDcJH3y1nt
 dS1ES7vgH2TptLNwMOtGDgOTzCKxIv0DxKXdCkNhO3XnD/B7g7t8VPtY8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872585"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872585"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875087"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875087"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/13] drm/i915/sdvo: stop caching has_hdmi_audio in struct
 intel_sdvo
Date: Tue, 30 May 2023 12:08:20 +0300
Message-Id: <1e02f2f7381dfcee6e4160a5fc17aea6ff04baf9.1685437500.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_sdvo.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 5ce1fed84016..2d1b19f73883 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -117,8 +117,6 @@ struct intel_sdvo {
 
 	enum port port;
 
-	bool has_hdmi_audio;
-
 	/* DDC bus used by this SDVO encoder */
 	u8 ddc_bus;
 
@@ -1328,7 +1326,9 @@ static bool intel_sdvo_has_audio(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state)
 {
-	struct intel_sdvo *intel_sdvo = to_sdvo(encoder);
+	struct drm_connector *connector = conn_state->connector;
+	struct intel_sdvo_connector *intel_sdvo_connector =
+		to_intel_sdvo_connector(connector);
 	const struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(conn_state);
 
@@ -1336,7 +1336,8 @@ static bool intel_sdvo_has_audio(struct intel_encoder *encoder,
 		return false;
 
 	if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
-		return intel_sdvo->has_hdmi_audio;
+		return intel_sdvo_connector->is_hdmi &&
+			connector->display_info.has_audio;
 	else
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
@@ -2057,8 +2058,6 @@ static enum drm_connector_status
 intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 {
 	struct intel_sdvo *intel_sdvo = intel_attached_sdvo(to_intel_connector(connector));
-	struct intel_sdvo_connector *intel_sdvo_connector =
-		to_intel_sdvo_connector(connector);
 	enum drm_connector_status status;
 	struct edid *edid;
 
@@ -2095,12 +2094,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 	status = connector_status_unknown;
 	if (edid != NULL) {
 		/* DDC bus is shared, match EDID to connector type */
-		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+		if (edid->input & DRM_EDID_INPUT_DIGITAL)
 			status = connector_status_connected;
-			if (intel_sdvo_connector->is_hdmi) {
-				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
-			}
-		} else
+		else
 			status = connector_status_disconnected;
 		kfree(edid);
 	}
@@ -2149,8 +2145,6 @@ intel_sdvo_detect(struct drm_connector *connector, bool force)
 
 	intel_sdvo->attached_output = response;
 
-	intel_sdvo->has_hdmi_audio = false;
-
 	if ((intel_sdvo_connector->output_flag & response) == 0)
 		ret = connector_status_disconnected;
 	else if (IS_TMDS(intel_sdvo_connector))
-- 
2.39.2

