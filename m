Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D566423E7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 08:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CB810E009;
	Mon,  5 Dec 2022 07:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD910E009
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:57:03 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NQbVN46vkz5BNRf;
 Mon,  5 Dec 2022 15:57:00 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2B57ukZw098774;
 Mon, 5 Dec 2022 15:56:46 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Mon, 5 Dec 2022 15:56:47 +0800 (CST)
Date: Mon, 5 Dec 2022 15:56:47 +0800 (CST)
X-Zmail-TransId: 2af9638da43fffffffff9e6764cf
X-Mailer: Zmail v1.0
Message-ID: <202212051556478226726@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <lee@kernel.org>, <daniel.thompson@linaro.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGJhY2tsaWdodDogdXNlIHN5c2ZzX2VtaXQoKSB0byBpbnN0ZWFkIG9mIHNjbnByaW50Zigp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B57ukZw098774
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 638DA44C.000 by FangMail milter!
X-FangMail-Envelope: 1670227020/4NQbVN46vkz5BNRf/638DA44C.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638DA44C.000/4NQbVN46vkz5BNRf
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
Cc: jingoohan1@gmail.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/video/backlight/lm3533_bl.c | 10 +++++-----
 drivers/video/backlight/lp855x_bl.c |  4 ++--
 drivers/video/backlight/lp8788_bl.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 1df1b6643c0b..5e2ce9285245 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -66,7 +66,7 @@ static ssize_t show_id(struct device *dev,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);

-	return scnprintf(buf, PAGE_SIZE, "%d\n", bl->id);
+	return sysfs_emit(buf, "%d\n", bl->id);
 }

 static ssize_t show_als_channel(struct device *dev,
@@ -75,7 +75,7 @@ static ssize_t show_als_channel(struct device *dev,
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	unsigned channel = lm3533_bl_get_ctrlbank_id(bl);

-	return scnprintf(buf, PAGE_SIZE, "%u\n", channel);
+	return sysfs_emit(buf, "%u\n", channel);
 }

 static ssize_t show_als_en(struct device *dev,
@@ -95,7 +95,7 @@ static ssize_t show_als_en(struct device *dev,
 	mask = 1 << (2 * ctrlbank);
 	enable = val & mask;

-	return scnprintf(buf, PAGE_SIZE, "%d\n", enable);
+	return sysfs_emit(buf, "%d\n", enable);
 }

 static ssize_t store_als_en(struct device *dev,
@@ -147,7 +147,7 @@ static ssize_t show_linear(struct device *dev,
 	else
 		linear = 0;

-	return scnprintf(buf, PAGE_SIZE, "%x\n", linear);
+	return sysfs_emit(buf, "%x\n", linear);
 }

 static ssize_t store_linear(struct device *dev,
@@ -190,7 +190,7 @@ static ssize_t show_pwm(struct device *dev,
 	if (ret)
 		return ret;

-	return scnprintf(buf, PAGE_SIZE, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }

 static ssize_t store_pwm(struct device *dev,
diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index bd0bdeae23a4..fafc1a9e76ef 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -293,7 +293,7 @@ static ssize_t lp855x_get_chip_id(struct device *dev,
 {
 	struct lp855x *lp = dev_get_drvdata(dev);

-	return scnprintf(buf, PAGE_SIZE, "%s\n", lp->chipname);
+	return sysfs_emit(buf, "%s\n", lp->chipname);
 }

 static ssize_t lp855x_get_bl_ctl_mode(struct device *dev,
@@ -307,7 +307,7 @@ static ssize_t lp855x_get_bl_ctl_mode(struct device *dev,
 	else if (lp->mode == REGISTER_BASED)
 		strmode = "register based";

-	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
+	return sysfs_emit(buf, "%s\n", strmode);
 }

 static DEVICE_ATTR(chip_id, S_IRUGO, lp855x_get_chip_id, NULL);
diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index ba42f3fe0c73..00d79c0cfee9 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -240,7 +240,7 @@ static ssize_t lp8788_get_bl_ctl_mode(struct device *dev,
 	else
 		strmode = "Invalid mode";

-	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
+	return sysfs_emit(buf, "%s\n", strmode);
 }

 static DEVICE_ATTR(bl_ctl_mode, S_IRUGO, lp8788_get_bl_ctl_mode, NULL);
-- 
2.25.1
