Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBD216844
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5F389A9F;
	Tue,  7 Jul 2020 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102E89A9F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D08DFB12D;
 Tue,  7 Jul 2020 08:24:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 1/7] drm/mgag200: Don't write-protect CRTC 0-7 while in
 mga_crtc_prepare()
Date: Tue,  7 Jul 2020 10:24:05 +0200
Message-Id: <20200707082411.6583-2-tzimmermann@suse.de>
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

The prepare function write-protects several registers that it doesn't
even touch. Removed the related code.

The code for unprotecting registers also clears VINT interrupts. Both
is now done once during initialization.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  6 ++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++++++---------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  5 +++++
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 270c2f9a6766..3817520bfefc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -60,6 +60,12 @@
 		WREG8(MGAREG_SEQ_DATA, v);			\
 	} while (0)						\
 
+#define RREG_CRT(reg, v)					\
+	do {							\
+		WREG8(MGAREG_CRTC_INDEX, reg);			\
+		v = RREG8(MGAREG_CRTC_DATA);			\
+	} while (0)						\
+
 #define WREG_CRT(reg, v)					\
 	do {							\
 		WREG8(MGAREG_CRTC_INDEX, reg);			\
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index f16bd278ab7e..9037057d3b3a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -988,7 +988,7 @@ static void mgag200_set_dac_regs(struct mga_device *mdev)
 
 static void mgag200_init_regs(struct mga_device *mdev)
 {
-	u8 crtcext3, crtcext4, misc;
+	u8 crtc11, crtcext3, crtcext4, misc;
 
 	mgag200_set_pci_regs(mdev);
 	mgag200_set_dac_regs(mdev);
@@ -1012,6 +1012,12 @@ static void mgag200_init_regs(struct mga_device *mdev)
 	WREG_ECRT(0x03, crtcext3);
 	WREG_ECRT(0x04, crtcext4);
 
+	RREG_CRT(0x11, crtc11);
+	crtc11 &= ~(MGAREG_CRTC11_CRTCPROTECT |
+		    MGAREG_CRTC11_VINTEN |
+		    MGAREG_CRTC11_VINTCLR);
+	WREG_CRT(0x11, crtc11);
+
 	if (mdev->type == G200_ER)
 		WREG_ECRT(0x24, 0x5);
 
@@ -1337,12 +1343,6 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 	struct mga_device *mdev = to_mga_device(dev);
 	u8 tmp;
 
-	/*	mga_resume(crtc);*/
-
-	WREG8(MGAREG_CRTC_INDEX, 0x11);
-	tmp = RREG8(MGAREG_CRTC_DATA);
-	WREG_CRT(0x11, tmp | 0x80);
-
 	if (mdev->type == G200_SE_A || mdev->type == G200_SE_B) {
 		WREG_SEQ(0, 1);
 		msleep(50);
@@ -1359,8 +1359,6 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mga_g200wb_prepare(crtc);
-
-	WREG_CRT(17, 0);
 }
 
 /*
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 29f7194faadc..fb5da410804c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -240,6 +240,11 @@
 
 #define MGAREG_CRTC_INDEX	0x1fd4
 #define MGAREG_CRTC_DATA	0x1fd5
+
+#define MGAREG_CRTC11_VINTCLR		BIT(4)
+#define MGAREG_CRTC11_VINTEN		BIT(5)
+#define MGAREG_CRTC11_CRTCPROTECT	BIT(7)
+
 #define MGAREG_CRTCEXT_INDEX	0x1fde
 #define MGAREG_CRTCEXT_DATA	0x1fdf
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
