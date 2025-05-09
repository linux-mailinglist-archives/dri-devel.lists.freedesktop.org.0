Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C001CAB098C
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894AF10E98F;
	Fri,  9 May 2025 05:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2vY7ZcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA23210E997;
 Fri,  9 May 2025 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767936; x=1778303936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3iQSXswWbcFJcOQ726wWYauTvykXXNkfkujev0pE04=;
 b=D2vY7ZcNKKa8K2eqsqzc74oR2jql+9YzAd4BGLkC7ZV13Ld075lQRYEp
 cRAMiDbRpFnD/aDLFs3f4boIfinyX1Vqnhrx8wVGjCn4RNvY74Kbizdew
 Te3L6bTtoKRXbQxA5Wt0Dc+FPYW3gAtcWDk1iK/ePDwopqZMYLVlZSWQb
 ctXWvVD2xekH9S4Zwbig3yC3PM6yLg0yOyWbznnKnSfgvVnG4Wpb0Ny2p
 ddfIL7ArO5iY0Hf9GVEZSFxZBpEx0sfkVufDQ30HIF/liQ2VdZ2jQDkAO
 /qSjxkyHATBopjiEJMfViSWhYr/iMWnVYwSiqZjoOdtBv3eG8ix4ooysi Q==;
X-CSE-ConnectionGUID: 7EkDcydJSwWlPjPS0xOrdA==
X-CSE-MsgGUID: zP2V7MtHS1+ATMqIoRHzHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287145"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:56 -0700
X-CSE-ConnectionGUID: nx7qXjshTrK2PDisB2++VA==
X-CSE-MsgGUID: q/bl/FNmSxiz0YLtf0dnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414920"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Date: Fri,  9 May 2025 10:48:09 +0530
Message-Id: <20250509051816.1244486-7-suraj.kandpal@intel.com>
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

Modify drm_edp_probe_state to read current level from
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We divide it by
1000 since the value in this register is in millinits.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 35 ++++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6588be6605b6..0c90f161bf4d 100644
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

