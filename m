Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E924A80B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23D26E822;
	Wed, 19 Aug 2020 20:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D296E822
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:53:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k8so3474951wma.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=leOKJQwVub96yOA0n24Q0PTDFaIFg46bzjrPQUgb4xk=;
 b=j7zmd3MeXvJDX8vwMtu3DoXYCbpZ7kXuO3iKnMJ6xTP+3XEm3Bv+Ryb05aKqnrunfy
 6J23qggYuT3sf/hc/zPLdqVrqP92ujiXMslyH4Lzol7333oXUBPEHx65dkIV4rCAXTrl
 LccOBgWVyEFpyNgyANVfWMs4aV5qD8FFbtn5Us2XLW/U9FQa+/hjaYij+KAiVQJrpdNl
 hJG8TFnOifFfM6quOUyT+dOo1Te28Y/A9mP9X/8VdMA95lb8fKgYa7W+nZzYJMnMx9Mv
 71qf7YrNHGjUJEvxPcfih46E37P67wLg+uwr5rl1AQ10gWyr5ZOa0CGEG1qj4oSHJESx
 GtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=leOKJQwVub96yOA0n24Q0PTDFaIFg46bzjrPQUgb4xk=;
 b=keFzMWsnjeNddoN4l4qCRhNCIIhNg7FRYnh0xUBp9UOwgCf2vQxo9jqOPo9eD29Kbw
 fcSxcCC/UsvvRZ4hVxgqogtgXVlIIfh1JFCkjgw0daKoWdFw3/9nXHK/e0Vy8Ay0uLXO
 84JEOQz6TGeGO9eEIbkCPZB47//Dmmd6JSl2vLQ3BWK25p1PRlyVq9aXfX0brLLGS1Fo
 3cxW1/2gNzkZwDhkP0UEodl4o3m/Wj2wpWZig3JFkwsm6fdX+Tu1AGQ+gKlORGHhbTzG
 j2kCzK/iLtGl9EjiMz9lNVM169ZvEN99W9BiYa0kX3dmVOEiFZBE27DjUyWRSc2dGVN3
 PiAA==
X-Gm-Message-State: AOAM533bIql0XCWebfxZk8seTesAHF4yZpHztQbbey0oTz04CAEmY4Pe
 tgOUiondVCFTKv6jZMYk5yI=
X-Google-Smtp-Source: ABdhPJxS97nXAm7kMwokzi7upW74QpAFViVTmCEHInK9MWtkqOHqWDrZvZlWI9l1KgGZS+9IL7sc6w==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr109387wmg.184.1597870426631; 
 Wed, 19 Aug 2020 13:53:46 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id y2sm162239wmg.25.2020.08.19.13.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 13:53:46 -0700 (PDT)
Date: Wed, 19 Aug 2020 17:53:36 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: add alpha-premultiplied color blending
Message-ID: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current VKMS blend function ignores alpha channel and just overwrites
vaddr_src with vaddr_dst. This XRGB approach triggers a warning when
running the kms_cursor_crc/cursor-alpha-transparent test case. In IGT
tests, cairo_format_argb32 uses premultiplied alpha (according to
documentation), so this patch considers premultiplied alpha colors to
compose vaddr_src with vaddr_dst.

This change removes the following cursor-alpha-transparent warning:
Suspicious CRC: All values are 0.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 43 +++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4f3b07a32b60..6aac962d3e2e 100644
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
@@ -42,6 +40,32 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 	return crc;
 }
 
+u8 blend_channel(u8 c_src, u8 c_dst, u8 a_src)
+{
+	u32 pre_blend;
+	u8 new_color;
+
+	/* Premultiplied alpha blending - IGT + cairo context */
+	pre_blend = (c_src * 255 + c_dst * (255 - a_src));
+
+	/* Faster div by 255 */
+	new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
+
+	return new_color;
+}
+
+void alpha_blending(u8 *argb_src, u8 *argb_dst)
+{
+	u8 a_src;
+
+	a_src = argb_src[3];
+	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], a_src);
+	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], a_src);
+	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], a_src);
+	/* Opaque primary */
+	argb_dst[3] = 0xFF;
+}
+
 /**
  * blend - blend value at vaddr_src with value at vaddr_dst
  * @vaddr_dst: destination address
@@ -50,12 +74,9 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
  * @src_composer: source framebuffer's metadata
  *
  * Blend value at vaddr_src with value at vaddr_dst.
- * Currently, this function write value of vaddr_src on value
- * at vaddr_dst using buffer's metadata to locate the new values
- * from vaddr_src and their destination at vaddr_dst.
- *
- * TODO: Use the alpha value to blend vaddr_src with vaddr_dst
- *	 instead of overwriting it.
+ * Currently, this function considers premultiplied alpha for blending, as used
+ * by Cairo. It uses buffer's metadata to locate the new composite values at
+ * vaddr_dst.
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
 		  struct vkms_composer *dest_composer,
@@ -63,6 +84,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 {
 	int i, j, j_dst, i_dst;
 	int offset_src, offset_dst;
+	u8 *p_dst, *p_src;
 
 	int x_src = src_composer->src.x1 >> 16;
 	int y_src = src_composer->src.y1 >> 16;
@@ -84,8 +106,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 				     + (i * src_composer->pitch)
 				     + (j * src_composer->cpp);
 
-			memcpy(vaddr_dst + offset_dst,
-			       vaddr_src + offset_src, sizeof(u32));
+			p_src = (u8 *)(vaddr_src + offset_src);
+			p_dst = (u8 *)(vaddr_dst + offset_dst);
+			alpha_blending(p_src, p_dst);
 		}
 		i_dst++;
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
