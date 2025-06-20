Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F9AE13F1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4878D10EAF3;
	Fri, 20 Jun 2025 06:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUunJWYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087910EAF6;
 Fri, 20 Jun 2025 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401327; x=1781937327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gfBFVBocXyByOTV9zVO/k1Or1RPsP2+ShbaG8jubAeQ=;
 b=PUunJWYgLd0y15HthsHLzLj9vqhvyiRWKwWf5v0hSXFldau9qfOT4IUz
 f1tl0ClEtEAUqrzgSJVGWX4PCpjYT1S/Ewi3fN65FWUqiDqCQBDLJDwNA
 sFhpzTw7R/Mk4HmwLwZc3hF+pCOxrs9hwISdQuCZRq6KQSxDdkHt+nixi
 BCPPbCQujsAtLBeTd8hyACSY0RAysqppofeO4BdKgnloVvdXRBYsdfg7n
 VYSFKYLNrWN/SijNJ7oinaYFi6I297xrw4vxMsZcrWkzZ65RSgar2pnbO
 fP5c1JCZIrRy7+cYrhYLwPA8KDw8zazKS7cgUwdcuiSMy1gcOsc/V9NiU g==;
X-CSE-ConnectionGUID: Sxinuxw1QKeVJkSrvj9wGg==
X-CSE-MsgGUID: sbIEuBQjQLez20C6Up83Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701845"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701845"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:26 -0700
X-CSE-ConnectionGUID: Trt2mZHOSyKPS8+wYDF55g==
X-CSE-MsgGUID: UlMDl5eDSKOEhCn/3ewtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440316"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 05/13] drm/dp: Change current_level argument type to u32
Date: Fri, 20 Jun 2025 12:04:37 +0530
Message-Id: <20250620063445.3603086-6-suraj.kandpal@intel.com>
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

Change the current_level argument type to u32 from u16
since it can now carry the value which it gets from
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
 include/drm/display/drm_dp_helper.h                   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 90b23f78a12d..daeb3bdc87a3 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4270,7 +4270,7 @@ int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode, bool need_luminance)
+		       u32 *current_level, u8 *current_mode, bool need_luminance)
 {
 	int ret;
 
@@ -4378,7 +4378,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 {
 	struct dp_aux_backlight *bl;
 	struct backlight_properties props = { 0 };
-	u16 current_level;
+	u32 current_level;
 	u8 current_mode;
 	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index ab594bf028da..800d07c7f041 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -580,7 +580,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		&connector->base.display_info.luminance_range;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
-	u16 current_level;
+	u32 current_level;
 	u8 current_mode;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d45619db02a2..4a75d146a171 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -245,7 +245,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 
 	if (nv_conn->type == DCB_CONNECTOR_eDP) {
 		int ret;
-		u16 current_level;
+		u32 current_level;
 		u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 		u8 current_mode;
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 6176e0b5ea1a..21984bac0743 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -862,7 +862,7 @@ int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode, bool need_luminance);
+		       u32 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u16 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.34.1

