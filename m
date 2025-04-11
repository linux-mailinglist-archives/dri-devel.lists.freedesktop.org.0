Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51291A8527F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7110EAB9;
	Fri, 11 Apr 2025 04:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfnz8tm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5602310EAB9;
 Fri, 11 Apr 2025 04:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345746; x=1775881746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OByldNwN8NCGNlDniym8s9BSpgkNiZz+uK2e4Dohp54=;
 b=bfnz8tm4nVvV4hV9tR18rYA1ZKTw+pcFfiWf9DAiKQLrXrPn0pw982Fl
 utGEyacdpl4aT13f/bbcP9lIeDVVPwG3jbnYqLtWuiv1/7k5LkYKPBBaP
 7jesMYGgiz1fsEdmYeKB9CRBcjsuQeNueollE3f1VCPADMjbJVCUo+Rdb
 BCUZLDy6/oX27R1Ia1NuBDoKxfbvFSvo7HbflgTjXkzIYB1G53xYfjX0b
 ETi6IcwCO88ZZDhQhU6ZJYZrdrnASBXaUZsNmWwR/D+9fRLr68ncYBKUQ
 JBdRNv7Ul1kFjxrwWE5h3bb0M5H3p/1rA7pnzVwSjaT2Y82YeYjG3fUBg Q==;
X-CSE-ConnectionGUID: ZLmSQfUVQ5utWkOLhK+J6g==
X-CSE-MsgGUID: XITzSMMIQ0GME3SgaY2/vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259919"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:05 -0700
X-CSE-ConnectionGUID: B4QSyBU5Tv2WJi1ZVwC7sw==
X-CSE-MsgGUID: CRoTmCbHRhuAKh8P9chuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160056955"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:03 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/13] drm/dp: Introduce new member in drm_backlight_info
Date: Fri, 11 Apr 2025 09:58:57 +0530
Message-Id: <20250411042909.2626807-2-suraj.kandpal@intel.com>
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

Introduce luminance_set flag which indicates if we can manipulate
backlight using luminance value or not which is only possible
after eDP v1.5.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
 include/drm/display/drm_dp_helper.h     | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..41de7a92d76d 100644
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
index d9614e2c8939..b8fdc09737fc 100644
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

