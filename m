Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D83A85288
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2969510EACB;
	Fri, 11 Apr 2025 04:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZfV9osO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210010EABE;
 Fri, 11 Apr 2025 04:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345752; x=1775881752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIvsKEprbPOzCAgh/YaUq9iFOp7pX4rKrZ6/dl5l4FI=;
 b=HZfV9osOaMC0S7VdgKlEI62YeBTVt24anX1314cczxSGbpCfANbZjcsS
 viT7iDVLS2PCyruglfM/daVpZJjTpgMsTXFGVqeWJ4Z9OLd9Fj/qXy+yX
 hzvBMn9HV2RWWX4+fkDkIqelVPi60fbFkZclOugF6dYSmNDHL1gboqHbC
 lQJLOMqy7bxyo4qTavhmRP160Jlh8KDX0HuIRhm4e2Hg71aicxhGDTRPp
 UBKCvt1XDt7sKKI/WFHAbfH7216Iz7ii7WVsvLWmCmV9e/Ik34Wf9/Xze
 IDAM9BqKMgCTGU9UZbh3yZzUZcycAK7wqIKJwxKnXLgIr2afr/EBq36HJ Q==;
X-CSE-ConnectionGUID: ArUi4l4YTPKvLoh7uFKVtg==
X-CSE-MsgGUID: PTDZBOwoQP+INaggg5VWYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259925"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:12 -0700
X-CSE-ConnectionGUID: n83p4VkwRGiBLbNlCnV70Q==
X-CSE-MsgGUID: LOeLnFnBS7KsLjTU85Oc+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057000"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Date: Fri, 11 Apr 2025 09:58:59 +0530
Message-Id: <20250411042909.2626807-4-suraj.kandpal@intel.com>
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
index 99b27e5e3365..3b309ac5190b 100644
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
index 6dab8a0c0d74..22af5cf83b1e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -600,8 +600,9 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
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
index ef0786a0af4a..6f53921f5dce 100644
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

