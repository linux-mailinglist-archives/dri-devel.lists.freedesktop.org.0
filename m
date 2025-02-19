Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A93A3B1C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 07:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271910E461;
	Wed, 19 Feb 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="A2f8rQ7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 829FD10E461
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=U1net
 4T7Q6cu0QEL0E/9T25UtKWWEpm4SRfno/kdROI=; b=A2f8rQ7h+lFehOjJPbVZR
 MY64dVxtPHCzKnRrHhYiwDk7gNSNUsGA6ThjL8PTNzJ28AtpbLsthuB/E4AFWCF7
 fth/MVD+hC0cfvcbCutupu2X6V2YT7HwehZnxhyAGJgM2F0sQYgr/dKQVumACaSt
 OeYp/NY5r5B94jiOz2zQic=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wDnz8qqfrVnPwaGNA--.2549S2; 
 Wed, 19 Feb 2025 14:48:11 +0800 (CST)
From: oushixiong1025@163.com
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v3] fbdev: lcdcfb: add missing device_remove_file()
Date: Wed, 19 Feb 2025 14:48:08 +0800
Message-Id: <20250219064808.170517-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnz8qqfrVnPwaGNA--.2549S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8WFWDWw13Cr4xAF1rXrb_yoW5JrWxpF
 4UGas0grZ5Zrn7ur43AF4Uua15urykta4DZr1xJw15C3s3Arn5W343J397JF17JFZ3GF1a
 vrW0y343GF47uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPgAcUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwj4D2e1fEcuXwAAsE
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
v2->v3:
	change the type of 'i' to int.
	add overlay_sysfs_attrs_enabled flag.

 drivers/video/fbdev/sh_mobile_lcdcfb.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 4715dcb59811..eaf782133542 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -200,6 +200,8 @@ struct sh_mobile_lcdc_overlay {
 	unsigned int pitch;
 	int pos_x;
 	int pos_y;
+
+	bool overlay_sysfs_attrs_enabled;
 };
 
 struct sh_mobile_lcdc_priv {
@@ -1504,10 +1506,16 @@ static void
 sh_mobile_lcdc_overlay_fb_unregister(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct fb_info *info = ovl->info;
+	unsigned int i;
 
 	if (info == NULL || info->dev == NULL)
 		return;
 
+	if (ovl->overlay_sysfs_attrs_enabled) {
+		for (i = 0; i < ARRAY_SIZE(overlay_sysfs_attrs); ++i)
+			device_remove_file(info->dev, &overlay_sysfs_attrs[i]);
+		ovl->overlay_sysfs_attrs_enabled =  false;
+	}
 	unregister_framebuffer(ovl->info);
 }
 
@@ -1516,7 +1524,7 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct sh_mobile_lcdc_priv *lcdc = ovl->channel->lcdc;
 	struct fb_info *info = ovl->info;
-	unsigned int i;
+	int i, error = 0;
 	int ret;
 
 	if (info == NULL)
@@ -1530,10 +1538,19 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
 		 dev_name(lcdc->dev), ovl->index, info->var.xres,
 		 info->var.yres, info->var.bits_per_pixel);
 
+	ovl->overlay_sysfs_attrs_enabled = true;
+
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
+		ovl->overlay_sysfs_attrs_enabled = false;
+		return error;
 	}
 
 	return 0;
-- 
2.25.1

