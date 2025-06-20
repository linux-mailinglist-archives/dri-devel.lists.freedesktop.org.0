Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF3AE13E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3DE10EAEF;
	Fri, 20 Jun 2025 06:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF0kz9e8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A8A10EAEB;
 Fri, 20 Jun 2025 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401311; x=1781937311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gbGPQ5WzWAp4XZjf/yDX53k4HiaIdHq2z90YsruwS8U=;
 b=HF0kz9e8FCGamz84sAlqBeuqMppWtcv0h4J4ZlmKDBqUulaFOKBeUOew
 hlj29PUjta8jdii9tD0XXYwG5aRVQBabNyUQ9BdIuzh6Rble4L8P7dA0I
 hHf3ItDOlht1j1kyA6ly5Dpm8RrcGpR/UDQSrx5yvs//KrV6hkby23fbM
 yTXYP2hYVF3Arq0O780GtRB98z6T3DDAfQX6N+tr4dSO+gkmYkwai/Rgp
 Uwgvfw8SG9xhvkKsL3TG6mhQpWbAReh89g3NcAkvK9olp7ehpxqldLwXn
 0c30rSzdSZosDw2XYjcix3g+66ogBZceXwgXaEzCW/84KwKG7/z7ZSATZ Q==;
X-CSE-ConnectionGUID: 0khLuKLKRjq8rPo2sbeg1g==
X-CSE-MsgGUID: +fSiQqu1SROA1nUrKoOWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701839"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:10 -0700
X-CSE-ConnectionGUID: SkQAVokMSIa8P6mJPC+N4A==
X-CSE-MsgGUID: +x6X07B6SdCN0f48nlmccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440280"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 01/13] drm/dp: Introduce new member in drm_backlight_info
Date: Fri, 20 Jun 2025 12:04:33 +0530
Message-Id: <20250620063445.3603086-2-suraj.kandpal@intel.com>
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

Introduce luminance_set flag which indicates if we can manipulate
backlight using luminance value or not which is only possible
after eDP v1.5.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
 include/drm/display/drm_dp_helper.h     | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 385a1bfdb272..e817bed9ffc6 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4277,11 +4277,15 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		bl->aux_set = true;
 	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
 		bl->lsb_reg_used = true;
+	if ((edp_dpcd[0] & DP_EDP_15) && edp_dpcd[3] &
+	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE))
+		bl->luminance_set = true;
 
 	/* Sanity check caps */
-	if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP)) {
+	if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP) &&
+	    !bl->luminance_set) {
 		drm_dbg_kms(aux->drm_dev,
-			    "%s: Panel supports neither AUX or PWM brightness control? Aborting\n",
+			    "%s: Panel does not support AUX, PWM or luminance-based brightness control. Aborting\n",
 			    aux->name);
 		return -EINVAL;
 	}
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 3e35a68b2b41..e3b13858c8a9 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -855,6 +855,7 @@ struct drm_edp_backlight_info {
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
 	bool aux_set : 1;
+	bool luminance_set : 1;
 };
 
 int
-- 
2.34.1

