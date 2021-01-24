Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5A3022EC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2389BE8;
	Mon, 25 Jan 2021 08:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0D89D30
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 15:35:36 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id cq1so6773002pjb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wv+3wuXFvnGp7NmO31SkD++8+i2WVpAeSIWwaa8edxU=;
 b=SMOJRc0c6WRk3ZJrJ66nWjiPsXSD9PV4u+1Rmpv7349czhtW8hbt+2dgR2Yn2oIzao
 jW3DYBwtmEUqVZPPgtvNJrBMJe1aqdWQGJmQbgyBxOfrNZUYHsYzpyG9aJ1i/vaX2k4W
 CeLXSjk+RC/sZoTkPn4eqc03RSPQ5Uz262Ep34QFRGxkbUKpM83o4/KCFzqtCR51lU6w
 UapT1b93J/w3ICvdW/yKwNfIOV5tNlNgyaW49pXcw/aSyJk29ljg8oQRhti2yYyrX2Pw
 vsoOF/L0PG2SIMkpJye/uyfpf1fToW100DnzhJlxoOut8NTF94QqpVNxSaKMMxs3WO1U
 9mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wv+3wuXFvnGp7NmO31SkD++8+i2WVpAeSIWwaa8edxU=;
 b=CrxE6oM8Xmdk9MiDyL+V7a3oZZ3C6SqILwyBlDbd0JBw+dPW3HHhrMjpFuk5iixkEA
 Yuuh9eChejPewVxRRT1xiFkhkPhAQ8ODUjwsIMVT031tIWJwMGlnQdpakVXkNP9q9OVc
 awSwVHlPytcCVg4XAOj+cTiqFVEkfVk8t3jvpwwniKFfzKO2LJadMh6o3c/jrnBvpdTS
 7ylySqTsGzyBt+K/8485O4TOKvY98RVc5fUXU5pncyf64byBz9Z5+CwjGLdcIqIL8Se3
 vPPgxrz0J7tP5ER1yw87fhiztt8lrzh5WWF2zLvbSBTMSF3tElZStGsatnecfhESRw2H
 zmxg==
X-Gm-Message-State: AOAM532eSgwN1pfX3T55axQpUq0NX1oY5HJ+t9oQ92bsY5sVwzHLWXnk
 rE+zZ6EL6xIXgDd68hfExKM=
X-Google-Smtp-Source: ABdhPJxRx4HP7keBURkUrSGMrzZ2UCbHXcHxem8AFiuST4Ceq7bDlYUghFe2XHdQYmuQELx0csAVGQ==
X-Received: by 2002:a17:90a:6f05:: with SMTP id
 d5mr3144093pjk.145.1611502535677; 
 Sun, 24 Jan 2021 07:35:35 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id f15sm15491410pja.24.2021.01.24.07.35.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Jan 2021 07:35:34 -0800 (PST)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] fbtft: add tearing signal detect
Date: Sun, 24 Jan 2021 23:35:37 +0800
Message-Id: <1611502537-80668-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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

From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>

For st7789v ic,add tearing signal detect to avoid screen tearing

Signed-off-by: carlis.zhang_cp <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 133 ++++++++++++++++++++++++++++++++++++-
 drivers/staging/fbtft/fbtft.h      |   1 +
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc..c687b58 100644
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
@@ -82,6 +117,28 @@ enum st7789v_command {
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
+			par->gpio.te = NULL;
+		} else {
+			disable_irq_nosync(gpiod_to_irq(par->gpio.te));
+			pr_err("TE request_irq completion.\n");
+		}
+	} else {
+		pr_err("%s:%d, TE gpio not specified\n",
+		       __func__, __LINE__);
+	}
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +194,9 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+    /*Tearing Effect Line On*/
+	if (par->gpio.te)
+		write_reg(par, 0x35, 0x00);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -145,6 +205,76 @@ static int init_display(struct fbtft_par *par)
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
@@ -259,6 +389,7 @@ static int blank(struct fbtft_par *par, bool on)
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
