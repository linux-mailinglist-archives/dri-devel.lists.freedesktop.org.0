Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBAA8529B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16A10EAD4;
	Fri, 11 Apr 2025 04:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuF7F7HF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF4110EAD3;
 Fri, 11 Apr 2025 04:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345766; x=1775881766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XhnxkU6kVB3w105zeNhiVJoPNoATvYqU3H1NJemzSY=;
 b=PuF7F7HFIYjvc8SXudLQ5YCqGryGikKEriNuqrGqpEa8WIR7tv/7Q6YW
 XWxKGEtApiID4PACikjHLsAbc7DjzX3PMtiVeoifFCOAiikOb3M5jzBoK
 wRbAtVzjvgAqllPCt5JiMPADlegLWBvSHv3ovTg1G4fO5CMqJpoWztxBN
 DqAwesck7ZCF9oZ6cLY7k0QiZmGnxFoGjv7+DO+ER45Db9lqKAQd3Wi5J
 syWOk8AGxEH2R5g4h0i14uzl7vtDtfA97oTHRqBqOQ1ewpdCbqGIP/RNQ
 D55nINWmZwpEJbMj404TOEpKPjR8NvoA8PGiHoQv7MA8DD6vdfro8BPta Q==;
X-CSE-ConnectionGUID: 1RzKTGA0QBOggPsaexrM2Q==
X-CSE-MsgGUID: O/yIy2RkRPGOjeoDwRMh0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259948"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:26 -0700
X-CSE-ConnectionGUID: V8+8ktogSye2P6BW4hOI8g==
X-CSE-MsgGUID: P4VOq9rmQjuoBQp5KdgdIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057093"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/13] drm/dp: Change argument type of drm_edp_backlight_enable
Date: Fri, 11 Apr 2025 09:59:05 +0530
Message-Id: <20250411042909.2626807-10-suraj.kandpal@intel.com>
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

Change the argument type to u32 for the default level being sent
since it has to now account for luminance value which has to be
set for DP_EDP_PANEL_LUMINANCE_TARGET_VALUE.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 6 +++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index bbe3ff91fedc..0a2ec1147006 100644
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
@@ -4055,7 +4055,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		return ret < 0 ? ret : -EIO;
 	}
 
-	ret = drm_edp_backlight_set_level(aux, bl, (u32)level);
+	ret = drm_edp_backlight_set_level(aux, bl, level);
 	if (ret < 0)
 		return ret;
 	ret = drm_edp_backlight_set_enable(aux, bl, true);
@@ -4331,7 +4331,7 @@ static int dp_aux_backlight_update_status(struct backlight_device *bd)
 
 	if (!backlight_is_blank(bd)) {
 		if (!bl->enabled) {
-			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
+			drm_edp_backlight_enable(bl->aux, &bl->info, (u32)brightness);
 			bl->enabled = true;
 			return 0;
 		}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 725331638a15..c9b3cac47e17 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1829,7 +1829,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
 			drm_edp_backlight_enable(&nv_connector->aux, &backlight->edp_info,
-						 (u16)backlight->dev->props.brightness);
+						 (u32)backlight->dev->props.brightness);
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

