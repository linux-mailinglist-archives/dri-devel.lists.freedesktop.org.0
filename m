Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E72A876D2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153A10E4A3;
	Mon, 14 Apr 2025 04:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAYbBasD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF43110E49B;
 Mon, 14 Apr 2025 04:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604255; x=1776140255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Rn8JFxWndG3YwnOAR7IUEIvIvSwI19VhaVFjrKp6Zc=;
 b=eAYbBasDWWVSB3AAmURPdM3BYH1/sEY3tTPLV0x/QUO5mE5YWRPH8Hw/
 tNsd8OQeI0kqTVK3db1ZiYT9U7ugtUlalieqvfdrIVPoCcYlluyqkD6uG
 1Sjbs7Xrdizgqtfq5gtPf7F2OC0gxlnPu13hKTtSM2+C/6qvYyJn1dd2S
 a6fvLDJ3EHyQWrxFxYJt8Xz9fEpDXSUjv61E8zvm6N0X5exEP4e4I9XWt
 klL5SILyGVEqzoP/NbbP6PMjt4rGj/1BEzqG8/GrsA9HBeS80Ky5ZbFNX
 pey/q+xgg/CtMTmIkRxp1Vm2mAuN364KM/9rotD8c3ZEgOguxbe/5FRbx w==;
X-CSE-ConnectionGUID: 7i4Z/c28QIexl2tdDOPbPA==
X-CSE-MsgGUID: fB1T/8cfTtG0Y5FPq8tYnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070050"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:34 -0700
X-CSE-ConnectionGUID: DQ/HYHsJREu5ajW1q3u91w==
X-CSE-MsgGUID: t52/CbV5TxaCikhoIaSeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658104"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/13] drm/dp: Change argument type of drm_edp_backlight_enable
Date: Mon, 14 Apr 2025 09:46:33 +0530
Message-Id: <20250414041637.128039-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414041637.128039-1-suraj.kandpal@intel.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
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
index dc0bda84d211..0421b2ed9bd4 100644
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
index 725331638a15..e3b8f6f510ef 100644
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
index 6bce0176efd3..b6c03d3ca6c3 100644
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

