Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C902496766
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C252C10E471;
	Fri, 21 Jan 2022 21:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072C10E469
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:21 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id l1so17403095uap.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2v0L8VQ942jiJiIpwbrk4LLnTqcDXRGJH/mWw9tR4Q=;
 b=bPTi2JykklrWdc73gQ1kgIzKy1oWRQBa7B0giVz4xG1f6oNyU3UaugwSNIltHKKZNR
 lYljIl05AfY5V9pPOW+69/0QrGn/ZVCpV9Q2e+zlPNkTYcr9hsQjmogDqte+Td4K7YIV
 RFfjqOsdlNs+iymCLiL6l5ogHPvB2XiRBWZE3A4TMy3HT0LHCoeJWFCo1B6li0Zz3YqL
 EOJLHDMXdkZw+3EDrJF/tBQG5zjm/hxU9C3wpy2RXhI8nNqWs01QEk4BHkoXAJL9QRqO
 1zbu5ldX0uhe4JwgWN6V3SvxYEW5NIs6x/zbcInVvQFFAq1f6VHKl8YFRAlcGYkQQ4DP
 ubuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2v0L8VQ942jiJiIpwbrk4LLnTqcDXRGJH/mWw9tR4Q=;
 b=gvwzl0fPYW2P68zNiWd0FT1+rwlQlY4Qe4+sJDU9Efsu8YPKokUWu/W4CMQHiWhgDo
 4yZVwql82dTUFBL5V3RtzRO9uBGCyG2/u456elqBp079OHJ0gopEm2PhaAvDFFvTiQYZ
 zOaq+dY1Son3HN0Fmc1aHdXWNqtbjStOWjKyXLHqxd3hCWjpToihVa2wLxKbIY52ldgd
 tzX6M1DCblPRi+O1A7j3eEyWh7rTv4HtVKbkNBvWi51bSorXjNtTK2oSF1J2m67sZfb9
 6UavKFzeRkGXfwXIjqFk0tbSnz8XymuR5oRl9SRHwK7rxgUC89rD4VdjBTYVYQhzOJnx
 lFuQ==
X-Gm-Message-State: AOAM530bVZvUSoI4rNR706lKQGkSHYf5w72P6tjAwRI/E/I2oYufhzmA
 kZ4HyeZXgg9/iiUhbfUUl2g=
X-Google-Smtp-Source: ABdhPJxodpTbisddHjjMsJksDKkSkRE8adzemEnUG8+ZJTOQ5xO98tk/kJVfZSDzVFbwdVeXhPOHEQ==
X-Received: by 2002:a67:24c3:: with SMTP id k186mr2670916vsk.74.1642801160319; 
 Fri, 21 Jan 2022 13:39:20 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:20 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept new
 formats
Date: Fri, 21 Jan 2022 18:38:29 -0300
Message-Id: <20220121213831.47229-8-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the blend function only accepts XRGB_8888 and ARGB_8888
as a color input.

This patch refactors all the functions related to the plane composition
to overcome this limitation.

A new internal format(`struct pixel`) is introduced to deal with all
possible inputs. It consists of 16 bits fields that represent each of
the channels.

The pixels blend is done using this internal format. And new handlers
are being added to convert a specific format to/from this internal format.

So the blend operation depends on these handlers to convert to this common
format. The blended result, if necessary, is converted to the writeback
buffer format.

This patch introduces three major differences to the blend function.
1 - All the planes are blended at once.
2 - The blend calculus is done as per line instead of per pixel.
3 - It is responsible to calculates the CRC and writing the writeback
    buffer(if necessary).

These changes allow us to allocate way less memory in the intermediate
buffer to compute these operations. Because now we don't need to
have the entire intermediate image lines at once, just one line is
enough.

| Memory consumption (output dimensions) |
|:--------------------------------------:|
|       Current      |     This patch    |
|:------------------:|:-----------------:|
|   Width * Heigth   |     2 * Width     |

Beyond memory, we also have a minor performance benefit from all
these changes. Results running the IGT tests `*kms_cursor_crc*`:

