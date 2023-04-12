Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC736DF770
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E710E613;
	Wed, 12 Apr 2023 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A370610E07C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681306814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8D9QzE0u2LdyzG/DnV4bZ/C60CSP6UGFEao4RKaHhjg=;
 b=d9WBjwbN5Xqq4U7qWIC5lmnpugFK2fhWLklI9Oh0R9fg5cpaSEa018D+m67TQhGm7vcKlA
 xcTqAhVzrIghgUSPTdqgfDTMNj5xXiT2tJ20c1ApXaYErV5e9C7RtMMSVBfQGRIDD1EsuV
 v1NcUf39xRH+yVWGSPUSjEqGUU1Wy5E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-BMWzl3o8Mo26_r1wmRBafg-1; Wed, 12 Apr 2023 09:40:13 -0400
X-MC-Unique: BMWzl3o8Mo26_r1wmRBafg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1693B281722D;
 Wed, 12 Apr 2023 13:40:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14F19492C3E;
 Wed, 12 Apr 2023 13:40:11 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH 1/2] drm/mgag200: simplify offset and scale computation.
Date: Wed, 12 Apr 2023 15:39:11 +0200
Message-Id: <20230412133912.610294-2-jfalempe@redhat.com>
In-Reply-To: <20230412133912.610294-1-jfalempe@redhat.com>
References: <20230412133912.610294-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Now that the driver handles only 16, 24 and 32-bit framebuffer,
it can be simplified.

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
index 0a5aaf78172a..e3f0da338b95 100644
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
2.39.2

