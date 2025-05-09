Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C6AB098A
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B2F10E994;
	Fri,  9 May 2025 05:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxkZcfO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5737810E98D;
 Fri,  9 May 2025 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767934; x=1778303934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TF4S30hKw1Ftak6r83ZVjbhrGLMKemQdytQhO3BA/8=;
 b=OxkZcfO0cAMvJqNaJoxemP7b/GHaKINORd4caFqgYuLmYFFIlBYipZgm
 BZ41m6gw4c/TjBopjyoIxDu/cBC3CK3trcImIltnxK5Dfq7r3OR1roRAB
 Ld15Rp58dWCjVwhemh0A9cqTcn99e7GHice1E4VlqGb/E+Cr87FH3dW8o
 tFMCEkxtjI0E0cI1IIEVpBIchDTvr6gRISYrkjpvlQUd8Yv3frRoOBnBa
 czM+iEI8r5tDL/3tMjL6Pc88xmy/4zzzTjn6SzEjbXvNBDfvfLDic/pc7
 TwsU8Iko5FjrwIho0dGBCkkNDzoABZrJoQ8P3XRz85DTERDYxr8VeKHZd g==;
X-CSE-ConnectionGUID: vzhtxOkuTd+15xGvbh5u2w==
X-CSE-MsgGUID: jX6Hx50kRd6k799ZxQ9WpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287114"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:53 -0700
X-CSE-ConnectionGUID: brk2ht+vQGOCRCG6lnLlhA==
X-CSE-MsgGUID: 9zQsBGPjSaGwVPLyYB59WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414905"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:50 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 05/13] drm/dp: Change current_level argument type to u32
Date: Fri,  9 May 2025 10:48:08 +0530
Message-Id: <20250509051816.1244486-6-suraj.kandpal@intel.com>
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
index 1ba2ce99feac..6588be6605b6 100644
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
index a4fee7c622ee..5441a7199102 100644
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
index 3f78e9649b0d..8acc20a3b80a 100644
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