|                 Frametime                  |
|:------------------------------------------:|
|  Implementation |  Current  |  This commit |
|:---------------:|:---------:|:------------:|
| frametime range |  8~22 ms  |    5~18 ms   |
|     Average     |  10.0 ms  |    7.3 ms    |

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Improves the performance drastically, by perfoming the operations
    per-line and not per-pixel(Pekka Paalanen).
    Minor improvements(Pekka Paalanen).

V3: Changes the code to blend the planes all at once. This improves
    performance, memory consumption, and removes much of the weirdness
    of the V2(Pekka Paalanen and me).
    Minor improvements(Pekka Paalanen and me).

V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
---
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c | 335 +++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_formats.c  | 138 +++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h  |  31 +++
 4 files changed, 333 insertions(+), 172 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 72f779cbfedd..1b28a6a32948 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -3,6 +3,7 @@ vkms-y := \
 	vkms_drv.o \
 	vkms_plane.o \
 	vkms_output.o \
+	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
 	vkms_writeback.o
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 95029d2ebcac..9f70fcf84fb9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,202 +9,210 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
+#include "vkms_formats.h"
 
-static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
-				 const struct vkms_frame_info *frame_info)
+static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
-	u32 pixel;
-	int src_offset = frame_info->offset + (y * frame_info->pitch)
-					    + (x * frame_info->cpp);
+	u32 new_color;
 
-	pixel = *(u32 *)&buffer[src_offset];
+	new_color = (src * 0xffff + dst * (0xffff - alpha));
 
-	return pixel;
+	return DIV_ROUND_UP(new_color, 0xffff);
 }
 
 /**
- * compute_crc - Compute CRC value on output frame
+ * pre_mul_alpha_blend - alpha blending equation
+ * @src_frame_info: source framebuffer's metadata
+ * @stage_buffer: The line with the pixels from src_plane
+ * @output_buffer: A line buffer that receives all the blends output
  *
- * @vaddr: address to final framebuffer
- * @frame_info: framebuffer's metadata
+ * Using the information from the `frame_info`, this blends only the
+ * necessary pixels from the `stage_buffer` to the `output_buffer`
+ * using premultiplied blend formula.
  *
- * returns CRC value computed using crc32 on the visible portion of
- * the final framebuffer at vaddr_out
+ * The current DRM assumption is that pixel color values have been already
+ * pre-multiplied with the alpha channel values. See more
+ * drm_plane_create_blend_mode_property(). Also, this formula assumes a
+ * completely opaque background.
  */
