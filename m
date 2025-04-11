Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51980A85294
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742F10EAE1;
	Fri, 11 Apr 2025 04:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOXsMHXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C710EAE1;
 Fri, 11 Apr 2025 04:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345764; x=1775881764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgDUU1vdLzI5A2g3Okd4ZjpVGxoDc7CvIKpFvy/7tKM=;
 b=lOXsMHXtVs0zuIZJXC4As9kc8jncnUg3dmI0VJKVBHoaFWXxhCaAEX2n
 g3dkrglDTrsacowrVqi1flDsxOOslRQ8sBjDZBXWa7RucDRPZqeDendn8
 qClqz7nrl9aYwJ4DjtA034LwOAFGqLTmIMt2nLd7pN3/74Ds7sR4jqTFq
 aNtCpKt14Q7hZ3BfIjD8WJZ+7xpKDpAQTLt0C1umDYSgYBwkg0gO182MX
 Pp8cn1IirEVNbg5RSQIvcFs+dQNDbVSAkZi4DtmK/8NfT1wM3yDev3CLE
 fnfJA25EG3/wRH1cqbW/8FXu0Q5LgqlQt/6TvTcaNJrA9fRoedXARhnSb g==;
X-CSE-ConnectionGUID: 4mpwiTLlT5iWxuycoWGfTA==
X-CSE-MsgGUID: qKx/F29vTyGPAoDlLSw7mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259941"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:24 -0700
X-CSE-ConnectionGUID: JkUrj/F2Q72h4HqDSOwqzQ==
X-CSE-MsgGUID: 8WjJJSvLTbibIKq9Sz38yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057077"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:21 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/13] drm/dp: Modify drm_edp_backlight_set_level
Date: Fri, 11 Apr 2025 09:59:04 +0530
Message-Id: <20250411042909.2626807-9-suraj.kandpal@intel.com>
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

Modify drm_edp_backlight_set_level to be able to set the value
for register in DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We multiply
the level with 1000 since we get the value in Nits and the
register accepts it in milliNits.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 895ed4a22fc3..bbe3ff91fedc 100644
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

