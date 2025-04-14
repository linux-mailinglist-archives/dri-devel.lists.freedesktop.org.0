Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB47A876D8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6318910E4AB;
	Mon, 14 Apr 2025 04:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxTLU9vd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519710E4AA;
 Mon, 14 Apr 2025 04:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604262; x=1776140262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhXqN9vkZZcECM/5dq/3q0/LLR1Q4CvvJicVwUShEFA=;
 b=KxTLU9vdOOn9RjvuAlzeOmJZG84SPM5j4biH+zDEuyUIwtzwTh0PLH2/
 WsGqBu44yKpRGtNdK4ggIB7tVYLRMoXxc/BZcr3rRjS5SfokgY1IuEis+
 JpifeMu+yFboDn8fgzvKtMZ6ZzRL11b8n/HLBBzZf0ziEPOArwa018sZz
 QlfnZgdGC3l7j5BU5B33koptgKrDBJ0xlgYqkv2WGD7yV6kFYKclxnKjj
 MViRybDjrSNkDH84o/Y0qcGdYFN8o3ww+FBPw++fTyYbmYcqpZxERQJLp
 QzS8BkPGMWeJEiq811FU3U7e070j10oQU19ymWuNdVpLaOvBs10TNNXO2 g==;
X-CSE-ConnectionGUID: M9J/Rk/qQJm3VL+RB8sy1w==
X-CSE-MsgGUID: vZ2wLnRcQzazGkC8vg+Oyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070057"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:42 -0700
X-CSE-ConnectionGUID: PrFkQ8y8SNKbDhOWdtcPUQ==
X-CSE-MsgGUID: XpnGctw6QDqrdmb84nrWcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658123"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:40 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 12/13] drm/i915/backlight: Use drm helper to set edp backlight
Date: Mon, 14 Apr 2025 09:46:36 +0530
Message-Id: <20250414041637.128039-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414041637.128039-1-suraj.kandpal@intel.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
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
index 2eff9b545390..95b29d9af335 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -476,31 +476,6 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
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
@@ -508,11 +483,6 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (panel->backlight.edp.vesa.luminance_control_support) {
-		if (!intel_dp_aux_vesa_set_luminance(connector, level))
-			return;
-	}
-
 	if (!panel->backlight.edp.vesa.info.aux_set) {
 		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);
 
@@ -538,7 +508,9 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
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

