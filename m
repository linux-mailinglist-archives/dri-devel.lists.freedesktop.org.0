Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9DA20DF3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54410E6CB;
	Tue, 28 Jan 2025 16:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdedSRNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F028310E6A8;
 Tue, 28 Jan 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080375; x=1769616375;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Xi3rmepOT+QDZwxMSeAmTdLHFlvMnAaCS2P6jIqmz8k=;
 b=bdedSRNxWqV/fQzJ9yKrH62GYkimoAIwSEIMIQTVug5+iKm2a7CQI64F
 046XqIydbS1Ta6fVlSl9UtWfTE8L+rvDNGmg5lqNMI16CvtVLAtaOcODU
 +5EuHo5PbGTQaeJYil5dhJWUNXDMck4z43/5S1H05GrlIRIlHQaz2+wZf
 PQafyH9eeFTssLyEkiEXY4BUg9aSG6h4+cfTEBk4GO+Z4Mp5CN1HHM/aZ
 WCyZYQ4shj9LGTn+nPSFacNE5YHFVHjRBaolBSGFJymkEOi4zs4d2tcXd
 w3TSNikT98koWZ3kJNT1YmE9ImCqvQkMsec3r59qisikox7AWRYlj/GD3 w==;
X-CSE-ConnectionGUID: +E7mc2bVSvmDUQ/quJ7ncQ==
X-CSE-MsgGUID: 7HO9At6NR5ClPEX0g4dG3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745042"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:15 -0800
X-CSE-ConnectionGUID: UgvRGSJQQCmvix7dc4y3HQ==
X-CSE-MsgGUID: lVX6R9AbRmOASVb9GFnhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976976"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:12 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:14 +0530
Subject: [PATCH v8 08/14] drm/i915/histogram: histogram interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-8-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
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

Upon enabling histogram an interrupt is trigerred after the generation
of the statistics. This patch registers the histogram interrupt and
handles the interrupt.

v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
    Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
v3: Replaced drm_i915_private with intel_display (Suraj)
    Refactored the histogram read code (Jani)
v4: Rebased after addressing comments on patch 1
v5: removed the retry logic and moved to patch7 (Jani)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c |   6 +-
 drivers/gpu/drm/i915/display/intel_histogram.c   | 106 ++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_histogram.h   |   3 +
 drivers/gpu/drm/i915/i915_reg.h                  |   5 +-
 4 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index d9734fcd0d45b9f7c2891730e73b7e1d59c206ad..b62c3cdfd6a0607d9d2e1caa0d71edb0aa99fdbb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -21,6 +21,7 @@
 #include "intel_fdi_regs.h"
 #include "intel_fifo_underrun.h"
 #include "intel_gmbus.h"
+#include "intel_histogram.h"
 #include "intel_hotplug_irq.h"
 #include "intel_pipe_crc_regs.h"
 #include "intel_pmdemand.h"
@@ -1230,6 +1231,9 @@ void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
 			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
 
