Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89763873894
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F861131F5;
	Wed,  6 Mar 2024 14:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOGl/x+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0B1131F5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734265; x=1741270265;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=wJT0D1U5zza9Zw3XkMrI0WsrRuydS2WEuUz0uizt8Pg=;
 b=aOGl/x+sQdTWxe4PNytp9fpY7+BM+7naA67eRDsMC+HubJPZcPML5vGP
 dSQ0p5pO/+9KG/m9YOrq44Ppw6+wU7Cq6Vh7dW9zp/0FGzCy46Ll/tBGd
 4PcaPFNPesLiI3yjh9szrwabDv6Rp4UGloT2W3diNHkpk5vj4on0dn41O
 G30o9tIpTS4aNpgRO2b+tfubIc1YTXfbcmATYKFVc0srd2paYhRKjJ/iF
 qCP7twNlWnvBSaHGaHvU9BpIJuiS4C5P2YDu6W4tA62jcmt5uO5Q3p0hA
 k+lx8RH+M0UwXBRiOYV69v1QAdpadcnoId5nLhpYygZArWircCaj6vxeZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4465465"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4465465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:05 -0800
X-ExtLoopCount2: 2 from 10.252.33.211
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14429376"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:04 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 06 Mar 2024 16:11:01 +0200
Resent-Message-ID: <87ttljxxfu.fsf@intel.com>
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Mailbox Transport; Wed, 6 Mar 2024 06:07:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:07:29 -0800
Received: from fmviesa002.fm.intel.com (10.60.135.142) by
 orsmsx603.amr.corp.intel.com (10.22.229.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 06:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32915257"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211]) by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:07:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 "Arun R Murthy" <arun.r.murthy@intel.com>
Subject: [PATCH v3 2/6] drm/i915/mst: improve debug logging of DP MST mode
 detect
Date: Wed, 6 Mar 2024 16:07:13 +0200
Message-ID: <e7a8f15c34ac8d7452252aac9f951e5ec459aa4d.1709733981.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709733981.git.jani.nikula@intel.com>
References: <cover.1709733981.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: 7523dfbd-67e1-46a5-813a-08dc3de6c2c2
X-MS-Exchange-Organization-AuthSource: ORSMSX603.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.7877063
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2507.035
MIME-Version: 1.0
X-TUID: 8fObGfdrm5R+
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename intel_dp_can_mst() to intel_dp_mst_detect(), and move all DP MST
detect debug logging there. Debug log the sink's MST capability,
including single-stream sideband messaging support, and the decision
whether to enable MST mode or not. Do this regardless of whether we're
actually enabling MST or not.

We need to detect MST in intel_dp_detect_dpcd() before the earlier
returns, but try not to change the logic otherwise.

v2:
- Use "MST", "SST w/ sideband messaging", and "SST" for logging (Ville)
- Return MST mode from intel_dp_mst_detect()
- Do MST detect before early returns from intel_dp_detect_dpcd()

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 52 ++++++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 717d5715e7bf..cef65a300154 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4047,31 +4047,50 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 					   intel_dp->downstream_ports) == 0;
 }
 
-static bool
-intel_dp_can_mst(struct intel_dp *intel_dp)
+static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
+{
+	if (mst_mode == DRM_DP_MST)
+		return "MST";
+	else if (mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+		return "SST w/ sideband messaging";
+	else
+		return "SST";
+}
+
+static enum drm_dp_mst_mode
+intel_dp_mst_detect(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	enum drm_dp_mst_mode sink_mst_mode;
+	enum drm_dp_mst_mode mst_detect;
+
+	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+
+	if (i915->display.params.enable_dp_mst &&
+	    intel_dp_mst_source_support(intel_dp) &&
+	    sink_mst_mode == DRM_DP_MST)
+		mst_detect = DRM_DP_MST;
+	else
+		mst_detect = DRM_DP_SST;
 
-	return i915->display.params.enable_dp_mst &&
-		intel_dp_mst_source_support(intel_dp) &&
-		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
+	drm_dbg_kms(&i915->drm,
+		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
+		    encoder->base.base.id, encoder->base.name,
+		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
+		    intel_dp_mst_mode_str(sink_mst_mode),
+		    str_yes_no(i915->display.params.enable_dp_mst),
+		    intel_dp_mst_mode_str(mst_detect));
+
+	return mst_detect;
 }
 
 static void
 intel_dp_configure_mst(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	struct intel_encoder *encoder =
-		&dp_to_dig_port(intel_dp)->base;
 	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
 
-	drm_dbg_kms(&i915->drm,
-		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
-		    encoder->base.base.id, encoder->base.name,
-		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
-		    str_yes_no(sink_can_mst),
-		    str_yes_no(i915->display.params.enable_dp_mst));
-
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
 
@@ -5360,6 +5379,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum drm_dp_mst_mode mst_detect;
 	u8 *dpcd = intel_dp->dpcd;
 	u8 type;
 
@@ -5371,6 +5391,8 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 	if (!intel_dp_get_dpcd(intel_dp))
 		return connector_status_disconnected;
 
+	mst_detect = intel_dp_mst_detect(intel_dp);
+
 	/* if there's no downstream port, we're done */
 	if (!drm_dp_is_branch(dpcd))
 		return connector_status_connected;
@@ -5382,7 +5404,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		connector_status_connected : connector_status_disconnected;
 	}
 
-	if (intel_dp_can_mst(intel_dp))
+	if (mst_detect == DRM_DP_MST)
 		return connector_status_connected;
 
 	/* If no HPD, poke DDC gently */
-- 
2.39.2

