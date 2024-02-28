Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C886B1A0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5C10E819;
	Wed, 28 Feb 2024 14:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNlx2H6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AF210E7C5;
 Wed, 28 Feb 2024 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709130074; x=1740666074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jB94Pnis+2Uqyw1GzoB7skNqvc+09jzapHnkbp10fUE=;
 b=WNlx2H6jrHI8dbX/4DjrU4dph9UAkQdxpt4LgvTkDInl/LClAp7qTprv
 1uR0SJ3zJPjxT1kVYLbCaXUh/BSTsaOf+4NjT8reOCnKmw4yehwD+ACGO
 5qxtoOUzcy8bSTe9jV4xVUvvoWSwiJz7RNYV9NjC8zbSm6AO9ly1mamkL
 YNotYwktIcPb12WG93rLXmeh8Kwkup83yXDUd93ZLhuSlh/IqTtZLpgLo
 XM09mAKz4GIVa6ZPe4uXuuB17eiVU5zDJJGeuO1g6X24e5dyH7uLe50tC
 +fuI8hapJGe0KXOnwRGAZkd5r1uV34zm7CpXVjijtrx77RYzzeVZ0F4fh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14080558"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14080558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7488163"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Feb 2024 06:21:12 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v11 7/8] drm/i915/display: Compute vrr_vsync params
Date: Wed, 28 Feb 2024 19:44:11 +0530
Message-Id: <20240228141412.2761101-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240228141412.2761101-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240228141412.2761101-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 25 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h               |  7 ++++++
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index be0a5fae4e58..c523eec4d626 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5367,6 +5367,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.flipline);
 		PIPE_CONF_CHECK_I(vrr.pipeline_full);
 		PIPE_CONF_CHECK_I(vrr.guardband);
+		PIPE_CONF_CHECK_I(vrr.vsync_start);
+		PIPE_CONF_CHECK_I(vrr.vsync_end);
 	}
 
 #undef PIPE_CONF_CHECK_X
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1256730ea276..45b30d3ceb06 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1417,6 +1417,7 @@ struct intel_crtc_state {
 		bool enable, in_range;
 		u8 pipeline_full;
 		u16 flipline, vmin, vmax, guardband;
+		u32 vsync_end, vsync_start;
 	} vrr;
 
 	/* Stream Splitter for eDP MSO */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 5d905f932cb4..668927524f23 100644
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
+				VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
+			crtc_state->vrr.vsync_end =
+				(crtc_state->hw.adjusted_mode.crtc_vtotal -
+				(VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) >> 16));
+		}
 	}
 }
 
@@ -263,7 +274,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	u32 trans_vrr_ctl;
+	u32 trans_vrr_ctl, trans_vrr_vsync;
 
 	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
 
@@ -283,6 +294,16 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
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
+				trans_vrr_vsync & VRR_VSYNC_START_MASK;
+			crtc_state->vrr.vsync_end =
+				trans_vrr_vsync & VRR_VSYNC_START_MASK;
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

