Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2C1D483E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C906EC21;
	Fri, 15 May 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1006B6EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 451FAAFF0;
 Fri, 15 May 2020 08:32:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 09/15] drm/mgag200: Move TAGFIFO reset into separate
 function
Date: Fri, 15 May 2020 10:32:27 +0200
Message-Id: <20200515083233.32036-10-tzimmermann@suse.de>
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

The TAGFIFO state is now reset in mgag200_g200er_reset_tagfifo().

v2:
	* define MGAREG_SEQ1_SCROFF

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  6 ++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 45 +++++++++++++++++---------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  3 ++
 3 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 1963876ef3b8c..cf71a4ec84158 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -49,6 +49,12 @@
 		WREG8(ATTR_DATA, v);				\
 	} while (0)						\
 
+#define RREG_SEQ(reg, v)					\
+	do {							\
+		WREG8(MGAREG_SEQ_INDEX, reg);			\
+		v = RREG8(MGAREG_SEQ_DATA);			\
+	} while (0)						\
+
 #define WREG_SEQ(reg, v)					\
 	do {							\
 		WREG8(MGAREG_SEQ_INDEX, reg);			\
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 38556f57ad218..68ae604926757 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1106,6 +1106,33 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
 	WREG_ECRT(3, crtcext3);
 }
 
+static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
+{
+	static uint32_t RESET_FLAG = 0x00200000; /* undocumented magic value */
+	u8 seq1;
+	u32 memctl;
+
+	/* screen off */
+	RREG_SEQ(0x01, seq1);
+	seq1 |= MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+
+	memctl = RREG32(MGAREG_MEMCTL);
+
+	memctl |= RESET_FLAG;
+	WREG32(MGAREG_MEMCTL, memctl);
+
+	udelay(1000);
+
+	memctl &= ~RESET_FLAG;
+	WREG32(MGAREG_MEMCTL, memctl);
+
+	/* screen on */
+	RREG_SEQ(0x01, seq1);
+	seq1 &= ~MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+}
+
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode,
@@ -1240,22 +1267,8 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 
 	mgag200_set_mode_regs(mdev, mode);
 
-	/* reset tagfifo */
-	if (mdev->type == G200_ER) {
-		u32 mem_ctl = RREG32(MGAREG_MEMCTL);
-		u8 seq1;
-
-		/* screen off */
-		WREG8(MGAREG_SEQ_INDEX, 0x01);
-		seq1 = RREG8(MGAREG_SEQ_DATA) | 0x20;
-		WREG8(MGAREG_SEQ_DATA, seq1);
-
-		WREG32(MGAREG_MEMCTL, mem_ctl | 0x00200000);
-		udelay(1000);
-		WREG32(MGAREG_MEMCTL, mem_ctl & ~0x00200000);
-
-		WREG8(MGAREG_SEQ_DATA, seq1 & ~0x20);
-	}
+	if (mdev->type == G200_ER)
+		mgag200_g200er_reset_tagfifo(mdev);
 
 
 	if (IS_G200_SE(mdev)) {
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index cd08dee29b06f..29f7194faadc0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -235,6 +235,9 @@
 /* MMIO VGA registers */
 #define MGAREG_SEQ_INDEX	0x1fc4
 #define MGAREG_SEQ_DATA		0x1fc5
+
+#define MGAREG_SEQ1_SCROFF	BIT(5)
+
 #define MGAREG_CRTC_INDEX	0x1fd4
 #define MGAREG_CRTC_DATA	0x1fd5
 #define MGAREG_CRTCEXT_INDEX	0x1fde
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
