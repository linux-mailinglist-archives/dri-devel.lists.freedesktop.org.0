Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3FA2D541
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 10:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663B10E093;
	Sat,  8 Feb 2025 09:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ed6A45wM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF8D210E093
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bYMGG
 j4F/JZvudIDaRtW1ZtWpqeyPToJB8Uq/ovG1Fk=; b=ed6A45wMvBi8XX+8dtWC3
 2SbnX19nikA5ExWLPV/aZbZtwAh4o+JyW2FApF/mzmcQT4cbBLCIKJsr3NsnIuqW
 yI2V/Vd/iuTxW2chXiDyQllQM7v37+Z6WGcHY7NfboUIbGD78ERbPvrHtTBKf+LM
 Y2nie+60wy87W+pNbLOFvQ=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wB35gTwI6dnE0MiKg--.12901S2; 
 Sat, 08 Feb 2025 17:29:21 +0800 (CST)
From: oushixiong1025@163.com
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2] fbdev: lcdcfb: add missing device_remove_file()
Date: Sat,  8 Feb 2025 17:29:18 +0800
Message-Id: <20250208092918.251733-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB35gTwI6dnE0MiKg--.12901S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8WFWDWF4Dtw1fWr13XFb_yoW8Zry5pF
 4UGas0grWrZrnrWr4fAF4UuF45u3s7tas3Zr1xJ345u3s3ArsYg343Ja93XrWfJa93GF1a
 vrWrt345uF4UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQVy3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwXtD2enFw6wdwAAsa
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

1. The device_remove_file() need to be called when driver is removing.
2. The device_remove_file() need to be called if the call to
   device_create_file() fails.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
v1->v2:
	add missing 'return error'.
	call device_remove_file() in sh_mobile_lcdc_overlay_fb_unregister().

 drivers/video/fbdev/sh_mobile_lcdcfb.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 4715dcb59811..c52661d5491a 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1504,10 +1504,14 @@ static void
 sh_mobile_lcdc_overlay_fb_unregister(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct fb_info *info = ovl->info;
+	unsigned int i;
 
 	if (info == NULL || info->dev == NULL)
 		return;
 
+	for (i = 0; i < ARRAY_SIZE(overlay_sysfs_attrs); ++i)
+		device_remove_file(info->dev, &overlay_sysfs_attrs[i]);
+
 	unregister_framebuffer(ovl->info);
 }
 
@@ -1516,7 +1520,7 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct sh_mobile_lcdc_priv *lcdc = ovl->channel->lcdc;
 	struct fb_info *info = ovl->info;
-	unsigned int i;
+	unsigned int i, error = 0;
 	int ret;
 
 	if (info == NULL)
@@ -1531,9 +1535,15 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
 		 info->var.yres, info->var.bits_per_pixel);
 
 	for (i = 0; i < ARRAY_SIZE(overlay_sysfs_attrs); ++i) {
-		ret = device_create_file(info->dev, &overlay_sysfs_attrs[i]);
-		if (ret < 0)
-			return ret;
+		error = device_create_file(info->dev, &overlay_sysfs_attrs[i]);
+		if (error)
+			break;
+	}
+
+	if (error) {
+		while (--i >= 0)
+			device_remove_file(info->dev, &overlay_sysfs_attrs[i]);
+		return error;
 	}
 
 	return 0;
-- 
2.17.1

