Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD97AB0983
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC5110E97D;
	Fri,  9 May 2025 05:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrTWIVm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1CD10E979;
 Fri,  9 May 2025 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767929; x=1778303929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NktSzkBvaWysi5s78/4QPoM3v84aLbAN8agtJthL584=;
 b=KrTWIVm97PHaZVrW7PDPPgWJwSlPyKja1+O2wigPte25DSOyXib77rGM
 IB2om29cEo+KiNFnHocPWyLZtiXeXYHxRz6By9DRff42oWjShTVSAhtfD
 8eo8WUKVvTxV+Hnashb+SNsrG16cYldGiKAbIdp7eJyOBIk42DN2/EePW
 LpnFNEYGu74/ZVr+amBjGQNcMTbwKI16VRm9+kba8VR6wyeraoiQ+PoAW
 rc4N/mnuf2M0gD6sFfUflqInnbfd0QD7CD5S6KIHu48+f4tuB2mHbsq9x
 jVmZbWSUEYzJOSGy/ufSbqOFiB2TrmrwUpr9OTOquV+f1alcDh53IxrnD w==;
X-CSE-ConnectionGUID: J71ayofgRkeeWtSkKC5Now==
X-CSE-MsgGUID: ccmT0RxOSveL85UXc9bpgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287090"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:49 -0700
X-CSE-ConnectionGUID: vYJZeRh8TOmp0i/ui80MbQ==
X-CSE-MsgGUID: h9gq2vi/T9SdTsnBASpGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414863"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Date: Fri,  9 May 2025 10:48:06 +0530
Message-Id: <20250509051816.1244486-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509051816.1244486-1-suraj.kandpal@intel.com>
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
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
drm_luminance_range_info struct which will be needed to set the min
and max values for backlight.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
 include/drm/display/drm_dp_helper.h                   | 1 +
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 952b06414641..8d0f8366fd4a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * interface.
  * @aux: The DP aux device to use for probing
  * @bl: The &drm_edp_backlight_info struct to fill out with information on the backlight
+ * @lr: The &drm_luminance_range_info struct which is used to get the min max when using
+ *luminance override
  * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
  * @edp_dpcd: A cached copy of the eDP DPCD
  * @current_level: Where to store the probed brightness level, if any
@@ -4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  */
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+		       struct drm_luminance_range_info *lr,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u16 *current_level, u8 *current_mode, bool need_luminance)
 {
@@ -4372,7 +4375,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 
 	bl->aux = aux;
 
-	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
+	ret = drm_edp_backlight_init(aux, &bl->info, NULL, 0, edp_dpcd,
 				     &current_level, &current_mode, false);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index dc6f6680774f..a4fee7c622ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -599,8 +599,9 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 			    connector->base.base.id, connector->base.name);
 	} else {
 		ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
-					     panel->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
-					     &current_level, &current_mode, false);
+					     luminance_range, panel->vbt.backlight.pwm_freq_hz,
+					     intel_dp->edp_dpcd, &current_level, &current_mode,
+					     false);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index b938684a9422..a3681e101d56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -234,6 +234,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 		    const struct backlight_ops **ops)
 {
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct drm_luminance_range_info *luminance_range =
+		&nv_conn->base.display_info.luminance_range;
 
 	/*
 	 * Note when this runs the connectors have not been probed yet,
@@ -261,7 +263,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 			NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
 				 nv_conn->base.name);
 
-			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
+			ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info,
+						     luminance_range, 0, edp_dpcd,
 						     &current_level, &current_mode, false);
 			if (ret < 0)
 				return ret;
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e984e8bc2398..6ec165dc5e56 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -849,6 +849,7 @@ struct drm_edp_backlight_info {
 
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+		       struct drm_luminance_range_info *lr,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u16 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.34.1

