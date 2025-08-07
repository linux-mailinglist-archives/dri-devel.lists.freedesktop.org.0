Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3AB1D4C1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 11:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5745810E805;
	Thu,  7 Aug 2025 09:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi5IT6Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77210E3DF;
 Thu,  7 Aug 2025 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754559239; x=1786095239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJ/MIP7cngX5nbF6kRuFXPk9VKhg7JCvXu+AJVBGN0I=;
 b=Zi5IT6PvAvSF0OwUWHzSB1oBu2KSzeybgCxLxNCo2QCKngcgvpX1avrt
 zPudXvJGwzlTmOfr1LW4xnUzvQWsAWLAr0xqWENjzsGD9dDqL91T/HmE5
 +ygvkXDpzvH5duCwBRDA5rdeRRjWXnb7ofsLGqrdoE9neP2i8UwN5RdIP
 yQpcfAI5QV+JqFE4bjQgi8XTU+HzH07T6rownWQTPDLTt1g3Ofj8i+nMm
 dwQ7yFEMVG7waY25f2JBKrCL0dLCLPk+3OdtXWDjPgO2A+8kDOqYyQpyk
 F0wJRJ5yviZDZkE9fZ/akMH+jl9IK7PI1emJT/qSuLJ1vpXNFK0Eo+5Vw A==;
X-CSE-ConnectionGUID: dNEXfVNAQ0q2BxzWJsuMBA==
X-CSE-MsgGUID: igyjVawnR3uR9JuKlX6vTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56597255"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56597255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 02:33:59 -0700
X-CSE-ConnectionGUID: 6bXpjF79TEaErFebjuRUeQ==
X-CSE-MsgGUID: ixONaIRmSTyaPWOvqQWocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164918525"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 02:33:57 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/10] drm/i915/display: Add strength and winsize register
Date: Thu,  7 Aug 2025 14:58:34 +0530
Message-Id: <20250807092841.3169436-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

The sharpness strength value is determined by user input,
while the winsize is based on the resolution.
The casf_enable flag should be set if the platform supports
sharpness adjustments and the user API strength is not zero.
Once sharpness is enabled, update the strength bit of the
register whenever the user changes the strength value,
as the enable bit and winsize bit remain constant.

v2: Introduce get_config for casf[Ankit]
v3: Replace 0 with FILTER_STRENGTH_MASK[Ankit]
v4: After updating strength add win_sz register
v5: Replace u16 with u32 for total_pixel

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 109 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  17 +++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  22 ++++
 .../drm/i915/display/intel_display_types.h    |   7 ++
 drivers/gpu/drm/i915/display/skl_scaler.c     |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 7 files changed, 158 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 853543443072..56b5aec496f3 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -227,6 +227,7 @@ i915-y += \
 	display/intel_bios.o \
 	display/intel_bo.o \
 	display/intel_bw.o \
+	display/intel_casf.o \
 	display/intel_cdclk.o \
 	display/intel_cmtg.o \
 	display/intel_color.o \
diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
new file mode 100644
index 000000000000..6a877c7c76fa
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ */
+
+#include <drm/drm_print.h>
+
+#include "i915_reg.h"
+#include "intel_casf.h"
+#include "intel_casf_regs.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+
+#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
+#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
+
+/**
+ * DOC: Content Adaptive Sharpness Filter (CASF)
+ *
+ * Starting from LNL the display engine supports an
+ * adaptive sharpening filter, enhancing the image
+ * quality. The display hardware utilizes the second
+ * pipe scaler for implementing CASF.
+ * If sharpness is being enabled then pipe scaling
+ * cannot be used.
+ * This filter operates on a region of pixels based
+ * on the tap size. Coefficients are used to generate
+ * an alpha value which blends the sharpened image to
+ * original image.
+ */
+
+void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int win_size;
+
+	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), FILTER_STRENGTH_MASK,
+		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
+
+	win_size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, 1));
+
+	intel_de_write_fw(display, SKL_PS_WIN_SZ(crtc->pipe, 1), win_size);
+}
+
+static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	u32 total_pixels = mode->hdisplay * mode->vdisplay;
+
+	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
+		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
+	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
+		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
+	else
+		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
+}
+
+int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (!HAS_CASF(display))
+		return 0;
+
+	if (crtc_state->uapi.sharpness_strength == 0) {
+		crtc_state->hw.casf_params.casf_enable = false;
+		crtc_state->hw.casf_params.strength = 0;
+		return 0;
+	}
+
+	crtc_state->hw.casf_params.casf_enable = true;
+
+	/*
+	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
+	 * Strength is from 0.0-14.9375 ie from 0-239.
+	 * User can give value from 0-255 but is clamped to 239.
+	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
+	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
+	 * Also 85 + 16 = 101.
+	 */
+	crtc_state->hw.casf_params.strength =
+		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
+
+	intel_casf_compute_win_size(crtc_state);
+
+	return 0;
+}
+
+void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 sharp;
+
+	sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
+	if (sharp & FILTER_EN) {
+		if (drm_WARN_ON(display->drm,
+				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
+			crtc_state->hw.casf_params.strength = 0;
+		else
+			crtc_state->hw.casf_params.strength =
+				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
+		crtc_state->hw.casf_params.casf_enable = true;
+		crtc_state->hw.casf_params.win_size =
+			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
new file mode 100644
index 000000000000..83523fe66c48
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_CASF_H__
+#define __INTEL_CASF_H__
+
+#include <linux/types.h>
+
+struct intel_crtc_state;
+
+int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
+void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
+void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
+
+#endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
new file mode 100644
index 000000000000..c24ba281ae37
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_CASF_REGS_H__
+#define __INTEL_CASF_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+#define _SHARPNESS_CTL_A               0x682B0
+#define _SHARPNESS_CTL_B               0x68AB0
+#define SHARPNESS_CTL(pipe)            _MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
+#define   FILTER_EN                    REG_BIT(31)
+#define   FILTER_STRENGTH_MASK         REG_GENMASK(15, 8)
+#define   FILTER_STRENGTH(x)           REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
+#define   FILTER_SIZE_MASK             REG_GENMASK(1, 0)
+#define   SHARPNESS_FILTER_SIZE_3X3    REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
+#define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
+#define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
+
+#endif /* __INTEL_CASF_REGS__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 35596f3921e8..b62a07236913 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -943,6 +943,12 @@ struct intel_csc_matrix {
 	u16 postoff[3];
 };
 
+struct intel_casf {
+	u8 strength;
+	u8 win_size;
+	bool casf_enable;
+};
+
 struct intel_crtc_state {
 	/*
 	 * uapi (drm) state. This is the software state shown to userspace.
@@ -979,6 +985,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_casf casf_params;
 	} hw;
 
 	/* actual state of LUTs */
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index cd7ebbeb9508..375b8c644923 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include "i915_utils.h"
+#include "intel_casf_regs.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_trace.h"
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..5e10377b15c2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -223,6 +223,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_backlight.o \
 	i915-display/intel_bios.o \
 	i915-display/intel_bw.o \
+	i915-display/intel_casf.o \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
-- 
2.25.1

