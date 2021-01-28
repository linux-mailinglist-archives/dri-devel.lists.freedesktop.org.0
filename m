Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3A307EE8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933316EA0D;
	Thu, 28 Jan 2021 19:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3896E193
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 12:53:52 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id md11so3811153pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xKZV/Um0FhIRJnZma6AnCUuyhST6hlEZWfXA5uHsQWE=;
 b=RsVUrWnGd5k9TLDian2DQ05N268wiPWUgerEcXZhzdAKH+9zPCu7/ScFRrGiZCWlsK
 mM83O/xDIDeNYUagTprjteO+ERDCmrAhAbcQfoJRKt+Q+pF+i80s7aEgIo7Q7viniVXn
 MDmGR+jFMWiH+N4dGoh1g/VIRrp9owYBxr318oNo/aK3RyjDD2Cf064hY9Fon3iWj5xn
 HHGesDUBujYRMpB7bg0Q2YJGOTmHDPx2oOcuGysKGirA+Kx2PekmSRXRbwqMh+KrNhUZ
 0OrP4R/Qk6xvCXyKEJVhoEhLzGBfhlDOz2G6pq3xuA9UTM5RXVtcsF9ghvfLDhJX7pXV
 +u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xKZV/Um0FhIRJnZma6AnCUuyhST6hlEZWfXA5uHsQWE=;
 b=DxlXVnILyfc7kG3jlAWE5ntkQ/hKgoEWIKHlFP/EMO1RGR4RBNNk+cmute7xfczqL9
 uuXsZHDxeirwnK3NmZ6tb6JC87hN+0JvY6LhQOxtYUTvy6ZbyKMOM+m55ULJ2kVdmOo3
 xidie6TLRR9fbVcTl/8uvK6Ms6oqj3feOlOxvTDxd/dchT3433ww2fO8iaypKs0QPSZm
 MZ2c35pia6x7uXwQ2xWE1EicG/d2uhTQQjNdFoVKaJAQXBdvTMt0y36LS1J9X9adGxgT
 hxzpLzAOP7jAbDE9TvpMwp/E0fvyVTPDiDqm4FFKC4FSvoODEjbTBZGp2HR6DZwAb3tk
 uFeQ==
X-Gm-Message-State: AOAM533be72Z8NK7bp4OxhVarR8hg+2NkqcrolJdKwGh0pFugC3lB5ah
 JNnPoJHIm+oM4U4ig0AduxE=
X-Google-Smtp-Source: ABdhPJz5GI/BBV+WOge6Ok/da+CApxkX/YnH/s4kvZM1atA4tL07ZH/qrSyjF6NlpzDY2iIv01Zsxg==
X-Received: by 2002:a17:902:ab90:b029:e0:17b:ae98 with SMTP id
 f16-20020a170902ab90b02900e0017bae98mr16119255plr.6.1611838432507; 
 Thu, 28 Jan 2021 04:53:52 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id y1sm5821520pfn.125.2021.01.28.04.53.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 04:53:51 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v12] staging: fbtft: add tearing signal detect
Date: Thu, 28 Jan 2021 20:53:55 +0800
Message-Id: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
v12: change dev_err to dev_err_probe and add space in comments start, and
     delete te_mutex, change te wait logic
v11: remove devm_gpio_put and change a dev_err to dev_info
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
 drivers/staging/fbtft/fb_st7789v.c | 116 +++++++++++++++++++++++++++++++++++++
 drivers/staging/fbtft/fbtft.h      |   1 +
 2 files changed, 117 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc..f08e9da 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -9,7 +9,11 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
+
 #include <video/mipi_display.h>
 
 #include "fbtft.h"
@@ -66,6 +70,15 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+#define SPI_PANEL_TE_TIMEOUT	400 /* msecs */
+static struct completion spi_panel_te;
+
+static irqreturn_t spi_panel_te_handler(int irq, void *data)
+{
+	complete(&spi_panel_te);
+	return IRQ_HANDLED;
+}
+
 /**
  * init_display() - initialize the display controller
  *
@@ -82,6 +95,29 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+	struct device *dev = par->info->device;
+
+	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
+	if (IS_ERR(par->gpio.te))
+		return dev_err_probe(par->info->device, PTR_ERR(par->gpio.te),
+				     "Failed to request te gpio\n");
+
+	if (par->gpio.te) {
+		init_completion(&spi_panel_te);
+		rc = devm_request_irq(dev,
+				      gpiod_to_irq(par->gpio.te),
+				     spi_panel_te_handler, IRQF_TRIGGER_RISING,
+				     "TE_GPIO", par);
+		if (IS_ERR(rc))
+			return dev_err_probe(par->info->device, PTR_ERR(rc),
+					     "TE request_irq failed.\n");
+
+		disable_irq_nosync(gpiod_to_irq(par->gpio.te));
+	} else {
+		dev_info(par->info->device, "%s:%d, TE gpio not specified\n",
+			 __func__, __LINE__);
+	}
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +173,10 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+	/* tearing effect line on */
+	if (par->gpio.te)
+		write_reg(par, 0x35, 0x00);
+
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -146,6 +186,81 @@ static int init_display(struct fbtft_par *par)
 }
 
 /**
+ * st7789v_write_vmem16_bus8() -  write data to display
+ *
+ * @par: FBTFT parameter object
+ * @offset: offset from screen_buffer
+ * @len: the length of data to be written
+ *
+ * 16 bit pixel over 8-bit databus
+ *
+ * Return: 0 on success, < 0 if error occurred.
+ */
+
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
+	if (par->gpio.te) {
+		enable_irq(gpiod_to_irq(par->gpio.te));
+		reinit_completion(&spi_panel_te);
+		ret = wait_for_completion_timeout(&spi_panel_te,
+						  msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
+		if (ret == 0)
+			dev_err(par->info->device, "wait panel TE time out\n");
+
+		disable_irq(gpiod_to_irq(par->gpio.te));
+	}
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
+		ret = par->fbtftops.write(par, par->txbuf.buf,
+					 startbyte_size + to_copy * 2);
+		if (ret < 0)
+			return ret;
+		remain -= to_copy;
+	}
+
+	return ret;
+}
+
+/**
  * set_var() - apply LCD properties like rotation and BGR mode
  *
  * @par: FBTFT parameter object
@@ -259,6 +374,7 @@ static int blank(struct fbtft_par *par, bool on)
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
