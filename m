Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080D94595C4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9789D83;
	Mon, 22 Nov 2021 19:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6889D64
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:40 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id az37so38864299uab.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KrJK7VFm/uKvpjlyM0dM7TFPOBp3BJCfN+cH4kbu3+A=;
 b=I62NJYU+IEgoYkUEisjrNpVzHjo9Bn91V43Tww3jCtXVu3bR6n5wP6GwLaCUrde1Bs
 73kw7E0jmNjIEgqWeC7RraPEv5EAFCmdjRVyM99RC+S2z0SgaN3AQ93BwKymV55Ilu7B
 rY7YM6/k6nLzWZiOP0ZnWILXvActV71ZiMEKPjRmMoL0scbmi6fv/kMsmcFYz+YL0NOI
 nBw8yMBBJlsQDKc24xXv6sH8n0hvLBVpcMTq+ln/XvfLBtUixjA/B4D+QCPgzQgglRvW
 R2SZ0/n1oxljBsMcjTP+L3NILt3IrxjBZzlayQyhtARVSvuLWRkorGjyuWHMWXjHt/gP
 1YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KrJK7VFm/uKvpjlyM0dM7TFPOBp3BJCfN+cH4kbu3+A=;
 b=eaby0DXbSibmv1HwXbiGkIFjwixAezhfU9lOB35SGakBE+JrLDK5sHYPlNKb/H5grC
 btPuSszXVlotuzD1KGw4R8gCAf3hmy6xzLS8texuvPmqmq5Nj6OBa3gVfQkbLxGw+0RE
 90uxq5tAxKHvU3Aclwn5Irg8APzohDnF/s1sT6gdmmhHIFy9G3oee+bdWwTMGJD8gXXk
 Puoul7Ik8OYvC2csz9tvVe7bXaVDDLNFoT7e/DdrQxNNkxQ70zTljdJlM6MLstA0ZQlF
 EtB5x3NpKWTXd/trD6VliA+2wiPoQkt85xdA0PV7PK9smb2luB+OCR1AacG/78Sq/TLp
 RInQ==
X-Gm-Message-State: AOAM5324HnD9KusR3XiDvlawUmUEzdfu6uGGVs+HPmJndb5HhEyaK7ZV
 OWV0QM2SPEdJNBNeofgZis4hVA3HabU=
X-Google-Smtp-Source: ABdhPJxXLbHZ3jxVd7ndjy8EPyjq4MwAsCR6KnmwIiaVMHvxbBzt2q+FjggARM92eBtEgOQ0cx9deA==
X-Received: by 2002:ab0:3ca0:: with SMTP id a32mr90316381uax.63.1637610279391; 
 Mon, 22 Nov 2021 11:44:39 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:39 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 9/9] drm: vkms: Add support to the RGB565 format
Date: Mon, 22 Nov 2021 16:44:00 -0300
Message-Id: <20211122194400.30836-10-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds this common format to vkms.

This commit also adds new helper macros to deal with fixed-point
arithmetic.

It was done to improve the precision of the conversion to ARGB16161616
since the "conversion ratio" is not an integer.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V3: Adapt the handlers to the new format introduced in patch 7 V3.
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 74 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  6 +++
 drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 4 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 661da39d1276..dc612882dd8c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,6 +11,8 @@ format_transform_func get_fmt_transform_function(u32 format)
 		return &get_ARGB16161616;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &XRGB16161616_to_ARGB16161616;
+	else if (format == DRM_FORMAT_RGB565)
+		return &RGB565_to_ARGB16161616;
 	else
 		return &XRGB8888_to_ARGB16161616;
 }
@@ -23,6 +25,8 @@ format_transform_func get_wb_fmt_transform_function(u32 format)
 		return &convert_to_ARGB16161616;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &convert_to_XRGB16161616;
+	else if (format == DRM_FORMAT_RGB565)
+		return &convert_to_RGB565;
 	else
 		return &convert_to_XRGB8888;
 }
@@ -33,6 +37,26 @@ static int pixel_offset(struct vkms_frame_info *frame_info, int x, int y)
 				  + (x * frame_info->cpp);
 }
 
