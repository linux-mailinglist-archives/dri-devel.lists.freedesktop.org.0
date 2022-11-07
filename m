Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD361EBAF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C929B10E1F6;
	Mon,  7 Nov 2022 07:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3B610E213;
 Mon,  7 Nov 2022 07:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805621; x=1699341621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2RYG04aAKQ7dHo/hLlD6msnR3G/O8uO2dEsIrfNsDw=;
 b=k/CEAWCDZgKIrW9huOalufP3o84gLdh8+pnHS9s/7WQP99Ynpx2zbM50
 r9HlLDAtiXvrMY4//EhLJYUqFGqAs1549aS32v6zy0rOA6JYCAqYsJac5
 beembkn9GQJ1F6m1LCWWkkl3gLgYycsgIfdH+mHcduFoHBQNm5RNCHflz
 54efibzjSJrEViXX4Mk1M3uO0gIc6TGypkqj1BB2WrebQp1IYxou36dRc
 g3IRGlj04pKDFximoVbfZ9ea9maQb/om8xpAzM+Cb/IZbopaITrUySTOo
 56UON9y7NV7WpeZ23iOiwAGWeRD+GfNeJI31Y9RwlVq2yBdUN8Hic0kbi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463346"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463346"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767255"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767255"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:19 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 05/15] drm/i915/hdmi21/mtl: Add new data members for FRL
 configuration
Date: Mon,  7 Nov 2022 12:50:35 +0530
Message-Id: <20221107072045.628895-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HDMI2.1 supports higher resolutions using Fixed Rate Link.
Source need to do FRL link training on the 4 lanes before video
stream transmission.

This patch adds the members to crtc_state and intel_hdmi for
identifying the FRL supporting HDMI sink and to maintain the frl
training information, after successful training.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  9 ++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 22 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c6abaaa46e17..e57fac00e945 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1517,8 +1517,17 @@ struct intel_hdmi {
 	} dp_dual_mode;
 	bool has_hdmi_sink;
 	bool has_audio;
+	bool has_sink_hdmi_21;
+	int max_frl_rate;
+	int max_dsc_frl_rate;
 	struct intel_connector *attached_connector;
 	struct cec_notifier *cec_notifier;
+	struct {
+		bool trained;
+		int lanes;
+		int rate_gbps;
+		int ffe_level;
+	} frl;
 };
 
 struct intel_dp_mst_encoder;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 02f8374ea51f..1dd0b0f2e2f1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2346,6 +2346,7 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 
 	intel_hdmi->has_hdmi_sink = false;
 	intel_hdmi->has_audio = false;
+	intel_hdmi->has_sink_hdmi_21 = false;
 
 	intel_hdmi->dp_dual_mode.type = DRM_DP_DUAL_MODE_NONE;
 	intel_hdmi->dp_dual_mode.max_tmds_clock = 0;
@@ -2405,11 +2406,21 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 	}
 }
 
+static void
+intel_hdmi_reset_frl_config(struct intel_hdmi *intel_hdmi)
+{
+	intel_hdmi->frl.trained = false;
+	intel_hdmi->frl.lanes = 0;
+	intel_hdmi->frl.rate_gbps = 0;
+	intel_hdmi->frl.ffe_level = 0;
+}
+
 static bool
 intel_hdmi_set_edid(struct drm_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
+	struct intel_encoder *encoder = &hdmi_to_dig_port(intel_hdmi)->base;
 	intel_wakeref_t wakeref;
 	struct edid *edid;
 	bool connected = false;
@@ -2431,10 +2442,21 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	to_intel_connector(connector)->detect_edid = edid;
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
+		int src_rate_lane_gbps = DIV_ROUND_UP(intel_bios_hdmi_max_frl_rate(encoder),
+						      1000000);
+		int max_src_rate = src_rate_lane_gbps * 4;
+
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
 		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
 
 		intel_hdmi_dp_dual_mode_detect(connector);
+		intel_hdmi->has_sink_hdmi_21 =
+			drm_hdmi_sink_max_frl_rate(connector) > 0 ? true : false;
+		intel_hdmi->max_frl_rate = min(drm_hdmi_sink_max_frl_rate(connector),
+					       max_src_rate);
+		intel_hdmi->max_dsc_frl_rate = min(drm_hdmi_sink_dsc_max_frl_rate(connector),
+						   max_src_rate);
+		intel_hdmi_reset_frl_config(intel_hdmi);
 
 		connected = true;
 	}
-- 
2.25.1

