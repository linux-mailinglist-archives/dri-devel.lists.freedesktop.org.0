Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FD3070F5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F96E91A;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4156E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:42:48 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id g15so1391637pjd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/5CRpVhAYIt5nq1FFXNh2jsrHhTk1E3I4CheLPQJc30=;
 b=LwebHWOlnFO1NFGDdPfvHWMqOGU/3xtwhbPNBpIrKkKM62kw/ZMUQd2hD4gTEYYfJo
 /ZsIHvJAyjNaTdWPTV8/bPXXaspkyxZ91/Yy8iijwLoQU/S055b+YI5KTOhWxR0EgTdT
 blzRYX8Mdmj1E+/EuSq8iK5lAJCb0JkDvJXpSaLqYj0Sd8Y7EE1XYIedBLjkOWtLYT3X
 W2x47WcVcXICTz+KeWGB04b2xNPhX9pztcXn0vz4NP0XGftOu3CnJVzJMsphNvYNMxJ4
 2NetMOw42PhPmHb4TnHJEE4NYa/HuemLxxbiXeyvdlE18TmLUEx5o1GJjZAVOj+cStQd
 arxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/5CRpVhAYIt5nq1FFXNh2jsrHhTk1E3I4CheLPQJc30=;
 b=S4gdfvtQSI7kem2IILQ+KLgmMi60DEcVteVCMjKx+RI/qN6yNyf8Hi9u8+Jx0kNwdR
 t9H7ZyF+tLGVV5Tp1RqLuceNRnrz+imJ8+AgoordAwMMz9dZ0t0YLOj3CsOAVTH2XCpe
 wRtyaGrV1uot6ZOK+hvDTQG7dy1eakTWrt1vaBppU5KYcl4uPjGSYhyhYTGeSAYvNgSN
 s9aqsavtw54JRE1blRxZDMdAnysOhWS6FZTWwLs6i82wkHBVEsl95tQEpphPd3yDYvaV
 QEtkqyKL6MBcmSIgUgrGZdSm4gObEPItb6D+UAudIfuuec7USFoU3PJ3UqakkYu6v7Yf
 KSlg==
X-Gm-Message-State: AOAM530AMNaZMadihFsW0Kqx/tDpJFRUxqnbeltByGyJbmeD0ajvbziz
 wk1/qSjIn98xlIZbAEMXosw=
X-Google-Smtp-Source: ABdhPJyQnI/dXjI04oyDhfxJ93RmAp/oWTY5SXoVJL+VMZW48hsLsbIIctnaF0Ds2lgIn5T1jYrQ0g==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id
 o2-20020a1709026b02b02900dac6c0d650mr11625296plk.74.1611754968360; 
 Wed, 27 Jan 2021 05:42:48 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id f71sm2547437pfa.138.2021.01.27.05.42.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 05:42:47 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v10] staging: fbtft: add tearing signal detect
Date: Wed, 27 Jan 2021 21:42:52 +0800
Message-Id: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhangxuezhi <zhangxuezhi1@yulong.com>

For st7789v ic,when we need continuous full screen refresh, it is best to
wait for the TE signal arrive to avoid screen tearing

Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
---
v10: additional notes
v9: change pr_* to dev_*
v8: delete a log line
v7: return error value when request fail
v6: add te gpio request fail deal logic
v5: fix log print
v4: modify some code style and change te irq set function name
v3: modify author and signed-off-by name
v2: add release te gpio after irq request fail
---
 drivers/staging/fbtft/fb_st7789v.c | 132 ++++++++++++++++++++++++++++++++++++-
 drivers/staging/fbtft/fbtft.h      |   1 +
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc..cba08a8 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -9,9 +9,12 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
 #include <linux/module.h>
 #include <video/mipi_display.h>
-
+#include <linux/gpio/consumer.h>
 #include "fbtft.h"
 
 #define DRVNAME "fb_st7789v"
