Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B96571AB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C354210E35F;
	Wed, 28 Dec 2022 01:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE96F10E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:40:16 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NhZ2t53W1z8QrkZ;
 Wed, 28 Dec 2022 09:40:06 +0800 (CST)
Received: from szxlzmapp06.zte.com.cn ([10.5.230.252])
 by mse-fl1.zte.com.cn with SMTP id 2BS1e0df048934;
 Wed, 28 Dec 2022 09:40:00 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp01[null]) by mapi (Zmail) with MAPI id mid14;
 Wed, 28 Dec 2022 09:40:01 +0800 (CST)
Date: Wed, 28 Dec 2022 09:40:01 +0800 (CST)
X-Zmail-TransId: 2b0363ab9e71ffffffffbc84f49e
X-Mailer: Zmail v1.0
Message-ID: <202212280940017919910@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <deller@gmx.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGZiZGV2OiBvbWFwOiB1c2Ugc3Ryc2NweSgpIHRvIGluc3RlYWQgb2Ygc3RybmNweSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2BS1e0df048934
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 63AB9E76.000 by FangMail milter!
X-FangMail-Envelope: 1672191606/4NhZ2t53W1z8QrkZ/63AB9E76.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63AB9E76.000/4NhZ2t53W1z8QrkZ
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
Cc: jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org, arnd@arndb.de,
 guozhengkui@vivo.com, tony@atomide.com, xu.panda@zte.com.cn,
 b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yang.yang29@zte.com.cn, yuzhe@nfschina.com,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL-terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 17cda5765683..1f3df2055ff0 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1447,7 +1447,7 @@ static int fbinfo_init(struct omapfb_device *fbdev, struct fb_info *info)
 	info->fbops = &omapfb_ops;
 	info->flags = FBINFO_FLAG_DEFAULT;

-	strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
+	strscpy(fix->id, MODULE_NAME, sizeof(fix->id));

 	info->pseudo_palette = fbdev->pseudo_palette;

@@ -1573,8 +1573,7 @@ static int omapfb_find_ctrl(struct omapfb_device *fbdev)

 	fbdev->ctrl = NULL;

-	strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
-	name[sizeof(name) - 1] = '\0';
+	strscpy(name, conf->lcd.ctrl_name, sizeof(name));

 	if (strcmp(name, "internal") == 0) {
 		fbdev->ctrl = fbdev->int_ctrl;
-- 
2.15.2