-static uint32_t compute_crc(const u8 *vaddr,
-			    const struct vkms_frame_info *frame_info)
+static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
+				struct line_buffer *stage_buffer,
+				struct line_buffer *output_buffer)
 {
-	int x, y;
-	u32 crc = 0, pixel = 0;
-	int x_src = frame_info->src.x1 >> 16;
-	int y_src = frame_info->src.y1 >> 16;
-	int h_src = drm_rect_height(&frame_info->src) >> 16;
-	int w_src = drm_rect_width(&frame_info->src) >> 16;
-
-	for (y = y_src; y < y_src + h_src; ++y) {
-		for (x = x_src; x < x_src + w_src; ++x) {
-			pixel = get_pixel_from_buffer(x, y, vaddr, frame_info);
-			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
-		}
+	int x, x_dst = frame_info->dst.x1;
+	int x_limit = drm_rect_width(&frame_info->dst);
+	struct line_buffer *out = output_buffer + x_dst;
+	struct line_buffer *in = stage_buffer;
+
+	for (x = 0; x < x_limit; x++) {
+		out[x].a = (u16)0xffff;
+		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
+		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
+		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
 	}
-
-	return crc;
 }
 
-static u8 blend_channel(u8 src, u8 dst, u8 alpha)
+static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 {
-	u32 pre_blend;
-	u8 new_color;
-
-	pre_blend = (src * 255 + dst * (255 - alpha));
-
-	/* Faster div by 255 */
-	new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
+	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
+		return true;
 
-	return new_color;
+	return false;
 }
 
 /**
- * alpha_blend - alpha blending equation
- * @argb_src: src pixel on premultiplied alpha mode
- * @argb_dst: dst pixel completely opaque
- *
- * blend pixels using premultiplied blend formula. The current DRM assumption
- * is that pixel color values have been already pre-multiplied with the alpha
- * channel values. See more drm_plane_create_blend_mode_property(). Also, this
- * formula assumes a completely opaque background.
- */
-static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
-{
-	u8 alpha;
-
-	alpha = argb_src[3];
-	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
-	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
-	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
-}
-
-/**
- * x_blend - blending equation that ignores the pixel alpha
- *
- * overwrites RGB color value from src pixel to dst pixel.
- */
-static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
-{
-	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
-}
-
-/**
- * blend - blend value at vaddr_src with value at vaddr_dst
- * @vaddr_dst: destination address
- * @vaddr_src: source address
- * @dst_frame_info: destination framebuffer's metadata
- * @src_frame_info: source framebuffer's metadata
- * @pixel_blend: blending equation based on plane format
+ * @wb_frame_info: The writeback frame buffer metadata
+ * @wb_fmt_func: The format tranformatio function to the wb buffer
+ * @crtc_state: The crtc state
+ * @plane_fmt_func: A format tranformation function to each plane
+ * @crc32: The crc output of the final frame
+ * @output_buffer: A buffer of a row that will receive the result of the blend(s)
+ * @stage_buffer: The line with the pixels from src_compositor
  *
- * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
- * equation according to the supported plane formats DRM_FORMAT_(A/XRGB8888)
- * and clearing alpha channel to an completely opaque background. This function
- * uses buffer's metadata to locate the new composite values at vaddr_dst.
+ * This function blends the pixels (Using the `pre_mul_alpha_blend`)
+ * from all planes, calculates the crc32 of the output from the former step,
+ * and, if necessary, convert and store the output to the writeback buffer.
  *
  * TODO: completely clear the primary plane (a = 0xff) before starting to blend
  * pixel color values
  */
-static void blend(void *vaddr_dst, void *vaddr_src,
-		  struct vkms_frame_info *dst_frame_info,
-		  struct vkms_frame_info *src_frame_info,
-		  void (*pixel_blend)(const u8 *, u8 *))
+static void blend(struct vkms_frame_info *wb_frame_info,
+		  format_transform_func wb_fmt_func,
+		  struct vkms_crtc_state *crtc_state,
+		  format_transform_func *plane_fmt_func,
+		  u32 *crc32, struct line_buffer *stage_buffer,
+		  struct line_buffer *output_buffer, s64 row_size)
 {
-	int i, j, j_dst, i_dst;
-	int offset_src, offset_dst;
-	u8 *pixel_dst, *pixel_src;
-
-	int x_src = src_frame_info->src.x1 >> 16;
-	int y_src = src_frame_info->src.y1 >> 16;
-
-	int x_dst = src_frame_info->dst.x1;
-	int y_dst = src_frame_info->dst.y1;
-	int h_dst = drm_rect_height(&src_frame_info->dst);
-	int w_dst = drm_rect_width(&src_frame_info->dst);
+	struct vkms_plane_state **plane = crtc_state->active_planes;
+	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
+	u32 n_active_planes = crtc_state->num_active_planes;
 
+	int y_src = primary_plane_info->dst.y1;
+	int h_dst = drm_rect_height(&primary_plane_info->dst);
 	int y_limit = y_src + h_dst;
-	int x_limit = x_src + w_dst;
-
-	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
-		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
-			offset_dst = dst_frame_info->offset
-				     + (i_dst * dst_frame_info->pitch)
-				     + (j_dst++ * dst_frame_info->cpp);
-			offset_src = src_frame_info->offset
-				     + (i * src_frame_info->pitch)
-				     + (j * src_frame_info->cpp);
-
-			pixel_src = (u8 *)(vaddr_src + offset_src);
-			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
-			pixel_blend(pixel_src, pixel_dst);
-			/* clearing alpha channel (0xff)*/
-			pixel_dst[3] = 0xff;
+	int y, i;
+
+	for (y = y_src; y < y_limit; y++) {
+		plane_fmt_func[0](primary_plane_info, y, output_buffer);
+
+		/* If there are other planes besides primary, we consider the active
+		 * planes should be in z-order and compose them associatively:
+		 * ((primary <- overlay) <- cursor)
+		 */
+		for (i = 1; i < n_active_planes; i++) {
+			if (!check_y_limit(plane[i]->frame_info, y))
+				continue;
+
+			plane_fmt_func[i](plane[i]->frame_info, y, stage_buffer);
+			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
+					    output_buffer);
 		}
-		i_dst++;
+
+		*crc32 = crc32_le(*crc32, (void *)output_buffer, row_size);
+
+		if (wb_frame_info)
+			wb_fmt_func(wb_frame_info, y, output_buffer);
 	}
 }
 
