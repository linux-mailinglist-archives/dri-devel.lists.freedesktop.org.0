Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB5AE1409
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A74810EB16;
	Fri, 20 Jun 2025 06:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJO+JDLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E6710EB0E;
 Fri, 20 Jun 2025 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401356; x=1781937356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MpBo5lnXZQMP9xC4GyeoMslgVvVMcsBL7T7tt+p6fm8=;
 b=UJO+JDLSNXh3NmaDMugm4JiJOvIINOHe7QeDs8inG/jSZKhsVyuVZAXE
 1M1lPai0tQ4EerGYH2aWzVQqS1R4y1bPEMQ/n1XOCXo+oB5I8lSST5frR
 mmk1fNkdILE7k4O6CdQpfDH8nstqZRlzuKwJJjt336p99nfZZngN0yhOk
 qbr3+Yzd3NQK4UF+Eq1qTYyRONaVblil1v0tBCC4TihB/Yh9AVv9jHNs2
 NIlgAIYhFLu+EhKNtvKX9KheffgPdKryfnlw9FutpWZnB+OoEm+pvXPZ0
 s29yuCO6oW9TO+yr4blZKyoCVME56gf3BxL3wKHLb/Qqzx05pgY3GQcm9 g==;
X-CSE-ConnectionGUID: jKeo60c9TJGtGUvYZYDNlQ==
X-CSE-MsgGUID: VAm8FoHkTMWR7RvjPIWpeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701941"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:56 -0700
X-CSE-ConnectionGUID: O8zmiA2fRPKD0gWAj7A/QA==
X-CSE-MsgGUID: C4JlL97rRVm5Ul979es/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440441"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Date: Fri, 20 Jun 2025 12:04:45 +0530
Message-Id: <20250620063445.3603086-14-suraj.kandpal@intel.com>
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

Use drm dp helper to enable backlight now that it has been modified
to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
supports it and the driver wants it. Remove the dead code.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 8f33c5b78079..25332a7b7707 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -498,20 +498,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
-	int ret;
-
-	if (panel->backlight.edp.vesa.luminance_control_support) {
-		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
-					 DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE);
-
-		if (ret == 1)
-			return;
-
-		if (!drm_edp_backlight_set_level(&intel_dp->aux,
-						 &panel->backlight.edp.vesa.info,
-						 level))
-			return;
-	}
 
 	if (!panel->backlight.edp.vesa.info.aux_enable) {
 		u32 pwm_level;
-- 
2.34.1

