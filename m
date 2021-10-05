Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F6423184
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A106EC3B;
	Tue,  5 Oct 2021 20:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AA86EC3B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:47 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id m26so371491qtn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWRdzcwy5pavNEYEELsEY50gWUTPCGMh6fXm38Kcnwg=;
 b=MoULmMNCc4Idu9ZImFeNa1VIhx/xzUslMv/8+5o4nSuRkW5osOBewyuxo0wtI0f/mv
 wz4jLSoonROXu/Wldp2TXAu/xXwzBVXFNOwp8ibWsBQ1KdOmUbdQV4LAZ56/6EIsEAo8
 9nI1q+VxUoFfh9Q3+DI2gxKoLMs0p3rcGxBUbtcYXcpqm7SdZ8vURyi0zl2DFisT2aLQ
 wNGujKBsaRl4CeSZpUjF7zP4L4qGXOK7WI8c667OevdJActG3GMqhKJabzzqj+GHaQm0
 tED16j/iyfDYcS9QucM1ZYynPWSmkVPqDdgugL9XKg/xdsE8b3uemOjZNjc44F3fROLI
 Te7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWRdzcwy5pavNEYEELsEY50gWUTPCGMh6fXm38Kcnwg=;
 b=mcnJb/Ii2uZIVjktc4NOmgGoO1ZNHmggR98MQrAHaAIINP3tzOqAiB9+2Vh5Gufnlt
 8zxDX5oQBKn8ulLIrnzT19RfIrZekOxwzWb/IuPf2egdvk83eRrTGa89j2e9MZCZzpv2
 t4fn6nffwidoR2cT+Ko+QbqSVEGpSZ7Exsq7IDPWQQJOiHoVGBnLKjDdm8YUvaBC/e3X
 rKZgJpWj1+xlcQYwfWQXVGYc0hcBrBE1ky61N+pmucJgwRxwDnxIZR4+hOOsOle/LFtG
 XHK+f4F6eOTG2Pul4fcbCXxLIH00Vya24WTw/JiBNUbNLNQGzNDcNEZEQvG/bMh4eGnY
 R7EA==
X-Gm-Message-State: AOAM533mfTKVT8+M7V/9Kx5Lz3Eg5hkgzOFRtFqdOAjxtrjOXPXWQdN4
 WqlmCFJer0Ve4i4/fCfX78U=
X-Google-Smtp-Source: ABdhPJz3mYgQzp0H6NaSiD0iK49qRhDH80PVSZE25keNhKKJ+X696uqWCtGvNVBHgQ+wFBfHvR8txQ==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr22021492qtq.104.1633465066720; 
 Tue, 05 Oct 2021 13:17:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:46 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept new
 formats
Date: Tue,  5 Oct 2021 17:16:37 -0300
Message-Id: <20211005201637.58563-7-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
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

Now the blend function receives a format handler to each plane and a
blend function pointer. It will take two ARGB_1616161616 pixels, one
for each handler, and will use the blend function to calculate and
store the final color in the output buffer.

These format handlers will receive the `vkms_composer` and a pair of
coordinates. And they should return the respective pixel in the
ARGB_16161616 format.

The blend function will receive two ARGB_16161616 pixels, x, y, and
the vkms_composer of the output buffer. The method should perform the
blend operation and store output to the format aforementioned
ARGB_16161616.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 275 ++++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h  | 125 ++++++++++++
 2 files changed, 271 insertions(+), 129 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 82f79e508f81..1e7c10c02a52 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,18 +9,28 @@
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
+		.fb = (struct drm_framebuffer) {			\
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
+	u64 (*get_src_pixel)(struct vkms_composer *composer, int x, int y);
+	u64 (*get_dst_pixel)(struct vkms_composer *composer, int x, int y);
+	void (*pixel_blend)(u64 argb_src1, u64 argb_src2, int x, int y,
+			    struct vkms_composer *dst_composer);
+};
 
 /**
  * compute_crc - Compute CRC value on output frame
@@ -31,42 +41,33 @@ static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
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
+ * @argb_src1: pixel of the source plane on premultiplied alpha mode
+ * @argb_src2: pixel of the destiny planes on premultiplied alpha mode
+ * @x: The x coodinate(width) of the pixel
+ * @y: The y coodinate(heigth) of the pixel
  * @argb_dst: dst pixel completely opaque
  *
  * blend pixels using premultiplied blend formula. The current DRM assumption
@@ -74,50 +75,52 @@ static u8 blend_channel(u8 src, u8 dst, u8 alpha)
  * channel values. See more drm_plane_create_blend_mode_property(). Also, this
  * formula assumes a completely opaque background.
  */
