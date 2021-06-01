Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA14397117
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6CA6E9EA;
	Tue,  1 Jun 2021 10:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7346E9EC;
 Tue,  1 Jun 2021 10:16:10 +0000 (UTC)
IronPort-SDR: r1siSZytJ8NYIQzeX8JORiS+crGQ66kXqu6TpewkfpbMytfYBu5LWI7a/AqO/zce7OhoRRi0P7
 vaTEDUHVihKA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203549960"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203549960"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:09 -0700
IronPort-SDR: iK9fpCnn2lHnL3CJo0LtfAd0VS9c7sh9jcyZgmUoSYa1+IeI9f0cyYzoCPHTpdC4D+bqqHo0ka
 adSk10KjeFhw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431217"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:07 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/21] drm/i915/xelpd: Define Degamma Lut range struct for HDR
 planes
Date: Tue,  1 Jun 2021 16:22:01 +0530
Message-Id: <20210601105218.29185-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
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
index dab892d2251b..c735d06a6b54 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2093,6 +2093,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
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

