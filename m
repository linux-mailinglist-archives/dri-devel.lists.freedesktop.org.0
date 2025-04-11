Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0CCA8528E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0109710EADD;
	Fri, 11 Apr 2025 04:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqECRGJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2B10EAB5;
 Fri, 11 Apr 2025 04:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345759; x=1775881759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lo22Toj4KKjay+XfDoVD5pCKcEmUXBnz5TdYSsYLqqw=;
 b=dqECRGJZAdLDCxJhS1hgKyiG2QE7xTaYZcLJx2Uf99egxBOpLwsvYMf+
 a1XVHPzBu98pIaYZYcJBBbFn0qMILYdZ/ZbUD2nLyaovtEH43NbLkNFJq
 ljI2ijU5FWr9ETGfyZlapnuaSjf46C2SPzL4fVBn8igmy08pfVvx0YlD/
 ZaSNO3YTgsqOSUy/1F91EY6g6x7ddnw/ld0XUqvkoHYTMdX7PFZtcYK6L
 K8BYWBA6Grdn35mympiaafkpXAIIB9RIUFDi5jSclshD5c1OabKQRXVr6
 Q/5Vuq1LRzP4HKFxB60XzyiMS9uo2rB0VRT3xl8jbFS+t5ioIHfcW8Puy Q==;
X-CSE-ConnectionGUID: FLzTPqBtQuKXtidmqIiA0w==
X-CSE-MsgGUID: HaoV6joPQ+uiRvpwxfsb1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259932"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:19 -0700
X-CSE-ConnectionGUID: SqbMdds5SPyCLX9GKk2zvg==
X-CSE-MsgGUID: v4HYE5XnThevvr3rOJH1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057046"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:16 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Date: Fri, 11 Apr 2025 09:59:02 +0530
Message-Id: <20250411042909.2626807-7-suraj.kandpal@intel.com>
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

Modify drm_edp_probe_state to read current level from
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We divide it by
1000 since the value in this register is in millinits.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 35 ++++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index c58973d8c5f0..bb1242a1bf6b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4185,7 +4185,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 			      u8 *current_mode)
 {
 	int ret;
-	u8 buf[2];
+	u8 buf[3];
 	u8 mode_reg;
 
 	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
@@ -4202,17 +4202,32 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
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

