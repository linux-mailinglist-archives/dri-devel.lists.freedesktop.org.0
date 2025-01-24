Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF9BA1B00B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5110E8E1;
	Fri, 24 Jan 2025 05:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMKvFNUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB510E8DC;
 Fri, 24 Jan 2025 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697643; x=1769233643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljPc/TovSOYQDCZqJM4GB+JcFXYX+jzpbtEx1nzH038=;
 b=VMKvFNUvumwyB/Lp4xvUEAK2vsySEIGRun8TCdBob/l4vFX5yeOQs2/Y
 ox1vFbSTyMjjFHDifn+IDElEMGcKfSb8SEKCQbfc2rryf4qtfiDxcrW6r
 bRuQqj9gsx/sR3E4LQ7cpcyj/UbwSlactGYJ/RPv1wbRt0oP2iiDDMeJQ
 FgPTPwEr89J3UxGEnICqrQxs2ACvAdpwAjISc++dK05Zd03RXrcHYvBNz
 OwBJWwpnf1PxJhdHzmTBQVdm3jyN/gvIXlkKjvKaYOhYP45xq/7WfwNLy
 aQ/+6PDcse67R0jzB8LYTTaxUpO9kgtfpCHbd/Fgea9r1YgWf0JI//79b w==;
X-CSE-ConnectionGUID: 2PD2hE3JTdGbJysE77DDGA==
X-CSE-MsgGUID: Kynu1NLwTeSuzGX0yR6RWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429307"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="37429307"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:23 -0800
X-CSE-ConnectionGUID: wzyJFhjvTsqIcHEuyCFXHA==
X-CSE-MsgGUID: J2JJcHNbSdWIB07rRJDEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107526005"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:21 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness control
 for VESA
Date: Fri, 24 Jan 2025 11:16:27 +0530
Message-Id: <20250124054631.1796456-4-suraj.kandpal@intel.com>
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

Check if we are capable of controlling brightness via Nits which
is dependant on PANEL_LUMINANCE_OVERRIDE and SMOOTH_BRIGHTNESS
capablility being set.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 083eb86f0904..f900e1f2d93e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -412,6 +412,7 @@ struct intel_panel {
 		union {
 			struct {
 				struct drm_edp_backlight_info info;
+				bool nits_support;
 			} vesa;
 			struct {
 				bool sdr_uses_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 09e82f24d030..c5ff6e044866 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_panel *panel = &connector->panel;
+
+	if ((intel_dp->edp_dpcd[2] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] AUX Nits Based Backlight Control Supported!\n",
+			    connector->base.base.id, connector->base.name);
+		panel->backlight.edp.vesa.nits_support = true;
+		return true;
+	}
 
 	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
 		drm_dbg_kms(display->drm,
-- 
2.34.1

