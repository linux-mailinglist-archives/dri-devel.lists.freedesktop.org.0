Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A68C9E41C
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB4010E747;
	Wed,  3 Dec 2025 08:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZevJMHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB46510E73E;
 Wed,  3 Dec 2025 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751239; x=1796287239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9fNAu/FReyhdILpk27TcaLkY53mhOQ7sUUuYy0usrk=;
 b=AZevJMHu97BnSuvhSB9VGLxZVehcX9ZnjrOyhci7B6pgngsCjgbzNrDv
 6yvLUN26fJGn4k6malNp6PIbI7Xfl2teoDH4UVqUjt3cuXsCznxTOFDTt
 gYlJJsagReCiWtDP+YHmPLxUdH0Q8OyshW+8/MLb47/5BlJ9ypt6vPn6q
 2RkRrT0iOPT0aTvgLfRJHPtpJEEw/FRjswB6DdLooy+Wdb8yHMRt6DrAI
 YRLv7An4nMMpCBAf9nbv9WLDqWkNvTu0EXzyX8ZK1XR9l8gnDXJIu0/Ux
 WnsOvq09lN72C0K9iFZuqUz16o4cD8OQAglBV5+tCyi+wKRnjDQvP6MNQ w==;
X-CSE-ConnectionGUID: fsb2dwY3TRyrCliFJR3kUw==
X-CSE-MsgGUID: yq0HeY0uRk6TGL1a7todzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812137"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:38 -0800
X-CSE-ConnectionGUID: 0KYBBR7vQOqpCwd4cdryBg==
X-CSE-MsgGUID: ipH2gTnATByA732QXIoNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945385"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:34 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 04/15] drm/i915/color: Create a transfer function color pipeline
Date: Wed,  3 Dec 2025 14:22:00 +0530
Message-ID: <20251203085211.3663374-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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
v6:
 - Use drm_plane_create_color_pipeline_property() (Arun)
	Now MAX_COLOR_PIPELINES is 1

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_color_pipeline.c   | 80 +++++++++++++++++++
 .../drm/i915/display/intel_color_pipeline.h   | 13 +++
 drivers/gpu/drm/xe/Makefile                   |  1 +
 4 files changed, 95 insertions(+)
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
index 000000000000..489d470cd011
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -0,0 +1,80 @@
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
+#define MAX_COLOR_PIPELINES 1
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
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Currently expose pipeline only for HDR planes */
+	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
+		return 0;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
+	if (ret)
+		return ret;
+	len++;
+
+	return drm_plane_create_color_pipeline_property(plane, pipelines, len);
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

