Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E891BE10E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498516EEAD;
	Wed, 29 Apr 2020 14:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8B96ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BFFD7AF8E;
 Wed, 29 Apr 2020 14:32:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 12/17] drm/mgag200: Move TAGFIFO reset into separate function
Date: Wed, 29 Apr 2020 16:32:33 +0200
Message-Id: <20200429143238.10115-13-tzimmermann@suse.de>
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

The TAGFIFO state is now reset in mgag200_g200er_reset_tagfifo().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  6 ++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 45 +++++++++++++++++---------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 9b957d9fc7e04..b10da90e0f35a 100644
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
index 73f7135cbb3d8..6b88c306ff4d7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1091,6 +1091,33 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
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
+	seq1 |= 0x20;
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
+	seq1 &= ~0x20;
+	WREG_SEQ(0x01, seq1);
+}
+
 static int mga_crtc_mode_set(struct drm_crtc *crtc,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode,
@@ -1225,22 +1252,8 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 
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
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
