Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0AB117C1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CA210E9C4;
	Fri, 25 Jul 2025 05:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQEO7XpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3561E10E9BE;
 Fri, 25 Jul 2025 05:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419911; x=1784955911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izipnzNZrXTfjLxxXpGWor7eBdm7HVdVYgCo+hj4y+M=;
 b=gQEO7XpUZw2DlqKqMva8LcqoHCD0pW21aSuFDzx0tmY5MRJxCV5MHQGW
 ZrcW0tFWMOw6tNiroQ4owHt8EnMH1sTyCMjCGVizpW7pNvQ/rCQY0mq8h
 L+05zQPd4ru+wJH0WVXfwVDEf1fk8E6XCGzViJTLL8ju93obw6s83/q/h
 cpraaLPNMQ+WCo3WKBE7W+ZD92gtcZjNjXNO0eqfUl0LyBTZ7pAqNxiPy
 4n+rBX4fXfDdBgxnrxs1raow5DUHGx9ehSCcUnyaOxpxPQdgvRrcOZXh9
 yEPI9oX3JN4jyVcDlwRDU3XQoqY4iXqydLIZrVpW4Bcmrzg78SQIzXTPC Q==;
X-CSE-ConnectionGUID: eNVzMsKSSOu1tP/K4Nkkpg==
X-CSE-MsgGUID: GDjqSikxSGWDn7j0eXm4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299566"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:11 -0700
X-CSE-ConnectionGUID: YmpVTztXQ1G9l2hdmZ0cHQ==
X-CSE-MsgGUID: l9I7c2TPSYONue/gZ4UbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956784"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 24/28] drm/i915/writeback: Enable writeback interrupts
Date: Fri, 25 Jul 2025 10:34:05 +0530
Message-Id: <20250725050409.2687242-25-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Enable writeback interrupts while enabling writeback
and define the isr handler and schedule work for later
to signal completion job.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 10 ++++
 .../gpu/drm/i915/display/intel_display_regs.h |  1 +
 .../gpu/drm/i915/display/intel_writeback.c    | 51 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_writeback.h    |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index fb25ec8adae3..0874afe839b2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -31,6 +31,8 @@
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 #include "intel_uncore.h"
+#include "intel_writeback.h"
+#include "intel_writeback_reg.h"
 
 static void
 intel_display_irq_regs_init(struct intel_display *display, struct i915_irq_regs regs,
@@ -1215,6 +1217,11 @@ gen8_de_misc_irq_handler(struct intel_display *display, u32 iir)
 		found = true;
 	}
 
+	if (iir & (GEN8_DE_MISC_WD0)) {
+		intel_writeback_isr_handler(display);
+		found = true;
+	}
+
 	if (iir & GEN8_DE_EDP_PSR) {
 		struct intel_encoder *encoder;
 		u32 psr_iir;
@@ -2251,6 +2258,9 @@ void gen8_de_irq_postinstall(struct intel_display *display)
 	if (DISPLAY_VER(display) < 11)
 		de_misc_masked |= GEN8_DE_MISC_GSE;
 
+	if (DISPLAY_VER(display) >= 13)
+		de_misc_masked |= GEN8_DE_MISC_WD0;
+
 	if (display->platform.geminilake || display->platform.broxton)
 		de_port_masked |= BXT_DE_PORT_GMBUS;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 7bd09d981cd2..fb748ae0634f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1325,6 +1325,7 @@
 #define  XELPDP_RM_TIMEOUT		REG_BIT(29)
 #define  XELPDP_PMDEMAND_RSPTOUT_ERR	REG_BIT(27)
 #define  GEN8_DE_MISC_GSE		REG_BIT(27)
+#define  GEN8_DE_MISC_WD0		REG_BIT(23)
 #define  GEN8_DE_EDP_PSR		REG_BIT(19)
 #define  XELPDP_PMDEMAND_RSP		REG_BIT(3)
 #define  XE2LPD_DBUF_OVERLAP_DETECTED	REG_BIT(1)
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 0f26134beacd..d66843fecd9a 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -13,6 +13,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -23,6 +24,7 @@
 #include "intel_display_types.h"
 #include "intel_display_regs.h"
 #include "intel_display_driver.h"
+#include "intel_display_regs.h"
 #include "intel_connector.h"
 #include "intel_fb_pin.h"
 #include "intel_writeback.h"
@@ -335,6 +337,20 @@ void intel_writeback_atomic_commit(struct intel_atomic_state *state)
 	}
 }
 
