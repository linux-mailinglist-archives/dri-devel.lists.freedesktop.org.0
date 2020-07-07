Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AA216849
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DA889DC0;
	Tue,  7 Jul 2020 08:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88A89BDB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43F63B1B4;
 Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 4/7] drm/mgag200: Split DPMS function into helpers
Date: Tue,  7 Jul 2020 10:24:08 +0200
Message-Id: <20200707082411.6583-5-tzimmermann@suse.de>
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

Of the DPMS code, only ON and OFF states are used. Simplify mode setting
by moving both into separate functions and removing the rest.

The DPMS code also set the LUT before enabling the screen. The patch moves
this code into the simple-display pipe's enable function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 73 +++++++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  3 ++
 2 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index f0f8b7258f8c..05f8aa50b908 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1282,41 +1282,50 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
 	WREG_ECRT(0x06, 0x00);
 }
 
-static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
+static void mgag200_enable_display(struct mga_device *mdev)
 {
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-	u8 seq1 = 0, crtcext1 = 0;
+	u8 seq1, crtcext1;
 
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		seq1 = 0;
-		crtcext1 = 0;
-		mga_crtc_load_lut(crtc);
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-		seq1 = 0x20;
-		crtcext1 = 0x10;
-		break;
-	case DRM_MODE_DPMS_SUSPEND:
-		seq1 = 0x20;
-		crtcext1 = 0x20;
-		break;
-	case DRM_MODE_DPMS_OFF:
-		seq1 = 0x20;
-		crtcext1 = 0x30;
-		break;
-	}
+	/*
+	 * TODO: replace busy waiting with vblank IRQ; put
+	 *       msleep(50) before changing SCROFF
+	 */
+	mga_wait_vsync(mdev);
+	mga_wait_busy(mdev);
+
+	RREG_SEQ(0x01, seq1);
+	seq1 &= ~MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+
+	msleep(20);
+
+	RREG_ECRT(0x01, crtcext1);
+	crtcext1 &= ~MGAREG_CRTCEXT1_VSYNCOFF;
+	crtcext1 &= ~MGAREG_CRTCEXT1_HSYNCOFF;
+	WREG_ECRT(0x01, crtcext1);
+}
 
-	WREG8(MGAREG_SEQ_INDEX, 0x01);
-	seq1 |= RREG8(MGAREG_SEQ_DATA) & ~0x20;
+static void mgag200_disable_display(struct mga_device *mdev)
+{
+	u8 seq1, crtcext1;
+
+	/*
+	 * TODO: replace busy waiting with vblank IRQ; put
+	 *       msleep(50) before changing SCROFF
+	 */
 	mga_wait_vsync(mdev);
 	mga_wait_busy(mdev);
-	WREG8(MGAREG_SEQ_DATA, seq1);
+
+	RREG_SEQ(0x01, seq1);
+	seq1 |= MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+
 	msleep(20);
-	WREG8(MGAREG_CRTCEXT_INDEX, 0x01);
-	crtcext1 |= RREG8(MGAREG_CRTCEXT_DATA) & ~0x30;
-	WREG8(MGAREG_CRTCEXT_DATA, crtcext1);
+
+	RREG_ECRT(0x01, crtcext1);
+	crtcext1 |= MGAREG_CRTCEXT1_VSYNCOFF |
+		    MGAREG_CRTCEXT1_HSYNCOFF;
+	WREG_ECRT(0x01, crtcext1);
 }
 
 /*
@@ -1349,7 +1358,8 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 		mga_g200wb_commit(crtc);
 
 	WREG_SEQ(0, 0x3);
-	mga_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+	mga_crtc_load_lut(crtc);
+	mgag200_enable_display(mdev);
 }
 
 /*
@@ -1595,8 +1605,9 @@ static void
 mgag200_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
+	struct mga_device *mdev = to_mga_device(crtc->dev);
 
-	mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	mgag200_disable_display(mdev);
 }
 
 static int
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index fb5da410804c..9f0be1878854 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -250,6 +250,9 @@
 
 #define MGAREG_CRTCEXT0_OFFSET_MASK	GENMASK(5, 4)
 
+#define MGAREG_CRTCEXT1_VSYNCOFF	BIT(5)
+#define MGAREG_CRTCEXT1_HSYNCOFF	BIT(4)
+
 /* Cursor X and Y position */
 #define MGA_CURPOSXL 0x3c0c
 #define MGA_CURPOSXH 0x3c0d
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
