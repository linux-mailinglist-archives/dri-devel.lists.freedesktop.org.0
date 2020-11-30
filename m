Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E745B2C9950
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD676E52D;
	Tue,  1 Dec 2020 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D975C89956
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:06:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u12so18637792wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WR5N2RgMXKbZVcZ/NAjb1kgdYhbDz+iPAQbu94t8kvY=;
 b=pedhnzEFnGJVcOxsbYhPPrc2lkLtvef4GhqEQMEiVgHuVIbCEEt5v41XsvRt9HA9NQ
 cBHrX0reCRSg+eZef1dmxYirLFY5IRL/foIfkH5MDelvuRgrcicNZBXDNK2M0gpJRs0n
 JWiepWauSlAhzjOvm58C1Tqvaz3GEGJ1VFVlALt12XzxJuYmHSrYWULMryPjLYyWQDrY
 GwZ4e6eSaSmQ3XXJzpUUoOpRE1uhNv2pN1nZyjwHchxDj2LV0VZIbiO8KMHMf4sDCVET
 YjCqDB5MQhBF1IoGdhSrH33pHqSSkaIn6E38CZLAeg5ff1sFSfmgU0dljPL/6dhsDowC
 Kb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WR5N2RgMXKbZVcZ/NAjb1kgdYhbDz+iPAQbu94t8kvY=;
 b=NvKnG61Pqi92sbkbaU8JGOHMuI0mzjDFsUXMtzLczPxVZO6nyQvcEqSylRlFq62Zk+
 RW+1tSWXL/uh95uyN/SfRWt3PBTLiJM8cY90DHuEt3HCpl051fHMJyExWo8irCZBgGvc
 fzMZS+Se9xNzwlYIz+sI6RyfG/FdRfu94+cpVr2Kw+DW2G+RZdYmTV3fAFLBtPU9utL/
 8L3jOKGRb4Kk0dKSE8U4HDmdwxbRzlwZiF4/XM8dQNjgNlxW94QVC94B3hyB9bRuNjAN
 +iAlDQmZfhBWi5Hv5AjPq/dVLc9nWcAymq8MGuddJGl740/jYPacVH3ZJ14TrBZus5ni
 1Myg==
X-Gm-Message-State: AOAM530jWW9vCwClXggNMB1h9jCX8V71EFbAF8WpQSCL57W6PC04gRiu
 4qoDaQSRip8UZQmjwZUfv1I=
X-Google-Smtp-Source: ABdhPJyTd38jND5KVhZIDlgvRC1w0O5fmbizLpWZiNN5npUAnNetpEYDYOcGn5DLH+0cz2k17A4ofw==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr31315273wru.266.1606777566527; 
 Mon, 30 Nov 2020 15:06:06 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id p4sm30427985wrm.51.2020.11.30.15.06.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 15:06:06 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v2 1/3] drm/mipi-dbi: Add support for Type B
Date: Tue,  1 Dec 2020 09:05:34 +1000
Message-Id: <1606777536-14783-2-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606777536-14783-1-git-send-email-mikhail_durnev@mentor.com>
References: <1606777536-14783-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
 drivers/gpu/drm/drm_mipi_dbi.c | 134 ++++++++++++++++++++++++++++++++++++++---
 include/drm/drm_mipi_dbi.h     |  30 ++++++++-
 2 files changed, 153 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 230c4fd..3edb041 100644
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
@@ -701,6 +701,15 @@ int mipi_dbi_poweron_conditional_reset(struct mipi_dbi_dev *dbidev)
 }
 EXPORT_SYMBOL(mipi_dbi_poweron_conditional_reset);
 
+static bool mipi_dbi_machine_little_endian(void)
+{
+#if defined(__LITTLE_ENDIAN)
+	return true;
+#else
+	return false;
+#endif
+}
+
 #if IS_ENABLED(CONFIG_SPI)
 
 /**
@@ -721,15 +730,6 @@ u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len)
 }
 EXPORT_SYMBOL(mipi_dbi_spi_cmd_max_speed);
 
-static bool mipi_dbi_machine_little_endian(void)
-{
-#if defined(__LITTLE_ENDIAN)
-	return true;
-#else
-	return false;
-#endif
-}
-
 /*
  * MIPI DBI Type C Option 1
  *
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
