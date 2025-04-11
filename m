Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF368A85283
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953DB10EABF;
	Fri, 11 Apr 2025 04:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVjXfInU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758D10EABC;
 Fri, 11 Apr 2025 04:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345748; x=1775881748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5kUo0MN8vk6gjqgDbMXEDSvx4Q+AVA8Jzic6PLoT7s=;
 b=AVjXfInUvzxQZR8c2AY5984FELoT5f6aLT5iTw5H90rp6HPS+QIxLqcW
 lrts8afn/NFSiJIxjWX2K5lw0rahaAhEzw4UJhIrtisELFqkiR7T43FH5
 10l+g5crUt+hX3H4XAaOrZ06GmVemNLq5jd7pqNw74Ou18KykAVt7UtQB
 rQ1RZkBW+tXxV58eyJYP/JPT9pb6WvlAodS0nowwljAi6yDU9o8qMmQvn
 cLtLJW303wTGQc4hFuTwzSYeFZeNSPfg5Cd38y6RWQNE4mm3CxQB8//qG
 TPpfw0q1LQTbH12Pw8QPUmQIBUN5NTFrp/IgkK/ZYtef4Bf4UC3FJ8/SN g==;
X-CSE-ConnectionGUID: bd4WwYusT1y07/gXry3C9A==
X-CSE-MsgGUID: dbkJoQ2JRaKl+ttqyDxEOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259920"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:08 -0700
X-CSE-ConnectionGUID: ZZyBtLmxQFGO0zKPbjXx2A==
X-CSE-MsgGUID: nCrR0rGkQhiM9BedbSX7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160056978"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/13] drm/dp: Add argument in drm_edp_backlight_init
Date: Fri, 11 Apr 2025 09:58:58 +0530
Message-Id: <20250411042909.2626807-3-suraj.kandpal@intel.com>
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
index 41de7a92d76d..99b27e5e3365 100644
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
index 8173de8aec63..6dab8a0c0d74 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -601,7 +601,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
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
index b8fdc09737fc..ef0786a0af4a 100644
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

