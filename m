Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F1A876BF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F4A10E48C;
	Mon, 14 Apr 2025 04:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXomGoJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14AE10E490;
 Mon, 14 Apr 2025 04:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604248; x=1776140248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lo22Toj4KKjay+XfDoVD5pCKcEmUXBnz5TdYSsYLqqw=;
 b=KXomGoJfVUu5FtrbY5UgB2lWdaPIu86bgRupJBGxF2G3Z6bDW10x60Ho
 OpG1baIdLskO6vIW7EUEl6oOvR4LOMzsL7z0ETFzowgnJpk5R2ySSfDYV
 5l5Fcfy80SzeoMBcbdmRy3y7QItJHmKt1BIYFHBhvlhzfEAf+mmmirNZw
 G89IBJ6sCXGJWEaRzcxAJekY7LLQ9d+ZYrKzTG0R9I5vtwQjFilZMQ1ok
 kYCO8jo2I+/0Tbh1cp30vL5CGXllWuWMm+cRN1AbmMfLzrM3Lb/pN6Hyj
 N2Ygnd103xcjDVpt3E82VB9q8kCJlc2yRAKksLBkrQg48HxKcFuByJh6e w==;
X-CSE-ConnectionGUID: uzybjeuHTZiHCtwbFNbISg==
X-CSE-MsgGUID: E8iZ4VE8QqmGYWtC9asyIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070044"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:27 -0700
X-CSE-ConnectionGUID: pJv8ACBBQ2anRudyBV+aWg==
X-CSE-MsgGUID: bYr2DawVQL69QhNJNLLtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658094"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:26 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Date: Mon, 14 Apr 2025 09:46:30 +0530
Message-Id: <20250414041637.128039-7-suraj.kandpal@intel.com>
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

