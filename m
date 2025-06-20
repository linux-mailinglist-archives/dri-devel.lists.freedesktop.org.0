Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D765CAE13E9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B6F10EAF5;
	Fri, 20 Jun 2025 06:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjiXJbIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2218810EAF8;
 Fri, 20 Jun 2025 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401319; x=1781937319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gdi9Kq6raZ/JuCK5y3VV3KGUFUPhC3hqEQfo6D0On5E=;
 b=GjiXJbIFynM2QH5YBtRud1Q0Ixp6CwQZgLVgq0OfdDVi8uoiXp7nVL+x
 PTrvBEm5kR9NWe4J9oEnyUd2UyjZ0M+sDkVeRDUYuig7ed3J5OPSA/FwN
 qvXf95YPIXdLVrv/eJYHNidC2TMY9a/yocAfNnruSsCagghvAp/IWVvd5
 ZT0wafPbi/MaAjWeJOgP6czj1/Bgo1T4xwyW5UxaLSHElck5/idE7U+fH
 hdc0uF9/xqWiAmEqrq9oDQHLlYFDohYyUip09+3tbDdxSBOvQgbKbo5vG
 lC3Dqj2W7rE5GQI5J9QtQr6rrK132UyVyzVgoguxidemUSkXpD1YzSW2S A==;
X-CSE-ConnectionGUID: aNQEKSOnSXGY4iW2EjsYyA==
X-CSE-MsgGUID: FDufU2XlSEeeqan/vBCgpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701843"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:18 -0700
X-CSE-ConnectionGUID: Ll42BVFSQBymXb7PqX88LQ==
X-CSE-MsgGUID: o/eMvz8hQqSpzl/2mf6LLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440299"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 03/13] drm/dp: Add argument for max luminance in
 drm_edp_backlight_init
Date: Fri, 20 Jun 2025 12:04:35 +0530
Message-Id: <20250620063445.3603086-4-suraj.kandpal@intel.com>
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

Add new argument to drm_edp_backlight_init which gives the
max_luminance which will be needed to set the max values for
backlight.

--v2
-Use pass only max luminance instead of luminance_range_info struct
[Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 4 +++-
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 6 ++++--
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 3 ++-
 include/drm/display/drm_dp_helper.h                   | 1 +
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 2a662951f7a8..9df95776d1cb 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4251,6 +4251,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * interface.
  * @aux: The DP aux device to use for probing
  * @bl: The &drm_edp_backlight_info struct to fill out with information on the backlight
+ * @max_luminance: max luminance when need luminance is set as true
  * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
  * @edp_dpcd: A cached copy of the eDP DPCD
  * @current_level: Where to store the probed brightness level, if any
@@ -4267,6 +4268,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  */
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u16 *current_level, u8 *current_mode, bool need_luminance)
 {
@@ -4396,7 +4398,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 
 	bl->aux = aux;
 
-	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
+	ret = drm_edp_backlight_init(aux, &bl->info, 0, 0, edp_dpcd,
 				     &current_level, &current_mode, false);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index dc6f6680774f..ab594bf028da 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -599,8 +599,10 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 			    connector->base.base.id, connector->base.name);
 	} else {
 		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
-					     panel->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
-					     &current_level, &current_mode, false);
+					     luminance_range->max_luminance,
+					     panel->vbt.backlight.pwm_freq_hz,
+					     intel_dp->edp_dpcd, &current_level, &current_mode,
+					     false);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 7d93266bf26a..d45619db02a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -261,7 +261,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 			NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
 				 nv_conn->base.name);
 
-			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
+			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info,
+						     0, 0, edp_dpcd,
 						     &current_level, &current_mode, false);
 			if (ret < 0)
 				return ret;
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index fcbf447206cf..91094a38594c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -860,6 +860,7 @@ struct drm_edp_backlight_info {
 
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u16 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.34.1

