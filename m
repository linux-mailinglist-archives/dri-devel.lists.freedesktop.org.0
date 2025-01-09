Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8AA08106
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0641A10EFB1;
	Thu,  9 Jan 2025 20:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOvqDGuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6801E10EFBE;
 Thu,  9 Jan 2025 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452869; x=1767988869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mlafw0ofFmCXMBlatSkSXiaC7IE/k00nihyIrP5HWZY=;
 b=SOvqDGuP1hZhmRr1x6kicKCCJVpST8ACHJgVc7/we+tt2WWjJFoA6onv
 h2zaiAZA/fU/2q7xjh0Zcb7vYK6dn9U9xGKhlm0LzvKP2nBPI9m+NjRnw
 PUbUZonmzf1n6m5l21KAkhhmR9Nz+EydK6TTdeamCyKA6ZGG3E3RuQ2K1
 q61dETlaTpkFqdfaw7ew70uxoOAp7Tu4gNXPMoC6xDHtCn1YGlFfJHER3
 GYokwGSFXeObUm7dXMhDwzb2cuQIpDLWe2fNmB3WKkhseKHmPMmSEtV3U
 XfCH1NTw3bfFjVDXqBcehWW0aUvkgipw/2JhVMrSqWS4t/0y44K30Nl53 g==;
X-CSE-ConnectionGUID: q8jVoUp6TKSOm3x0xysFxA==
X-CSE-MsgGUID: wOzix6JESIqSzymgKRt1cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619212"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:08 -0800
X-CSE-ConnectionGUID: v+Og7JKsTU+vNWuzh8BA5A==
X-CSE-MsgGUID: NDF25O3aRFecVynKX62FEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798640"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:05 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:34 +0530
Subject: [PATCH v7 06/14] drm/i915/histogram: Add support for histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-dpst-v7-6-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Statistics is generated from the image frame that is coming to display
and an event is sent to user after reading this histogram data.

v2: forward declaration in header file along with error handling (Jani)
v3: Replaced i915 with intel_display (Suraj)
v4: Removed dithering enable/disable (Vandita)
    New patch for histogram register definitions (Suraj)
v5: IET LUT pgm follow the seq in spec and removed change to TC at end
    (Suraj)
v8: Retained only the Histogram part and move IET LUT to a different
    patch.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_histogram.c     | 149 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  48 +++++++
 4 files changed, 200 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3dda9f0eda82b7501193eb3fb9c0e5dd8efa71e4..8c4277cc63eb6c1e12a1714df2abf07c290aacc6 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -270,6 +270,7 @@ i915-y += \
 	display/intel_hdcp.o \
 	display/intel_hdcp_gsc.o \
 	display/intel_hdcp_gsc_message.o \
