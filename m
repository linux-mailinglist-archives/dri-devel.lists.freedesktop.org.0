Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A1AB097E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54F810E1FB;
	Fri,  9 May 2025 05:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FioEt9zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973610E399;
 Fri,  9 May 2025 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767924; x=1778303924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZkSdrq6TY8maLj9XMwLS1B2gKqbRjFB2B5q76f48GTg=;
 b=FioEt9zxaFU3AQYjHygwP/qg2yb+MTNx1j/4P0nlLHYtveB45EKLRsX6
 o6Om+2m8H0FAJNerrit2+U8o1abiN+XdFnwO7Ug/lzopafgC0rEeDu2MA
 YSXl7TP+n/QaEhfrvYodrat98bzeET5LQxqBBU8JFgq0bGtAv/XYso4wp
 4Z+0UBP0xfE+ynt/ZAsZp/0/xMnQaqiDSkDiYxZU3jBhU5kkQPBbh03xS
 ueH1jYqDatDZhMdQ9xU5QzeMofXK4KcX0nE2wkPgvmUtuq9PKt8lBF4XK
 sn/ava1Iaha8qJy9OVnEkAb0ZzFD4N6ItRxh+9wQibHttwTVveF+0lzgS A==;
X-CSE-ConnectionGUID: 4mE013JdTbC874+4Qm5cFg==
X-CSE-MsgGUID: JZsM5CBnT4qskuDWiwnHEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287087"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287087"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:44 -0700
X-CSE-ConnectionGUID: WJFZBZNHRBaBmXdNPJT6dw==
X-CSE-MsgGUID: SNjp308KSkGfNmiJ7h80tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414821"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:41 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/13] drm/dp: Introduce new member in drm_backlight_info
Date: Fri,  9 May 2025 10:48:04 +0530
Message-Id: <20250509051816.1244486-2-suraj.kandpal@intel.com>
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

Introduce luminance_set flag which indicates if we can manipulate
backlight using luminance value or not which is only possible
after eDP v1.5.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
 include/drm/display/drm_dp_helper.h     | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 56c7e3318f01..ad8ba438e755 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4253,11 +4253,15 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
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
index 7b19192c7031..fdc1a39529db 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -844,6 +844,7 @@ struct drm_edp_backlight_info {
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
 	bool aux_set : 1;
+	bool luminance_set : 1;
 };
 
 int
-- 
2.34.1

