Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223FC95DF2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49C10E2C7;
	Mon,  1 Dec 2025 06:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+MVQcN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF3910E0FE;
 Mon,  1 Dec 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570952; x=1796106952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvxIsuFxJgIkB5oIxJbRnk1Yrpym9mpaEbiVZ7A8jmA=;
 b=I+MVQcN9mcNiIkEevW07wSz8TkQZW6D379v1nRcntmSpQ0S4auxJ5kSP
 QRDbqa8w7JDx2feKUD/nkBKbOlFhZZfgdUDj9lGNNxUpaeAshMpN4Eeew
 M7mjwCbFRCJoA8HjUkeR7qs5WOSCjzhg18xd5zt6S0+b2OpGh+sXCDi7Z
 BWA92lBMnB1e6sWvo6Xj1UsLsL1dDWWG1ecrELguP+OSfJY23i6aIz1Cn
 tcJw/ZadRFwLmhczCtlFSodElMkt1EPjtxZtHuXAKPssA/pWKchLIACoG
 xZKfgJoy8xCZxzV9u9jOfltSm1yfZJG1DGTOtL45MDTPFrrULRUd3U5QT Q==;
X-CSE-ConnectionGUID: RkApZcJIQ+SU6qzMvPyXuA==
X-CSE-MsgGUID: NqJwz8AaS5GmN9q+7L3xIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663184"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:50 -0800
X-CSE-ConnectionGUID: HCYwkJDgTjmLYYG/Kx9rpw==
X-CSE-MsgGUID: DtP11Lp4TteWTBajjEvpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806062"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:20 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 04/15] drm/i915/color: Create a transfer function color pipeline
Date: Mon,  1 Dec 2025 12:16:44 +0530
Message-ID: <20251201064655.3579280-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
v4:
 - s/*_tf_*/*_color_* (Jani)
 - Refactor to separate files (Jani)
 - Add missing space in comment (Suraj)
 - Consolidate patch that adds/attaches pipeline property
v5:
 - Limit MAX_COLOR_PIPELINES to 2.(Suraj)
	Increase it as and when we add more pipelines.
 - Remove redundant initialization code (Suraj)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_color_pipeline.c   | 97 +++++++++++++++++++
 .../drm/i915/display/intel_color_pipeline.h   | 13 +++
 drivers/gpu/drm/xe/Makefile                   |  1 +
 4 files changed, 112 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7c19d5345d88..ca5c69d1cb08 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -241,6 +241,7 @@ i915-y += \
 	display/intel_cmtg.o \
 	display/intel_color.o \
 	display/intel_colorop.o \
+	display/intel_color_pipeline.o \
 	display/intel_combo_phy.o \
 	display/intel_connector.o \
 	display/intel_crtc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
new file mode 100644
index 000000000000..1415f94dd3e3
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include "intel_colorop.h"
+#include "intel_color_pipeline.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "skl_universal_plane.h"
+
+#define MAX_COLOR_PIPELINES 2
+#define PLANE_DEGAMMA_SIZE 128
+#define PLANE_GAMMA_SIZE 32
+
+static
+int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct intel_colorop *colorop;
+	struct drm_device *dev = plane->dev;
+	int ret;
+	struct drm_colorop *prev_op;
+
+	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
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
+	/* TODO: handle failures and clean up */
+	prev_op = &colorop->base;
+
+	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+	prev_op = &colorop->base;
+
+	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
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
+int intel_color_pipeline_plane_init(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct intel_display *display = to_intel_display(dev);
+	struct drm_property *prop;
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Currently expose pipeline only for HDR planes */
+	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
+		return 0;
+
+	/* Add "Bypass" (i.e. NULL) pipeline */
+	pipelines[len].type = 0;
+	pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
+	if (ret)
+		return ret;
+	len++;
+
+	/* Create COLOR_PIPELINE property and attach */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					pipelines, len);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->color_pipeline_property = prop;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
new file mode 100644
index 000000000000..7f1d32bc9202
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_COLOR_PIPELINE_H__
+#define __INTEL_COLOR_PIPELINE_H__
+
+struct drm_plane;
+
+int intel_color_pipeline_plane_init(struct drm_plane *plane);
+
+#endif /* __INTEL_COLOR_PIPELINE_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3420725c4ba8..89f922d745ba 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -235,6 +235,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
 	i915-display/intel_colorop.o \
+	i915-display/intel_color_pipeline.o \
 	i915-display/intel_combo_phy.o \
 	i915-display/intel_connector.o \
 	i915-display/intel_crtc.o \
-- 
2.50.1

