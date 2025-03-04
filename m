Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E620A4DAAC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241B10E579;
	Tue,  4 Mar 2025 10:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwK0O7oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247E10E583;
 Tue,  4 Mar 2025 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084425; x=1772620425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjlrT+5+O/UpWjIA7N7wSXB0wyfHS11ImDcxJjzjaw8=;
 b=ZwK0O7ozzFzRMVbW1KGeugTt+nmfddTEVmNnOfwTVPQUj+G1uIXCKG6I
 Wks6mYzUsvM9p6/MTuTJ8waN6AWzb/E8tROnufhPjAfDwqHeF8xyx35fu
 4xmVH7FqesetAFfaJf5hsIh2pb0BxaoJX8h4mxtA+N0ecE0n8ZhOmNyu5
 vmKxgA48RJ2YPli4fis7s9D4rRHlrZYerDeRA7MwsVuDwm1lKrDTzSut0
 EavbnC1e8IVBYzI6v1cf6UranE7gt+ObCUdE3i0VHm482hqJqQ6fCThXC
 ShmoLeQtRwtq0Vwor7ZMB2z6mt5oK1hsGat09qguok/gPuJx/Um1oYjTp Q==;
X-CSE-ConnectionGUID: 1JIETidCTVK0mfR6XZ5/3w==
X-CSE-MsgGUID: H2HqXiatSvqnmRrVtCzdEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584097"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:45 -0800
X-CSE-ConnectionGUID: 7IduZL4fTAaIB/zevTmLFw==
X-CSE-MsgGUID: 98uTm3DgTJmvcYVhndj+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064049"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:42 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 06/10] drm/i915/display: Add and compute scaler parameter
Date: Tue,  4 Mar 2025 15:58:53 +0530
Message-Id: <20250304102857.326544-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Compute the values for second scaler for sharpness.
Fill the register bits corresponding to the scaler.

v1: Rename the title of patch [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c |  3 ++
 drivers/gpu/drm/i915/display/skl_scaler.c | 46 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/skl_scaler.h |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index ff34e390c8fe..15ae555e571e 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -8,6 +8,7 @@
 #include "intel_casf_regs.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "skl_scaler.h"
 
 #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
@@ -211,4 +212,6 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
 	intel_casf_write_coeff(crtc_state);
+
+	skl_scaler_setup_casf(crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index f0cf966211c9..39fc537e54f0 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -133,6 +133,13 @@ static void skl_scaler_max_dst_size(struct intel_crtc *crtc,
 	}
 }
 
+#define CASF_SCALER_FILTER_SELECT \
+	(PS_FILTER_PROGRAMMED | \
+	PS_Y_VERT_FILTER_SELECT(0) | \
+	PS_Y_HORZ_FILTER_SELECT(0) | \
+	PS_UV_VERT_FILTER_SELECT(0) | \
+	PS_UV_HORZ_FILTER_SELECT(0))
+
 static int
 skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 		  unsigned int scaler_user, int *scaler_id,
@@ -722,6 +729,45 @@ static void skl_scaler_setup_filter(struct intel_display *display,
 	}
 }
 
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_display_mode *adjusted_mode =
+	&crtc_state->hw.adjusted_mode;
+	struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+	struct drm_rect src, dest;
+	int id, width, height;
+	int x = 0, y = 0;
+	enum pipe pipe = crtc->pipe;
+	u32 ps_ctrl;
+
+	width = adjusted_mode->crtc_hdisplay;
+	height = adjusted_mode->crtc_vdisplay;
+
+	drm_rect_init(&dest, x, y, width, height);
+
+	width = drm_rect_width(&dest);
+	height = drm_rect_height(&dest);
+	id = scaler_state->scaler_id;
+
+	drm_rect_init(&src, 0, 0,
+		      drm_rect_width(&crtc_state->pipe_src) << 16,
+		      drm_rect_height(&crtc_state->pipe_src) << 16);
+
+	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
+
+	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
+		  CASF_SCALER_FILTER_SELECT;
+
+	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
+	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
+			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
+	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
+			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
+}
+
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h b/drivers/gpu/drm/i915/display/skl_scaler.h
index 355ea15260ca..22fcfe78b506 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.h
+++ b/drivers/gpu/drm/i915/display/skl_scaler.h
@@ -31,5 +31,6 @@ void skl_detach_scalers(struct intel_dsb *dsb,
 void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
 
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
+void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
 
 #endif
-- 
2.25.1

