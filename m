Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BC78C914
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EAC10E3FA;
	Tue, 29 Aug 2023 15:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC510E3E8;
 Tue, 29 Aug 2023 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324753; x=1724860753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BkxhWwqLWw1PpEAtRsRC2Xy4hh82FaCIhbvRnJtc4Jg=;
 b=YQRauQT8GripLRVixjPMOD8c/E1ZEES15uwCo0/sXaFbGMSPE7nwa6vv
 A+D+xOYVRreNtc6LjiJv+KO94aaOsZ4I7kvJPs419JhVJMfVWc34RfiCS
 DREBNMLIzPN6M5A9nsLjeD3KOa4BB3mXflck4k2elFoQmxU/9gij/lmvc
 GoyTPrOO0xLYFmqc6o+Q3MJY08UgW6bR/NnapAShEvCU2URuh+pGa6r8a
 pFFT1eB0EhsL64cqF94qDOzExN41FguHLuBKb7WsiafaZyzww+MY47O3m
 1Hsr4AtRYNPt/d2uDqTko8GWSl40Y4s7YgzoWKriQkaix22c42gHU6vFG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769338"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769338"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555026"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555026"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:10 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 14/33] drm/i915/color: Add lut range for SDR planes
Date: Tue, 29 Aug 2023 21:34:03 +0530
Message-ID: <20230829160422.1251087-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add lut range information for SDR planes. This is used to
hint the userspace what kind of LUT values are needed by
the hardware block. Pre-CSC and Post-CSC blocks have similar
lut range for HDR planes.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 5918e2e9bcdd..3900e3748a0e 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3778,6 +3778,61 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+/* FIXME input bpc? */
+static const struct drm_color_lut_range xelpd_pre_post_csc_sdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_PRE_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 0, .end = (1 << 16) - (1 << 16) / 33,
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_PRE_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = (1 << 16) - (1 << 16) / 33, .end = 1 << 16,
+		.min = 0, .max = 1 << 16,
+	},
+	/* Segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_PRE_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 1 << 16, .end = 3 << 16,
+		.min = 0, .max = (8 << 16) - 1,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_PRE_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 16, .output_bpc = 16,
+		.start = 3 << 16, .end = 7 << 16,
+		.min = 0, .max = (8 << 16) - 1,
+	},
+};
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-- 
2.38.1

