Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D467D43B153
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19226E42F;
	Tue, 26 Oct 2021 11:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108C6E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:49 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id bj31so14878942qkb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BpzB9psURBvhNvmXpPEQXb13hz7OsGQ74tdDzFCqOD4=;
 b=GXDL8pf6VLTBwZRBxzMJfKTsTcr0Netp0zWt3lU2zsSyJFqLVkkS2/NAaVI+yYrdbJ
 nv2qglrowxZnYGS7l7gmLxSwlVIe3WdOOIHtiSjBwqcw/IeWLmr94/Ot/8OeNNB+Ywcf
 lzwyhnEEz7C4uQCG8RRUrIh4hc8c7GK2ooTTzzy5Ll8u23wD1pGQZgaCb9SU9+HPCuRc
 A8e8mZSxU3im4WO6EC0dTPimgFWPCBOnPEMbZGj1PNEwbg0THpcr8vYM7ls53yX5xvXG
 AmJMrM4xbLevIc6Yq8/DlDJy29R2YY8w/i8kLBqCaQV0aPeA32DxBwU8KyN/jBnlcI2A
 Elzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BpzB9psURBvhNvmXpPEQXb13hz7OsGQ74tdDzFCqOD4=;
 b=fxbjv2u43MF+BY/kl2YTOR1//y+BhRVcAOrHGNI5LYhsMsIyTmdwWPF3R2A1/yzTQf
 UjI+LxgSwwmQOVCy2G/eRipIprsGI3/+l5zTajNINSIRoAuK+AeqepEt+X9E5M+b0pJ+
 fk6GZS5PXOCXgfg6tC9nQ+BR/uTewlpE8AKvF3Y+ha7BB78A/RbTsuR+GZtlgN3YKvcU
 8CU5kTc/VQX1altYV5MZ9JewsG/J4Yak98sNEX0KhZiCzschHMEmPkBU1Dn17VQr4Plc
 g12k0K29/CAoIcXWMroNJO+Dm3VCUz1jdx/u07onGdKKn+y7Wnv0O9X5P+KevRkvXy57
 QmSw==
X-Gm-Message-State: AOAM530OXgqJG5M/kIjmBCx2YqGqOERRaBG2CDMTf71Q9DVoPb/9Gt6l
 KswKm2N14ZljML04VCaHXE4=
X-Google-Smtp-Source: ABdhPJwTt1Btc3rYbvaHDdJEFrwttZSfHy5RAuJQKD6wxekYKq3IlBd2Q50hxF6KarbzOl9TAqKCew==
X-Received: by 2002:a37:9606:: with SMTP id y6mr18046734qkd.13.1635248088339; 
 Tue, 26 Oct 2021 04:34:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:48 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm: vkms: Add support the RGB565 format
Date: Tue, 26 Oct 2021 08:34:08 -0300
Message-Id: <20211026113409.7242-9-igormtorrente@gmail.com>
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

Adds this common format to vkms.

This commit also adds new helper macros to deal with fixed-point
arithmetic.

It was done to improve the precision of the conversion to ARGB16161616
since the "conversion ratio" is not an integer.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++
 drivers/gpu/drm/vkms/vkms_formats.h   | 72 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f16fcfc88cea..57ec82839a89 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -166,6 +166,8 @@ static void ((*get_line_fmt_transform_function(u32 format))
 		return &get_ARGB16161616;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &XRGB16161616_to_ARGB16161616;
+	else if (format == DRM_FORMAT_RGB565)
+		return &RGB565_to_ARGB16161616;
 	else
 		return &XRGB8888_to_ARGB16161616;
 }
@@ -179,6 +181,8 @@ static void ((*get_output_line_function(u32 format))
 		return &convert_to_ARGB16161616;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &convert_to_XRGB16161616;
+	else if (format == DRM_FORMAT_RGB565)
+		return &convert_to_RGB565;
 	else
 		return &convert_to_XRGB8888;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index aa433edd00bd..1e2db1a844aa 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -8,6 +8,26 @@
 #define pixel_offset(composer, x, y) \
 	((composer)->offset + ((y) * (composer)->pitch) + ((x) * (composer)->cpp))
 
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
@@ -102,6 +122,35 @@ static void XRGB16161616_to_ARGB16161616(void *pixels_addr, int length,
 	}
 }
 
+static void RGB565_to_ARGB16161616(void *pixels_addr, int length,
+				   u64 *line_buffer)
+{
+	__le16 *src_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		u16 rgb_565 = le16_to_cpu(*src_pixels);
+		int fp_r = INT_TO_FP((rgb_565 >> 11) & 0x1f);
+		int fp_g = INT_TO_FP((rgb_565 >> 5) & 0x3f);
+		int fp_b = INT_TO_FP(rgb_565 & 0x1f);
+
+		/*
+		 * The magic constants is the "conversion ratio" and is calculated
+		 * dividing 65535(2^16 - 1) by 31(2^5 -1) and 63(2^6 - 1) respectively.
+		 */
+		int fp_rb_ratio = LF_TO_FP(2114.032258065);
+		int fp_g_ratio = LF_TO_FP(1040.238095238);
+
+		u64 r = FP_TO_INT_ROUND_UP(FP_MUL(fp_r, fp_rb_ratio));
+		u64 g = FP_TO_INT_ROUND_UP(FP_MUL(fp_g, fp_g_ratio));
+		u64 b = FP_TO_INT_ROUND_UP(FP_MUL(fp_b, fp_rb_ratio));
+
+		line_buffer[i] = 0xffffllu << 48 | r << 32 | g << 16 | b;
+
+		src_pixels++;
+	}
+}
+
 /*
  * The following functions are used as blend operations. But unlike the
  * `alpha_blend`, these functions take an ARGB16161616 pixel from the
@@ -177,4 +226,27 @@ static void convert_to_XRGB16161616(void *pixels_addr, int length,
 	}
 }
 
+static void convert_to_RGB565(void *pixels_addr, int length,
+			      u64 *line_buffer)
+{
+	__le16 *dst_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++)  {
+		int fp_r = INT_TO_FP((line_buffer[i] >> 32) & 0xffff);
+		int fp_g = INT_TO_FP((line_buffer[i] >> 16) & 0xffff);
+		int fp_b = INT_TO_FP(line_buffer[i] & 0xffffllu);
+
+		int fp_rb_ratio = LF_TO_FP(2114.032258065);
+		int fp_g_ratio = LF_TO_FP(1040.238095238);
+
+		u16 r = FP_TO_INT_ROUND_UP(FP_DIV(fp_r, fp_rb_ratio));
+		u16 g = FP_TO_INT_ROUND_UP(FP_DIV(fp_g, fp_g_ratio));
+		u16 b = FP_TO_INT_ROUND_UP(FP_DIV(fp_b, fp_rb_ratio));
+
+		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
+		dst_pixels++;
+	}
+}
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 516e48b38806..de250808aa39 100644
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
index 0f7bb77f981e..11eb1be5a0fc 100644
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