-static void compose_plane(struct vkms_frame_info *primary_plane_info,
-			  struct vkms_frame_info *plane_frame_info,
-			  void *vaddr_out)
+static void get_format_transform_functions(struct vkms_crtc_state *crtc_state,
+					   format_transform_func plane_funcs[])
 {
-	struct drm_framebuffer *fb = plane_frame_info->fb;
-	void *vaddr;
-	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
+	struct vkms_plane_state **active_planes = crtc_state->active_planes;
+	u32 n_active_planes = crtc_state->num_active_planes, s_fmt;
+	int i;
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
-		return;
+	for (i = 0; i < n_active_planes; i++) {
+		s_fmt = active_planes[i]->frame_info->fb->format->format;
+		plane_funcs[i] = get_fmt_transform_function(s_fmt);
+	}
+}
 
-	vaddr = plane_frame_info->map[0].vaddr;
+static bool check_planes_x_bounds(struct vkms_crtc_state *crtc_state,
+				  struct vkms_frame_info *wb_frame_info)
+{
+	struct vkms_plane_state **planes = crtc_state->active_planes;
+	struct vkms_frame_info *primary_plane_info = planes[0]->frame_info;
+	int line_width = drm_rect_width(&primary_plane_info->dst);
+	u32 n_active_planes = crtc_state->num_active_planes;
+	int i;
 
-	if (fb->format->format == DRM_FORMAT_ARGB8888)
-		pixel_blend = &alpha_blend;
-	else
-		pixel_blend = &x_blend;
+	for (i = 0; i < n_active_planes; i++) {
+		int x_dst = planes[i]->frame_info->dst.x1;
+		int x_src = planes[i]->frame_info->src.x1 >> 16;
+		int x2_src = planes[i]->frame_info->src.x2 >> 16;
+		int x_limit = drm_rect_width(&planes[i]->frame_info->dst);
 
-	blend(vaddr_out, vaddr, primary_plane_info,
-	      plane_frame_info, pixel_blend);
+		if (x_dst + x_limit > line_width)
+			return false;
+		if (x_src + x_limit > x2_src)
+			return false;
+	}
+
+	return true;
 }
 
