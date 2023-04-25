Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073076EE4D1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 17:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3310E2DB;
	Tue, 25 Apr 2023 15:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE210E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G1ttLqP+WYxyFuR2KPFs952aSYGn1IU5GuTcEi0UmLM=; b=VDWl+ZJ/B2svDaHcQpB7gZPbK/
 uivAfbMoNT2vxTu6n7CXbfvdVzYx3d0f/8wEcOU0pfS6P5gok7yaRp3yatlUVv2zGAjHlUClVEuSk
 h7OTnGRzqkmQixYEizaT3zHx0hoSjAWqV53FjUlfkLwunSjhCJu2jApmBPlqc9g2LykEO/qiqC8lb
 VZySJ1/pyIr8gx7cUFcYF/HcBdBhWvzQTQiz7XzaiGOx1vGjQHD7itkKJhiA2iUDA/ZEKr7Vgf9lU
 H72sSKhqeFCE9RuEl0sK4/a3Y4p6c88UesGMf5h/lV4MP3eMrqdNPyDh5izYU4HHP2TOLe4NKu2Ax
 A3GNlQtQ==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1prKg8-00Bhuu-In; Tue, 25 Apr 2023 17:34:05 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: [PATCH] drm/vkms: Fix RGB565 pixel conversion
Date: Tue, 25 Apr 2023 12:33:53 -0300
Message-Id: <20230425153353.238844-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perform the correct casting of the intermediate coefficients of the
RGB565 pixel conversion. Currently, the pixel conversion is using s64
for the intermediate coefficients, which is causing the IGT pixel-format
tests to fail. So, cast the operands to s32 in order to improve the
vkms' test coverage.

Tested with igt@kms_plane@pixel-format and igt@kms_plane@pixel-format-source-clamping.

Fixes: 89b03aeaef16 ("drm/vkms: fix 32bit compilation error by replacing macros")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 8d948c73741e..f6aeaea81902 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -88,8 +88,8 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixels = (u16 *)src_pixels;
 
-	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
-	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
+	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
+	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
 	u16 rgb_565 = le16_to_cpu(*pixels);
 	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
@@ -97,9 +97,9 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
 	out_pixel->a = (u16)0xffff;
-	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
-	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
-	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel->r = drm_fixp2int((s32)drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixel->g = drm_fixp2int((s32)drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel->b = drm_fixp2int((s32)drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
@@ -208,17 +208,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			    src_buffer->n_pixels);
 
-	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
-	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
+	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
+	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
 	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
 		s64 fp_r = drm_int2fixp(in_pixels[x].r);
 		s64 fp_g = drm_int2fixp(in_pixels[x].g);
 		s64 fp_b = drm_int2fixp(in_pixels[x].b);
 
-		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
-		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
-		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
+		u16 r = drm_fixp2int((s32)drm_fixp_div(fp_r, fp_rb_ratio));
+		u16 g = drm_fixp2int((s32)drm_fixp_div(fp_g, fp_g_ratio));
+		u16 b = drm_fixp2int((s32)drm_fixp_div(fp_b, fp_rb_ratio));
 
 		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
 	}
-- 
2.40.0

