Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D7BA381F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B9C10EA27;
	Fri, 26 Sep 2025 11:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdQC3wsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043F10EA40;
 Fri, 26 Sep 2025 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886937; x=1790422937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NnGzEsEW49ZmUpKxU6nvZqjRFdnGLevfFMZxbgGgHHU=;
 b=EdQC3wsW2QDV7rYW/450vs3DwG0COXQtxHpyIIBXPDqAxKBIKw4Tp7B5
 1cr9Mcf5uugc0a0Uz4Sv3MdeyLbFo81fUDgvfPZc6neJO9UkZeb3i8xlE
 GBZW0nMaZIVcS9AMEcpasbjJbpyCfP9hgb0oeLT5GukOGvu1McGdRETFp
 PhEsR5lIw2Mk6Xw8TkxTZJtegV81+X77Efdwey3VGxt1e+mm89quJrL4U
 mr2cFnIO3qVo0G6P9RL2CQxkaPW7sg9X3UmSUA4Uz+HQVXiEkIzKDsLWC
 Vo3Kx16uM25FLdr/Ddtoakl+P4AeIYic74sm+Tehsr7gEPc7lWry+QVtt g==;
X-CSE-ConnectionGUID: Km/XOQ71SF6OaXh3NFeIEw==
X-CSE-MsgGUID: yPApBgM1SRiLnqiFOYI1yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78860088"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78860088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:42:17 -0700
X-CSE-ConnectionGUID: PQiqzvccRHWMFhVnFhBKNQ==
X-CSE-MsgGUID: IqZEUAPIRgW8co7ZZYmLKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176723490"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 26 Sep 2025 04:42:15 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/10] drm/i915/display: Add and compute scaler parameter
Date: Fri, 26 Sep 2025 17:07:24 +0530
Message-Id: <20250926113728.606315-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250926113728.606315-1-nemesa.garg@intel.com>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
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

Compute the values for second scaler for sharpness.
Fill the register bits corresponding to the scaler.

v1: Rename the title of patch [Ankit]
v2: Remove setup_casf from here[Ankit]
v3: Add skl_scaler_setup_casf in casf_enable

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c |  3 ++
 drivers/gpu/drm/i915/display/skl_scaler.c | 46 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/skl_scaler.h |  2 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 63efba10d6f2..f1d158e02c9e 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -12,6 +12,7 @@
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "skl_scaler.h"
 
 #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
@@ -256,4 +257,6 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
 	intel_casf_write_coeff(crtc_state);
+
+	skl_scaler_setup_casf(crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 19aeb8d5b79c..33ad1dd16bb2 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -739,6 +739,52 @@ static void skl_scaler_setup_filter(struct intel_display *display,
 	}
 }
 
+#define CASF_SCALER_FILTER_SELECT \
+	(PS_FILTER_PROGRAMMED | \
+	PS_Y_VERT_FILTER_SELECT(0) | \
+	PS_Y_HORZ_FILTER_SELECT(0) | \
+	PS_UV_VERT_FILTER_SELECT(0) | \
+	PS_UV_HORZ_FILTER_SELECT(0))
+
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
+	int x = 0, y = 0;
+	enum pipe pipe = crtc->pipe;
+	u32 ps_ctrl;
+
+	width = adjusted_mode->crtc_hdisplay;
+	height = adjusted_mode->crtc_vdisplay;
+
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
+	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
+
+	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
+		  CASF_SCALER_FILTER_SELECT;
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
index 12a19016c5f6..f2256984a97e 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.h
+++ b/drivers/gpu/drm/i915/display/skl_scaler.h
@@ -36,6 +36,8 @@ void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
 
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
 
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
+
 enum drm_mode_status
 skl_scaler_mode_valid(struct intel_display *display,
 		      const struct drm_display_mode *mode,
-- 
2.25.1

