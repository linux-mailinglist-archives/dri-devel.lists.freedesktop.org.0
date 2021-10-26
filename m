Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0643B152
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451E36E42A;
	Tue, 26 Oct 2021 11:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEA96E427
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:43 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id bk35so453323qkb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFtKShrzA3NR3s2awMHDZ0WFl/JygTDUV5EP5Xutpkc=;
 b=qlscrwlc9HxHyth+6cp7K2GoS91Ii+A1CaEwvCs2H3qU4nCmEWznd3sHOi2STNi50P
 m4enipn1Y5968Tep5GA5h/VWPQTMtgoIfbbTGj4gdwzH0swtLpg/zEHmhEVotqqn3RKh
 uhjIYhn04z2/+sRK9VaxUGTmlaCh0hFjvNI9wfQY4+e3boqG3kbS6DwI6E0VRZKJGMoR
 ZvUDKwRnQeUktRB+KlkLFDYoJdBYuFISnvrenEoFmzB7j/waPn/9XOKGM8kNOlFKCAkl
 rThdTWJw05kVYpioM/PgerNVacuUEDW60E8gh0Sv09CL2h0NRMb/96/kShb+cnEmwW1D
 v3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFtKShrzA3NR3s2awMHDZ0WFl/JygTDUV5EP5Xutpkc=;
 b=X5l5yTy1lnTRKokC3UN1Mo75o/YQN6yxp+cvRHBOcrGKISaP9Lh+UXiQkzjllVOW/M
 T6Ie/lzrLIyw2D7IhSxiDHU+5NlJueqCRR3zj95WCEtQeCndEj7pZSroPQwayHRio4oA
 bClCKb0J9G4W8JXEJXgg9EJpjTX+bBId+JhwDB8yUaU/jawykKtiCz2Z+1KRQCVkThUp
 kgMPT125PsLgTmunXKjeWhDYp6xk8NXXBCLJinECfCvJX6hmSUDHF0RMxxiLOjMHsLP+
 xBqE84u3RZO0xhCWPaXuhOFmfqlp9RU10Ual5jL1Ccp1z5/AP+ubeBt0A2+pv2wIDcMi
 WrZQ==
X-Gm-Message-State: AOAM530L9jT21fR7a/VDf1a2z81cHjPzjIB3JHAYhevpQ/tr5FEg2rDg
 E3W55r42uivbEDhNLzX+y8A=
X-Google-Smtp-Source: ABdhPJzN13FIKlfjkPGC28nF3L6KEE9BdHFCA+xmc1JeynkV0EC4t1XG+TVdsiYeQh3OFGcrGsqkoA==
X-Received: by 2002:a37:a304:: with SMTP id m4mr18953025qke.111.1635248082755; 
 Tue, 26 Oct 2021 04:34:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:42 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept new
 formats
Date: Tue, 26 Oct 2021 08:34:06 -0300
Message-Id: <20211026113409.7242-7-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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

Currently the blend function only accepts XRGB_8888 and ARGB_8888
as a color input.

This patch refactors all the functions related to the plane composition
to overcome this limitation.

Now the blend function receives a struct `vkms_pixel_composition_functions`
containing two handlers.

One will generate a buffer of each line of the frame with the pixels
converted to ARGB16161616. And the other will take this line buffer,
do some computation on it, and store the pixels in the destination.

Both the handlers have the same signature. They receive a pointer to
the pixels that will be processed(`pixels_addr`), the number of pixels
that will be treated(`length`), and the intermediate buffer of the size
of a frame line (`line_buffer`).

The first function has been totally described previously.

The second is more interesting, as it has to perform two roles depending
on where it is called in the code.

The first is to convert(if necessary) the data received in the
`line_buffer` and write in the memory pointed by `pixels_addr`.

The second role is to perform the `alpha_blend`. So, it takes the pixels
in the `line_buffer` and `pixels_addr`, executes the blend, and stores
the result back to the `pixels_addr`.

The per-line implementation was chosen for performance reasons.
The per-pixel functions were having performance issues due to indirect
function call overhead.

The per-line code trades off memory for execution time. The `line_buffer`
allows us to diminish the number of function calls.

