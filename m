Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF09D9866
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5710E8B1;
	Tue, 26 Nov 2024 13:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUOeEZ2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AC10E8AF;
 Tue, 26 Nov 2024 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627263; x=1764163263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z3/+TEnRP4Wb75oh/RnTOj1CGxXLIserbimAC2oVcCQ=;
 b=aUOeEZ2JARlU6jiY1lEAOPYE7IJ8gXA4Xf0MBfiXf4aUpW3driEElMaV
 OUoZVjLEwiLRaqYxYzGFlg4C0NHJKP3DNv3cVvGWB1sAqgfdgbAoDGH9d
 xHd0iOnw4cTa2UlEp5JsST2hYXyvNpekHsKLidTM8r3rr0ZTTfxhNZkE3
 t4g1yhCI8+I8pfUVQCMX6QS6hACaIJ6oJGkEBLYoVq+XWclnU+iIaLUDO
 s0srSl0AvxxinUFJ6ePePKqpxrPrELg/wJ866amsMN7taJ4pSUOHdD0j2
 ONcEnkeft4Qh4Nj8G0Dy7DPxZsNOlxIWYdq4MvNIQOyuyC9rudJuYcRH7 w==;
X-CSE-ConnectionGUID: ucxYJhIMRYCr6xqDV5yaBw==
X-CSE-MsgGUID: ubebqwsCQJCqzwZ96RIcOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170448"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:21:02 -0800
X-CSE-ConnectionGUID: egPv+8eUSyOY9Kt1f7F10Q==
X-CSE-MsgGUID: +buv/ODZTOCdxFwldTtzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875078"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:58 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 24/25] drm/i915/color: Enable Plane Color Pipelines
Date: Tue, 26 Nov 2024 18:57:29 +0530
Message-ID: <20241126132730.1192571-25-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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
index 4c7bcf6806ff..4fe1e347cce1 100644
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
@@ -1455,6 +1456,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
+	intel_program_pipeline(&plane_state->uapi, &plane_color_ctl);
+
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
 		crtc_x = 0;
@@ -2715,6 +2718,8 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	intel_plane_color_init(&plane->base);
+
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
 					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-- 
2.42.0

