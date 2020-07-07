Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145C216847
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605BF89DBC;
	Tue,  7 Jul 2020 08:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1189A9F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E8D0B1B3;
 Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 3/7] drm/mgag200: Don't set or clear <scroff> field during
 modeset
Date: Tue,  7 Jul 2020 10:24:07 +0200
Message-Id: <20200707082411.6583-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707082411.6583-1-tzimmermann@suse.de>
References: <20200707082411.6583-1-tzimmermann@suse.de>
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

The simple pipe's disable function disables the screen by calling
mgag200_disable_screen(). The simple pipe's enable function enables the
screen by calling mgag200_enable_display().

During modeset operations the screen is off and remains off. It's only
enabled after the modeset has been completed. Therefore remove all code
that sets or clears the <scroff> field while in modeset.

The related code also modifies the <syncrst> field in SEQ0. For now, keep
this code in place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 42 ++------------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d9612f531e52..f0f8b7258f8c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1219,14 +1219,8 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
 static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
 {
 	static uint32_t RESET_FLAG = 0x00200000; /* undocumented magic value */
-	u8 seq1;
 	u32 memctl;
 
-	/* screen off */
-	RREG_SEQ(0x01, seq1);
-	seq1 |= MGAREG_SEQ1_SCROFF;
-	WREG_SEQ(0x01, seq1);
-
 	memctl = RREG32(MGAREG_MEMCTL);
 
 	memctl |= RESET_FLAG;
@@ -1236,11 +1230,6 @@ static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
 
 	memctl &= ~RESET_FLAG;
 	WREG32(MGAREG_MEMCTL, memctl);
-
-	/* screen on */
-	RREG_SEQ(0x01, seq1);
-	seq1 &= ~MGAREG_SEQ1_SCROFF;
-	WREG_SEQ(0x01, seq1);
 }
 
 static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
@@ -1339,21 +1328,9 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
-	u8 tmp;
-
-	if (mdev->type == G200_SE_A || mdev->type == G200_SE_B) {
-		WREG_SEQ(0, 1);
-		msleep(50);
-		WREG_SEQ(1, 0x20);
-		msleep(20);
-	} else {
-		WREG8(MGAREG_SEQ_INDEX, 0x1);
-		tmp = RREG8(MGAREG_SEQ_DATA);
 
-		/* start sync reset */
-		WREG_SEQ(0, 1);
-		WREG_SEQ(1, tmp | 0x20);
-	}
+	/* start sync reset */
+	WREG_SEQ(0, 1);
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mga_g200wb_prepare(crtc);
@@ -1367,24 +1344,11 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
-	u8 tmp;
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mga_g200wb_commit(crtc);
 
-	if (mdev->type == G200_SE_A || mdev->type == G200_SE_B) {
-		msleep(50);
-		WREG_SEQ(1, 0x0);
-		msleep(20);
-		WREG_SEQ(0, 0x3);
-	} else {
-		WREG8(MGAREG_SEQ_INDEX, 0x1);
-		tmp = RREG8(MGAREG_SEQ_DATA);
-
-		tmp &= ~0x20;
-		WREG_SEQ(0x1, tmp);
-		WREG_SEQ(0, 3);
-	}
+	WREG_SEQ(0, 0x3);
 	mga_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
