Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B498185484B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 12:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2510E52D;
	Wed, 14 Feb 2024 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYbh0aSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F6610E50D;
 Wed, 14 Feb 2024 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707910097; x=1739446097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i4MZcE/Gp72PiqiTGNXPta12p5FpDbwXFt1stqo/l+g=;
 b=RYbh0aSBWQpZnXzAa7WAUPiEWH20Sf7pHa1K3UeWiRi6ZbNT/qmbpFzJ
 BUwdCfk1CYGB8fqHDBT4+NtVfdFY9oSXuuY1tOMEdbgd1oUhLTv+YpPLW
 Oh2SMy0B79JxgqcYhgHMZh8kme2TB5hyzbRznQIR19GxGLoEVoq2XXUUd
 0ODo4iyFB6vZcKA83d1rH+GlsmRo6ZGyyMnoWDchTIZWFA1iYPIcTJ6pc
 AQqhI2uzx3W26rp/Djww7QmfnXoWXgNbAEP+nEgEI0KI9Q++/NouxoT5A
 dgtWvFRoTL1vi58WF9jqvotYEYtuZm5Zn9DmKzoWt1AR5Ab2kzvZ9gaFC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1826962"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1826962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7828040"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 14 Feb 2024 03:28:15 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [RFC 3/5] drm/i915/dispaly/: Enable the second scaler
Date: Wed, 14 Feb 2024 16:54:55 +0530
Message-Id: <20240214112457.3734871-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214112457.3734871-1-nemesa.garg@intel.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
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

The strength value should be greater than zero to
set to the scaler flag true and if the second scaler
is free then it can be used for sharpening purpose.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  7 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 .../drm/i915/display/intel_modeset_verify.c   |  1 +
 .../drm/i915/display/intel_sharpen_filter.c   |  9 +++
 .../drm/i915/display/intel_sharpen_filter.h   |  2 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     | 75 +++++++++++++++++--
 drivers/gpu/drm/i915/display/skl_scaler.h     |  1 +
 7 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5a93bbd1fe25..3d05bd203ca8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1940,7 +1940,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
 	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
 	if (crtc_state->pch_pfit.enabled ||
-	    crtc_state->pch_pfit.force_thru)
+	    crtc_state->pch_pfit.force_thru || crtc_state->hw.casf_params.need_scaler)
 		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
 
 	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
@@ -2195,7 +2195,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pch_pfit.enabled || crtc_state->hw.casf_params.need_scaler)
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
@@ -5334,6 +5334,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.guardband);
 	}
 
+	if (pipe_config->uapi.sharpeness_strength > 0)
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.need_scaler);
+
 #undef PIPE_CONF_CHECK_X
 #undef PIPE_CONF_CHECK_I
 #undef PIPE_CONF_CHECK_BOOL
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index a7a24d177586..d43931127ec2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -800,6 +800,7 @@ struct intel_sharpen_filter {
 	u32 scaler_coefficient[119];
 	bool strength_changed;
 	u8 win_size;
+	bool need_scaler;
 };
 
 struct intel_crtc_scaler_state {
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 076298a8d405..e7e2d26a4c9c 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -177,6 +177,7 @@ verify_crtc_state(struct intel_atomic_state *state,
 		    crtc->base.name);
 
 	hw_crtc_state->hw.enable = sw_crtc_state->hw.enable;
+	hw_crtc_state->hw.casf_params.need_scaler = sw_crtc_state->hw.casf_params.need_scaler;
 
 	intel_crtc_get_pipe_config(hw_crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
index 366739d9dead..221dca3bcba5 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
+++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
@@ -36,6 +36,15 @@ void intel_sharpen_filter_enable(struct intel_crtc_state *crtc_state)
 		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
 				  crtc_state->hw.casf_params. scaler_coefficient[index]);
 	}
+
+	casf_scaler_enable(crtc_state);
+}
+
+int intel_filter_compute_config(struct intel_crtc_state *crtc_state)
+{
+	crtc_state->hw.casf_params.need_scaler = true;
+
+	return 0;
 }
 
 static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
index 6b668aaedf65..89c0d689469c 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
+++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
@@ -23,5 +23,5 @@ struct scaler_filter_coeff {
 
 void intel_sharpen_filter_enable(struct intel_crtc_state *crtc_state);
 void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state);
-
+int intel_filter_compute_config(struct intel_crtc_state *crtc_state);
 #endif /* __INTEL_SHARPEN_FLITER_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 8a934bada624..be61a6ebd7e3 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -121,7 +121,7 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 	 * the 90/270 degree plane rotation cases (to match the
 	 * GTT mapping), hence no need to account for rotation here.
 	 */
-	if (src_w != dst_w || src_h != dst_h)
+	if (src_w != dst_w || src_h != dst_h || crtc_state->hw.casf_params.need_scaler)
 		need_scaler = true;
 
 	/*
@@ -355,6 +355,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 				     int *scaler_id)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct intel_crtc_state *crtc_state = to_intel_crtc_state(intel_crtc->base.state);
 	int j;
 	u32 mode;
 
@@ -363,6 +364,8 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 		for (j = 0; j < intel_crtc->num_scalers; j++) {
 			if (scaler_state->scalers[j].in_use)
 				continue;
+			if (crtc_state->hw.casf_params.need_scaler && j != 1)
+				continue;
 
 			*scaler_id = j;
 			scaler_state->scalers[*scaler_id].in_use = 1;
@@ -374,6 +377,10 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 		     "Cannot find scaler for %s:%d\n", name, idx))
 		return -EINVAL;
 
+	if (crtc_state->hw.casf_params.need_scaler) {
+		mode = SKL_PS_SCALER_MODE_HQ;
+	}
+
 	/* set scaler mode */
 	if (plane_state && plane_state->hw.fb &&
 	    plane_state->hw.fb->format->is_yuv &&
@@ -677,6 +684,15 @@ static void glk_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
 	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(pipe, id, set), 0);
 }
 
+static u32 scaler_filter_select(void)
+{
+	return (PS_FILTER_PROGRAMMED |
+			PS_Y_VERT_FILTER_SELECT(1) |
+			PS_Y_HORZ_FILTER_SELECT(0) |
+			PS_UV_VERT_FILTER_SELECT(1) |
+			PS_UV_HORZ_FILTER_SELECT(0));
+}
+
 static u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set)
 {
 	if (filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
@@ -704,6 +720,48 @@ static void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
 	}
 }
 
+void casf_scaler_enable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
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
+	struct drm_rect *dst = &dest;
+
+	x = dst->x1;
+	y = dst->y1;
+	width = drm_rect_width(dst);
+	height = drm_rect_height(dst);
+	id = scaler_state->scaler_id;
+
+	drm_rect_init(&src, 0, 0,
+		      drm_rect_width(&crtc_state->pipe_src) << 16,
+		      drm_rect_height(&crtc_state->pipe_src) << 16);
+
+	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
+		PS_BYPASS_ARMING | PS_DB_STALL | scaler_filter_select();
+
+	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
+	intel_de_write_fw(dev_priv, SKL_PS_WIN_POS(pipe, id),
+			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
+	intel_de_write_fw(dev_priv, SKL_PS_WIN_SZ(pipe, id),
+			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
+}
+
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -874,16 +932,19 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
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

