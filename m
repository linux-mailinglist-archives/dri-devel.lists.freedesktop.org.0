Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E3AB0992
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCB110E99E;
	Fri,  9 May 2025 05:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAGnY/Pb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07D10E991;
 Fri,  9 May 2025 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767941; x=1778303941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U16/0ExCHjtm/OJsDuARG/8gUy4sQVVfNnTh5hvK9ew=;
 b=BAGnY/PbpQGGBvFU0PilAY70YqPCBx0v3YjtKFkaFXAsVXi5yRG6X5xd
 TtRwFq7Fxf9EH9lR3sDtn4tC2zcrvgn6D1pm2DrRtUWvYeFD6yj+vGKNa
 XPmVgwtUFLTOq8p6lp/8hN65JK/NP2cVToA2RfwSUoqrGvvvDqArW5WPU
 dkoe91ezZTjHyBQhoMm2WhbQ27ELiEVsUKBkL/3u9MqyIviVVT+dKCnxE
 IA1lNx+k1hx+wjDmuJuIyXy1qpYEGV50R1Draa3anDD7STaJXdrrFVNvm
 wAS+PoWZWze+QON0744uBOOV5egxREBPXToNNna23pjTVRh/89Vk9Ub/u w==;
X-CSE-ConnectionGUID: Twzk8aGlQJCx1vmpj+kXeA==
X-CSE-MsgGUID: NIsh5L6eRemu/ACVfsIi4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287147"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:00 -0700
X-CSE-ConnectionGUID: nwlqq/PpQnKyuYXeBtV19A==
X-CSE-MsgGUID: FF3L9+SYSqGHfgkpg2R2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414926"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/13] drm/dp: Modify drm_edp_backlight_set_level
Date: Fri,  9 May 2025 10:48:11 +0530
Message-Id: <20250509051816.1244486-9-suraj.kandpal@intel.com>
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

Modify drm_edp_backlight_set_level to be able to set the value
for register in DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We multiply
the level with 1000 since we get the value in Nits and the
register accepts it in milliNits.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b17f9e75d93f..b0688945649b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3936,20 +3936,28 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 				u32 level)
 {
 	int ret;
-	u8 buf[2] = { 0 };
+	unsigned int offset = DP_EDP_BACKLIGHT_BRIGHTNESS_MSB;
+	u8 buf[3] = { 0 };
 
 	/* The panel uses the PWM for controlling brightness levels */
-	if (!bl->aux_set)
+	if (!(bl->aux_set || bl->luminance_set))
 		return 0;
 
-	if (bl->lsb_reg_used) {
+	if (bl->luminance_set) {
+		level = level * 1000;
+		level &= 0xffffff;
+		buf[0] = (level & 0x0000ff);
+		buf[1] = (level & 0x00ff00) >> 8;
+		buf[2] = (level & 0xff0000) >> 16;
+		offset = DP_EDP_PANEL_TARGET_LUMINANCE_VALUE;
+	} else if (bl->lsb_reg_used) {
 		buf[0] = (level & 0xff00) >> 8;
 		buf[1] = (level & 0x00ff);
 	} else {
 		buf[0] = level;
 	}
 
-	ret = drm_dp_dpcd_write_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write_data(aux, offset, buf, sizeof(buf));
 	if (ret < 0) {
 		drm_err(aux->drm_dev,
 			"%s: Failed to write aux backlight level: %d\n",
-- 
2.34.1

