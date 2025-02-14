Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17130A3613B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9410ECE1;
	Fri, 14 Feb 2025 15:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IobtV5dV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8090D10ECDF;
 Fri, 14 Feb 2025 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739546145; x=1771082145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBxDlViB4o4tx/u38Bquu0osT9hhjfRl7d+70Tai1Hk=;
 b=IobtV5dV1p9phnYrI3IEwRGCktpgMkadYS+f6SgnJc1yLSkbz1ZIhOHL
 e+qsaxN0hRGJ3zYikUUNWTSLbIAhcHcAaXyQok3uCohuGXAphfEOAMioy
 xhrzYCsM95SRS6XEVWgeMzqNGARdY9Dqekg0klMRvvKzdEYk9CyzoV56D
 5bfqtjvsmexALxhxJpcJUYEIwk/8n0WymAhrRxlzpuGy158VRgefOA1zE
 RKDI5DqqZlSb4cflYISvrRCYyY5CUnVsmsxU4ZRCyuQpwDXvWVQHiZEWt
 7zMOiwo9e+SHcvtPdBCeYHCq+IM4Vw6GKhWapj/rcqNK04OL/g4e48nlC A==;
X-CSE-ConnectionGUID: AvEO8u0ITs2zHJgthmZAeA==
X-CSE-MsgGUID: 1qJsvkA6TPGyo5NVSPRrAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50510835"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50510835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:15:45 -0800
X-CSE-ConnectionGUID: 58KM4tbbTxulVJ9xZjQk1w==
X-CSE-MsgGUID: TResWshOSemM8h3w86Rgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118413183"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 07:15:44 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 3/6] drm/i915/display: Enable the second scaler
Date: Fri, 14 Feb 2025 20:41:29 +0530
Message-Id: <20250214151132.1811682-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214151132.1811682-1-nemesa.garg@intel.com>
References: <20250214151132.1811682-1-nemesa.garg@intel.com>
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

Write the scaler registers for sharpness.

v1: Rename the title of patch [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c |  2 +
 drivers/gpu/drm/i915/display/skl_scaler.c | 45 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/skl_scaler.h |  1 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 1526bebae1b6..989219e698c6 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -109,6 +109,8 @@ static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
 	intel_casf_write_coeff(crtc_state);
+
+	skl_scaler_setup_casf(crtc_state);
 }
 
 static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 3d24fa773094..9c6259ed971c 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -132,6 +132,13 @@ static void skl_scaler_max_dst_size(struct intel_crtc *crtc,
 	}
 }
 
+#define SCALER_FILTER_SELECT \
+	(PS_FILTER_PROGRAMMED | \
+	PS_Y_VERT_FILTER_SELECT(1) | \
+	PS_Y_HORZ_FILTER_SELECT(0) | \
+	PS_UV_VERT_FILTER_SELECT(1) | \
+	PS_UV_HORZ_FILTER_SELECT(0))
+
 static int
 skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 		  unsigned int scaler_user, int *scaler_id,
@@ -717,6 +724,44 @@ static void skl_scaler_setup_filter(struct intel_display *display, enum pipe pip
 	}
 }
 
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_display_mode *adjusted_mode =
+	&crtc_state->hw.adjusted_mode;
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
+		  SCALER_FILTER_SELECT;
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

