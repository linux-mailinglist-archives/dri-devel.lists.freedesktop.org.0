Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D8AB098E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BDF10E99A;
	Fri,  9 May 2025 05:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8+3RcWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E524B10E999;
 Fri,  9 May 2025 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767938; x=1778303938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gAm4cpOsMF83v3Ie60fveNhvolMpvxzNsiPJLnucaFQ=;
 b=S8+3RcWpKFbOMQeu8h8ON0STChQdHmFvFH1pHQuGmtK1XVI04GDdQOZ2
 Djr5xBb8YbeathhP4alwrSoFXme4OMHmOf95wQFGYYxiDG8NGPAeqC9lD
 3dflY/oeUEXHEmlmvGD98WQkPn3q93G6kiv2elMyN94i8+WSg04/qhsWM
 p2x2UjGfEENsdIln3lZG1GRkqCVqvbyKreNG4+pNSKxkExSRmPrWeVA48
 1olRGGFrhfmJlSJMpRWYOg4vTVIyVm765V+EvJ+aDuuPOpg1yuiTeC8CS
 FEisZEZ1tBdYCFZVxMGqQR+zjeJ1VOrhlazjX4Oblz4vaY/3tJOuZKDfC Q==;
X-CSE-ConnectionGUID: KYe2FMUhQOyOhP9g/iffxw==
X-CSE-MsgGUID: hSMIFbkBQu62R5jC0UOJ2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287146"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:58 -0700
X-CSE-ConnectionGUID: v0SUXjYkSDyi7h/f+YYkag==
X-CSE-MsgGUID: bmXF+vOySzCl6+iCKzTCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414923"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:55 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Date: Fri,  9 May 2025 10:48:10 +0530
Message-Id: <20250509051816.1244486-8-suraj.kandpal@intel.com>
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

Use u32 for level variable as one may need to pass value for
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.

--v2
-Typecase is not needed [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 0c90f161bf4d..b17f9e75d93f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3933,7 +3933,7 @@ EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
  * Returns: %0 on success, negative error code on failure
  */
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-				u16 level)
+				u32 level)
 {
 	int ret;
 	u8 buf[2] = { 0 };
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8acc20a3b80a..88b858048746 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u32 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-				u16 level);
+				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 			     u16 level);
 int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
-- 
2.34.1