-static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
+static void alpha_blend(u64 argb_src1, u64 argb_src2, int y, int x,
+			struct vkms_composer *dst_composer)
 {
-	u8 alpha;
+	__le16 *output_pixel = packed_pixels_addr(dst_composer, y, x);
 
-	alpha = argb_src[3];
-	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
-	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
-	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
-}
+	u16 src1_a = (argb_src1 & (0xffffllu << 48)) >> 48;
+	u16 src1_r = (argb_src1 & (0xffffllu << 32)) >> 32;
+	u16 src1_g = (argb_src1 & (0xffffllu << 16)) >> 16;
+	u16 src1_b = argb_src1 & 0xffffllu;
 
-/**
- * x_blend - blending equation that ignores the pixel alpha
- *
- * overwrites RGB color value from src pixel to dst pixel.
- */
-static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
-{
-	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
+	u16 src2_r = (argb_src2 & (0xffffllu << 32)) >> 32;
+	u16 src2_g = (argb_src2 & (0xffffllu << 16)) >> 16;
+	u16 src2_b = argb_src2 & 0xffffllu;
+
+	output_pixel[0] = blend_channel(src1_b, src2_b, src1_a);
+	output_pixel[1] = blend_channel(src1_g, src2_g, src1_a);
+	output_pixel[2] = blend_channel(src1_r, src2_r, src1_a);
+	output_pixel[3] = 0xffff;
 }
 
 /**
- * blend - blend value at vaddr_src with value at vaddr_dst
- * @vaddr_dst: destination address
- * @vaddr_src: source address
- * @dst_composer: destination framebuffer's metadata
  * @src_composer: source framebuffer's metadata
- * @pixel_blend: blending equation based on plane format
+ * @dst_composer: destiny framebuffer's metadata
+ * @funcs: A struct containing all the composition functions(get_src_pixel,
+ *         get_dst_pixel, and pixel_blend)
  *
- * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
- * equation according to the supported plane formats DRM_FORMAT_(A/XRGB8888)
- * and clearing alpha channel to an completely opaque background. This function
- * uses buffer's metadata to locate the new composite values at vaddr_dst.
+ * Using the pixel_blend function passed as parameter, this function blends
+ * all pixels from src planes into a output buffer.
+ * Information of the output buffer is in the dst_composer parameter
+ * and the source plane in the src_composer.
+ * The get_src_pixel will use the src_composer to get the respective pixel,
+ * convert, and return it as ARGB_16161616.
+ * The same is true for the dst_composer and get_dst_pixel respectively.
+ * And finally, the blend function will receive the dst_composer, src,
+ * and dst pixels. Blend, and store thre result in the output using the
+ * dst_composer buffer information.
  *
  * TODO: completely clear the primary plane (a = 0xff) before starting to blend
  * pixel color values
  */
