Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE1A1B011
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C5C10E8EB;
	Fri, 24 Jan 2025 05:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mw64wQqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0C10E8E7;
 Fri, 24 Jan 2025 05:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697652; x=1769233652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=olm9si69cixrbyBRNjpRNVjaxqTzPxPJphWRsksI/lE=;
 b=mw64wQqST5sM/yH/Lg2YzMJM+bwsn9a733sgFtkRw+z+llVQYxyoD1S8
 j3fCxbEeEyzOEWJSGcee2aseRf38G7DqwjCqYHZdGkUtOvG40kG0ZjskN
 gWPs51ZfK3g+LwWgmDXuLEz3mbM88C9CoTIEa7bCwGMDi1cK677SZKIky
 JLgRGhqAQOmfNNRmoutG/i5xFciTzf+Xndu0HMqXs0eCqEhgvqRfykEqy
 xELd7bqi3wd5jMwcEgkjD6OxqgFo0zchEgAkxcjrt3XbCTkT0+6h4d7PV
 vssXYaHqE/x3RNfm0RDv1fnf9M7Ecvw+9ME+58abwljsjB8pk83n5mUmb g==;
X-CSE-ConnectionGUID: 5LzYBM2sSlOFlcrGPIICUg==
X-CSE-MsgGUID: M0OyxHDtQ0SjTkWOXdZTSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429323"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429323"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:31 -0800
X-CSE-ConnectionGUID: igjqehyaQ2OxUBgKdqDnug==
X-CSE-MsgGUID: okOBeONhTzSwSVWozzAL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107526046"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/7] drm/i915/backlight: Setup NITS based brightness via VESA
Date: Fri, 24 Jan 2025 11:16:30 +0530
Message-Id: <20250124054631.1796456-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124054631.1796456-1-suraj.kandpal@intel.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify backlight setup function for VESA interface to take into
account the NITS based brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 97 +++++++++++--------
 1 file changed, 57 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index d794397656dd..d42f9a78a32b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -559,56 +559,73 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector, enum pipe pipe)
 {
 	struct intel_display *display = to_intel_display(connector);
+	struct drm_luminance_range_info *luminance_range =
+		&connector->base.display_info.luminance_range;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
 	u16 current_level;
 	u8 current_mode;
 	int ret;
 
-	ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
-				     panel->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
-				     &current_level, &current_mode);
-	if (ret < 0)
-		return ret;
-
-	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is controlled through %s\n",
-		    connector->base.base.id, connector->base.name,
-		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable));
-	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
-		    connector->base.base.id, connector->base.name,
-		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
-
-	if (!panel->backlight.edp.vesa.info.aux_set || !panel->backlight.edp.vesa.info.aux_enable) {
-		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
-		if (ret < 0) {
-			drm_err(display->drm,
-				"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
-				connector->base.base.id, connector->base.name, ret);
-			return ret;
-		}
-	}
-
-	if (panel->backlight.edp.vesa.info.aux_set) {
-		panel->backlight.max = panel->backlight.edp.vesa.info.max;
-		panel->backlight.min = 0;
-		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
-			panel->backlight.level = current_level;
-			panel->backlight.enabled = panel->backlight.level != 0;
+	if (panel->backlight.edp.vesa.nits_support) {
+		if (luminance_range->max_luminance) {
+			panel->backlight.max = luminance_range->max_luminance;
+			panel->backlight.min = luminance_range->min_luminance;
 		} else {
-			panel->backlight.level = panel->backlight.max;
-			panel->backlight.enabled = false;
+			panel->backlight.max = 512;
+			panel->backlight.min = 0;
 		}
+		panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, 0);
+		panel->backlight.enabled = panel->backlight.level != 0;
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
+			    connector->base.base.id, connector->base.name);
 	} else {
-		panel->backlight.max = panel->backlight.pwm_level_max;
-		panel->backlight.min = panel->backlight.pwm_level_min;
-		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
-			panel->backlight.level = panel->backlight.pwm_funcs->get(connector, pipe);
-			panel->backlight.enabled = panel->backlight.pwm_enabled;
+		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
+					     panel->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
+					     &current_level, &current_mode);
+		if (ret < 0)
+			return ret;
+
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is controlled through %s\n",
+			    connector->base.base.id, connector->base.name,
+			    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable));
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
+			    connector->base.base.id, connector->base.name,
+			    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
+
+		if (!panel->backlight.edp.vesa.info.aux_set || !panel->backlight.edp.vesa.info.aux_enable) {
+			ret = panel->backlight.pwm_funcs->setup(connector, pipe);
+			if (ret < 0) {
+				drm_err(display->drm,
+					"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
+					connector->base.base.id, connector->base.name, ret);
+				return ret;
+			}
+		}
+
+		if (panel->backlight.edp.vesa.info.aux_set) {
+			panel->backlight.max = panel->backlight.edp.vesa.info.max;
+			panel->backlight.min = 0;
+			if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
+				panel->backlight.level = current_level;
+				panel->backlight.enabled = panel->backlight.level != 0;
+			} else {
+				panel->backlight.level = panel->backlight.max;
+				panel->backlight.enabled = false;
+			}
 		} else {
-			panel->backlight.level = panel->backlight.max;
-			panel->backlight.enabled = false;
+			panel->backlight.max = panel->backlight.pwm_level_max;
+			panel->backlight.min = panel->backlight.pwm_level_min;
+			if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
+				panel->backlight.level = panel->backlight.pwm_funcs->get(connector, pipe);
+				panel->backlight.enabled = panel->backlight.pwm_enabled;
+			} else {
+				panel->backlight.level = panel->backlight.max;
+				panel->backlight.enabled = false;
+			}
 		}
 	}
 
-- 
2.34.1

