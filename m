Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254BEA876CA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEB610E49A;
	Mon, 14 Apr 2025 04:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnpK633l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6610E495;
 Mon, 14 Apr 2025 04:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604250; x=1776140250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+exsHkBIQVAH7I3fzUlTAHIX4oVlF+axeoik+yas0fw=;
 b=jnpK633l34GhYsn8td5Z3xkhsgbcPwn8ZJFp+2ZXMLwKhuSdZHWVEOM1
 +3GDvqzw/PMxNVnTaPoKeA8slCB3y3pbnHWUpV/a01P3jdoVk5JMI+UGD
 3qjs4rgcPwEomUY5NEfhthaELN0FwuX7P2DSJM7RSuRKRNnfUMEjp2xfz
 u1A5x5xL6NCF0ALO2VO5QuSV2UJVQJh5HkAIWG1Qq8ksBjlDAmUR64kgJ
 qjHmL/ftu2akp5IsWCCQVyQuCp+EGrDjexfizdA/xuitV/bVfhs1On0CM
 vW9YN21KgIeLPFb7ESupRxq9FDMPdtrBXIWGoEyb34lNgwcLtajBokMHY w==;
X-CSE-ConnectionGUID: mbshlLkBS1iLyjmbcDjQgg==
X-CSE-MsgGUID: V5yRkZZcRy2f+ZqzcYpWUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070047"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:30 -0700
X-CSE-ConnectionGUID: JDbTUIqESmWhzoC3KfqfBA==
X-CSE-MsgGUID: UBLLwKebStOb9LVWsm7Lng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658097"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Date: Mon, 14 Apr 2025 09:46:31 +0530
Message-Id: <20250414041637.128039-8-suraj.kandpal@intel.com>
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
index bb1242a1bf6b..c4c52fb37191 100644
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
index 62be80417ded..6bce0176efd3 100644
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

