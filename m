Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34200AE13F8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91910EAFD;
	Fri, 20 Jun 2025 06:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK05jWh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA8A10EAFD;
 Fri, 20 Jun 2025 06:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401337; x=1781937337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtRHbJI0mAs4m45isWqpGAdJIu9dQP6pFHNAKUeRAPU=;
 b=ZK05jWh+3NdNBGniE8qMHIcXfmF7uEvPwAUEJRKCj1FDZlY6FO8CzCoz
 h9q3yyzAp+k3d4+i6WidkKKGpWHRWyGDUjQesYCXcvgE4GcCYuR/GwvUc
 JBbU2RPbrcM+KxsG3vvW4HSoDFsTT5i86D1fHyDPzFjWntBWcHS5x/l5T
 ugi9b82iII1iwKJPj7GssiwSzAg6hBKlzIkswBfYkJay8ALhq1QEQx/T8
 B+DPGPWxGRUExkRODgmTyUl76dtb13p2ZSa3ab16N4/MXMjSUGTZBtVAT
 eyvgznfx1Iak9c/1jnGCYx64vsLXOBBy9A8XgXe/Zccw/TOW+Hm7A/y0K A==;
X-CSE-ConnectionGUID: JSWdLWq2T8ephw0XCTHZ2Q==
X-CSE-MsgGUID: J/c/ySfBSUiO0Jvm2bk5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701887"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:37 -0700
X-CSE-ConnectionGUID: hY782gFkSuirWdiz7V+zIQ==
X-CSE-MsgGUID: SN2BemALS2CdQuilNsihQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440371"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:34 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 08/13] drm/dp: Modify drm_edp_backlight_set_level
Date: Fri, 20 Jun 2025 12:04:40 +0530
Message-Id: <20250620063445.3603086-9-suraj.kandpal@intel.com>
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

Modify drm_edp_backlight_set_level to be able to set the value
for register in DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We multiply
the level with 1000 since we get the value in Nits and the
register accepts it in milliNits.

--v2
-Add comment regarding the unit [Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 4d8829e00599..c078e444014d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3960,20 +3960,28 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
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

