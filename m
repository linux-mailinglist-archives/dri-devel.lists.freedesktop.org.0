Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFFD39711F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275416E9F4;
	Tue,  1 Jun 2021 10:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2446E9F0;
 Tue,  1 Jun 2021 10:16:17 +0000 (UTC)
IronPort-SDR: CI7/BLBn5Aav8uqtwj2PGEpqOWqUYMxI01rJ881Mrj6W+FuFQDzV3iixbIbT+BMN/qjPgYPbDo
 9Kk8cDvDa/fA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203549989"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203549989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:16 -0700
IronPort-SDR: 8aYIfoeQXwoCOH7hxnz2jUtIl2vUvEgmgvbPnmMd0T2+FPPqWoIRnUXyjdqgzauhQSK/w2T8B2
 kVMwwBmDV23A==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431289"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:15 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/21] drm/i915/xelpd: Program Plane Degamma Registers
Date: Tue,  1 Jun 2021 16:22:05 +0530
Message-Id: <20210601105218.29185-9-uma.shankar@intel.com>
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

Extract the LUT and program plane degamma registers.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 116 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h            |   2 +
 2 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4908e825f3cc..4e5733573fd8 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -126,6 +126,29 @@ static bool crtc_state_is_legacy_gamma(const struct intel_crtc_state *crtc_state
 		lut_is_legacy(crtc_state->hw.gamma_lut);
 }
 
+/*
+ * Added to accommodate enhanced LUT precision.
+ * Max LUT precision is 32 bits.
+ */
+static u64 drm_color_lut_extract_ext(u64 user_input, u32 bit_precision)
+{
+	u64 val = user_input & 0xffffffff;
+	u32 max;
+
+	if (bit_precision > 32)
+		return 0;
+
+	max = 0xffffffff >> (32 - bit_precision);
+	/* Round only if we're not using full precision. */
+	if (bit_precision < 32) {
+		val += 1UL << (32 - bit_precision - 1);
+		val >>= 32 - bit_precision;
+	}
+
+	return ((user_input & 0xffffffff00000000) |
+		clamp_val(val, 0, max));
+}
+
 /*
  * When using limited range, multiply the matrix given by userspace by
  * the matrix that we would use for the limited range.
@@ -2197,6 +2220,97 @@ static const struct drm_color_lut_range d13_degamma_sdr[] = {
 	},
 };
 
+static void d13_program_plane_degamma_lut(const struct drm_plane_state *state,
+					  struct drm_color_lut_ext *degamma_lut,
+					  u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		lut_size = 128;
+
+		intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			       PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (degamma_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u64 word = drm_color_lut_extract_ext(degamma_lut[i].green, 24);
+				u32 lut_val = (word & 0xffffff);
+
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 131)
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       degamma_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+			       PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (degamma_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					       degamma_lut[i].green);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					       degamma_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					       1 << 16);
+			} while (i++ < 34);
+		}
+
+		intel_de_write(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
+static void d13_plane_load_luts(const struct drm_plane_state *plane_state)
+{
+	const struct drm_property_blob *degamma_lut_blob =
+					plane_state->degamma_lut;
+	struct drm_color_lut_ext *degamma_lut = NULL;
+
+	if (degamma_lut_blob) {
+		degamma_lut = degamma_lut_blob->data;
+		d13_program_plane_degamma_lut(plane_state, degamma_lut, 0);
+	}
+}
+
 int intel_plane_color_init(struct drm_plane *plane)
 {
 	struct drm_i915_private *dev_priv = to_i915(plane->dev);
@@ -2218,6 +2332,8 @@ int intel_plane_color_init(struct drm_plane *plane)
 									   d13_degamma_sdr,
 									   sizeof(d13_degamma_sdr),
 									   LUT_TYPE_DEGAMMA);
+
+		dev_priv->display.load_plane_luts = d13_plane_load_luts;
 		drm_plane_attach_degamma_properties(plane);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9431913969f3..ede7dca440e2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7189,6 +7189,7 @@ enum {
 #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
 #define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
 #define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
+#define   PLANE_PRE_CSC_GAMMA_ENABLE		(1 << 14)
 #define   PLANE_COLOR_CSC_MODE_BYPASS			(0 << 17)
 #define   PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601		(1 << 17)
 #define   PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709		(2 << 17)
@@ -11315,6 +11316,7 @@ enum skl_power_gate {
 #define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
 		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
 		_PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+#define	 PLANE_PAL_PREC_AUTO_INCREMENT		(1 << 10)
 
 #define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
 #define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
-- 
2.26.2

