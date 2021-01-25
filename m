Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE5303826
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1D76E45C;
	Tue, 26 Jan 2021 08:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421AD6E046
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 09:14:28 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id h15so4717003pli.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 01:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Uuz1cWK615KjsyzAn5B4uJHEFhZmMkBz735HYYCWLVw=;
 b=h/AIA79zizQQWojMq6zI+7TjxgSNttvCWo/+HGGBWb3sk7UE2Ca2RaycAW6/fXal6h
 RzoL80f2C9Wyua8eX9hB2eb0UVf9KnDI2VfeZVnOcsc0c4NE8QGisnZoIy8m8tCw3ceo
 vOL0S4bjzdbfDaFNX2lENvCM8ZHEy/+WwP5aFXLG9k2g72TwPQE9AMfW3Ob60acOuhac
 PlGtxE8DLVNXD45cgC/cTlqyqgwNwQ+XF/53fbVJUTlOtmX03qPW9UWwrG7ID/bDQc1h
 PRdNb79irDYNhfm4zfPtxFEUtTbTveFrJOY1K3wTaMNX5tsqPKNWdWcVERzgpbBnVSEu
 ZxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uuz1cWK615KjsyzAn5B4uJHEFhZmMkBz735HYYCWLVw=;
 b=AyseaFBVETWwa12zQPrY32eZrfrlbD2CljF9GxmIzsrAbFp5MONQIL8DOr0/k+gSmi
 xwpN/1xH4ipQweyZHwxA2u8VjPUzEUeTEjbd73Mb/0Foft8+ggAEcPTm4Rq5K95W+zaZ
 slu2oyCEFDF0JjRex8u6TQSLzklIIdFnGcllqcrtR9nmAecIoiwj6hNZ6s2sZHzGRo4v
 4TBCIHok2ZsVC6gbl6uMUu2ywJBhy9EsH+s5WFQpfRv6gPcXrVPelmcIfvB+AIeEAQtq
 EqhjGZOuD0GtUrzZ2u3Eu5t4Y0ALv+2KxDdH4/Qg34cJAjQbjoHr2Qg3qp5u1uyqorBn
 Mc8g==
X-Gm-Message-State: AOAM532W3g9aVu5EoBXO7vRsIn+tBgm/MmbFLMC4SrZ65/DJWzWlQE1S
 1dEB99LNqK8irfzxkWhpcQI=
X-Google-Smtp-Source: ABdhPJyXozHSNR3fCJUy/gHIy4qAmev22ABOH8/+wjpYGHD2zR3SUBsJ5+AJ2vN67e7SzkUYmysjIg==
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr4549773pja.47.1611566067755; 
 Mon, 25 Jan 2021 01:14:27 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id p13sm15184063pjz.49.2021.01.25.01.14.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 01:14:26 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3] fbtft: add tearing signal detect
Date: Mon, 25 Jan 2021 17:14:30 +0800
Message-Id: <1611566070-84944-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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

For st7789v ic,add tearing signal detect to avoid screen tearing

Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
---
v3:modify author name
---
 drivers/staging/fbtft/fb_st7789v.c | 134 ++++++++++++++++++++++++++++++++++++-
 drivers/staging/fbtft/fbtft.h      |   1 +
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc..5426276 100644
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
@@ -66,6 +69,38 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+#define SPI_PANEL_TE_TIMEOUT	400
+static struct mutex te_mutex;/*mutex for tearing line*/
+static struct completion spi_panel_te;
+
+static irqreturn_t spi_panel_te_handler(int irq, void *data)
+{
+	complete(&spi_panel_te);
+	return IRQ_HANDLED;
+}
+
+static void enable_spi_panel_te_irq(struct fbtft_par *par, bool enable)
+{
+	static int te_irq_count;
+
+	if (!par->gpio.te) {
+		pr_err("%s:%d,SPI panel TE GPIO not configured\n",
+		       __func__, __LINE__);
+		return;
+	}
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
@@ -82,6 +117,29 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+	struct device *dev = par->info->device;
+
+	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
+	if (par->gpio.te) {
+		init_completion(&spi_panel_te);
+		mutex_init(&te_mutex);
+		rc = devm_request_irq(dev,
+				      gpiod_to_irq(par->gpio.te),
+				     spi_panel_te_handler, IRQF_TRIGGER_RISING,
+				     "TE_GPIO", par);
+		if (rc) {
+			pr_err("TE request_irq failed.\n");
+			devm_gpiod_put(dev, par->gpio.te);
+			par->gpio.te = NULL;
+		} else {
+			disable_irq_nosync(gpiod_to_irq(par->gpio.te));
+			pr_info("TE request_irq completion.\n");
+		}
+	} else {
+		pr_err("%s:%d, TE gpio not specified\n",
+		       __func__, __LINE__);
+	}
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +195,9 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+    /*Tearing Effect Line On*/
+	if (par->gpio.te)
+		write_reg(par, 0x35, 0x00);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -145,6 +206,76 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
+/*****************************************************************************
+ *
+ *   int (*write_vmem)(struct fbtft_par *par);
+ *
+ *****************************************************************************/
+
+/* 16 bit pixel over 8-bit databus */
+int st7789v_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
+{
+	u16 *vmem16;
+	__be16 *txbuf16 = par->txbuf.buf;
+	size_t remain;
+	size_t to_copy;
+	size_t tx_array_size;
+	int i;
+	int rc, ret = 0;
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
+			enable_spi_panel_te_irq(par, true);
+			reinit_completion(&spi_panel_te);
+			rc = wait_for_completion_timeout(&spi_panel_te,
+							 msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
+			if (rc == 0)
+				pr_err("wait panel TE time out\n");
+		}
+		ret = par->fbtftops.write(par, par->txbuf.buf,
+								startbyte_size + to_copy * 2);
+		if (par->gpio.te)
+			enable_spi_panel_te_irq(par, false);
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
@@ -259,6 +390,7 @@ static int blank(struct fbtft_par *par, bool on)
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
