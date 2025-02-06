Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34460A2A0FD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B716810E43B;
	Thu,  6 Feb 2025 06:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1oQav9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CF810E433;
 Thu,  6 Feb 2025 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823597; x=1770359597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IWHOuTtGWIiNIXjE7VJu/Q9mBXYHdz7Cmdu26DbhqMg=;
 b=C1oQav9xx9XbWrxki84WHYlzDkOR3a+Jmk1bJ0mUKy3xZzpzPYyziEe7
 u30HPO2n4Py8ghZls2MQH/L3ZQIO0ONV5bj4rSMyGRVKxkBJKR5RpzoCs
 IEiJYjPmXR86ck3mW5M2knHwLp/cBcOYi5wdI24acpV4Nbc+Et5B67mmL
 AzN2iLy5owaKfSBUTARUqHC1Xc50F5+Frh4u2cyzmVloXWCRUYu7dR5r/
 xfVOPW1uKFcPUYSBB+RFoZfgfWL88OLqRIeF/do75J77z+OPORrjqoJXd
 anLGARI33bKn5AqNPIgVe6sL4DcbhytdFFOh/rafdzvJLNhOv7Yv22/bp w==;
X-CSE-ConnectionGUID: 3ZG0MnU6QGGNcA8ntU8b6Q==
X-CSE-MsgGUID: rc8iRG2UTua0/IiNPOwILw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014226"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:17 -0800
X-CSE-ConnectionGUID: WRV7mhsVQTiLKls2YaCIgw==
X-CSE-MsgGUID: TdUt0gm2QOO2XEtC1ogFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013704"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:15 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/8] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Date: Thu,  6 Feb 2025 12:02:49 +0530
Message-Id: <20250206063253.2827017-5-suraj.kandpal@intel.com>
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

Check if we are capable of controlling brightness via luminance
which is dependent on PANEL_LUMINANCE_CONTROL_CAPABLE bit being set
on EDP_GENERAL_CAPABILITY_2 register.

--v2
-Prefer using luminance rather than nits [Jani]
-Fix commit message

--v3
-Fix the bit name used in commit message [Arun]
-Use correct edp_dpcd[] to check the capability [Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index cb51b7936f93..3b64ad724b29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -412,6 +412,7 @@ struct intel_panel {
 		union {
 			struct {
 				struct drm_edp_backlight_info info;
+				bool luminance_control_support;
 			} vesa;
 			struct {
 				bool sdr_uses_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 09e82f24d030..2599aa39b21d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_panel *panel = &connector->panel;
+
+	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX Luminance Based Backlight Control Supported!\n",
+			    connector->base.base.id, connector->base.name);
+		panel->backlight.edp.vesa.luminance_control_support = true;
+		return true;
+	}
 
 	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
 		drm_dbg_kms(display->drm,
-- 
2.34.1

