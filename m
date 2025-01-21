Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3999A177B4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163E110E4DE;
	Tue, 21 Jan 2025 06:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="aNjOSedS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 921 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jan 2025 06:58:48 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4C9A10E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/Z/LB
 Ny6fGJ1luOMGyIGCsvIGKVal3b+N+TSWS3wLIk=; b=aNjOSedSzj+IiV/vDT/r5
 O0up6lmEqhKl2awSxNzRuxq0ZzDVBU0YIJIWxYnTlciv1PHFNXQdagdVJVmN28MA
 VTiRiZwDlemOC/YmNuarD4xBsfGdleGnnXTsWIPRjux89Ctr+TdYNsMNWyitKLJQ
 iKb3tZ1BEs9K0K7UGK3yy0=
Received: from localhost.localdomain (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgD32Hr1QY9nee4gFg--.59693S2;
 Tue, 21 Jan 2025 14:43:03 +0800 (CST)
From: oushixiong1025@163.com
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev/sh_mobile_lcdcfb: Use backlight helper
Date: Tue, 21 Jan 2025 14:42:36 +0800
Message-Id: <20250121064236.168236-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgD32Hr1QY9nee4gFg--.59693S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3uw4UJr1kWw1xAryrWFg_yoWDCFX_CF
 s0va4vgrsrt395KwnruFn5CFySgr4DuF1aqr4qqrZ3W347J3y3XryYgw4UKF98u3y0yF97
 XFnFqryrAr1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbqg4PUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwjbD2ePPsE4EAAAsA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 6b37b188af31..69c9067eff88 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -2123,11 +2123,7 @@ sh_mobile_lcdc_channel_fb_init(struct sh_mobile_lcdc_chan *ch,
 static int sh_mobile_lcdc_update_bl(struct backlight_device *bdev)
 {
 	struct sh_mobile_lcdc_chan *ch = bl_get_data(bdev);
-	int brightness = bdev->props.brightness;
-
-	if (bdev->props.power != FB_BLANK_UNBLANK ||
-	    bdev->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
+	int brightness = backlight_get_brightness(bdev);
 
 	ch->bl_brightness = brightness;
 	return ch->cfg->bl_info.set_brightness(brightness);
-- 
2.25.1

