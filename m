Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866878D39D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423910E4C0;
	Wed, 30 Aug 2023 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2057.outbound.protection.outlook.com [40.107.15.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E592810E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuWnX5JsvcP4pcentaLEIEk2Tp2iBBfKjBcwraPerEFV2XJvFrcpZ7SeqrIp+ixiKH2yHz/dCkrXFY5SyF1hJvCkbA6XVlNWYd1SKJND6MhUp0TtKuPI2zxVy8cb8ikMIINkql4clDHci7NoIOH2Ii99W/WMW2vNI5sLDNgdM7DHg9XR5pEERykNPowLX+jWcqD31oMcsPklopSrHpR3DcD7+J+vM2DeR8hWHypZn/o0rm8b/f20pC0v2ggMoEYs3L2tQ6DQSCAC+O5jwndcj27Qvbe/kpBzksiyS9wBj2cgO2jsrvnY6ec9G2NF/Caa89MHpxP6Sor+Pd02ba0CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jowxy2H2aM9i200872Kai+noRF0wrNybYOJB4/kJ/8=;
 b=FHMSJb2LLWS2PU2Vmq7ktKjX3hT0qBgwU0dBnBGMDuxuWIxlFlCZ6j2V0bKCefsDGbq/vCk89+JkLszpAloweBeA5xv7/mR6XQnu/elYS1DzhvT02P/M9t92QyVmK/2lVeQJzRFN97u7dunl0E/USHBEAXrAoynGFhFgjuREPN0GA6gfuzUNP9TYBc8c19p2ptSpBnDQZ5Mq4EfFUlUlkBeb3gOJyagc2eZ3grhH+NcDBTrvjVzmjwhPlSXqG6hdwKEfLfH47qazi1hKNHDtdA4ftuJtE0X+VNx81T1XYyERjPcyzBUnDBihcjxEwKXYnO6CcXJ9d/k9vinCm+ssGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jowxy2H2aM9i200872Kai+noRF0wrNybYOJB4/kJ/8=;
 b=cewHLpi464BFhhgygunVlfa16FOh3XqNxScFn48kmvDAnicynX61yfhM8ZF1fAZs8nAldj9qBL4unH0LD7XVmAgfpo84D/kSsFDX4FHoFJ12AQ8iyqI1Y3CBDejA4zt1EU/SymSeXggfiXbRFsACTJ6fPyQATcottg847R6lGqE=
Received: from AS4P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::9)
 by DB8PR01MB6440.eurprd01.prod.exchangelabs.com (2603:10a6:10:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 10:16:02 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:5db:cafe::fa) by AS4P189CA0020.outlook.office365.com
 (2603:10a6:20b:5db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Tue, 29 Aug 2023 10:16:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 10:16:02 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Tue, 29 Aug 2023 12:16:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 2/2] backlight: mp3309c: Add support for MPS MP3309C
