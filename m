Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E76AB0996
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827F310E999;
	Fri,  9 May 2025 05:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="al/9bTIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4310E999;
 Fri,  9 May 2025 05:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767943; x=1778303943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VP8PfOSZckJoHCWU6DVp4tn73DL8CdXNe6Kr6BekrPk=;
 b=al/9bTInDGK7hLvSKdgjptka3WOBHw52ezfV2VdpVIpYA1HKCoeRNi/H
 0gfoSROcTsrCbjjGIFJAzUYdruNlpgn+Vg1danmOXTJeI9PRPVJd07wLv
 tHcnIiJOX+Qavsi6cL1c2lnB9Z7S7inTIH3LfqL36Kq2x1KNdJI4BzLB0
 Pxz8m430oAFXCtyx3gp/GoLKUHcy0B4V3EqG4iairKItvC8paMc2eoexj
 ELwad7pS62M16Ieo0q0PAcAsBjoOBOn8qTp4jwIS3O0bFZErIiaDJ1wng
 qtYQC19K09rW8pWx7TV4iCSxwMnCsCxJSqNhHiUPJQDt9e7aZbo2haXPU w==;
X-CSE-ConnectionGUID: +zm1R3+vThmHNSQQerNmfg==
X-CSE-MsgGUID: ORydGUqOS1esqtdY/ZA6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287149"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287149"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:03 -0700
X-CSE-ConnectionGUID: BwY7T2IJT5CpTpjOnKK44Q==
X-CSE-MsgGUID: allGkLj0QSSDI1tqGXINoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414929"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:19:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/13] drm/dp: Change argument type of drm_edp_backlight_enable
Date: Fri,  9 May 2025 10:48:12 +0530
Message-Id: <20250509051816.1244486-10-suraj.kandpal@intel.com>
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

Change the argument type to u32 for the default level being sent
since it has to now account for luminance value which has to be
set for DP_EDP_PANEL_LUMINANCE_TARGET_VALUE.

--v2
-No need to typecast [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b0688945649b..f99e3ae78eac 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4020,7 +4020,7 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
  * Returns: %0 on success, negative error code on failure.
  */
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-			     const u16 level)
+			     const u32 level)
 {
 	int ret;
 	u8 dpcd_buf;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9bed728cb00e..0f29e1f0e0b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1829,7 +1829,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
 			drm_edp_backlight_enable(&nv_connector->aux, &backlight->edp_info,
-						 (u16)backlight->dev->props.brightness);
+						 backlight->dev->props.brightness);
 #endif
 
 		break;
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 88b858048746..eca4b3b701b0 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -855,7 +855,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-			     u16 level);
+			     u32 level);
 int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
 
 #if IS_ENABLED(CONFIG_DRM_KMS_HELPER) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
-- 
2.34.1

