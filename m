Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C21A2722E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EB310E62C;
	Tue,  4 Feb 2025 12:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXGDKUw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432B010E623;
 Tue,  4 Feb 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673442; x=1770209442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xRVBZwiKF+V24aseos/bwZOdQCd0m5K/+M0op7XjEes=;
 b=dXGDKUw2YcvWCc5zhsGnnZSyBorvKnTXxgGhVQNwY6nZye3PpgUcaM+W
 v8z+7oKWarGisMmMMjpYWJ9OX2ZuaxFm9MQgTYqmCN0nz6PJskIOZonxk
 5bkAvwQoEXUKnqOgada6nthTy0scun0YyOTHZ7ZO1jgruq+Zl6lb9BaF5
 /jwey99MRz9SHP3DY4nB/ExW5IGXjuqe0A67Cc2eFs+7pU+mCV8oON25H
 kjiyFdFeZvQLwmcZaqYp2IB0oGdTWfrZWB29/4WK1o/lyIht3CEWs33gz
 X1kq46bNRUS8DCEsem9HwSD+x9dnFEOf1MlAYnol4x93f8kZt3540C5pb A==;
X-CSE-ConnectionGUID: s0LeUQolQYCvjU81tPoziA==
X-CSE-MsgGUID: +Jn1fQkFSDu9jAwl9bPiGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853213"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42853213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:42 -0800
X-CSE-ConnectionGUID: ol7Za3ibSramNN0DqytkVQ==
X-CSE-MsgGUID: +JgPOIN4T6ypG0JuEYpJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111441988"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:38 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 5/7] drm/i915/backlight: Add function to change brightness in
 nits for VESA
Date: Tue,  4 Feb 2025 18:20:07 +0530
Message-Id: <20250204125009.2609726-6-suraj.kandpal@intel.com>
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

Create a function that fills in the value for
PANEL_TARGET_LUMINANCE_VALUE which helps in changing the luminance in
nits using VESA interface.

--v2
-Prefer using luminance over nits [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a733b5623563..a9facfacac95 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -474,6 +474,31 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	return connector->panel.backlight.level;
 }
 
+static int
+intel_dp_aux_vesa_set_luminance(struct intel_connector *connector, u32 level)
+{
+	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	u8 buf[3];
+	int ret;
+
+	level = level * 1000;
+	level &= 0xffffff;
+	buf[0] = (level & 0x0000ff);
+	buf[1] = (level & 0x00ff00) >> 8;
+	buf[2] = (level & 0xff0000) >> 16;
+
+	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
+				buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		drm_err(intel_dp->aux.drm_dev,
+			"%s: Failed to set VESA Aux Luminance: %d\n",
+			intel_dp->aux.name, ret);
+		return -EINVAL;
+	} else {
+		return 0;
+	}
+}
+
 static void
 intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
@@ -481,6 +506,11 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (panel->backlight.edp.vesa.luminance_control_support) {
+		if (!intel_dp_aux_vesa_set_luminance(connector, level))
+			return;
+	}
+
 	if (!panel->backlight.edp.vesa.info.aux_set) {
 		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);
 
-- 
2.34.1

