Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FE21E559
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BB6E870;
	Tue, 14 Jul 2020 01:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D116E86F;
 Tue, 14 Jul 2020 01:50:48 +0000 (UTC)
IronPort-SDR: EhFCygawjTxnbSmujQ8c04vIJaqiYn3bcZtrBBJ1UEbEOEl0usc6zYOlyQBv0gsamlfo9JwMPg
 vrrl8ci+7Axg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="136245058"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="136245058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 18:50:48 -0700
IronPort-SDR: UW+6cfd7MEyykSdkF9xRZgoLPbLPSedNMmJDIjzy106MTJAEa9QfmU3Uaq2rvJuZpv87eVn7jH
 36+YqkUF+IKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="307680190"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2020 18:50:45 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/5] drm/i915: Add enable/disable flip done and flip done
 handler
Date: Tue, 14 Jul 2020 06:57:21 +0530
Message-Id: <20200714012725.18383-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200714012725.18383-1-karthik.b.s@intel.com>
References: <20200714012725.18383-1-karthik.b.s@intel.com>
MIME-Version: 1.0
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
Cc: paulo.r.zanoni@intel.com, Karthik B S <karthik.b.s@intel.com>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add enable/disable flip done functions and the flip done handler
function which handles the flip done interrupt.

Enable the flip done interrupt in IER.

Enable flip done function is called before writing the
surface address register as the write to this register triggers
the flip done interrupt

Flip done handler is used to send the page flip event as soon as the
surface address is written as per the requirement of async flips.
The interrupt is disabled after the event is sent.

v2: -Change function name from icl_* to skl_* (Paulo)
    -Move flip handler to this patch (Paulo)
    -Remove vblank_put() (Paulo)
    -Enable flip done interrupt for gen9+ only (Paulo)
    -Enable flip done interrupt in power_well_post_enable hook (Paulo)
    -Removed the event check in flip done handler to handle async
     flips without pageflip events.

v3: -Move skl_disable_flip_done out of interrupt handler (Paulo)
    -Make the pending vblank event NULL in the begining of
     flip_done_handler to remove sporadic WARN_ON that is seen.

v4: -Calculate timestamps using flip done time stamp and current
     timestamp for async flips (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++
 drivers/gpu/drm/i915/i915_irq.c              | 83 ++++++++++++++++++--
 drivers/gpu/drm/i915/i915_irq.h              |  2 +
 drivers/gpu/drm/i915/i915_reg.h              |  4 +-
 4 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 729ec6e0d43a..d2c04770dd6a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -15552,6 +15552,13 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_dbuf_pre_plane_update(state);
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip) {
+			skl_enable_flip_done(&crtc->base);
+			break;
+		}
+	}
+
 	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
 	dev_priv->display.commit_modeset_enables(state);
 
@@ -15573,6 +15580,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip)
+			skl_disable_flip_done(&crtc->base);
+
 		if (new_crtc_state->hw.active &&
 		    !needs_modeset(new_crtc_state) &&
 		    !new_crtc_state->preload_luts &&
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 562b43ed077f..9812a8051c5e 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -697,14 +697,24 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	return (((high1 << 8) | low) + (pixel >= vbl_start)) & 0xffffff;
 }
 
+u32 g4x_get_flip_counter(struct drm_crtc *crtc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	enum pipe pipe = to_intel_crtc(crtc)->pipe;
+
+	return I915_READ(PIPE_FLIPCOUNT_G4X(pipe));
+}
+
 u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 
+	if (crtc->state->async_flip)
+		return g4x_get_flip_counter(crtc);
+
 	return I915_READ(PIPE_FRMCOUNT_G4X(pipe));
 }
-
 /*
  * On certain encoders on certain platforms, pipe
  * scanline register will not work to get the scanline,
@@ -737,17 +747,24 @@ static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
 		 * pipe frame time stamp. The time stamp value
 		 * is sampled at every start of vertical blank.
 		 */
-		scan_prev_time = intel_de_read_fw(dev_priv,
-						  PIPE_FRMTMSTMP(crtc->pipe));
-
+		if (!crtc->config->uapi.async_flip)
+			scan_prev_time = intel_de_read_fw(dev_priv,
+							  PIPE_FRMTMSTMP(crtc->pipe));
+		else
+			scan_prev_time = intel_de_read_fw(dev_priv,
+							  PIPE_FLIPTMSTMP(crtc->pipe));
 		/*
 		 * The TIMESTAMP_CTR register has the current
 		 * time stamp value.
 		 */
 		scan_curr_time = intel_de_read_fw(dev_priv, IVB_TIMESTAMP_CTR);
 
-		scan_post_time = intel_de_read_fw(dev_priv,
-						  PIPE_FRMTMSTMP(crtc->pipe));
+		if (!crtc->config->uapi.async_flip)
+			scan_post_time = intel_de_read_fw(dev_priv,
+							  PIPE_FRMTMSTMP(crtc->pipe));
+		else
+			scan_post_time = intel_de_read_fw(dev_priv,
+							  PIPE_FLIPTMSTMP(crtc->pipe));
 	} while (scan_post_time != scan_prev_time);
 
 	scanline = div_u64(mul_u32_u32(scan_curr_time - scan_prev_time,
@@ -937,7 +954,6 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 		*vpos = position / htotal;
 		*hpos = position - (*vpos * htotal);
 	}
-
 	return true;
 }
 
