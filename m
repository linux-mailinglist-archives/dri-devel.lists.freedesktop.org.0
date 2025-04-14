Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E7A876BB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3715310E487;
	Mon, 14 Apr 2025 04:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fv7N11eD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0874F10E487;
 Mon, 14 Apr 2025 04:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604243; x=1776140243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60JvWY1m2xvrwXP/Zrx3Gq88uih8rmFiEAfVzm8gqjk=;
 b=fv7N11eDSPnc0Y7QsARWNqeWdvRpIYdSUOi9lZX3WMQgby1kzhXor4Tv
 MBKfNkEW9a8mCEVrHsLQO8kh94pidHZw0cIS/yLjnQwD671IC1VlVJXyb
 LUlsf50IetjYjsqY8KOpKoL2Yl0fliw68Pvt0hBF9fxXbrexLXpt5x0r2
 HDRNmqeVACzTCI4SISgRFMOXlit8FIeXkdme87bRK1J1ja2j4e+YVmB0r
 WliVnWz0T4CoLjNpNQsx4NHEZ49TNkxYS9tZF+UpGodpRWeWGwqoIbmwc
 DHMS63iFPVCbDrrJLXAyQx3Q+JOhYOHx/UE5N8+8TclvVPGLV/npYxsPS A==;
X-CSE-ConnectionGUID: fNyDUOHQQf2X6FC+X1I7VQ==
X-CSE-MsgGUID: iB8bbPyiS3KSxoAtf168Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070037"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:23 -0700
X-CSE-ConnectionGUID: RYdWNXvQT8OSGe3rzgsoIg==
X-CSE-MsgGUID: e3ozEWLvRcGrR5p2j3JwJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658085"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:21 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Date: Mon, 14 Apr 2025 09:46:28 +0530
Message-Id: <20250414041637.128039-5-suraj.kandpal@intel.com>
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

Use u32 instead of u16 for max variable in drm_edp_backlight_info
since it can now hold max luminance range value which is u32.
We will set this max with max_luminance value when luminance_set is
true.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 10 +++++++---
 include/drm/display/drm_dp_helper.h     |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 3b309ac5190b..1322bdfb6c8b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4270,9 +4270,13 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		return -EINVAL;
 	}
 
-	ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
-	if (ret < 0)
-		return ret;
+	if (bl->luminance_set) {
+		bl->max = lr->max_luminance;
+	} else {
+		ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = drm_edp_backlight_probe_state(aux, bl, current_mode);
 	if (ret < 0)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 6f53921f5dce..39d644495f3e 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -839,7 +839,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
 struct drm_edp_backlight_info {
 	u8 pwmgen_bit_count;
 	u8 pwm_freq_pre_divider;
-	u16 max;
+	u32 max;
 
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
-- 
2.34.1

