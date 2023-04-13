Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6616E12C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AC710EB92;
	Thu, 13 Apr 2023 16:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45610EB90;
 Thu, 13 Apr 2023 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404584; x=1712940584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NlYVoYJTuZFSAx8XfiGJZwoH1fmyWOAHEqRQSyT92/Q=;
 b=JP3XfAAVcydkDLJ47gGAGs6mKNyp8YBJr/SbOWPpKd+8K85yS5/eXVyt
 TltYVA+IhfHCtqRsY1/rKrSSF2wBqy8YX96PjKyJN5fERGKEI/7Ncuy8K
 hQ0MB7aA54Gxk6WW63RKEKBYFg3wDJ6wRBfeGmD1scCq1PLf1kNS2Bnzz
 qO+roHFqgG177UcQH45XLXy52LMU1WOE+4PExrDKTKMycHC+7l49g0nnM
 V4h5teF3Pnxq3/YXau2o5S8qVdxsoneeyHldASShzxBa9PA/TBqA6zPbC
 GzLI4ZeqovQdN/NBPliQe5p0WA0cCL6YRXvtyiWSHC2bHdDcLpEgM7u9D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991123"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037949"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037949"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/i915: Implement CTM property support for VLV
Date: Thu, 13 Apr 2023 19:49:14 +0300
Message-Id: <20230413164916.4221-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

VLV has a so called "wide gamut color correction" unit (WGC).
What it is is a 3x3 matrix similar to the later CHV CGM
CSC, which less precisions/range. In fact CHV also has the WGC
but using it there doesn't reall make sense when you have the
superior CGM CSC around.

Hook up the necessary stuff to expose the WGC as the CTM
crtc property.

One additional crazy idea that came to mind would be to use
the WGC as an output CSC on CHV for YCbCr output. But it
would be incompatible with the legacy LUT usage. In fact
since the WGC lacks post-offsets we'd probably have to
use the legacy LUT to do that final part of the RGB->YCbCr
conversion. Sounds doable, but perhaps not worth the hassle.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 170 +++++++++++++++++-
 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   8 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/i915_reg.h               |  15 ++
 5 files changed, 198 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 7a705e7d8776..e36d8c248b84 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -587,6 +587,98 @@ static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int frac_bits)
 	return c & (BIT(int_bits + frac_bits) - 1);
 }
 
