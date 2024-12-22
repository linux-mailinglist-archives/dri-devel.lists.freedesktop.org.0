Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5F39FA30A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 01:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D732310E083;
	Sun, 22 Dec 2024 00:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="oUaGQKt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9A710E12B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 00:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=oEGtID3dfqDsPfrY5IfhY+Qz9vCN6+uuEv9bkElTmqU=; b=oUaGQKt5AF9jw5IA
 3aVLiRpFyLzFMSarYjIsSIYmR7/DDofRJD787HKGZbmQNwRoYfseuplMEDyVt7WVGYeam8l4ojZ4w
 mxCObk0FVDLqnVnRy7BbdIIedapxDjwzE+cJeoEdxK5mIpf+kgLoCoZhdBVQYjH57vw6sV9kwp1eY
 tpmcZBYbIUYlScZtSk0N75h2hL2r8BwkAUUciDeurWJR+1l9B1CaY3/3EkFSAC191hUkUZntAaGuN
 +6dj4b/nbp3pwFx9WU+h4+gGNiilAosXKwSPQtSg5oT4q2nBX7nDT1Z69ha2wYopcoBcbjW5xmcRU
 V+J1K6FGhRSuI6pN9w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tP9i9-006iX5-2u;
 Sun, 22 Dec 2024 00:20:45 +0000
From: linux@treblig.org
To: zhenyuw@linux.intel.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] drm/i915/gvt: Remove unused intel_vgpu_decode_sprite_plane
Date: Sun, 22 Dec 2024 00:20:42 +0000
Message-ID: <20241222002043.173080-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222002043.173080-1-linux@treblig.org>
References: <20241222002043.173080-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

intel_vgpu_decode_sprite_plane() was added in 2017 by
commit 9f31d1063b43 ("drm/i915/gvt: Add framebuffer decoder support")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gvt/fb_decoder.c | 117 --------------------------
 drivers/gpu/drm/i915/gvt/fb_decoder.h |   2 -
 2 files changed, 119 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index c454e25b2b0f..a37322914f5e 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -395,120 +395,3 @@ int intel_vgpu_decode_cursor_plane(struct intel_vgpu *vgpu,
 	plane->y_hot = vgpu_vreg_t(vgpu, vgtif_reg(cursor_y_hot));
 	return 0;
 }
