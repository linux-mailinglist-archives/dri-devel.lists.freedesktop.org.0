Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081B71597B
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908B410E37D;
	Tue, 30 May 2023 09:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FB710E371;
 Tue, 30 May 2023 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437744; x=1716973744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7R7tChulKB0NpcFjXhU1p5E+RLEhTGiZpGdryRmWh0c=;
 b=BYu6IoRuWL8wFUZpf3ZjZU6I4ZHBbNp+Owep4EVc7sqVlBSABbe3pmio
 RIZgcwTRAeL8ZH975+ihiYHnHiXVZXznLnsjROHdM7sdWM4kmlRilhsWA
 epQGwJv3TMMV57yvRUtlo3JfYx4IT8KaBcqIRZyKUDJIdyI6htm0B4pF6
 hnMNSs8HutIrsas/BJiVbXCnzq/Snas5dZjK1udwQHlevPAwiea1OYl+u
 wZKQc32rY6dj3XtDKDoeJ/3lwlTemmAQFxAyYdICgMmAtdMg7YbQQpn/c
 2++SY3so0GVHSYYH9EEpTnTTQuRJXn5IL1ZSfSsE3qJIDHFbWPxdTKkZR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335208846"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335208846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850684695"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="850684695"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/13] drm/i915/hdmi: stop caching has_audio in struct
 intel_hdmi
Date: Tue, 30 May 2023 12:08:17 +0300
Message-Id: <710286536d6b07ba8aa068b65b2b2c0c7743220e.1685437500.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 8 +++-----
 drivers/gpu/drm/i915/display/intel_display_types.h   | 1 -
 drivers/gpu/drm/i915/display/intel_hdmi.c            | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 1416b82fc8a3..2a4df62692a6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -252,13 +252,11 @@ static void intel_dp_mst_info(struct seq_file *m,
 }
 
 static void intel_hdmi_info(struct seq_file *m,
-			    struct intel_connector *intel_connector)
+			    struct intel_connector *connector)
 {
-	struct intel_encoder *intel_encoder = intel_attached_encoder(intel_connector);
-	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(intel_encoder);
+	bool has_audio = connector->base.display_info.has_audio;
 
-	seq_printf(m, "\taudio support: %s\n",
-		   str_yes_no(intel_hdmi->has_audio));
+	seq_printf(m, "\taudio support: %s\n", str_yes_no(has_audio));
 }
 
 static void intel_connector_info(struct seq_file *m,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c5bd0c7be2fa..1ae1519087cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1587,7 +1587,6 @@ struct intel_hdmi {
 		int max_tmds_clock;
 	} dp_dual_mode;
 	bool has_hdmi_sink;
-	bool has_audio;
 	struct intel_connector *attached_connector;
 	struct cec_notifier *cec_notifier;
 };
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c2464f98c76e..89a6b574f95a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2169,7 +2169,7 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state)
 {
-	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct drm_connector *connector = conn_state->connector;
 	const struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(conn_state);
 
@@ -2177,7 +2177,7 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
 		return false;
 
 	if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
-		return intel_hdmi->has_audio;
+		return connector->display_info.has_audio;
 	else
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
@@ -2386,7 +2386,6 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 
 	intel_hdmi->has_hdmi_sink = false;
-	intel_hdmi->has_audio = false;
 
 	intel_hdmi->dp_dual_mode.type = DRM_DP_DUAL_MODE_NONE;
 	intel_hdmi->dp_dual_mode.max_tmds_clock = 0;
@@ -2479,7 +2478,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	/* FIXME: Get rid of drm_edid_raw() */
 	edid = drm_edid_raw(drm_edid);
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
-		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
 		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
 
 		intel_hdmi_dp_dual_mode_detect(connector);
-- 
2.39.2

