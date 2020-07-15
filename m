Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB815221008
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643536E098;
	Wed, 15 Jul 2020 14:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5F889C55
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:59:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7782FAF2D;
 Wed, 15 Jul 2020 14:59:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, lyude@redhat.com, krzk@kernel.org,
 john.p.donnelly@Oracle.com, rong.a.chen@intel.com, kraxel@redhat.com,
 eich@suse.com, tiwai@suse.de
Subject: [PATCH 4/8] drm/mgag200: Enable MGA mode during device register
 initialization
Date: Wed, 15 Jul 2020 16:58:58 +0200
Message-Id: <20200715145902.13122-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715145902.13122-1-tzimmermann@suse.de>
References: <20200715145902.13122-1-tzimmermann@suse.de>
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

MGA cards can run in traditional VGA mode or an enhanced MGA mode; with
the latter being required for KMS. So far, MGA mode was enabled during
modesetting. As it's fundamental for device operation, the patch moves
it next to the device register setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 5 +++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 6 +-----
 drivers/gpu/drm/mgag200/mgag200_reg.h  | 2 ++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3dbb00045c24..ac9ac5b6d587 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -61,6 +61,7 @@ static int mgag200_regs_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	u32 option, option2;
+	u8 crtcext3;
 
 	switch (mdev->type) {
 	case G200_SE_A:
@@ -107,6 +108,10 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	if (mdev->rmmio == NULL)
 		return -ENOMEM;
 
+	RREG_ECRT(0x03, crtcext3);
+	crtcext3 |= MGAREG_CRTCEXT3_MGAMODE;
+	WREG_ECRT(0x03, crtcext3);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 3aa078e69a5a..7161b1651aa0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -946,7 +946,7 @@ static void mgag200_set_dac_regs(struct mga_device *mdev)
 
 static void mgag200_init_regs(struct mga_device *mdev)
 {
-	u8 crtc11, crtcext3, crtcext4, misc;
+	u8 crtc11, crtcext4, misc;
 
 	mgag200_set_dac_regs(mdev);
 
@@ -961,12 +961,8 @@ static void mgag200_init_regs(struct mga_device *mdev)
 	WREG_CRT(14, 0);
 	WREG_CRT(15, 0);
 
-	RREG_ECRT(0x03, crtcext3);
-
-	crtcext3 |= BIT(7); /* enable MGA mode */
 	crtcext4 = 0x00;
 
-	WREG_ECRT(0x03, crtcext3);
 	WREG_ECRT(0x04, crtcext4);
 
 	RREG_CRT(0x11, crtc11);
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index a44c08bf4074..977be0565c06 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -256,6 +256,8 @@
 #define MGAREG_CRTCEXT1_VSYNCOFF	BIT(5)
 #define MGAREG_CRTCEXT1_HSYNCOFF	BIT(4)
 
+#define MGAREG_CRTCEXT3_MGAMODE		BIT(7)
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
