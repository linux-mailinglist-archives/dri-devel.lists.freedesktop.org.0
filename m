Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B0AB0980
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBCC10E974;
	Fri,  9 May 2025 05:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6aELSqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6F10E96F;
 Fri,  9 May 2025 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767926; x=1778303926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fzlaGaTAKUYUc0asWJLnpVoDGzu0VrNZymGpHPlxMMA=;
 b=M6aELSqX6HTXR84CO+GPs22bYGHLxMTb2vJVyhnuXMONoOCWTHDpo9Qj
 IHbAaqGtVB0Sp4cTtbO0QIZAREpBF5R1uRchrzSCc69XvaWmZOu0nUPBX
 fGDqjAlbE6SpG2fzgiQm93wo4QVIzKBWGkDWLuNqDetSUu0R2QQTxSiFG
 huyHu/FdzJTdS1+EcH6wt6WdcERf5TXJuF+m4YZwSyv3ALvAY11BPzwxN
 j38L3+wvclSMD9HpCUaduNUNF5JeLrowlobrgRLmXajYpp4JrYavPK0nt
 6IoUbFGj0gCNb9HuSywTlrG2dFfvYgINESsc70YOXV1Qlrjg37aHTuyJR Q==;
X-CSE-ConnectionGUID: 87QCeCTOTAKORaR/oEbD/Q==
X-CSE-MsgGUID: r/4CLQkKSFW0ayRtJD6hRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287088"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:46 -0700
X-CSE-ConnectionGUID: 19oH/Q+yThO/3PHZCd0y9w==
X-CSE-MsgGUID: a8wyLodFSS2mVCGkNyBCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414840"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:43 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/13] drm/dp: Add argument in drm_edp_backlight_init
Date: Fri,  9 May 2025 10:48:05 +0530
Message-Id: <20250509051816.1244486-3-suraj.kandpal@intel.com>
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

Add bool argument in drm_edp_backlight init to provide the drivers
option to choose if they want to use luminance values to
manipulate brightness.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c               | 7 ++++---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
 include/drm/display/drm_dp_helper.h                   | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index ad8ba438e755..952b06414641 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4231,6 +4231,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * @edp_dpcd: A cached copy of the eDP DPCD
  * @current_level: Where to store the probed brightness level, if any
  * @current_mode: Where to store the currently set backlight control mode
+ * @need_luminance: Tells us if a we want to manipulate backlight using luminance values
  *
  * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
  * along with also probing the current and maximum supported brightness levels.
@@ -4243,7 +4244,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-		       u16 *current_level, u8 *current_mode)
+		       u16 *current_level, u8 *current_mode, bool need_luminance)
 {
 	int ret;
 
@@ -4254,7 +4255,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
 		bl->lsb_reg_used = true;
 	if ((edp_dpcd[0] & DP_EDP_15) && edp_dpcd[3] &
-	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE))
+	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) && need_luminance)
 		bl->luminance_set = true;
 
 	/* Sanity check caps */
@@ -4372,7 +4373,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
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
index d47442125fa1..b938684a9422 100644
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
index fdc1a39529db..e984e8bc2398 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -850,7 +850,7 @@ struct drm_edp_backlight_info {
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