-static int compose_active_planes(void **vaddr_out,
-				 struct vkms_frame_info *primary_plane_info,
-				 struct vkms_crtc_state *crtc_state)
+static int compose_active_planes(struct vkms_frame_info *wb_frame_info,
+				 struct vkms_crtc_state *crtc_state,
+				 u32 *crc32)
 {
-	struct drm_framebuffer *fb = primary_plane_info->fb;
-	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
-	const void *vaddr;
-	int i;
+	format_transform_func plane_funcs[NUM_OVERLAY_PLANES], wb_func = NULL;
+	int line_width, ret = 0, pixel_size = sizeof(struct line_buffer);
+	struct vkms_frame_info *primary_plane_info = NULL;
+	struct line_buffer *output_buffer, *stage_buffer;
+	struct vkms_plane_state *act_plane = NULL;
+	u32 wb_format;
 
-	if (!*vaddr_out) {
-		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
-		if (!*vaddr_out) {
-			DRM_ERROR("Cannot allocate memory for output frame.");
-			return -ENOMEM;
-		}
+	if (WARN_ON(pixel_size != 8))
+		return -EINVAL;
+
+	if (crtc_state->num_active_planes >= 1) {
+		act_plane = crtc_state->active_planes[0];
+		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary_plane_info = act_plane->frame_info;
 	}
 
+	if (!primary_plane_info)
+		return -EINVAL;
+
 	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
 		return -EINVAL;
 
-	vaddr = primary_plane_info->map[0].vaddr;
+	if (WARN_ON(!check_planes_x_bounds(crtc_state, wb_frame_info)))
+		return -EINVAL;
 
-	memcpy(*vaddr_out, vaddr, gem_obj->size);
+	line_width = drm_rect_width(&primary_plane_info->dst);
 
-	/* If there are other planes besides primary, we consider the active
-	 * planes should be in z-order and compose them associatively:
-	 * ((primary <- overlay) <- cursor)
-	 */
-	for (i = 1; i < crtc_state->num_active_planes; i++)
-		compose_plane(primary_plane_info,
-			      crtc_state->active_planes[i]->frame_info,
-			      *vaddr_out);
+	stage_buffer = kvmalloc(line_width * pixel_size, GFP_KERNEL);
+	if (!stage_buffer) {
+		DRM_ERROR("Cannot allocate memory for the output line buffer");
+		return -ENOMEM;
+	}
 
-	return 0;
+	output_buffer = kvmalloc(line_width * pixel_size, GFP_KERNEL);
+	if (!output_buffer) {
+		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
+		ret = -ENOMEM;
+		goto free_stage_buffer;
+	}
+
+	get_format_transform_functions(crtc_state, plane_funcs);
+
+	if (wb_frame_info) {
+		wb_format = wb_frame_info->fb->format->format;
+		wb_func = get_wb_fmt_transform_function(wb_format);
+		wb_frame_info->src = primary_plane_info->src;
+		wb_frame_info->dst = primary_plane_info->dst;
+	}
+
+	blend(wb_frame_info, wb_func, crtc_state, plane_funcs, crc32,
+	      stage_buffer, output_buffer, (s64)line_width * pixel_size);
+
+	kvfree(output_buffer);
+free_stage_buffer:
+	kvfree(stage_buffer);
+
+	return ret;
 }
 
 /**
@@ -222,13 +230,12 @@ void vkms_composer_worker(struct work_struct *work)
 						struct vkms_crtc_state,
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
+	struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	struct vkms_frame_info *primary_plane_info = NULL;
-	struct vkms_plane_state *act_plane = NULL;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
-	u32 crc32 = 0;
 	u64 frame_start, frame_end;
+	u32 crc32 = 0;
 	int ret;
 
 	spin_lock_irq(&out->composer_lock);
@@ -248,35 +255,19 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1) {
-		act_plane = crtc_state->active_planes[0];
-		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary_plane_info = act_plane->frame_info;
-	}
-
-	if (!primary_plane_info)
-		return;
-
 	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
+		ret = compose_active_planes(wb_frame_info, crtc_state, &crc32);
+	else
+		ret = compose_active_planes(NULL, crtc_state, &crc32);
 
-	ret = compose_active_planes(&vaddr_out, primary_plane_info,
-				    crtc_state);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kvfree(vaddr_out);
+	if (ret)
 		return;
-	}
-
-	crc32 = compute_crc(vaddr_out, primary_plane_info);
 
 	if (wb_pending) {
 		drm_writeback_signal_completion(&out->wb_connector, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
-	} else {
-		kvfree(vaddr_out);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
new file mode 100644
index 000000000000..0d1838d1b835
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <drm/drm_rect.h>
+#include "vkms_formats.h"
+
+format_transform_func get_fmt_transform_function(u32 format)
+{
+	if (format == DRM_FORMAT_ARGB8888)
+		return &ARGB8888_to_ARGB16161616;
+	else
+		return &XRGB8888_to_ARGB16161616;
+}
+
+format_transform_func get_wb_fmt_transform_function(u32 format)
+{
+	if (format == DRM_FORMAT_ARGB8888)
+		return &convert_to_ARGB8888;
+	else
+		return &convert_to_XRGB8888;
+}
+
+static int pixel_offset(struct vkms_frame_info *frame_info, int x, int y)
+{
+	return frame_info->offset + (y * frame_info->pitch)
+				  + (x * frame_info->cpp);
+}
+
+/*
+ * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
+ *
+ * @frame_info: Buffer metadata
+ * @x: The x(width) coordinate of the 2D buffer
+ * @y: The y(Heigth) coordinate of the 2D buffer
+ *
+ * Takes the information stored in the frame_info, a pair of coordinates, and
+ * returns the address of the first color channel.
+ * This function assumes the channels are packed together, i.e. a color channel
+ * comes immediately after another in the memory. And therefore, this function
+ * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ */
+static void *packed_pixels_addr(struct vkms_frame_info *frame_info, int x, int y)
+{
+	int offset = pixel_offset(frame_info, x, y);
+
+	return (u8 *)frame_info->map[0].vaddr + offset;
+}
+
+static void *get_packed_src_addr(struct vkms_frame_info *frame_info, int y)
+{
+	int x_src = frame_info->src.x1 >> 16;
+	int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
+
+	return packed_pixels_addr(frame_info, x_src, y_src);
+}
+
+void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			      struct line_buffer *stage_buffer)
+{
+	u8 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		/*
+		 * Organizes the channels in their respective positions and converts
+		 * the 8 bits channel to 16.
+		 * The 257 is the "conversion ratio". This number is obtained by the
+		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
+		 * the best color value in a pixel format with more possibilities.
+		 * And a similar idea applies to others RGB color conversions.
+		 */
+		stage_buffer[x].a = (u16)src_pixels[3] * 257;
+		stage_buffer[x].r = (u16)src_pixels[2] * 257;
+		stage_buffer[x].g = (u16)src_pixels[1] * 257;
+		stage_buffer[x].b = (u16)src_pixels[0] * 257;
+	}
+}
+
+void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			      struct line_buffer *stage_buffer)
+{
+	u8 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		stage_buffer[x].a = (u16)0xffff;
+		stage_buffer[x].r = (u16)src_pixels[2] * 257;
+		stage_buffer[x].g = (u16)src_pixels[1] * 257;
+		stage_buffer[x].b = (u16)src_pixels[0] * 257;
+	}
+}
+
+/*
+ * The following  functions take an line of ARGB16161616 pixels from the
+ * src_buffer, convert them to a specific format, and store them in the
+ * destination.
+ *
+ * They are used in the `compose_active_planes` to convert and store a line
+ * from the src_buffer to the writeback buffer.
+ */
+void convert_to_ARGB8888(struct vkms_frame_info *frame_info,
+			 int y, struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		/*
+		 * This sequence below is important because the format's byte order is
+		 * in little-endian. In the case of the ARGB8888 the memory is
+		 * organized this way:
+		 *
+		 * | Addr     | = blue channel
+		 * | Addr + 1 | = green channel
+		 * | Addr + 2 | = Red channel
+		 * | Addr + 3 | = Alpha channel
+		 */
+		dst_pixels[3] = DIV_ROUND_UP(src_buffer[x].a, 257);
+		dst_pixels[2] = DIV_ROUND_UP(src_buffer[x].r, 257);
+		dst_pixels[1] = DIV_ROUND_UP(src_buffer[x].g, 257);
+		dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
+	}
+}
+
+void convert_to_XRGB8888(struct vkms_frame_info *frame_info,
+			 int y, struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = (u8)0xff;
+		dst_pixels[2] = DIV_ROUND_UP(src_buffer[x].r, 257);
+		dst_pixels[1] = DIV_ROUND_UP(src_buffer[x].g, 257);
+		dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
new file mode 100644
index 000000000000..817e8b2124ae
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_FORMATS_H_
+#define _VKMS_FORMATS_H_
+
+#include "vkms_drv.h"
+
+struct line_buffer {
+	u16 a, r, g, b;
+};
+
+void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			      struct line_buffer *stage_buffer);
+
+void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			      struct line_buffer *stage_buffer);
+
+void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
+			 struct line_buffer *src_buffer);
+
+void convert_to_XRGB8888(struct vkms_frame_info *frame_info, int y,
+			 struct line_buffer *src_buffer);
+
+typedef void (*format_transform_func)(struct vkms_frame_info *frame_info, int y,
+				      struct line_buffer *buffer);
+
+format_transform_func get_fmt_transform_function(u32 format);
+
+format_transform_func get_wb_fmt_transform_function(u32 format);
+
+#endif /* _VKMS_FORMATS_H_ */
-- 
2.30.2

