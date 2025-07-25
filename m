Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5DB117BA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F9910E9BC;
	Fri, 25 Jul 2025 05:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPxfg/o7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27C810E9B7;
 Fri, 25 Jul 2025 05:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419906; x=1784955906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TYvphzQB9uuA34ylsaPB6exaZFD0WF3IHyW4jvncC+s=;
 b=BPxfg/o7fyPwXlsmkKXUn76YOt4M7zTVazcQJ+DnRjeQLD5OGWgEDK4b
 vOGr2cZRU+uimITHnCxpiQEwCevyFuTpEXBQYoQHayDdayJNXIq7L6OMu
 VnHi2cGN7cGC1lu1WVaLtJwQhXF3SgjOoz45VOFl2l8Ie2Abix9Y8wtcX
 ncOQ+wCGO0pgUP028Qzw5eL5ac2L3cJVmXIBujiwxMXgSqfQhsAwzOUgM
 KceiLjNJ2kA1FU3PiCzUU1El+TufPtfVJtJp2lm3za5Df71/XkRpxzlRI
 npUiNhfllSTenQY5o5lccEwb+Wm9GfMZm02W6oaePiGtulZ3jsDXKo+TF w==;
X-CSE-ConnectionGUID: zWD7hBcbSHmHpRQ4tyexRw==
X-CSE-MsgGUID: F7beXeMhSGyIwrMaIFlOoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299562"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:06 -0700
X-CSE-ConnectionGUID: Z8Fez8HqQMuxyjXmXQV8eg==
X-CSE-MsgGUID: u53Fo5W5Rn6/nZB0V9vLyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956729"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 22/28] drm/i915/writeback: Configure WD_STRIDE reg
Date: Fri, 25 Jul 2025 10:34:03 +0530
Message-Id: <20250725050409.2687242-23-suraj.kandpal@intel.com>
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

Write to the WD_STRIDE register using the appropriate calculation
based on the color mode and hactive.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 34 +++++++++++++++++++
 .../drm/i915/display/intel_writeback_reg.h    |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 25e293cc5be4..c6c05bd3d298 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -244,15 +244,49 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static int
+get_color_mode_bpp(struct intel_display *display, u32 color_format)
+{
+	int bpp = 0;
+
+	switch (color_format) {
+	case DRM_FORMAT_XYUV8888:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_XVYU2101010:
+		bpp = 4;
+		break;
+	default:
+		drm_err(display->drm, "Unsupported format for writeback\n");
+		break;
+	}
+
+	return bpp;
+}
+
 static void intel_writeback_capture(struct intel_atomic_state *state,
 				    struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_writeback_connector *wb_conn =
 		conn_to_intel_writeback_connector(connector);
+	struct intel_crtc *crtc = intel_crtc_for_pipe(display, wb_conn->pipe);
+	struct intel_crtc_state *crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	struct intel_writeback_job *wb_job = wb_conn->job;
 	enum transcoder trans = wb_conn->trans;
 	u32 val = 0;
+	int bpp;
 
+	bpp = get_color_mode_bpp(display, wb_job->fb->format->format);
+	val = DIV_ROUND_UP((adjusted_mode->hdisplay * bpp), 64);
+	intel_de_write(display, WD_STRIDE(trans), WD_STRIDE_VAL(val));
+
+	val = 0;
 	val |= START_TRIGGER_FRAME | WD_FRAME_NUMBER(wb_conn->frame_num);
 	intel_de_rmw(display, WD_TRANS_FUNC_CTL(trans),
 		     START_TRIGGER_FRAME | WD_FRAME_NUMBER_MASK,
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
index 5e7c6c99d191..f526af0f9aff 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -60,6 +60,7 @@
 					_WD_STRIDE_0,\
 					_WD_STRIDE_1)
 #define WD_STRIDE_MASK			REG_GENMASK(15, 6)
+#define WD_STRIDE_VAL(val)		REG_FIELD_PREP(WD_STRIDE_MASK, val)
 
 #define _WD_STREAMCAP_CTL0		0x6e590
 #define _WD_STREAMCAP_CTL1		0x6ed90
-- 
2.34.1

