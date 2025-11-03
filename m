Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A01C2B3E0
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880A10E3B1;
	Mon,  3 Nov 2025 11:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Di+ZKMBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C33C10E3B1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:07:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-27d3540a43fso41166175ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762168026; x=1762772826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lpL8yHxc29q7CkRcSb844TU4dCThtbOUfNG6nCrEn28=;
 b=Di+ZKMBzjzE4kB/9BVFUmrhTfIaFPJpcmlFAKHXW6ZF4sU3amRoj4otYlfS6jUgyxc
 Vn4QluVTULbwRSG2AGBz+syEHbZC2PWwcjXuFi5LNEbnJEzKcgfTU7HMJeh2mxfXbIN/
 sZDby9+hSPILSNXaQXShGitAvQdmrhJ20Do26iWWYY2JWLGceN49eGhFarcaJKQy3i2w
 zwxN5hFNZ6P/iBd1NySDYG2VhsRkhLNEd0ROoZTyqacuQMP10KvPMVYSteuDQtUK276C
 xYnnApTCjpsYWTIXQ/ygI4qM8X+ScEXmY1mMxZZeFILP/ICjd+h1z+hX2Y77DNML3uo8
 QCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762168026; x=1762772826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lpL8yHxc29q7CkRcSb844TU4dCThtbOUfNG6nCrEn28=;
 b=tsoRLX2o/Y5IeAXN0u4HG35A0l79UD+jMCLz1N28D13qMiKv0AOhLv3qoR95C4SOJ+
 aeftktrr6yqiLviX/R24wENkgMiHNip3ZsPsgJn3rx/2PePp//d3ao4lq+HHi4TJrCQ0
 webK4u1wrTiQfYht3wRY4DWR9ohpHZMZqTpcyxerjmy3ySB0djvkUx10+SW3KIQ+slCT
 DgiUJ6gTU2NPMcwvaQV46cXW/vwJkq6se53qYSC9p9BUra+NrtMq8AyPCmq/eiZqxqWG
 oHX6x6Y8iUi24b8fhh3oHRM8r+a0HfA+3WmTKyjgX4eqDwSihflRn2tNxtCQn/vMkGA3
 ST1g==
X-Gm-Message-State: AOJu0Yy65XYv4ZrO+D6UJg2q/sYPWV5dXZi/ugwoc5NYN6xOjtylpAaY
 8gu+8QKUFxn1BrM1cqE3Oesxn+SVlCSNe2BU6GTzQumX2pISST5Edy/b
X-Gm-Gg: ASbGncuCFz0OE6hGcuaQUfTrfiQ4zRUetgoCr2fe7sl4vURbQnh/7VmULTm+nk/8ZIE
 6Kua8tXdAoEz90v2DMqZFjDzJ3nULSSKaTfG1rm5fC+ghjU/16f+8Bq8J9Rc/oGw+gvY0pAySLZ
 QInhgV7nSOhH4nz9TH4ncjhWvNjViCfJyyCxMHOapOVsy1yMqwh01lSwvuthcNH8OA3Q1lsSFNi
 rlaTRBZ+aIGjZ8ORMbjpDf8Spkh4CuSUoLnaqzQKwdrFmU8ZcuFOpZhzJgq7ObdRheNjy4XgFUy
 40KLNFfy4yK2s0/mRoZdWkf8JXr8V+EmiQHjpVGOF1dKucBSjtXDYxD5/OhI1m6sDywWLro2Xzg
 Oy+ENSNuWgc3kB1h1/DCXeFjq9FXqzaN6VFLvhf8Qfl4aVvk3CBO6EUIMG0YMLIwy9xG9mvsSlG
 0di71d/ehI364hBdNi2Q==
X-Google-Smtp-Source: AGHT+IGP71CEMUjpsc/3IDciYKZfK0GZHpbNylf+FCaGnaJkEUyx11YbRLHjjB19GeJPwPaS5SSF8w==
X-Received: by 2002:a17:903:41cc:b0:295:7806:1d64 with SMTP id
 d9443c01a7336-29578062796mr79445285ad.25.1762168025670; 
 Mon, 03 Nov 2025 03:07:05 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2955615d720sm84025575ad.65.2025.11.03.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 03:07:05 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>,
 Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Date: Mon,  3 Nov 2025 19:06:48 +0800
Message-ID: <20251103110648.878325-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103110648.878325-1-caojunjie650@gmail.com>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pengyu Luo <mitltlatltl@gmail.com>