@@ -1295,6 +1311,24 @@ display_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 			     u32 crc4) {}
 #endif
 
+static void flip_done_handler(struct drm_i915_private *dev_priv,
+			      unsigned int pipe)
+{
+	struct intel_crtc *crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
+	struct drm_crtc_state *crtc_state = crtc->base.state;
+	struct drm_pending_vblank_event *e = crtc_state->event;
+	struct drm_device *dev = &dev_priv->drm;
+	unsigned long irqflags;
+
+	crtc_state->event = NULL;
+
+	drm_crtc_accurate_vblank_count(&crtc->base);
+	spin_lock_irqsave(&dev->event_lock, irqflags);
+
+	drm_crtc_send_vblank_event(&crtc->base, e);
+
+	spin_unlock_irqrestore(&dev->event_lock, irqflags);
+}
 
 static void hsw_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
 				     enum pipe pipe)
@@ -2389,6 +2423,9 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 		if (iir & GEN8_PIPE_VBLANK)
 			intel_handle_vblank(dev_priv, pipe);
 
+		if (iir & GEN9_PIPE_PLANE1_FLIP_DONE)
+			flip_done_handler(dev_priv, pipe);
+
 		if (iir & GEN8_PIPE_CDCLK_CRC_DONE)
 			hsw_pipe_crc_irq_handler(dev_priv, pipe);
 
@@ -2670,6 +2707,19 @@ int bdw_enable_vblank(struct drm_crtc *crtc)
 	return 0;
 }
 
+void skl_enable_flip_done(struct drm_crtc *crtc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	enum pipe pipe = to_intel_crtc(crtc)->pipe;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
+
+	bdw_enable_pipe_irq(dev_priv, pipe, GEN9_PIPE_PLANE1_FLIP_DONE);
+
+	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
+}
+
 /* Called from drm generic code, passed 'crtc' which
  * we use as a pipe index
  */
@@ -2730,6 +2780,19 @@ void bdw_disable_vblank(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
 }
 
+void skl_disable_flip_done(struct drm_crtc *crtc)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	enum pipe pipe = to_intel_crtc(crtc)->pipe;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
+
+	bdw_disable_pipe_irq(dev_priv, pipe, GEN9_PIPE_PLANE1_FLIP_DONE);
+
+	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
+}
+
 static void ibx_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
@@ -2937,6 +3000,9 @@ void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
 	u32 extra_ier = GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN;
 	enum pipe pipe;
 
+	if (INTEL_GEN(dev_priv) >= 9)
+		extra_ier |= GEN9_PIPE_PLANE1_FLIP_DONE;
+
 	spin_lock_irq(&dev_priv->irq_lock);
 
 	if (!intel_irqs_enabled(dev_priv)) {
@@ -3414,6 +3480,9 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	de_pipe_enables = de_pipe_masked | GEN8_PIPE_VBLANK |
 					   GEN8_PIPE_FIFO_UNDERRUN;
 
+	if (INTEL_GEN(dev_priv) >= 9)
+		de_pipe_enables |= GEN9_PIPE_PLANE1_FLIP_DONE;
+
 	de_port_enables = de_port_masked;
 	if (IS_GEN9_LP(dev_priv))
 		de_port_enables |= BXT_DE_PORT_HOTPLUG_MASK;
diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
index 25f25cd95818..2f10c8135116 100644
--- a/drivers/gpu/drm/i915/i915_irq.h
+++ b/drivers/gpu/drm/i915/i915_irq.h
@@ -112,11 +112,13 @@ int i915gm_enable_vblank(struct drm_crtc *crtc);
 int i965_enable_vblank(struct drm_crtc *crtc);
 int ilk_enable_vblank(struct drm_crtc *crtc);
 int bdw_enable_vblank(struct drm_crtc *crtc);
+void skl_enable_flip_done(struct drm_crtc *crtc);
 void i8xx_disable_vblank(struct drm_crtc *crtc);
 void i915gm_disable_vblank(struct drm_crtc *crtc);
 void i965_disable_vblank(struct drm_crtc *crtc);
 void ilk_disable_vblank(struct drm_crtc *crtc);
 void bdw_disable_vblank(struct drm_crtc *crtc);
+void skl_disable_flip_done(struct drm_crtc *crtc);
 
 void gen2_irq_reset(struct intel_uncore *uncore);
 void gen3_irq_reset(struct intel_uncore *uncore, i915_reg_t imr,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 86a23ced051b..3c4480172e84 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11113,9 +11113,11 @@ enum skl_power_gate {
 #define  GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
 
 #define _PIPE_FRMTMSTMP_A		0x70048
+#define _PIPE_FLIPTMSTMP_A		0x7004C
 #define PIPE_FRMTMSTMP(pipe)		\
 			_MMIO_PIPE2(pipe, _PIPE_FRMTMSTMP_A)
-
+#define PIPE_FLIPTMSTMP(pipe)		\
+			_MMIO_PIPE2(pipe, _PIPE_FLIPTMSTMP_A)
 /* BXT MIPI clock controls */
 #define BXT_MAX_VAR_OUTPUT_KHZ			39500
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
