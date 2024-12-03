Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792029E1318
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 07:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9636210E901;
	Tue,  3 Dec 2024 06:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx/8ssUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6310E900;
 Tue,  3 Dec 2024 06:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733205911; x=1764741911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXXJYOwvQe5o7eLVc0IXA55Pir5mQcXmbozOsUTu8Gc=;
 b=bx/8ssUUCbLZWbGY5i7HmXJ5qhUlMKE9aMv/c1JymqABrDclQe6V3bWH
 DqlwJIOxD11E9KhBGkXy35n7mtLBc2jFHj9FQJmO5ITzSHC79iXaZQzuf
 /Xkk2tFTaYciyPqHiQkGn2vrSBNlLD27c0IV4CKTr3Aa/0SDgzbB8jHGM
 aR8mVPc/iq9xJfzNKecgrsBE8tPtjoYM129nA7qcTgX/1OG1+dOeFUxz+
 cgD4xE9ASLBl1U5YVj4a7ruoQjA7X4GpGgXhFK6OL86u/Bxuj5KmlfiMt
 spvS09eTovwz726nXFdTpdxT8z2q+KEAUKZlXzkK4Ion4DTpBAT8rJXdr g==;
X-CSE-ConnectionGUID: K2ZvPaQuS76nfzr6N+wscg==
X-CSE-MsgGUID: IHkrL6EeQH6gWhyq6Vn9vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37058853"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37058853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:05:11 -0800
X-CSE-ConnectionGUID: XX3wdb3kSU6cOTMAH96xVQ==
X-CSE-MsgGUID: pFdheyBpQp+MNSq4TTgH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="124163848"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 22:05:09 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCHv5 04/10] drm/i915/histogram: Add support for histogram
Date: Tue,  3 Dec 2024 11:25:14 +0530
Message-Id: <20241203055520.1704661-5-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203055520.1704661-1-arun.r.murthy@intel.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Statistics is generated from the image frame that is coming to display
and an event is sent to user after reading this histogram data.
This statistics/histogram is then shared with the user upon getting a
request from user. User can then use this histogram and generate an
enhancement factor. This enhancement factor can be multiplied/added with
the incoming pixel data frame.

v2: forward declaration in header file along with error handling (Jani)
v3: Replaced i915 with intel_display (Suraj)
v4: Removed dithering enable/disable (Vandita)
    New patch for histogram register definitions (Suraj)
v5: IET LUT pgm follow the seq in spec and removed change to TC at end
    (Suraj)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../gpu/drm/i915/display/intel_histogram.c    | 202 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  37 ++++
 4 files changed, 242 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index e465828d748f..97141b4def3b 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -267,6 +267,7 @@ i915-y += \
 	display/intel_hdcp.o \
 	display/intel_hdcp_gsc.o \
 	display/intel_hdcp_gsc_message.o \
+	display/intel_histogram.o \
 	display/intel_hotplug.o \
 	display/intel_hotplug_irq.o \
 	display/intel_hti.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 339e4b0f7698..351441efd10a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1414,6 +1414,8 @@ struct intel_crtc {
 	/* for loading single buffered registers during vblank */
 	struct pm_qos_request vblank_pm_qos;
 
+	struct intel_histogram *histogram;
+
 #ifdef CONFIG_DEBUG_FS
 	struct intel_pipe_crc pipe_crc;
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
new file mode 100644
index 000000000000..e9a431800553
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
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
+struct intel_histogram {
+	struct intel_crtc *crtc;
+	struct delayed_work work;
+	bool enable;
+	bool can_enable;
+	u32 bin_data[HISTOGRAM_BIN_COUNT];
+};
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
+static int intel_histogram_enable(struct intel_crtc *intel_crtc)
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
+		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
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
+int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)
+{
+	if (enable)
+		return intel_histogram_enable(intel_crtc);
+
+	intel_histogram_disable(intel_crtc);
+	return 0;
+}
+
+int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
+				struct drm_property_blob *blob)
+{
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	struct intel_display *display = to_intel_display(intel_crtc);
+	int pipe = intel_crtc->pipe;
+	int i = 0;
+	struct drm_histogram *hist;
+	u32 *data;
+	int ret;
+
+	if (!histogram)
+		return -EINVAL;
+
+	if (!histogram->enable) {
+		drm_err(display->drm, "histogram not enabled");
+		return -EINVAL;
+	}
+
+	if (!data) {
+		drm_err(display->drm, "enhancement LUT data is NULL");
+		return -EINVAL;
+	}
+
+	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_IE);
+
+	drm_crtc_wait_one_vblank(&intel_crtc->base);
+
+	 /* Set DPST_CTL Bin Register Index to 0 */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
+
+	hist = (struct drm_histogram *)blob->data;
+	data = kzalloc(sizeof(data) * hist->nr_elements, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	ret = copy_from_user(data, (uint32_t __user *)(unsigned long)hist->data_ptr,
+			     sizeof(uint32_t) * hist->nr_elements);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+		intel_de_rmw(display, DPST_BIN(pipe),
+			     DPST_BIN_DATA_MASK, data[i]);
+		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
+	}
+	kfree(data);
+	drm_property_blob_put(intel_crtc->base.state->histogram_iet);
+
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
+int intel_histogram_init(struct intel_crtc *intel_crtc)
+{
+	struct intel_histogram *histogram;
+
+	/* Allocate histogram internal struct */
+	histogram = kzalloc(sizeof(*histogram), GFP_KERNEL);
+	if (!histogram) {
+		return -ENOMEM;
+	}
+
+	intel_crtc->histogram = histogram;
+	histogram->crtc = intel_crtc;
+	histogram->can_enable = false;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
new file mode 100644
index 000000000000..fb01ffe8903f
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_HISTOGRAM_H__
+#define __INTEL_HISTOGRAM_H__
+
+#include <linux/types.h>
+
+struct drm_property_blob;
+struct intel_crtc;
+
+#define HISTOGRAM_BIN_COUNT                    32
+#define HISTOGRAM_IET_LENGTH                   33
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
+int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable);
+int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
+				struct drm_property_blob *blob);
+int intel_histogram_init(struct intel_crtc *intel_crtc);
+void intel_histogram_finish(struct intel_crtc *intel_crtc);
+
+#endif /* __INTEL_HISTOGRAM_H__ */
-- 
2.25.1

