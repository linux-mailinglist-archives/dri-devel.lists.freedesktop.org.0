Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B920CA876DA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2270E10E481;
	Mon, 14 Apr 2025 04:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKw4qEl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7067B10E481;
 Mon, 14 Apr 2025 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604264; x=1776140264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yEhImAjjDjdvX46y8LumtI6xVXXOY2pa0kDJSL0ifNM=;
 b=kKw4qEl175x/DNLOzeqZHCDKVXj6g5LU8SDS3Fuju0OLCzExTGY28sna
 4fPUwLug1uupl1OuGuLA1NjkdcvcQhcWtI1HxlYigCo1qMxYsWkLxTV8Z
 Xx5eCoA1+8Nyh3Sa1I1KFoBZrUZ04QcoyfZ9YBolVm1B7EZ7ikTPVi0KG
 xwf+lsSVP4YJ3co14IhVRZXokSs7pzoikYFwLVMLWCiEyFaAmWZiKLJjF
 Jw/BqKH/WQ50D8uifOhbx6zguV+cyTsSFBonfNFUvS25GI7g+WfYkY6bK
 NbJuQ2WMgGcS5AfKJQftl9DuzJTMUJdUkKlrvGHkRT9RtSELEUiBOwFZm w==;
X-CSE-ConnectionGUID: Owt1wy81R6ihF4Iz7OLGgg==
X-CSE-MsgGUID: gHMcWq2CSmy5AIRFdzAoGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070061"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:44 -0700
X-CSE-ConnectionGUID: VDvnAQM1TSe+bWPmAoqdNg==
X-CSE-MsgGUID: fr9RfVraTruijXKdLUa1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658131"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:43 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Date: Mon, 14 Apr 2025 09:46:37 +0530
Message-Id: <20250414041637.128039-14-suraj.kandpal@intel.com>
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

Use drm dp helper to enable backlight now that it has been modified
to set PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability
supports it and the driver wants it. Remove the dead code.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 95b29d9af335..b8b0ace9e6fd 100644
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

