Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C299AE1402
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED7310EB11;
	Fri, 20 Jun 2025 06:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFf0M00h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D4D10EB10;
 Fri, 20 Jun 2025 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401349; x=1781937349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0c+y7c6uBdskf+2qDfcpAqrZoitBmaRLQeF17Wxu2E=;
 b=gFf0M00h6THUttWgr+Wqsavk6AKG7Ojtg6pW2WoWpDWzpEzTXnDeoJaO
 eABg6IJZMRmNRN2qL3ShH+AeAHt/1ZGlJxZin5NU7yOP+9kSn1P0xT/SF
 UUu9U/2QzcM0lCLetc7F3eQTQ3kzr+prF9lmrCZYig04Cyro/LLdXoDuW
 9YaSHJtMJQNdufNEIlJxNRumhc82b/xE2qkd3htMsIrxVRYy2icNVPL36
 amXv4gaQJZK1HWnYkZAAPKcGdFsSOkPYj+B9k6ISYCt06JM0zXOrhrRBN
 HCqsLBZyN/H7IZK3Dr1+6O5bNqfOvDP9PStTWBJ6icdMKRvc+j18wQkFc w==;
X-CSE-ConnectionGUID: l4AEQjtoQtW0/u834r08Cw==
X-CSE-MsgGUID: oeRTzs2eQ9e2ewUm8K/aQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701934"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:49 -0700
X-CSE-ConnectionGUID: wsT2TVZpTXWQ0I0YruU5iw==
X-CSE-MsgGUID: zPlCckSMRW+8aKkaaIPVeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440422"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:45 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize edp
 backlight
Date: Fri, 20 Jun 2025 12:04:43 +0530
Message-Id: <20250620063445.3603086-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620063445.3603086-1-suraj.kandpal@intel.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
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

Now that drm_edp_backlight init has been modified to take
into account the setup of lumininace based brightness manipulation
we can just use that.

--v2
-Fix commit message [Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 98 +++++++++----------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 800d07c7f041..117c762fa2fe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -584,9 +584,37 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	u8 current_mode;
 	int ret;
 
-	if (panel->backlight.edp.vesa.luminance_control_support) {
+	ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
+				     luminance_range->max_luminance,
+				     panel->vbt.backlight.pwm_freq_hz,
+				     intel_dp->edp_dpcd, &current_level, &current_mode,
+				     false);
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
+	if (!panel->backlight.edp.vesa.info.aux_set ||
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
@@ -597,56 +625,26 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
 			    connector->base.base.id, connector->base.name);
-	} else {
-		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
-					     luminance_range->max_luminance,
-					     panel->vbt.backlight.pwm_freq_hz,
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

