Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BB3970DE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2A6E10C;
	Tue,  1 Jun 2021 10:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43E06E145;
 Tue,  1 Jun 2021 10:05:58 +0000 (UTC)
IronPort-SDR: 9kBQMoGWMvy9ggOCZtgGvcPYZ3IM0obFd6D+5VbfKXNipwemN1YSkCMEGPDYRT5vFz8lTiSrkh
 vrU01RSeME2w==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197732"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197732"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:48 -0700
IronPort-SDR: 6PQU+PwHFltX5JTeJFj8EnZ+RfdOQfL4+MC7GRVEfYcp7WdHzGPjI9bGc9/ORtzCRy0NqBbcsk
 BE3t59QdLVcQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245213"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:46 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915/xelpd: Add support for Logarithmic gamma mode
Date: Tue,  1 Jun 2021 16:11:29 +0530
Message-Id: <20210601104135.29020-4-uma.shankar@intel.com>
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

XE_LPD hardware introduced a new gamma mode i.e, Logarithmic
gamma mode. Added support for the same.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 111 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h            |   1 +
 include/drm/drm_crtc.h                     |   3 +
 3 files changed, 110 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 0b59d8a89761..12cacd3aeead 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -75,6 +75,21 @@
 
 #define ILK_CSC_POSTOFF_LIMITED_RANGE (16 * (1 << 12) / 255)
 
+#define GAMMA_MODE_LEGACY_PALETTE_8BIT		BIT(0)
+#define GAMMA_MODE_PRECISION_PALETTE_10BIT	BIT(1)
+#define GAMMA_MODE_INTERPOLATED_12BIT		BIT(2)
+#define GAMMA_MODE_MULTI_SEGMENTED_12BIT	BIT(3)
+#define GAMMA_MODE_SPLIT_12BIT			BIT(4)
+#define GAMMA_MODE_LOGARITHMIC_12BIT		BIT(5) /* D13+ */
+
+#define INTEL_GAMMA_MODE_MASK (\
+		GAMMA_MODE_LEGACY_PALETTE_8BIT | \
+		GAMMA_MODE_PRECISION_PALETTE_10BIT | \
+		GAMMA_MODE_INTERPOLATED_12BIT | \
+		GAMMA_MODE_MULTI_SEGMENTED_12BIT | \
+		GAMMA_MODE_SPLIT_12BIT \
+		GAMMA_MODE_LOGARITHMIC_12BIT)
+
 /* Nop pre/post offsets */
 static const u16 ilk_csc_off_zero[3] = {};
 
@@ -929,12 +944,20 @@ icl_load_gcmax(const struct intel_crtc_state *crtc_state,
 	       const struct drm_color_lut *color)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 	enum pipe pipe = crtc->pipe;
 
-	/* FIXME LUT entries are 16 bit only, so we can prog 0xFFFF max */
-	intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 0), color->red);
-	intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 1), color->green);
-	intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 2), color->blue);
+	if (DISPLAY_VER(i915) >= 13) {
+		/* MAx val from UAPI is 16bit only, so setting fixed for GC max */
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 0), 1 << 16);
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 1), 1 << 16);
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 2), 1 << 16);
+	} else {
+		/* FIXME LUT entries are 16 bit only, so we can prog 0xFFFF max */
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 0), color->red);
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 1), color->green);
+		intel_dsb_reg_write(crtc_state, PREC_PAL_GC_MAX(pipe, 2), color->blue);
+	}
 }
 
 static void
@@ -1585,6 +1608,9 @@ static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 	if (!crtc_state->hw.gamma_lut ||
 	    crtc_state_is_legacy_gamma(crtc_state))
 		gamma_mode |= GAMMA_MODE_MODE_8BIT;
+	else if (crtc_state->uapi.gamma_mode_type ==
+		 GAMMA_MODE_LOGARITHMIC_12BIT)
+		gamma_mode |= GAMMA_MODE_MODE_12BIT_LOGARITHMIC;
 	else
 		gamma_mode |= GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED;
 
