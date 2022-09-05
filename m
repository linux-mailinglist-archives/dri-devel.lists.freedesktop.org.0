Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84E5AD968
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610210E4B9;
	Mon,  5 Sep 2022 19:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688010E4B8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:59 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v2-20020a056830090200b006397457afecso6663666ott.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NWJhnUimVkxjF+4Gb04O1Spyhmg7+xfGLsFhVgz9iF0=;
 b=hobZc5/O5pgTpfEPWqEISoW3j0BlkWJ7buTWvPaFh5jp/Ib7kXYx+7Rgl1okbMEcS0
 qwz+s/f46ZZC0SwpPevRMQLkWWYLnw6GNI8Gj9nTTyE9Lq7NBwXPI4RxsahWpb8rrHfc
 6TylrpsD/JnCq19ZfoLZQYpNb1aYdtJJ3cZ/Hb72Z5C74nAsWUDCERGFOF0f0ruthcZ9
 2nalj6rB3D/0ji8k0Bw5+JTpot/VueY+DEe8Cd6RymCVlKGvG8ysjSXZrTALQBfWYzmM
 1rMRh2jdbBO416xc31wpBrozKIuf39PMfT/oTElEYB7CB1OkRy0631FR+3/V1RPk8d33
 t3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NWJhnUimVkxjF+4Gb04O1Spyhmg7+xfGLsFhVgz9iF0=;
 b=ezyIQxWNvOM/s0xYZnrjdI8ROzclEpB8kCbHnMcbpOimYBzrj7S0L7d6tT3uE0VQYX
 8XSNRPnnxChfEia4tILIFnrJrEIPgoV5n1KoNWDO5zPCy2I3JneaGSqYVnys/G6aPIqW
 nHlcICGaz5i6kiOSqHpVmvTSVpc6THtCn9P0xPGgoQqgJVfAeoPVQf5eF1lxNh9Sc0as
 482MwV1EJTX3chdZhN/LmTv7hy5ZygAyVNkFpiIA5o9y/QLMsVVmucvyY8sf2qSozdGm
 HzuDcLgL8utHFWb+LrwvBYhPooao3wuGTChHDPRfJ61CH62sPlvMl9ZGKAFTZcOD+hth
 tmcA==
X-Gm-Message-State: ACgBeo1bSt9wW+WoMhHD2IFE0UQ7xg9OpneTeGr3GROdGsjBHX9UzdmX
 GJF2OGGtE1ObNvGkipKAp1F5UMiAJH4=
X-Google-Smtp-Source: AA6agR7OLlAZPG+aZCd/XXuNFSP3cgcYryoDHuowOKPGnbHpX31K0JZADct44EJLptX4mFCAEf3FuA==
X-Received: by 2002:a9d:5617:0:b0:639:4766:904f with SMTP id
 e23-20020a9d5617000000b006394766904fmr19692522oti.319.1662404939154; 
 Mon, 05 Sep 2022 12:08:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:58 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 9/9] drm: vkms: Add support to the RGB565 format
Date: Mon,  5 Sep 2022 16:08:11 -0300
Message-Id: <20220905190811.25024-10-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
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
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit also adds new helper macros to deal with fixed-point
arithmetic.

It was done to improve the precision of the conversion to ARGB16161616
since the "conversion ratio" is not an integer.

V3: Adapt the handlers to the new format introduced in patch 7 V3.
V5: Minor improvements
V6: Minor improvements (Pekka Paalanen)

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b583da7fe0b1..30bf8e6660ad 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -5,6 +5,23 @@
 
 #include "vkms_formats.h"
 
+/* The following macros help doing fixed point arithmetic. */
+/*
+ * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
+ * parts respectively.
+ *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
+ * 31                                          0
+ */
+#define SHIFT 15
+
+#define INT_TO_FIXED(a) ((a) << SHIFT)
+#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
+#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
+/* This macro converts a fixed point number to int, and round half up it */
+#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
+#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
+#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
+
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
 	return frame_info->offset + (y * frame_info->pitch)
@@ -112,6 +129,30 @@ static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 	}
 }
 
+static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
+			       const struct vkms_frame_info *frame_info, int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			       stage_buffer->n_pixels);
+
+	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
+		u16 rgb_565 = le16_to_cpu(*src_pixels);
+		s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
+		s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
+		s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
+
+		out_pixels[x].a = (u16)0xffff;
+		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
+		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
+		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
+	}
+}
+
 
 /*
  * The following  functions take an line of argb_u16 pixels from the
@@ -199,6 +240,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
 	}
 }
 
+static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
+			       const struct line_buffer *src_buffer, int y)
+{
+	int x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
+		s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
+		s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
+		s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
+
+		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
+		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
+		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
+
+		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
+	}
+}
+
 void *get_frame_to_line_function(u32 format)
 {
 	switch (format) {
@@ -210,6 +276,8 @@ void *get_frame_to_line_function(u32 format)
 		return &ARGB16161616_to_argb_u16;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_to_argb_u16;
+	case DRM_FORMAT_RGB565:
+		return &RGB565_to_argb_u16;
 	default:
 		return NULL;
 	}
@@ -226,6 +294,8 @@ void *get_line_to_frame_function(u32 format)
 		return &argb_u16_to_ARGB16161616;
 	case DRM_FORMAT_XRGB16161616:
 		return &argb_u16_to_XRGB16161616;
+	case DRM_FORMAT_RGB565:
+		return &argb_u16_to_RGB565;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index f823fe315de6..f4319066adcc 100644
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
index 16feea884646..84a51cd281b9 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -17,7 +17,8 @@
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

