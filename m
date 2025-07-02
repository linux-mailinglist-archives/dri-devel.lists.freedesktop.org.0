Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F5AF0F2E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE1B10E6AE;
	Wed,  2 Jul 2025 09:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9BwrcRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803C10E6AF;
 Wed,  2 Jul 2025 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447343; x=1782983343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2+HVE0Ohbb8k9uAsr3sqHoE5owWdegvFrEmRrV+jRbo=;
 b=Z9BwrcRwc6LFFK/X4dc8igLmrS251FrQgYLwgb7fQ518pKZDGpp+9VMq
 Emce01hVlaeE/LFaxU36xAGBkza1XhiGj0Y03k2BqdMIhdAcYofDEo2Jn
 qRKMl0No4kX3BOOUnM0tO33ZxFfPPvOVULeimtKKLsQYbRoPX/U9F3B5z
 7qHa53UgZPnWjvOI4KZZZAbmOGXSq+Qw+0fpilJK9hsF1fMN+s9yMLWr0
 W6xw0XG/dLul7qESQCC0qBACanh6hNnNSzBSL2OTmBF64fMA1STB0HQNZ
 STuUI4wGFSxG3IUzaYdchtoQhcRRUVWm/gmt7jqHSgXBOVznqwV/SF9Pc g==;
X-CSE-ConnectionGUID: KgvvQD/yQJ2bygrCZJirhg==
X-CSE-MsgGUID: vrBOvATXT8aci0fVawIWrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427252"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:09:02 -0700
X-CSE-ConnectionGUID: IcIKgbZ0TKef1bq0oZQqJw==
X-CSE-MsgGUID: 7djOHmbmSBqVJscFqQMYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536800"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:59 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 22/24] drm/i915/color: Enable Plane Color Pipelines
Date: Wed,  2 Jul 2025 14:49:34 +0530
Message-ID: <20250702091936.3004854-23-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

v2: Set bit to enable multisegmented lut

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/drm/i915/display/skl_universal_plane.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index e20972ddfa09..f3ae80471d73 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -11,6 +11,7 @@
 #include "pxp/intel_pxp.h"
 #include "i915_drv.h"
 #include "intel_bo.h"
+#include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
@@ -1260,6 +1261,18 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 	if (plane_state->force_black)
 		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
 
+	if (plane_state->hw.degamma_lut)
+		plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
+
+	if (plane_state->hw.ctm)
+		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
+
+	if (plane_state->hw.gamma_lut) {
+		plane_color_ctl &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
+		if (drm_color_lut_32_size(plane_state->hw.gamma_lut) != 32)
+			plane_color_ctl |= PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
+	}
+
 	return plane_color_ctl;
 }
 
@@ -1548,6 +1561,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
+	intel_color_plane_program_pipeline(crtc_state->dsb_color, plane_state);
+
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
 		crtc_x = 0;
@@ -2982,6 +2997,8 @@ skl_universal_plane_create(struct intel_display *display,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	intel_plane_color_init(&plane->base);
+
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
 					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-- 
2.42.0