Results in the IGT test `kms_cursor_crc`:

|                     Frametime                       |
|:---------------:|:---------:|:----------:|:--------:|
|  implmentation  |  Current  |  Per-pixel | Per-line |
| frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
|     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Improves the performance drastically, by perfoming the operations
    per-line and not per-pixel(Pekka Paalanen).
    Minor improvements(Pekka Paalanen).
---
 drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
 2 files changed, 342 insertions(+), 134 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 383ca657ddf7..69fe3a89bdc9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,18 +9,26 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
-
-static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
-				 const struct vkms_composer *composer)
-{
-	u32 pixel;
-	int src_offset = composer->offset + (y * composer->pitch)
-				      + (x * composer->cpp);
-
-	pixel = *(u32 *)&buffer[src_offset];
-
-	return pixel;
-}
+#include "vkms_formats.h"
+
+#define get_output_vkms_composer(buffer_pointer, composer)		\
+	((struct vkms_composer) {					\
+		.fb = &(struct drm_framebuffer) {			\
+			.format = &(struct drm_format_info) {		\
+				.format = DRM_FORMAT_ARGB16161616,	\
+			},						\
+		},							\
+		.map[0].vaddr = (buffer_pointer),			\
+		.src = (composer)->src,					\
+		.dst = (composer)->dst,					\
+		.cpp = sizeof(u64),					\
+		.pitch = drm_rect_width(&(composer)->dst) * sizeof(u64)	\
+	})
+
+struct vkms_pixel_composition_functions {
+	void (*get_src_line)(void *pixels_addr, int length, u64 *line_buffer);
+	void (*set_output_line)(void *pixels_addr, int length, u64 *line_buffer);
+};
 
 /**
  * compute_crc - Compute CRC value on output frame
@@ -31,179 +39,222 @@ static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
  * returns CRC value computed using crc32 on the visible portion of
  * the final framebuffer at vaddr_out
  */
