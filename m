Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D0AE13F3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1682810EAFE;
	Fri, 20 Jun 2025 06:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKYcdG6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468D710EAF6;
 Fri, 20 Jun 2025 06:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401330; x=1781937330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aAUdtDjx+DMwpFK/QcnjcG5XKBnwy92g+X1LYbm6ox4=;
 b=hKYcdG6s69FlH9h7C9tAEobKVg7zuhnCkocxtkb2vro8epc4rAE3r2n1
 GFgYH1/nARLoqfCT6AGEg6ESReeK0A5kcMrzLisLAqYhHQGswuE2+0lqK
 K/C6Rn/UPMLfaLIh2bZ/er50x8U6c7yITFchqjEDzAFYXpWfXfWqJXphx
 3kuuScMjkR/3ecO3MDVrXOE11XobX2SShnodiYvhWSvJNtfvfboWsqol0
 rc83QVRhs4FYuE9j/yjBe1brUXJbl19iAHaan9xmmiF7e5F0pkvLTYjvJ
 rPn408Syhusar4tmScieY7p9zrnAF+Lpy1VgSDvGh85E2P5vQ5uN4OjsC w==;
X-CSE-ConnectionGUID: WXHfnSKTTQuM6jFSA0Jhrw==
X-CSE-MsgGUID: y3WWUypXRd6dymCegZlOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701872"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:29 -0700
X-CSE-ConnectionGUID: kpNVppXpRNenxXKgO8PBQA==
X-CSE-MsgGUID: 4sSW8VICRiWJJJ82hD+n4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440323"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:27 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 06/13] drm/dp: Modify drm_edp_probe_state
Date: Fri, 20 Jun 2025 12:04:38 +0530
Message-Id: <20250620063445.3603086-7-suraj.kandpal@intel.com>
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

Modify drm_edp_probe_state to read current level from
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We divide it by
1000 since the value in this register is in millinits.

--v2
-Add comment on the unit sent back [Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 40 ++++++++++++++++++-------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index daeb3bdc87a3..53f02dc6c3f1 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4209,7 +4209,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 			      u8 *current_mode)
 {
 	int ret;
-	u8 buf[2];
+	u8 buf[3];
 	u8 mode_reg;
 
 	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
@@ -4226,17 +4226,37 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		int size = 1 + bl->lsb_reg_used;
 
-		ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
-		if (ret < 0) {
-			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
-				    aux->name, ret);
-			return ret;
+		if (bl->luminance_set) {
+			ret = drm_dp_dpcd_read_data(aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
+						    buf, sizeof(buf));
+			if (ret < 0) {
+				drm_dbg_kms(aux->drm_dev,
+					    "%s: Failed to read backlight level: %d\n",
+					    aux->name, ret);
+				return ret;
 		}
 
-		if (bl->lsb_reg_used)
-			return (buf[0] << 8) | buf[1];
-		else
-			return buf[0];
+		/*
+		 * Incase luminance is set we want to send the value back in nits but since
+		 * DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we need to divide
+		 * by 1000.
+		 */
+		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
+		} else {
+			ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
+						    buf, size);
+			if (ret < 0) {
+				drm_dbg_kms(aux->drm_dev,
+					    "%s: Failed to read backlight level: %d\n",
+					    aux->name, ret);
+				return ret;
+			}
+
+			if (bl->lsb_reg_used)
+				return (buf[0] << 8) | buf[1];
+			else
+				return buf[0];
+		}
 	}
 
 	/*
-- 
2.34.1