+static void
+intel_writeback_enable_interrupts(struct intel_display *display,
+				  enum transcoder trans)
+{
+	u32 tmp;
+
+	tmp = intel_de_read(display, WD_IIR(trans));
+	intel_de_write_fw(display, WD_IIR(trans), tmp);
+
+	tmp = ~(WD_GTT_FAULT_INT | WD_WRITE_COMPLETE_INT |
+		WD_VBLANK_INT | WD_CAPTURING_INT);
+	intel_de_write(display, WD_IMR(trans), tmp);
+}
+
 static void intel_writeback_enable_encoder(struct intel_atomic_state *state,
 					   struct intel_encoder *encoder,
 					   const struct intel_crtc_state *crtc_state,
@@ -360,6 +376,7 @@ static void intel_writeback_enable_encoder(struct intel_atomic_state *state,
 	fb = job->fb;
 	hactive = adjusted_mode->hdisplay;
 	vactive = adjusted_mode->vdisplay;
+	intel_writeback_enable_interrupts(display, trans);
 
 	/* Configure WD_STRIDE, WD_SURF and WD_TAIL_CFG */
 	/* Enable Planes, Pipes and Transcoder */
@@ -545,6 +562,40 @@ intel_writeback_get_hw_state(struct intel_encoder *encoder,
 	return true;
 }
 
+void intel_writeback_isr_handler(struct intel_display *display)
+{
+	struct intel_encoder *encoder;
+	struct intel_writeback_connector *wb_conn;
+	struct intel_crtc *crtc;
+	u32 iir;
+
+	for_each_intel_encoder(display->drm, encoder) {
+		if (encoder->type != INTEL_OUTPUT_WRITEBACK)
+			continue;
+
+		wb_conn = enc_to_intel_writeback_connector(encoder);
+		if (!wb_conn->job) {
+			drm_err(display->drm, "No writeback job for the connector\n");
+			continue;
+		}
+
+		crtc = intel_crtc_for_pipe(display, wb_conn->pipe);
+		iir = intel_de_read(display, WD_IIR(wb_conn->trans));
+		if (iir & WD_GTT_FAULT_INT)
+			drm_err(display->drm, " GTT fault during writeback\n");
+		if (iir & WD_WRITE_COMPLETE_INT)
+			drm_dbg_kms(display->drm, "Writeback job write completed\n");
+		if (iir & WD_VBLANK_INT) {
+			drm_crtc_handle_vblank(&crtc->base);
+			drm_dbg_kms(display->drm, "Writeback vblank raised\n");
+		}
+		if (iir & WD_CAPTURING_INT)
+			drm_dbg_kms(display->drm, "Writeback job capture has started\n");
+
+		intel_de_write(display, WD_IIR(wb_conn->trans), iir);
+	}
+}
+
 int intel_writeback_init(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.h b/drivers/gpu/drm/i915/display/intel_writeback.h
index 3c145cf73e20..83a986753c4c 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback.h
@@ -16,6 +16,7 @@ struct intel_writeback_connector;
 
 int intel_writeback_init(struct intel_display *display);
 void intel_writeback_atomic_commit(struct intel_atomic_state *state);
+void intel_writeback_isr_handler(struct intel_display *display);
 
 #endif /* __INTEL_WRITEBACK_H__ */
 
-- 
2.34.1

