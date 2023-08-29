Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3878C91F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F08610E40B;
	Tue, 29 Aug 2023 15:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934210E3F3;
 Tue, 29 Aug 2023 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324754; x=1724860754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rZoQ12nkjZqZBdVH2w4FJnuG3YN7ZC9A0VOAsDYnMbU=;
 b=JfM3q0gPyO92BQ78nPIBK9tIKgQ4B5rWZt944hGQ+D5301EDjkG10+HP
 4qFR+yxYUyvIda7ZkxNfEwJ2MflfkQ2HiUhJ4zkeE/71CjU1nxQnRHdid
 CTsLGCqO3Vez3UfB+wT2VbWYGlKdXsGpJWsEItvnRzSHto+COrZwyWxZ1
 x1vAStWr4jrNN1XEDEvv7CXtzK2JMvan0CgfV87mMFYTzP0opH6se8Bm7
 +ByRFutqbKaBRNnwmZjvlRgxMi4+7X95tu1+0damcLtEfCnlFZ0UFLTvd
 i65CpPnn14oY/vlNirRPXfKVi20te+JB8C+ncdkyIPlXYP/j2sskoGEDg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769347"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769347"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555029"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555029"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:12 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 15/33] drm/i915/color: Add lut range for HDR planes
Date: Tue, 29 Aug 2023 21:34:04 +0530
Message-ID: <20230829160422.1251087-16-uma.shankar@intel.com>
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

Add lut range information for HDR planes. This is used to
hint the userspace what kind of LUT values are needed by
the hardware block. Pre-CSC and Post-CSC blocks have
different lut ranges for HDR planes.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 3900e3748a0e..58b6d70043ca 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3833,6 +3833,114 @@ static const struct drm_color_lut_range xelpd_pre_post_csc_sdr[] = {
 	},
 };
 
+/* FIXME input bpc? */
+static const struct drm_color_lut_range xelpd_pre_csc_hdr[] = {
+	/* segment 1 */
+	{
+		.flags = (DRM_MODE_LUT_PRE_CSC |
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
+		.flags = (DRM_MODE_LUT_PRE_CSC |
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
+		.flags = (DRM_MODE_LUT_PRE_CSC |
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
+		.flags = (DRM_MODE_LUT_PRE_CSC |
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
+/* FIXME input bpc? */
+static const struct drm_color_lut_range xelpd_post_csc_hdr[] = {
+	/*
+	 * ToDo: Add Segment 1
+	 * There is an optional fine segment added with 9 lut values
+	 * Will be added later
+	 */
+
+	/* segment 2 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+	/* segment 3 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24) - 1, .end = 1 << 24,
+		.min = 0, .max = 1 << 24,
+	},
+	/* Segment 4 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 1 << 24, .end = 3 << 24,
+		.min = 0, .max = (3 << 24),
+	},
+	/* Segment 5 */
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_REUSE_LAST |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 3 << 24, .end = 7 << 24,
+		.min = 0, .max = (7 << 24),
+	},
+};
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-- 
2.38.1

