Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD851D483D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AA06EC1A;
	Fri, 15 May 2020 08:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CF96EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED173AFF5;
 Fri, 15 May 2020 08:32:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 08/15] drm/mgag200: Set primary plane's format in separate
 helper function
Date: Fri, 15 May 2020 10:32:26 +0200
Message-Id: <20200515083233.32036-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary plane's format registers are now updated in a
mgag200_set_format_regs().

v2:
	* get bpp shift from helper function
	* replace uint8_t with u8

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 109 ++++++++++++++++---------
 1 file changed, 69 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index dee7838d7d368..38556f57ad218 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1044,6 +1044,68 @@ static void mgag200_set_offset(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
+static void mgag200_set_format_regs(struct mga_device *mdev,
+				    const struct drm_framebuffer *fb)
+{
+	struct drm_device *dev = mdev->dev;
+	const struct drm_format_info *format = fb->format;
+	unsigned int bpp, bppshift, scale;
+	u8 crtcext3, xmulctrl;
+
+	bpp = format->cpp[0] * 8;
+
+	bppshift = mgag200_get_bpp_shift(mdev, format);
+	switch (bpp) {
+	case 24:
+		scale = ((1 << bppshift) * 3) - 1;
+		break;
+	default:
+		scale = (1 << bppshift) - 1;
+		break;
+	}
+
+	RREG_ECRT(3, crtcext3);
+
+	switch (bpp) {
+	case 8:
+		xmulctrl = MGA1064_MUL_CTL_8bits;
+		break;
+	case 16:
+		if (format->depth == 15)
+			xmulctrl = MGA1064_MUL_CTL_15bits;
+		else
+			xmulctrl = MGA1064_MUL_CTL_16bits;
+		break;
+	case 24:
+		xmulctrl = MGA1064_MUL_CTL_24bits;
+		break;
+	case 32:
+		xmulctrl = MGA1064_MUL_CTL_32_24bits;
+		break;
+	default:
+		/* BUG: We should have caught this problem already. */
+		drm_WARN_ON(dev, "invalid format depth\n");
+		return;
+	}
+
+	crtcext3 &= ~GENMASK(2, 0);
+	crtcext3 |= scale;
+
+	WREG_DAC(MGA1064_MUL_CTL, xmulctrl);
+
+	WREG_GFX(0, 0x00);
+	WREG_GFX(1, 0x00);
+	WREG_GFX(2, 0x00);
+	WREG_GFX(3, 0x00);
+	WREG_GFX(4, 0x00);
+	WREG_GFX(5, 0x40);
+	WREG_GFX(6, 0x05);
+	WREG_GFX(7, 0x0f);
+	WREG_GFX(8, 0x0f);
+
+	WREG_ECRT(3, crtcext3);
+}
+
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode,
@@ -1055,8 +1117,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	int option = 0, option2 = 0;
 	int i;
 	unsigned char misc = 0;
-	unsigned char ext_vga[6];
-	u8 bppshift;
+	u8 crtcext3, crtcext4;
 
 	static unsigned char dacvalue[] = {
 		/* 0x00: */        0,    0,    0,    0,    0,    0, 0x00,    0,
@@ -1071,8 +1132,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
 	};
 
-	bppshift = mdev->bpp_shifts[fb->format->cpp[0] - 1];
-
 	switch (mdev->type) {
 	case G200_SE_A:
 	case G200_SE_B:
@@ -1111,24 +1170,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 		break;
 	}
 
-	switch (fb->format->cpp[0] * 8) {
-	case 8:
-		dacvalue[MGA1064_MUL_CTL] = MGA1064_MUL_CTL_8bits;
-		break;
-	case 16:
-		if (fb->format->depth == 15)
-			dacvalue[MGA1064_MUL_CTL] = MGA1064_MUL_CTL_15bits;
-		else
-			dacvalue[MGA1064_MUL_CTL] = MGA1064_MUL_CTL_16bits;
-		break;
-	case 24:
-		dacvalue[MGA1064_MUL_CTL] = MGA1064_MUL_CTL_24bits;
-		break;
-	case 32:
-		dacvalue[MGA1064_MUL_CTL] = MGA1064_MUL_CTL_32_24bits;
-		break;
-	}
-
 	for (i = 0; i < sizeof(dacvalue); i++) {
 		if ((i <= 0x17) ||
 		    (i == 0x1b) ||
@@ -1162,16 +1203,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	WREG_SEQ(3, 0);
 	WREG_SEQ(4, 0xe);
 
-	WREG_GFX(0, 0);
-	WREG_GFX(1, 0);
-	WREG_GFX(2, 0);
-	WREG_GFX(3, 0);
-	WREG_GFX(4, 0);
-	WREG_GFX(5, 0x40);
-	WREG_GFX(6, 0x5);
-	WREG_GFX(7, 0xf);
-	WREG_GFX(8, 0xf);
-
 	WREG_CRT(10, 0);
 	WREG_CRT(11, 0);
 	WREG_CRT(12, 0);
@@ -1179,16 +1210,13 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	WREG_CRT(14, 0);
 	WREG_CRT(15, 0);
 
-	/* TODO interlace */
+	RREG_ECRT(0x03, crtcext3);
 
-	if (fb->format->cpp[0] * 8 == 24)
-		ext_vga[3] = (((1 << bppshift) * 3) - 1) | 0x80;
-	else
-		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
-	ext_vga[4] = 0;
+	crtcext3 |= BIT(7); /* enable MGA mode */
+	crtcext4 = 0x00;
 
-	WREG_ECRT(3, ext_vga[3]);
-	WREG_ECRT(4, ext_vga[4]);
+	WREG_ECRT(0x03, crtcext3);
+	WREG_ECRT(0x04, crtcext4);
 
 	if (mdev->type == G200_ER)
 		WREG_ECRT(0x24, 0x5);
@@ -1206,6 +1234,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 		MGAREG_MISC_HIGH_PG_SEL;
 	WREG8(MGA_MISC_OUT, misc);
 
+	mgag200_set_format_regs(mdev, fb);
 	mga_crtc_do_set_base(mdev, fb, old_fb);
 	mgag200_set_offset(mdev, fb);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
