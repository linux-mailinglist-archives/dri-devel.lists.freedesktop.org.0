Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E4B117C6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C21210E9CC;
	Fri, 25 Jul 2025 05:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSJ6rjKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723DE10E9CF;
 Fri, 25 Jul 2025 05:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419920; x=1784955920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3aEIR/qL8/wzUilc9VR6sjg1zE8GrFP2hTOQzRoNbO4=;
 b=JSJ6rjKIQjXAwnaemNHaQK7TEAqa3CKxly+E7BPrVOIiRu5EIohtlqZQ
 wkMN8e8fbO53DQ6KaVBqj+Lxni3TnPnMOC/llZY/xdSarVrhdVDP2Oivq
 JDn4FamuFgLPiEDw57fab0VzDap7uLLn0suTic6pVwGrPw/b4N407za1P
 o30+Nt5bhlqpRrIhSJl4mdeCXFfGBvdSaNMX3gIQtaVV2C+DrxePSlade
 MZKdEAwIbsu7whjPlGkpArv89R6w6yXAsGMQzB8asC3LzTIBG5OHj5Jo7
 0WImY8RVTHa3uqZ4ZbUHIUWqTn57SdsoYHRNyYKQBxhIbsHjbDgnN4E7r A==;
X-CSE-ConnectionGUID: Bh6x9v5WTjK/KgLso1g07Q==
X-CSE-MsgGUID: WPECobPNSBuhDZXQtz8dKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299578"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:20 -0700
X-CSE-ConnectionGUID: pu4VBYmHSe6+NONxOKdbBA==
X-CSE-MsgGUID: GxqAbwQ4QU2ODhoPG59CtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956823"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 28/28] drm/i915/writeback: Modify state verify function
Date: Fri, 25 Jul 2025 10:34:09 +0530
Message-Id: <20250725050409.2687242-29-suraj.kandpal@intel.com>
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

Modify the state verify functions to take into account the fact
that writeback does not need all the timings for it to be set.
Moreover there is no need for dpll state nor do we need to set
any sort of flags for it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 60 ++++++++++++--------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 953d14ac342d..9be05995b268 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5064,6 +5064,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	struct drm_printer p;
 	u32 exclude_infoframes = 0;
 	bool ret = true;
+	bool is_writeback =
+		intel_crtc_has_type(current_config, INTEL_OUTPUT_WRITEBACK);
 
 	if (fastset)
 		p = drm_dbg_printer(display->drm, DRM_UT_KMS, NULL);
@@ -5179,20 +5181,25 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 } while (0)
 
 #define PIPE_CONF_CHECK_TIMINGS(name) do {     \
-	PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
-	PIPE_CONF_CHECK_I(name.crtc_htotal); \
-	PIPE_CONF_CHECK_I(name.crtc_hblank_start); \
-	PIPE_CONF_CHECK_I(name.crtc_hblank_end); \
-	PIPE_CONF_CHECK_I(name.crtc_hsync_start); \
-	PIPE_CONF_CHECK_I(name.crtc_hsync_end); \
-	PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
-	if (!fastset || !allow_vblank_delay_fastset(current_config)) \
-		PIPE_CONF_CHECK_I(name.crtc_vblank_start); \
-	PIPE_CONF_CHECK_I(name.crtc_vsync_start); \
-	PIPE_CONF_CHECK_I(name.crtc_vsync_end); \
-	if (!fastset || !pipe_config->update_lrr) { \
-		PIPE_CONF_CHECK_I(name.crtc_vtotal); \
-		PIPE_CONF_CHECK_I(name.crtc_vblank_end); \
+	if (is_writeback) { \
+		PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
+		PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
+	} else { \
+		PIPE_CONF_CHECK_I(name.crtc_hdisplay); \
+		PIPE_CONF_CHECK_I(name.crtc_htotal); \
+		PIPE_CONF_CHECK_I(name.crtc_hblank_start); \
+		PIPE_CONF_CHECK_I(name.crtc_hblank_end); \
+		PIPE_CONF_CHECK_I(name.crtc_hsync_start); \
+		PIPE_CONF_CHECK_I(name.crtc_hsync_end); \
+		PIPE_CONF_CHECK_I(name.crtc_vdisplay); \
+		if (!fastset || !allow_vblank_delay_fastset(current_config)) \
+			PIPE_CONF_CHECK_I(name.crtc_vblank_start); \
+		PIPE_CONF_CHECK_I(name.crtc_vsync_start); \
+		PIPE_CONF_CHECK_I(name.crtc_vsync_end); \
+		if (!fastset || !pipe_config->update_lrr) { \
+			PIPE_CONF_CHECK_I(name.crtc_vtotal); \
+			PIPE_CONF_CHECK_I(name.crtc_vblank_end); \
+		} \
 	} \
 } while (0)
 
@@ -5321,10 +5328,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(pixel_multiplier);
 
-	PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-			      DRM_MODE_FLAG_INTERLACE);
+	if (!is_writeback)
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_INTERLACE);
 
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS)) {
+	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS) && !is_writeback) {
 		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
 				      DRM_MODE_FLAG_PHSYNC);
 		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
@@ -5371,7 +5379,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_RECT(pch_pfit.dst);
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
-		PIPE_CONF_CHECK_I(pixel_rate);
+		if (!is_writeback)
+			PIPE_CONF_CHECK_I(pixel_rate);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
@@ -5394,28 +5403,31 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_BOOL(double_wide);
 
-	if (display->dpll.mgr)
+	if (display->dpll.mgr && !is_writeback)
 		PIPE_CONF_CHECK_P(intel_dpll);
 
 	/* FIXME convert everything over the dpll_mgr */
-	if (display->dpll.mgr || HAS_GMCH(display))
+	if ((display->dpll.mgr || HAS_GMCH(display)) && !is_writeback)
 		PIPE_CONF_CHECK_PLL(dpll_hw_state);
 
 	/* FIXME convert MTL+ platforms over to dpll_mgr */
-	if (DISPLAY_VER(display) >= 14)
+	if (DISPLAY_VER(display) >= 14 && !is_writeback)
 		PIPE_CONF_CHECK_PLL_CX0(dpll_hw_state.cx0pll);
 
 	PIPE_CONF_CHECK_X(dsi_pll.ctrl);
 	PIPE_CONF_CHECK_X(dsi_pll.div);
 
-	if (display->platform.g4x || DISPLAY_VER(display) >= 5)
+	if ((display->platform.g4x || DISPLAY_VER(display) >= 5) &&
+	    !is_writeback)
 		PIPE_CONF_CHECK_I(pipe_bpp);
 
-	if (!fastset || !pipe_config->update_m_n) {
+	if ((!fastset || !pipe_config->update_m_n) && !is_writeback) {
 		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_clock);
 		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_clock);
 	}
-	PIPE_CONF_CHECK_I(port_clock);
+
+	if (!is_writeback)
+		PIPE_CONF_CHECK_I(port_clock);
 
 	PIPE_CONF_CHECK_I(min_voltage_level);
 
-- 
2.34.1