@@ -1607,12 +1633,33 @@ static u32 icl_csc_mode(const struct intel_crtc_state *crtc_state)
 
 static int icl_color_check(struct intel_crtc_state *crtc_state)
 {
+	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_property *property = crtc_state->uapi.crtc->gamma_mode_property;
+	struct drm_property_enum *prop_enum;
+	u32 index = 0;
 	int ret;
 
 	ret = check_luts(crtc_state);
 	if (ret)
 		return ret;
 
+	if (DISPLAY_VER(dev_priv) >= 13) {
+		list_for_each_entry(prop_enum, &property->enum_list, head) {
+			if (prop_enum->value == crtc_state->uapi.gamma_mode) {
+				if (!strcmp(prop_enum->name,
+					    "logarithmic gamma")) {
+					crtc_state->uapi.gamma_mode_type =
+						GAMMA_MODE_LOGARITHMIC_12BIT;
+					drm_dbg_kms(dev,
+						    "logarithmic gamma enabled\n");
+				}
+				break;
+			}
+			index++;
+		}
+	}
+
 	crtc_state->gamma_mode = icl_gamma_mode(crtc_state);
 
 	crtc_state->csc_mode = icl_csc_mode(crtc_state);
@@ -2325,6 +2372,58 @@ static const struct drm_color_lut_range d13_logarithmic_gamma[] = {
 	},
 };
 
+static void
+d13_program_logarithmic_gamma_lut(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	const struct drm_property_blob *blob = crtc_state->hw.gamma_lut;
+	const u32 lut_size = INTEL_INFO(dev_priv)->color.gamma_lut_size;
+	const struct drm_color_lut *lut;
+	enum pipe pipe = crtc->pipe;
+	u32 i;
+
+	if (!blob || !blob->data)
+		return;
+
+	lut = blob->data;
+	intel_dsb_reg_write(crtc_state, PREC_PAL_INDEX(pipe),
+			    PAL_PREC_AUTO_INCREMENT);
+
+	for (i = 0; i < lut_size - 3; i++) {
+		intel_dsb_indexed_reg_write(crtc_state, PREC_PAL_DATA(pipe),
+					    ilk_lut_12p4_ldw(&lut[i]));
+		intel_dsb_indexed_reg_write(crtc_state, PREC_PAL_DATA(pipe),
+					    ilk_lut_12p4_udw(&lut[i]));
+	}
+
+	icl_load_gcmax(crtc_state, &lut[i]);
+	ivb_load_lut_ext_max(crtc_state);
+}
+
+static void d13_load_luts(const struct intel_crtc_state *crtc_state)
+{
+	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	if (crtc_state->hw.degamma_lut)
+		glk_load_degamma_lut(crtc_state);
+
+	switch (crtc_state->gamma_mode & GAMMA_MODE_MODE_MASK) {
+	case GAMMA_MODE_MODE_8BIT:
+		ilk_load_lut_8(crtc, gamma_lut);
+		break;
+	case GAMMA_MODE_MODE_12BIT_LOGARITHMIC:
+		d13_program_logarithmic_gamma_lut(crtc_state);
+		break;
+	default:
+		bdw_load_lut_10(crtc, gamma_lut, PAL_PREC_INDEX_VALUE(0));
+		ivb_load_lut_ext_max(crtc_state);
+	}
+
+	intel_dsb_commit(crtc_state);
+}
+
 void intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
@@ -2376,7 +2475,9 @@ void intel_color_init(struct intel_crtc *crtc)
 		else
 			dev_priv->display.color_commit = ilk_color_commit;
 
-		if (DISPLAY_VER(dev_priv) >= 11) {
+		if (DISPLAY_VER(dev_priv) >= 13) {
+			dev_priv->display.load_luts = d13_load_luts;
+		} else if (DISPLAY_VER(dev_priv) >= 11) {
 			dev_priv->display.load_luts = icl_load_luts;
 			dev_priv->display.read_luts = icl_read_luts;
 		} else if (DISPLAY_VER(dev_priv) == 10) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 24307c49085f..957f97edf035 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7749,6 +7749,7 @@ enum {
 #define  GAMMA_MODE_MODE_12BIT	(2 << 0)
 #define  GAMMA_MODE_MODE_SPLIT	(3 << 0) /* ivb-bdw */
 #define  GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED	(3 << 0) /* icl + */
+#define  GAMMA_MODE_MODE_12BIT_LOGARITHMIC	(3 << 0) /* D13+ + */
 
 /* DMC */
 #define DMC_PROGRAM(i)		_MMIO(0x80000 + (i) * 4)
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index b1eead03ebe8..5a594f134a81 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -269,6 +269,9 @@ struct drm_crtc_state {
 	 */
 	u32 gamma_mode;
 
+	/** Gamma mode type programmed on the pipe */
+	u32 gamma_mode_type;
+
 	/**
 	 * @degamma_lut:
 	 *
-- 
2.26.2

