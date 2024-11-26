Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE39D9851
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DFB10E8A1;
	Tue, 26 Nov 2024 13:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZqRtWkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347810E898;
 Tue, 26 Nov 2024 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627225; x=1764163225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NyWPOoiicnBbpW94aPRgiMdXD1GiilbFSdgZD9wp6k=;
 b=SZqRtWkSc7Rt8LsHdhBvaytxX1gg2UHTevgpftmzexKGGOPez/HQjl+f
 tcDoPM0SGSVlbz2h1BUCnd35pWHzV7VjKiGYead6giMI77Wxw1a+q+uCL
 9vHssuiUOs8oEBo5X9sDkPNbCY4Df3FAopMve6De7H7sX6P577YcQmQbv
 PwMm/9Q9iaRYlV0JxdVNAeYE02mCHaI6BJVwxBbErIfzdTjd1SMmeLbYQ
 8ZM5ZC4nq2hbhdkfuLddyRELRv2gGaOkov8Mvu9BxDfzGj7XXjz58GdY0
 vXPpZVTlikSeOTkk28Dzu7vIXuo9KnYno3Zl2VUQ/6rVEHxud+ZNBC9rG Q==;
X-CSE-ConnectionGUID: eXURVwqHRKOhigFV6WZzXw==
X-CSE-MsgGUID: 9sia85yaS323E17OxD/36w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170311"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:24 -0800
X-CSE-ConnectionGUID: 5Wp9qa/fQfOCgyr6TpW9RQ==
X-CSE-MsgGUID: GRDeiCYTRdK6PAJBhgzlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874812"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:20 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 14/25] drm/i915/color: Add and attach COLORPIPELINE plane property
Date: Tue, 26 Nov 2024 18:57:19 +0530
Message-ID: <20241126132730.1192571-15-uma.shankar@intel.com>
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

Add supported color pipelines and attach it to plane.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ba4c4ff6c9d5..8bbaca9b3e9d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4124,6 +4124,48 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 	return 0;
 }
 
+int intel_plane_color_init(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_property *prop;
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Currently expose pipeline only for HDR planes*/
+	if (!icl_is_hdr_plane(i915, to_intel_plane(plane)->id))
+		return 0;
+
+	/* Add "Bypass" (i.e. NULL) pipeline */
+	pipelines[len].type = 0;
+	pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = intel_plane_tf_pipeline_init(plane, &pipelines[len]);
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
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index abbc41d730a9..8a3bf5b79e39 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -18,6 +18,8 @@ struct drm_plane;
 struct drm_prop_enum_list;
 enum intel_color_block;
 
+#define MAX_COLOR_PIPELINES 5
+
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
 void intel_color_crtc_init(struct intel_crtc *crtc);
@@ -44,5 +46,6 @@ void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
+int intel_plane_color_init(struct drm_plane *plane);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