-static uint32_t compute_crc(const u8 *vaddr,
+static uint32_t compute_crc(const __le64 *vaddr,
 			    const struct vkms_composer *composer)
 {
-	int x, y;
-	u32 crc = 0, pixel = 0;
-	int x_src = composer->src.x1 >> 16;
-	int y_src = composer->src.y1 >> 16;
-	int h_src = drm_rect_height(&composer->src) >> 16;
-	int w_src = drm_rect_width(&composer->src) >> 16;
-
-	for (y = y_src; y < y_src + h_src; ++y) {
-		for (x = x_src; x < x_src + w_src; ++x) {
-			pixel = get_pixel_from_buffer(x, y, vaddr, composer);
-			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
-		}
-	}
+	int h = drm_rect_height(&composer->dst);
+	int w = drm_rect_width(&composer->dst);
 
-	return crc;
+	return crc32_le(0, (void *)vaddr, w * h * sizeof(u64));
 }
 
-static u8 blend_channel(u8 src, u8 dst, u8 alpha)
+static __le16 blend_channel(u16 src, u16 dst, u16 alpha)
 {
-	u32 pre_blend;
-	u8 new_color;
+	u64 pre_blend;
+	u16 new_color;
 
-	pre_blend = (src * 255 + dst * (255 - alpha));
+	pre_blend = (src * 0xffff + dst * (0xffff - alpha));
 
-	/* Faster div by 255 */
-	new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
+	new_color = DIV_ROUND_UP(pre_blend, 0xffff);
 
-	return new_color;
+	return cpu_to_le16(new_color);
 }
 
 /**
  * alpha_blend - alpha blending equation
- * @argb_src: src pixel on premultiplied alpha mode
- * @argb_dst: dst pixel completely opaque
+ * @src_composer: source framebuffer's metadata
+ * @dst_composer: destination framebuffer's metadata
+ * @y: The y coodinate(heigth) of the line that will be processed
+ * @line_buffer: The line with the pixels from src_compositor
  *
  * blend pixels using premultiplied blend formula. The current DRM assumption
  * is that pixel color values have been already pre-multiplied with the alpha
  * channel values. See more drm_plane_create_blend_mode_property(). Also, this
  * formula assumes a completely opaque background.
+ *
+ * For performance reasons this function also fetches the pixels from the
+ * destination of the frame line y.
+ * We use the information that one of the source pixels are in the output
+ * buffer to fetch it here instead of separate function. And because the
+ * output format is ARGB16161616, we know that they don't need to be
+ * converted.
+ * This save us a indirect function call for each line.
  */
-static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
+static void alpha_blend(void *pixels_addr, int length, u64 *line_buffer)
 {
-	u8 alpha;
+	__le16 *output_pixel = pixels_addr;
+	int i;
 
-	alpha = argb_src[3];
-	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
-	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
-	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
-}
+	for (i = 0; i < length; i++) {
+		u16 src1_a = line_buffer[i] >> 48;
+		u16 src1_r = (line_buffer[i] >> 32) & 0xffff;
+		u16 src1_g = (line_buffer[i] >> 16) & 0xffff;
+		u16 src1_b = line_buffer[i] & 0xffff;
 
-/**
- * x_blend - blending equation that ignores the pixel alpha
- *
- * overwrites RGB color value from src pixel to dst pixel.
- */
-static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
-{
-	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
+		u16 src2_r = le16_to_cpu(output_pixel[2]);
+		u16 src2_g = le16_to_cpu(output_pixel[1]);
+		u16 src2_b = le16_to_cpu(output_pixel[0]);
+
+		output_pixel[0] = blend_channel(src1_b, src2_b, src1_a);
+		output_pixel[1] = blend_channel(src1_g, src2_g, src1_a);
+		output_pixel[2] = blend_channel(src1_r, src2_r, src1_a);
+		output_pixel[3] = 0xffff;
+
+		output_pixel += 4;
+	}
 }
 
 /**
- * blend - blend value at vaddr_src with value at vaddr_dst
- * @vaddr_dst: destination address
- * @vaddr_src: source address
- * @dst_composer: destination framebuffer's metadata
  * @src_composer: source framebuffer's metadata
- * @pixel_blend: blending equation based on plane format
+ * @dst_composer: destiny framebuffer's metadata
+ * @funcs: A struct containing all the composition functions(get_src_line,
+ *         and set_output_pixel)
+ * @line_buffer: The line with the pixels from src_compositor
  *
- * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
- * equation according to the supported plane formats DRM_FORMAT_(A/XRGB8888)
- * and clearing alpha channel to an completely opaque background. This function
- * uses buffer's metadata to locate the new composite values at vaddr_dst.
+ * Using the pixel_blend function passed as parameter, this function blends
+ * all pixels from src plane into a output buffer (with a blend function
+ * passed as parameter).
+ * Information of the output buffer is in the dst_composer parameter
+ * and the source plane in the src_composer.
+ * The get_src_line will use the src_composer to get the respective line,
+ * convert, and return it as ARGB_16161616.
+ * And finally, the blend function will receive the dst_composer, dst_composer,
+ * the line y coodinate, and the line buffer. Blend all pixels, and store the
+ * result in the output.
  *
  * TODO: completely clear the primary plane (a = 0xff) before starting to blend
  * pixel color values
  */
-static void blend(void *vaddr_dst, void *vaddr_src,
+static void blend(struct vkms_composer *src_composer,
 		  struct vkms_composer *dst_composer,
-		  struct vkms_composer *src_composer,
-		  void (*pixel_blend)(const u8 *, u8 *))
+		  struct vkms_pixel_composition_functions *funcs,
+		  u64 *line_buffer)
 {
-	int i, j, j_dst, i_dst;
-	int offset_src, offset_dst;
-	u8 *pixel_dst, *pixel_src;
+	int i, i_dst;
 
 	int x_src = src_composer->src.x1 >> 16;
 	int y_src = src_composer->src.y1 >> 16;
 
 	int x_dst = src_composer->dst.x1;
 	int y_dst = src_composer->dst.y1;
+
 	int h_dst = drm_rect_height(&src_composer->dst);
-	int w_dst = drm_rect_width(&src_composer->dst);
+	int length = drm_rect_width(&src_composer->dst);
 
 	int y_limit = y_src + h_dst;
-	int x_limit = x_src + w_dst;
-
-	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
-		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
-			offset_dst = dst_composer->offset
-				     + (i_dst * dst_composer->pitch)
-				     + (j_dst++ * dst_composer->cpp);
-			offset_src = src_composer->offset
-				     + (i * src_composer->pitch)
-				     + (j * src_composer->cpp);
-
-			pixel_src = (u8 *)(vaddr_src + offset_src);
-			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
-			pixel_blend(pixel_src, pixel_dst);
-			/* clearing alpha channel (0xff)*/
-			pixel_dst[3] = 0xff;
-		}
-		i_dst++;
+
+	u8 *src_pixels = packed_pixels_addr(src_composer, x_src, y_src);
+	u8 *dst_pixels = packed_pixels_addr(dst_composer, x_dst, y_dst);
+
+	int src_next_line_offset = src_composer->pitch;
+	int dst_next_line_offset = dst_composer->pitch;
+
+	for (i = y_src, i_dst = y_dst; i < y_limit; ++i, i_dst++) {
+		funcs->get_src_line(src_pixels, length, line_buffer);
+		funcs->set_output_line(dst_pixels, length, line_buffer);
+		src_pixels += src_next_line_offset;
+		dst_pixels += dst_next_line_offset;
 	}
 }
 
