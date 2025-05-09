Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB9AB09A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDE710E9AC;
	Fri,  9 May 2025 05:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnC+HdXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB36710E9AC;
 Fri,  9 May 2025 05:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767952; x=1778303952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yuOUoM09jQv/qwIMmtT8FW2FtpriG0Y2PNT0r29aBDY=;
 b=PnC+HdXxYJSBD2doP5j6z00FngHjp3Dz/478pfdidu23vl4V5uQrZb3i
 ZWtE9rEBUFZpzG9quRgMglNjWqcvGA5H4Kz3F1o2nsfC2r7BlC7bFOfog
 OqxBm5O7PBcHN/4rwCzkNH6lIR338cXvaB267EZeNaW3SENVx1IUOBCpo
 ZzGKjkP+TlSSPipskBsi3OUSdZGoYuSlir2gNoib21A++tzyMdHI1jqZE
 gGBRxJaEyWYxmvWy9ajB0X9N6SCCP+pemRD2Td7kKUjuPoosdeHdYghfH
 5pEH7cNFQ1ZvwrFsZpLSOau8uXAg2oJJBVCJ93oNkwZwytzWiVQRttG8H w==;
X-CSE-ConnectionGUID: 3VrL6NmBTK+AtBKZAWV8bw==
X-CSE-MsgGUID: gwMnGl2zSWuyGuqajLBSuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287160"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:12 -0700
X-CSE-ConnectionGUID: OrEBbYWiT7Ck6CThHDQzyQ==
X-CSE-MsgGUID: 9sdmmBxHTlGFbM48iOZNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414955"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:19:09 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Date: Fri,  9 May 2025 10:48:16 +0530
Message-Id: <20250509051816.1244486-14-suraj.kandpal@intel.com>
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

Use drm dp helper to enable backlight now that it has been modified
to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
supports it and the driver wants it. Remove the dead code.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a81c3f0ac3cb..3faba358fed8 100644
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

