Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FE4B3A70
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 10:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EADC10F3C0;
	Sun, 13 Feb 2022 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35FC410E46F
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 04:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=QrMvjyRTDfnpae8pyg
 x9XhUy6g/CG+mQ8ga8IHwifAU=; b=HCZpflZtG759fPUHQYRfpXqeQNB1d1DnPo
 M6xyva4i6Jqyrrs7ftUzXPrRqL3tubeJVY0pTt4q9GBFGYR1aRofezU/44g21V3U
 KJNE+Gt9O+vLn92Rc68FNNrkKFBZ4OPs+r6gMnyOo7tcRGFZzlOX4ov9IgsUrlpw
 4doQGg/Po=
Received: from localhost.localdomain (unknown [218.201.129.19])
 by smtp11 (Coremail) with SMTP id D8CowADH7AE9NwdiMnHcCQ--.5850S2;
 Sat, 12 Feb 2022 12:27:49 +0800 (CST)
From: qianfanguijin@163.com
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] drivers: fbtft: Refactor backlight logic
Date: Sat, 12 Feb 2022 12:27:39 +0800
Message-Id: <20220212042739.21744-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: D8CowADH7AE9NwdiMnHcCQ--.5850S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWDWw4xtFW3Cw13KFW5GFg_yoWrZrWkpF
 Wjya4Ykry8Way8ur4jqr47Z3Wak3yxAFyxGFy7K3yFvF9rXrWvvF18tFyqv3Z3trWfCF1U
 GF1kZr1kJ3WDCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRHEEUUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBRxGl7WDkW+aCGwAAs+
X-Mailman-Approved-At: Sun, 13 Feb 2022 09:00:38 +0000
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
Cc: qianfan Zhao <qianfanguijin@163.com>, preid@electromag.com.au,
 andriy.shevchenko@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: qianfan Zhao <qianfanguijin@163.com>

Control led gpios by using GPIO_ACTIVE flags, don't detect the polarity
by reading the gpio value when probe.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/staging/fbtft/fbtft-core.c | 54 +++++++++++++++++-------------
 drivers/staging/fbtft/fbtft.h      |  1 -
 2 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index ed992ca605eb..37548848af99 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -70,14 +70,14 @@ void fbtft_dbg_hex(const struct device *dev, int groupsize,
 }
 EXPORT_SYMBOL(fbtft_dbg_hex);
 
-static int fbtft_request_one_gpio(struct fbtft_par *par,
-				  const char *name, int index,
-				  struct gpio_desc **gpiop)
+static int fbtft_request_one_gpio_with_flags(struct fbtft_par *par,
+					     const char *name, int index,
+					     enum gpiod_flags flags,
+					     struct gpio_desc **gpiop)
 {
 	struct device *dev = par->info->device;
 
-	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
-					       GPIOD_OUT_LOW);
+	*gpiop = devm_gpiod_get_index_optional(dev, name, index, flags);
 	if (IS_ERR(*gpiop))
 		return dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
 
@@ -87,6 +87,25 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 	return 0;
 }
 
+static int fbtft_request_one_gpio(struct fbtft_par *par,
+				  const char *name, int index,
+				  struct gpio_desc **gpiop)
+{
+	enum gpiod_flags flags = GPIOD_OUT_LOW;
+
+	return fbtft_request_one_gpio_with_flags(par, name, index, flags, gpiop);
+}
+
+static int fbtft_request_led_gpio(struct fbtft_par *par,
+				  const char *name, int index,
+				  struct gpio_desc **gpiop)
+{
+	enum gpiod_flags flags = GPIOD_OUT_HIGH;
+
+	/* request and turn on backlight */
+	return fbtft_request_one_gpio_with_flags(par, name, index, flags, gpiop);
+}
+
 static int fbtft_request_gpios(struct fbtft_par *par)
 {
 	int i;
@@ -115,7 +134,7 @@ static int fbtft_request_gpios(struct fbtft_par *par)
 					     &par->gpio.db[i]);
 		if (ret)
 			return ret;
-		ret = fbtft_request_one_gpio(par, "led", i,
+		ret = fbtft_request_led_gpio(par, "led", i,
 					     &par->gpio.led[i]);
 		if (ret)
 			return ret;
@@ -132,17 +151,16 @@ static int fbtft_request_gpios(struct fbtft_par *par)
 static int fbtft_backlight_update_status(struct backlight_device *bd)
 {
 	struct fbtft_par *par = bl_get_data(bd);
-	bool polarity = par->polarity;
 
 	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: polarity=%d, power=%d, fb_blank=%d\n",
-		      __func__, polarity, bd->props.power, bd->props.fb_blank);
+		      "%s: power=%d, fb_blank=%d\n",
+		      __func__, bd->props.power, bd->props.fb_blank);
 
 	if ((bd->props.power == FB_BLANK_UNBLANK) &&
 	    (bd->props.fb_blank == FB_BLANK_UNBLANK))
-		gpiod_set_value(par->gpio.led[0], polarity);
+		gpiod_set_value(par->gpio.led[0], 1);
 	else
-		gpiod_set_value(par->gpio.led[0], !polarity);
+		gpiod_set_value(par->gpio.led[0], 0);
 
 	return 0;
 }
@@ -179,11 +197,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 	}
 
 	bl_props.type = BACKLIGHT_RAW;
-	/* Assume backlight is off, get polarity from current state of pin */
-	bl_props.power = FB_BLANK_POWERDOWN;
-	if (!gpiod_get_value(par->gpio.led[0]))
-		par->polarity = true;
-
+	bl_props.power = FB_BLANK_UNBLANK;
 	bd = backlight_device_register(dev_driver_string(par->info->device),
 				       par->info->device, par,
 				       &fbtft_bl_ops, &bl_props);
@@ -853,14 +867,6 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		 fb_info->fix.smem_len >> 10, text1,
 		 HZ / fb_info->fbdefio->delay, text2);
 
-#ifdef CONFIG_FB_BACKLIGHT
-	/* Turn on backlight if available */
-	if (fb_info->bl_dev) {
-		fb_info->bl_dev->props.power = FB_BLANK_UNBLANK;
-		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
-	}
-#endif
-
 	return 0;
 
 reg_fail:
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 76f8c090a837..6751c129df4d 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -228,7 +228,6 @@ struct fbtft_par {
 	ktime_t update_time;
 	bool bgr;
 	void *extra;
-	bool polarity;
 };
 
 #define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
-- 
2.17.1

