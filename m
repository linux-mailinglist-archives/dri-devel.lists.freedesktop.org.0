Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3E64241D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFA689FEA;
	Mon,  5 Dec 2022 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71389FEA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 08:08:20 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NQblQ6GHkz8RV7X
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:08:18 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4NQblM2R66z4y0vF;
 Mon,  5 Dec 2022 16:08:15 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2B58825v016075;
 Mon, 5 Dec 2022 16:08:02 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Mon, 5 Dec 2022 16:08:04 +0800 (CST)
Date: Mon, 5 Dec 2022 16:08:04 +0800 (CST)
X-Zmail-TransId: 2af9638da6e4fffffffffc58ba99
X-Mailer: Zmail v1.0
Message-ID: <202212051608044377107@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <deller@gmx.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGZiZGV2OiB1c2Ugc3lzZnNfZW1pdCgpIHRvIGluc3RlYWQgb2Ygc2NucHJpbnRmKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B58825v016075
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 638DA6F2.001 by FangMail milter!
X-FangMail-Envelope: 1670227698/4NQblQ6GHkz8RV7X/638DA6F2.001/192.168.251.13/[192.168.251.13]/mxct.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638DA6F2.001/4NQblQ6GHkz8RV7X
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 6d00893d41f4..ad9323ed8e2e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1188,7 +1188,7 @@ overlay_alpha_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct sh_mobile_lcdc_overlay *ovl = info->par;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->alpha);
+	return sysfs_emit(buf, "%u\n", ovl->alpha);
 }

 static ssize_t
@@ -1226,7 +1226,7 @@ overlay_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct sh_mobile_lcdc_overlay *ovl = info->par;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->mode);
+	return sysfs_emit(buf, "%u\n", ovl->mode);
 }

 static ssize_t
@@ -1265,7 +1265,7 @@ overlay_position_show(struct device *dev, struct device_attribute *attr,
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct sh_mobile_lcdc_overlay *ovl = info->par;

-	return scnprintf(buf, PAGE_SIZE, "%d,%d\n", ovl->pos_x, ovl->pos_y);
+	return sysfs_emit(buf, "%d,%d\n", ovl->pos_x, ovl->pos_y);
 }

 static ssize_t
@@ -1306,7 +1306,7 @@ overlay_rop3_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct sh_mobile_lcdc_overlay *ovl = info->par;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->rop3);
+	return sysfs_emit(buf, "%u\n", ovl->rop3);
 }

 static ssize_t
-- 
2.25.1
