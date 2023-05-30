Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2071597C
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449810E39B;
	Tue, 30 May 2023 09:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC41C10E34C;
 Tue, 30 May 2023 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437742; x=1716973742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=77vcAcD6KQ3j1mA3oPBvhMWh/vmKaglU2flqouNsgic=;
 b=bwnwU3n2xUxsgQGW8cNnrD8OP669m3tqmGWfkZknnyTJ7fjavDWPMC1O
 d8FVNIPFlfmNySFGskMW7unAbMLD/zgq3G92yQCqORvUUI0Wz7VNmy3+P
 xyfgzZ6z82fcY30wX28y7NfN6c9f6LIppGTJRNCJfh3He40m/x8jHDCfz
 Pi3NAiexV8z/YHT3ZrKYuKSLjz2ItnClBdufPncwmJL1V1Vx2jUII69kL
 odPdxEUZS+MHTxFWkBLecqFVzxuQ4N7CdTnB1zxKuFaprD8CTPuiTD7sE
 Cy2q2XVpBIu2H19rvZS97ITGUUYq/rJEiG/Ae05ymFYtyLg8C39D5v/9P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441218631"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="441218631"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="1036516317"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="1036516317"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/13] drm/i915/hdmi: stop caching has_hdmi_sink in struct
 intel_hdmi
Date: Tue, 30 May 2023 12:08:18 +0300
Message-Id: <5cdb4731260b062c0f0ad2f8b64195c9a57bcb76.1685437500.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 8 +++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1ae1519087cb..731f2ec04d5c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1586,7 +1586,6 @@ struct intel_hdmi {
 		enum drm_dp_dual_mode_type type;
 		int max_tmds_clock;
 	} dp_dual_mode;
-	bool has_hdmi_sink;
 	struct intel_connector *attached_connector;
 	struct cec_notifier *cec_notifier;
 };
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 89a6b574f95a..7ac5e6c5e00d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1790,7 +1790,9 @@ static int intel_hdmi_source_max_tmds_clock(struct intel_encoder *encoder)
 static bool intel_has_hdmi_sink(struct intel_hdmi *hdmi,
 				const struct drm_connector_state *conn_state)
 {
-	return hdmi->has_hdmi_sink &&
+	struct intel_connector *connector = hdmi->attached_connector;
+
+	return connector->base.display_info.is_hdmi &&
 		READ_ONCE(to_intel_digital_connector_state(conn_state)->force_audio) != HDMI_AUDIO_OFF_DVI;
 }
 
@@ -2385,8 +2387,6 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 {
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 
-	intel_hdmi->has_hdmi_sink = false;
-
 	intel_hdmi->dp_dual_mode.type = DRM_DP_DUAL_MODE_NONE;
 	intel_hdmi->dp_dual_mode.max_tmds_clock = 0;
 
@@ -2478,8 +2478,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	/* FIXME: Get rid of drm_edid_raw() */
 	edid = drm_edid_raw(drm_edid);
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
-		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
-
 		intel_hdmi_dp_dual_mode_detect(connector);
 
 		connected = true;
-- 
2.39.2

