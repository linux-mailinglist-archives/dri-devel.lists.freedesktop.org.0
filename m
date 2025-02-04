Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD8A27232
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0B10E629;
	Tue,  4 Feb 2025 12:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0Hbo+b3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B5F10E629;
 Tue,  4 Feb 2025 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673449; x=1770209449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOIkpVfegD2FTDOkFdHpUMdlGJbEqHg55IQZnw4TvoU=;
 b=n0Hbo+b3i/aPC2EOkHY8B+K7OieU7KvGKGnWnGTjLX+qGONQyT+uqiTn
 /9LSaXbxGM94av89AqwARGRIan6pE95t+d4HcABgXkF2xBEt0pNWATQCd
 x+PmTq+XJKf5di2SKIjuQ20Haufp7WZ/kleuMidquMJ9VLLgiHf/2qxvP
 xleYw4P4kbi/LYV+VKNM2EMua/9Kg9M2teSHq0CNeHAw4EK2Z0qt3FfXZ
 xVoLfIZuP0RQ/SNdWIEDXdfsI1UQiEQAl9ifjbkoAza5bL2WR/FCP9wje
 L73I5KzPq4Fz8LIAqJps2yw5e+qMi9RaKJ1PnQOuGoW/rT5q2CijyJAzT w==;
X-CSE-ConnectionGUID: DFxhHRpdTOCjEj+WvzexXQ==
X-CSE-MsgGUID: RW3c2Y7uSWmKF09Pm+dHdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853240"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42853240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:48 -0800
X-CSE-ConnectionGUID: GEkq3h6fTtqHQRh7mqrOTw==
X-CSE-MsgGUID: /9uwZfpYQrOULHSw1lB+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111442004"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:45 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 7/7] drm/i915/backlight: Enable nits based luminance
Date: Tue,  4 Feb 2025 18:20:09 +0530
Message-Id: <20250204125009.2609726-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2609726-1-suraj.kandpal@intel.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
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

Enable nits based luminance by writing the PANEL_LUMINANCE_CONTROL
bit and set the correct register to change brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 38e2b8cc591c..a090f1fca66e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -527,6 +527,18 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	int ret;
+
+	if (panel->backlight.edp.vesa.luminance_control_support) {
+		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+					 DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE);
+
+		if (ret == 1)
+			return;
+
+		if (!intel_dp_aux_vesa_set_luminance(connector, level))
+			return;
+	}
 
 	if (!panel->backlight.edp.vesa.info.aux_enable) {
 		u32 pwm_level;
@@ -550,6 +562,9 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (panel->backlight.edp.vesa.luminance_control_support)
+		return;
+
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
 
 	if (!panel->backlight.edp.vesa.info.aux_enable)
-- 
2.34.1

