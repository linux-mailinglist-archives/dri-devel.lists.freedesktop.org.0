Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E803970F0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5576E9D4;
	Tue,  1 Jun 2021 10:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1638C6E9DE;
 Tue,  1 Jun 2021 10:06:03 +0000 (UTC)
IronPort-SDR: 3bGnSxKDRG8wRYpbL8Gr57YHiDcLRpB6BscGK4tPCsx64GSAOt6P0m4r2PobgWixVr1vSAcBJD
 pE69eoZjK3zA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197776"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197776"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:06:01 -0700
IronPort-SDR: nAMCoBFdy5aRuUvxZGNXIUYlF7/TEDzuXVuVdXHIkhqzlAbPQPRmcwM2u0+Ej9pCok3rF6az2v
 GHHo6Gw2vBVA==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245279"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:59 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/i915/xelpd: Enable XE_LPD Gamma Lut readout
Date: Tue,  1 Jun 2021 16:11:35 +0530
Message-Id: <20210601104135.29020-10-uma.shankar@intel.com>
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

Enable support for Logarithmic gamma readout for XE_LPD.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 72 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h            |  6 ++
 2 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index a8b771f22880..1238fe05b358 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -486,6 +486,17 @@ static void icl_lut_multi_seg_pack(struct drm_color_lut *entry, u32 ldw, u32 udw
 				    REG_FIELD_GET(PAL_PREC_MULTI_SEG_BLUE_LDW_MASK, ldw);
 }
 
+static void d13_lut_logarithmic_pack(struct drm_color_lut *entry,
+				     u32 ldw, u32 udw)
+{
+	entry->red = REG_FIELD_GET(PAL_PREC_LOGARITHMIC_RED_UDW_MASK, udw) << 6 |
+				   REG_FIELD_GET(PAL_PREC_LOGARITHMIC_RED_LDW_MASK, ldw);
+	entry->green = REG_FIELD_GET(PAL_PREC_LOGARITHMIC_GREEN_UDW_MASK, udw) << 6 |
+				     REG_FIELD_GET(PAL_PREC_LOGARITHMIC_GREEN_LDW_MASK, ldw);
+	entry->blue = REG_FIELD_GET(PAL_PREC_LOGARITHMIC_BLUE_UDW_MASK, udw) << 6 |
+				    REG_FIELD_GET(PAL_PREC_LOGARITHMIC_BLUE_LDW_MASK, ldw);
+}
+
 static void i9xx_color_commit(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -2434,6 +2445,66 @@ static void d13_load_luts(const struct intel_crtc_state *crtc_state)
 	intel_dsb_commit(crtc_state);
 }
 
+static struct drm_property_blob *
+d13_read_lut_logarithmic(struct intel_crtc *crtc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	int i, lut_size = INTEL_INFO(dev_priv)->color.gamma_lut_size;
+	enum pipe pipe = crtc->pipe;
+	struct drm_property_blob *blob;
+	struct drm_color_lut *lut;
+	u32 gamma_max_val = 0xFFFF;
+
+	blob = drm_property_create_blob(&dev_priv->drm,
+					sizeof(struct drm_color_lut) * lut_size,
+					NULL);
+	if (IS_ERR(blob))
+		return NULL;
+
+	lut = blob->data;
+
+	intel_de_write(dev_priv, PREC_PAL_INDEX(pipe),
+		       PAL_PREC_AUTO_INCREMENT);
+
+	for (i = 0; i < lut_size - 3; i++) {
+		u32 ldw = intel_de_read(dev_priv, PREC_PAL_DATA(pipe));
+		u32 udw = intel_de_read(dev_priv, PREC_PAL_DATA(pipe));
+
+		d13_lut_logarithmic_pack(&lut[i], ldw, udw);
+	}
+
+	/* All the extended ranges are now limited to last value of 1.0 */
+	while (i < lut_size) {
+		lut[i].red = gamma_max_val;
+		lut[i].green = gamma_max_val;
+		lut[i].blue = gamma_max_val;
+		i++;
+	};
+
+	intel_de_write(dev_priv, PREC_PAL_INDEX(pipe), 0);
+
+	return blob;
+}
+
+static void d13_read_luts(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	if ((crtc_state->gamma_mode & POST_CSC_GAMMA_ENABLE) == 0)
+		return;
+
+	switch (crtc_state->gamma_mode & GAMMA_MODE_MODE_MASK) {
+	case GAMMA_MODE_MODE_8BIT:
+		crtc_state->hw.gamma_lut = ilk_read_lut_8(crtc);
+		break;
+	case GAMMA_MODE_MODE_12BIT_LOGARITHMIC:
+		crtc_state->hw.gamma_lut = d13_read_lut_logarithmic(crtc);
+		break;
+	default:
+		crtc_state->hw.gamma_lut = bdw_read_lut_10(crtc, PAL_PREC_INDEX_VALUE(0));
+	}
+}
+
 void intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
@@ -2488,6 +2559,7 @@ void intel_color_init(struct intel_crtc *crtc)
 
 		if (DISPLAY_VER(dev_priv) >= 13) {
 			dev_priv->display.load_luts = d13_load_luts;
+			dev_priv->display.read_luts = d13_read_luts;
 		} else if (DISPLAY_VER(dev_priv) >= 11) {
 			dev_priv->display.load_luts = icl_load_luts;
 			dev_priv->display.read_luts = icl_read_luts;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 957f97edf035..dc10b5e2ff3c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7750,6 +7750,12 @@ enum {
 #define  GAMMA_MODE_MODE_SPLIT	(3 << 0) /* ivb-bdw */
 #define  GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED	(3 << 0) /* icl + */
 #define  GAMMA_MODE_MODE_12BIT_LOGARITHMIC	(3 << 0) /* D13+ + */
+#define  PAL_PREC_LOGARITHMIC_RED_LDW_MASK	REG_GENMASK(29, 24)
+#define  PAL_PREC_LOGARITHMIC_RED_UDW_MASK	REG_GENMASK(29, 20)
+#define  PAL_PREC_LOGARITHMIC_GREEN_LDW_MASK	REG_GENMASK(19, 14)
+#define  PAL_PREC_LOGARITHMIC_GREEN_UDW_MASK	REG_GENMASK(19, 10)
+#define  PAL_PREC_LOGARITHMIC_BLUE_LDW_MASK	REG_GENMASK(9, 4)
+#define  PAL_PREC_LOGARITHMIC_BLUE_UDW_MASK	REG_GENMASK(9, 0)
 
 /* DMC */
 #define DMC_PROGRAM(i)		_MMIO(0x80000 + (i) * 4)
-- 
2.26.2

