Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B197ADD8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 11:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3C310E451;
	Tue, 17 Sep 2024 09:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGT8gBUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9542F10E452;
 Tue, 17 Sep 2024 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726565221; x=1758101221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ANFPzVK1/+M+AaKnZGvJ+wgTepEp/wJUzWwZRWoWua8=;
 b=dGT8gBUqnk4/aj+tkohz+w7J7MacJflhzS24S99Gh4I5he20MYAr1aau
 WBtE9BUl07qiYdt8rmrOy7tywISmXtjjGWg7HKcDN+Yv/BDsckKW6ex2f
 J+/bLRU26nmKNB83WyaLuCT+CmdXjJNK2aNjoNKnkz/CFzLh8acMGv5+D
 p4Hv/9JTeJpBanbYhD610zdmhimsNTRisjREXMW7g3ybR6vY+xQB0Gmwj
 8YlTYMHmE2YCKC+ty0TmI1PHH1QLoKGsMt+bbuhrmenntHzaWlfbB17Lm
 8zFS71lsgPKkH48oR4pyZ12sfLO6K/57w3G5VeWghuZB/e41jc9wQYyxH A==;
X-CSE-ConnectionGUID: Z6LQQecdT4CWdc/b88NWHg==
X-CSE-MsgGUID: tOEOT0XJSxK8zP2IPVgsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36789042"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36789042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:27:00 -0700
X-CSE-ConnectionGUID: uIsVfR/4T6mjH+djGEIvug==
X-CSE-MsgGUID: jqifkaRMRfOpcK9Ey9s8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99815991"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 02:26:59 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v3 3/5] drm/i915/display: Enable the second scaler for
 sharpness
Date: Tue, 17 Sep 2024 14:56:32 +0530
Message-Id: <20240917092634.1109572-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917092634.1109572-1-nemesa.garg@intel.com>
References: <20240917092634.1109572-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 10 ++-
 .../drm/i915/display/intel_modeset_verify.c   |  1 +
 drivers/gpu/drm/i915/display/intel_panel.c    |  7 ++
 .../drm/i915/display/intel_sharpness_filter.c | 10 +++
 .../drm/i915/display/intel_sharpness_filter.h |  1 +
 drivers/gpu/drm/i915/display/skl_scaler.c     | 78 ++++++++++++++++---
 drivers/gpu/drm/i915/display/skl_scaler.h     |  1 +
 7 files changed, 95 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e447a316ec38..a6e33238dac8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2039,7 +2039,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
 	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
 	if (crtc_state->pch_pfit.enabled ||
-	    crtc_state->pch_pfit.force_thru)
+	    crtc_state->pch_pfit.force_thru || crtc_state->hw.casf_params.need_scaler)
 		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
 
 	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
@@ -2295,7 +2295,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pch_pfit.enabled || crtc_state->hw.casf_params.need_scaler)
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
@@ -4306,7 +4306,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (DISPLAY_VER(dev_priv) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
-		    intel_crtc_needs_fastset(crtc_state)) {
+		    intel_crtc_needs_fastset(crtc_state) ||
+		    crtc_state->hw.casf_params.need_scaler) {
 			ret = skl_update_scaler_crtc(crtc_state);
 			if (ret)
 				return ret;
@@ -5492,6 +5493,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_BOOL(cmrr.enable);
 	}
 
+	if (pipe_config->uapi.sharpness_strength > 0)
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.need_scaler);
+
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
 #undef PIPE_CONF_CHECK_LLI
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 3491db5cad31..ed75934bed6b 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -177,6 +177,7 @@ verify_crtc_state(struct intel_atomic_state *state,
 		    crtc->base.name);
 
 	hw_crtc_state->hw.enable = sw_crtc_state->hw.enable;
