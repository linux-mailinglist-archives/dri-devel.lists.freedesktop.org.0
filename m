Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337051D76B
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924010FD42;
	Fri,  6 May 2022 12:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2109.outbound.protection.outlook.com [40.92.22.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC4610FD42
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jebzlKtcI2i8bLa4Xf4+M2iVfiZ8awAnr80uem7cJgeMGQ6/RkZ/yYgzZqqYx4fYR6AYdTbT+2x4akmIVQ7xzrC8ovcL9PSNh1rDudMauMx551zqERXyLGU6v9sM3NoClEVGXi7DxKmFacDCMjvy3llX2VSLwpaljoQdKkQE/d8Oz3GeiGlECpTXnyZfXqvKTNJ/njNRPxP41Yd1aMbr69zreatBMwLDOlqMxWugk1qpbSK9Mezgwz2PlQWu97RGTfLxgeYemKsdHDZ7GiRG/5Rr2Gu3ha8zLlkyJYFypOTQaRS3i0FWEAFc6rVDIRBD7u0YEErFOI25qbpmchu22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zxudV9RWcSUABHdpd9uGOMgXFFoVYuAsOgLHa5Yxs=;
 b=Y1tM3pohgGGGAqWzbEmlQGd8EJB5ThzoTw32HRvziHp5SnIJnWC4B4LFvh1YhgG5gABAbLx0HJeMbcVuxCYdf0in/YmO5x/V9YIInbruPVAhJ+L5IF79x7i8dKpdOjTJ3yzZo18iHgjhPeY9w3mQh22/Q1qmiotFScIGT2KrboK7W2KT2i1Yar5sMs3xP1mOacAz/AEhyc1KxMJDFZGSM+pLZ7yypo7H7n1r8Kile+MixioFfKGt1kJLKz/hiHz36vBapHOnF4jidHdy3lBiyD+demgSxHwaSPtxlBDNjIGqy4VlgvCtnceg0d91WiL9lPUBqexpgsjinnGJqmjUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB6497.namprd02.prod.outlook.com (2603:10b6:208:1c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 12:18:14 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%7]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 12:18:14 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
Date: Fri,  6 May 2022 17:47:35 +0530
Message-ID: <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651835715.git.jo@jsfamily.in>
References: <cover.1651835715.git.jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [NFJNijr3/i14f6O7HuFWQLopueFFiYMUpDvlc4KHJXwo6gA7ur8IS1zGL0MhwNm8]
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <3dd8849c9ad49b0a91ba7b8e98a96a7c1e1b8c5f.1651835715.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa6c180-f063-4ca4-bcdf-08da2f5a7e45
X-MS-TrafficTypeDiagnostic: BL0PR02MB6497:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7jDapkyEhZMbAyotUZHUkrkArEDXvM3ikWGTyTOk0z2Z8E+f9A6hFOSg6BqokqVRXEE79ZFI+jBdG6IbiegA5ream41+idfWvYXI4mbW+57gmgs4iLRxJoktGondSi5qfFf1C0WHDdjrFNQiHO3xdC3KyRJmWhjJuJCBs/yh3Pn6LwSc6ow2MwuUPIgvwGRZE5B4/syHGXyMg8fSmnYOezFZiYdX9olgExdyMMEvvgOD5LAjGQLJ499O9f93DRpOjl8xJp3+lUt+B4PLav0ZB1CDKJl9ciPpBqjZCZxvGbztn6nrZ8k9tReL07gr2L3P7O93VF+AiXQw1iNai1Vp7ZqJrBZnEa+HznqopScqxgFfyfFkRvU9iSGDT/2YByT3BhWO8iF0ZfEQPxasIhBsrgUuI4/uJG6jP8eO6nkaPMH+6vDiPRyTh8MOEsBsZH0ofVk4Y6y+DwRS9PpXBYEBJr+ieKGLE6z66BXFSOum7dgJS3kUt0N6qnjmQida7ocYrb0EfUScwszSVuzzc8iEJGEfVS93MjKcKjqJcibFa5MjKwsDrIocI78DCe1W4stmBO7pMT1dcaUtFVGpNkErvCgV0q2t4yV0tO0itank7XhSxx+XXUyWNrdqr4QcRZo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0kDA5n7VSPtO8WIt8qW+85Z9ojv75LdsfyObB//fUggEBKcv4J/lVRqxLeG?=
 =?us-ascii?Q?EJhfjIR6WmqeeEFU5v5YaJL1nmMFO2HaTqsDw16c92TPx/dcVaUL3ZII1ZhS?=
 =?us-ascii?Q?saDNiHL2I9QiAtkovqdsgluZCFqoX6EzR+2g1poXlFujvRSBuDWjUOY6slAo?=
 =?us-ascii?Q?LbVsfmFsWIqS41bfHzNTM/JbM7zPJL0/3E6mWgH3t4FHQsApvdgIHXDEtYAG?=
 =?us-ascii?Q?v8gP4I7CZpsRZYyroSDuudqFjqcI7uwKrhGUBmTMG29qxMrSthFp7AAUouuB?=
 =?us-ascii?Q?tNz5GdbmXY706i1qAsQl6V9xK+XBs8VH62yTHmDa8cxUdyjhtaBs0v5DavmL?=
 =?us-ascii?Q?3wRoHhIqYbIWnb6TcOSMFWOWApfEFT6KAWea+9qR9kcaG02vsuLxuliJR3xh?=
 =?us-ascii?Q?ZSXVsI1BmmM6rmDrN0VTh8mK7RTAWSJ47wyQw4gjhXTMCTPhWp+n6gpYVKti?=
 =?us-ascii?Q?s/WVXAGjcq0/+5R255DM5BeSMlPj0rVhFxl+FdzgK6b5k2tEJ8BkHwyQ3wD2?=
 =?us-ascii?Q?RKrSB0r7smYG+s0MIIE2QqsOhspldaKJTzwCViuA1hNHHVQelYVuq/tKcj1F?=
 =?us-ascii?Q?sG1WUZxiUoE/dn0BOE3Z6jw3jPJcwrPYlCIlLaE9NcCaSh01/0cBd7z3r7Ed?=
 =?us-ascii?Q?BlJ/woq2r8lUjkmFkVpD5Y40Jkvm3qiY/SrSesfdG2xrU/RMSSHFLx7e+SXf?=
 =?us-ascii?Q?zHRwlYKk5+F9E7fQn/Eka5PWMVRKp3RcxtqrTEzx6We9dRqw5wHJntv9oFaM?=
 =?us-ascii?Q?+VkeQ0e3p3iC5E9lKPSGmKlzutqwCOUESPw0yVJxWEMoCWh41sVFy7qxnlJR?=
 =?us-ascii?Q?GPp63p8KH2f6JiVBcWG+kffG1ChBO+4o+x3uE/efuLlOnzh8f/ACqTR6psAz?=
 =?us-ascii?Q?GYbnHdPg1IlpP8j60B1XRBEFYkscf+vZD4yhK6b/9EoVEFXw1BYRvCL9bX94?=
 =?us-ascii?Q?X0r5sVpigCDn+TihIeudsHcDyWs7NehiFjqTtkHnEm3YrL9Gc9Nr/H1D+9BZ?=
 =?us-ascii?Q?/U5EvAUOBUmwfyKlbLQJ0/8NhzTS7HfJXXJiiWwF6r976aYgAlgqmZ7q+QSE?=
 =?us-ascii?Q?HZAYr9VmYg1T+47L5LTL1h+uf6VpVO7PN1/zg8y4EcNQ5wYMmCV0zqTsE5YB?=
 =?us-ascii?Q?DcRxn7ktCfdaggvVBiBOiw7bEzPN/N4QG9smmNTOlRXWOhWbmQunvU7tBHLI?=
 =?us-ascii?Q?2qWTPQc4Qp9fekKPdM1Kb4jSQwZwFw7jRwWGgvYPPqp8tj/W1fDNHSnAvBpx?=
 =?us-ascii?Q?AUavxMtxxk4IPgr7uY3IcgiunWXWQiebGDlihexdWWGOBEjWUwnODguxAe/7?=
 =?us-ascii?Q?1WsBnuBAqgMVkBJELYTvn3yuIqM2Fu+ub7we3maEnYIFq1xR0UlZlTejSUHe?=
 =?us-ascii?Q?MNKWsuS6HInFF9YqE6A9hP+JCxW1afKwqaLuRY/KRPyjLYXv9Qj8rsVtCsSX?=
 =?us-ascii?Q?p1eUzkXZKQC/YFKlXBRlBvEoJuf3uGDnaqhDoCXIgPDgoDA+XC5HxA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa6c180-f063-4ca4-bcdf-08da2f5a7e45
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:18:14.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6497
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
panel, which can be found on some Xiaomi Poco F1 phones. The panel's
backlight is managed through QCOM WLED driver.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 MAINTAINERS                               |   7 +
 drivers/gpu/drm/panel/Kconfig             |  11 +
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 362 ++++++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cd0f68d4a34a..dfd2c53aea00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6018,6 +6018,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c
 
+DRM DRIVER FOR EBBG FT8719 PANEL
+M:	Joel Selvaraj <jo@jsfamily.in>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
+F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9989a316fe88..77176df2e2ec 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -114,6 +114,17 @@ config DRM_PANEL_EDP
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_EBBG_FT8719
+	tristate "EBBG FT8719 panel driver"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the EBBG FT8719
+	  video mode panel. Mainly found on Xiaomi Poco F1 mobile phone.
+	  The panel has a resolution of 1080x2246. It provides a MIPI DSI
+	  interface to the host.
+
 config DRM_PANEL_ELIDA_KD35T133
 	tristate "Elida KD35T133 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index d99fbbce49d1..47cc20c1a770 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
+obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
new file mode 100644
index 000000000000..abd54c4b0c23
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Joel Selvaraj <jo@jsfamily.in>
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ * Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+static const char * const regulator_names[] = {
+	"vddio",
+	"vddpos",
+	"vddneg",
+};
+
+static const unsigned long regulator_enable_loads[] = {
+	62000,
+	100000,
+	100000
+};
+
+struct ebbg_ft8719 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
+
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline
+struct ebbg_ft8719 *to_ebbg_ft8719(struct drm_panel *panel)
+{
+	return container_of(panel, struct ebbg_ft8719, panel);
+}
+
+#define dsi_generic_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static void ebbg_ft8719_reset(struct ebbg_ft8719 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(4000, 5000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(15000, 16000);
+}
+
+static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19, 0x01);
+	dsi_dcs_write_seq(dsi, 0x00, 0x80);
+	dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);
+	dsi_dcs_write_seq(dsi, 0x00, 0xa0);
+	dsi_generic_write_seq(dsi, 0xca, 0x0f, 0x0f, 0x0f);
+	dsi_dcs_write_seq(dsi, 0x00, 0x80);
+	dsi_generic_write_seq(dsi, 0xca,
+			      0xbe, 0xb5, 0xad, 0xa6, 0xa0, 0x9b, 0x96, 0x91,
+			      0x8d, 0x8a, 0x87, 0x83);
+	dsi_dcs_write_seq(dsi, 0x00, 0x90);
+	dsi_generic_write_seq(dsi, 0xca,
+			      0xfe, 0xff, 0x66, 0xf6, 0xff, 0x66, 0xfb, 0xff,
+			      0x32);
+	dsi_dcs_write_seq(dsi, 0x00, 0xa0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7a, 0x79, 0x74, 0x8c, 0x8c, 0x92, 0x97, 0x9b,
+			      0x97, 0x8f, 0x80, 0x77);
+	dsi_dcs_write_seq(dsi, 0x00, 0xb0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7e, 0x7d, 0x81, 0x7a, 0x7a, 0x7b, 0x7c, 0x81,
+			      0x84, 0x85, 0x80, 0x82);
+	dsi_dcs_write_seq(dsi, 0x00, 0xc0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7d, 0x7d, 0x78, 0x8a, 0x89, 0x8f, 0x97, 0x97,
+			      0x8f, 0x8c, 0x80, 0x7a);
+	dsi_dcs_write_seq(dsi, 0x00, 0xd0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7e, 0x7d, 0x81, 0x7c, 0x79, 0x7b, 0x7c, 0x80,
+			      0x84, 0x85, 0x80, 0x82);
+	dsi_dcs_write_seq(dsi, 0x00, 0xe0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7b, 0x7b, 0x7b, 0x80, 0x80, 0x80, 0x80, 0x80,
+			      0x80, 0x80, 0x80, 0x80);
+	dsi_dcs_write_seq(dsi, 0x00, 0xf0);
+	dsi_generic_write_seq(dsi, 0xd6,
+			      0x7e, 0x7e, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+			      0x80, 0x80, 0x80, 0x80);
+	dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	dsi_generic_write_seq(dsi, 0xd7,
+			      0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+			      0x80, 0x80, 0x80, 0x80);
+	dsi_dcs_write_seq(dsi, 0x00, 0x10);
+	dsi_generic_write_seq(dsi, 0xd7,
+			      0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+			      0x80, 0x80, 0x80, 0x80);
+	dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	dsi_generic_write_seq(dsi, 0xff, 0x00, 0x00, 0x00);
+	dsi_dcs_write_seq(dsi, 0x00, 0x80);
+	dsi_generic_write_seq(dsi, 0xff, 0x00, 0x00);
+	dsi_dcs_write_seq(dsi, 0x91, 0x00);
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display brightness: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(90);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(90);
+
+	return 0;
+}
+
+static int ebbg_ft8719_prepare(struct drm_panel *panel)
+{
+	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ebbg_ft8719_reset(ctx);
+
+	ret = ebbg_ft8719_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int ebbg_ft8719_unprepare(struct drm_panel *panel)
+{
+	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = ebbg_ft8719_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		dev_err(panel->dev, "Failed to disable regulators: %d\n", ret);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode ebbg_ft8719_mode = {
+	.clock = (1080 + 28 + 4 + 16) * (2246 + 120 + 4 + 12) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 4,
+	.htotal = 1080 + 28 + 4 + 16,
+	.vdisplay = 2246,
+	.vsync_start = 2246 + 120,
+	.vsync_end = 2246 + 120 + 4,
+	.vtotal = 2246 + 120 + 4 + 12,
+	.width_mm = 68,
+	.height_mm = 141,
+};
+
+static int ebbg_ft8719_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ebbg_ft8719_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs ebbg_ft8719_panel_funcs = {
+	.prepare = ebbg_ft8719_prepare,
+	.unprepare = ebbg_ft8719_unprepare,
+	.get_modes = ebbg_ft8719_get_modes,
+};
+
+static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ebbg_ft8719 *ctx;
+	int i, ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
+		ctx->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
+		ret = regulator_set_load(ctx->supplies[i].consumer,
+						regulator_enable_loads[i]);
+		if (ret)
+			return dev_err_probe(dev, ret,
+						 "Failed to set regulator load\n");
+	}
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &ebbg_ft8719_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ebbg_ft8719_remove(struct mipi_dsi_device *dsi)
+{
+	struct ebbg_ft8719 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id ebbg_ft8719_of_match[] = {
+	{ .compatible = "ebbg,ft8719" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ebbg_ft8719_of_match);
+
+static struct mipi_dsi_driver ebbg_ft8719_driver = {
+	.probe = ebbg_ft8719_probe,
+	.remove = ebbg_ft8719_remove,
+	.driver = {
+		.name = "panel-ebbg-ft8719",
+		.of_match_table = ebbg_ft8719_of_match,
+	},
+};
+module_mipi_dsi_driver(ebbg_ft8719_driver);
+
+MODULE_AUTHOR("Joel Selvaraj <jo@jsfamily.in>");
+MODULE_DESCRIPTION("DRM driver for EBBG FT8719 video dsi panel");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