@@ -66,6 +69,32 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+#define SPI_PANEL_TE_TIMEOUT	400 /* msecs */
+static struct mutex te_mutex;/* mutex for set te gpio irq status */
+static struct completion spi_panel_te;
+
+static irqreturn_t spi_panel_te_handler(int irq, void *data)
+{
+	complete(&spi_panel_te);
+	return IRQ_HANDLED;
+}
+
+static void set_spi_panel_te_irq_status(struct fbtft_par *par, bool enable)
+{
+	static int te_irq_count;
+
+	mutex_lock(&te_mutex);
+
+	if (enable) {
+		if (++te_irq_count == 1)
+			enable_irq(gpiod_to_irq(par->gpio.te));
+	} else {
+		if (--te_irq_count == 0)
+			disable_irq(gpiod_to_irq(par->gpio.te));
+	}
+	mutex_unlock(&te_mutex);
+}
+
 /**
  * init_display() - initialize the display controller
  *
@@ -82,6 +111,33 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+	struct device *dev = par->info->device;
+
+	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
+	if (IS_ERR(par->gpio.te)) {
+		rc = PTR_ERR(par->gpio.te);
+		dev_err(par->info->device, "Failed to request te gpio: %d\n", rc);
+		return rc;
+	}
+	if (par->gpio.te) {
+		init_completion(&spi_panel_te);
+		mutex_init(&te_mutex);
+		rc = devm_request_irq(dev,
+				      gpiod_to_irq(par->gpio.te),
+				     spi_panel_te_handler, IRQF_TRIGGER_RISING,
+				     "TE_GPIO", par);
+		if (rc) {
+			dev_err(par->info->device, "TE request_irq failed.\n");
+			devm_gpiod_put(dev, par->gpio.te);
+			return rc;
+		}
+
+		disable_irq_nosync(gpiod_to_irq(par->gpio.te));
+	} else {
+		dev_info(par->info->device, "%s:%d, TE gpio not specified\n",
+			 __func__, __LINE__);
+	}
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +193,9 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+    /*Tearing Effect Line On*/
+	if (par->gpio.te)
+		write_reg(par, 0x35, 0x00);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -145,6 +204,76 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
+/*****************************************************************************
+ *
+ *   int (*write_vmem)(struct fbtft_par *par);
+ *
+ *****************************************************************************/
+
+/* 16 bit pixel over 8-bit databus */
+static int st7789v_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
+{
+	u16 *vmem16;
+	__be16 *txbuf16 = par->txbuf.buf;
+	size_t remain;
+	size_t to_copy;
+	size_t tx_array_size;
+	int i;
+	int ret = 0;
+	size_t startbyte_size = 0;
+
+	fbtft_par_dbg(DEBUG_WRITE_VMEM, par, "st7789v ---%s(offset=%zu, len=%zu)\n",
+		      __func__, offset, len);
+
+	remain = len / 2;
+	vmem16 = (u16 *)(par->info->screen_buffer + offset);
+
+	if (par->gpio.dc)
+		gpiod_set_value(par->gpio.dc, 1);
+
+	/* non buffered write */
+	if (!par->txbuf.buf)
+		return par->fbtftops.write(par, vmem16, len);
+
+	/* buffered write */
+	tx_array_size = par->txbuf.len / 2;
+
+	if (par->startbyte) {
+		txbuf16 = par->txbuf.buf + 1;
+		tx_array_size -= 2;
+		*(u8 *)(par->txbuf.buf) = par->startbyte | 0x2;
+		startbyte_size = 1;
+	}
+
+	while (remain) {
+		to_copy = min(tx_array_size, remain);
+		dev_dbg(par->info->device, "    to_copy=%zu, remain=%zu\n",
+			to_copy, remain - to_copy);
+
+		for (i = 0; i < to_copy; i++)
+			txbuf16[i] = cpu_to_be16(vmem16[i]);
+
+		vmem16 = vmem16 + to_copy;
+		if (par->gpio.te) {
+			set_spi_panel_te_irq_status(par, true);
+			reinit_completion(&spi_panel_te);
+			ret = wait_for_completion_timeout(&spi_panel_te,
+							  msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
+			if (ret == 0)
+				dev_err(par->info->device, "wait panel TE time out\n");
+		}
+		ret = par->fbtftops.write(par, par->txbuf.buf,
+					 startbyte_size + to_copy * 2);
+		if (par->gpio.te)
+			set_spi_panel_te_irq_status(par, false);
+		if (ret < 0)
+			return ret;
+		remain -= to_copy;
+	}
+
+	return ret;
+}
+
 /**
  * set_var() - apply LCD properties like rotation and BGR mode
  *
@@ -259,6 +388,7 @@ static int blank(struct fbtft_par *par, bool on)
 	.gamma = HSD20_IPS_GAMMA,
 	.fbtftops = {
 		.init_display = init_display,
+		.write_vmem = st7789v_write_vmem16_bus8,
 		.set_var = set_var,
 		.set_gamma = set_gamma,
 		.blank = blank,
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 76f8c09..93bac05 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -212,6 +212,7 @@ struct fbtft_par {
 		struct gpio_desc *wr;
 		struct gpio_desc *latch;
 		struct gpio_desc *cs;
+		struct gpio_desc *te;
 		struct gpio_desc *db[16];
 		struct gpio_desc *led[16];
 		struct gpio_desc *aux[16];
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
