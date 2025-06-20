Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B39AE13FC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4374110EB04;
	Fri, 20 Jun 2025 06:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0b/UJPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB9310EB04;
 Fri, 20 Jun 2025 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401341; x=1781937341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpxPDIAswHf0up4yVY54OHM6a8sQonNjYjf0H909J30=;
 b=Q0b/UJPE7P4mRsRi1XqSWdr0bpKObmMA5hxvWlLXciHEFffQn64odu98
 uVNdVl2IyaahvHla9O7ueW0w3qRwtNtHHv3xpsla//UK0oySfzNMgLAcd
 dlrgvbBCjk3d5lNy8IkW+5mzlgO8ENQ0Xiny5MEzi+EmE53f4WAoH1pTH
 FspM5qQ13S6fVIk6aYpiPEUeJlW6jacMdb0c67YyupVJj3E+7qJQ6HpzT
 QsM4oYtMIE1YZEjxwZpCuP1JQR3HBGStxGbDAFmRZkcYYO7wUdFPkE3Pb
 NKcI+IuIPCIXNqFlD1S9dyvrgSFP6Z+OJtc5Yohlwi+UDNiWqauz7eh1+ g==;
X-CSE-ConnectionGUID: eX7//q0DSz2emax62UUlXg==
X-CSE-MsgGUID: UeCdmQY3S0OEa02trhEjng==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701890"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:40 -0700
X-CSE-ConnectionGUID: fMkehDbBTWuvmeBSfVC5nQ==
X-CSE-MsgGUID: NqbRKNUpTeyiFT2cB8XWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440378"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:37 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 09/13] drm/dp: Change argument type of
 drm_edp_backlight_enable
Date: Fri, 20 Jun 2025 12:04:41 +0530
Message-Id: <20250620063445.3603086-10-suraj.kandpal@intel.com>
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

Change the argument type to u32 for the default level being sent
since it has to now account for luminance value which has to be
set for DP_EDP_PANEL_LUMINANCE_TARGET_VALUE.

--v2
-No need to typecast [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index c078e444014d..fc1eb8b7bbc1 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4044,7 +4044,7 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
  * Returns: %0 on success, negative error code on failure.
  */
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-			     const u16 level)
+			     const u32 level)
 {
 	int ret;
 	u8 dpcd_buf;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e5d37eee4301..e97e39abf3a2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1839,7 +1839,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
 			drm_edp_backlight_enable(&nv_connector->aux, &backlight->edp_info,
-						 (u16)backlight->dev->props.brightness);
+						 backlight->dev->props.brightness);
 #endif
 
 		break;
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 56e34568a16b..774c6d3e2001 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -866,7 +866,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-			     u16 level);
+			     u32 level);
 int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
 
 #if IS_ENABLED(CONFIG_DRM_KMS_HELPER) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
-- 
2.34.1