+	display/intel_histogram.o \
 	display/intel_hotplug.o \
 	display/intel_hotplug_irq.o \
 	display/intel_hti.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index eb9dd1125a4a09511936b81219e7f38fae106dfd..e17729f0f5f5e9e79a08c9b72ab3772a78e1fbc7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1434,6 +1434,8 @@ struct intel_crtc {
 	/* for loading single buffered registers during vblank */
 	struct pm_qos_request vblank_pm_qos;
 
+	struct intel_histogram *histogram;
+
 #ifdef CONFIG_DEBUG_FS
 	struct intel_pipe_crc pipe_crc;
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
new file mode 100644
index 0000000000000000000000000000000000000000..9861252cf3cc9ac5dd68084a6378db36f4cf29ac
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
+
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "intel_de.h"
+#include "intel_display.h"
+#include "intel_display_types.h"
+#include "intel_histogram.h"
+#include "intel_histogram_regs.h"
+
+/* 3.0% of the pipe's current pixel count, hw does x4 */
+#define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300
+/* Precision factor for threshold guardband */
+#define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
+#define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
+
+int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)
+{
+	struct intel_histogram *histogram = intel_crtc->histogram;
+
+	/* TODO: Restrictions for enabling histogram */
+	histogram->can_enable = true;
+
+	return 0;
+}
+
+static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
+{
+	struct intel_display *display = to_intel_display(intel_crtc);
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	int pipe = intel_crtc->pipe;
+	u64 res;
+	u32 gbandthreshold;
+
+	if (!histogram || !histogram->can_enable)
+		return -EINVAL;
+
+	if (histogram->enable)
+		return 0;
+
+	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
+		     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT |
+		     DPST_CTL_ENHANCEMENT_MODE_MASK | DPST_CTL_IE_MODI_TABLE_EN,
+		     ((mode == DRM_MODE_HISTOGRAM_HSV_MAX_RGB) ?
+		      DPST_CTL_BIN_REG_FUNC_TC : 0) | DPST_CTL_IE_HIST_EN |
+		     DPST_CTL_HIST_MODE_HSV |
+		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
+		     DPST_CTL_EN_MULTIPLICATIVE | DPST_CTL_IE_MODI_TABLE_EN);
+
+	/* Re-Visit: check if wait for one vblank is required */
+	drm_crtc_wait_one_vblank(&intel_crtc->base);
+
+	/* TODO: Program GuardBand Threshold needs to be moved to modeset path */
+	res = (intel_crtc->config->hw.adjusted_mode.vtotal *
+	       intel_crtc->config->hw.adjusted_mode.htotal);
+
+	gbandthreshold = (res *	HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT) /
+			  HISTOGRAM_GUARDBAND_PRECISION_FACTOR;
+
+	/* Enable histogram interrupt mode */
+	intel_de_rmw(display, DPST_GUARD(pipe),
+		     DPST_GUARD_THRESHOLD_GB_MASK |
+		     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
+		     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
+		     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
+		     DPST_GUARD_HIST_INT_EN);
+
+	/* Clear pending interrupts has to be done on separate write */
+	intel_de_rmw(display, DPST_GUARD(pipe),
+		     DPST_GUARD_HIST_EVENT_STATUS, 1);
+
+	histogram->enable = true;
+
+	return 0;
+}
+
+static void intel_histogram_disable(struct intel_crtc *intel_crtc)
+{
+	struct intel_display *display = to_intel_display(intel_crtc);
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	int pipe = intel_crtc->pipe;
+
+	if (!histogram)
+		return;
+
+	/* If already disabled return */
+	if (histogram->enable)
+		return;
+
+	/* Clear pending interrupts and disable interrupts */
+	intel_de_rmw(display, DPST_GUARD(pipe),
+		     DPST_GUARD_HIST_INT_EN | DPST_GUARD_HIST_EVENT_STATUS, 0);
+
+	/* disable DPST_CTL Histogram mode */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_IE_HIST_EN, 0);
+
+	histogram->enable = false;
+}
+
+int intel_histogram_update(struct intel_crtc *intel_crtc,
+			   struct drm_histogram_config *config)
+{
+	if (config->enable)
+		return intel_histogram_enable(intel_crtc, config->hist_mode);
+
+	intel_histogram_disable(intel_crtc);
+	return 0;
+}
+
+void intel_histogram_finish(struct intel_crtc *intel_crtc)
+{
+	struct intel_histogram *histogram = intel_crtc->histogram;
+
+	kfree(histogram);
+}
+
+int intel_histogram_init(struct intel_crtc *crtc)
+{
+	struct intel_histogram *histogram;
+	struct drm_histogram_caps *histogram_caps;
+
+	/* Allocate histogram internal struct */
+	histogram = kzalloc(sizeof(*histogram), GFP_KERNEL);
+	if (!histogram)
+		return -ENOMEM;
+	histogram_caps = kzalloc(sizeof(*histogram_caps), GFP_KERNEL);
+	if (!histogram_caps)
+		return -ENOMEM;
+
+	histogram_caps->histogram_mode = DRM_MODE_HISTOGRAM_HSV_MAX_RGB;
+	histogram_caps->bins_count = HISTOGRAM_BIN_COUNT;
+
+	crtc->histogram = histogram;
+	histogram->crtc = crtc;
+	histogram->can_enable = false;
+	histogram->caps = histogram_caps;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
new file mode 100644
index 0000000000000000000000000000000000000000..5ea19ef2d3ecadf1ac159a784f51278fdde593de
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_HISTOGRAM_H__
+#define __INTEL_HISTOGRAM_H__
+
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+struct delayed_work;
+struct drm_property_blob;
+struct drm_histogram_config;
+struct drm_histogram_caps;
+struct intel_crtc;
+
+#define HISTOGRAM_BIN_COUNT                    32
+
+struct intel_histogram {
+	struct drm_histogram_caps *caps;
+	struct intel_crtc *crtc;
+	struct delayed_work work;
+	bool enable;
+	bool can_enable;
+	u32 bin_data[HISTOGRAM_BIN_COUNT];
+};
+
+enum intel_global_hist_status {
+	INTEL_HISTOGRAM_ENABLE,
+	INTEL_HISTOGRAM_DISABLE,
+};
+
+enum intel_global_histogram {
+	INTEL_HISTOGRAM,
+};
+
+enum intel_global_hist_lut {
+	INTEL_HISTOGRAM_PIXEL_FACTOR,
+};
+
+int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
+int intel_histogram_update(struct intel_crtc *intel_crtc,
+			   struct drm_histogram_config *config);
+int intel_histogram_init(struct intel_crtc *intel_crtc);
+void intel_histogram_finish(struct intel_crtc *intel_crtc);
+
+#endif /* __INTEL_HISTOGRAM_H__ */

-- 
2.25.1

