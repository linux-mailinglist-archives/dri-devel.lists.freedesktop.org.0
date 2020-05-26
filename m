Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE741CEF5A
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 10:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C946E882;
	Tue, 12 May 2020 08:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823976E881
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:43:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97643AE5E;
 Tue, 12 May 2020 08:43:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v2 07/15] drm/mgag200: Set pitch in a separate helper function
Date: Tue, 12 May 2020 10:42:50 +0200
Message-Id: <20200512084258.12673-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512084258.12673-1-tzimmermann@suse.de>
References: <20200512084258.12673-1-tzimmermann@suse.de>
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

The framebuffer's pitch is now set in mgag200_set_offset().

v2:
	* move offset and bpp-shift calculation into helper functions
	* use u8 instead of uint8_t
	* add MGAREG_CRTCEXT0_OFFSET_MASK

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 57 +++++++++++++++++++-------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  2 +
 2 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4dba0a379c263..dee7838d7d368 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1002,6 +1002,48 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 	mga_crtc_set_plls(mdev, mode->clock);
 }
 
+static u8 mgag200_get_bpp_shift(struct mga_device *mdev,
+				const struct drm_format_info *format)
+{
+	return mdev->bpp_shifts[format->cpp[0] - 1];
+}
+
+/*
+ * Calculates the HW offset value from the framebuffer's pitch. The
+ * offset is a multiple of the pixel size and depends on the display
+ * format.
+ */
+static u32 mgag200_calculate_offset(struct mga_device *mdev,
+				    const struct drm_framebuffer *fb)
+{
+	u32 offset = fb->pitches[0] / fb->format->cpp[0];
+	u8 bppshift = mgag200_get_bpp_shift(mdev, fb->format);
+
+	if (fb->format->cpp[0] * 8 == 24)
+		offset = (offset * 3) >> (4 - bppshift);
+	else
+		offset = offset >> (4 - bppshift);
+
+	return offset;
+}
+
+static void mgag200_set_offset(struct mga_device *mdev,
+			       const struct drm_framebuffer *fb)
+{
+	u8 crtc13, crtcext0;
+	u32 offset = mgag200_calculate_offset(mdev, fb);
+
+	RREG_ECRT(0, crtcext0);
+
+	crtc13 = offset & 0xff;
+
+	crtcext0 &= ~MGAREG_CRTCEXT0_OFFSET_MASK;
+	crtcext0 |= (offset >> 4) & MGAREG_CRTCEXT0_OFFSET_MASK;
+
+	WREG_CRT(0x13, crtc13);
+	WREG_ECRT(0x00, crtcext0);
+}
+
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode,
@@ -1010,7 +1052,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct drm_framebuffer *fb = crtc->primary->fb;
-	int pitch;
 	int option = 0, option2 = 0;
 	int i;
 	unsigned char misc = 0;
@@ -1121,12 +1162,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	WREG_SEQ(3, 0);
 	WREG_SEQ(4, 0xe);
 
-	pitch = fb->pitches[0] / fb->format->cpp[0];
-	if (fb->format->cpp[0] * 8 == 24)
-		pitch = (pitch * 3) >> (4 - bppshift);
-	else
-		pitch = pitch >> (4 - bppshift);
-
 	WREG_GFX(0, 0);
 	WREG_GFX(1, 0);
 	WREG_GFX(2, 0);
@@ -1143,20 +1178,15 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	WREG_CRT(13, 0);
 	WREG_CRT(14, 0);
 	WREG_CRT(15, 0);
-	WREG_CRT(19, pitch & 0xFF);
-
-	ext_vga[0] = 0;
 
 	/* TODO interlace */
 
-	ext_vga[0] |= (pitch & 0x300) >> 4;
 	if (fb->format->cpp[0] * 8 == 24)
 		ext_vga[3] = (((1 << bppshift) * 3) - 1) | 0x80;
 	else
 		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
 	ext_vga[4] = 0;
 
-	WREG_ECRT(0, ext_vga[0]);
 	WREG_ECRT(3, ext_vga[3]);
 	WREG_ECRT(4, ext_vga[4]);
 
@@ -1170,8 +1200,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 		WREG_ECRT(6, 0);
 	}
 
-	WREG_ECRT(0, ext_vga[0]);
-
 	misc = RREG8(MGA_MISC_IN);
 	misc |= MGAREG_MISC_IOADSEL |
 		MGAREG_MISC_RAMMAPEN |
@@ -1179,6 +1207,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	WREG8(MGA_MISC_OUT, misc);
 
 	mga_crtc_do_set_base(mdev, fb, old_fb);
+	mgag200_set_offset(mdev, fb);
 
 	mgag200_set_mode_regs(mdev, mode);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 0ba6e15e97106..cd08dee29b06f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -240,6 +240,8 @@
 #define MGAREG_CRTCEXT_INDEX	0x1fde
 #define MGAREG_CRTCEXT_DATA	0x1fdf
 
+#define MGAREG_CRTCEXT0_OFFSET_MASK	GENMASK(5, 4)
+
 /* Cursor X and Y position */
 #define MGA_CURPOSXL 0x3c0c
 #define MGA_CURPOSXH 0x3c0d
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
