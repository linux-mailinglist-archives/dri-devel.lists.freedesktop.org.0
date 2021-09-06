Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4AC4020DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A68E89CF3;
	Mon,  6 Sep 2021 21:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9A989CD4;
 Mon,  6 Sep 2021 21:01:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747406"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362172"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:05 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct for
 HDR planes
Date: Tue,  7 Sep 2021 03:08:47 +0530
Message-Id: <20210906213904.27918-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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

Define the structure with XE_LPD degamma lut ranges. HDR and SDR
planes have different capabilities, implemented respective
structure for the HDR planes.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index afcb4bf3826c..6403bd74324b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+ /* FIXME input bpc? */
+__maybe_unused
+static const struct drm_color_lut_range d13_degamma_hdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 128,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24) - 1, .end = 1 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	},
+	/* Segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 1 << 24, .end = 3 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_GAMMA |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 3 << 24, .end = 7 << 24,
+		.min = 0, .max = (1 << 27) - 1,
+	},
+};
+
 void intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-- 
2.26.2

