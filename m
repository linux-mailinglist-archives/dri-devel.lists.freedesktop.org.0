Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBBD225DE3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B766E392;
	Mon, 20 Jul 2020 11:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C116E392;
 Mon, 20 Jul 2020 11:54:27 +0000 (UTC)
IronPort-SDR: 955oDlJjz80c6zo7EhTCe0XcXx5fG97W1Q2uAMwoKvDnXdyjJ/Kyx41+C0y+mu0dBhZOofvdMz
 2tugz/DvxeXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149048194"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="149048194"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 04:54:27 -0700
IronPort-SDR: 4d21JuS+ZC3Hg46i29ERLeZR9AqNfOBmjUL02gk4TB3T11lMFvsy4BGYldJPrEyuQjdoagWUCi
 ZVJHiN2DzAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="431586712"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 04:54:23 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/5] drm/i915: Add enable/disable flip done and flip done
 handler
Date: Mon, 20 Jul 2020 17:01:13 +0530
Message-Id: <20200720113117.16131-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200720113117.16131-1-karthik.b.s@intel.com>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
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
    -Make the pending vblank event NULL in the beginning of
     flip_done_handler to remove sporadic WARN_ON that is seen.

v4: -Calculate timestamps using flip done time stamp and current
     timestamp for async flips (Ville)

v5: -Fix the sparse warning by making the function 'g4x_get_flip_counter'
     static.(Reported-by: kernel test robot <lkp@intel.com>)
    -Fix the typo in commit message.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++
 drivers/gpu/drm/i915/i915_irq.c              | 83 ++++++++++++++++++--
 drivers/gpu/drm/i915/i915_irq.h              |  2 +
 drivers/gpu/drm/i915/i915_reg.h              |  4 +-
 4 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index db2a5a1a9b35..b8ff032195d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -15562,6 +15562,13 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
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
 
@@ -15583,6 +15590,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->uapi.async_flip)
+			skl_disable_flip_done(&crtc->base);
+
 		if (new_crtc_state->hw.active &&
 		    !needs_modeset(new_crtc_state) &&
 		    !new_crtc_state->preload_luts &&
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 1fa67700d8f4..95953b393941 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -697,14 +697,24 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	return (((high1 << 8) | low) + (pixel >= vbl_start)) & 0xffffff;
 }
 
+static u32 g4x_get_flip_counter(struct drm_crtc *crtc)
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
 
@@ -2710,6 +2747,19 @@ int bdw_enable_vblank(struct drm_crtc *crtc)
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
@@ -2770,6 +2820,19 @@ void bdw_disable_vblank(struct drm_crtc *crtc)
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
@@ -2980,6 +3043,9 @@ void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
 	u32 extra_ier = GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN;
 	enum pipe pipe;
 
+	if (INTEL_GEN(dev_priv) >= 9)
+		extra_ier |= GEN9_PIPE_PLANE1_FLIP_DONE;
+
 	spin_lock_irq(&dev_priv->irq_lock);
 
 	if (!intel_irqs_enabled(dev_priv)) {
@@ -3458,6 +3524,9 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
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
index a0d31f3bf634..8cee06314d5d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11144,9 +11144,11 @@ enum skl_power_gate {
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
