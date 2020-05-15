Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F141D4845
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8D36EC20;
	Fri, 15 May 2020 08:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC2A6EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4813AFF7;
 Fri, 15 May 2020 08:32:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 10/15] drm/mgag200: Move hiprilvl setting into separate
 functions
Date: Fri, 15 May 2020 10:32:28 +0200
Message-Id: <20200515083233.32036-11-tzimmermann@suse.de>
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

The hiprivlvl settings are now updated in mgag200_g200se_set_hiprilvl()
and mgag200_g200ev_set_hiprilvl().

v2:
	* replace uint8_t with u8

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 98 ++++++++++++++------------
 1 file changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 68ae604926757..46122fa319889 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1133,6 +1133,56 @@ static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
 	WREG_SEQ(0x01, seq1);
 }
 
+static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
+					const struct drm_display_mode *mode,
+					const struct drm_framebuffer *fb)
+{
+	unsigned int hiprilvl;
+	u8 crtcext6;
+
+	if  (mdev->unique_rev_id >= 0x04) {
+		hiprilvl = 0;
+	} else if (mdev->unique_rev_id >= 0x02) {
+		unsigned int bpp;
+		unsigned long mb;
+
+		if (fb->format->cpp[0] * 8 > 16)
+			bpp = 32;
+		else if (fb->format->cpp[0] * 8 > 8)
+			bpp = 16;
+		else
+			bpp = 8;
+
+		mb = (mode->clock * bpp) / 1000;
+		if (mb > 3100)
+			hiprilvl = 0;
+		else if (mb > 2600)
+			hiprilvl = 1;
+		else if (mb > 1900)
+			hiprilvl = 2;
+		else if (mb > 1160)
+			hiprilvl = 3;
+		else if (mb > 440)
+			hiprilvl = 4;
+		else
+			hiprilvl = 5;
+
+	} else if (mdev->unique_rev_id >= 0x01) {
+		hiprilvl = 3;
+	} else {
+		hiprilvl = 4;
+	}
+
+	crtcext6 = hiprilvl; /* implicitly sets maxhipri to 0 */
+
+	WREG_ECRT(0x06, crtcext6);
+}
+
+static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
+{
+	WREG_ECRT(0x06, 0x00);
+}
+
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode,
@@ -1251,10 +1301,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	if (mdev->type == G200_EW3)
 		WREG_ECRT(0x34, 0x5);
 
-	if (mdev->type == G200_EV) {
-		WREG_ECRT(6, 0);
-	}
-
 	misc = RREG8(MGA_MISC_IN);
 	misc |= MGAREG_MISC_IOADSEL |
 		MGAREG_MISC_RAMMAPEN |
@@ -1270,47 +1316,11 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	if (mdev->type == G200_ER)
 		mgag200_g200er_reset_tagfifo(mdev);
 
+	if (IS_G200_SE(mdev))
+		mgag200_g200se_set_hiprilvl(mdev, mode, fb);
+	else if (mdev->type == G200_EV)
+		mgag200_g200ev_set_hiprilvl(mdev);
 
-	if (IS_G200_SE(mdev)) {
-		if  (mdev->unique_rev_id >= 0x04) {
-			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
-			WREG8(MGAREG_CRTCEXT_DATA, 0);
-		} else if (mdev->unique_rev_id >= 0x02) {
-			u8 hi_pri_lvl;
-			u32 bpp;
-			u32 mb;
-
-			if (fb->format->cpp[0] * 8 > 16)
-				bpp = 32;
-			else if (fb->format->cpp[0] * 8 > 8)
-				bpp = 16;
-			else
-				bpp = 8;
-
-			mb = (mode->clock * bpp) / 1000;
-			if (mb > 3100)
-				hi_pri_lvl = 0;
-			else if (mb > 2600)
-				hi_pri_lvl = 1;
-			else if (mb > 1900)
-				hi_pri_lvl = 2;
-			else if (mb > 1160)
-				hi_pri_lvl = 3;
-			else if (mb > 440)
-				hi_pri_lvl = 4;
-			else
-				hi_pri_lvl = 5;
-
-			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
-			WREG8(MGAREG_CRTCEXT_DATA, hi_pri_lvl);
-		} else {
-			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
-			if (mdev->unique_rev_id >= 0x01)
-				WREG8(MGAREG_CRTCEXT_DATA, 0x03);
-			else
-				WREG8(MGAREG_CRTCEXT_DATA, 0x04);
-		}
-	}
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
