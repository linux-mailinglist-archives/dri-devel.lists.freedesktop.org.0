Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE4A3BDAB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 12:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3B10E7CD;
	Wed, 19 Feb 2025 11:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXqn+nUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0010E7C3;
 Wed, 19 Feb 2025 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739966392; x=1771502392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGYdygxmqGV4CodyzU0HTQSjEPr21dKHpBGtUYy2pxM=;
 b=IXqn+nUOqUdoad3kymokbHBs9L7PUEmkn2Mf8NkYYUBd6uWpofnfn70G
 QB4W41pGMRuD0qGuhaFsM2PducNTW71blMyCkkc2iiknENCrEzMoG5dUI
 bCOa1T2QKqvz1EuFO1a/EKxSrHRdvEW3uTIgCejqBHICdWP+f1Z4w+4gH
 j6rvQ9EutrnxyrMD2PJUq1QWH6b0H7+4igix9h4AfNSXBodq9KvBo84TF
 YOwql2/p41iyA6dULNTv5Prr3eHAqXlMJzH4VTnrwvocCkXp8iZLuW+GE
 VIq2zVx5ivXfxS3juaaYFFRn5EEQ4tz2FciFNI3GvAOUtpKCkXB2hCFdt Q==;
X-CSE-ConnectionGUID: iosOJ74sQQO1hOhsAi5Rhg==
X-CSE-MsgGUID: v1Ptsq5rTFulWWf56ulzzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52103112"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="52103112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:59:50 -0800
X-CSE-ConnectionGUID: EEHCt4VjQ3Smy4OXdGReNw==
X-CSE-MsgGUID: CgTlaisBRFKNGO4rKONlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114545058"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 03:59:49 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
Subject: [PATCH v6 6/6] drm/i915/display: Load the lut values and enable
 sharpness
Date: Wed, 19 Feb 2025 17:23:59 +0530
Message-Id: <20250219115359.2320992-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

Load the lut values during pipe enable.

v2: Add the display version check
v3: Fix build issue
v4: Rebase
v5: Add HAS_CASF macro. [Ankit]
    Add scaler_id check while reading state. [Ankit]
v6: Modify the disable condition. 

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c     |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c  | 32 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/skl_scaler.c     | 32 +++++++++++++++----
 4 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 5b2603ef2ff7..b8bd255e9555 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -391,6 +391,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(dev_priv))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cf807e0931ea..38f333e78031 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1065,6 +1065,25 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
 		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
 }
 
+static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
+				const struct intel_crtc_state *old_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
+}
+
+static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
+				 const struct intel_crtc_state *old_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return (new_crtc_state->hw.casf_params.casf_enable !=
+			old_crtc_state->hw.casf_params.casf_enable);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -1211,6 +1230,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	intel_psr_pre_plane_update(state, crtc);
@@ -1679,6 +1701,8 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	struct intel_crtc *pipe_crtc;
@@ -1772,6 +1796,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 			intel_crtc_wait_for_next_vblank(wa_crtc);
 		}
 	}
+
+	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+		intel_filter_lut_load(crtc, new_crtc_state);
 }
 
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
@@ -6880,6 +6907,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
+	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+		intel_casf_enable(new_crtc_state);
+	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
+		intel_casf_update_strength(new_crtc_state);
+
 	intel_fbc_update(state, crtc);
 
 	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1320ff888fdd..a06f01d62606 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -937,6 +937,8 @@ struct intel_casf {
 	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
 	u8 win_size;
 	bool casf_enable;
+	bool strength_changed;
+	u8 strength;
 };
 
 void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 9d687298a9a6..03f0e800c8e9 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -10,6 +10,7 @@
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_casf_regs.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 
@@ -946,7 +947,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 	/* find scaler attached to this pipe */
 	for (i = 0; i < crtc->num_scalers; i++) {
-		u32 ctl, pos, size;
+		u32 ctl, pos, size, sharp;
 
 		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
@@ -954,14 +955,33 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 		id = i;
 
+		if (HAS_CASF(display) && id == 1) {
+			sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
+			if (sharp & FILTER_EN) {
+				if (drm_WARN_ON(display->drm,
+						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
+					crtc_state->hw.casf_params.strength = 0;
+				else
+					crtc_state->hw.casf_params.strength =
+						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
+				crtc_state->hw.casf_params.casf_enable = true;
+				crtc_state->hw.casf_params.win_size =
+					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
+			}
+		}
+
+		if (!crtc_state->hw.casf_params.casf_enable)
+			crtc_state->pch_pfit.enabled = true;
+
 		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
 		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
 
-		drm_rect_init(&crtc_state->pch_pfit.dst,
-				REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
-				REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
-				REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
-				REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
+		if (!crtc_state->hw.casf_params.casf_enable)
+			drm_rect_init(&crtc_state->pch_pfit.dst,
+				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
+				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
 
 		scaler_state->scalers[i].in_use = true;
 		break;
-- 
2.25.1

