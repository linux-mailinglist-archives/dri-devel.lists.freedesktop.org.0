Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF930A8528B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA8210EACD;
	Fri, 11 Apr 2025 04:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFhNaOzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6010EACC;
 Fri, 11 Apr 2025 04:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345756; x=1775881756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJGT5dndY3sWlp+nJowqrBbWVUSjPaPgALpoPb/0LR4=;
 b=UFhNaOzVffMCODTa96GgcoV5N4mVOwahWGUts43T5IF8IX6Q1iXN3xUW
 YyZ1GWg1+SRDNpft33C2CFwKthEtSvFKDf9LKNPAB6h8v3xLV/LQalQfw
 7i95j7I/F44vimdKVE3Q7QAp/nhmyI1iIebhqEk3WNXT2IFqFcf6AZS8G
 hRsZg6j8bUzTuI9N39JSeL83LIBZcKzFOHeL7PlXDnUnPrNrGAtyRU42+
 5Y0Mw0jLilvqPiFzWtgwv8demHb5XE6QSeTAUfsNCDMqO4F+4VpzuONU/
 zFCHj6tOV7/eJ2UjpKlq0/S+wMr40WDImDKWC44fKQ5vLnMsZE0cg+RRl Q==;
X-CSE-ConnectionGUID: Fk6KzUQdT/+9g9bQx3nVHQ==
X-CSE-MsgGUID: hTNsu50HRD+M98qj3Xehcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259930"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:16 -0700
X-CSE-ConnectionGUID: JMb20HtwQ7il1ocWAzVhBw==
X-CSE-MsgGUID: sYvFyaAIQZ29B76uOdL2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057038"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 05/13] drm/dp: Change current_level argument type to u32
Date: Fri, 11 Apr 2025 09:59:01 +0530
Message-Id: <20250411042909.2626807-6-suraj.kandpal@intel.com>
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

Change the current_level argument type to u32 from u16
since it can now carry the value which it gets from
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
 include/drm/display/drm_dp_helper.h                   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1322bdfb6c8b..c58973d8c5f0 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4247,7 +4247,7 @@ int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       struct drm_luminance_range_info *lr,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode, bool need_luminance)
+		       u32 *current_level, u8 *current_mode, bool need_luminance)
 {
 	int ret;
 
@@ -4355,7 +4355,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 {
 	struct dp_aux_backlight *bl;
 	struct backlight_properties props = { 0 };
-	u16 current_level;
+	u32 current_level;
 	u8 current_mode;
 	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 22af5cf83b1e..72cdb6b499c0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -581,7 +581,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		&connector->base.display_info.luminance_range;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
-	u16 current_level;
+	u32 current_level;
 	u8 current_mode;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index a3681e101d56..a430ee30060e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -247,7 +247,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 
 	if (nv_conn->type == DCB_CONNECTOR_eDP) {
 		int ret;
-		u16 current_level;
+		u32 current_level;
 		u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 		u8 current_mode;
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 39d644495f3e..62be80417ded 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -851,7 +851,7 @@ int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       struct drm_luminance_range_info *lr,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode, bool need_luminance);
+		       u32 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u16 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.34.1

