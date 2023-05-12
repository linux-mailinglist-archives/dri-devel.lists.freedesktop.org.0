Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2647005CB
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F110E67C;
	Fri, 12 May 2023 10:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281AF10E67B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ISowlXRJpxVb+xTSbDtJ1LdH0iB6v4Zby/Sy7D5ZbqE=; b=cKMCMcClDaBWzIC9xvhFy2hd/3
 cjsTlyJItjRdizRZ0Flo5iNNhMP3xT3wyMWGhL2yH8jBs0HuzKExrz9FC9RfvLoPN6m6qF2ftPpFK
 OZf7nGCFaTbsunwELfHWdj2IbhG+GsmwrWVqJPVIZVepwaFTBhwWQiGxI+7LPi53uKmPMA1WH2KyB
 uotrfIP89/wmxOMd+J0byg40p0JBF/4xEDFhx8DxON3Pwd6pM2uSy5TirwuYa8BbHRgHASvUPUuTK
 oS63K+lqKUpxjcGnnehuX/VX+oTis51DG/E8m+5QibZhTKULgACJYf5dMJOtBsfNgJJgI3xnyY5C7
 R2k67Byw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pxQDI-007gnd-Kl; Fri, 12 May 2023 12:41:29 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v3 2/2] drm/vkms: Fix RGB565 pixel conversion
Date: Fri, 12 May 2023 07:40:45 -0300
Message-Id: <20230512104044.65034-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512104044.65034-1-mcanal@igalia.com>
References: <20230512104044.65034-1-mcanal@igalia.com>
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

Currently, the pixel conversion isn't rounding the fixed-point values
before assigning it to the RGB coefficients, which is causing the IGT
pixel-format tests to fail. So, use the drm_fixp2int_round() fixed-point
helper to round the values when assigning it to the RGB coefficients.

Tested with igt@kms_plane@pixel-format and igt@kms_plane@pixel-format-source-clamping.

[v2]:
    * Use drm_fixp2int_round() to fix the pixel conversion instead of
      casting the values to s32 (Melissa Wen).

Fixes: 89b03aeaef16 ("drm/vkms: fix 32bit compilation error by replacing macros")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index ebacb8efa055..5945da0beba6 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -106,9 +106,9 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
 	out_pixel->a = (u16)0xffff;
-	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
-	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
-	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
@@ -232,9 +232,9 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
 		s64 fp_g = drm_int2fixp(in_pixels[x].g);
 		s64 fp_b = drm_int2fixp(in_pixels[x].b);
 
-		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
-		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
-		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
+		u16 r = drm_fixp2int_round(drm_fixp_div(fp_r, fp_rb_ratio));
+		u16 g = drm_fixp2int_round(drm_fixp_div(fp_g, fp_g_ratio));
+		u16 b = drm_fixp2int_round(drm_fixp_div(fp_b, fp_rb_ratio));
 
 		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
 	}
-- 
2.40.1

