Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB535A852A4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D205410EAD7;
	Fri, 11 Apr 2025 04:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0J74vau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098710EAE8;
 Fri, 11 Apr 2025 04:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345776; x=1775881776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSoQP/ckp8qVibb9MlhciCuwRFRtFAHM4t1hy652N+A=;
 b=A0J74vauMPR6MTSrsi/TQO+fyfVNaJynH47cDogOIAEBZcw7QWy8aPC8
 GSLIqEzY/qTMeuvv/sZhqRVE6QbFQIqh4IAtgJyOG/9002CdLSMhxLELd
 rwzFNe1YCYzximp3LgUJS4AhnXNZTX8I4ARCxH+hyOm/E7a/8292ybbHN
 RBEo1lJQEWzuZxW9apEZY4rDLsHe/OjaA6MOoB8Ihnwb6whFHh1T7wXax
 QWUoFiacOi8cPK3UjxjB51OJB2/7gqwu5IpB5S9PrJiDrNI7lAmycCnWL
 hL29nO71uTlSscMUOnFJ/7Pens54TVRpFWAcYp1+i+3+mTZtTHj9IdsFG A==;
X-CSE-ConnectionGUID: QJcL2KNGS4OOwVl1idzXfw==
X-CSE-MsgGUID: ZoyQ53E3SsK7k8dNGM5yUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259976"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:36 -0700
X-CSE-ConnectionGUID: Fqx+pHxnTLC3p0BcjkRlQA==
X-CSE-MsgGUID: uaZ3fluPQv2gsUOvaBsrHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057145"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:34 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Date: Fri, 11 Apr 2025 09:59:09 +0530
Message-Id: <20250411042909.2626807-14-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 0cd9fd72ebbb..57782697144e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -499,20 +499,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
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