+		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
+			intel_histogram_irq_handler(display, pipe);
+
 		fault_errors = iir & gen8_de_pipe_fault_mask(dev_priv);
 		if (fault_errors)
 			drm_err_ratelimited(&dev_priv->drm,
@@ -1827,7 +1831,7 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_display *display = &dev_priv->display;
 
 	u32 de_pipe_masked = gen8_de_pipe_fault_mask(dev_priv) |
-		GEN8_PIPE_CDCLK_CRC_DONE;
+		GEN8_PIPE_CDCLK_CRC_DONE | GEN9_PIPE_HISTOGRAM_EVENT;
 	u32 de_pipe_enables;
 	u32 de_port_masked = gen8_de_port_aux_mask(dev_priv);
 	u32 de_port_enables;
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 26eae8f40d0bf642546d583546782e22d5cefa9c..4f3dcbabfe96e955a65874718272c4beb53b0827 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -19,7 +19,104 @@
 #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300
 /* Precision factor for threshold guardband */
 #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
-#define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
+#define HISTOGRAM_BIN_READ_RETRY_COUNT 5
+
+static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
+{
+	struct intel_display *display = to_intel_display(intel_crtc);
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	int index;
+	u32 dpstbin;
+
+	for (index = 0; index < ARRAY_SIZE(histogram->bin_data); index++) {
+		dpstbin = intel_de_read(display, DPST_BIN(intel_crtc->pipe));
+		if (!(dpstbin & DPST_BIN_BUSY)) {
+			histogram->bin_data[index] = dpstbin & DPST_BIN_DATA_MASK;
+		} else
+			return false;
+	}
+	return true;
+}
+
+static void intel_histogram_handle_int_work(struct work_struct *work)
+{
+	struct intel_histogram *histogram = container_of(work,
+		struct intel_histogram, work.work);
+	struct intel_crtc *intel_crtc = histogram->crtc;
+	struct intel_display *display = to_intel_display(intel_crtc);
+	char event[] = "HISTOGRAM=1", pipe_id[21];
+	char *histogram_event[] = { event, pipe_id, NULL };
+	int retry;
+
+	snprintf(pipe_id, sizeof(pipe_id),
+		 "PIPE=%u", intel_crtc->base.base.id);
+
+	/*
+	 * TODO: PSR to be exited while reading the Histogram data
+	 * Set DPST_CTL Bin Reg function select to TC
+	 * Set DPST_CTL Bin Register Index to 0
+	 */
+	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
+		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
+	for (retry = 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++) {
+		if (intel_histogram_get_data(intel_crtc)) {
+			u32 *data;
+			struct drm_histogram *hist;
+
+			data = kzalloc(sizeof(data) * sizeof(histogram->bin_data), GFP_KERNEL);
+			if (!data)
+				return;
+			memcpy(histogram->bin_data, data, sizeof(histogram->bin_data));
+			hist = kzalloc(sizeof(struct drm_histogram), GFP_KERNEL);
+			if (!hist)
+				return;
+			hist->data_ptr = *data;
+			hist->nr_elements = sizeof(histogram->bin_data);
+
+			/* TODO: fill the drm_histogram_config data back this drm_histogram struct */
+			drm_property_replace_global_blob(display->drm,
+				&intel_crtc->base.state->histogram_data,
+				sizeof(struct drm_histogram),
+				hist, &intel_crtc->base.base,
+				intel_crtc->base.histogram_data_property);
+			/* Notify user for Histogram readiness */
+			if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
+					       KOBJ_CHANGE, histogram_event))
+				drm_err(display->drm,
+					"Sending HISTOGRAM event failed\n");
+			break;
+		}
+	}
+	if (retry >= HISTOGRAM_BIN_READ_RETRY_COUNT) {
+		drm_err(display->drm, "Histogram bin read failed with max retry\n");
+		return;
+	}
+
+	/* Enable histogram interrupt */
+	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe), DPST_GUARD_HIST_INT_EN,
+		     DPST_GUARD_HIST_INT_EN);
+
+	/* Clear histogram interrupt by setting histogram interrupt status bit*/
+	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
+		     DPST_GUARD_HIST_EVENT_STATUS, 1);
+}
+
+void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe)
+{
+	struct intel_crtc *intel_crtc =
+		to_intel_crtc(drm_crtc_from_index(display->drm, pipe));
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	struct drm_i915_private *i915 = to_i915(intel_crtc->base.dev);
+
+	if (!histogram->enable) {
+		drm_err(display->drm,
+			"Spurious interrupt, histogram not enabled\n");
+		return;
+	}
+
+	queue_delayed_work(i915->unordered_wq,
+			   &histogram->work, 0);
+}
 
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)
 {
@@ -71,7 +168,7 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
 		     DPST_GUARD_THRESHOLD_GB_MASK |
 		     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
 		     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
-		     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
+		     DPST_GUARD_INTERRUPT_DELAY(0x04) |
 		     DPST_GUARD_HIST_INT_EN);
 
 	/* Clear pending interrupts has to be done on separate write */
@@ -104,6 +201,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
 	intel_de_rmw(display, DPST_CTL(pipe),
 		     DPST_CTL_IE_HIST_EN, 0);
 
+	cancel_delayed_work(&histogram->work);
 	histogram->enable = false;
 }
 
@@ -129,6 +227,7 @@ void intel_histogram_finish(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
 
+	cancel_delayed_work_sync(&histogram->work);
 	kfree(histogram);
 }
 
@@ -153,5 +252,8 @@ int intel_histogram_init(struct intel_crtc *crtc)
 	histogram->can_enable = false;
 	histogram->caps = histogram_caps;
 
+	INIT_DEFERRABLE_WORK(&histogram->work,
+			     intel_histogram_handle_int_work);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
index 5ea19ef2d3ecadf1ac159a784f51278fdde593de..b44ba3afc94f79f291f4e5ebdd04dcf9434b48a4 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -14,6 +14,8 @@ struct drm_property_blob;
 struct drm_histogram_config;
 struct drm_histogram_caps;
 struct intel_crtc;
+struct intel_display;
+enum pipe;
 
 #define HISTOGRAM_BIN_COUNT                    32
 
@@ -39,6 +41,7 @@ enum intel_global_hist_lut {
 	INTEL_HISTOGRAM_PIXEL_FACTOR,
 };
 
+void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe);
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
 int intel_histogram_update(struct intel_crtc *intel_crtc,
 			   struct drm_histogram_config *config);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index b9e2aa1c6f8afefade761b8d291bb62efb96e53c..fc451783c9c23bfdd74a2dfc78be40c9d576fb56 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1599,7 +1599,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
 #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
 #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
-#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
+#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
 #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
 #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
 #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
@@ -1622,7 +1622,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
 #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
 #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
-#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
+#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
 #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
 #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
 #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
@@ -2224,6 +2224,7 @@
 #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
 #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
 #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
+#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
 #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
 #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
 #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */

-- 
2.25.1

