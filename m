Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966371BE113
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856806EEB5;
	Wed, 29 Apr 2020 14:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061916ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F76BAF92;
 Wed, 29 Apr 2020 14:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 15/17] drm/mgag200: Remove waiting from DPMS code
Date: Wed, 29 Apr 2020 16:32:36 +0200
Message-Id: <20200429143238.10115-16-tzimmermann@suse.de>
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

The mgag200 drivers waits for the VSYNC flag to get signalled (i.e.,
the page flip happens) before changing DPMS settings. This doesn't work
reliably if no mode has been programmed. Therefore remove the waiting
code. Synchronization with page flips should be done by DRM's vblank
handlers anyway.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ee1cbe5decd71..884fc668a6dae 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -75,30 +75,6 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc)
 	}
 }
 
-static inline void mga_wait_vsync(struct mga_device *mdev)
-{
-	unsigned long timeout = jiffies + HZ/10;
-	unsigned int status = 0;
-
-	do {
-		status = RREG32(MGAREG_Status);
-	} while ((status & 0x08) && time_before(jiffies, timeout));
-	timeout = jiffies + HZ/10;
-	status = 0;
-	do {
-		status = RREG32(MGAREG_Status);
-	} while (!(status & 0x08) && time_before(jiffies, timeout));
-}
-
-static inline void mga_wait_busy(struct mga_device *mdev)
-{
-	unsigned long timeout = jiffies + HZ;
-	unsigned int status = 0;
-	do {
-		status = RREG8(MGAREG_Status + 2);
-	} while ((status & 0x01) && time_before(jiffies, timeout));
-}
-
 #define P_ARRAY_SIZE 9
 
 static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
@@ -1435,8 +1411,6 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 #endif
 	WREG8(MGAREG_SEQ_INDEX, 0x01);
 	seq1 |= RREG8(MGAREG_SEQ_DATA) & ~0x20;
-	mga_wait_vsync(mdev);
-	mga_wait_busy(mdev);
 	WREG8(MGAREG_SEQ_DATA, seq1);
 	msleep(20);
 	WREG8(MGAREG_CRTCEXT_INDEX, 0x01);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
