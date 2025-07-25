Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC9B1179B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA26310E424;
	Fri, 25 Jul 2025 05:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lV3Vubh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363810E427;
 Fri, 25 Jul 2025 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419868; x=1784955868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZXhZFRCIv3+sbfp5Q1P9MnrbEFGy6t/Qm7RlsnBa3UI=;
 b=lV3Vubh3fB2D8uHKIXhn9yufq7MnWFZOw+/VqkSUhTFwfc3lzAPB5XTA
 GGhg9SAhbTy6y0h9+JEG7Q4MjNms8De3EFPvzIqNtFKIe7l9AOWsWzGiT
 +ymgAv7s/YIYsTpWY8D9HJhPxmQ2+qbOYsrZyBDR+K8Ejbfgdq8xkN8Cz
 nFks9URR/Ao811+HPERfqpOJYF0iPSxJG23/ysszjjIColQxLzU265Kxw
 whCxr8o0m5xWqVOcoPp5SllFbZvF/ObqlCNdo2n2ikloNp24xXsMuMh12
 PRqqH5H9kEJ/ec2c7fs2GFBlU41jLx86GxXFD50mXe1E4XsoOdXSQjjui w==;
X-CSE-ConnectionGUID: h37tUCjFTTKnQRvM6HXkDA==
X-CSE-MsgGUID: Cunl1akuQbOATenrzrQGSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299521"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:28 -0700
X-CSE-ConnectionGUID: ioWMgkGeTzexYv5LabXGzw==
X-CSE-MsgGUID: unDVvJcbSWW7igzW/lWs5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956523"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:25 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 05/28] drm/i915/writeback: Add some preliminary writeback
 definitions
Date: Fri, 25 Jul 2025 10:33:46 +0530
Message-Id: <20250725050409.2687242-6-suraj.kandpal@intel.com>
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

Add some preliminary definitions like, output type and transcoder
related to the writeback functionality.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c     |  1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  4 +++
 .../drm/i915/display/intel_display_device.c   | 29 +++++++++++++++++--
 .../drm/i915/display/intel_display_device.h   |  2 +-
 .../drm/i915/display/intel_display_limits.h   |  2 ++
 .../drm/i915/display/intel_display_power.c    |  4 +++
 .../drm/i915/display/intel_display_power.h    |  2 ++
 .../drm/i915/display/intel_display_types.h    |  1 +
 10 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 1addd6288241..4b1ec56299ca 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -255,6 +255,7 @@ static u32 acpi_display_type(struct intel_connector *connector)
 		break;
 	case DRM_MODE_CONNECTOR_Unknown:
 	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_WRITEBACK:
 		display_type = ACPI_DISPLAY_TYPE_OTHER;
 		break;
 	default:
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 0c7f91046996..77e05d73ed92 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -53,7 +53,6 @@ intel_dump_infoframe(struct intel_display *display,
 }
 
 #define OUTPUT_TYPE(x) [INTEL_OUTPUT_ ## x] = #x
-
 static const char * const output_type_str[] = {
 	OUTPUT_TYPE(UNUSED),
 	OUTPUT_TYPE(ANALOG),
@@ -67,6 +66,7 @@ static const char * const output_type_str[] = {
 	OUTPUT_TYPE(DSI),
 	OUTPUT_TYPE(DDI),
 	OUTPUT_TYPE(DP_MST),
+	OUTPUT_TYPE(WRITEBACK),
 };
 
 #undef OUTPUT_TYPE
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7035c1fc9033..c2d1156de8e9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3716,7 +3716,8 @@ static u8 hsw_panel_transcoders(struct intel_display *display)
 	u8 panel_transcoder_mask = BIT(TRANSCODER_EDP);
 
 	if (DISPLAY_VER(display) >= 11)
-		panel_transcoder_mask |= BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1);
+		panel_transcoder_mask |= BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1) |
+				BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1);
 
 	return panel_transcoder_mask;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 37e2ab301a80..12b8f2cf0fc8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -65,6 +65,10 @@ static inline const char *transcoder_name(enum transcoder transcoder)
 		return "DSI A";
 	case TRANSCODER_DSI_C:
 		return "DSI C";
+	case TRANSCODER_WD_0:
+		return "WD 0";
+	case TRANSCODER_WD_1:
+		return "WD 1";
 	default:
 		return "<invalid>";
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 089cffabbad5..286de0187931 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -22,6 +22,7 @@
 #include "intel_display_types.h"
 #include "intel_fbc.h"
 #include "intel_step.h"
+#include "intel_writeback_reg.h"
 
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field initialization overrides for display info");
@@ -145,12 +146,16 @@ static const struct intel_display_device_info no_display = {};
 		[TRANSCODER_B] = PIPE_B_OFFSET, \
 		[TRANSCODER_C] = PIPE_C_OFFSET, \
 		[TRANSCODER_EDP] = PIPE_EDP_OFFSET, \
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	}, \
 	.trans_offsets = { \
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
 		[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
 		[TRANSCODER_C] = TRANSCODER_C_OFFSET, \
 		[TRANSCODER_EDP] = TRANSCODER_EDP_OFFSET, \
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	}
 
 #define CHV_PIPE_OFFSETS \
@@ -581,7 +586,8 @@ static const struct platform_desc hsw_desc = {
 		.__runtime_defaults.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
 		.__runtime_defaults.cpu_transcoder_mask =
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
-		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP),
+		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) |
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1),
 		.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),
 		.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A),
 	},
