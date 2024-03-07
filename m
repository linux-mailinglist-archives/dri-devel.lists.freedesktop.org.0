Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C28747D6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F31126B8;
	Thu,  7 Mar 2024 06:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPzXr565";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AC9112265;
 Thu,  7 Mar 2024 06:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709791228; x=1741327228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqDrrvK2zqVpxASoyLtWsZUvCFww1X1KJZDSH0jL9Zw=;
 b=gPzXr5655yct+gtFVR/leZpOXsyV9lXridA0fYWVgnrEpfWRDSGUaNb8
 rI4W+F/FJZpgRndBUb/3R0sTXYAbmTeITYv2/r2WMISkyUUV2L+n1eKyQ
 bBpFryKhL7/nCK4p/9p+1lI6bWq8292HA7sD0pl+UlyZYQ8lUDaTYmtIq
 yoBAabGzPK0/HxxgbimgKqKnt+BnPwl1HEAjggi50uisZyW9qlashP4XP
 HeOsK52mEhjzBF7s4IhVvLRzxqjbZsc92+u44uQdh08qfJBeWr5Pc3U6I
 9n9AH6GnUeyOyDmnCnkqYyvpBWKsN23PgDSa6Eh10Tu3FcqsVhl6h9d/s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4313123"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4313123"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 22:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10087125"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2024 22:00:26 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v16 8/9] drm/i915/display: Compute vrr_vsync params
Date: Thu,  7 Mar 2024 11:23:28 +0530
Message-Id: <20240307055329.3238634-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute vrr_vsync_start/end, which sets the position
for hardware to send the Vsync at a fixed position
relative to the end of the Vblank.

--v2:
- Updated VSYNC_START/END macros to VRR_VSYNC_START/END. (Ankit)
- Updated bit fields of VRR_VSYNC_START/END. (Ankit)

--v3:
- Add PIPE_CONF_CHECK_I(vrr.vsync_start/end).
- Read/write vrr_vsync params only when we intend to send
adaptive_sync sdp.

--v4:
- Use VRR_SYNC_START/END macros correctly.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 30 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h               |  7 +++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 88158f06bf82..f62c3ae7f0fd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5377,6 +5377,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.flipline);
 		PIPE_CONF_CHECK_I(vrr.pipeline_full);
 		PIPE_CONF_CHECK_I(vrr.guardband);
+		PIPE_CONF_CHECK_I(vrr.vsync_start);
+		PIPE_CONF_CHECK_I(vrr.vsync_end);
 	}
 
 #undef PIPE_CONF_CHECK_X
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 098957cea25b..e8ba3c077569 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1423,6 +1423,7 @@ struct intel_crtc_state {
 		bool enable, in_range;
 		u8 pipeline_full;
 		u16 flipline, vmin, vmax, guardband;
+		u32 vsync_end, vsync_start;
 	} vrr;
 
 	/* Stream Splitter for eDP MSO */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 5d905f932cb4..8f4605884052 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_vrr.h"
+#include "intel_dp.h"
 
 bool intel_vrr_is_capable(struct intel_connector *connector)
 {
@@ -113,6 +114,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
 	int vmin, vmax;
@@ -165,6 +167,15 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+
+		if (intel_dp_as_sdp_supported(intel_dp)) {
+			crtc_state->vrr.vsync_start =
+				(crtc_state->hw.adjusted_mode.crtc_vtotal -
+					crtc_state->hw.adjusted_mode.vsync_start);
+			crtc_state->vrr.vsync_end =
+				(crtc_state->hw.adjusted_mode.crtc_vtotal -
+					crtc_state->hw.adjusted_mode.vsync_end);
+		}
 	}
 }
 
@@ -203,6 +214,11 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
 	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
 	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
+
+	if (crtc_state->vrr.vsync_end && crtc_state->vrr.vsync_start)
+		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
+			       VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) |
+				   VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
 }
 
 void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
@@ -263,7 +279,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	u32 trans_vrr_ctl;
+	u32 trans_vrr_ctl, trans_vrr_vsync;
 
 	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
 
@@ -283,6 +299,16 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 		crtc_state->vrr.vmin = intel_de_read(dev_priv, TRANS_VRR_VMIN(cpu_transcoder)) + 1;
 	}
 
-	if (crtc_state->vrr.enable)
+	if (crtc_state->vrr.enable) {
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+
+		if (HAS_AS_SDP(dev_priv)) {
+			trans_vrr_vsync =
+				intel_de_read(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder));
+			crtc_state->vrr.vsync_start =
+				REG_FIELD_GET(VRR_VSYNC_START_MASK, trans_vrr_vsync);
+			crtc_state->vrr.vsync_end =
+				REG_FIELD_GET(VRR_VSYNC_END_MASK, trans_vrr_vsync);
+		}
+	}
 }
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index dce276236707..53d8eb7ea1ea 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2007,7 +2007,9 @@
 #define _TRANS_VRR_CTL_B		0x61420
 #define _TRANS_VRR_CTL_C		0x62420
 #define _TRANS_VRR_CTL_D		0x63420
+#define _TRANS_VRR_VSYNC_A		0x60078
 #define TRANS_VRR_CTL(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_CTL_A)
+#define TRANS_VRR_VSYNC(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_VSYNC_A)
 #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
 #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
 #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
@@ -2087,6 +2089,11 @@
 #define TRANS_VRR_STATUS2(trans)	_MMIO_TRANS2(trans, _TRANS_VRR_STATUS2_A)
 #define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
 
+#define   VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
+#define   VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
+#define   VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
+#define   VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))
+
 #define _TRANS_PUSH_A			0x60A70
 #define _TRANS_PUSH_B			0x61A70
 #define _TRANS_PUSH_C			0x62A70
-- 
2.25.1