+/*
+ * VLV/CHV Wide Gamut Color Correction (WGC) CSC
+ * |r|   | c0 c1 c2 |   |r|
+ * |g| = | c3 c4 c5 | x |g|
+ * |b|   | c6 c7 c8 |   |b|
+ *
+ * Coefficients are two's complement s2.10.
+ */
+static void vlv_wgc_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
+				    struct intel_csc_matrix *csc)
+{
+	const struct drm_color_ctm *ctm = crtc_state->hw.ctm->data;
+	int i;
+
+	for (i = 0; i < 9; i++)
+		csc->coeff[i] = ctm_to_twos_complement(ctm->matrix[i], 2, 10);
+}
+
+static void vlv_load_wgc_csc(struct intel_crtc *crtc,
+			     const struct intel_csc_matrix *csc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	enum pipe pipe = crtc->pipe;
+
+	intel_de_write_fw(dev_priv, PIPE_WGC_C01_C00(pipe),
+			  csc->coeff[1] << 16 | csc->coeff[0]);
+	intel_de_write_fw(dev_priv, PIPE_WGC_C02(pipe),
+			  csc->coeff[2]);
+
+	intel_de_write_fw(dev_priv, PIPE_WGC_C11_C10(pipe),
+			  csc->coeff[4] << 16 | csc->coeff[3]);
+	intel_de_write_fw(dev_priv, PIPE_WGC_C12(pipe),
+			  csc->coeff[5]);
+
+	intel_de_write_fw(dev_priv, PIPE_WGC_C21_C20(pipe),
+			  csc->coeff[7] << 16 | csc->coeff[6]);
+	intel_de_write_fw(dev_priv, PIPE_WGC_C22(pipe),
+			  csc->coeff[8]);
+}
+
+static void vlv_read_wgc_csc(struct intel_crtc *crtc,
+			     struct intel_csc_matrix *csc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	enum pipe pipe = crtc->pipe;
+	u32 tmp;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C01_C00(pipe));
+	csc->coeff[0] = tmp & 0xffff;
+	csc->coeff[1] = tmp >> 16;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C02(pipe));
+	csc->coeff[2] = tmp & 0xffff;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C11_C10(pipe));
+	csc->coeff[3] = tmp & 0xffff;
+	csc->coeff[4] = tmp >> 16;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C12(pipe));
+	csc->coeff[5] = tmp & 0xffff;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C21_C20(pipe));
+	csc->coeff[6] = tmp & 0xffff;
+	csc->coeff[7] = tmp >> 16;
+
+	tmp = intel_de_read_fw(dev_priv, PIPE_WGC_C22(pipe));
+	csc->coeff[8] = tmp & 0xffff;
+}
+
+static void vlv_read_csc(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	if (crtc_state->wgc_enable)
+		vlv_read_wgc_csc(crtc, &crtc_state->csc);
+}
+
+static void vlv_assign_csc(struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+
+	if (crtc_state->hw.ctm) {
+		drm_WARN_ON(&i915->drm, !crtc_state->wgc_enable);
+
+		vlv_wgc_csc_convert_ctm(crtc_state, &crtc_state->csc);
+	} else {
+		drm_WARN_ON(&i915->drm, crtc_state->wgc_enable);
+
+		intel_csc_clear(&crtc_state->csc);
+	}
+}
+
 /*
  * CHV Color Gamut Mapping (CGM) CSC
  * |r|   | c0 c1 c2 |   |r|
@@ -672,6 +764,8 @@ static void chv_assign_csc(struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
+	drm_WARN_ON(&i915->drm, crtc_state->wgc_enable);
+
 	if (crtc_state->hw.ctm) {
 		drm_WARN_ON(&i915->drm, (crtc_state->cgm_mode & CGM_PIPE_MODE_CSC) == 0);
 
@@ -1574,6 +1668,16 @@ static void icl_load_luts(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+static void vlv_load_luts(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	if (crtc_state->wgc_enable)
+		vlv_load_wgc_csc(crtc, &crtc_state->csc);
+
+	i965_load_luts(crtc_state);
+}
+
 static u32 chv_cgm_degamma_ldw(const struct drm_color_lut *color)
 {
 	return REG_FIELD_PREP(CGM_PIPE_DEGAMMA_GREEN_LDW_MASK, drm_color_lut_extract(color->green, 14)) |
@@ -1728,6 +1832,18 @@ static bool intel_can_preload_luts(const struct intel_crtc_state *new_crtc_state
 		!old_crtc_state->pre_csc_lut;
 }
 
+static bool vlv_can_preload_luts(const struct intel_crtc_state *new_crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
+	struct intel_atomic_state *state =
+		to_intel_atomic_state(new_crtc_state->uapi.state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+
+	return !old_crtc_state->wgc_enable &&
+		!old_crtc_state->post_csc_lut;
+}
+
 static bool chv_can_preload_luts(const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
@@ -1744,7 +1860,7 @@ static bool chv_can_preload_luts(const struct intel_crtc_state *new_crtc_state)
 	if (old_crtc_state->cgm_mode || new_crtc_state->cgm_mode)
 		return false;
 
-	return !old_crtc_state->post_csc_lut;
+	return vlv_can_preload_luts(new_crtc_state);
 }
 
 int intel_color_check(struct intel_crtc_state *crtc_state)
@@ -2031,6 +2147,39 @@ static int i9xx_color_check(struct intel_crtc_state *crtc_state)
 	return 0;
 }
 
+/*
+ * VLV color pipeline:
+ * u0.10 -> WGC csc -> u0.10 -> pipe gamma -> u0.10
+ */
+static int vlv_color_check(struct intel_crtc_state *crtc_state)
+{
+	int ret;
+
+	ret = check_luts(crtc_state);
+	if (ret)
+		return ret;
+
+	crtc_state->gamma_enable =
+		crtc_state->hw.gamma_lut &&
+		!crtc_state->c8_planes;
+
+	crtc_state->gamma_mode = i9xx_gamma_mode(crtc_state);
+
+	crtc_state->wgc_enable = crtc_state->hw.ctm;
+
+	ret = intel_color_add_affected_planes(crtc_state);
+	if (ret)
+		return ret;
+
+	intel_assign_luts(crtc_state);
+
+	vlv_assign_csc(crtc_state);
+
+	crtc_state->preload_luts = vlv_can_preload_luts(crtc_state);
+
+	return 0;
+}
+
 static u32 chv_cgm_mode(const struct intel_crtc_state *crtc_state)
 {
 	u32 cgm_mode = 0;
@@ -2081,6 +2230,12 @@ static int chv_color_check(struct intel_crtc_state *crtc_state)
 
 	crtc_state->cgm_mode = chv_cgm_mode(crtc_state);
 
+	/*
+	 * We always bypass the WGC CSC and use the CGM CSC
+	 * instead since it has degamma and better precision.
+	 */
+	crtc_state->wgc_enable = false;
+
 	ret = intel_color_add_affected_planes(crtc_state);
 	if (ret)
 		return ret;
@@ -3395,6 +3550,15 @@ static const struct intel_color_funcs chv_color_funcs = {
 	.read_csc = chv_read_csc,
 };
 
+static const struct intel_color_funcs vlv_color_funcs = {
+	.color_check = vlv_color_check,
+	.color_commit_arm = i9xx_color_commit_arm,
+	.load_luts = vlv_load_luts,
+	.read_luts = i965_read_luts,
+	.lut_equal = i965_lut_equal,
+	.read_csc = vlv_read_csc,
+};
+
 static const struct intel_color_funcs i965_color_funcs = {
 	.color_check = i9xx_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3502,7 +3666,7 @@ void intel_color_crtc_init(struct intel_crtc *crtc)
 
 	gamma_lut_size = INTEL_INFO(i915)->display.color.gamma_lut_size;
 	degamma_lut_size = INTEL_INFO(i915)->display.color.degamma_lut_size;
-	has_ctm = DISPLAY_VER(i915) >= 5 && !IS_VALLEYVIEW(i915);
+	has_ctm = DISPLAY_VER(i915) >= 5;
 
 	/*
 	 * "DPALETTE_A: NOTE: The 8-bit (non-10-bit) mode is the
@@ -3540,6 +3704,8 @@ void intel_color_init_hooks(struct drm_i915_private *i915)
 	if (HAS_GMCH(i915)) {
 		if (IS_CHERRYVIEW(i915))
 			i915->display.funcs.color = &chv_color_funcs;
+		else if (IS_VALLEYVIEW(i915))
+			i915->display.funcs.color = &vlv_color_funcs;
 		else if (DISPLAY_VER(i915) >= 4)
 			i915->display.funcs.color = &i965_color_funcs;
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 0cdcaa49656f..dd0895b24682 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -184,7 +184,7 @@ ilk_dump_csc(struct drm_i915_private *i915, const char *name,
 }
 
 static void
-chv_dump_csc(struct drm_i915_private *i915, const char *name,
+vlv_dump_csc(struct drm_i915_private *i915, const char *name,
 	     const struct intel_csc_matrix *csc)
 {
 	int i;
@@ -370,7 +370,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	if (!HAS_GMCH(i915))
 		ilk_dump_csc(i915, "pipe csc", &pipe_config->csc);
 	else if (IS_CHERRYVIEW(i915))
-		chv_dump_csc(i915, "cgm csc", &pipe_config->csc);
+		vlv_dump_csc(i915, "cgm csc", &pipe_config->csc);
+	else if (IS_VALLEYVIEW(i915))
+		vlv_dump_csc(i915, "wgc csc", &pipe_config->csc);
 
 dump_planes:
 	if (!state)
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0334565cec82..962bbd13a5bf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2931,6 +2931,9 @@ void i9xx_set_pipeconf(const struct intel_crtc_state *crtc_state)
 
 	val |= TRANSCONF_GAMMA_MODE(crtc_state->gamma_mode);
 
+	if (crtc_state->wgc_enable)
+		val |= TRANSCONF_WGC_ENABLE;
+
 	val |= TRANSCONF_FRAME_START_DELAY(crtc_state->framestart_delay - 1);
 
 	intel_de_write(dev_priv, TRANSCONF(cpu_transcoder), val);
@@ -3123,6 +3126,10 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 
 	pipe_config->framestart_delay = REG_FIELD_GET(TRANSCONF_FRAME_START_DELAY_MASK, tmp) + 1;
 
+	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
+	    (tmp & TRANSCONF_WGC_ENABLE))
+		pipe_config->wgc_enable = true;
+
 	if (IS_CHERRYVIEW(dev_priv))
 		pipe_config->cgm_mode = intel_de_read(dev_priv,
 						      CGM_PIPE_MODE(crtc->pipe));
@@ -5711,6 +5718,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			PIPE_CONF_CHECK_X(csc_mode);
 		PIPE_CONF_CHECK_BOOL(gamma_enable);
 		PIPE_CONF_CHECK_BOOL(csc_enable);
+		PIPE_CONF_CHECK_BOOL(wgc_enable);
 
 		PIPE_CONF_CHECK_I(linetime);
 		PIPE_CONF_CHECK_I(ips_linetime);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b28c8dc48e24..5357664cdf55 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1295,6 +1295,9 @@ struct intel_crtc_state {
 	/* enable pipe csc? */
 	bool csc_enable;
 
+	/* enable vlv/chv wgc csc? */
+	bool wgc_enable;
+
 	/* big joiner pipe bitmask */
 	u8 bigjoiner_pipes;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e9dd19cc66a2..e1a6ba6839b6 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2550,6 +2550,7 @@
 #define   TRANSCONF_MSA_TIMING_DELAY_MASK	REG_GENMASK(19, 18) /* ilk/snb/ivb */
 #define   TRANSCONF_MSA_TIMING_DELAY(x)		REG_FIELD_PREP(TRANSCONF_MSA_TIMING_DELAY_MASK, (x))
 #define   TRANSCONF_CXSR_DOWNCLOCK		REG_BIT(16)
+#define   TRANSCONF_WGC_ENABLE			REG_BIT(15) /* vlv/chv only */
 #define   TRANSCONF_REFRESH_RATE_ALT_VLV		REG_BIT(14)
 #define   TRANSCONF_COLOR_RANGE_SELECT		REG_BIT(13)
 #define   TRANSCONF_OUTPUT_COLORSPACE_MASK	REG_GENMASK(12, 11) /* ilk-ivb */
@@ -6382,6 +6383,20 @@ enum skl_power_gate {
 							    (index) * 4, _PLANE_CSC_POSTOFF_HI_2(pipe) + \
 							    (index) * 4)
 
+#define _PIPE_A_WGC_C01_C00	0x600B0 /* s2.10 */
+#define _PIPE_A_WGC_C02		0x600B4 /* s2.10 */
+#define _PIPE_A_WGC_C11_C10	0x600B8 /* s2.10 */
+#define _PIPE_A_WGC_C12		0x600BC /* s2.10 */
+#define _PIPE_A_WGC_C21_C20	0x600C0 /* s2.10 */
+#define _PIPE_A_WGC_C22		0x600C4 /* s2.10 */
+
+#define PIPE_WGC_C01_C00(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C01_C00)
+#define PIPE_WGC_C02(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C02)
+#define PIPE_WGC_C11_C10(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C11_C10)
+#define PIPE_WGC_C12(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C12)
+#define PIPE_WGC_C21_C20(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C21_C20)
+#define PIPE_WGC_C22(pipe)		_MMIO_TRANS2(pipe, _PIPE_A_WGC_C22)
+
 /* pipe CSC & degamma/gamma LUTs on CHV */
 #define _CGM_PIPE_A_CSC_COEFF01	(VLV_DISPLAY_BASE + 0x67900)
 #define _CGM_PIPE_A_CSC_COEFF23	(VLV_DISPLAY_BASE + 0x67904)
-- 
2.39.2

