Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A421DB117B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4F110E9AA;
	Fri, 25 Jul 2025 05:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ls5f9Th7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616410E9AA;
 Fri, 25 Jul 2025 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419899; x=1784955899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2fBwZ+ZRKURAkOfBtsyNDxFK8Rwnw4K5x+UtXN1AOQ=;
 b=Ls5f9Th703CQadec7pxdgnJ2u1Fbpv45bizfm8AyMlUNTJh9mEIthMyI
 kWK0RzrFlax8TwPvNj35i6552/aWWVtBif5a/d0xMUY+l6II30WvfZbe1
 oYhmGjVXlNaYP4JbtgDefhN6rM1QRCJ2eP3sODf1WQCgM7MQ3GrGbvAsx
 OJDSBnVfm6kGtdikQyC29+a50ALzTiF1APoiB98Fvr0mXbqS0NPbCPqc1
 CsUDggNYM6OTOw+OuJ7x0E/4PrV0Z7JRVoXP/zl4gcTVxiKJWPeiz9pcu
 WdO4A8zsPzKcWq6QX2xCuT4u9SCfgMzK045jBjjUmp0M1kTuW+ERa9ckF g==;
X-CSE-ConnectionGUID: Q5VP/nOSTJapeOYc0f4d3w==
X-CSE-MsgGUID: keQQnbkTRoSGSEuUuwrJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299554"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:59 -0700
X-CSE-ConnectionGUID: 1FOiB8t5T7C062Pf4TYHfw==
X-CSE-MsgGUID: 4OXCGuvqRjeJzYM4fgWm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956669"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:57 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 19/28] drm/i915/writeback: Add the enable sequence from
 writeback
Date: Fri, 25 Jul 2025 10:34:00 +0530
Message-Id: <20250725050409.2687242-20-suraj.kandpal@intel.com>
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

Add enable sequence for writeback, use encoder->enable hook to
enable the transcoder.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 7fb30cc61991..2db9ae7d810f 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -15,10 +15,13 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "i915_vma.h"
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_display_regs.h"
 #include "intel_display_driver.h"
 #include "intel_connector.h"
 #include "intel_fb_pin.h"
@@ -31,6 +34,7 @@ struct intel_writeback_connector {
 	struct intel_connector connector;
 	struct intel_writeback_job *job;
 	enum transcoder trans;
+	enum pipe pipe;
 	int frame_num;
 };
 
@@ -49,6 +53,12 @@ static const u32 writeback_formats[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+static struct intel_writeback_connector
+*enc_to_intel_writeback_connector(struct intel_encoder *encoder)
+{
+	return container_of(encoder, struct intel_writeback_connector, encoder);
+}
+
 static struct intel_writeback_connector
 *conn_to_intel_writeback_connector(struct intel_connector *connector)
 {
@@ -234,6 +244,99 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void intel_writeback_enable_encoder(struct intel_atomic_state *state,
+					   struct intel_encoder *encoder,
+					   const struct intel_crtc_state *crtc_state,
+					   const struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_writeback_connector *wb_conn =
+		enc_to_intel_writeback_connector(encoder);
+	struct intel_writeback_job *job = wb_conn->job;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	enum transcoder trans = crtc_state->cpu_transcoder;
+	struct intel_crtc *pipe_crtc;
+	struct drm_framebuffer *fb;
+	u32 val = 0, hactive, vactive;
+	int i = 0;
+
+	if (!conn_state->writeback_job)
+		return;
+
+	wb_conn->trans = trans;
+	wb_conn->pipe = crtc->pipe;
+	fb = job->fb;
+	hactive = adjusted_mode->hdisplay;
+	vactive = adjusted_mode->vdisplay;
+
+	/* Configure WD_STRIDE, WD_SURF and WD_TAIL_CFG */
+	/* Enable Planes, Pipes and Transcoder */
+	/* TRANSCODER TIMINGS and other transcoder setting*/
+	/* minimum hactive as per bspec: 64 pixels */
+	if (hactive < 64)
+		drm_err(display->drm, "hactive is less then 64 pixels\n");
+
+	intel_de_write(display, TRANS_HTOTAL(display, trans), HACTIVE(hactive - 1));
+	intel_de_write(display, TRANS_VTOTAL(display, trans), VACTIVE(vactive - 1));
+
+	val = 0;
+	/* 2f) Configure and enable TRANS_WD_FUNC_CTL */
+	switch (crtc->pipe) {
+	default:
+		fallthrough;
+	case PIPE_A:
+		val |= WD_INPUT_PIPE_A;
+		break;
+	case PIPE_B:
+		val |= WD_INPUT_PIPE_B;
+		break;
+	case PIPE_C:
+		val |= WD_INPUT_PIPE_C;
+		break;
+	case PIPE_D:
+		val |= WD_INPUT_PIPE_D;
+		break;
+	}
+
+	switch (fb->format->format) {
+	default:
+		fallthrough;
+	case DRM_FORMAT_YUYV:
+		val |= WD_PIX_FMT_YUYV;
+		break;
+	case DRM_FORMAT_XYUV8888:
+		val |= WD_PIX_FMT_XYUV8888;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		val |= WD_PIX_FMT_XBGR8888;
+		break;
+	case DRM_FORMAT_XBGR2101010:
+		val |= WD_PIX_FMT_XBGR2101010;
+		break;
+	}
+
+	val |= TRANS_WD_FUNC_ENABLE | WD_TRIGGERED_CAP_MODE_ENABLE |
+		WD_DISABLE_POINTERS;
+	intel_de_write(display, WD_TRANS_FUNC_CTL(trans), val);
+
+	if (DISPLAY_VER(display) >= 13)
+		intel_de_rmw(display, PIPE_CHICKEN(crtc->pipe),
+			     UNDERRUN_RECOVERY_DISABLE_ADLP,
+			     UNDERRUN_RECOVERY_DISABLE_ADLP);
+
+	/*  Configure and enable TRANS_CONF */
+	intel_de_write(display, TRANSCONF_WD(trans), WD_TRANS_ENABLE);
+	intel_de_posting_read(display, TRANSCONF_WD(trans));
+
+	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state, i) {
+		const struct intel_crtc_state *pipe_crtc_state =
+			intel_atomic_get_new_crtc_state(state, pipe_crtc);
+
+		intel_crtc_vblank_on(pipe_crtc_state);
+	}
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -378,6 +481,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
 	encoder->compute_config = intel_writeback_compute_config;
+	encoder->enable = intel_writeback_enable_encoder;
 
 	connector = &writeback_conn->connector;
 	intel_writeback_connector_alloc(connector);
-- 
2.34.1

