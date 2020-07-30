Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295C323305C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 12:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53906E8CC;
	Thu, 30 Jul 2020 10:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865CF6E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:28:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F926B021;
 Thu, 30 Jul 2020 10:29:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, lyude@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Subject: [PATCH v2 6/8] drm/mgag200: Clear <page> field during MM init
Date: Thu, 30 Jul 2020 12:28:42 +0200
Message-Id: <20200730102844.10995-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730102844.10995-1-tzimmermann@suse.de>
References: <20200730102844.10995-1-tzimmermann@suse.de>
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

The modesetting code initialized the memory-related register CRTCEXT4.
Move this code to MM initialization.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mm.c   | 2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index 1b1918839e1e..641f1aa992be 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -94,6 +94,8 @@ int mgag200_mm_init(struct mga_device *mdev)
 	resource_size_t start, len;
 	int ret;
 
+	WREG_ECRT(0x04, 0x00);
+
 	misc = RREG8(MGA_MISC_IN);
 	misc |= MGAREG_MISC_RAMMAPEN |
 		MGAREG_MISC_HIGH_PG_SEL;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 66818ee10694..4fa64cf884cb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -946,7 +946,7 @@ static void mgag200_set_dac_regs(struct mga_device *mdev)
 
 static void mgag200_init_regs(struct mga_device *mdev)
 {
-	u8 crtc11, crtcext4, misc;
+	u8 crtc11, misc;
 
 	mgag200_set_dac_regs(mdev);
 
@@ -961,10 +961,6 @@ static void mgag200_init_regs(struct mga_device *mdev)
 	WREG_CRT(14, 0);
 	WREG_CRT(15, 0);
 
-	crtcext4 = 0x00;
-
-	WREG_ECRT(0x04, crtcext4);
-
 	RREG_CRT(0x11, crtc11);
 	crtc11 &= ~(MGAREG_CRTC11_CRTCPROTECT |
 		    MGAREG_CRTC11_VINTEN |
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
