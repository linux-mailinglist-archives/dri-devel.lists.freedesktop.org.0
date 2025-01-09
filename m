Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F8A0810A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5710EFCE;
	Thu,  9 Jan 2025 20:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2KEsDk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1450210EFC2;
 Thu,  9 Jan 2025 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452884; x=1767988884;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Xrk5ZzReXM9KvxLdeEv/Ygn0EgLuWqATgdk2szSzDoI=;
 b=m2KEsDk2vcYQf75kNx4Zjd8O04rhA/0i0aQL1ZxHfRDcGLTIgEmSnwIl
 InbLN0zsGf8fnzGp5Sfni/dV8yyGjiyuFcsu8PW2cSTgojpy/l+AjiCmd
 JFsf55FxLnbdV8/hPyo4DdcEEH6WCeOPZo14l5PMmYvYkFVbUpDSlEO4C
 6VnJHSncfeiMtMzx7+1nbc013a0JbmLNvdfGXGFLjwPBkKEYERlEvaghb
 4jyeMbZ7AVAqWT28id35aZNkw+1tA3eyjoB62DKb3RaUpc/kttsVnU7UF
 IA0qEv6OveuzEK2DF6IrltlpijUOtyb1IH89dH5Y7XcakxnMWn5IRIKcE A==;
X-CSE-ConnectionGUID: JjHnmPBRQASwQ/eKtAadIg==
X-CSE-MsgGUID: pcp61vdBQ9O58RFeUYkrYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619245"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619245"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:15 -0800
X-CSE-ConnectionGUID: QTU9AK/KROe4yI00+gQQCQ==
X-CSE-MsgGUID: q0rbV2+CQUqlmzlNK0zHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798651"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:11 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:36 +0530
Subject: [PATCH v7 08/14] drm/i915/histogram: histogram interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-8-605cb0271162@intel.com>
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
index 069043f9d89450750f183d118e7a546fa5334e8e..ee3166d4c6561f1a9396979fbc5c95d53158ce8a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -20,6 +20,7 @@
 #include "intel_fdi_regs.h"
 #include "intel_fifo_underrun.h"
 #include "intel_gmbus.h"
+#include "intel_histogram.h"
 #include "intel_hotplug_irq.h"
 #include "intel_pipe_crc_regs.h"
 #include "intel_pmdemand.h"
@@ -1180,6 +1181,9 @@ void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
 			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
 
+		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
+			intel_histogram_irq_handler(display, pipe);
+
 		fault_errors = iir & gen8_de_pipe_fault_mask(dev_priv);
 		if (fault_errors)
 			drm_err_ratelimited(&dev_priv->drm,
@@ -1773,7 +1777,7 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
 	u32 de_pipe_masked = gen8_de_pipe_fault_mask(dev_priv) |
-		GEN8_PIPE_CDCLK_CRC_DONE;
+		GEN8_PIPE_CDCLK_CRC_DONE | GEN9_PIPE_HISTOGRAM_EVENT;
 	u32 de_pipe_enables;
 	u32 de_port_masked = gen8_de_port_aux_mask(dev_priv);
 	u32 de_port_enables;
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 9861252cf3cc9ac5dd68084a6378db36f4cf29ac..ea61a98efb18fcccce88a8a3b82fd373c47920df 100644
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
 
@@ -121,6 +219,7 @@ void intel_histogram_finish(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
 
+	cancel_delayed_work_sync(&histogram->work);
 	kfree(histogram);
 }
 
@@ -145,5 +244,8 @@ int intel_histogram_init(struct intel_crtc *crtc)
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
index 765e6c0528fb0b5a894395b77a5edbf0b0c80009..297537dcbd704448d7b242070cac67ad9fd48a5f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1598,7 +1598,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
 #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
 #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
-#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
+#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
 #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
 #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
 #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
@@ -1621,7 +1621,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
 #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
 #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
-#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
+#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
 #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
 #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
 #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
@@ -2223,6 +2223,7 @@
 #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
 #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
 #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
+#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
 #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
 #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
 #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */

-- 
2.25.1

