Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B636DAB099F
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CFC10E9AF;
	Fri,  9 May 2025 05:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmfQaL4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9043410E9A6;
 Fri,  9 May 2025 05:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767950; x=1778303950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qn+LnRf5Nb+XqAqnm51qXn+UNZ6AxFaGjhBh2YccJIU=;
 b=FmfQaL4Vsaesg8Ey9sNWyggYzIvNImwrNAErjTuDhJR+tM/9eSpdFXJ2
 LGtOsOwu6ki4y5bxrfgCIeoPy1++yKf+FRTTErtwg34tOW23IXQiq64ya
 /cfHhqETaAPt+ag4Va4H+elTuNk4jXjf1vLDhVDvZPR1x/ziRvwpx8gWn
 FkXBxLBw9o7oO34cjvnVUd+6WddrHAhwdicTp/hPh4kFmxl1jqtFujUse
 kXafOHTGFdjJ0JlJzkrwmS43rSiZnFiCGGb15hPNG964w38EsKUfTHgrO
 3n0qQXPYRDrCycdMig7WJbSxkF0H8q8K+9XXw8OYxB9KTy+WmMLyPTyek A==;
X-CSE-ConnectionGUID: UDbG64NUR7arX4IyFiDTHw==
X-CSE-MsgGUID: h4/Q/OoxShGWCFzEvzWdtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287158"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:10 -0700
X-CSE-ConnectionGUID: 9Dxu704oRGKtiHkhvBViBw==
X-CSE-MsgGUID: 0Q3RUESYSPm46ErhSvlrew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414948"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:19:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 12/13] drm/i915/backlight: Use drm helper to set edp backlight
Date: Fri,  9 May 2025 10:48:15 +0530
Message-Id: <20250509051816.1244486-13-suraj.kandpal@intel.com>
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

Now that the drm helper sets the backlight using luminance
too we can use that. Remove the obselete function.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 34 ++-----------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index b97f778d420e..a81c3f0ac3cb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -475,31 +475,6 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	return connector->panel.backlight.level;
 }
 
-static int
-intel_dp_aux_vesa_set_luminance(struct intel_connector *connector, u32 level)
-{
-	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
-	u8 buf[3];
-	int ret;
-
-	level = level * 1000;
-	level &= 0xffffff;
-	buf[0] = (level & 0x0000ff);
-	buf[1] = (level & 0x00ff00) >> 8;
-	buf[2] = (level & 0xff0000) >> 16;
-
-	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
-				buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
-		drm_err(intel_dp->aux.drm_dev,
-			"%s: Failed to set VESA Aux Luminance: %d\n",
-			intel_dp->aux.name, ret);
-		return -EINVAL;
-	} else {
-		return 0;
-	}
-}
-
 static void
 intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
@@ -507,11 +482,6 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (panel->backlight.edp.vesa.luminance_control_support) {
-		if (!intel_dp_aux_vesa_set_luminance(connector, level))
-			return;
-	}
-
 	if (!panel->backlight.edp.vesa.info.aux_set) {
 		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);
 
@@ -537,7 +507,9 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 		if (ret == 1)
 			return;
 
-		if (!intel_dp_aux_vesa_set_luminance(connector, level))
+		if (!drm_edp_backlight_set_level(&intel_dp->aux,
+						 &panel->backlight.edp.vesa.info,
+						 level))
 			return;
 	}
 
-- 
2.34.1

