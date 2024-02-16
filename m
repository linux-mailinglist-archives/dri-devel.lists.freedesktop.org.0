Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A78857F42
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5EF10E25A;
	Fri, 16 Feb 2024 14:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/u+681L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D35F10EA93;
 Fri, 16 Feb 2024 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708093535; x=1739629535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wxR17ehsue9GKB4EIFuqpMTwfLVOUANpbIVGlt1fYUo=;
 b=W/u+681L1kEivvaInqiSQDj198rAQu/9QTexCI6GIXKeRnqAT/YsrZVQ
 zQi6q/lbAYPA4gqdCi/YcFCtLw2HrbNXvh0uc4IxDHQGznaRlF03fWdk8
 o3yAZeskFMyBpyIbbWDqJkNqIAdhIKfvRemnxcMycsTYXvCekPQpQysgx
 ev9YVr9pxiMbvgZJZM07zccsB0eulFgU5VuhifwJ4YAdkRp2PCTbbAZE4
 7WXjd5C3ONlZ7I1R1ewvztqXrfPjCz+0sQxTIqkVPNXnSN/KxXMvfdjXb
 ZcmG1U9Evtu5Y6Dc1hIZSCDaM4UmDAgx/zSOo7rZtKfYbitoQZxWYIW+g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2372051"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2372051"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="34639164"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 16 Feb 2024 06:25:33 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 5/6] drm/i915/display: Compute vrr_vsync params
Date: Fri, 16 Feb 2024 19:48:27 +0530
Message-Id: <20240216141828.1884193-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240216141828.1884193-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240216141828.1884193-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute vrr_vsync_start/end  which sets the position
for hardware to send the Vsync at a fixed position
relative to the end of the Vblank.

--v2:
- Update, VSYNC_START/END macros to VRR_VSYNC_START/END.(Ankit)
- Update bit fields of VRR_VSYNC_START/END.(Ankit)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |  7 +++++++
 drivers/gpu/drm/i915/i915_reg.h                    | 11 +++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index a6991bc3f07b..015ed846b896 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1414,6 +1414,7 @@ struct intel_crtc_state {
 		bool enable, in_range;
 		u8 pipeline_full;
 		u16 flipline, vmin, vmax, guardband;
+		u32 vsync_end, vsync_start;
 	} vrr;
 
 	/* Stream Splitter for eDP MSO */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 5d905f932cb4..2fa0004d00c7 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -149,6 +149,13 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 
 	crtc_state->vrr.flipline = crtc_state->vrr.vmin + 1;
 
+	crtc_state->vrr.vsync_start =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
+	crtc_state->vrr.vsync_end =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			(VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) >> 16));
+
 	/*
 	 * For XE_LPD+, we use guardband and pipeline override
 	 * is deprecated.
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c02ea07af4c2..f73e95b18819 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1955,6 +1955,10 @@
 #define   VSYNC_END(vsync_end)		REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
 #define   VSYNC_START_MASK		REG_GENMASK(15, 0)
 #define   VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))
+#define   VSYNC_END_MASK		REG_GENMASK(31, 16)
+#define   VSYNC_END(vsync_end)		REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
+#define   VSYNC_START_MASK		REG_GENMASK(15, 0)
+#define   VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))
 #define _TRANS_EXITLINE_A	0x60018
 #define _PIPEASRC		0x6001c
 #define   PIPESRC_WIDTH_MASK	REG_GENMASK(31, 16)
@@ -2007,7 +2011,9 @@
 #define _TRANS_VRR_CTL_B		0x61420
 #define _TRANS_VRR_CTL_C		0x62420
 #define _TRANS_VRR_CTL_D		0x63420
+#define _TRANS_VRR_VSYNC_A		0x60078
 #define TRANS_VRR_CTL(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_CTL_A)
+#define TRANS_VRR_VSYNC(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_VSYNC_A)
 #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
 #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
 #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
@@ -2087,6 +2093,11 @@
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

