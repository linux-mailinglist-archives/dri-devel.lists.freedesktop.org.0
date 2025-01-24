Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F46A1B00E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE710E8E3;
	Fri, 24 Jan 2025 05:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhzXqfg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E667010E8E3;
 Fri, 24 Jan 2025 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697649; x=1769233649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qDYrijMRRE/Xm05zRniif+ZejKurPl/TSxPDrgYng54=;
 b=XhzXqfg4qQOQL6wuXy3aS5I5KZtvrds7JkpA1gGCDqidp0layTe1XKeD
 ocG+8JcytcIbuwGONQEx4VlxOxu2/B4+RhmwBzJGT4VefJWsFisi+EIUe
 OlFBLgDTJAhzRYGPsZk5eikeumUravFDMEiJcO74BDSy2vA4lk15nwEEs
 RwbDDBRpO50HbILdkSIuxfwSRfegWxocLRR9nVCLnKSy3+V7lFKe5vjZt
 MJjQrr+KQhhYxw6RbuLjMDEvGXKpEcPHxgc7+a/+sp/JDwlksZqKPx+Wi
 m3cCP0Rh80kOdR2ndn9NXoRiZcyGqiYrANIokqJ4t+Aqny7+YT9BaOQi1 g==;
X-CSE-ConnectionGUID: SYtiv+v0ThSmdExpC5E8Pw==
X-CSE-MsgGUID: dKkaPyGyQieS4S/PZqdDSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429319"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429319"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:28 -0800
X-CSE-ConnectionGUID: km2xsemER0iVWk4XAj4Bvw==
X-CSE-MsgGUID: ekq2UjHYTvOhZO/dMq3jOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107526032"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 5/7] drm/i915/backlight: Add function to change brightness in
 NITS for VESA
Date: Fri, 24 Jan 2025 11:16:29 +0530
Message-Id: <20250124054631.1796456-6-suraj.kandpal@intel.com>
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

Create a function that fills in the value for
PANEL_TARGET_LUMINANCE_VALUE which helps in changing the brightness in
NITS using VESA interface.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index ac9a69fe3f10..d794397656dd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -474,6 +474,30 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	return connector->panel.backlight.level;
 }
 
+static int
+intel_dp_aux_vesa_set_nits_brightness(struct intel_connector *connector, u32 level)
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
+	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		drm_err(intel_dp->aux.drm_dev,
+			"%s: Failed to VESA AUX Nits backlight level: %d\n",
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
@@ -481,6 +505,11 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (panel->backlight.edp.vesa.nits_support) {
+		if (!intel_dp_aux_vesa_set_nits_brightness(connector, level))
+			return;
+	}
+
 	if (!panel->backlight.edp.vesa.info.aux_set) {
 		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);
 
-- 
2.34.1

