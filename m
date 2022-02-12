Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EA4B3A6C
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 10:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F4110F3B6;
	Sun, 13 Feb 2022 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id 643F110E2B9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=+rkLnFEw/F72LXvQmH
 YzCB1m1Q8pCUyXlsVR+D9N1Ek=; b=ZvrJpF6InV9uNFn/Z9rp2/B08htqfd3z0r
 RxQHGzGKqFz7FHwEY/zWuOnfMdzWlX2urmhTpcGIyQmttSPtLMIPl8fC5eJq+Jkr
 erb8hyvdnUj7Dph3SnMDtSVrRm2x7XEwjM557z36RBMeAJndTLQCzaMfuYc4V2p2
 FfVb2MC8E=
Received: from localhost.localdomain (unknown [218.201.129.19])
 by smtp7 (Coremail) with SMTP id C8CowAD3yyCJRwdiTaJ8Cg--.28180S2;
 Sat, 12 Feb 2022 13:37:14 +0800 (CST)
From: qianfanguijin@163.com
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] drivers: fbtft: Add property 'keep-bootlogo'
Date: Sat, 12 Feb 2022 13:37:11 +0800
Message-Id: <20220212053711.26481-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: C8CowAD3yyCJRwdiTaJ8Cg--.28180S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw1fJr4kuFyrArW8GF1fCrg_yoW5Cw18pa
 yUJay5K3y8KFWq9w1UWr4UuFy3Ga4UZF1kK3sxKw1FqFn7XrZ5Xr1rGFyqy3ZYqrZ3Aa40
 kF18GrsFg3yDGr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMjgxUUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbB2AOl7WBHIrLMfAACsW
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

Keep the logo draw by bootloader

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/staging/fbtft/fbtft-core.c | 6 ++++--
 drivers/staging/fbtft/fbtft.h      | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 37548848af99..d683c2c54131 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -713,6 +713,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	par->buf = buf;
 	spin_lock_init(&par->dirty_lock);
 	par->bgr = pdata->bgr;
+	par->keep_bootlogo = pdata->keep_bootlogo;
 	par->startbyte = pdata->startbyte;
 	par->init_sequence = init_sequence;
 	par->gamma.curves = gamma_curves;
@@ -838,8 +839,8 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 			goto reg_fail;
 	}
 
-	/* update the entire display */
-	par->fbtftops.update_display(par, 0, par->info->var.yres - 1);
+	if (!par->keep_bootlogo) /* update the entire display */
+		par->fbtftops.update_display(par, 0, par->info->var.yres - 1);
 
 	if (par->fbtftops.set_gamma && par->gamma.curves) {
 		ret = par->fbtftops.set_gamma(par, par->gamma.curves);
@@ -1176,6 +1177,7 @@ static struct fbtft_platform_data *fbtft_properties_read(struct device *dev)
 	pdata->display.debug = fbtft_property_value(dev, "debug");
 	pdata->rotate = fbtft_property_value(dev, "rotate");
 	pdata->bgr = device_property_read_bool(dev, "bgr");
+	pdata->keep_bootlogo = device_property_read_bool(dev, "keep-bootlogo");
 	pdata->fps = fbtft_property_value(dev, "fps");
 	pdata->txbuflen = fbtft_property_value(dev, "txbuflen");
 	pdata->startbyte = fbtft_property_value(dev, "startbyte");
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 6751c129df4d..6232e203544a 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -126,6 +126,7 @@ struct fbtft_display {
  * @gpios: Pointer to an array of pinname to gpio mappings
  * @rotate: Display rotation angle
  * @bgr: LCD Controller BGR bit
+ * @keep_bootlogo: Keep the logo draw by bootloader
  * @fps: Frames per second (this will go away, use @fps in @fbtft_display)
  * @txbuflen: Size of transmit buffer
  * @startbyte: When set, enables use of Startbyte in transfers
@@ -136,6 +137,7 @@ struct fbtft_platform_data {
 	struct fbtft_display display;
 	unsigned int rotate;
 	bool bgr;
+	bool keep_bootlogo;
 	unsigned int fps;
 	int txbuflen;
 	u8 startbyte;
@@ -186,6 +188,7 @@ struct fbtft_platform_data {
  * @first_update_done: Used to only time the first display update
  * @update_time: Used to calculate 'fps' in debug output
  * @bgr: BGR mode/\n
+ * @keep_bootlogo: Keep the logo draw by bootloader
  * @extra: Extra info needed by driver
  */
 struct fbtft_par {
@@ -227,6 +230,7 @@ struct fbtft_par {
 	bool first_update_done;
 	ktime_t update_time;
 	bool bgr;
+	bool keep_bootlogo;
 	void *extra;
 };
 
-- 
2.17.1