-
-#define SPRITE_FORMAT_NUM	(1 << 3)
-
-static const struct pixel_format sprite_pixel_formats[SPRITE_FORMAT_NUM] = {
-	[0x0] = {DRM_FORMAT_YUV422, 16, "YUV 16-bit 4:2:2 packed"},
-	[0x1] = {DRM_FORMAT_XRGB2101010, 32, "RGB 32-bit 2:10:10:10"},
-	[0x2] = {DRM_FORMAT_XRGB8888, 32, "RGB 32-bit 8:8:8:8"},
-	[0x4] = {DRM_FORMAT_AYUV, 32,
-		"YUV 32-bit 4:4:4 packed (8:8:8:8 MSB-X:Y:U:V)"},
-};
-
-/**
- * intel_vgpu_decode_sprite_plane - Decode sprite plane
- * @vgpu: input vgpu
- * @plane: sprite plane to save decoded info
- * This function is called for decoding plane
- *
- * Returns:
- * 0 on success, non-zero if failed.
- */
-int intel_vgpu_decode_sprite_plane(struct intel_vgpu *vgpu,
-	struct intel_vgpu_sprite_plane_format *plane)
-{
-	u32 val, fmt;
-	u32 color_order, yuv_order;
-	int drm_format;
-	int pipe;
-
-	pipe = get_active_pipe(vgpu);
-	if (pipe >= I915_MAX_PIPES)
-		return -ENODEV;
-
-	val = vgpu_vreg_t(vgpu, SPRCTL(pipe));
-	plane->enabled = !!(val & SPRITE_ENABLE);
-	if (!plane->enabled)
-		return -ENODEV;
-
-	plane->tiled = !!(val & SPRITE_TILED);
-	color_order = !!(val & SPRITE_RGB_ORDER_RGBX);
-	yuv_order = (val & SPRITE_YUV_ORDER_MASK) >>
-				_SPRITE_YUV_ORDER_SHIFT;
-
-	fmt = (val & SPRITE_FORMAT_MASK) >> _SPRITE_FMT_SHIFT;
-	if (!sprite_pixel_formats[fmt].bpp) {
-		gvt_vgpu_err("Non-supported pixel format (0x%x)\n", fmt);
-		return -EINVAL;
-	}
-	plane->hw_format = fmt;
-	plane->bpp = sprite_pixel_formats[fmt].bpp;
-	drm_format = sprite_pixel_formats[fmt].drm_format;
-
-	/* Order of RGB values in an RGBxxx buffer may be ordered RGB or
-	 * BGR depending on the state of the color_order field
-	 */
-	if (!color_order) {
-		if (drm_format == DRM_FORMAT_XRGB2101010)
-			drm_format = DRM_FORMAT_XBGR2101010;
-		else if (drm_format == DRM_FORMAT_XRGB8888)
-			drm_format = DRM_FORMAT_XBGR8888;
-	}
-
-	if (drm_format == DRM_FORMAT_YUV422) {
-		switch (yuv_order) {
-		case 0:
-			drm_format = DRM_FORMAT_YUYV;
-			break;
-		case 1:
-			drm_format = DRM_FORMAT_UYVY;
-			break;
-		case 2:
-			drm_format = DRM_FORMAT_YVYU;
-			break;
-		case 3:
-			drm_format = DRM_FORMAT_VYUY;
-			break;
-		default:
-			/* yuv_order has only 2 bits */
-			break;
-		}
-	}
-
-	plane->drm_format = drm_format;
-
-	plane->base = vgpu_vreg_t(vgpu, SPRSURF(pipe)) & I915_GTT_PAGE_MASK;
-	if (!vgpu_gmadr_is_valid(vgpu, plane->base))
-		return  -EINVAL;
-
-	plane->base_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm, plane->base);
-	if (plane->base_gpa == INTEL_GVT_INVALID_ADDR) {
-		gvt_vgpu_err("Translate sprite plane gma 0x%x to gpa fail\n",
-				plane->base);
-		return  -EINVAL;
-	}
-
-	plane->stride = vgpu_vreg_t(vgpu, SPRSTRIDE(pipe)) &
-				_SPRITE_STRIDE_MASK;
-
-	val = vgpu_vreg_t(vgpu, SPRSIZE(pipe));
-	plane->height = (val & _SPRITE_SIZE_HEIGHT_MASK) >>
-		_SPRITE_SIZE_HEIGHT_SHIFT;
-	plane->width = (val & _SPRITE_SIZE_WIDTH_MASK) >>
-		_SPRITE_SIZE_WIDTH_SHIFT;
-	plane->height += 1;	/* raw height is one minus the real value */
-	plane->width += 1;	/* raw width is one minus the real value */
-
-	val = vgpu_vreg_t(vgpu, SPRPOS(pipe));
-	plane->x_pos = (val & _SPRITE_POS_X_MASK) >> _SPRITE_POS_X_SHIFT;
-	plane->y_pos = (val & _SPRITE_POS_Y_MASK) >> _SPRITE_POS_Y_SHIFT;
-
-	val = vgpu_vreg_t(vgpu, SPROFFSET(pipe));
-	plane->x_offset = (val & _SPRITE_OFFSET_START_X_MASK) >>
-			   _SPRITE_OFFSET_START_X_SHIFT;
-	plane->y_offset = (val & _SPRITE_OFFSET_START_Y_MASK) >>
-			   _SPRITE_OFFSET_START_Y_SHIFT;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.h b/drivers/gpu/drm/i915/gvt/fb_decoder.h
index fa6503900c84..436d43c0087b 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.h
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.h
@@ -156,7 +156,5 @@ int intel_vgpu_decode_primary_plane(struct intel_vgpu *vgpu,
 	struct intel_vgpu_primary_plane_format *plane);
 int intel_vgpu_decode_cursor_plane(struct intel_vgpu *vgpu,
 	struct intel_vgpu_cursor_plane_format *plane);
-int intel_vgpu_decode_sprite_plane(struct intel_vgpu *vgpu,
-	struct intel_vgpu_sprite_plane_format *plane);
 
 #endif
-- 
2.47.1

