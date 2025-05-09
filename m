Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B93AB0986
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821A310E989;
	Fri,  9 May 2025 05:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuMRDtCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF6810E981;
 Fri,  9 May 2025 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767931; x=1778303931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yP6A4S0VJpwuGNntN4SnEDcjppnfjmO5irbh6QCtm7g=;
 b=UuMRDtCrZn3gU0PSDS5CsVBjbA/imxkYIYYEj20pJkUCSzExQLCX7YQz
 FCYaeJU9iqa8RJunDAZqzgfSyrv3NQA0KDAnMGpGjM7Smo5BxLxy/ld/v
 VXrmB9odXJuO9AGrJqSDb4kfoUxyjSZ/y5FX63tEMpsLpYdrNzDq0iL1q
 QV9sDeMkwDpsBWcDoOE5ClLfudwxKxo/PlOqH1+b3+VBrdeVovClEkq2A
 Djvz8OAMsfvUtCtPqUtzZEPWvbbmNpxIPMcDoGc2e3HWV4BBQN+O7Ls+1
 f0DSCkKqjsw3epm7LIqImOFuLsRFFzHdyCuTQU+7c2h2ipvta/f1afjB1 Q==;
X-CSE-ConnectionGUID: t7rThuIZQo+jzizm//Z6Sg==
X-CSE-MsgGUID: DcfMUzlxQV26pCm9kTyDJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287093"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:51 -0700
X-CSE-ConnectionGUID: LAWYEb8zRO6ARoeDb4SnTw==
X-CSE-MsgGUID: uc24LxjHSCeSQuXUo3GpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414883"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Date: Fri,  9 May 2025 10:48:07 +0530
Message-Id: <20250509051816.1244486-5-suraj.kandpal@intel.com>
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
index 8d0f8366fd4a..1ba2ce99feac 100644
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
index 6ec165dc5e56..3f78e9649b0d 100644
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

