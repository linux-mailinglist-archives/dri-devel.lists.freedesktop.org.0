Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727685293B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732110E901;
	Tue, 13 Feb 2024 06:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjvVgtUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464F10E901;
 Tue, 13 Feb 2024 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806543; x=1739342543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6sx6JV0mPdax9VIt++4GU6dYfjcZn4U2rPcYbOI8oSE=;
 b=EjvVgtUAD0yNn2z/YaAw8/pZ1sZM5aQeuTk7YJYLOSsCChW4B03CwO0o
 n0eXNtZedSVOoJltKu+cDtCDt+rVt9fL3F6Q+VRUGfet2ABSoDUJYuVUX
 YxE+g15BFRTrHygo3gAi5Zhl2zD1M6OrLolK470HsJ8tB645cUxZdmlDo
 o3WH1JqGIG94YrE9JAm2RM1Q1dPtUm2i7qtij0IFUz9V+b/6ulqujH1m1
 xseAY0O6ryZqL/bDhsd4N+uyJshnpoCkKSE3Gx5oiwTz++R0vbMUNWVTQ
 UQq4ewEnh8Id0LZcVRsTsfpThcwGSiIyE//7PbV/nKatMRbu5+XuB0BPF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948052"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450476"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:16 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 16/28] drm/i915/color: Create a transfer function color
 pipeline
Date: Tue, 13 Feb 2024 12:18:23 +0530
Message-ID: <20240213064835.139464-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

	1D LUT - CTM - 1D LUT

This pipeline can be used to do any color space conversion or HDR
tone mapping

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index e187135d4363..e223edbe4c13 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -28,6 +28,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
+#include "skl_universal_plane.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_crtc_state *crtc_state);
@@ -3849,6 +3850,47 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
 	return colorop;
 }
 
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct intel_plane *intel_plane = to_intel_plane(plane);
+	struct intel_plane_colorop *colorop;
+	struct drm_device *dev = plane->dev;
+	struct drm_i915_private *i915 = to_i915(dev);
+	int ret;
+	struct drm_colorop *prev_op;
+
+	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
+
+	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	list->type = colorop->base.base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
+
+	/* TODO: handle failures and clean up*/
+	prev_op = &colorop->base;
+
+	if (icl_is_hdr_plane(i915, intel_plane->id)) {
+		colorop = intel_plane_colorop_create(CB_PLANE_CSC);
+		ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_CTM_3X3);
+		if (ret)
+			return ret;
+
+		drm_colorop_set_next_property(prev_op, &colorop->base);
+		prev_op = &colorop->base;
+	}
+
+	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
+	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
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
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index d03dad425671..e0b75dcb1b65 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -12,6 +12,8 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct drm_i915_private;
 struct drm_property_blob;
+struct drm_plane;
+struct drm_prop_enum_list;
 enum intel_color_block;
 
 void intel_color_init_hooks(struct drm_i915_private *i915);
@@ -34,5 +36,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
+int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