Date: Tue, 29 Aug 2023 12:15:46 +0200
Message-Id: <20230829101546.483189-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829101546.483189-1-f.suligoi@asem.it>
References: <20230829101546.483189-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Aug 2023 10:16:01.0729 (UTC)
 FILETIME=[CFCF4310:01D9DA61]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|DB8PR01MB6440:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 514710ec-2452-49ac-6b3b-08dba878f2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgLzoj4AXWdDHavWunCEA0c7HB57nN7aLRGhSNw3cAbii8dVimSbYUOuFODYaN/RDx/SI2QyAITEbI5JP3vbNGvrPu3VJ+fslxzU2a2FPY1h3/QRURq97Cc6g+rBw2j2Vxn5xXk8WQ+vyqy5v8zzJYHrrfuYQmmtAItUO8CzYqw2dTbiBreZINFnHaoWFaNM67nDkRzl4I7T9q6e+XfGWP/VMxYkWrVr3AuzWNqOwgarbgFkuULhzqVKvFO4BdVDFPu+o8JtdweDnAjTPy5e6DRGDvL7vsCGYzGLesdoW6hsFmbyv8T5FIEigAHjLH5DmV+k4KCTHqG6LLHbKnTXDAHW7TwT9m7/Vmk8j6cjZiMdyHAQoJRI6o0PnyTEPFkrYWyrHnu+iUKBCgY60Fl224Z7E12QSSxLuBUZ7L+YJXY12fUNWBjWe6+94wv9NmKI4fzPiTUeCrsW+zYfHZQPPNDawIO5hEVeeFu1KZuCwuXTAwEmjhjjUFAco0UWLxeQtDdy6XskHh9NJYF6imrcTYxgNNA7wXEvK3Ym9yM3H+RJ4AnfgBLQxW5YDgfskFrlf3ATkxKxI/63WTxh6VkgdGzikD0ORVsgvwZr5oFK6O5ptmv/wFxEkYGF7a97U5firN1r/cEeHNRAFC7kc7R08gvdG7RrWbEdFhSF74Xc5Jvmc/Z1yaoAv5TKhd/hs14DahDT6MM7a3uIQLR8GUB0omy8PeJ/B6W4Cxf5V9ss+aA=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(346002)(39850400004)(376002)(396003)(136003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(6666004)(83380400001)(966005)(2616005)(107886003)(1076003)(478600001)(336012)(26005)(2906002)(30864003)(316002)(41300700001)(110136005)(70206006)(70586007)(8936002)(5660300002)(4326008)(8676002)(36756003)(40480700001)(47076005)(36860700001)(86362001)(81166007)(82740400003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 10:16:02.2301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 514710ec-2452-49ac-6b3b-08dba878f2a3
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6440
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:32:27 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
programmable switching frequency to optimize efficiency.
The brightness can be controlled either by I2C commands (called "analog"
mode) or by a PWM input signal (PWM mode).
This driver supports both modes.

For DT configuration details, please refer to:
- Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

The datasheet is available at:
- https://www.monolithicpower.com/en/mp3309c.html

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 MAINTAINERS                          |   6 +
 drivers/video/backlight/Kconfig      |  13 +
 drivers/video/backlight/Makefile     |   1 +
 drivers/video/backlight/mp3309c_bl.c | 491 +++++++++++++++++++++++++++
 4 files changed, 511 insertions(+)
 create mode 100644 drivers/video/backlight/mp3309c_bl.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..895c56ff4f1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14333,6 +14333,12 @@ S:	Maintained
 F:	Documentation/driver-api/tty/moxa-smartio.rst
 F:	drivers/tty/mxser.*
 
+MP3309C BACKLIGHT DRIVER
+M:	Flavio Suligoi <f.suligoi@asem.it>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
+F:	drivers/video/backlight/mp3309c_bl.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..65d0ac9f611d 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -389,6 +389,19 @@ config BACKLIGHT_LM3639
 	help
 	  This supports TI LM3639 Backlight + 1.5A Flash LED Driver
 
+config BACKLIGHT_MP3309C
+	tristate "Backlight Driver for MPS MP3309C"
+	depends on I2C
+	select REGMAP_I2C
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  This supports MPS MP3309C backlight WLED Driver in both PWM and
+	  analog/I2C dimming modes.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called mp3309c_bl.
+
 config BACKLIGHT_LP855X
 	tristate "Backlight driver for TI LP855X"
 	depends on I2C && PWM
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..c42c5bccc5ac 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c_bl.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
diff --git a/drivers/video/backlight/mp3309c_bl.c b/drivers/video/backlight/mp3309c_bl.c
new file mode 100644
index 000000000000..7cb7a542ceca
--- /dev/null
+++ b/drivers/video/backlight/mp3309c_bl.c
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for MPS MP3309C White LED driver with I2C interface
+ *
+ * Copyright (C) 2023 ASEM Srl
+ * Author: Flavio Suligoi <f.suligoi@asem.it>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/workqueue.h>
+
+#define REG_I2C_0	0x00
+#define REG_I2C_1	0x01
+
+#define REG_I2C_0_EN	0x80
+#define REG_I2C_0_D0	0x40
+#define REG_I2C_0_D1	0x20
+#define REG_I2C_0_D2	0x10
+#define REG_I2C_0_D3	0x08
+#define REG_I2C_0_D4	0x04
+#define REG_I2C_0_RSRV1	0x02
+#define REG_I2C_0_RSRV2	0x01
+
+#define REG_I2C_1_RSRV1	0x80
+#define REG_I2C_1_DIMS	0x40
+#define REG_I2C_1_SYNC	0x20
+#define REG_I2C_1_OVP0	0x10
+#define REG_I2C_1_OVP1	0x08
+#define REG_I2C_1_VOS	0x04
+#define REG_I2C_1_LEDO	0x02
+#define REG_I2C_1_OTP	0x01
+
+#define ANALOG_MAX_VAL	31
+#define ANALOG_REG_MASK 0x7c
+
+enum backlight_status {
+	FIRST_POWER_ON,
+	BACKLIGHT_OFF,
+	BACKLIGHT_ON,
+};
+
+enum dimming_mode_value {
+	DIMMING_PWM,
+	DIMMING_ANALOG_I2C,
+};
+
+struct mp3309c_platform_data {
+	u32 max_brightness;
+	u32 brightness;
+	u32 switch_on_delay_ms;
+	u32 switch_off_delay_ms;
+	u32 reset_on_delay_ms;
+	u32 reset_on_length_ms;
+	u8  dimming_mode;
+	u8  reset_pulse_enable;
+	u8  over_voltage_protection;
+
+	unsigned int status;
+};
+
+struct mp3309c_chip {
+	struct device *dev;
+	struct mp3309c_platform_data *pdata;
+	struct backlight_device *bl;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	struct pwm_device *pwmd;
+
+	struct delayed_work enable_work;
+	struct delayed_work reset_gpio_work;
+	int irq;
+
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regmap_config mp3309c_regmap = {
+	.name = "mp3309c_regmap",
+	.reg_bits = 8,
+	.reg_stride = 1,
+	.val_bits = 8,
+	.max_register = REG_I2C_1,
+};
+
+static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
+				 struct mp3309c_platform_data *pdata)
+{
+	struct device_node *node = chip->dev->of_node;
+	const char *tmp_string;
+	int ret;
+
+	if (!node) {
+		dev_err(chip->dev, "failed to get DT node\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Dimming mode: the MP3309C provides two dimming methods:
+	 *
+	 * - PWM mode
+	 * - Analog by I2C control mode
+	 */
+	ret = of_property_read_string(node, "mps,dimming-mode", &tmp_string);
+	if (ret < 0) {
+		dev_err(chip->dev, "missed dimming-mode in DT\n");
+		return ret;
+	}
+	if (!strcmp(tmp_string, "pwm")) {
+		dev_info(chip->dev, "dimming method: PWM\n");
+		pdata->dimming_mode = DIMMING_PWM;
+	}
+	if (!strcmp(tmp_string, "analog-i2c")) {
+		dev_info(chip->dev, "dimming method: analog by I2C commands\n");
+		pdata->dimming_mode = DIMMING_ANALOG_I2C;
+	}
+
+	/* PWM steps (levels): 0 .. max_brightness */
+	ret = of_property_read_u32(node, "max-brightness",
+				   &pdata->max_brightness);
+	if (ret < 0) {
+		dev_err(chip->dev, "failed to get max-brightness from DT\n");
+		return ret;
+	}
+
+	/* Default brightness at startup */
+	ret = of_property_read_u32(node, "default-brightness",
+				   &pdata->brightness);
+	if (ret < 0) {
+		dev_err(chip->dev,
+			"failed to get default-brightness from DT\n");
+		return ret;
+	}
+
+	/*
+	 * Optional backlight switch-on/off delay
+	 *
+	 * Note: set 10ms as minimal value for switch-on delay, to stabilize
+	 *       video data
+	 */
+	pdata->switch_on_delay_ms = 50;
+	of_property_read_u32(node, "mps,switch-on-delay-ms",
+			     &pdata->switch_on_delay_ms);
+	if (pdata->switch_on_delay_ms < 10) {
+		pdata->switch_on_delay_ms = 10;
+		dev_warn(chip->dev,
+			 "switch-on-delay-ms set to 10ms as minimal value\n");
+	}
+	pdata->switch_off_delay_ms = 0;
+	of_property_read_u32(node, "mps,switch-off-delay-ms",
+			     &pdata->switch_off_delay_ms);
+
+	/*
+	 * Reset: GPIO, initial delay and pulse length
+	 *
+	 * Use this optional GPIO to reset an external device (LCD panel, video
+	 * FPGA, etc) when the backlight is switched on
+	 */
+	pdata->reset_pulse_enable = 0;
+	chip->reset_gpio = devm_gpiod_get_optional(chip->dev, "mps,reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(chip->reset_gpio)) {
+		ret = PTR_ERR(chip->reset_gpio);
+		dev_err(chip->dev, "error acquiring reset gpio: %d\n", ret);
+		return ret;
+	}
+	if (chip->reset_gpio) {
+		pdata->reset_pulse_enable = 1;
+
+		pdata->reset_on_delay_ms = 10;
+		of_property_read_u32(node, "mps,reset-on-delay-ms",
+				     &pdata->reset_on_delay_ms);
+		pdata->reset_on_length_ms = 10;
+		of_property_read_u32(node, "mps,reset-on-length-ms",
+				     &pdata->reset_on_length_ms);
+	}
+
+	/*
+	 * Over-voltage protection (OVP)
+	 *
+	 * These (optional) properties are:
+	 *
+	 *  - overvoltage-protection-13v --> OVP point set to 13.5V
+	 *  - overvoltage-protection-24v --> OVP point set to 24V
+	 *  - overvoltage-protection-35v --> OVP point set to 35.5V
+	 *
+	 * If not chosen, the hw default value for OVP is 35.5V
+	 */
+	pdata->over_voltage_protection = REG_I2C_1_OVP1;
+	if (of_property_read_bool(node, "mps,overvoltage-protection-13v"))
+		pdata->over_voltage_protection = 0x00;
+	if (of_property_read_bool(node, "mps,overvoltage-protection-24v"))
+		pdata->over_voltage_protection = REG_I2C_1_OVP0;
+	if (of_property_read_bool(node, "mps,overvoltage-protection-35v"))
+		pdata->over_voltage_protection = REG_I2C_1_OVP1;
+
+	return 0;
+}
+
+static int mp3309c_enable_device(struct mp3309c_chip *chip)
+{
+	u8 reg_val = 0; /* Configuration for analog by I2C commands */
+	int ret;
+
+	/* I2C register #0 - Device enable */
+	ret = regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
+				 REG_I2C_0_EN);
+	if (ret)
+		return ret;
+
+	/*
+	 * I2C register #1 - Set working mode:
+	 *  - set one of the two dimming mode:
+	 *    - PWM dimming using an external PWM dimming signal
+	 *    - analog dimming using I2C commands
+	 *  - enable synchronous mode (fixed for now)
+	 *  - set overvoltage protection (OVP)
+	 */
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		reg_val = REG_I2C_1_DIMS;
+	ret = regmap_write(chip->regmap, REG_I2C_1, reg_val | REG_I2C_1_SYNC |
+			   chip->pdata->over_voltage_protection);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/* For delayed backlight enabled */
+static void mp3309c_enable(struct work_struct *work)
+{
+	struct mp3309c_chip *chip = container_of(work, struct mp3309c_chip,
+						 enable_work.work);
+	if (mp3309c_enable_device(chip))
+		dev_err(chip->dev, "failed writing I2C register\n");
+}
+
+static void mp3309c_reset_gpio(struct work_struct *work)
+{
+	struct mp3309c_chip *chip = container_of(work, struct mp3309c_chip,
+						 reset_gpio_work.work);
+
+	if (chip->reset_gpio) {
+		gpiod_set_value_cansleep(chip->reset_gpio, 0);
+		usleep_range(100, 150);
+		gpiod_set_value_cansleep(chip->reset_gpio, 1);
+		usleep_range(chip->pdata->reset_on_length_ms * 1000,
+			     (chip->pdata->reset_on_length_ms * 1000) + 100);
+		gpiod_set_value_cansleep(chip->reset_gpio, 0);
+	}
+}
+
+static int mp3309c_bl_update_status(struct backlight_device *bl)
+{
+	struct mp3309c_chip *chip = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	struct pwm_state pwmstate;
+	unsigned int analog_val, bits_val;
+	int i, ret;
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		/*
+		 * PWM dimming mode
+		 */
+		pwm_init_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate, brightness,
+					    chip->pdata->max_brightness);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return ret;
+	} else {
+		/*
+		 * Analog dimming mode by I2C commands
+		 *
+		 * The 5 bits of the dimming analog value D4..D0 is allocated
+		 * in the I2C register #0, in the following way:
+		 *
+		 *     +--+--+--+--+--+--+--+--+
+		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
+		 *     +--+--+--+--+--+--+--+--+
+		 */
+		analog_val = DIV_ROUND_UP(ANALOG_MAX_VAL * brightness,
+					  chip->pdata->max_brightness);
+		bits_val = 0;
+		for (i = 0; i <= 5; i++)
+			bits_val += ((analog_val >> i) & 0x01) << (6 - i);
+		ret = regmap_update_bits(chip->regmap, REG_I2C_0,
+					 ANALOG_REG_MASK, bits_val);
+		if (ret)
+			return ret;
+	}
+
+	if (brightness > 0) {
+		switch (chip->pdata->status) {
+		case FIRST_POWER_ON:
+			/*
+			 * Only for the first time, wait for the optional
+			 * switch-on delay and then enable the device.
+			 * Otherwise enable the backlight immediately.
+			 */
+			schedule_delayed_work(&chip->enable_work,
+					      msecs_to_jiffies(chip->pdata->switch_on_delay_ms));
+			/*
+			 * Optional external device GPIO reset, with
+			 * delay pulse length
+			 */
+			if (chip->pdata->reset_pulse_enable)
+				schedule_delayed_work(&chip->reset_gpio_work,
+						      msecs_to_jiffies(chip->pdata->reset_on_delay_ms));
+			break;
+		case BACKLIGHT_OFF:
+			/* Enable the backlight immediately */
+			if (chip->pdata->reset_pulse_enable)
+				cancel_delayed_work(&chip->reset_gpio_work);
+			mp3309c_enable_device(chip);
+			break;
+		}
+
+		chip->pdata->status = BACKLIGHT_ON;
+	} else {
+		/* Wait for the optional switch-off delay */
+		if (chip->pdata->switch_off_delay_ms > 0) {
+			usleep_range(chip->pdata->switch_off_delay_ms * 1000,
+				     (chip->pdata->switch_off_delay_ms + 1) *
+				      1000);
+		}
+
+		chip->pdata->status = BACKLIGHT_OFF;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops mp3309c_bl_ops = {
+	.update_status = mp3309c_bl_update_status,
+};
+
+static int mp3309c_probe(struct i2c_client *client)
+{
+	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct mp3309c_chip *chip;
+	struct backlight_properties props;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "failed to check i2c functionality\n");
+		return -EOPNOTSUPP;
+	}
+
+	chip = devm_kzalloc(&client->dev, sizeof(struct mp3309c_chip),
+			    GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	chip->dev = &client->dev;
+
+	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		dev_err(&client->dev, "failed to allocate register map\n");
+		return ret;
+	}
+
+	i2c_set_clientdata(client, chip);
+
+	if (!pdata) {
+		pdata = devm_kzalloc(chip->dev,
+				     sizeof(struct mp3309c_platform_data),
+				     GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		ret = pm3309c_parse_dt_node(chip, pdata);
+		if (ret) {
+			dev_err(&client->dev, "failed parsing DT node\n");
+			return ret;
+		}
+	}
+	chip->pdata = pdata;
+
+	chip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(chip->enable_gpio)) {
+		ret = PTR_ERR(chip->enable_gpio);
+		return ret;
+	}
+
+	/* Backlight */
+	props.type = BACKLIGHT_RAW;
+	props.brightness = pdata->brightness;
+	props.max_brightness = pdata->max_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+	chip->bl =
+	    devm_backlight_device_register(chip->dev, "mp3309c_bl",
+					   chip->dev, chip, &mp3309c_bl_ops,
+					   &props);
+	if (IS_ERR(chip->bl)) {
+		dev_err(&client->dev, "failed registering backlight\n");
+		return PTR_ERR(chip->bl);
+	}
+	pdata->status = FIRST_POWER_ON;
+
+	/* Enable PWM, if required */
+	if (pdata->dimming_mode == DIMMING_PWM) {
+		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		if (IS_ERR(chip->pwmd)) {
+			dev_err(&client->dev, "failed getting pwm device\n");
+			return PTR_ERR(chip->pwmd);
+		}
+		pwm_apply_args(chip->pwmd);
+	}
+
+	/*
+	 * Workqueue for delayed backlight enabling
+	 */
+	INIT_DELAYED_WORK(&chip->enable_work, mp3309c_enable);
+
+	/*
+	 * Workqueue for (optional) external device GPIO reset
+	 */
+	if (pdata->reset_pulse_enable) {
+		dev_info(&client->dev, "reset pulse enabled\n");
+		INIT_DELAYED_WORK(&chip->reset_gpio_work, mp3309c_reset_gpio);
+	}
+
+	dev_info(&client->dev, "MP3309C backlight initialized");
+	return 0;
+}
+
+static int mp3309c_backlight_switch_off(struct pwm_device *pwmd)
+{
+	struct pwm_state pwmstate;
+
+	/* Switch-off the backlight */
+	pwm_get_state(pwmd, &pwmstate);
+	pwmstate.duty_cycle = 0;
+	pwmstate.enabled = false;
+	pwm_apply_state(pwmd, &pwmstate);
+
+	return 0;
+}
+
+static void mp3309c_remove(struct i2c_client *client)
+{
+	struct mp3309c_chip *chip = i2c_get_clientdata(client);
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		mp3309c_backlight_switch_off(chip->pwmd);
+	if (chip->pdata->reset_pulse_enable)
+		cancel_delayed_work(&chip->reset_gpio_work);
+}
+
+static void mp3309c_shutdown(struct i2c_client *client)
+{
+	struct mp3309c_chip *chip = i2c_get_clientdata(client);
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		mp3309c_backlight_switch_off(chip->pwmd);
+}
+
+static const struct of_device_id mp3309c_match_table[] = {
+	{ .compatible = "mps,mp3309c-backlight", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mp3309c_match_table);
+
+static const struct i2c_device_id mp3309c_id[] = {
+	{ "mp3309c", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp3309c_id);
+
+static struct i2c_driver mp3309c_i2c_driver = {
+	.driver	= {
+			.name		= "mp3309c-backlight",
+			.of_match_table	= mp3309c_match_table,
+	},
+	.probe		= mp3309c_probe,
+	.remove		= mp3309c_remove,
+	.shutdown	= mp3309c_shutdown,
+	.id_table	= mp3309c_id,
+};
+
+module_i2c_driver(mp3309c_i2c_driver);
+
+MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
+MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

