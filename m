Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FABA2A0FB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C854F10E438;
	Thu,  6 Feb 2025 06:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSle7xEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DB810E433;
 Thu,  6 Feb 2025 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823608; x=1770359608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O6PuGKSHAthZisdBIs/lDbKe14sxSue+Xnm+my2xrhQ=;
 b=ZSle7xEuHuhYvz4HWmTN+aMIWfF2JQDSlRr5DKQ/CR5PA4MJamA+SCcY
 VWHSlXxroS9Pj6wzKVUzyOINHt2boAP0kDpaNvjsw6QRBTQT2ZhHQg4/8
 nL6LMyC1/nQcPWKZDoD0yQukeOpTL0J1Y7yCIHOyhH/1RbuBwtyS9pRdH
 109qn8llA3fmrMzSpNCg1MIX8U8do/1psAvpMyjICCUri15uo3EAVxucv
 awuaWdoXzq/bTMHhlJ4e73uaJFHdppizwTWmIuB7rEfdiKAeiEFjjVL/L
 ASf+LnT+bOtxpExD2kxYeoWT42q1iRU+r0OYu1nwSEGLoAYayQpVEABwH g==;
X-CSE-ConnectionGUID: h0qLuRXsQDm1o6i2zL9c2A==
X-CSE-MsgGUID: gfZw2vj9StiyPsP4bc4ZDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014247"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:27 -0800
X-CSE-ConnectionGUID: Slkca4QWTpa5kjniMaA4ew==
X-CSE-MsgGUID: BqGJwwjvQOKo6/LQcr38Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013757"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:26 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 8/8] drm/i915/backlight: Enable nits based luminance
Date: Thu,  6 Feb 2025 12:02:53 +0530
Message-Id: <20250206063253.2827017-9-suraj.kandpal@intel.com>
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

Enable nits based luminance by writing the PANEL_LUMINANCE_CONTROL
bit and set the correct register to change brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 301a4dfdfbe5..f53c8355d5be 100644
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

