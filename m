Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC049D4CE8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3310E919;
	Thu, 21 Nov 2024 12:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOpKl3JC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4210E918;
 Thu, 21 Nov 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192549; x=1763728549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lm3Hse0/ffi2m0dXORfOB6ifKUeWQv069ePI/Q6zRnU=;
 b=gOpKl3JCYrpoVnC7PvbD1JWdtugKTDWYmGlAoWb1i7gAiDa1dOayGm1m
 8gvsPRfVo4li/9HTorey6BG9qkyF33YP+UDYHGQaZiPvfdWbkykIGfjcj
 B8EQeRBFm28Eu7qU/lRUZtFz/Ng7xsP3Z84gz9JC8NImUtH0DTYmpKhqX
 QwmKeEk2h49YzlFda4MH0Zp4gJaje5iQ0cb58fqqraqmpePrmUqTlPJtF
 YMefg8EOhpFEo3WZvJ7y8olZ+bBEEdVoIVthQuN3tWS/2nqAmz054ZZX8
 c6nCQAF4ZG90vf1vp/O+f3q44kLyl6td5BWlD2F/gd+NDw8/4h4UZwGr9 Q==;
X-CSE-ConnectionGUID: esEBSCUUS9O+C+eyX9WEVA==
X-CSE-MsgGUID: uAurL2AIQU+IdZ19qCm/Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32230328"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32230328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:35:49 -0800
X-CSE-ConnectionGUID: FP6Ldq7hRxmjL0vVwsJmuQ==
X-CSE-MsgGUID: NMJ/HhtlQEydLPDOhbzpQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127765992"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 21 Nov 2024 04:35:47 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv5 4/8] drm/i915/histogram: histogram interrupt handling
Date: Thu, 21 Nov 2024 17:55:59 +0530
Message-Id: <20241121122603.736267-5-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121122603.736267-1-arun.r.murthy@intel.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
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
 .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
 .../gpu/drm/i915/display/intel_histogram.c    | 87 ++++++++++++++++++-
 .../gpu/drm/i915/display/intel_histogram.h    |  3 +
 drivers/gpu/drm/i915/i915_reg.h               |  5 +-
 4 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index f0d3bdb5fc60..cb60c9db4418 100644
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
@@ -1179,6 +1180,9 @@ void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
 			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
 
+		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
+			intel_histogram_irq_handler(display, pipe);
+
 		fault_errors = iir & gen8_de_pipe_fault_mask(dev_priv);
 		if (fault_errors)
 			drm_err_ratelimited(&dev_priv->drm,
@@ -1764,7 +1768,7 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
 	u32 de_pipe_masked = gen8_de_pipe_fault_mask(dev_priv) |
-		GEN8_PIPE_CDCLK_CRC_DONE;
+		GEN8_PIPE_CDCLK_CRC_DONE | GEN9_PIPE_HISTOGRAM_EVENT;
 	u32 de_pipe_enables;
 	u32 de_port_masked = gen8_de_port_aux_mask(dev_priv);
 	u32 de_port_enables;
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index b2dda88a8093..243469c8ea80 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -19,7 +19,7 @@
 #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300
 /* Precision factor for threshold guardband */
 #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
-#define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
+#define HISTOGRAM_BIN_READ_RETRY_COUNT 5
 
 struct intel_histogram {
 	struct intel_crtc *crtc;
@@ -29,6 +29,84 @@ struct intel_histogram {
 	u32 bin_data[HISTOGRAM_BIN_COUNT];
 };
 
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
+			/* Notify user for Histogram rediness */
+			if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
+					       KOBJ_CHANGE, histogram_event))
+				drm_err(display->drm,
+					"sending HISTOGRAM event failed\n");
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
+			"spurious interrupt, histogram not enabled\n");
+		return;
+	}
+
+	queue_delayed_work(i915->unordered_wq,
+			   &histogram->work, 0);
+}
+
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
@@ -81,7 +159,7 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
 		     DPST_GUARD_THRESHOLD_GB_MASK |
 		     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
 		     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
-		     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
+		     DPST_GUARD_INTERRUPT_DELAY(0x04) |
 		     DPST_GUARD_HIST_INT_EN);
 
 	/* Clear pending interrupts has to be done on separate write */
@@ -114,6 +192,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
 	intel_de_rmw(display, DPST_CTL(pipe),
 		     DPST_CTL_IE_HIST_EN, 0);
 
+	cancel_delayed_work(&histogram->work);
 	histogram->enable = false;
 }
 
@@ -169,6 +248,7 @@ void intel_histogram_finish(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
 
+	cancel_delayed_work_sync(&histogram->work);
 	kfree(histogram);
 }
 
@@ -186,5 +266,8 @@ int intel_histogram_init(struct intel_crtc *intel_crtc)
 	histogram->crtc = intel_crtc;
 	histogram->can_enable = false;
 
+	INIT_DEFERRABLE_WORK(&histogram->work,
+			     intel_histogram_handle_int_work);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
index 9d66724f9c53..14f2425e3038 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 
 struct intel_crtc;
+struct intel_display;
+enum pipe;
 
 #define HISTOGRAM_BIN_COUNT                    32
 #define HISTOGRAM_IET_LENGTH                   33
@@ -27,6 +29,7 @@ enum intel_global_hist_lut {
 };
 
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
+void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe);
 int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable);
 int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data);
 int intel_histogram_init(struct intel_crtc *intel_crtc);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 7a35be56b7ef..40a7c6a77bcc 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1605,7 +1605,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
 #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
 #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
-#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
+#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
 #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
 #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
 #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
@@ -1628,7 +1628,7 @@
 #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
 #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
 #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
-#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
+#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
 #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
 #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
 #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
@@ -2470,6 +2470,7 @@
 #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
 #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
 #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
+#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
 #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
 #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
 #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */
-- 
2.25.1

