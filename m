Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75947A2A0FC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5CD10E439;
	Thu,  6 Feb 2025 06:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLgWfMAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914A410E16A;
 Thu,  6 Feb 2025 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823602; x=1770359602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2bTUHVegsB+z7CQpmivpLAv2KoBb+8K9dTlrynYwGQ=;
 b=cLgWfMAJe1/uqiNlo9RKGBnhONiad4G+saZRDKbUUNvRPjIE3QgCuszK
 iBxx9pATrzTgjQ2SdZ+UNDGHN5MpdCqOB5xLw3aMWXmtQGRViPZga6Gtn
 LWUzCqa0cQIr5s7o0YSiKo2mtKTEek8eMk31arMSgZeHinQDaEZTphB46
 Tbpq6yzgGjP59p70HiIiRSfP9qmHX+/IONXuZdOhj79oDOEcPiXp3geed
 wlB0I/0KDv/NMkjmoY6UcXzARuKlSWNgbUaywo6fnSP996+wRcJJQBNRJ
 Yp1PlWgk7Ki4cazxSKWnW5PF/w+3eLtDG6PAI1qP2BuSewtJk66wG40Ny Q==;
X-CSE-ConnectionGUID: /o5MBBlNTuqwaiKHE2zK1w==
X-CSE-MsgGUID: 5w4Qyr2XTaOhVVj3JE53lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014236"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:22 -0800
X-CSE-ConnectionGUID: 7+6Buu6bRaaEy48xGOf0AA==
X-CSE-MsgGUID: hFwe24KpRNO4SyE+xoycqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013730"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:20 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/8] drm/i915/backlight: Add function to change brightness in
 nits for VESA
Date: Thu,  6 Feb 2025 12:02:51 +0530
Message-Id: <20250206063253.2827017-7-suraj.kandpal@intel.com>
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

Create a function that fills in the value for
PANEL_TARGET_LUMINANCE_VALUE which helps in changing the luminance in
nits using VESA interface.

--v2
-Prefer using luminance over nits [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index ca5fc40fa13a..b0640b5128b1 100644
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

