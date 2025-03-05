Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8656A5000A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487AF10E7E0;
	Wed,  5 Mar 2025 13:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5l7AZFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BC10E7D3;
 Wed,  5 Mar 2025 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180542; x=1772716542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4416AmFyniVr9hVMluf5/wZ4m+9QPlpZS3fOZdkn/do=;
 b=i5l7AZFi1rStIHaW+DeQDV5F49NLvQycBRA6cOhS5vql7uB9QS6uVFNt
 qrwEbPIxkRpQKD4ST1ZXdDTtQxuupJBCyFUbB0ssc0DrLqWqUnEmuXLQ/
 JInn/VmZBcEbKvB7YSrJgWm2C8kxVebHxKlzXrQZUVEMMxJqDtQvkYWpS
 +PSNO5/8wQwKP+D9imwSJX7T6mqAuewvtRlzWRJHfAmvhxMMTOtzDiTKp
 2vZvHiHgm/adM0xbzS2H0PdM4aHDm3w6obbD/EMuqSjonv3zXzgNkZpED
 85CLK+jVp6XoP44xYrPKv8ZbiAQGdGulw96u0zcD6JaiYtQS9t/xsNwnT w==;
X-CSE-ConnectionGUID: VzXb/BD3R9yD5VlL3U3i5g==
X-CSE-MsgGUID: yhg/uEuIQMqiQU/7kkwn8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685649"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:42 -0800
X-CSE-ConnectionGUID: ilJVIIdtROWwW5LWJhWcyw==
X-CSE-MsgGUID: Gz2uTRQRRo+79DvHr3nG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701261"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:37 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 22/23] drm/i915/color: Enable Plane Color Pipelines
Date: Wed,  5 Mar 2025 18:56:07 +0530
Message-ID: <20250305132608.2379253-23-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Expose color pipeline and add ability to program it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 70e550539bb2..9c2a4a2544e7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -12,6 +12,7 @@
 #include "i915_reg.h"
 #include "intel_atomic_plane.h"
 #include "intel_bo.h"
+#include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
@@ -1548,6 +1549,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
+	intel_program_pipeline(&plane_state->uapi, &plane_color_ctl);
+
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
 		crtc_x = 0;
@@ -2952,6 +2955,8 @@ skl_universal_plane_create(struct intel_display *display,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	intel_plane_color_init(&plane->base);
+
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
 					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-- 
2.42.0

