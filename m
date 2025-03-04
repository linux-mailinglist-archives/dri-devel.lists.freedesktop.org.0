Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7BA4DAA6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82510E578;
	Tue,  4 Mar 2025 10:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggENdF/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63D310E56C;
 Tue,  4 Mar 2025 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084414; x=1772620414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Ww8yUjsVR0AnAHMv9h5SIOEW/iQfM/w0Z7rmEi8lE8=;
 b=ggENdF/9G2v/s14OmP+M8dMHNXUXHrGrOUe07Y4Few4fLCnHzvdXU9zn
 jqBrFNUC3OjyIYuvlkd/L9XwgoBGwbbB3BTLTwXbtWt9NgYT/1x+UuZ3Y
 usZ2pMUv5aEqdEB7QDmrkSXN6NH6Onm7ZGNxY1Jatth+FSl1ZEzGp7h5P
 cmrl2tETt4tDHMtT1S/DRrntUB5RPlxM8ZBlyignKvwPQykAAxXRCVrq6
 Yi2C8c9aVuzvE8Ih6VfPi1TGGDplHvi02FkrSiYGzzmtgbEtmdk0mS5Gj
 kPW2Zh3L3+jcKLX4zl2zYfvbPuvcWqgRfSKIMovZNWXDhrY4zWlFHJSYL w==;
X-CSE-ConnectionGUID: DR+U0hUGS1Gu+VaOuxg4fQ==
X-CSE-MsgGUID: QSe88gGeRoW5xVR9cHLU4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584070"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:33 -0800
X-CSE-ConnectionGUID: qX85k1GRSkeI7OiDvTImiw==
X-CSE-MsgGUID: Uu9OnxEFRIesjEISdpAVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118063975"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:31 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 03/10] drm/i915/display: Add sharpness strength and winsize
Date: Tue,  4 Mar 2025 15:58:50 +0530
Message-Id: <20250304102857.326544-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Add new registers and related bits. Compute the strength
value and tap value based on display mode.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 68 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     | 16 +++++
 .../gpu/drm/i915/display/intel_casf_regs.h    | 23 +++++++
 .../drm/i915/display/intel_crtc_state_dump.c  |  7 ++
 .../drm/i915/display/intel_display_types.h    |  7 ++
 drivers/gpu/drm/i915/display/skl_scaler.c     |  1 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 8 files changed, 124 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..d7550b26cdfb 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -230,6 +230,7 @@ i915-y += \
 	display/intel_bios.o \
 	display/intel_bo.o \
 	display/intel_bw.o \
+	display/intel_casf.o \
 	display/intel_cdclk.o \
 	display/intel_cmtg.o \
 	display/intel_color.o \
diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
new file mode 100644
index 000000000000..2c406e7c5fb6
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ */
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
+ * From LNL onwards the display engine based adaptive
+ * sharpening filter is supported. This helps in
+ * improving the image quality. The display hardware
+ * uses one of the pipe scaler for implementing casf.
+ * It works on a region of pixels depending on the
+ * tap size. The coefficients are used to generate an
+ * alpha value which is used to blend the sharpened image
+ * to original image.
+ */
+
+void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), 0,
+		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
+}
+
+static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	u16 total_pixels = mode->hdisplay * mode->vdisplay;
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
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
new file mode 100644
index 000000000000..6e308c367c17
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -0,0 +1,16 @@
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
+
+#endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
new file mode 100644
index 000000000000..e5fa4d9bb309
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -0,0 +1,23 @@
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
+
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 599ddce96371..66b6fbae8294 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -372,6 +372,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 
 	intel_vdsc_state_dump(&p, 0, pipe_config);
 
+	if (HAS_CASF(i915)) {
+		drm_printf(&p, "sharpness strength: %d, sharpness tap size :%d\n sharpness enable :%d\n",
+			   pipe_config->hw.casf_params.strength,
+			   pipe_config->hw.casf_params.win_size,
+			   pipe_config->hw.casf_params.casf_enable);
+	}
+
 dump_planes:
 	if (!state)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 99a6fd2900b9..ccaf9dd4f6a8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -931,6 +931,12 @@ struct intel_csc_matrix {
 	u16 postoff[3];
 };
 
+struct intel_casf {
+	u8 strength;
+	u8 win_size;
+	bool casf_enable;
+};
+
 void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
 
 typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
@@ -971,6 +977,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_casf casf_params;
 	} hw;
 
 	/* actual state of LUTs */
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index ee81220a7c88..f0cf966211c9 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -5,6 +5,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
+#include "intel_casf_regs.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 856b14fe1c4d..a6156f59c039 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -207,6 +207,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_backlight.o \
 	i915-display/intel_bios.o \
 	i915-display/intel_bw.o \
+	i915-display/intel_casf.o \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
-- 
2.25.1