Add support for Awinic AW99706 backlight, which can be found in
tablet and notebook backlight, one case is the Lenovo Legion Y700
Gen4. This driver refers to the official datasheets and android
driver, they can be found in [1].

[1] https://www.awinic.com/en/productDetail/AW99706QNR

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
Changes in v2:
- add handler for max-brightness and default-brightness
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- include default values in the aw99706_dt_props table (Daniel)
- warn when a property value from DT is invalid (Daniel)
- drop warning when optional properties are missing (Daniel)
- add a function pointer into the aw99706_dt_props table to handle lookup (Daniel)
- use a lookup function instead of hardcoding the formula for the iLED max (Daniel)
- move BL enalbe handler into aw99706_update_brightness (Daniel)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-3-caojunjie650@gmail.com

 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |   8 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/aw99706.c | 492 ++++++++++++++++++++++++++++++
 4 files changed, 507 insertions(+)
 create mode 100644 drivers/video/backlight/aw99706.c

diff --git a/MAINTAINERS b/MAINTAINERS
index be21f1fa8..551d8328e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4140,6 +4140,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
+AWINIC AW99706 WLED BACKLIGHT DRIVER
+M:	Junjie Cao <caojunjie650@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
+F:	drivers/video/backlight/aw99706.c
+
 AX.25 NETWORK LAYER
 L:	linux-hams@vger.kernel.org
 S:	Orphan
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208..35c7bfad0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -156,6 +156,14 @@ config BACKLIGHT_ATMEL_LCDC
 	  If in doubt, it's safe to enable this option; it doesn't kick
 	  in unless the board's description says it's wired that way.
 
