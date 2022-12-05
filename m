Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955066424A1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA38F10E114;
	Mon,  5 Dec 2022 08:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E70F10E114
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 08:31:49 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NQcGW6NKcz4xVnH;
 Mon,  5 Dec 2022 16:31:47 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2B58VblG050005;
 Mon, 5 Dec 2022 16:31:37 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Mon, 5 Dec 2022 16:31:39 +0800 (CST)
Date: Mon, 5 Dec 2022 16:31:39 +0800 (CST)
X-Zmail-TransId: 2af9638dac6bfffffffffe6c3a82
X-Mailer: Zmail v1.0
Message-ID: <202212051631391777945@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <deller@gmx.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgdjNdIGZiZGV2OiB1c2Ugc3lzZnNfZW1pdCgpIHRvIGluc3RlYWQgb2Ygc2NucHJpbnRmKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B58VblG050005
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 638DAC73.000 by FangMail milter!
X-FangMail-Envelope: 1670229107/4NQcGW6NKcz4xVnH/638DAC73.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638DAC73.000/4NQcGW6NKcz4xVnH
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
v2 -> v3
Fix the mistakes in v2.
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  8 ++++----
 drivers/video/fbdev/uvesafb.c          | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

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
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 00d789b6c0fa..ba8028a0cc7a 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1580,7 +1580,7 @@ static ssize_t uvesafb_show_vendor(struct device *dev,
 	struct uvesafb_par *par = info->par;

 	if (par->vbe_ib.oem_vendor_name_ptr)
-		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return sysfs_emit(buf, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_vendor_name_ptr);
 	else
 		return 0;
@@ -1595,7 +1595,7 @@ static ssize_t uvesafb_show_product_name(struct device *dev,
 	struct uvesafb_par *par = info->par;

 	if (par->vbe_ib.oem_product_name_ptr)
-		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return sysfs_emit(buf, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_product_name_ptr);
 	else
 		return 0;
@@ -1610,7 +1610,7 @@ static ssize_t uvesafb_show_product_rev(struct device *dev,
 	struct uvesafb_par *par = info->par;

 	if (par->vbe_ib.oem_product_rev_ptr)
-		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
+		return sysfs_emit(buf, "%s\n", (char *)
 			(&par->vbe_ib) + par->vbe_ib.oem_product_rev_ptr);
 	else
 		return 0;
@@ -1625,7 +1625,7 @@ static ssize_t uvesafb_show_oem_string(struct device *dev,
 	struct uvesafb_par *par = info->par;

 	if (par->vbe_ib.oem_string_ptr)
-		return scnprintf(buf, PAGE_SIZE, "%s\n",
+		return sysfs_emit(buf, "%s\n",
 			(char *)(&par->vbe_ib) + par->vbe_ib.oem_string_ptr);
 	else
 		return 0;
@@ -1639,7 +1639,7 @@ static ssize_t uvesafb_show_nocrtc(struct device *dev,
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct uvesafb_par *par = info->par;

-	return scnprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
+	return sysfs_emit(buf, "%d\n", par->nocrtc);
 }

 static ssize_t uvesafb_store_nocrtc(struct device *dev,
-- 
2.25.1
