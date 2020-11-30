Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBE2C7FB2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214986E40C;
	Mon, 30 Nov 2020 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C656E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:25:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e25so3776977wme.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NzLl0fRqr0wXA3BI0BGLr2jSjK0Y2QBOoJEg8OfvyyY=;
 b=WcsZAo8DO3Q0HyuUnh/pr340SQOCMOXuDal99GDyJhmXwNuMDhmbLSCPg3SN5K5i5Y
 7LRXbcWfAJ3EVNi1hpm9UKZB5r7WzjfpNY7QYiH35wXaMY7yUsfyevKtBmIBCA/dNuM8
 9cdXszVqE0lYWzI8Lm0aQzDKfUQVTBBmYurZEckhbJ2eiq/X23zYMycms2Nwf7UBfqo7
 Jk9uvUQ9fOHP+ZH6w5WUH1KoC5ouyfL39Y6NcJgrrGO5FRnBMIcm5LhxwRwYAm+x4E7x
 PeAHWIqkw++98d7kBuWHiKue/F97+NPI6jHNct75Xfp5/6N9k1wvZstg/lUaKESbmKV/
 9a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NzLl0fRqr0wXA3BI0BGLr2jSjK0Y2QBOoJEg8OfvyyY=;
 b=NSI8ygbcX4R/4zeypUhnqJPqpn4917DrEHwZwEqxgKD9lf4h0yicTbNDFdQ3CglIhM
 xZzFxMO+9qEhpg9nvmtR02FZk70vL4j7WK9n3KhR4RMsE5HQuUw6LA+bwaCBALNwVxYQ
 zyuo2NhClZ7k6IulL6I3phTDMcltbdEHaU1Fcju2B/xsJUCSnxYmZKOZx045aBZyjwy7
 lkEojQkN7p/96yntQi3iz66u+c02Nrtg0MO4dbsM3eIfe9QHmn4YvqB8UEtnwOVSOcjz
 phm/rAmiQjRMvh+EdMg9idjbd3obZ5sWC2J6Mjnk9Zx9E9LU9PpztqqRoRWmtHGWSiTt
 Fpdg==
X-Gm-Message-State: AOAM531RyO3ZuTXJ8sVSOKSrYeiWU+XxzTCeqCZlCdIX2ALyzluaAPpU
 AwIMlCHxA7Rg44SZ1uWk6uI=
X-Google-Smtp-Source: ABdhPJznKGn58KdflYISAu4Nvf+OiwgOR3AzRT3rxScvl9OKz5vIEQd/G1NpF7rPQV5Zofw0SymgFQ==
X-Received: by 2002:a1c:240a:: with SMTP id k10mr21223069wmk.173.1606717502338; 
 Sun, 29 Nov 2020 22:25:02 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id u129sm22594649wme.9.2020.11.29.22.25.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Nov 2020 22:25:01 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v1 1/3] drm/mipi-dbi: Add support for Type B
Date: Mon, 30 Nov 2020 16:23:57 +1000
Message-Id: <1606717439-18383-2-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606717439-18383-1-git-send-email-mikhail_durnev@mentor.com>
References: <1606717439-18383-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
Cc: mikhail_durnev@mentor.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikhail Durnev <mikhail_durnev@mentor.com>

Intel 8080 type (Type B) parallel bus over GPIO.

The parallel bus is implemented partially. It supports only write
operations from the host to the display. Read operations would
require switching GPIO mode between input and output back and
forth. But this implementation is very simple, and GPIO mode can
be set for all used pins to output once at initialization.

It is enough to support only write operations to initialize displays
and output video data. The bus driver returns EOPNOTSUPP for all read
operations requested through a display driver.

Bit banging is used to transmit data over the parallel bus from host
to display. There are two numbers that contol timings: wr_up_delay
and wr_down_delay. They should be provided by the display driver.
The first number is related to the write control pulse duration, and
the second number is related to the write cycle duration that can
be found in the specification of the display.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 116 ++++++++++++++++++++++++++++++++++++++++-
 include/drm/drm_mipi_dbi.h     |  30 ++++++++++-
 2 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 230c4fd..5dedc59 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -61,7 +61,7 @@
  *    3. 8-bit with the Data/Command signal as a separate D/CX pin
  *
  * Currently mipi_dbi only supports Type C options 1 and 3 with
- * mipi_dbi_spi_init().
+ * mipi_dbi_spi_init() and Type B with mipi_dbi_gpio_init().
  */
 
 #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
@@ -1158,6 +1158,120 @@ EXPORT_SYMBOL(mipi_dbi_spi_transfer);
 
 #endif /* CONFIG_SPI */
 
