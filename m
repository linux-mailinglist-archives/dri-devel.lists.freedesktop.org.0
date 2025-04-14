Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA72A876D5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E006D10E4A7;
	Mon, 14 Apr 2025 04:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATsXoDkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95D010E4A5;
 Mon, 14 Apr 2025 04:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604260; x=1776140260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y2RE0DlsRvzqiBi7ZCh05grSqZ8BFfC4ACD+YVAWl/U=;
 b=ATsXoDkNsf0eoozVrxPJUI9xDAq0fcEbcu68G5kXyvr+tVVXQHBEBQGW
 l+8NBxZJ6cIPC+TC6C4OoZmh1/IL+DDMUb1EpinVx6y+DGzEXQ5QWeWtl
 d0HZQ9PXBwlsJVz53wabq0o/Wohm//u7S5M+SLH1TXmMifeQl+eF+fGFa
 KBgSI/6Fn62HrdbTg6UvsJmst/gY1IbCVqtI12qIcqyOfL7EBccdkSA8n
 VSMiTQNUBjOHMes4DkVRKaDpvi3iRYB2dyHUMCXz0nqK5Nh17WvFxIQJm
 szblgS3LIVVLh48g23zWQ8cuHJA8oaSOeia6chZqbK6UVAHR06gYTONL2 A==;
X-CSE-ConnectionGUID: TIXFcTbhTrmcXuurUOsqAA==
X-CSE-MsgGUID: DTsax3iJQkCUV+Mb7MUIsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070055"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:39 -0700
X-CSE-ConnectionGUID: 5owyRcqqQ6Kxfwk//5TvfA==
X-CSE-MsgGUID: 483rWH4FQ2KxEiLQk8r6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658119"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:38 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize edp
 backlight
Date: Mon, 14 Apr 2025 09:46:35 +0530
Message-Id: <20250414041637.128039-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414041637.128039-1-suraj.kandpal@intel.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
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
index be740fb72ebc..2eff9b545390 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -585,9 +585,36 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
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
@@ -596,57 +623,28 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
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

