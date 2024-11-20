Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D459D333B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 06:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5AA10E38F;
	Wed, 20 Nov 2024 05:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5Otm5lx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0A510E38F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 05:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732081505; x=1763617505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FmLFnhCxF7m/Xxi8oufcz9UoXuVJQTRKBF7z3XSXQe4=;
 b=B5Otm5lx6WwnERSxxlO2t51cD+VehNc6RfK9SMGG+TxKur9ibnm/Qu3x
 ukvBtgFcR7qzo6ZV43PQ3xoJ8CGg6g0x1dI64q91jAPAUrUQNCLhkav5J
 /9oYPPkTSWIHN8DOfkWObZU5gwO0kiYf5xrsC1RUZh1pq/6vpCH2HvMLm
 TTyVXDpRuIpjeQ9DfvTs7wAu2VzTGXqDvPplp7Fg+93vT78M8JqijI1tO
 ZQp33RLDaCoEPoArqG0eH+pViGvk5iu0r+iLAJeAZsBwSx4/ZgJYTeNAa
 I1kYoN0B78suvxfT2je5AimPSEHWMULiocs/7CCL/CSzwsIuEQWYYDQyN A==;
X-CSE-ConnectionGUID: cTTh3g85TMywB0MoTaBEow==
X-CSE-MsgGUID: zc4ESdXFTNSIPi+lgjCnJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31867794"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31867794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 21:45:05 -0800
X-CSE-ConnectionGUID: AR4zYG87QKCtQc+Q6T9KZw==
X-CSE-MsgGUID: c6WGVUC1Q7iTCuy+QdJkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89606913"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2024 21:45:04 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 3/5] drm/i915/display: Enable the second scaler for sharpness
Date: Wed, 20 Nov 2024 11:16:11 +0530
Message-Id: <20241120054613.3797587-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120054613.3797587-1-nemesa.garg@intel.com>
References: <20241120054613.3797587-1-nemesa.garg@intel.com>
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

As only second scaler can be used for sharpness check if it
is available and also check if panel fitting is also not enabled,
then set the sharpness. Panel fitting will have the preference
over sharpness property.

v2: Add the panel fitting check before enabling sharpness
v3: Reframe commit message[Arun]
v4: Replace string based comparison with plane_state[Jani]
v5: Rebase
v6: Fix build issue

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 10 +++
 drivers/gpu/drm/i915/display/intel_casf.h     |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 10 ++-
 .../drm/i915/display/intel_modeset_verify.c   |  2 +
 drivers/gpu/drm/i915/display/intel_pfit.c     |  6 ++
 drivers/gpu/drm/i915/display/skl_scaler.c     | 86 ++++++++++++++++---
 drivers/gpu/drm/i915/display/skl_scaler.h     |  1 +
 7 files changed, 100 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index d186dea75cbf..fce0b997ae62 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -83,6 +83,16 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
 		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
 				  tmp);
 	}
+
+	skl_scaler_setup_casf(crtc_state);
+}
+
+int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
+{
+	if (!crtc_state->pch_pfit.enabled)
+		crtc_state->hw.casf_params.need_scaler = true;
+
+	return 0;
 }
 
 static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 8e0b67a2fd99..568e0f8083eb 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -12,5 +12,6 @@ struct intel_crtc_state;
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
+int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 86d5f916dfe1..1b1335e0af68 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2137,7 +2137,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
 	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
 	if (crtc_state->pch_pfit.enabled ||
-	    crtc_state->pch_pfit.force_thru)
+	    crtc_state->pch_pfit.force_thru || crtc_state->hw.casf_params.need_scaler)
 		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
 
 	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
@@ -2386,7 +2386,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pch_pfit.enabled || crtc_state->hw.casf_params.need_scaler)
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
@@ -4579,7 +4579,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (DISPLAY_VER(dev_priv) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
-		    intel_crtc_needs_fastset(crtc_state)) {
+		    intel_crtc_needs_fastset(crtc_state) ||
+		    crtc_state->hw.casf_params.need_scaler) {
 			ret = skl_update_scaler_crtc(crtc_state);
 			if (ret)
 				return ret;
@@ -5769,6 +5770,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_BOOL(cmrr.enable);
 	}
 
+	if (pipe_config->uapi.sharpness_strength > 0)
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.need_scaler);
+
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
 #undef PIPE_CONF_CHECK_LLI
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index bc70e72ccc2e..4bd7dbbbb633 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -180,9 +180,11 @@ verify_crtc_state(struct intel_atomic_state *state,
 		    crtc->base.name);
 
 	hw_crtc_state->hw.enable = sw_crtc_state->hw.enable;
+	hw_crtc_state->hw.casf_params.need_scaler = sw_crtc_state->hw.casf_params.need_scaler;
 
 	intel_crtc_get_pipe_config(hw_crtc_state);
 
+	hw_crtc_state->scaler_state.scaler_id = sw_crtc_state->scaler_state.scaler_id;
 	/* we keep both pipes enabled on 830 */
 	if (IS_I830(i915) && hw_crtc_state->hw.active)
 		hw_crtc_state->hw.active = sw_crtc_state->hw.active;
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 50861aa78a89..cee7c984e66b 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -183,6 +183,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_crtc_state *old_crtc_state = intel_atomic_get_old_crtc_state(state, crtc);
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
 	int ret, x, y, width, height;
@@ -193,6 +196,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420)
 		return 0;
 
