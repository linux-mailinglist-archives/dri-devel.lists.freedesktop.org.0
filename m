Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02B4A5A55
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B5E10EDAB;
	Tue,  1 Feb 2022 10:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81EB10E8E0;
 Tue,  1 Feb 2022 10:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712139; x=1675248139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+kKtCheJwix8ByGm3IyRlV93kkSzeQ/+KPOkXrvMts=;
 b=WaPRfFLZn2hQQ/uH+nPkTfT189/Zxuop78yNOwxHj0pOf9ZsmS4ohrm6
 w7cLI6klAcuYbeO4QGkHjBqi36EjJK5MaLUEHHiFHB10g/kKhysuaGEzG
 NzxC/IbmUNMXSMortKaJ5ok0hhRfb9vJj0OkEV9+eS9D7/9L1H2+0TPnN
 9ynu0htefVHOM3y49Cr7VrfndZBcBrYDKDmz4vJgzfNEdzkKemGkozE64
 sofSE4ql+lyDQp3jb5Kf/PznF50uJfj6fhs5G8rJXvvNuC8J+cqq0rnp6
 8loIF8eIt5gfKfjt+GPO/VSqJ0MklmU/MQ5sxi23UWsg+vFfbe/0YL/YZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020677"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020677"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011339"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:16 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 16/19] uapi/drm/dg2: Introduce format modifier for DG2
 clear color
Date: Tue,  1 Feb 2022 16:11:29 +0530
Message-Id: <20220201104132.3050-17-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mika Kahola <mika.kahola@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

DG2 clear color render compression uses Tile4 layout. Therefore, we need
to define a new format modifier for uAPI to support clear color rendering.

v2:
  Display version is fixed. [Imre]
  KDoc is enhanced for cc modifier. [Nanley & Lionel]

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c            |  8 ++++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 ++++++++-
 include/uapi/drm/drm_fourcc.h                      | 10 ++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 4d4d01963f15..3df6ef5ffec5 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -144,6 +144,12 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
 		.display_ver = { 13, 13 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
+		.display_ver = { 13, 13 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC_CC,
+
+		.ccs.cc_planes = BIT(1),
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
 		.display_ver = { 13, 13 },
@@ -559,6 +565,7 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 		else
 			return 512;
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED:
 		/*
@@ -763,6 +770,7 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 		return 16 * 1024;
 	default:
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c38ae0876c15..b4dced1907c5 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -772,6 +772,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_4 |
 			PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
 			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -2358,10 +2360,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		break;
 	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
 		if (HAS_4TILE(dev_priv)) {
-			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+			u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+				      PLANE_CTL_CLEAR_COLOR_DISABLE;
+
+			if ((val & rc_mask) == rc_mask)
 				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
 			else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
 				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
+			else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
 			else
 				fb->modifier = I915_FORMAT_MOD_4_TILED;
 		} else {
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index b8fb7b44c03c..697614ea4b84 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -605,6 +605,16 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 clear color render compression.
+ *
+ * DG2 uses a unified compression format for clear color render compression.
+ * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
+ *
+ * Fast clear color value expected by HW is located in fb at offset 0 of plane#1
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

