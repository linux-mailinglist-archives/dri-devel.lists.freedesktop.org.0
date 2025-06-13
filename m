Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94BAD830C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E4710E8D8;
	Fri, 13 Jun 2025 06:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJrni2nU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0371410E8CF;
 Fri, 13 Jun 2025 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749795372; x=1781331372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sij+Hv8aL0QUWOy9lIGka0Gz/i4PzQl1702vyaNscCs=;
 b=oJrni2nUDzP6Vbql7as+gAFZxGbVDxYwFI9+kmE7NRkWRG6hz4VIkH+5
 9ht7FKc2el4ofwr43dE37lP+RqmqQl8Ks6wDIs4NKgPOBhNjq3fZVwatW
 MqtGQcAoZu4XRSL0wq8fF5rdQLSCdJRV3kt7EtFwAxHpCUiwmvNojY9Lv
 kkOEJOT8Jn0Vktw6Hjq9TKn+sH4pRBK8Vu9GatGGGrLimiC0EDiiHoq2Y
 424LO8e6GepjORRwrAswR0d3mTFq96BxoQPs9iZVjgrD1kBKzGWs6P00p
 A8TJL3UwRMRuz6oAH7/XFXpsFHhhWKfyCPMjZ2Qmx5ghzBXbxIKLQZ++g A==;
X-CSE-ConnectionGUID: Kd6vKsUQQhWJEM/HJIUGhQ==
X-CSE-MsgGUID: quej/9ftRoyYaEhO+Ni7jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39608852"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="39608852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:16:12 -0700
X-CSE-ConnectionGUID: R/flCUzbS3i4+hqzDObjtw==
X-CSE-MsgGUID: HuHf6+O+Rb6PehR0Nn6cDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152717241"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 23:16:10 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 3/4] drm/i915/writeback: Add some preliminary writeback
 definitions
Date: Fri, 13 Jun 2025 11:45:49 +0530
Message-Id: <20250613061550.2893526-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613061550.2893526-1-suraj.kandpal@intel.com>
References: <20250613061550.2893526-1-suraj.kandpal@intel.com>
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

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 3b54a62c290a..ae474cbeb791 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -82,6 +82,10 @@ static inline const char *transcoder_name(enum transcoder transcoder)
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
index 90d714598664..2b187472e752 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -21,6 +21,7 @@
 #include "intel_display_types.h"
 #include "intel_fbc.h"
 #include "intel_step.h"
+#include "intel_writeback_reg.h"
 
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field initialization overrides for display info");
@@ -144,12 +145,16 @@ static const struct intel_display_device_info no_display = {};
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
@@ -677,7 +682,8 @@ static const struct intel_display_device_info skl_display = {
 	.__runtime_defaults.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
 	.__runtime_defaults.cpu_transcoder_mask =
 	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
-	BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP),
+	BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) |
+	BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1),
 	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | BIT(PORT_D) | BIT(PORT_E),
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A),
 };
@@ -829,6 +835,7 @@ static const struct platform_desc cml_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
 		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_0), \
 	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C)
 
 static const enum intel_step bxt_steppings[] = {
@@ -883,6 +890,8 @@ static const struct platform_desc glk_desc = {
 		[TRANSCODER_EDP] = PIPE_EDP_OFFSET, \
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	}, \
 	.trans_offsets = { \
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
@@ -891,6 +900,8 @@ static const struct platform_desc glk_desc = {
 		[TRANSCODER_EDP] = TRANSCODER_EDP_OFFSET, \
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	}, \
 	IVB_CURSOR_OFFSETS, \
 	ICL_COLORS, \
@@ -904,6 +915,7 @@ static const struct platform_desc glk_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1), \
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A)
 
 static const u16 icl_port_f_ids[] = {
@@ -974,6 +986,8 @@ static const struct platform_desc ehl_desc = {
 		[TRANSCODER_D] = PIPE_D_OFFSET, \
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	}, \
 	.trans_offsets = { \
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
@@ -982,6 +996,8 @@ static const struct platform_desc ehl_desc = {
 		[TRANSCODER_D] = TRANSCODER_D_OFFSET, \
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	}, \
 	TGL_CURSOR_OFFSETS, \
 	ICL_COLORS, \
@@ -996,6 +1012,7 @@ static const struct platform_desc ehl_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1), \
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A)
 
 static const u16 tgl_uy_ids[] = {
@@ -1141,6 +1158,8 @@ static const struct platform_desc adl_s_desc = {
 		[TRANSCODER_D] = PIPE_D_OFFSET,					\
 		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,				\
 		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,				\
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET, \
 	},									\
 	.trans_offsets = {							\
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET,				\
@@ -1149,6 +1168,8 @@ static const struct platform_desc adl_s_desc = {
 		[TRANSCODER_D] = TRANSCODER_D_OFFSET,				\
 		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,			\
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,			\
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET, \
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET, \
 	},									\
 	TGL_CURSOR_OFFSETS,							\
 										\
@@ -1168,7 +1189,8 @@ static const struct intel_display_device_info xe_lpd_display = {
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
index 87c666792c0d..0f023826287a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -259,7 +259,7 @@ struct intel_display_runtime_info {
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
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d6d0440dcee9..24e682d45b1b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -79,6 +79,7 @@ enum intel_output_type {
 	INTEL_OUTPUT_DSI = 9,
 	INTEL_OUTPUT_DDI = 10,
 	INTEL_OUTPUT_DP_MST = 11,
+	INTEL_OUTPUT_WRITEBACK = 12,
 };
 
 enum hdmi_force_audio {
-- 
2.34.1