+	if (old_crtc_state->hw.casf_params.need_scaler)
+		return -EINVAL;
+
 	switch (conn_state->scaling_mode) {
 	case DRM_MODE_SCALE_CENTER:
 		width = pipe_src_w;
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 11f73659c1b6..5311ef6c51d1 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -97,7 +97,12 @@ static u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_cosited)
 #define MTL_MAX_DST_H 8192
 #define SKL_MIN_YUV_420_SRC_W 16
 #define SKL_MIN_YUV_420_SRC_H 16
-
+#define SCALER_FILTER_SELECT \
+	(PS_FILTER_PROGRAMMED | \
+	PS_Y_VERT_FILTER_SELECT(1) | \
+	PS_Y_HORZ_FILTER_SELECT(0) | \
+	PS_UV_VERT_FILTER_SELECT(1) | \
+	PS_UV_HORZ_FILTER_SELECT(0))
 static int
 skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 		  unsigned int scaler_user, int *scaler_id,
@@ -253,7 +258,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
 				 drm_rect_width(&crtc_state->pipe_src),
 				 drm_rect_height(&crtc_state->pipe_src),
 				 width, height, NULL, 0,
-				 crtc_state->pch_pfit.enabled);
+				 crtc_state->pch_pfit.enabled ||
+				 crtc_state->hw.casf_params.need_scaler);
 }
 
 /**
@@ -292,7 +298,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 }
 
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
-				 struct intel_crtc *crtc)
+				 struct intel_crtc *crtc,
+				 struct intel_plane_state *plane_state,
+				 bool casf_scaler)
 {
 	int i;
 
@@ -300,6 +308,11 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		if (scaler_state->scalers[i].in_use)
 			continue;
 
+		if (!plane_state) {
+			if (casf_scaler && i != 1)
+				continue;
+		}
+
 		scaler_state->scalers[i].in_use = true;
 
 		return i;
@@ -312,19 +325,23 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 				     int num_scalers_need, struct intel_crtc *crtc,
 				     const char *name, int idx,
 				     struct intel_plane_state *plane_state,
-				     int *scaler_id)
+				     int *scaler_id, bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
 	u32 mode;
 
 	if (*scaler_id < 0)
-		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
+		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
 
 	if (drm_WARN(display->drm, *scaler_id < 0,
 		     "Cannot find scaler for %s:%d\n", name, idx))
 		return -EINVAL;
 
+	if (crtc_state->hw.casf_params.need_scaler)
+		mode = SKL_PS_SCALER_MODE_HQ;
+
 	/* set scaler mode */
 	if (plane_state && plane_state->hw.fb &&
 	    plane_state->hw.fb->format->is_yuv &&
@@ -443,7 +460,8 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
 	return intel_atomic_setup_scaler(scaler_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "CRTC", crtc->base.base.id,
-					 NULL, &scaler_state->scaler_id);
+					 NULL, &scaler_state->scaler_id,
+					 crtc_state->hw.casf_params.need_scaler);
 }
 
 static int setup_plane_scaler(struct intel_atomic_state *state,
@@ -478,7 +496,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
 	return intel_atomic_setup_scaler(scaler_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "PLANE", plane->base.base.id,
-					 plane_state, &plane_state->scaler_id);
+					 plane_state, &plane_state->scaler_id,
+					 crtc_state->hw.casf_params.need_scaler);
 }
 
 /**
@@ -654,6 +673,44 @@ static void skl_scaler_setup_filter(struct intel_display *display, enum pipe pip
 	}
 }
 
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+	struct drm_rect src, dest;
+	int id, width, height;
+	int x, y;
+	enum pipe pipe = crtc->pipe;
+	u32 ps_ctrl;
+
+	width = adjusted_mode->crtc_hdisplay;
+	height = adjusted_mode->crtc_vdisplay;
+
+	x = y = 0;
+	drm_rect_init(&dest, x, y, width, height);
+
+	width = drm_rect_width(&dest);
+	height = drm_rect_height(&dest);
+	id = scaler_state->scaler_id;
+
+	drm_rect_init(&src, 0, 0,
+		      drm_rect_width(&crtc_state->pipe_src) << 16,
+		      drm_rect_height(&crtc_state->pipe_src) << 16);
+
+	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
+		  PS_BYPASS_ARMING | PS_DB_STALL | SCALER_FILTER_SELECT;
+
+	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
+	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
+			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
+	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
+			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
+}
+
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -824,16 +881,19 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			continue;
 
 		id = i;
-		crtc_state->pch_pfit.enabled = true;
+
+		if (!crtc_state->hw.casf_params.need_scaler)
+			crtc_state->pch_pfit.enabled = true;
 
 		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
 		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
 
-		drm_rect_init(&crtc_state->pch_pfit.dst,
-			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
-			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
-			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
-			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
+		if (!crtc_state->hw.casf_params.need_scaler)
+			drm_rect_init(&crtc_state->pch_pfit.dst,
+				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
+				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
 
 		scaler_state->scalers[i].in_use = true;
 		break;
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h b/drivers/gpu/drm/i915/display/skl_scaler.h
index 4d2e2dbb1666..e1fe6a2d6c32 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.h
+++ b/drivers/gpu/drm/i915/display/skl_scaler.h
@@ -28,5 +28,6 @@ void skl_detach_scalers(const struct intel_crtc_state *crtc_state);
 void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
 
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
 
 #endif
-- 
2.25.1

