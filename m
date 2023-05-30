Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98440715975
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3610E34C;
	Tue, 30 May 2023 09:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6810E33F;
 Tue, 30 May 2023 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437740; x=1716973740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/9p/IFV/gh5kxchw3FbFztzPvm6FT7Y9c8G45Jdelo=;
 b=RxEhZdI5R2kxG1X9hPjpips/frnPmB78jPv4uAKGsL94QEJjJmE9YlX7
 dMFaTdsQakOCqGW8ce7Md0aP74TK91Vs+fKmReuPs9RPAlrn/I7gSQxvh
 l6Q3k2ir/KkTludycBqy+ftu8DpquyGVyBC+9QZmJupiEQZUmPqY3lOF3
 wQbYyemtUiQWKcQIQWgVLaDTs7FvuE+lO088hpsUEUud0tIEN2DiBjk7e
 dJWzX1EaZw+MSM1fN1H3NwFLuEt3aiWsBkyVTardPRPAMatB+SXOpypMS
 Ql48LASuOUph0y7M8N940hDXl72H3ZBDZ1Lh5SIbD2rcu+Gw8uByviyeW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335208794"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335208794"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850684587"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="850684587"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/i915/dp: stop caching has_audio in struct
 intel_dp
Date: Tue, 30 May 2023 12:08:15 +0300
Message-Id: <695bbe8b5ebee6e492f95a1c818da15691752dc8.1685437500.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h   | 1 -
 drivers/gpu/drm/i915/display/intel_dp.c              | 5 ++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 77caed2552d0..1416b82fc8a3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -237,7 +237,7 @@ static void intel_dp_info(struct seq_file *m,
 
 	seq_printf(m, "\tDPCD rev: %x\n", intel_dp->dpcd[DP_DPCD_REV]);
 	seq_printf(m, "\taudio support: %s\n",
-		   str_yes_no(intel_dp->has_audio));
+		   str_yes_no(intel_connector->base.display_info.has_audio));
 
 	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
 				edid ? edid->data : NULL, &intel_dp->aux);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 2d8297f8d088..94a59febc987 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1708,7 +1708,6 @@ struct intel_dp {
 	u8 sink_count;
 	bool link_trained;
 	bool has_hdmi_sink;
-	bool has_audio;
 	bool reset_link_params;
 	bool use_max_params;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4bec8cd7979f..aa1445ad9da8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2159,6 +2159,7 @@ static bool intel_dp_has_audio(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(conn_state);
 
@@ -2166,7 +2167,7 @@ static bool intel_dp_has_audio(struct intel_encoder *encoder,
 		return false;
 
 	if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
-		return intel_dp->has_audio;
+		return connector->base.display_info.has_audio;
 	else
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
@@ -4813,7 +4814,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	edid = drm_edid_raw(drm_edid);
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_dp->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
-		intel_dp->has_audio = drm_detect_monitor_audio(edid);
 	}
 
 	drm_dp_cec_set_edid(&intel_dp->aux, edid);
@@ -4829,7 +4829,6 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	connector->detect_edid = NULL;
 
 	intel_dp->has_hdmi_sink = false;
-	intel_dp->has_audio = false;
 
 	intel_dp->dfp.max_bpc = 0;
 	intel_dp->dfp.max_dotclock = 0;
-- 
2.39.2