+	hw_crtc_state->hw.casf_params.need_scaler = sw_crtc_state->hw.casf_params.need_scaler;
 
 	intel_crtc_get_pipe_config(hw_crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 71454ddef20f..6ed13245bdc8 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -389,6 +389,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 {
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_crtc_state *old_crtc_state = intel_atomic_get_old_crtc_state(state, crtc);
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
 	int x, y, width, height;
@@ -399,6 +402,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420)
 		return 0;
 
+	if (old_crtc_state->hw.casf_params.need_scaler)
+		return -EINVAL;
+
 	switch (conn_state->scaling_mode) {
 	case DRM_MODE_SCALE_CENTER:
 		width = pipe_src_w;
@@ -451,6 +457,7 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 
 	drm_rect_init(&crtc_state->pch_pfit.dst,
 		      x, y, width, height);
+
 	crtc_state->pch_pfit.enabled = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
index e5fbffbe0428..42073aa25edc 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
@@ -45,6 +45,16 @@ void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
 		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
 				  crtc_state->hw.casf_params. scaler_coefficient[index]);
 	}
+
+	casf_scaler_enable(crtc_state);
+}
+
+int intel_sharpness_filter_compute_config(struct intel_crtc_state *crtc_state)
+{
+	if (!crtc_state->pch_pfit.enabled)
+		crtc_state->hw.casf_params.need_scaler = true;
+
+	return 0;
 }
 
 static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
index d1dc65e747fe..84f47d511cdc 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
@@ -34,5 +34,6 @@ struct intel_sharpness_filter {
 
 void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);
 void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state);
+int intel_sharpness_filter_compute_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_SHARPEN_FILTER_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index baa601d27815..af40288a6709 100644
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
@@ -353,9 +359,10 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 				     int num_scalers_need, struct intel_crtc *intel_crtc,
 				     const char *name, int idx,
 				     struct intel_plane_state *plane_state,
-				     int *scaler_id)
+				     int *scaler_id, bool casf_scaler)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct intel_crtc_state *crtc_state = to_intel_crtc_state(intel_crtc->base.state);
 	int j;
 	u32 mode;
 
@@ -365,6 +372,11 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 			if (scaler_state->scalers[j].in_use)
 				continue;
 
+			if (!strcmp(name, "CRTC")) {
+				if (casf_scaler && j != 1)
+					continue;
+			}
+
 			*scaler_id = j;
 			scaler_state->scalers[*scaler_id].in_use = 1;
 			break;
@@ -375,6 +387,10 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 		     "Cannot find scaler for %s:%d\n", name, idx))
 		return -EINVAL;
 
+	if (crtc_state->hw.casf_params.need_scaler) {
+		mode = SKL_PS_SCALER_MODE_HQ;
+	}
+
 	/* set scaler mode */
 	if (plane_state && plane_state->hw.fb &&
 	    plane_state->hw.fb->format->is_yuv &&
@@ -598,7 +614,8 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 
 		ret = intel_atomic_setup_scaler(scaler_state, num_scalers_need,
 						intel_crtc, name, idx,
-						plane_state, scaler_id);
+						plane_state, scaler_id,
+						crtc_state->hw.casf_params.need_scaler);
 		if (ret < 0)
 			return ret;
 	}
@@ -705,6 +722,44 @@ static void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
 	}
 }
 
+void casf_scaler_enable(struct intel_crtc_state *crtc_state)
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
+		PS_BYPASS_ARMING | PS_DB_STALL | SCALER_FILTER_SELECT;
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
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -875,16 +930,19 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			continue;
 
 		id = i;
-		crtc_state->pch_pfit.enabled = true;
+
+		if (!crtc_state->hw.casf_params.need_scaler)
+			crtc_state->pch_pfit.enabled = true;
 
 		pos = intel_de_read(dev_priv, SKL_PS_WIN_POS(crtc->pipe, i));
 		size = intel_de_read(dev_priv, SKL_PS_WIN_SZ(crtc->pipe, i));
 
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
index 63f93ca03c89..444527e6a15b 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.h
+++ b/drivers/gpu/drm/i915/display/skl_scaler.h
@@ -33,5 +33,6 @@ void skl_detach_scalers(const struct intel_crtc_state *crtc_state);
 void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
 
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
+void casf_scaler_enable(struct intel_crtc_state *crtc_state);
 
 #endif
-- 
2.25.1