-static void compose_plane(struct vkms_composer *primary_composer,
-			  struct vkms_composer *plane_composer,
-			  void *vaddr_out)
+static void ((*get_line_fmt_transform_function(u32 format))
+	    (void *pixels_addr, int length, u64 *line_buffer))
 {
-	struct drm_framebuffer *fb = plane_composer->fb;
-	void *vaddr;
-	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
+	if (format == DRM_FORMAT_ARGB8888)
+		return &ARGB8888_to_ARGB16161616;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &get_ARGB16161616;
+	else
+		return &XRGB8888_to_ARGB16161616;
+}
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
-		return;
+static void ((*get_output_line_function(u32 format))
+	     (void *pixels_addr, int length, u64 *line_buffer))
+{
+	if (format == DRM_FORMAT_ARGB8888)
+		return &convert_to_ARGB8888;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &convert_to_ARGB16161616;
+	else
+		return &convert_to_XRGB8888;
+}
 
-	vaddr = plane_composer->map[0].vaddr;
+static void compose_plane(struct vkms_composer *src_composer,
+			  struct vkms_composer *dst_composer,
+			  struct vkms_pixel_composition_functions *funcs,
+			  u64 *line_buffer)
+{
+	u32 src_format = src_composer->fb->format->format;
 
-	if (fb->format->format == DRM_FORMAT_ARGB8888)
-		pixel_blend = &alpha_blend;
-	else
-		pixel_blend = &x_blend;
+	funcs->get_src_line = get_line_fmt_transform_function(src_format);
 
-	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
+	blend(src_composer, dst_composer, funcs, line_buffer);
 }
 
