Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72927AE13E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF17B10EAF0;
	Fri, 20 Jun 2025 06:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEQcGXH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4510EAEE;
 Fri, 20 Jun 2025 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401315; x=1781937315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAPg9HmupY5Hjq2W/39G3D0u1bOxfsWU+/PcMJg14OM=;
 b=AEQcGXH0XGMWHsWq8dUAdSqbs1/AK29rso/SjrDTK2/lP748d712Vpcu
 FpR9bJYaBFyDFIFsE44rFxfwYSBQ9R03/14PgfQ8KzE6sI3owQfO+qeyb
 AgDMleIDBQTiZem/aUNNBFqMbqxmIEK9HsYPof/IZuG+xcgQhvgZ9y+Jm
 XwmgjbpGM7NbI13k2GPbFKPiFEzAvr58kOjtVCv8h9aWQ0h9kUbnyy+fT
 7fNGWcwYSa+3mdVZ4gg/nI+RLdjhUtMmcBsaOh9sxjPPj+GulxFj1hkCX
 Kof7MXb7bXBj+D787++vqhe5lmBBYJ7Lgex06gJ43oUJyc8fhJy4lucZg Q==;
X-CSE-ConnectionGUID: EKM9jr2ZTUiyT+/jZsv3nw==
X-CSE-MsgGUID: 5dMwEwVPT6iIcjRE/md8+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701841"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:14 -0700
X-CSE-ConnectionGUID: jjARc/vGQY6bfk6GYYmLOA==
X-CSE-MsgGUID: /rAhb1mmS/CIXyG3CLldhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440291"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 02/13] drm/dp: Add argument in drm_edp_backlight_init
Date: Fri, 20 Jun 2025 12:04:34 +0530
Message-Id: <20250620063445.3603086-3-suraj.kandpal@intel.com>
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

Add bool argument in drm_edp_backlight init to provide the drivers
option to choose if they want to use luminance values to
manipulate brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 7 ++++---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
 include/drm/display/drm_dp_helper.h                   | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e817bed9ffc6..2a662951f7a8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4255,6 +4255,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * @edp_dpcd: A cached copy of the eDP DPCD
  * @current_level: Where to store the probed brightness level, if any
  * @current_mode: Where to store the currently set backlight control mode
+ * @need_luminance: Tells us if a we want to manipulate backlight using luminance values
  *
  * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
  * along with also probing the current and maximum supported brightness levels.
@@ -4267,7 +4268,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode)
+		       u16 *current_level, u8 *current_mode, bool need_luminance)
 {
 	int ret;
 
@@ -4278,7 +4279,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
 		bl->lsb_reg_used = true;
 	if ((edp_dpcd[0] & DP_EDP_15) && edp_dpcd[3] &
-	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE))
+	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) && need_luminance)
 		bl->luminance_set = true;
 
 	/* Sanity check caps */
@@ -4396,7 +4397,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 	bl->aux = aux;
 
 	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
-				     &current_level, &current_mode);
+				     &current_level, &current_mode, false);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 271b27c9de51..dc6f6680774f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -600,7 +600,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	} else {
 		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
 					     panel->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
-					     &current_level, &current_mode);
+					     &current_level, &current_mode, false);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 9aae26eb7d8f..7d93266bf26a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -262,7 +262,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 				 nv_conn->base.name);
 
 			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
-						     &current_level, &current_mode);
+						     &current_level, &current_mode, false);
 			if (ret < 0)
 				return ret;
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e3b13858c8a9..fcbf447206cf 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -861,7 +861,7 @@ struct drm_edp_backlight_info {
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode);
+		       u16 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u16 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.34.1

