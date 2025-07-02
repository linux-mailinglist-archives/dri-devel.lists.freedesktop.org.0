Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA16AF0F11
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649E10E661;
	Wed,  2 Jul 2025 09:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+p3H1U5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DA910E63D;
 Wed,  2 Jul 2025 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447301; x=1782983301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5ZRMVtdUEt+P9LYpOXOYp5eU7EzjXRFvfdRcJbuSz0=;
 b=W+p3H1U5OV4A55bANhHG0xEx80GYOPSAGBd88eG1e22B61YNnecWxIeW
 2+yf8tFRBK1vrA9psI1e/wToIsxd9/ccDoOJIwN9k2vMFuWRufeHBKQQU
 aHiXoYwIRSI10ZiQ/ay3SRTQk6EdFt2jROkirlTh4c9mtggrTNkU1feuM
 P0f1cmpj6Cs1vP35NJtHsxU2DcsN7kxbNaoPoLxwSFLW6NCKAP2UIp1xU
 t5eSqHxqpMKgFiVxBF1XVgJUd9y7ph1+ABNIjC5I8qa9jB9cQatGNM2yQ
 Kgij7o7xjE+oG5rYmu/LbBGF6VnGtXufl2zKVZh2XTFlB/B9BOolqjsDt g==;
X-CSE-ConnectionGUID: 9Ujkn/NwTVyUMAAsZQ22Xg==
X-CSE-MsgGUID: MpqQtX/6Q1yq9iEXnfpy8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427114"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:14 -0700
X-CSE-ConnectionGUID: Gi29V++9RAiCTN3aAk7vpA==
X-CSE-MsgGUID: i7CRFyxxSwGAYnqzDHpmTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536533"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:10 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 10/24] drm/i915/color: Create a transfer function color pipeline
Date: Wed,  2 Jul 2025 14:49:22 +0530
Message-ID: <20250702091936.3004854-11-uma.shankar@intel.com>
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

Add a color pipeline with three colorops in the sequence

	1D LUT - 3x4 CTM - 1D LUT

This pipeline can be used to do any color space conversion or HDR
tone mapping

v2: Change namespace to drm_plane_colorop*
v3: Use simpler/pre-existing colorops for first iteration

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 49 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 5f38a5ff541c..90ac6530d1a5 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -32,6 +32,10 @@
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 #include "intel_vrr.h"
+#include "skl_universal_plane.h"
+
+#define PLANE_DEGAMMA_SIZE 128
+#define PLANE_GAMMA_SIZE 32
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -4001,6 +4005,51 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
 	return colorop;
 }
 
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct intel_plane_colorop *colorop;
+	struct drm_device *dev = plane->dev;
+	int ret;
+	struct drm_colorop *prev_op;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
+
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
+						  PLANE_DEGAMMA_SIZE,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+
+	if (ret)
+		return ret;
+
+	list->type = colorop->base.base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
+
+	/* TODO: handle failures and clean up*/
+	prev_op = &colorop->base;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_CSC);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+	prev_op = &colorop->base;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
+						  PLANE_GAMMA_SIZE,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+
+	return 0;
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index f3c7cd694b99..ce9db761c6e2 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -14,6 +14,8 @@ struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
+struct drm_plane;
+struct drm_prop_enum_list;
 enum intel_color_block;
 
 void intel_color_init_hooks(struct intel_display *display);
@@ -43,5 +45,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

