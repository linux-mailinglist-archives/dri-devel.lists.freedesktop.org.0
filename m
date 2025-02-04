Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5EA27228
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFB610E627;
	Tue,  4 Feb 2025 12:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6BEpIcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CC10E626;
 Tue,  4 Feb 2025 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673432; x=1770209432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtxDKMeP0R4aywy8S4ng84XE21QXblABMqMejDOfZ1A=;
 b=J6BEpIcOfrNjtLiPy7dhgaMNr4fmhNpMbXeS9+RT/2Gf2MxVEeFHRBVT
 4OIzz1AAYpHdUEBDjQnhEwvuI2eGZTSdlFVps8bqvTcL1AvxOp9TSscWx
 U5gH8EGbk9hejsxrKGD0nDQ2H0OtSBdTcOcdppZV1iu8LJ2Po7skfg8TB
 g0sjJnoeFmNVKc6Wwp8beX4ZST/VZHvRa3rDyLh+gkX9xXKiWokEFmK4F
 NQ1BgRBazFGVdYEleWIgMnS509qwnvZgZir/vbgvSdTle3WJqNlFjO/9s
 RrnpG6MhotN0c7zrPHjzytrNaOX9FvP+iMFsFzSGjk/P62AMZTLgbBo/r A==;
X-CSE-ConnectionGUID: 4I3vaQeoRA6ZCRhsfoxhZA==
X-CSE-MsgGUID: tFmku+8bSLilCgbjNhDFgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853173"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42853173"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:32 -0800
X-CSE-ConnectionGUID: UdL+nbW9R2CWKEzE7O2kPA==
X-CSE-MsgGUID: IAiAKwHMRGyRWX11gf+B+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111441958"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:28 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/7] drm/i915/backlight: Use proper interface based on eDP
 version
Date: Tue,  4 Feb 2025 18:20:04 +0530
Message-Id: <20250204125009.2609726-3-suraj.kandpal@intel.com>
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

eDP is supposed to use VESA interface when using revision 1.5 and above,
use Intel interface for backlight control otherwise. Add check to
use correct interface.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c846ef4acf5b..09e82f24d030 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -604,6 +604,7 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_device *dev = connector->base.dev;
 	struct intel_panel *panel = &connector->panel;
 	bool try_intel_interface = false, try_vesa_interface = false;
@@ -640,6 +641,10 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 		break;
 	}
 
+	/* For eDP 1.5 and above we are supposed to use VESA interface for brightness control */
+	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
+		try_vesa_interface = true;
+
 	/*
 	 * Since Intel has their own backlight control interface, the majority of machines out there
 	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
@@ -653,7 +658,8 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	 * backlight interface at all. This means that the only sensible way for us to detect both
 	 * interfaces is to probe for Intel's first, and VESA's second.
 	 */
-	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
+	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector) &&
+	    intel_dp->edp_dpcd[0] <= DP_EDP_14b) {
 		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using Intel proprietary eDP backlight controls\n",
 			    connector->base.base.id, connector->base.name);
 		panel->backlight.funcs = &intel_dp_hdr_bl_funcs;
-- 
2.34.1

