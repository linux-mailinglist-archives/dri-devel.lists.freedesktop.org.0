Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F846EFFE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357710F445;
	Thu,  9 Dec 2021 16:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A04891BB;
 Thu,  9 Dec 2021 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064796; x=1670600796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Ms4o8MOBp9yV/IwgCjbnr1MGM81PSz+4/En43u0BfE=;
 b=e9NfwvwZfYC/xF7lpVFL0TaSZW0w2WHzL/Uf2y4NzWhDQ2b+V1b0opk2
 hCVKcGj2zU4OcOlNFc9v/XG7MwfZ/i8Zl1ng1kMqy2i6rslZoUstnUN4u
 8eNqzgnm/rnXcwJ9qjbpUkipyOwDn84i2I2/gtDbTef7y55IPkhzo9uuY
 YGK0E06/FTbj3zJqKPOMrclDHopYu/1dy9IUlal+3C+J17POWgYTn348U
 Su/ac6e5voKtPFcqnfNaW07ImTqRz9FATFJzsyQ7bbv30gibvy4bV/ddi
 V8pIzMLSKR1RW2438ScBWnf7PLAhoNVK4oHfdep1uBWwjB0ApmS6PsTF6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917074"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917074"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535223"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:19 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 11/16] drm/i915/dg2: Add DG2 unified compression
Date: Thu,  9 Dec 2021 21:15:28 +0530
Message-Id: <20211209154533.4084-12-ramalingam.c@intel.com>
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

DG2 unifies render compression and media compression into a single
format for the first time.  The programming and buffer layout is
supposed to match compression on older gen12 platforms, but the actual
compression algorithm is different from any previous platform; as such,
we need a new framebuffer modifier to represent buffers in this format,
but otherwise we can re-use the existing gen12 compression driver logic.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c       | 13 ++++++++
 .../drm/i915/display/skl_universal_plane.c    | 33 +++++++++++++++----
 include/uapi/drm/drm_fourcc.h                 | 22 +++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 46505c69fe72..e15216f1cb82 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -141,6 +141,14 @@ struct intel_modifier_desc {
 
 static const struct intel_modifier_desc intel_modifiers[] = {
 	{
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
+		.display_ver = { 13, 14 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
+		.display_ver = { 13, 14 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC,
+	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED,
 		.display_ver = { 13, 14 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4,
@@ -550,6 +558,8 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED:
 		/*
 		 * Each 4K tile consists of 64B(8*8) subtiles, with
@@ -752,6 +762,9 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return 16 * 1024;
 	default:
 		MISSING_CASE(fb->modifier);
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index f62ba027fcf9..d80424194c75 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -764,6 +764,14 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_Y;
 	case I915_FORMAT_MOD_4_TILED:
 		return PLANE_CTL_TILED_4;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+		return PLANE_CTL_TILED_4 |
+			PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return PLANE_CTL_TILED_4 |
+			PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -2073,6 +2081,10 @@ static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
 	if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
 		return false;
 
+	/* Wa_14013215631 */
+	if (IS_DG2_DISPLAY_STEP(i915, STEP_A0, STEP_C0))
+		return false;
+
 	return plane_id < PLANE_SPRITE4;
 }
 
@@ -2312,18 +2324,25 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		break;
 	case PLANE_CTL_TILED_Y:
 		plane_config->tiling = I915_TILING_Y;
-		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
-			fb->modifier = DISPLAY_VER(dev_priv) >= 12 ?
-				I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS :
-				I915_FORMAT_MOD_Y_TILED_CCS;
-		else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
+		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE) {
+			if (DISPLAY_VER(dev_priv) >= 12)
+				fb->modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
+			else
+				fb->modifier = I915_FORMAT_MOD_Y_TILED_CCS;
+		} else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE) {
 			fb->modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
-		else
+		} else {
 			fb->modifier = I915_FORMAT_MOD_Y_TILED;
+		}
 		break;
 	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
 		if (HAS_4TILE(dev_priv)) {
-			fb->modifier = I915_FORMAT_MOD_4_TILED;
+			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
+			else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
+			else
+				fb->modifier = I915_FORMAT_MOD_4_TILED;
 		} else {
 			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 				fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a146c6df1066..51fdda26844a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -576,6 +576,28 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 render compression.
+ *
+ * DG2 uses a new compression format for render compression. The general
+ * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
+ * but a new hashing/compression algorithm is used, so a fresh modifier must
+ * be associated with buffers of this type. Render compression uses 128 byte
+ * compression blocks.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 media compression.
+ *
+ * DG2 uses a new compression format for media compression. The general
+ * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
+ * but a new hashing/compression algorithm is used, so a fresh modifier must
+ * be associated with buffers of this type. Media compression uses 256 byte
+ * compression blocks.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

