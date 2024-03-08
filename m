Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC0876802
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2CD1138F8;
	Fri,  8 Mar 2024 16:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeIRrOMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386CC1138F8;
 Fri,  8 Mar 2024 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709913878; x=1741449878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbBngkMnhEMcyPT4tGF/IJCSCiRoxdR9wa9pnAlSTJc=;
 b=YeIRrOMxeLhU6xR4WJA0pCxVRaEbtQrD9FRPEMno6C+1JbfBIdEBMMcH
 UtMN8gPTUsn49fDkJM02QT/ZigaMthqtytYHW8WgSLArv6bcPc/NjeSc3
 0M0WVfyGraZtWyEqq0CeHdfcev/d5qssvCn0EkD3qeUx+LFPUrIbG9PA3
 bAh+R2hxJEA9d5T009uYy+VfVIEMqkKyT3LON/FyxidJLceCLk48xEhIv
 8ChEYfGh0bjE1H6DzykeCkI6wXHL527Em3iF7JjzbiSkwTzrMtwZxyrqk
 6ID8SFoDcBcCO/cMX1utw07GYwBJFLZ9Z7vnXP81OO6xsf3cuWJW0v45M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4564103"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4564103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="10511794"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH 8/8] drm/exynos: simplify the return value handling in
 exynos_dp_get_modes()
Date: Fri,  8 Mar 2024 18:03:46 +0200
Message-Id: <64cc680f14d961cedb726a6fd5c6dfd53ca9bb85.1709913674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709913674.git.jani.nikula@intel.com>
References: <cover.1709913674.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Just use 0 and 1 directly, instead of the confusing local variable
that's always set to 0.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index ca31bad6c576..f48c4343f469 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -74,16 +74,15 @@ static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	struct drm_display_mode *mode;
-	int num_modes = 0;
 
 	if (dp->plat_data.panel)
-		return num_modes;
+		return 0;
 
 	mode = drm_mode_create(connector->dev);
 	if (!mode) {
 		DRM_DEV_ERROR(dp->dev,
 			      "failed to create a new display mode.\n");
-		return num_modes;
+		return 0;
 	}
 
 	drm_display_mode_from_videomode(&dp->vm, mode);
@@ -94,7 +93,7 @@ static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 	drm_mode_set_name(mode);
 	drm_mode_probed_add(connector, mode);
 
-	return num_modes + 1;
+	return 1;
 }
 
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-- 
2.39.2