-static int compose_active_planes(void **vaddr_out,
-				 struct vkms_composer *primary_composer,
-				 struct vkms_crtc_state *crtc_state)
+static __le64 *compose_active_planes(struct vkms_composer *primary_composer,
+				     struct vkms_crtc_state *crtc_state,
+				     u64 *line_buffer)
 {
-	struct drm_framebuffer *fb = primary_composer->fb;
-	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
-	const void *vaddr;
+	struct vkms_plane_state **active_planes = crtc_state->active_planes;
+	int h = drm_rect_height(&primary_composer->dst);
+	int w = drm_rect_width(&primary_composer->dst);
+	struct vkms_pixel_composition_functions funcs;
+	struct vkms_composer dst_composer;
+	__le64 *vaddr_out;
 	int i;
 
-	if (!*vaddr_out) {
-		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
-		if (!*vaddr_out) {
-			DRM_ERROR("Cannot allocate memory for output frame.");
-			return -ENOMEM;
-		}
-	}
-
 	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
-		return -EINVAL;
+		return NULL;
 
-	vaddr = primary_composer->map[0].vaddr;
+	vaddr_out = kvzalloc(w * h * sizeof(__le64), GFP_KERNEL);
+	if (!vaddr_out) {
+		DRM_ERROR("Cannot allocate memory for output frame.");
+		return NULL;
+	}
 
-	memcpy(*vaddr_out, vaddr, gem_obj->size);
+	dst_composer = get_output_vkms_composer(vaddr_out, primary_composer);
+	funcs.set_output_line = get_output_line_function(DRM_FORMAT_ARGB16161616);
+	compose_plane(active_planes[0]->composer, &dst_composer,
+		      &funcs, line_buffer);
 
 	/* If there are other planes besides primary, we consider the active
 	 * planes should be in z-order and compose them associatively:
 	 * ((primary <- overlay) <- cursor)
 	 */
+	funcs.set_output_line = alpha_blend;
 	for (i = 1; i < crtc_state->num_active_planes; i++)
-		compose_plane(primary_composer,
-			      crtc_state->active_planes[i]->composer,
-			      *vaddr_out);
+		compose_plane(active_planes[i]->composer, &dst_composer,
+			      &funcs, line_buffer);
 
-	return 0;
+	return vaddr_out;
+}
+
+static void write_wb_buffer(struct vkms_writeback_job *active_wb,
+			    struct vkms_composer *primary_composer,
+			    __le64 *vaddr_out, u64 *line_buffer)
+{
+	u32 dst_fb_format = active_wb->composer.fb->format->format;
+	struct vkms_pixel_composition_functions funcs;
+	struct vkms_composer src_composer;
+
+	src_composer = get_output_vkms_composer(vaddr_out, primary_composer);
+	funcs.set_output_line = get_output_line_function(dst_fb_format);
+	active_wb->composer.src = primary_composer->src;
+	active_wb->composer.dst = primary_composer->dst;
+
+	compose_plane(&src_composer, &active_wb->composer, &funcs, line_buffer);
+}
+
+u64 *alloc_line_buffer(struct vkms_composer *primary_composer)
+{
+	int line_width = drm_rect_width(&primary_composer->dst);
+	u64 *line_buffer;
+
+	line_buffer = kvmalloc(line_width * sizeof(u64), GFP_KERNEL);
+	if (!line_buffer)
+		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
+
+	return line_buffer;
 }
 
 /**
@@ -221,14 +272,14 @@ void vkms_composer_worker(struct work_struct *work)
 						struct vkms_crtc_state,
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
 	struct vkms_plane_state *act_plane = NULL;
+	u64 frame_start, frame_end, *line_buffer;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
+	__le64 *vaddr_out = NULL;
 	u32 crc32 = 0;
-	u64 frame_start, frame_end;
-	int ret;
 
 	spin_lock_irq(&out->composer_lock);
 	frame_start = crtc_state->frame_start;
@@ -256,28 +307,30 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!primary_composer)
 		return;
 
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
+	line_buffer = alloc_line_buffer(primary_composer);
+	if (!line_buffer)
+		return;
 
-	ret = compose_active_planes(&vaddr_out, primary_composer,
-				    crtc_state);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kvfree(vaddr_out);
+	vaddr_out = compose_active_planes(primary_composer, crtc_state,
+					  line_buffer);
+	if (!vaddr_out) {
+		kvfree(line_buffer);
 		return;
 	}
 
-	crc32 = compute_crc(vaddr_out, primary_composer);
-
 	if (wb_pending) {
+		write_wb_buffer(active_wb, primary_composer,
+				vaddr_out, line_buffer);
 		drm_writeback_signal_completion(&out->wb_connector, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
-	} else {
-		kvfree(vaddr_out);
 	}
 
+	kvfree(line_buffer);
+	crc32 = compute_crc(vaddr_out, primary_composer);
+	kvfree(vaddr_out);
+
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
new file mode 100644
index 000000000000..5b850fce69f3
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_FORMATS_H_
+#define _VKMS_FORMATS_H_
+
+#include <drm/drm_rect.h>
+
+#define pixel_offset(composer, x, y) \
+	((composer)->offset + ((y) * (composer)->pitch) + ((x) * (composer)->cpp))
+
+/*
+ * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
+ *
+ * @composer: Buffer metadata
+ * @x: The x(width) coordinate of the 2D buffer
+ * @y: The y(Heigth) coordinate of the 2D buffer
+ *
+ * Takes the information stored in the composer, a pair of coordinates, and
+ * returns the address of the first color channel.
+ * This function assumes the channels are packed together, i.e. a color channel
+ * comes immediately after another. And therefore, this function doesn't work
+ * for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ */
+static void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
+{
+	int offset = pixel_offset(composer, x, y);
+
+	return (u8 *)composer->map[0].vaddr + offset;
+}
+
+static void ARGB8888_to_ARGB16161616(void *pixels_addr, int length,
+				     u64 *line_buffer)
+{
+	u8 *src_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		/*
+		 * Organizes the channels in their respective positions and converts
+		 * the 8 bits channel to 16.
+		 * The 257 is the "conversion ratio". This number is obtained by the
+		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
+		 * the best color value in a pixel format with more possibilities.
+		 * And a similar idea applies to others RGB color conversions.
+		 */
+		line_buffer[i] = ((u64)src_pixels[3] * 257) << 48 |
+				 ((u64)src_pixels[2] * 257) << 32 |
+				 ((u64)src_pixels[1] * 257) << 16 |
+				 ((u64)src_pixels[0] * 257);
+
+		src_pixels += 4;
+	}
+}
+
+static void XRGB8888_to_ARGB16161616(void *pixels_addr, int length,
+				     u64 *line_buffer)
+{
+	u8 *src_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		/*
+		 * The same as the ARGB8888 but with the alpha channel as the
+		 * maximum value as possible.
+		 */
+		line_buffer[i] = 0xffffllu << 48 |
+				 ((u64)src_pixels[2] * 257) << 32 |
+				 ((u64)src_pixels[1] * 257) << 16 |
+				 ((u64)src_pixels[0] * 257);
+
+		src_pixels += 4;
+	}
+}
+
+static void get_ARGB16161616(void *pixels_addr, int length, u64 *line_buffer)
+{
+	__le64 *src_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		/*
+		 * Because the format byte order is in little-endian and this code
+		 * needs to run on big-endian machines too, we need modify
+		 * the byte order from little-endian to the CPU native byte order.
+		 */
+		line_buffer[i] = le64_to_cpu(*src_pixels);
+
+		src_pixels++;
+	}
+}
+
+/*
+ * The following functions are used as blend operations. But unlike the
+ * `alpha_blend`, these functions take an ARGB16161616 pixel from the
+ * source, convert it to a specific format, and store it in the destination.
+ *
+ * They are used in the `compose_active_planes` and `write_wb_buffer` to
+ * copy and convert one line of the frame from/to the output buffer to/from
+ * another buffer (e.g. writeback buffer, primary plane buffer).
+ */
+
+static void convert_to_ARGB8888(void *pixels_addr, int length, u64 *line_buffer)
+{
+	u8 *dst_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
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
+		dst_pixels[0] = DIV_ROUND_UP(line_buffer[i] & 0xffff, 257);
+		dst_pixels[1] = DIV_ROUND_UP((line_buffer[i] >> 16) & 0xffff, 257);
+		dst_pixels[2] = DIV_ROUND_UP((line_buffer[i] >> 32) & 0xffff, 257);
+		dst_pixels[3] = DIV_ROUND_UP(line_buffer[i] >> 48, 257);
+
+		dst_pixels += 4;
+	}
+}
+
+static void convert_to_XRGB8888(void *pixels_addr, int length, u64 *line_buffer)
+{
+	u8 *dst_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		dst_pixels[0] = DIV_ROUND_UP(line_buffer[i] & 0xffff, 257);
+		dst_pixels[1] = DIV_ROUND_UP((line_buffer[i] >> 16) & 0xffff, 257);
+		dst_pixels[2] = DIV_ROUND_UP((line_buffer[i] >> 32) & 0xffff, 257);
+		dst_pixels[3] = 0xff;
+
+		dst_pixels += 4;
+	}
+}
+
+static void convert_to_ARGB16161616(void *pixels_addr, int length,
+				    u64 *line_buffer)
+{
+	__le64 *dst_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+
+		*dst_pixels = cpu_to_le64(line_buffer[i]);
+		dst_pixels++;
+	}
+}
+
+#endif /* _VKMS_FORMATS_H_ */
-- 
2.30.2

