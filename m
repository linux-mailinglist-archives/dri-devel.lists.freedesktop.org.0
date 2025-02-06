Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575EAA2A0F5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E6B10E433;
	Thu,  6 Feb 2025 06:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvxfDUYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFEE10E42C;
 Thu,  6 Feb 2025 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823605; x=1770359605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXe9ZQrPUoJuVdAF+V0/NeWMRxH5RoRl3OkqbwCzIJs=;
 b=IvxfDUYlELZhzuUxr+zqmH/sK3CAN7c+OmRyV61S3PEpQYyQ8bMlXtCz
 I05A3ODA2QQ2uSjnYwSW1fFSL99Tv860gfRkOo++nSPL/5cy7mXjyFQ2x
 F/8twXD84wZ9kYou43l0u/yT/mNIATiLmpWnVhyXLhJN3WJXHlVJtGWHX
 gGC08PPOaQATp8SFZ1KkhHQyqGMQXAJfi7L8Nw6BIlp9RFgs9Hyu2AbWA
 Y8yR9qGPFgkNCbLs+t8rriBv9TZ2HZ5TB1sbNO/LjCIMRK0xvTV43jtcm
 whufUuPoGMeLCNW3Vb0o9i8Yv33eewnXSsjp+lHQFMEYrdwlWOjDM2yY1 Q==;
X-CSE-ConnectionGUID: keHUaDh2SqWZdUWfAj3D6A==
X-CSE-MsgGUID: Z8dPB3lcTyaVu8FGo98iyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014241"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:25 -0800
X-CSE-ConnectionGUID: 35rk0aNBS2aaV65O3Kh+6w==
X-CSE-MsgGUID: cWszZvjyTRqed7VMJHwxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013744"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:23 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 7/8] drm/i915/backlight: Setup nits based luminance via VESA
Date: Thu,  6 Feb 2025 12:02:52 +0530
Message-Id: <20250206063253.2827017-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206063253.2827017-1-suraj.kandpal@intel.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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
account the nits based luminance.

--v2
-Prefer using luminance over nits [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 99 +++++++++++--------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index b0640b5128b1..301a4dfdfbe5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -560,56 +560,75 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
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
+	if (panel->backlight.edp.vesa.luminance_control_support) {
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
+		if (!panel->backlight.edp.vesa.info.aux_set ||
+		    !panel->backlight.edp.vesa.info.aux_enable) {
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
+				panel->backlight.level =
+					panel->backlight.pwm_funcs->get(connector, pipe);
+				panel->backlight.enabled = panel->backlight.pwm_enabled;
+			} else {
+				panel->backlight.level = panel->backlight.max;
+				panel->backlight.enabled = false;
+			}
 		}
 	}
 
-- 
2.34.1

