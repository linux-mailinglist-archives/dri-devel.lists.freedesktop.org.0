Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE6AE13F7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1569B10EB06;
	Fri, 20 Jun 2025 06:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0yv0KkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A9810EAE8;
 Fri, 20 Jun 2025 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401334; x=1781937334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0ilyCakHy/33SpGsSMIo3xhva6rXMrhvde80wtr/4w=;
 b=J0yv0KkQOW3KnMiDHAfb40dQDhMvPYM/GPe2FuuFMdZBx+CMXnbcvxco
 B/ztKIcSOKkxr1FzU5xAEDOQOumFnL6FBuuhmabpvhTuuTs+f9ZRcSr83
 VC5d8mxlVC8Uw6ZSehDnvdsbO3L5jGKuprcIFka/cwLEKsdLK0G8Ahxxg
 8bVgJ3SbWmcqo20L+WNguU/GXyxGdmVpMa8q72pAAC+mMFZe81xid5c3P
 ruxqsicb24K1TNMSweKaFevm9boTdTeuieCJJJu6KwQ+torA0teE/xaHH
 EiP8Ivk+5imre4ggWIiuy3iqKUd3BYnDxayZ1un/tfq5zPjkrn/v5jruH A==;
X-CSE-ConnectionGUID: QN7XmRrzRjebHmydXJj7xQ==
X-CSE-MsgGUID: 4CvFUUZqRfa6ohX05R6OTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701876"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:33 -0700
X-CSE-ConnectionGUID: KpwmAIZzSRefMBEKXABtdg==
X-CSE-MsgGUID: Q4je5U0ZTPGvRGkA//cXtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440344"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:30 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Date: Fri, 20 Jun 2025 12:04:39 +0530
Message-Id: <20250620063445.3603086-8-suraj.kandpal@intel.com>
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

Use u32 for level variable as one may need to pass value for
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.

--v2
-Typecase is not needed [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 53f02dc6c3f1..4d8829e00599 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3957,7 +3957,7 @@ EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
  * Returns: %0 on success, negative error code on failure
  */
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-				u16 level)
+				u32 level)
 {
 	int ret;
 	u8 buf[2] = { 0 };
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 21984bac0743..56e34568a16b 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -864,7 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
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

