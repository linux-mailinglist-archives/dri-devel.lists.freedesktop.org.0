Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282246EFEA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B7010F0D8;
	Thu,  9 Dec 2021 16:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90AF891BB;
 Thu,  9 Dec 2021 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064800; x=1670600800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YZINTUP80qemEcthVKIBo9gnQMSH6wAfWHwcFROzz4=;
 b=TMVzhsAt485Uep39+3y1gULjGuG2WwdTwG4JBew+V1u7fbryWjRdExpL
 jKVSQ7EM4WuutE+mTumFeRfKgvxtQtPyw/VHdQHjtBT1kFvgVgdhKA1kh
 7tGZNSgdXmTtDkGlKsagD2xeRyS4A9Qv5wt4ern6t84p3VgC0gvasyx2P
 JkcfqtJP8IO7u+Xpjzn8LrOJ2qxf0Pbwe4WM8EOBuQ16XHUJqCi4fNJRj
 BxNM9uBINUWYkfiwHt3IU5eVN1tNPWWfvOjqNEVlKl57909Xa8ThCbUv8
 J5wQsteq8GiI0t1wlwQiNCf1+WCChnbAaNWwfBgMHmTKrk/yvEzoDYfem Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917101"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917101"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535234"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:22 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 12/16] uapi/drm/dg2: Introduce format modifier for DG2
 clear color
Date: Thu,  9 Dec 2021 21:15:29 +0530
Message-Id: <20211209154533.4084-13-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
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
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

DG2 clear color render compression uses Tile4 layout. Therefore, we need
to define a new format modifier for uAPI to support clear color rendering.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c            | 8 ++++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ++++++++-
 include/uapi/drm/drm_fourcc.h                      | 8 ++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e15216f1cb82..f10e77cb5b4a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -144,6 +144,12 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
 		.display_ver = { 13, 14 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
+		.display_ver = { 13, 14 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC_CC,
+
+		.ccs.cc_planes = BIT(1),
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
 		.display_ver = { 13, 14 },
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
index d80424194c75..9a89df9c0243 100644
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
@@ -2337,10 +2339,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
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
index 51fdda26844a..b155f69f2344 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -598,6 +598,14 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 clear color render compression.
+ *
+ * DG2 uses a unified compression format for clear color render compression.
+ * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

