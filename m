Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C731BE111
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E946EEB3;
	Wed, 29 Apr 2020 14:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C93F6EEAC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E1D8AF77;
 Wed, 29 Apr 2020 14:32:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 08/17] drm/mgag200: Split MISC register update into PLL
 selection, SYNC and I/O
Date: Wed, 29 Apr 2020 16:32:29 +0200
Message-Id: <20200429143238.10115-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200429143238.10115-1-tzimmermann@suse.de>
References: <20200429143238.10115-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set different fields in MISC in their rsp location in the code. This
patch also fixes a bug in the original code where the mode's SYNC flags
were never written into the MISC register.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 37 ++++++++++++++++++--------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  5 +++-
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 749ba6e420ac7..b5bb02e9f05d6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -704,6 +704,8 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 
 static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
 {
+	uint8_t misc;
+
 	switch(mdev->type) {
 	case G200_SE_A:
 	case G200_SE_B:
@@ -724,6 +726,12 @@ static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
 		return mga_g200er_set_plls(mdev, clock);
 		break;
 	}
+
+	misc = RREG8(MGA_MISC_IN);
+	misc &= ~GENMASK(3, 2);
+	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
+	WREG8(MGA_MISC_OUT, misc);
+
 	return 0;
 }
 
@@ -916,7 +924,7 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 {
 	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
 	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
-	uint8_t misc = 0;
+	uint8_t misc;
 	uint8_t crtcext1, crtcext2, crtcext5;
 
 	hdisplay = mode->hdisplay / 8 - 1;
@@ -933,10 +941,17 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 	vsyncend = mode->vsync_end - 1;
 	vtotal = mode->vtotal - 2;
 
+	misc = RREG8(MGA_MISC_IN);
+
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		misc |= 0x40;
+		misc |= MGAREG_MISC_HSYNCPOL;
+	else
+		misc &= ~MGAREG_MISC_HSYNCPOL;
+
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		misc |= 0x80;
+		misc |= MGAREG_MISC_VSYNCPOL;
+	else
+		misc &= ~MGAREG_MISC_VSYNCPOL;
 
 	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
 		   ((hdisplay & 0x100) >> 7) |
@@ -982,6 +997,10 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 	WREG_ECRT(0x01, crtcext1);
 	WREG_ECRT(0x02, crtcext2);
 	WREG_ECRT(0x05, crtcext5);
+
+	WREG8(MGA_MISC_OUT, misc);
+
+	mga_crtc_set_plls(mdev, mode->clock);
 }
 
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
@@ -1140,12 +1159,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
 	ext_vga[4] = 0;
 
-	/* Set pixel clocks */
-	misc = 0x2d;
-	WREG8(MGA_MISC_OUT, misc);
-
-	mga_crtc_set_plls(mdev, mode->clock);
-
 	WREG_ECRT(0, ext_vga[0]);
 	WREG_ECRT(3, ext_vga[3]);
 	WREG_ECRT(4, ext_vga[4]);
@@ -1161,9 +1174,11 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	}
 
 	WREG_ECRT(0, ext_vga[0]);
-	/* Enable mga pixel clock */
-	misc = 0x2d;
 
+	misc = RREG8(MGA_MISC_IN);
+	misc |= MGAREG_MISC_IOADSEL |
+		MGAREG_MISC_RAMMAPEN |
+		MGAREG_MISC_HIGH_PG_SEL;
 	WREG8(MGA_MISC_OUT, misc);
 
 	mga_crtc_do_set_base(mdev, fb, old_fb);
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index c096a9d6bcbc1..89e12c55153cf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -16,10 +16,11 @@
  *		MGA1064SG Mystique register file
  */
 
-
 #ifndef _MGA_REG_H_
 #define _MGA_REG_H_
 
+#include <linux/bits.h>
+
 #define	MGAREG_DWGCTL		0x1c00
 #define	MGAREG_MACCESS		0x1c04
 /* the following is a mystique only register */
@@ -227,6 +228,8 @@
 #define MGAREG_MISC_CLK_SEL_MGA_MSK	(0x3 << 2)
 #define MGAREG_MISC_VIDEO_DIS	(0x1 << 4)
 #define MGAREG_MISC_HIGH_PG_SEL	(0x1 << 5)
+#define MGAREG_MISC_HSYNCPOL		BIT(6)
+#define MGAREG_MISC_VSYNCPOL		BIT(7)
 
 /* MMIO VGA registers */
 #define MGAREG_SEQ_INDEX	0x1fc4
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
