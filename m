Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDB2517FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 13:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DF26E094;
	Tue, 25 Aug 2020 11:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6846E094
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 11:45:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 2so1223455wrj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Z4KyrBawh5I2x6NeIqjVgo7gnUcWLY3kFNO+RloeAYg=;
 b=IGFoEHgaIPsX9CXu6OXIGlc65XiYPBOtJgKPZAGkiYf3hxvLYZzjcEj+u1mw/CCR/Z
 aciCwtxxalXtYu9J/3oxzEQDNVJPNFt9o+JzrtROJKU+HsxcbOxxezLQxkhVxnwLlhW7
 j+pdNg2eEpchO0gy09C+cS28y8WO/Jh2rJ1QfvftJF4/+kJPuTTO0KKel2fQJZOlo2md
 mt+Sxk2+sWmqN7dDdXYW4tibOUl5WLhRV1W4agi64A0sLDGzM8nMOGem+qgI7wIQpj0u
 BD4YB1DgLwUdrz+TCRuYuHW5zREnZuhxOEvZgV0PqxaRpcAsn2JZZ5pxMwnAFVZQq8cS
 eY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Z4KyrBawh5I2x6NeIqjVgo7gnUcWLY3kFNO+RloeAYg=;
 b=BlPdi95FQouSRAaVghDRO7ejGdXdY/BCXAKElLbE7lTGXx4qOjZ/v/ConBhAOOqBwf
 CioPItd9PkNKC3dIqQO8PhpsEllwvE+79RwmUdvZpVF3tdagpZ2Wb4Pnj2p9WEE6vZKP
 99v35IiauRN3GOY2bOo76i0UWDfq1n8U8TGmKmzfcmk2QDA+YjCqi2euhId4cR8/d5z/
 65qO+KOVBfX0YmAh5n6wAdQK5cWRA9JYfYkIKgt1daWu6H6YVn10sULfyMdhdeTKtEQg
 zouOpMGhmEGRuZuopO6sieXsBXeBiEvRNY2ajl4bmVPsUJkg4jUoljg+wGc3xg9L83+Z
 kzvw==
X-Gm-Message-State: AOAM533CHT59nPv4ATK/zW4F7X7XA49BN6t36d7dJNg0Jo2YvW5lh/Ml
 Oya0690S42GyZPU7blmBX68=
X-Google-Smtp-Source: ABdhPJwA1geacmCXwy6uAKsMZ9o5Ac2JW6XM1SyfJ+UddpZGIjN2tx5d+0qDGoLY6mIhYBRhe/487A==
X-Received: by 2002:adf:e411:: with SMTP id g17mr10985118wrm.77.1598355940308; 
 Tue, 25 Aug 2020 04:45:40 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 126sm5729268wme.42.2020.08.25.04.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 04:45:39 -0700 (PDT)
Date: Tue, 25 Aug 2020 08:45:32 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2] drm/vkms: add alpha-premultiplied color blending
Message-ID: <20200825114532.abzdooluny2ekzvm@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: kernel-usp@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VKMS blend function was ignoring the alpha channel and just
overwriting vaddr_src with vaddr_dst. This XRGB approach triggers a
warning when running the kms_cursor_crc/cursor-alpha-transparent test
case. In IGT, cairo_format_argb32 uses premultiplied alpha (according to
documentation). Also current DRM assumption is that alpha is
premultiplied. Therefore, this patch considers premultiplied alpha
blending eq to compose vaddr_src with vaddr_dst.

This change removes the following cursor-alpha-transparent warning:
"Suspicious CRC: All values are 0."

--

v2:
- static for local functions
- const for the read-only variable argb_src
- replaces variable names
- drops unnecessary comment

--

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 55 ++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4f3b07a32b60..eaecc5a6c5db 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -32,8 +32,6 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 			src_offset = composer->offset
 				     + (i * composer->pitch)
 				     + (j * composer->cpp);
-			/* XRGB format ignores Alpha channel */
-			bitmap_clear(vaddr_out + src_offset, 24, 8);
 			crc = crc32_le(crc, vaddr_out + src_offset,
 				       sizeof(u32));
 		}
@@ -42,27 +40,51 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 	return crc;
 }
 
+static u8 blend_channel(u8 src, u8 dst, u8 alpha)
+{
+	u32 pre_blend;
+	u8 new_color;
+
+	pre_blend = (src * 255 + dst * (255 - alpha));
+
+	/* Faster div by 255 */
+	new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
+
+	return new_color;
+}
+
+static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
+{
+	u8 alpha;
+
+	alpha = argb_src[3];
+	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
+	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
+	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
+	/* Opaque primary */
+	argb_dst[3] = 0xFF;
+}
+
 /**
  * blend - blend value at vaddr_src with value at vaddr_dst
  * @vaddr_dst: destination address
  * @vaddr_src: source address
- * @dest_composer: destination framebuffer's metadata
+ * @dst_composer: destination framebuffer's metadata
  * @src_composer: source framebuffer's metadata
  *
- * Blend value at vaddr_src with value at vaddr_dst.
- * Currently, this function write value of vaddr_src on value
- * at vaddr_dst using buffer's metadata to locate the new values
- * from vaddr_src and their destination at vaddr_dst.
- *
- * TODO: Use the alpha value to blend vaddr_src with vaddr_dst
- *	 instead of overwriting it.
+ * Blend the vaddr_src value with the vaddr_dst value using the pre-multiplied
+ * alpha blending equation, since DRM currently assumes that the pixel color
+ * values have already been pre-multiplied with the alpha channel values. See
+ * more drm_plane_create_blend_mode_property(). This function uses buffer's
+ * metadata to locate the new composite values at vaddr_dst.
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
-		  struct vkms_composer *dest_composer,
+		  struct vkms_composer *dst_composer,
 		  struct vkms_composer *src_composer)
 {
 	int i, j, j_dst, i_dst;
 	int offset_src, offset_dst;
+	u8 *pixel_dst, *pixel_src;
 
 	int x_src = src_composer->src.x1 >> 16;
 	int y_src = src_composer->src.y1 >> 16;
@@ -77,15 +99,16 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 
 	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
 		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
-			offset_dst = dest_composer->offset
-				     + (i_dst * dest_composer->pitch)
-				     + (j_dst++ * dest_composer->cpp);
+			offset_dst = dst_composer->offset
+				     + (i_dst * dst_composer->pitch)
+				     + (j_dst++ * dst_composer->cpp);
 			offset_src = src_composer->offset
 				     + (i * src_composer->pitch)
 				     + (j * src_composer->cpp);
 
-			memcpy(vaddr_dst + offset_dst,
-			       vaddr_src + offset_src, sizeof(u32));
+			pixel_src = (u8 *)(vaddr_src + offset_src);
+			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
+			alpha_blending(pixel_src, pixel_dst);
 		}
 		i_dst++;
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