-static void blend(void *vaddr_dst, void *vaddr_src,
+static void blend(struct vkms_composer *src_composer,
 		  struct vkms_composer *dst_composer,
-		  struct vkms_composer *src_composer,
-		  void (*pixel_blend)(const u8 *, u8 *))
+		  struct vkms_pixel_composition_functions *funcs)
 {
 	int i, j, j_dst, i_dst;
-	int offset_src, offset_dst;
-	u8 *pixel_dst, *pixel_src;
+	u64 pixel_dst, pixel_src;
 
 	int x_src = src_composer->src.x1 >> 16;
 	int y_src = src_composer->src.y1 >> 16;
@@ -130,80 +133,101 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	int y_limit = y_src + h_dst;
 	int x_limit = x_src + w_dst;
 
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
+	for (i = y_src, i_dst = y_dst; i < y_limit; ++i, i_dst++) {
+		for (j = x_src, j_dst = x_dst; j < x_limit; ++j, j_dst++) {
+			pixel_src = funcs->get_src_pixel(src_composer, j, i);
+			pixel_dst = funcs->get_dst_pixel(dst_composer, j_dst, i_dst);
+
+			funcs->pixel_blend(pixel_src, pixel_dst, j_dst, i_dst,
+					   dst_composer);
 		}
-		i_dst++;
 	}
 }
 
-static void compose_plane(struct vkms_composer *primary_composer,
-			  struct vkms_composer *plane_composer,
-			  void *vaddr_out)
+static u64 ((*get_pixel_fmt_transform_function(u32 format))
+	    (struct vkms_composer *, int, int))
 {
-	struct drm_framebuffer *fb = &plane_composer->fb;
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
+static void ((*get_pixel_blend_function(u32 format))
+	     (u64, u64, int, int, struct vkms_composer *))
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
+			  struct vkms_pixel_composition_functions *funcs)
+{
+	u32 src_format = src_composer->fb.format->format;
+	u32 dst_format = dst_composer->fb.format->format;
 
-	if (fb->format->format == DRM_FORMAT_ARGB8888)
-		pixel_blend = &alpha_blend;
-	else
-		pixel_blend = &x_blend;
+	funcs->get_src_pixel = get_pixel_fmt_transform_function(src_format);
+	funcs->get_dst_pixel = get_pixel_fmt_transform_function(dst_format);
 
-	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
+	blend(src_composer, dst_composer, funcs);
 }
 
