Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69581C9A476
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B97910E54D;
	Tue,  2 Dec 2025 06:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JW0sqxdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630110E533;
 Tue,  2 Dec 2025 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656854; x=1796192854;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XCB8rZpKWID7aFi6/whvCO/sNB6Av2o87f54W3+jiwo=;
 b=JW0sqxdmXq7fV5VW/LuoAE9RdRJm184jnhNB9tSJylCcwW/OdzX+PTv7
 PPtgoL8maHonFri+fTe4DcSNoQUBxkPB5yNpYN4gnarq6o9oFdjjq1yi2
 Z7mlmtXiaqHLQNDMq1BDiZmy8qXsWDUSSiyuZsR6zZwE2cBTgY98zXqtp
 1+zbqxKlTBnfCpnT6a8NLsJdp41aOl91SGYbs2DhglBH8vaBdvtPnh+Nt
 OM3mHW75A9LaQmi6eJZwB10e7yJT6TykAc91B+kAyDHMd4C4c0+76tN8z
 ogbxPBp+SlH5BBcKi9qNSYGudoIXtf+CQekcafbOBG4CVKizdggNXLp+u g==;
X-CSE-ConnectionGUID: 9AKdpNo7QZmsb5jMdzogVg==
X-CSE-MsgGUID: RwdAlq/VS/OIpiR6yaYhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499908"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:34 -0800
X-CSE-ConnectionGUID: l+S2D7G1S4CKIv/3pKPYTw==
X-CSE-MsgGUID: Qp0JbRCyRierYONpTFYFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961306"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:28 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:03 +0530
Subject: [PATCH [RESEND] v9 09/20] drm/i915/histogram: Add support for
 histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-dpst-v9-9-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
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
 drivers/gpu/drm/i915/display/intel_histogram.c     | 159 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  46 ++++++
 4 files changed, 208 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 2ff8938b3a7cad7829ef31aa69e2d5d189498ae1..004e8fc092a3b9ba7dd907a228b835ceaf8f2ba5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -279,6 +279,7 @@ i915-y += \
 	display/intel_hdcp.o \
 	display/intel_hdcp_gsc.o \
 	display/intel_hdcp_gsc_message.o \
+	display/intel_histogram.o \
 	display/intel_hotplug.o \
 	display/intel_hotplug_irq.o \
 	display/intel_hti.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 38702a9e0f5084ef0b19e4a577ce07bfc7ce9926..b8a1be24cd0408dfa5377c9afe5309a9f1e743dd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1518,6 +1518,8 @@ struct intel_crtc {
 	/* for loading single buffered registers during vblank */
 	struct pm_qos_request vblank_pm_qos;
 
+	struct intel_histogram *histogram;
+
 #ifdef CONFIG_DEBUG_FS
 	struct intel_pipe_crc pipe_crc;
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
new file mode 100644
index 0000000000000000000000000000000000000000..0d14cd88d1869583a3ade8ded9284425ab217d3e
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
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
+	struct intel_display *display = to_intel_display(intel_crtc);
+
+	if (config->enable) {
+		if (config->hist_mode != DRM_MODE_HISTOGRAM_HSV_MAX_RGB) {
+			drm_err(display->drm,
+				"Only max(RGB) mode is supported for histogram\n");
+			return -EINVAL;
+		}
+		return intel_histogram_enable(intel_crtc, config->hist_mode);
+	}
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
index 0000000000000000000000000000000000000000..71ca706ebef9873c482f9714f614f6f6cc1eb2f0
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
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

