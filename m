Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB122100F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819F86EB7A;
	Wed, 15 Jul 2020 14:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C916EB7A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:59:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3518AF44;
 Wed, 15 Jul 2020 14:59:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, lyude@redhat.com, krzk@kernel.org,
 john.p.donnelly@Oracle.com, rong.a.chen@intel.com, kraxel@redhat.com,
 eich@suse.com, tiwai@suse.de
Subject: [PATCH 5/8] drm/mgag200: Set MISC memory flags in mm init code
Date: Wed, 15 Jul 2020 16:58:59 +0200
Message-Id: <20200715145902.13122-6-tzimmermann@suse.de>
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

The modesetting code initialized several memory-related flags in the
MISC register. Move this code to MM initialization.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mm.c   | 6 ++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 4 +---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index 7b69392bcb89..1b1918839e1e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -90,9 +90,15 @@ static void mgag200_mm_release(struct drm_device *dev, void *ptr)
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	u8 misc;
 	resource_size_t start, len;
 	int ret;
 
+	misc = RREG8(MGA_MISC_IN);
+	misc |= MGAREG_MISC_RAMMAPEN |
+		MGAREG_MISC_HIGH_PG_SEL;
+	WREG8(MGA_MISC_OUT, misc);
+
 	/* BAR 0 is VRAM */
 	start = pci_resource_start(dev->pdev, 0);
 	len = pci_resource_len(dev->pdev, 0);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7161b1651aa0..66818ee10694 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -978,9 +978,7 @@ static void mgag200_init_regs(struct mga_device *mdev)
 		WREG_ECRT(0x34, 0x5);
 
 	misc = RREG8(MGA_MISC_IN);
-	misc |= MGAREG_MISC_IOADSEL |
-		MGAREG_MISC_RAMMAPEN |
-		MGAREG_MISC_HIGH_PG_SEL;
+	misc |= MGAREG_MISC_IOADSEL;
 	WREG8(MGA_MISC_OUT, misc);
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
