Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3B46EFF0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563910F200;
	Thu,  9 Dec 2021 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1343891D4;
 Thu,  9 Dec 2021 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064803; x=1670600803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OlL+gZZbnMSDuqtV81u4kMOiLsRp8FFYXagysWNZNo=;
 b=HRIv6+dIwpzsuj9I1CwLxCqWE7dU5Co0Worj0R9N7l24BKULUwfPUwkj
 6qobDBeLhguBwwZFd/PzzImLXzYEcvLV80Z9e9TiIZQoe7cNHavMDsVNr
 AvoO3CHgTZpvBWgP28vvRFVmDzkx+dMUrthBCXDoEC68qa6E0bNNFCPjC
 XP3hpoNzWSyhc4h3k5PrZd8Ywry12/YMrUSMOw10v9zF4vEAQR8n4l8K1
 oB3bPWZSYF/llcGwmVgwQLHBSvnPmimO1cIIlcSv6vtkT5BEZnHfM+mCR
 6FzzvqxteXTAc4BUB7+tCeR2MQwrfQQEgUDOdxBKslrYzJeyPLCFXasyt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917123"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917123"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535237"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:25 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 13/16] drm/i915/dg2: Flat CCS Support
Date: Thu,  9 Dec 2021 21:15:30 +0530
Message-Id: <20211209154533.4084-14-ramalingam.c@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

DG2 onwards discrete gfx has support for new flat CCS mapping,
which brings in display feature in to avoid Aux walk for compressed
surface. This support build on top of Flat CCS support added in XEHPSDV.
FLAT CCS surface base address should be 64k aligned,
Compressed displayable surfaces must use tile4 format.

HAS: 1407880786
B.Spec : 7655
B.Spec : 53902

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  4 ++-
 drivers/gpu/drm/i915/display/intel_fb.c       | 32 +++++++++++++------
 .../drm/i915/display/skl_universal_plane.c    | 14 +++++---
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 83253c62b6d6..fd84ed0da41c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8628,7 +8628,9 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 
 		/*
 		 * The layout of the fast clear color value expected by HW
-		 * (the DRM ABI requiring this value to be located in fb at offset 0 of plane#2):
+		 * (the DRM ABI requiring this value to be located in fb at
+		 * offset 0 of cc plane, plane #2 previous generations or
+		 * plane #1 for flat ccs):
 		 * - 4 x 4 bytes per-channel value
 		 *   (in surface type specific float/int format provided by the fb user)
 		 * - 8 bytes native color value used by the display
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f10e77cb5b4a..72040f580911 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -107,6 +107,21 @@ static const struct drm_format_info gen12_ccs_cc_formats[] = {
 	  .hsub = 1, .vsub = 1, .has_alpha = true },
 };
 
+static const struct drm_format_info gen12_flat_ccs_cc_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, .has_alpha = true },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, .has_alpha = true },
+};
+
 struct intel_modifier_desc {
 	u64 modifier;
 	struct {
@@ -150,6 +165,8 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC_CC,
 
 		.ccs.cc_planes = BIT(1),
+
+		FORMAT_OVERRIDE(gen12_flat_ccs_cc_formats),
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
 		.display_ver = { 13, 14 },
@@ -399,17 +416,13 @@ bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier)
 static bool format_is_yuv_semiplanar(const struct intel_modifier_desc *md,
 				     const struct drm_format_info *info)
 {
-	int yuv_planes;
-
 	if (!info->is_yuv)
 		return false;
 
-	if (plane_caps_contain_any(md->plane_caps, INTEL_PLANE_CAP_CCS_MASK))
-		yuv_planes = 4;
+	if (hweight8(md->ccs.planar_aux_planes) == 2)
+		return info->num_planes == 4;
 	else
-		yuv_planes = 2;
-
-	return info->num_planes == yuv_planes;
+		return info->num_planes == 2;
 }
 
 /**
@@ -534,12 +547,13 @@ static unsigned int gen12_ccs_aux_stride(struct intel_framebuffer *fb, int ccs_p
 
 int skl_main_to_aux_plane(const struct drm_framebuffer *fb, int main_plane)
 {
+	const struct intel_modifier_desc *md = lookup_modifier(fb->modifier);
 	struct drm_i915_private *i915 = to_i915(fb->dev);
 
-	if (intel_fb_is_ccs_modifier(fb->modifier))
+	if (md->ccs.packed_aux_planes | md->ccs.planar_aux_planes)
 		return main_to_ccs_plane(fb, main_plane);
 	else if (DISPLAY_VER(i915) < 11 &&
-		 intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
+		 format_is_yuv_semiplanar(md, fb->format))
 		return 1;
 	else
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 9a89df9c0243..ed2883409e91 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1136,7 +1136,9 @@ skl_program_plane_arm(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, PLANE_OFFSET(pipe, plane_id),
 			  (y << 16) | x);
 
-	intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id), aux_dist);
+	/* FLAT CCS doesn't need to program AUX_DIST */
+	if (!HAS_FLAT_CCS(dev_priv))
+		intel_de_write_fw(dev_priv, PLANE_AUX_DIST(pipe, plane_id), aux_dist);
 
 	if (DISPLAY_VER(dev_priv) < 11)
 		intel_de_write_fw(dev_priv, PLANE_AUX_OFFSET(pipe, plane_id),
@@ -1543,9 +1545,10 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 
 	/*
 	 * CCS AUX surface doesn't have its own x/y offsets, we must make sure
-	 * they match with the main surface x/y offsets.
+	 * they match with the main surface x/y offsets. On DG2
+	 * there's no aux plane on fb so skip this checking.
 	 */
-	if (intel_fb_is_ccs_modifier(fb->modifier)) {
+	if (intel_fb_is_ccs_modifier(fb->modifier) && aux_plane) {
 		while (!skl_check_main_ccs_coordinates(plane_state, x, y,
 						       offset, aux_plane)) {
 			if (offset == 0)
@@ -1589,6 +1592,8 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	int uv_plane = 1;
+	int ccs_plane = intel_fb_is_ccs_modifier(fb->modifier) ?
+			skl_main_to_aux_plane(fb, uv_plane) : 0;
 	int max_width = intel_plane_max_width(plane, fb, uv_plane, rotation);
 	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
 	int x = plane_state->uapi.src.x1 >> 17;
@@ -1609,8 +1614,7 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 	offset = intel_plane_compute_aligned_offset(&x, &y,
 						    plane_state, uv_plane);
 
-	if (intel_fb_is_ccs_modifier(fb->modifier)) {
-		int ccs_plane = main_to_ccs_plane(fb, uv_plane);
+	if (ccs_plane) {
 		u32 aux_offset = plane_state->view.color_plane[ccs_plane].offset;
 		u32 alignment = intel_surf_alignment(fb, uv_plane);
 
-- 
2.20.1