+/*
+ * FP stands for _Fixed Point_ and **not** _Float Point_
+ * LF stands for Long Float (i.e. double)
+ * The following macros help doing fixed point arithmetic.
+ */
+/*
+ * With FP scale 15 we have 17 and 15 bits of integer and fractional parts
+ * respectively.
+ *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
+ * 31                                          0
+ */
+#define FP_SCALE 15
+
+#define LF_TO_FP(a) ((a) * (u64)(1 << FP_SCALE))
+#define INT_TO_FP(a) ((a) << FP_SCALE)
+#define FP_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FP_SCALE))
+#define FP_DIV(a, b) ((s32)(((s64)(a) << FP_SCALE) / (b)))
+/* This macro converts a fixed point number to int, and round half up it */
+#define FP_TO_INT_ROUND_UP(a) (((a) + (1 << (FP_SCALE - 1))) >> FP_SCALE)
+
 /*
  * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
  *
@@ -125,6 +149,33 @@ void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 	}
 }
 
+void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			    struct line_buffer *stage_buffer)
+{
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels++) {
+		u16 rgb_565 = le16_to_cpu(*src_pixels);
+		int fp_r = INT_TO_FP((rgb_565 >> 11) & 0x1f);
+		int fp_g = INT_TO_FP((rgb_565 >> 5) & 0x3f);
+		int fp_b = INT_TO_FP(rgb_565 & 0x1f);
+
+		/*
+		 * The magic constants is the "conversion ratio" and is calculated
+		 * dividing 65535(2^16 - 1) by 31(2^5 -1) and 63(2^6 - 1)
+		 * respectively.
+		 */
+		int fp_rb_ratio = LF_TO_FP(2114.032258065);
+		int fp_g_ratio = LF_TO_FP(1040.238095238);
+
+		stage_buffer[x].a = (u16)0xffff;
+		stage_buffer[x].r = FP_TO_INT_ROUND_UP(FP_MUL(fp_r, fp_rb_ratio));
+		stage_buffer[x].g = FP_TO_INT_ROUND_UP(FP_MUL(fp_g, fp_g_ratio));
+		stage_buffer[x].b = FP_TO_INT_ROUND_UP(FP_MUL(fp_b, fp_rb_ratio));
+	}
+}
+
 
 /*
  * The following  functions take an line of ARGB16161616 pixels from the
@@ -203,3 +254,26 @@ void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
 		dst_pixels[0] = src_buffer[x].b;
 	}
 }
+
+void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
+		       struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels++) {
+		int fp_r = INT_TO_FP(src_buffer[x].r);
+		int fp_g = INT_TO_FP(src_buffer[x].g);
+		int fp_b = INT_TO_FP(src_buffer[x].b);
+
+		int fp_rb_ratio = LF_TO_FP(2114.032258065);
+		int fp_g_ratio = LF_TO_FP(1040.238095238);
+
+		u16 r = FP_TO_INT_ROUND_UP(FP_DIV(fp_r, fp_rb_ratio));
+		u16 g = FP_TO_INT_ROUND_UP(FP_DIV(fp_g, fp_g_ratio));
+		u16 b = FP_TO_INT_ROUND_UP(FP_DIV(fp_b, fp_rb_ratio));
+
+		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 22358f3a33ab..836d6e43ea90 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -21,6 +21,9 @@ void get_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 				  struct line_buffer *stage_buffer);
 
+void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			    struct line_buffer *stage_buffer);
+
 void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
 			 struct line_buffer *src_buffer);
 
@@ -33,6 +36,9 @@ void convert_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
 			     struct line_buffer *src_buffer);
 
+void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
+		       struct line_buffer *src_buffer);
+
 typedef void (*format_transform_func)(struct vkms_frame_info *frame_info, int y,
 				      struct line_buffer *buffer);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 1d70c9e8f109..4643eefcdf29 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,14 +13,16 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XRGB16161616
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_ARGB16161616
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static struct drm_plane_state *
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 393d3fc7966f..1aaa630090d3 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -15,7 +15,8 @@
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_ARGB16161616
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

