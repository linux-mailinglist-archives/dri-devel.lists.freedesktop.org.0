Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B286F3970E8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41BB6E9C8;
	Tue,  1 Jun 2021 10:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704646E145;
 Tue,  1 Jun 2021 10:05:58 +0000 (UTC)
IronPort-SDR: HP/T8Ud1N9XA9cmXUcbOBVPe96i7ASXQ1SJIvGDhsMBygsMuzGkgmODatonyQytLqhZU1yA8Ot
 VSbxvXebllKg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197723"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:46 -0700
IronPort-SDR: UJ+hSyXM65DdjpL+RKk5vdJ9eVPZ2rAfQMAcNuAMMYlzT4ti+QzrcA0qhYmJfF59gCP++TZ21x
 oJ8PPsZgNIqg==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245195"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:44 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/xelpd: Define color lut range structure
Date: Tue,  1 Jun 2021 16:11:28 +0530
Message-Id: <20210601104135.29020-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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

This defines the color lut ranges for logarithmic gamma which
is being introduced from XE_LPD onwards.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 250 ++++++++++++++++++++-
 1 file changed, 246 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251b..0b59d8a89761 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2093,6 +2093,238 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+#define D13_GAMMA_CAPABILITY_FLAG	(DRM_MODE_LUT_GAMMA | \
+					 DRM_MODE_LUT_REFLECT_NEGATIVE | \
+					 DRM_MODE_LUT_INTERPOLATE | \
+					 DRM_MODE_LUT_NON_DECREASING)
+ /* FIXME input bpc? */
+static const struct drm_color_lut_range d13_logarithmic_gamma[] = {
+	/* segment 0 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = 0,
+		.min = 0, .max = 0,
+	},
+	/* segment 1 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 0),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 2 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 2,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 0), .end = (1 << 1),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 3 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 2,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 1), .end = (1 << 2),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 4 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 2,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 2), .end = (1 << 3),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 5 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 2,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 3), .end = (1 << 4),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 6 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 4,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 4), .end = (1 << 5),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 7 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 4,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 5), .end = (1 << 6),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 8 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 4,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 6), .end = (1 << 7),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 9 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 8,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 7), .end = (1 << 8),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 10 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 8,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 8), .end = (1 << 9),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 11 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 8,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 9), .end = (1 << 10),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 12 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 16,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 10), .end = (1 << 11),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 13 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 16,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 11), .end = (1 << 12),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 14 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 16,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 12), .end = (1 << 13),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 15 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 13), .end = (1 << 14),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 16 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 14), .end = (1 << 15),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 17 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 64,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 15), .end = (1 << 16),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 18 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 64,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 16), .end = (1 << 17),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 19 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 64,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 17), .end = (1 << 18),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 20 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 18), .end = (1 << 19),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 21 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 19), .end = (1 << 20),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 22 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 20), .end = (1 << 21),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 23 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 21), .end = (1 << 22),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 24 */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG,
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 22), .end = (1 << 23),
+		.min = 0, .max = (1 << 16) - 1,
+	},
+	/* segment 3 aka. coarse segment / PAL_GC_MAX */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG | DRM_MODE_LUT_REUSE_LAST,
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (1 << 24), .end = (3 << 24),
+		.min = 0, .max = 1 << 16,
+	},
+	/* PAL_EXT_GC_MAX */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG | DRM_MODE_LUT_REUSE_LAST,
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (3 << 24), .end = (7 << 24),
+		.min = 0, .max = (8 << 16) - 1,
+	},
+	/* PAL_EXT2_GC_MAX */
+	{
+		.flags = D13_GAMMA_CAPABILITY_FLAG | DRM_MODE_LUT_REUSE_LAST,
+		.count = 1,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = (7 << 24), .end = (7 << 24),
+		.min = 0, .max = (8 << 16) - 1,
+	},
+};
+
 void intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
@@ -2118,14 +2350,24 @@ void intel_color_init(struct intel_crtc *crtc)
 			dev_priv->display.read_luts = i9xx_read_luts;
 		}
 	} else {
-		if (DISPLAY_VER(dev_priv) >= 11)
+		if (DISPLAY_VER(dev_priv) >= 13) {
+			dev_priv->display.color_check = icl_color_check;
+			drm_color_create_gamma_mode_property(&crtc->base, 2);
+			drm_color_add_gamma_mode_range(&crtc->base,
+						       "no gamma", NULL, 0);
+			drm_color_add_gamma_mode_range(&crtc->base,
+						       "logarithmic gamma",
+							d13_logarithmic_gamma,
+							sizeof(d13_logarithmic_gamma));
+		} else if (DISPLAY_VER(dev_priv) >= 11) {
 			dev_priv->display.color_check = icl_color_check;
-		else if (DISPLAY_VER(dev_priv) >= 10)
+		} else if (DISPLAY_VER(dev_priv) >= 10) {
 			dev_priv->display.color_check = glk_color_check;
-		else if (DISPLAY_VER(dev_priv) >= 7)
+		} else if (DISPLAY_VER(dev_priv) >= 7) {
 			dev_priv->display.color_check = ivb_color_check;
-		else
+		} else {
 			dev_priv->display.color_check = ilk_color_check;
+		}
 
 		if (DISPLAY_VER(dev_priv) >= 9)
 			dev_priv->display.color_commit = skl_color_commit;
-- 
2.26.2

