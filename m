Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E17621684B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FD189DC7;
	Tue,  7 Jul 2020 08:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB3F89BFF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69338B1B6;
 Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 5/7] drm/mgag200: Set/clear <syncrst> field in display
 enable/disable helpers
Date: Tue,  7 Jul 2020 10:24:09 +0200
Message-Id: <20200707082411.6583-6-tzimmermann@suse.de>
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

Modifying the <syncrst> field in mgag200_{enable,disable}_display()
makes the code more readable. Also clear the <asyncrst> field to enable
the display. The other bits in SEQ0 are unused, so no functional changes
are made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++++++++++------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  3 +++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 05f8aa50b908..679eb5abe24d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1284,7 +1284,12 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
 
 static void mgag200_enable_display(struct mga_device *mdev)
 {
-	u8 seq1, crtcext1;
+	u8 seq0, seq1, crtcext1;
+
+	RREG_SEQ(0x00, seq0);
+	seq0 |= MGAREG_SEQ0_SYNCRST |
+		MGAREG_SEQ0_ASYNCRST;
+	WREG_SEQ(0x00, seq0);
 
 	/*
 	 * TODO: replace busy waiting with vblank IRQ; put
@@ -1307,7 +1312,11 @@ static void mgag200_enable_display(struct mga_device *mdev)
 
 static void mgag200_disable_display(struct mga_device *mdev)
 {
-	u8 seq1, crtcext1;
+	u8 seq0, seq1, crtcext1;
+
+	RREG_SEQ(0x00, seq0);
+	seq0 &= ~MGAREG_SEQ0_SYNCRST;
+	WREG_SEQ(0x00, seq0);
 
 	/*
 	 * TODO: replace busy waiting with vblank IRQ; put
@@ -1338,9 +1347,6 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 
-	/* start sync reset */
-	WREG_SEQ(0, 1);
-
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mga_g200wb_prepare(crtc);
 }
@@ -1357,7 +1363,6 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mga_g200wb_commit(crtc);
 
-	WREG_SEQ(0, 0x3);
 	mga_crtc_load_lut(crtc);
 	mgag200_enable_display(mdev);
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 9f0be1878854..c3b7bcad52ed 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -236,6 +236,9 @@
 #define MGAREG_SEQ_INDEX	0x1fc4
 #define MGAREG_SEQ_DATA		0x1fc5
 
+#define MGAREG_SEQ0_ASYNCRST	BIT(0)
+#define MGAREG_SEQ0_SYNCRST	BIT(1)
+
 #define MGAREG_SEQ1_SCROFF	BIT(5)
 
 #define MGAREG_CRTC_INDEX	0x1fd4
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