+config BACKLIGHT_AW99706
+	tristate "Backlight Driver for Awinic AW99706"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you have a LCD backlight connected to the WLED output of AW99706
+	  WLED output, say Y here to enable this driver.
+
 config BACKLIGHT_EP93XX
 	tristate "Cirrus EP93xx Backlight Driver"
 	depends on FB_EP93XX
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index dfbb169bf..a5d62b018 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
+obj-$(CONFIG_BACKLIGHT_AW99706)		+= aw99706.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
new file mode 100644
index 000000000..f65e35905
--- /dev/null
+++ b/drivers/video/backlight/aw99706.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * aw99706 - Backlight driver for the AWINIC AW99706
+ *
+ * Copyright (C) 2025 Junjie Cao <caojunjie650@gmail.com>
+ * Copyright (C) 2025 Pengyu Luo <mitltlatltl@gmail.com>
+ *
+ * Based on vendor driver:
+ * Copyright (c) 2023 AWINIC Technology CO., LTD
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AW99706_MAX_BRT_LVL		4095
+#define AW99706_REG_MAX			0x1F
+#define AW99706_ID			0x07
+
+/* registers list */
+#define AW99706_CFG0_REG			0x00
+#define AW99706_DIM_MODE_MASK			GENMASK(1, 0)
+
+#define AW99706_CFG1_REG			0x01
+#define AW99706_SW_FREQ_MASK			GENMASK(3, 0)
+#define AW99706_SW_ILMT_MASK			GENMASK(5, 4)
+
+#define AW99706_CFG2_REG			0x02
+#define AW99706_ILED_MAX_MASK			GENMASK(6, 0)
+#define AW99706_UVLOSEL_MASK			BIT(7)
+
+#define AW99706_CFG3_REG			0x03
+#define AW99706_CFG4_REG			0x04
+#define AW99706_BRT_MSB_MASK			GENMASK(3, 0)
+
+#define AW99706_CFG5_REG			0x05
+#define AW99706_BRT_LSB_MASK			GENMASK(7, 0)
+
+#define AW99706_CFG6_REG			0x06
+#define AW99706_RAMP_CTL_MASK			GENMASK(7, 6)
+
+#define AW99706_CFG7_REG			0x07
+#define AW99706_CFG8_REG			0x08
+#define AW99706_CFG9_REG			0x09
+#define AW99706_CFGA_REG			0x0A
+#define AW99706_CFGB_REG			0x0B
+#define AW99706_CFGC_REG			0x0C
+#define AW99706_CFGD_REG			0x0D
+#define AW99706_FLAG_REG			0x10
+#define AW99706_BACKLIGHT_EN_MASK		BIT(7)
+
+#define AW99706_CHIPID_REG			0x11
+#define AW99706_LED_OPEN_FLAG_REG		0x12
+#define AW99706_LED_SHORT_FLAG_REG		0x13
+#define AW99706_MTPLDOSEL_REG			0x1E
+#define AW99706_MTPRUN_REG			0x1F
+
+#define RESV	0
+
+/* Boost switching frequency table, in Hz */
+static const u32 aw99706_sw_freq_tbl[] = {
+	RESV, RESV, RESV, RESV, 300000, 400000, 500000, 600000,
+	660000, 750000, 850000, 1000000, 1200000, 1330000, 1500000, 1700000
+};
+
+/* Switching current limitation table, in uA */
+static const u32 aw99706_sw_ilmt_tbl[] = {
+	1500000, 2000000, 2500000, 3000000
+};
+
+/* ULVO threshold table, in uV */
+static const u32 aw99706_ulvo_thres_tbl[] = {
+	2200000, 5000000
+};
+
+struct reg_init_data;
+
+struct aw99706_device {
+	struct i2c_client *client;
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl_dev;
+	struct gpio_desc *hwen_gpio;
+	struct reg_init_data *init_tbl;
+	int init_tbl_size;
+	bool bl_enable;
+};
+
+enum reg_access {
+	REG_NONE_ACCESS	= 0,
+	REG_RD_ACCESS	= 1,
+	REG_WR_ACCESS	= 2,
+};
+
+const u8 aw99706_regs[AW99706_REG_MAX + 1] = {
+	[AW99706_CFG0_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG1_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG2_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG3_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG4_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG5_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG6_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG7_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG8_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG9_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGA_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGB_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGC_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGD_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_FLAG_REG]		= REG_RD_ACCESS,
+	[AW99706_CHIPID_REG]		= REG_RD_ACCESS,
+	[AW99706_LED_OPEN_FLAG_REG]	= REG_RD_ACCESS,
+	[AW99706_LED_SHORT_FLAG_REG]	= REG_RD_ACCESS,
+
+	/*
+	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
+	 * Multi-time Programmable (MTP).
+	 */
+	[AW99706_MTPLDOSEL_REG]		= REG_RD_ACCESS,
+	[AW99706_MTPRUN_REG]		= REG_NONE_ACCESS,
+};
+
+static bool aw99706_readable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg] & REG_RD_ACCESS;
+}
+
+static bool aw99706_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg] & REG_WR_ACCESS;
+}
+
+static inline int aw99706_i2c_read(struct aw99706_device *aw, u8 reg,
+				   unsigned int *val)
+{
+	return regmap_read(aw->regmap, reg, val);
+}
+
+static inline int aw99706_i2c_write(struct aw99706_device *aw, u8 reg, u8 val)
+{
+	return regmap_write(aw->regmap, reg, val);
+}
+
+static inline int aw99706_i2c_update_bits(struct aw99706_device *aw, u8 reg,
+					  u8 mask, u8 val)
+{
+	return regmap_update_bits(aw->regmap, reg, mask, val);
+}
+
+struct aw99706_dt_prop {
+	const char * const name;
+	int (*lookup)(const struct aw99706_dt_prop *prop, u32 dt_val, u8 *val);
+	const u32 * const lookup_tbl;
+	u8 tbl_size;
+	u8 reg;
+	u8 mask;
+	u8 shift;
+	u32 def_val;
+};
+
+static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
+				      u32 dt_val, u8 *val)
+{
+	int i;
+
+	if (!prop->lookup_tbl) {
+		*val = dt_val;
+		return 0;
+	}
+
+	for (i = 0; i < prop->tbl_size; i++)
+		if (prop->lookup_tbl[i] == dt_val)
+			break;
+
+	*val = i;
+
+	return i == prop->tbl_size ? -1 : 0;
+}
+
+#define MIN_ILED_MAX	5000
+#define MAX_ILED_MAX	50000
+#define STEP_ILED_MAX	500
+
+static int
+aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *prop,
+				     u32 dt_val, u8 *val)
+{
+	if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
+		return -1;
+
+	*val = (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
+
+	return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
+}
+
+static const struct aw99706_dt_prop aw99706_dt_props[] = {
+	{
+		"awinic,dim-mode", aw99706_dt_property_lookup,
+		NULL, 0,
+		AW99706_CFG0_REG,
+		AW99706_DIM_MODE_MASK, __builtin_ctz(AW99706_DIM_MODE_MASK),
+		1,
+	},
+	{
+		"awinic,sw-freq", aw99706_dt_property_lookup,
+		aw99706_sw_freq_tbl, ARRAY_SIZE(aw99706_sw_freq_tbl),
+		AW99706_CFG1_REG,
+		AW99706_SW_FREQ_MASK, __builtin_ctz(AW99706_SW_FREQ_MASK),
+		750000,
+	},
+	{
+		"awinic,sw-ilmt", aw99706_dt_property_lookup,
+		aw99706_sw_ilmt_tbl, ARRAY_SIZE(aw99706_sw_ilmt_tbl),
+		AW99706_CFG1_REG,
+		AW99706_SW_ILMT_MASK, __builtin_ctz(AW99706_SW_ILMT_MASK),
+		3000000,
+	},
+	{
+		"awinic,iled-max", aw99706_dt_property_iled_max_convert,
+		NULL, 0,
+		AW99706_CFG2_REG,
+		AW99706_ILED_MAX_MASK, __builtin_ctz(AW99706_ILED_MAX_MASK),
+		20000,
+
+	},
+	{
+		"awinic,uvlo-thres", aw99706_dt_property_lookup,
+		aw99706_ulvo_thres_tbl, ARRAY_SIZE(aw99706_ulvo_thres_tbl),
+		AW99706_CFG2_REG,
+		AW99706_UVLOSEL_MASK, __builtin_ctz(AW99706_UVLOSEL_MASK),
+		2200000,
+	},
+	{
+		"awinic,ramp-ctl", aw99706_dt_property_lookup,
+		NULL, 0,
+		AW99706_CFG6_REG,
+		AW99706_RAMP_CTL_MASK, __builtin_ctz(AW99706_RAMP_CTL_MASK),
+		2,
+	},
+};
+
+struct reg_init_data {
+	u8 reg;
+	u8 mask;
+	u8 val;
+};
+
+static struct reg_init_data reg_init_tbl[ARRAY_SIZE(aw99706_dt_props)];
+
+static void aw99706_dt_parse(struct aw99706_device *aw,
+			     struct backlight_properties *bl_props)
+{
+	const struct aw99706_dt_prop *prop;
+	u32 dt_val;
+	int ret, i;
+	u8 val;
+
+	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
+		prop = &aw99706_dt_props[i];
+		ret = device_property_read_u32(aw->dev, prop->name, &dt_val);
+		if (ret < 0)
+			dt_val = prop->def_val;
+
+		if (prop->lookup(prop, dt_val, &val)) {
+			dev_warn(aw->dev, "invalid value %d for property %s, using default value %d\n",
+				 dt_val, prop->name, prop->def_val);
+
+			prop->lookup(prop, prop->def_val, &val);
+		}
+
+		reg_init_tbl[i].reg = prop->reg;
+		reg_init_tbl[i].mask = prop->mask;
+		reg_init_tbl[i].val = val << prop->shift;
+	}
+
+	aw->init_tbl = reg_init_tbl;
+	aw->init_tbl_size = ARRAY_SIZE(reg_init_tbl);
+
+	bl_props->brightness = AW99706_MAX_BRT_LVL >> 1;
+	bl_props->max_brightness = AW99706_MAX_BRT_LVL;
+	device_property_read_u32(aw->dev, "default-brightness",
+				 &bl_props->brightness);
+	device_property_read_u32(aw->dev, "max-brightness",
+				 &bl_props->max_brightness);
+
+	if (bl_props->max_brightness > AW99706_MAX_BRT_LVL)
+		bl_props->max_brightness = AW99706_MAX_BRT_LVL;
+
+	if (bl_props->brightness > bl_props->max_brightness)
+		bl_props->brightness = bl_props->max_brightness;
+}
+
+static int aw99706_hw_init(struct aw99706_device *aw)
+{
+	int ret, i;
+
+	gpiod_set_value_cansleep(aw->hwen_gpio, 1);
+
+	for (i = 0; i < aw->init_tbl_size; i++) {
+		ret = aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
+					      aw->init_tbl[i].mask,
+					      aw->init_tbl[i].val);
+		if (ret < 0) {
+			dev_err(aw->dev, "Failed to write init data %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
+{
+	int ret;
+	u8 val;
+
+	FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
+	ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
+				      AW99706_BACKLIGHT_EN_MASK, val);
+	if (ret)
+		dev_err(aw->dev, "Failed to enable backlight!\n");
+
+	return ret;
+}
+
+static int aw99706_update_brightness(struct aw99706_device *aw, u32 brt_lvl)
+{
+	bool bl_enable_now = !!brt_lvl;
+	int ret;
+
+	ret = aw99706_i2c_write(aw, AW99706_CFG4_REG,
+				(brt_lvl >> 8) & AW99706_BRT_MSB_MASK);
+	if (ret < 0)
+		return ret;
+
+	ret = aw99706_i2c_write(aw, AW99706_CFG5_REG,
+				brt_lvl & AW99706_BRT_LSB_MASK);
+	if (ret < 0)
+		return ret;
+
+	if (aw->bl_enable != bl_enable_now) {
+		ret = aw99706_bl_enable(aw, bl_enable_now);
+		if (!ret)
+			aw->bl_enable = bl_enable_now;
+	}
+
+	return ret;
+}
+
+static int aw99706_bl_update_status(struct backlight_device *bl)
+{
+	struct aw99706_device *aw = bl_get_data(bl);
+
+	return aw99706_update_brightness(aw, bl->props.brightness);
+}
+
+static const struct backlight_ops aw99706_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = aw99706_bl_update_status,
+};
+
+static const struct regmap_config aw99706_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW99706_REG_MAX,
+	.writeable_reg = aw99706_writeable_reg,
+	.readable_reg = aw99706_readable_reg,
+};
+
+static int aw99706_chip_id_read(struct aw99706_device *aw)
+{
+	int ret;
+	unsigned int val;
+
+	ret = aw99706_i2c_read(aw, AW99706_CHIPID_REG, &val);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
+
+static int aw99706_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct aw99706_device *aw;
+	struct backlight_device *bl_dev;
+	struct backlight_properties props = {};
+	int ret = 0;
+
+	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
+	if (!aw)
+		return -ENOMEM;
+
+	aw->client = client;
+	aw->dev = dev;
+	i2c_set_clientdata(client, aw);
+
+	aw->regmap = devm_regmap_init_i2c(client, &aw99706_regmap_config);
+	if (IS_ERR(aw->regmap))
+		return dev_err_probe(dev, PTR_ERR(aw->regmap),
+				     "Failed to init regmap\n");
+
+	ret = aw99706_chip_id_read(aw);
+	if (ret != AW99706_ID)
+		return dev_err_probe(dev, ret,
+				     "Failed to validate chip id\n");
+
+	aw99706_dt_parse(aw, &props);
+
+	aw->hwen_gpio = devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(aw->hwen_gpio))
+		return dev_err_probe(dev, PTR_ERR(aw->hwen_gpio),
+				     "Failed to get enable gpio\n");
+
+	ret = aw99706_hw_init(aw);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize the chip\n");
+
+	props.type = BACKLIGHT_RAW;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	bl_dev = devm_backlight_device_register(dev, "aw99706-backlight", dev,
+						aw, &aw99706_bl_ops, &props);
+	if (IS_ERR(bl_dev))
+		return dev_err_probe(dev, PTR_ERR(bl_dev),
+				     "Failed to register backlight!\n");
+
+	aw->bl_dev = bl_dev;
+
+	return 0;
+}
+
+static void aw99706_remove(struct i2c_client *client)
+{
+	struct aw99706_device *aw = i2c_get_clientdata(client);
+
+	aw99706_update_brightness(aw, 0);
+
+	msleep(50);
+
+	gpiod_set_value_cansleep(aw->hwen_gpio, 0);
+}
+
+static int aw99706_suspend(struct device *dev)
+{
+	struct aw99706_device *aw = dev_get_drvdata(dev);
+
+	return aw99706_update_brightness(aw, 0);
+}
+
+static int aw99706_resume(struct device *dev)
+{
+	struct aw99706_device *aw = dev_get_drvdata(dev);
+
+	return aw99706_hw_init(aw);
+}
+
+static SIMPLE_DEV_PM_OPS(aw99706_pm_ops, aw99706_suspend, aw99706_resume);
+
+static const struct i2c_device_id aw99706_ids[] = {
+	{ "aw99706" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aw99706_ids);
+
+static const struct of_device_id aw99706_match_table[] = {
+	{ .compatible = "awinic,aw99706", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw99706_match_table);
+
+static struct i2c_driver aw99706_i2c_driver = {
+	.probe = aw99706_probe,
+	.remove = aw99706_remove,
+	.id_table = aw99706_ids,
+	.driver = {
+		.name = "aw99706",
+		.of_match_table = aw99706_match_table,
+		.pm = &aw99706_pm_ops,
+	},
+};
+
+module_i2c_driver(aw99706_i2c_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("BackLight driver for aw99706");
-- 
2.51.1.dirty