-static int compose_active_planes(void **vaddr_out,
-				 struct vkms_composer *primary_composer,
-				 struct vkms_crtc_state *crtc_state)
+static __le64 *compose_active_planes(struct vkms_composer *primary_composer,
+				     struct vkms_crtc_state *crtc_state)
 {
-	struct drm_framebuffer *fb = &primary_composer->fb;
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
+	funcs.pixel_blend = get_pixel_blend_function(DRM_FORMAT_ARGB16161616);
+	compose_plane(active_planes[0]->composer, &dst_composer, &funcs);
 
 	/* If there are other planes besides primary, we consider the active
 	 * planes should be in z-order and compose them associatively:
 	 * ((primary <- overlay) <- cursor)
 	 */
+	funcs.pixel_blend = alpha_blend;
 	for (i = 1; i < crtc_state->num_active_planes; i++)
-		compose_plane(primary_composer,
-			      crtc_state->active_planes[i]->composer,
-			      *vaddr_out);
+		compose_plane(active_planes[i]->composer, &dst_composer, &funcs);
 
-	return 0;
+	return vaddr_out;
+}
+
+static void write_wb_buffer(struct vkms_writeback_job *active_wb,
+			    struct vkms_composer *primary_composer,
+			    __le64 *vaddr_out)
+{
+	u32 dst_fb_format = active_wb->composer.fb.format->format;
+	struct vkms_pixel_composition_functions funcs;
+	struct vkms_composer src_composer;
+
+	src_composer = get_output_vkms_composer(vaddr_out, primary_composer);
+	funcs.pixel_blend = get_pixel_blend_function(dst_fb_format);
+	active_wb->composer.src = primary_composer->src;
+	active_wb->composer.dst = primary_composer->dst;
+
+	compose_plane(&src_composer, &active_wb->composer, &funcs);
 }
 
 /**
@@ -221,14 +245,14 @@ void vkms_composer_worker(struct work_struct *work)
 						struct vkms_crtc_state,
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
 	struct vkms_plane_state *act_plane = NULL;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
+	__le64 *vaddr_out = NULL;
 	u32 crc32 = 0;
 	u64 frame_start, frame_end;
-	int ret;
 
 	spin_lock_irq(&out->composer_lock);
 	frame_start = crtc_state->frame_start;
@@ -256,28 +280,21 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!primary_composer)
 		return;
 
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
-
-	ret = compose_active_planes(&vaddr_out, primary_composer,
-				    crtc_state);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kvfree(vaddr_out);
+	vaddr_out = compose_active_planes(primary_composer, crtc_state);
+	if (!vaddr_out)
 		return;
-	}
-
-	crc32 = compute_crc(vaddr_out, primary_composer);
 
 	if (wb_pending) {
+		write_wb_buffer(active_wb, primary_composer, vaddr_out);
 		drm_writeback_signal_completion(&out->wb_connector, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
-	} else {
-		kvfree(vaddr_out);
 	}
 
+	crc32 = compute_crc(vaddr_out, primary_composer);
+	kvfree(vaddr_out);
+
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
new file mode 100644
index 000000000000..60e21adbf68d
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -0,0 +1,125 @@
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
+void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
+{
+	int offset = pixel_offset(composer, x, y);
+
+	return (u8 *)composer->map[0].vaddr + offset;
+}
+
+u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
+{
+	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
+
+	/*
+	 * Organizes the channels in their respective positions and converts
+	 * the 8 bits channel to 16.
+	 * The 257 is the "conversion ratio". This number is obtained by the
+	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
+	 * the best color value in a color space with more possibilities.
+	 * And a similar idea applies to others RGB color conversions.
+	 */
+	return ((u64)pixel_addr[3] * 257) << 48 |
+	       ((u64)pixel_addr[2] * 257) << 32 |
+	       ((u64)pixel_addr[1] * 257) << 16 |
+	       ((u64)pixel_addr[0] * 257);
+}
+
+u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
+{
+	u8 *pixel_addr = packed_pixels_addr(composer, x, y);
+
+	/*
+	 * The same as the ARGB8888 but with the alpha channel as the
+	 * maximum value as possible.
+	 */
+	return 0xffffllu << 48 |
+	       ((u64)pixel_addr[2] * 257) << 32 |
+	       ((u64)pixel_addr[1] * 257) << 16 |
+	       ((u64)pixel_addr[0] * 257);
+}
+
+u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
+{
+	__le64 *pixel_addr = packed_pixels_addr(composer, x, y);
+
+	/*
+	 * Because the format byte order is in little-endian and this code
+	 * needs to run on big-endian machines too, we need modify
+	 * the byte order from little-endian to the CPU native byte order.
+	 */
+	return le64_to_cpu(*pixel_addr);
+}
+
+/*
+ * The following functions are used as blend operations. But unlike the
+ * `alpha_blend`, these functions take an ARGB16161616 pixel from the
+ * source, convert it to a specific format, and store it in the destination.
+ *
+ * They are used in the `compose_active_planes` and `write_wb_buffer` to
+ * copy and convert one pixel from/to the output buffer to/from
+ * another buffer (e.g. writeback buffer, primary plane buffer).
+ */
+
+void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
+			 struct vkms_composer *dst_composer)
+{
+	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
+
+	/*
+	 * This sequence below is important because the format's byte order is
+	 * in little-endian. In the case of the ARGB8888 the memory is
+	 * organized this way:
+	 *
+	 * | Addr     | = blue channel
+	 * | Addr + 1 | = green channel
+	 * | Addr + 2 | = Red channel
+	 * | Addr + 3 | = Alpha channel
+	 */
+	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
+	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
+	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
+	pixel_addr[3] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 48)) >> 48, 257);
+}
+
+void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
+			 struct vkms_composer *dst_composer)
+{
+	u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
+
+	pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
+	pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
+	pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
+	pixel_addr[3] = 0xff;
+}
+
+void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
+			     struct vkms_composer *dst_composer)
+{
+	__le64 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
+
+	*pixel_addr = cpu_to_le64(argb_src1);
+}
+
+#endif /* _VKMS_FORMATS_H_ */
-- 
2.30.2

