Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED96A2D51B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F91510E09B;
	Sat,  8 Feb 2025 09:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="VZ2u7bTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A09710E2AE
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Yr/Kz
 e1arVLKPu4HbhTCdQQlaXiSMZKNM8RjZqVS5is=; b=VZ2u7bTO/IcFA2C+g3bm0
 tnf/GLAwRJLQhnvvjV1j+6c6RzLZVDYF0xIREPAOBLivAQKdkUaFmVhWs+fauf+m
 tXuKTv//KGpTKJUVUWQjNatrSKFhby/UhEGhu+acmP5BaFmWl+OOL5b9f7ypXJwN
 898ZCZN5B/8YGfbKwZKxjY=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wBHRQA2HqdnvFYeKg--.11819S2; 
 Sat, 08 Feb 2025 17:04:55 +0800 (CST)
From: oushixiong1025@163.com
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev: lcdcfb: add missing device_remove_file()
Date: Sat,  8 Feb 2025 17:04:51 +0800
Message-Id: <20250208090451.240292-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHRQA2HqdnvFYeKg--.11819S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8WFWDWFy3XFykXw18Xwb_yoW8Cr17pF
 4UGas0grWrZrnrGr4fAF4UuF45u348tas3Zr1xt345u3s3ArsYg345Ga93Z3yxJa93GF1a
 vrW0y345GF1UWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UP3kNUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXR3sD2elkFTX4gABsR
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
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 4715dcb59811..b56ab1df7369 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1516,7 +1516,7 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct sh_mobile_lcdc_priv *lcdc = ovl->channel->lcdc;
 	struct fb_info *info = ovl->info;
-	unsigned int i;
+	unsigned int i, error = 0;
 	int ret;
 
 	if (info == NULL)
@@ -1531,9 +1531,14 @@ sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
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
 	}
 
 	return 0;
@@ -1543,10 +1548,14 @@ static void
 sh_mobile_lcdc_overlay_fb_cleanup(struct sh_mobile_lcdc_overlay *ovl)
 {
 	struct fb_info *info = ovl->info;
+	unsigned int i;
 
 	if (info == NULL || info->device == NULL)
 		return;
 
+	for (i = 0; i < ARRAY_SIZE(overlay_sysfs_attrs); ++i)
+		device_remove_file(info->dev, &overlay_sysfs_attrs[i]);
+
 	framebuffer_release(info);
 }
 
-- 
2.25.1

