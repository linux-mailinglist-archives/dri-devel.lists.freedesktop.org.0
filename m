Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF11C9A48F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F9110E55E;
	Tue,  2 Dec 2025 06:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iM8y1OCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD0310E55E;
 Tue,  2 Dec 2025 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656873; x=1796192873;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=9OuW8nZpCmwURn0SkhqVP7ivjmc9yn/vgvVWIrI5lDI=;
 b=iM8y1OCJ2l5NNImEc7w7RBVnNtxN+/KfsHyw97406Qyzx3DnCuijjJxJ
 NvIhixleMejDsQ+UWbXEZK6d9wGcpdVMAZddTbNupW99pVnXHwbHuNmgP
 BUYB5K55aCDIfTqRmn56A8SUp8XSeyjZEdeHAJ9eVeTEp7Wk1tpNpcSX6
 IfB3bZ2uiCIFQ8rcRwnsFN7jNVDXlX60wW/Xn68ycpajiJHdxA/VET/1R
 mAvDn7+rdZxnsTRGrvnW2VLTqemHx7fz8T3z+E+jclZVpPZ9PIbqOBubv
 fGxuVve9loxiDfGq0il0wBKuNNh2Pe4gDxxuFJUYOJ72mQYx9ARYl4lrM A==;
X-CSE-ConnectionGUID: pbhXxHvrRLe0SEWtl15ayg==
X-CSE-MsgGUID: cv2YIMd3T0GuJh/qjgNfYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499949"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499949"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:53 -0800
X-CSE-ConnectionGUID: PPjzZPHESKSUuwTh3ITdiQ==
X-CSE-MsgGUID: 1gDiAvgFRHqqJOFKJ45bOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961397"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:47 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:06 +0530
Subject: [PATCH DO_NOT_RTEVIEW [RESEND] v9 12/20] Plane Color Pipeline
 support for Intel platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-dpst-v9-12-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

This patch is a squashed series of
https://patchwork.freedesktop.org/series/129811/

Note: The entire series is not taken

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/Makefile                      |   2 +
 .../gpu/drm/i915/display/intel_color_pipeline.c    | 156 +++++++++++++++++++++
 .../gpu/drm/i915/display/intel_color_pipeline.h    |  15 ++
 drivers/gpu/drm/i915/display/intel_colorop.c       |  35 +++++
 drivers/gpu/drm/i915/display/intel_colorop.h       |  15 ++
 .../gpu/drm/i915/display/intel_display_limits.h    |   8 ++
 drivers/gpu/drm/i915/display/intel_display_types.h |   5 +
 drivers/gpu/drm/xe/Makefile                        |   2 +
 8 files changed, 238 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 004e8fc092a3b9ba7dd907a228b835ceaf8f2ba5..5088a0ef0be67f5e3851ab8e43b8f661824d561a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -236,6 +236,8 @@ i915-y += \
 	display/intel_cdclk.o \
 	display/intel_cmtg.o \
 	display/intel_color.o \
+	display/intel_colorop.o \
+	display/intel_color_pipeline.o \
 	display/intel_combo_phy.o \
 	display/intel_connector.o \
 	display/intel_crtc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
