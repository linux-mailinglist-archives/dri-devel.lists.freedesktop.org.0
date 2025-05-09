Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D0AB099C
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D9510E9A9;
	Fri,  9 May 2025 05:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHF5QsG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4996E10E9A4;
 Fri,  9 May 2025 05:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767948; x=1778303948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J77Y09VuLDdmOOv/tRwx3JQ/EXovAFvHk66t3D091BI=;
 b=GHF5QsG2pKtBVQc8arWL9U2YREIV1JG1d02r4fVDQv7pl2Sxaf2F1kzA
 fzWLdi0UQ/ZFHwT/tPY/ezIOERdkLFR9unnuYZfEXMbp/pF0gdXPutsud
 V+fOsiGH/1E2gfHqYtMGkBm+kpiGaD+N8B60DnVNSKK0Rbr1VLoeBnHmk
 LqHh4Ua8utww+eHTJeMjm/MlBpb9nMY/+F6IZgLh++W4iLAySiWvmw5Bf
 Xw36LGVyYfFxvJi6U1T9ynAfqEt0c5nkwwmgt1uKSggNr0KAEr6WmNjEJ
 zywXYvQDvzp96aFg2zQcRtk/7GWMwX6sEN8yK+EXqJba5LBhHL2QwsFYz w==;
X-CSE-ConnectionGUID: HUmvCCxVQ3GLa2OPgevMTg==
X-CSE-MsgGUID: mlX7rbIrT8+uoSytsOXfxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287157"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:07 -0700
X-CSE-ConnectionGUID: UuVFYMotQE+z1e5A0ABr4g==
X-CSE-MsgGUID: b268ktb9RGm2GPJKsgan0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414944"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:19:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize edp
 backlight
Date: Fri,  9 May 2025 10:48:14 +0530
Message-Id: <20250509051816.1244486-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509051816.1244486-1-suraj.kandpal@intel.com>
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
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

Now that drm_edp_backlight init has been to be able to setup
brightness manipulation via luminance we can just use that.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 100 +++++++++---------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 5441a7199102..b97f778d420e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -584,9 +584,36 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	u8 current_mode;
 	int ret;
 
-	if (panel->backlight.edp.vesa.luminance_control_support) {
+	ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
+				     luminance_range, panel->vbt.backlight.pwm_freq_hz,
+				     intel_dp->edp_dpcd, &current_level, &current_mode, true);
+	if (ret < 0)
+		return ret;
+
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is controlled through %s\n",
+		    connector->base.base.id, connector->base.name,
+		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable));
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
+		    connector->base.base.id, connector->base.name,
+		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
+
+	if (!panel->backlight.edp.vesa.info.luminance_set ||
+	    !panel->backlight.edp.vesa.info.aux_set ||
+	    !panel->backlight.edp.vesa.info.aux_enable) {
+		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
+		if (ret < 0) {
+			drm_err(display->drm,
+				"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
+				connector->base.base.id, connector->base.name, ret);
+			return ret;
+		}
+	}
+
+	if (panel->backlight.edp.vesa.info.luminance_set) {
 		if (luminance_range->max_luminance) {
-			panel->backlight.max = luminance_range->max_luminance;
+			panel->backlight.max = panel->backlight.edp.vesa.info.max;
 			panel->backlight.min = luminance_range->min_luminance;
 		} else {
 			panel->backlight.max = 512;
@@ -595,57 +622,28 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, 0);
 		panel->backlight.enabled = panel->backlight.level != 0;
 		drm_dbg_kms(display->drm,
-			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
-			    connector->base.base.id, connector->base.name);
-	} else {
-		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
-					     luminance_range, panel->vbt.backlight.pwm_freq_hz,
-					     intel_dp->edp_dpcd, &current_level, &current_mode,
-					     false);
-		if (ret < 0)
-			return ret;
-
-		drm_dbg_kms(display->drm,
-			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is controlled through %s\n",
-			    connector->base.base.id, connector->base.name,
-			    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable));
-		drm_dbg_kms(display->drm,
-			    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
-			    connector->base.base.id, connector->base.name,
-			    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
-
-		if (!panel->backlight.edp.vesa.info.aux_set ||
-		    !panel->backlight.edp.vesa.info.aux_enable) {
-			ret = panel->backlight.pwm_funcs->setup(connector, pipe);
-			if (ret < 0) {
-				drm_err(display->drm,
-					"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
-					connector->base.base.id, connector->base.name, ret);
-				return ret;
-			}
+		    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
+		    connector->base.base.id, connector->base.name);
+	} else if (panel->backlight.edp.vesa.info.aux_set) {
+		panel->backlight.max = panel->backlight.edp.vesa.info.max;
+		panel->backlight.min = 0;
+		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
+			panel->backlight.level = current_level;
+			panel->backlight.enabled = panel->backlight.level != 0;
+		} else {
+			panel->backlight.level = panel->backlight.max;
+			panel->backlight.enabled = false;
 		}
-
-		if (panel->backlight.edp.vesa.info.aux_set) {
-			panel->backlight.max = panel->backlight.edp.vesa.info.max;
-			panel->backlight.min = 0;
-			if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
-				panel->backlight.level = current_level;
-				panel->backlight.enabled = panel->backlight.level != 0;
-			} else {
-				panel->backlight.level = panel->backlight.max;
-				panel->backlight.enabled = false;
-			}
+	} else {
+		panel->backlight.max = panel->backlight.pwm_level_max;
+		panel->backlight.min = panel->backlight.pwm_level_min;
+		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
+			panel->backlight.level =
+				panel->backlight.pwm_funcs->get(connector, pipe);
+			panel->backlight.enabled = panel->backlight.pwm_enabled;
 		} else {
-			panel->backlight.max = panel->backlight.pwm_level_max;
-			panel->backlight.min = panel->backlight.pwm_level_min;
-			if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
-				panel->backlight.level =
-					panel->backlight.pwm_funcs->get(connector, pipe);
-				panel->backlight.enabled = panel->backlight.pwm_enabled;
-			} else {
-				panel->backlight.level = panel->backlight.max;
-				panel->backlight.enabled = false;
-			}
+			panel->backlight.level = panel->backlight.max;
+			panel->backlight.enabled = false;
 		}
 	}
 
-- 
2.34.1

