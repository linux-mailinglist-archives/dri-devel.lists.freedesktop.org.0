Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D15B3692
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6F010ECAD;
	Fri,  9 Sep 2022 11:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1210ECAD
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NHlnMrWwyxzi/2t3oOb6Nwp8HdeT8E2OLXzPf0mNSbM=; b=HDbrEfPb1Ex4CaHNtWs0oQxlg+
 lKJu6FZMTC6bS1t4Sq3b/1SErEcDM76Levk/A2wDeYH+rV9KTZ/tKnD1m1NONnBmtPfeWoms/iBgG
 4jpTSD0CrILJ94zRyX8YuIR2imVVHfaYFxDAMfj3/hYsGgt4rXjLPW0ChQkPDCWJ+Ysts90Zt+fU+
 fwipMk9ZVAAqHxAUluB+k2uwPn+pNfQ+4buONzNFsLs0C+h77d+jdv2d14E+7p1npjz8xwNam+b6r
 Zmr8PbnI/6i/O9URn3WOxWu4b+skkTYkVLasEl7gd4l6R/eY6JcP7s5Ycs1wye22G8Ur/pY29UqJe
 sUsy+hpw==;
Received: from [38.44.74.92] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oWcOK-00DtYu-Qj; Fri, 09 Sep 2022 13:41:48 +0200
From: Melissa Wen <mwen@igalia.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, igormtorrente@gmail.com
Subject: [PATCH] drm/vkms: fix 32bit compilation error by replacing macros
Date: Fri,  9 Sep 2022 10:41:33 -0100
Message-Id: <20220909114133.267689-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Melissa Wen <mwen@igalia.com>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace vkms_formats macros for fixed-point operations with functions
from drm/drm_fixed.h to do the same job and fix 32-bit compilation
errors.

Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 300abb4d1dfe..ddcd3cfeeaac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -1,27 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include <drm/drm_rect.h>
+#include <linux/kernel.h>
 #include <linux/minmax.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_fixed.h>
 
 #include "vkms_formats.h"
 
-/* The following macros help doing fixed point arithmetic. */
-/*
- * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
- * parts respectively.
- *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
- * 31                                          0
- */
-#define SHIFT 15
-
-#define INT_TO_FIXED(a) ((a) << SHIFT)
-#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
-#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
-/* This macro converts a fixed point number to int, and round half up it */
-#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
-#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
-#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
-
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
 	return frame_info->offset + (y * frame_info->pitch)
@@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			       stage_buffer->n_pixels);
 
-	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
-	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
+	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
 		u16 rgb_565 = le16_to_cpu(*src_pixels);
-		s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
-		s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
-		s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
+		s32 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
+		s32 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
+		s32 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
 		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
-		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
-		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
+		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
+		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
+		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
 	}
 }
 
@@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			    src_buffer->n_pixels);
 
-	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
-	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), 31);
+	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), 63);
 
 	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
-		s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
-		s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
-		s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
+		s32 fp_r = drm_int2fixp(in_pixels[x].r);
+		s32 fp_g = drm_int2fixp(in_pixels[x].g);
+		s32 fp_b = drm_int2fixp(in_pixels[x].b);
 
-		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
-		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
-		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
+		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
+		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
+		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
 
 		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
 	}
-- 
2.35.1

