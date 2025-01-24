Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F9A1B013
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E01410E8EC;
	Fri, 24 Jan 2025 05:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juqpjnpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02B10E8EA;
 Fri, 24 Jan 2025 05:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697654; x=1769233654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aeTJte9d5rBAF5kBNAaKkZqaL8OjtD1ssK7dTFGW0vA=;
 b=juqpjnpVllDc5cviwRFm0D1dH61iwHDPfUOO1dmWEuRndXtB+RPTYQmS
 vkrQ3fHcq1B+T1/2xSSMdF9lefdIKWOhZmxqBSYEYN3SdHg3IJSSMZEtk
 sFPzgBXJKAcbeDN9cDFLr6jMCbwCWdIwTg6ytMn7tZdajacFV3NsoYt4W
 8eUD7FSP+LipcgsupFhM1uB9tsPctl+7d9fktvA4O6zzD1hVJKh1P/N8i
 /ac6KfwJf4esQems72scownH0i0UFVU/Kx+ZomICk0V0qOJvsQg+hLsnL
 ejJKPj+IBHVP9EcmZBzXiHLtn9rpMPEpKEGG8mpbx4qGF6ajnz0kv/MAV Q==;
X-CSE-ConnectionGUID: u1+PbddPTF6kCM7brpHEVQ==
X-CSE-MsgGUID: wTHrbzLFSq+9QDGmAehicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429324"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:34 -0800
X-CSE-ConnectionGUID: YKuzhmyfSC6UbktMDN9A8Q==
X-CSE-MsgGUID: ferOjyfbQPiLPQGptbXYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107526059"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:32 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 7/7] drm/i915/backlight: Enable Nits based brightness
Date: Fri, 24 Jan 2025 11:16:31 +0530
Message-Id: <20250124054631.1796456-8-suraj.kandpal@intel.com>
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

Enable Nits based brightness by writing the PANEL_LUMINANCE_CONTROL
bit and set the correct register to change brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index d42f9a78a32b..d63aa1402a25 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -526,6 +526,18 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	int ret;
+
+	if (panel->backlight.edp.vesa.nits_support) {
+		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+					 DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE);
+
+		if (ret == 1)
+			return;
+
+		if (!intel_dp_aux_vesa_set_nits_brightness(connector, level))
+			return;
+	}
 
 	if (!panel->backlight.edp.vesa.info.aux_enable) {
 		u32 pwm_level;
@@ -549,6 +561,9 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (panel->backlight.edp.vesa.nits_support)
+		return;
+
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
 
 	if (!panel->backlight.edp.vesa.info.aux_enable)
-- 
2.34.1

