Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E278C931
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D402B10E41E;
	Tue, 29 Aug 2023 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09BE10E40F;
 Tue, 29 Aug 2023 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324795; x=1724860795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Ws5Es71DzVgr1UntOP4MfujRZ0IKkLZq0t8bAledok=;
 b=S0ZYW8apkd6JugZ57v0Dy8661zMWiKsJkZ/zMm+Aj4So1pXgb7Dsw99m
 XjoBNdQxwuoDXGNXdE8i8HvVHK6I7W2GF8iNgdUXy/zEhqvlKMPs4hCIC
 sYBiqgS/kQjHjmcCLWOyHvydL6mffujw77jfK7s5cwsnmcTG6qthZBKkI
 GuFeAOThGR8zSqXGvNhtP6hc9ycP9G0fiFA6/sAoc/zqlzcACvEQQCmfs
 vS8Y7lowy/zGCtGkQVwsiyX+br7UuF/Q5zIbzxRUREYvYitfZX9v7tw/A
 fs+DjbD2L5n2kBDWK/SiZGYat73uEDSxcm47erZj3kbcsFBFh7QQCWJz3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769460"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555143"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555143"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:36 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 27/33] drm/i915/color: Program Plane Pre-CSC Registers
Date: Tue, 29 Aug 2023 21:34:16 +0530
Message-ID: <20230829160422.1251087-28-uma.shankar@intel.com>
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

Extract the LUT and program plane pre-csc registers.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 120 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h            |   1 +
 2 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 3f3c1ac10330..56bcf750b047 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -185,6 +185,29 @@ static bool lut_is_legacy(const struct drm_property_blob *lut)
 	return lut && drm_color_lut_size(lut) == LEGACY_LUT_LENGTH;
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
@@ -1856,6 +1879,102 @@ static void chv_load_luts(const struct intel_crtc_state *crtc_state)
 			  crtc_state->cgm_mode);
 }
 
+static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
+					    struct drm_color_lut_ext *pre_csc_lut,
+					    u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		lut_size = 128;
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u64 word = drm_color_lut_extract_ext(pre_csc_lut[i].green, 24);
+				u32 lut_val = (word & 0xffffff);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 131)
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+				  PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i].green);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  1 << 16);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
+static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state)
+{
+	const struct drm_property_blob *pre_csc_lut_blob =
+					plane_state->color.pre_csc_lut;
+	struct drm_color_lut_ext *pre_csc_lut = NULL;
+
+	if (pre_csc_lut_blob) {
+		pre_csc_lut = pre_csc_lut_blob->data;
+		xelpd_program_plane_pre_csc_lut(plane_state, pre_csc_lut, 0);
+	}
+}
+
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
@@ -3712,6 +3831,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.read_luts = icl_read_luts,
 	.lut_equal = icl_lut_equal,
 	.read_csc = icl_read_csc,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs tgl_color_funcs = {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5fa7461066ab..d26d6294d231 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6238,6 +6238,7 @@ enum skl_power_gate {
 #define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
 		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
 		_PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+#define	 PLANE_PAL_PREC_AUTO_INCREMENT		REG_BIT(10)
 
 #define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
 #define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
-- 
2.38.1