+/*
+ * This function implements data transfer only from host to display.
+ */
+static void mipi_dbi_gpio_transfer(struct mipi_dbi *dbi, u16 data)
+{
+	unsigned long ldata = data;
+
+	/*
+	 * Set W/R to low to start transfer.
+	 * Set DB bits with provided data when W/R is low.
+	 */
+	gpiod_set_value_cansleep(dbi->wr, 0);
+	gpiod_set_array_value_cansleep(dbi->db->ndescs, dbi->db->desc,
+				       dbi->db->info, &ldata);
+
+	/*
+	 * The bus usually needs additional delay.
+	 */
+	ndelay(dbi->wr_up_delay);
+
+	/*
+	 * Set W/R to high to indicate that DB lines are set.
+	 */
+	gpiod_set_value_cansleep(dbi->wr, 1);
+
+	/*
+	 * The connected display needs some time to read the data.
+	 */
+	ndelay(dbi->wr_down_delay);
+}
+
+static int mipi_dbi_gpio_command(struct mipi_dbi *dbi, u8 *cmd,
+				u8 *par, size_t num)
+{
+	int i;
+
+	/*
+	 * Read commands are not currently supported.
+	 */
+	if (mipi_dbi_command_is_read(dbi, *cmd))
+		return -EOPNOTSUPP;
+
+	MIPI_DBI_DEBUG_COMMAND(*cmd, par, num);
+
+	gpiod_set_value_cansleep(dbi->dc, 0);
+	mipi_dbi_gpio_transfer(dbi, (u16)*cmd);
+	gpiod_set_value_cansleep(dbi->dc, 1);
+
+	if (dbi->db->ndescs == 16 &&
+	    (*cmd == MIPI_DCS_WRITE_MEMORY_START ||
+	     *cmd == MIPI_DCS_WRITE_MEMORY_CONTINUE)) {
+		/*
+		 * Only a couple of commands supports 16-bit transfer.
+		 */
+		for (i = 0; i < num; i += 2) {
+			u16 data = *(u16 *)&par[i];
+
+			if (dbi->swap_bytes)
+				data = (data >> 8) | (data << 8);
+
+			mipi_dbi_gpio_transfer(dbi, data);
+		}
+	} else {
+		for (i = 0; i < num; i++) {
+			/*
+			 * Other commands ignore most significant bits.
+			 */
+			mipi_dbi_gpio_transfer(dbi, (u16)par[i]);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * mipi_dbi_gpio_init - Initialize MIPI DBI Type B interface implemented via GPIO
+ * @dbi: MIPI DBI structure to initialize
+ * @dc: D/C gpio
+ * @wr: W/R gpio
+ * @db: DB gpios
+ * @wr_up_delay: Delay after setting DB and before changing W/R from low to high
+ * @wr_down_delay: Delay after changing W/R from low to high
+ *
+ * This function sets &mipi_dbi->command, enables &mipi_dbi->read_commands for the
+ * usual read commands. It should be followed by a call to mipi_dbi_dev_init() or
+ * a driver-specific init.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int mipi_dbi_gpio_init(struct mipi_dbi *dbi, struct gpio_desc *dc,
+		      struct gpio_desc *wr, struct gpio_descs *db,
+		      unsigned long wr_up_delay, unsigned long wr_down_delay)
+{
+	dbi->spi = NULL; /* Type B uses GPIO lines rather than SPI */
+
+	dbi->read_commands = mipi_dbi_dcs_read_commands;
+	dbi->command = mipi_dbi_gpio_command;
+
+	dbi->dc = dc;
+	dbi->wr = wr;
+	dbi->db = db;
+	dbi->wr_up_delay = wr_up_delay;
+	dbi->wr_down_delay = wr_down_delay;
+
+	if (mipi_dbi_machine_little_endian())
+		dbi->swap_bytes = true;
+
+	mutex_init(&dbi->cmdlock);
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dbi_gpio_init);
+
 #ifdef CONFIG_DEBUG_FS
 
 static ssize_t mipi_dbi_debugfs_command_write(struct file *file,
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index c2827ce..c4be5ca 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -55,7 +55,7 @@ struct mipi_dbi {
 	struct spi_device *spi;
 
 	/**
-	 * @dc: Optional D/C gpio.
+	 * @dc: D/C gpio, optional for Type C and mandatory for Type B.
 	 */
 	struct gpio_desc *dc;
 
@@ -68,6 +68,31 @@ struct mipi_dbi {
 	 * @tx_buf9_len: Size of tx_buf9.
 	 */
 	size_t tx_buf9_len;
+
+	/* Type B specific */
+
+	/**
+	 * @wr: W/R gpio.
+	 */
+	struct gpio_desc *wr;
+
+	/**
+	 * @db: Data Bus gpios (usually 8 or 16).
+	 */
+	struct gpio_descs *db;
+
+	/**
+	 * @wr_up_delay: Delay after setting all db lines and before changing
+	 * wr from low to high.
+	 */
+	unsigned long wr_up_delay;
+
+	/**
+	 * @wr_down_delay: Delay after changing wr from low to high and
+	 * before wr can be changed again from hight to low to start a new
+	 * write operation.
+	 */
+	unsigned long wr_down_delay;
 };
 
 /**
@@ -139,6 +164,9 @@ static inline struct mipi_dbi_dev *drm_to_mipi_dbi_dev(struct drm_device *drm)
 
 int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 		      struct gpio_desc *dc);
+int mipi_dbi_gpio_init(struct mipi_dbi *dbi, struct gpio_desc *dc,
+		      struct gpio_desc *wr, struct gpio_descs *db,
+		      unsigned long wr_up_delay, unsigned long wr_down_delay);
 int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 				   const struct drm_simple_display_pipe_funcs *funcs,
 				   const uint32_t *formats, unsigned int format_count,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