new file mode 100644
index 0000000000000000000000000000000000000000..f0509b4a55f5840d7e0be0beb52feebe848034f1
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include "intel_colorop.h"
+#include "intel_color_pipeline.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_histogram.h"
+#include "skl_universal_plane.h"
+
+#define MAX_COLOR_PIPELINES 5
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
+	/* TODO check if needed */
+	if (plane->state)
+		plane->state->color_pipeline = NULL;
+
+	return 0;
+}
+
+static
+int _intel_color_pipeline_crtc_init(struct drm_crtc *crtc, struct drm_prop_enum_list *list)
+{
+	struct intel_colorop *colorop[INTEL_CRTC_CB_MAX];
+	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	struct drm_histogram_caps *caps = histogram->caps;
+	struct drm_iet_caps *iet_caps = histogram->iet_caps;
+	int ret = 0, i = 0;
+
+	colorop[i] = intel_colorop_create(INTEL_CRTC_HISTOGRAM);
+	ret = drm_crtc_colorop_histogram_init(&colorop[i]->base, crtc,
+					      caps,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	list->type = colorop[i]->base.base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop[i]->base.base.id);
+
+	i++;
+
+	colorop[i] = intel_colorop_create(INTEL_CRTC_IET);
+	ret = drm_crtc_colorop_iet_lut_init(&colorop[i]->base, crtc,
+					    iet_caps,
+					    DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+	drm_colorop_set_next_property(&colorop[i - 1]->base, &colorop[i]->base);
+
+	return 0;
+}
+
+int intel_color_pipeline_crtc_init(struct drm_crtc *crtc)
+{
+	struct drm_prop_enum_list crtc_pipelines[INTEL_CRTC_CB_MAX];
+	int len = 0;
+	int ret;
+
+	/* Add crtc pipeline */
+	ret = _intel_color_pipeline_crtc_init(crtc, &crtc_pipelines[len]);
+	if (ret)
+		return ret;
+	len++;
+
+	/* Create COLOR_PIPELINE property and attach */
+	ret = drm_crtc_create_color_pipeline_property(crtc,
+						      crtc_pipelines, len);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
new file mode 100644
index 0000000000000000000000000000000000000000..56b6dae8c754c31fa1d0814c7ecd643283a72bca
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_COLOR_PIPELINE_H__
+#define __INTEL_COLOR_PIPELINE_H__
+
+struct drm_plane;
+struct drm_crtc;
+
+int intel_color_pipeline_plane_init(struct drm_plane *plane);
+int intel_color_pipeline_crtc_init(struct drm_crtc *crtc);
+
+#endif /* __INTEL_COLOR_PIPELINE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c b/drivers/gpu/drm/i915/display/intel_colorop.c
new file mode 100644
index 0000000000000000000000000000000000000000..f2fc0d8780ceea108be5cb2dd5cb020da25cc642
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_colorop.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include "intel_colorop.h"
+
+struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
+{
+	return container_of(colorop, struct intel_colorop, base);
+}
+
+struct intel_colorop *intel_colorop_alloc(void)
+{
+	struct intel_colorop *colorop;
+
+	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
+	if (!colorop)
+		return ERR_PTR(-ENOMEM);
+
+	return colorop;
+}
+
+struct intel_colorop *intel_colorop_create(enum intel_color_block id)
+{
+	struct intel_colorop *colorop;
+
+	colorop = intel_colorop_alloc();
+
+	if (IS_ERR(colorop))
+		return colorop;
+
+	colorop->id = id;
+
+	return colorop;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h b/drivers/gpu/drm/i915/display/intel_colorop.h
new file mode 100644
index 0000000000000000000000000000000000000000..21d58eb9f3d0f6518fa7eaaa5202399874002603
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_colorop.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_COLOROP_H__
+#define __INTEL_COLOROP_H__
+
+#include "intel_display_types.h"
+
+struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
+struct intel_colorop *intel_colorop_alloc(void);
+struct intel_colorop *intel_colorop_create(enum intel_color_block id);
+
+#endif /* __INTEL_COLOROP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab6d1fad1616266ac2b0508ce92a91..55fd574ba313176b5da637e3623ad106dd27880c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -138,4 +138,12 @@ enum hpd_pin {
 	HPD_NUM_PINS
 };
 
+enum intel_color_block {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
+	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+
+	INTEL_CB_MAX
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b8a1be24cd0408dfa5377c9afe5309a9f1e743dd..ac5fa0dbffd77dbf927b61d2916a9624eeabac24 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1987,6 +1987,11 @@ struct intel_dp_mst_encoder {
 	struct intel_connector *connector;
 };
 
+struct intel_colorop {
+	struct drm_colorop base;
+	enum intel_color_block id;
+};
+
 static inline struct intel_encoder *
 intel_attached_encoder(struct intel_connector *connector)
 {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 38008a644a0919868d6ff99fdda024df0eca944e..cd84f2be4ed37847d4da031ad9e330f56982431d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -230,6 +230,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
+	i915-display/intel_colorop.o \
+	i915-display/intel_color_pipeline.o \
 	i915-display/intel_combo_phy.o \
 	i915-display/intel_connector.o \
 	i915-display/intel_crtc.o \

-- 
2.25.1