@@ -678,7 +684,8 @@ static const struct intel_display_device_info skl_display = {
 	.__runtime_defaults.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
 	.__runtime_defaults.cpu_transcoder_mask =
 	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
-	BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP),
+	BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) |
+	BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1),
 	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A),
 };
@@ -830,6 +837,7 @@ static const struct platform_desc cml_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
 		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_0), \
 	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C)
 
 static const enum intel_step bxt_steppings[] = {
@@ -884,6 +892,8 @@ static const struct platform_desc glk_desc = {
 		[TRANSCODER_EDP] = PIPE_EDP_OFFSET, \
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	}, \
 	.trans_offsets = { \
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
@@ -892,6 +902,8 @@ static const struct platform_desc glk_desc = {
 		[TRANSCODER_EDP] = TRANSCODER_EDP_OFFSET, \
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	}, \
 	IVB_CURSOR_OFFSETS, \
 	ICL_COLORS, \
@@ -905,6 +917,7 @@ static const struct platform_desc glk_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1), \
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A)
 
 static const u16 icl_port_f_ids[] = {
@@ -975,6 +988,8 @@ static const struct platform_desc ehl_desc = {
 		[TRANSCODER_D] = PIPE_D_OFFSET, \
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	}, \
 	.trans_offsets = { \
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
@@ -983,6 +998,8 @@ static const struct platform_desc ehl_desc = {
 		[TRANSCODER_D] = TRANSCODER_D_OFFSET, \
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	}, \
 	TGL_CURSOR_OFFSETS, \
 	ICL_COLORS, \
@@ -997,6 +1014,7 @@ static const struct platform_desc ehl_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1), \
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A)
 
 static const u16 tgl_uy_ids[] = {
@@ -1142,6 +1160,8 @@ static const struct platform_desc adl_s_desc = {
 		[TRANSCODER_D] = PIPE_D_OFFSET,					\
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,				\
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,				\
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	},									\
 	.trans_offsets = {							\
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET,				\
@@ -1150,6 +1170,8 @@ static const struct platform_desc adl_s_desc = {
 		[TRANSCODER_D] = TRANSCODER_D_OFFSET,				\
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,			\
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,			\
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	},									\
 	TGL_CURSOR_OFFSETS,							\
 										\
@@ -1169,7 +1191,8 @@ static const struct intel_display_device_info xe_lpd_display = {
 	.__runtime_defaults.cpu_transcoder_mask =
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |
-		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),
+		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1) |
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1),
 	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) |
 		BIT(PORT_TC1) | BIT(PORT_TC2) | BIT(PORT_TC3) | BIT(PORT_TC4),
 };
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 4308822f0415..779043ee744b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -261,7 +261,7 @@ struct intel_display_runtime_info {
 	u32 rawclk_freq;
 
 	u8 pipe_mask;
-	u8 cpu_transcoder_mask;
+	u16 cpu_transcoder_mask;
 	u16 port_mask;
 
 	u8 num_sprites[I915_MAX_PIPES];
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab..67978c1b71ad 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -45,6 +45,8 @@ enum transcoder {
 	TRANSCODER_DSI_1,
 	TRANSCODER_DSI_A = TRANSCODER_DSI_0,	/* legacy DSI */
 	TRANSCODER_DSI_C = TRANSCODER_DSI_1,	/* legacy DSI */
+	TRANSCODER_WD_0,
+	TRANSCODER_WD_1,
 
 	I915_MAX_TRANSCODERS
 };
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 273054c22325..bdc924a42369 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -76,6 +76,10 @@ intel_display_power_domain_str(enum intel_display_power_domain domain)
 		return "TRANSCODER_DSI_A";
 	case POWER_DOMAIN_TRANSCODER_DSI_C:
 		return "TRANSCODER_DSI_C";
+	case POWER_DOMAIN_TRANSCODER_WD_0:
+		return "TRANSCODER_WD_0";
+	case POWER_DOMAIN_TRANSCODER_WD_1:
+		return "TRANSCODER_WD_1";
 	case POWER_DOMAIN_TRANSCODER_VDSC_PW2:
 		return "TRANSCODER_VDSC_PW2";
 	case POWER_DOMAIN_PORT_DDI_LANES_A:
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index f8813b0e16df..056677d62e54 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -40,6 +40,8 @@ enum intel_display_power_domain {
 	POWER_DOMAIN_TRANSCODER_EDP,
 	POWER_DOMAIN_TRANSCODER_DSI_A,
 	POWER_DOMAIN_TRANSCODER_DSI_C,
+	POWER_DOMAIN_TRANSCODER_WD_0,
+	POWER_DOMAIN_TRANSCODER_WD_1,
 
 	/* VDSC/joining for eDP/DSI transcoder (ICL) or pipe A (TGL) */
 	POWER_DOMAIN_TRANSCODER_VDSC_PW2,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8f8019d40d77..2064e2c2ec77 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -80,6 +80,7 @@ enum intel_output_type {
 	INTEL_OUTPUT_DSI = 9,
 	INTEL_OUTPUT_DDI = 10,
 	INTEL_OUTPUT_DP_MST = 11,
+	INTEL_OUTPUT_WRITEBACK = 12,
 };
 
 enum hdmi_force_audio {
-- 
2.34.1

