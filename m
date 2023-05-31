Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BB717BB6
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1EA10E49F;
	Wed, 31 May 2023 09:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5B810E499
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685524880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVy/1t6exwTOCwJQldrkiT+1qY9iLYJjwwPq6u2+quo=;
 b=SZqFYCgHsgjKL1Dc2GdCphr4hRGgcweDRsqN0+oDieCSwJ8SsFo7kHdmxyVp++/pMaFEMc
 9sqn5Yg4FGTH7AttnmpbJlpbE+HwdyulGSZitqLNfChhkObwbhulaXUB8r54fPJorB28sU
 TXNkr3eA8QXTRB2vaGU7TzeYM7BGAbE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-k4HCkeYoNrKDpRRybnDdAQ-1; Wed, 31 May 2023 05:21:19 -0400
X-MC-Unique: k4HCkeYoNrKDpRRybnDdAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACAB51C05153;
 Wed, 31 May 2023 09:21:18 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A5A492B00;
 Wed, 31 May 2023 09:21:17 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH v2 2/4] drm/mgag200: Simplify offset and scale computation.
Date: Wed, 31 May 2023 11:21:08 +0200
Message-Id: <20230531092110.140564-3-jfalempe@redhat.com>
In-Reply-To: <20230531092110.140564-1-jfalempe@redhat.com>
References: <20230531092110.140564-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bppshift variable introduces a lot of complexity, and can be removed.
From the Matrox documentation, scale is the number of byte per pixels - 1,
And offset is pitch (in bits) / 128 (or pitch (in bytes) / 16).
The old formula gives the same results, but is harder to understand.

No functional changes.

offset:
16bit: (bppshift = 1)
offset = width >> (4 - bppshift) => width / 8 => pitch / 16

24bit:  (bppshift = 0)
offset = (width * 3) >> (4 - bppshift)  => width * 3 / 16 => pitch / 16

32bit:  (bppshift = 2)
offset = width >> (4 - bppshift) => width / 4 => pitch / 16

scale:
16bit:
scale = (1 << bppshift) - 1 => 1
24bit:
scale = ((1 << bppshift) * 3) - 1 => 2
32bit:
scale = (1 << bppshift) - 1 => 3

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 63 +++++++-------------------
 1 file changed, 16 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 9a24b9c00745..7d8c65372ac4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -280,30 +280,16 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	WREG8(MGA_MISC_OUT, misc);
 }
 
-static u8 mgag200_get_bpp_shift(const struct drm_format_info *format)
-{
-	static const u8 bpp_shift[] = {0, 1, 0, 2};
-
-	return bpp_shift[format->cpp[0] - 1];
-}
-
 /*
  * Calculates the HW offset value from the framebuffer's pitch. The
  * offset is a multiple of the pixel size and depends on the display
- * format.
+ * format. With width in pixels and pitch in bytes, the formula is:
+ * offset = width * bpp / 128 = pitch / 16
  */
 static u32 mgag200_calculate_offset(struct mga_device *mdev,
 				    const struct drm_framebuffer *fb)
 {
-	u32 offset = fb->pitches[0] / fb->format->cpp[0];
-	u8 bppshift = mgag200_get_bpp_shift(fb->format);
-
-	if (fb->format->cpp[0] * 8 == 24)
-		offset = (offset * 3) >> (4 - bppshift);
-	else
-		offset = offset >> (4 - bppshift);
-
-	return offset;
+	return fb->pitches[0] >> 4;
 }
 
 static void mgag200_set_offset(struct mga_device *mdev,
@@ -326,48 +312,25 @@ static void mgag200_set_offset(struct mga_device *mdev,
 void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format)
 {
 	struct drm_device *dev = &mdev->base;
-	unsigned int bpp, bppshift, scale;
+	unsigned int scale;
 	u8 crtcext3, xmulctrl;
 
-	bpp = format->cpp[0] * 8;
-
-	bppshift = mgag200_get_bpp_shift(format);
-	switch (bpp) {
-	case 24:
-		scale = ((1 << bppshift) * 3) - 1;
-		break;
-	default:
-		scale = (1 << bppshift) - 1;
-		break;
-	}
-
-	RREG_ECRT(3, crtcext3);
-
-	switch (bpp) {
-	case 8:
-		xmulctrl = MGA1064_MUL_CTL_8bits;
-		break;
-	case 16:
-		if (format->depth == 15)
-			xmulctrl = MGA1064_MUL_CTL_15bits;
-		else
-			xmulctrl = MGA1064_MUL_CTL_16bits;
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		xmulctrl = MGA1064_MUL_CTL_16bits;
 		break;
-	case 24:
+	case DRM_FORMAT_RGB888:
 		xmulctrl = MGA1064_MUL_CTL_24bits;
 		break;
-	case 32:
+	case DRM_FORMAT_XRGB8888:
 		xmulctrl = MGA1064_MUL_CTL_32_24bits;
 		break;
 	default:
 		/* BUG: We should have caught this problem already. */
-		drm_WARN_ON(dev, "invalid format depth\n");
+		drm_WARN_ON(dev, "invalid drm format\n");
 		return;
 	}
 
-	crtcext3 &= ~GENMASK(2, 0);
-	crtcext3 |= scale;
-
 	WREG_DAC(MGA1064_MUL_CTL, xmulctrl);
 
 	WREG_GFX(0, 0x00);
@@ -383,6 +346,12 @@ void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_in
 	WREG_GFX(7, 0x0f);
 	WREG_GFX(8, 0x0f);
 
+	/* scale is the number of bytes per pixels - 1 */
+	scale = format->cpp[0] - 1;
+
+	RREG_ECRT(3, crtcext3);
+	crtcext3 &= ~GENMASK(2, 0);
+	crtcext3 |= scale;
 	WREG_ECRT(3, crtcext3);
 }
 
-- 
2.40.1

