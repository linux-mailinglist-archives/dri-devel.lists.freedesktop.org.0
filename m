Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB367539F62
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750B10E5D2;
	Wed,  1 Jun 2022 08:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02olkn2039.outbound.protection.outlook.com [40.92.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A4710E5D2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfMjEBU9UZepZeKuQBGmSnz1AYr1piAPeOvkUuGvAlRs8dJsGPAIZD925D8MdSPPfnYtZhf+jQm/UEdfHhWONjPOvsWMaMu+Nk1r26doX/fFVZ3lHfxBZh97ick+6kQ7GBukk2B1QpsNIcoqBvVJ/kEgx+vkPYbQ95TO8T7wtuyAoBLvtvnpXWt4UeIRH2DSnPzmp2giuObO0hEWh9hiqz2jROjVE6PDPEsZdBUAzMus92Ivjbf3+MxBXHb1JbQolcjOaa/UXp2fug43scoyuwDB2AAYOkPZkAUO8kP7Yf+NnX/emVQqNQ10xN1o0xtCw0cPFHToU8dmT38X7VZ33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXkjgE7/ij07uCy1K4/F6HH/8sqap+W3ENNm0tkFWkw=;
 b=TQ43WSgZUIbRVnOCGvs/r+hlJkfs0ha0UrJEs/bimAgjc7YpX46bGiVKYGrh15ZyrLNXkoQNkRE9nKAVbYqs8I6BC4X3we5w7IJ7QjO6ns5bd+F+62njEFUZTaVKwAYdDLXtKdGj6yQkdqLJBIcrcjaZiRgBI0lJoAlJqtoDGvZzmcGuCoJS9ZBCKK5nPBtZap0MNI6s3DoZzzw76dV3T9EACJuhuknHoWwM8n878ylwmbkScn4/TTUyvZlBdXueo5MVgww5mtuhPZNTrV/S4OUokoWrT5V+k+gYWCfI5kjHk3m5Gce16s3SdSj2UpMWDVzMrzuHlgn9euPcrXjeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB5708.namprd02.prod.outlook.com (2603:10b6:5:7c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 08:24:56 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:24:56 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v4 4/4] drm/panel: introduce ebbg,ft8719 panel
Date: Wed,  1 Jun 2022 13:54:10 +0530
Message-ID: <BY5PR02MB7009B6FA7F17A3DA36DDA44CD9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601082410.55266-1-jo@jsfamily.in>
References: <20220601082410.55266-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Du9j9AVJW4SvXVEPnvA69nHJTjXnhSnZ+5qevClyRqgRDGbbqPzeFKhSPnRwqkZ7]
X-ClientProxiedBy: BM1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::13) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220601082410.55266-5-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a3a8a5-414b-4be7-3a22-08da43a835e3
X-MS-TrafficTypeDiagnostic: DM6PR02MB5708:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seAbeUOLfwnYhtWzYjmyQiabYbo/lypZ5v1/oJqypZYolUEQLWvoZPALgWzFPhtmuom+ufZ+1Hg8g9AFEYix3RXooJuLxbkohft5c21F7R0Owrgso3vF25n0o4BxVMr2rTXXujTAJkobPewmBWPVMlRfPGWVi/9DGJ2bekHwhwqv5cZBSs6J8/6xFayPUSfnYB101I07IfkiytqS8XTF8JMBqHuXgGTWPdwkI9AWe3/deMTgPn4kxPc8LAwU9CgsyRSxsdV5tueuYAdSIM0kObquBs+z2Mm8ZDI1cVZS3SINm08FMgy3S8patlAmQLU2m/hXDSgupkzXKRUK418mPfdqoQlMPhK704l4HB6OGEugqotD1LHhi83qBVOAdJnAH5TLkigntvfruj9qo9qzYPaj0iFRgGf1iTKmSAD1TNN4asNVm9i4hS1NEUxKQBDHkKhZkx2PReuFbSS3XP5wlUIu5HntUpwkbOV+6LzYfkotE5lo7PsCyukZO3y63Ye+nCdl4of6HY6/AdzMYxYf+WQkk52qYKtvC0r3PArEvUokG4uEXf/zq4ZTdnF9NCzkgDN05eANWaVxqK39tWhfkQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nxIor0qq3G+gkNboOBPgnHx7HcvpbfUTCitK6hrREtxjIWNSBdbZDM4LIaO?=
 =?us-ascii?Q?T2hTKeySy2MUPToN0Yj4rgCuY3a4J363z0TcIIplNz1NQmZ/WD2o2C4bWneB?=
 =?us-ascii?Q?pKacq4urS2+8Tocbs3Qq/QTyRkOGEIflvXYNDPUmcXxLuTXfcKN31dJwbvNY?=
 =?us-ascii?Q?MHc0cgQ17/+bi27LanL4OdJv1ck3VUk/Bk69BbVlldPbczTw99ohg5Fxh+7c?=
 =?us-ascii?Q?WlEWoQDsw6YDVIRoKs9cFeNjylUEIFRBPmMA25UvDb94w0Mm7Dl681pp7RhX?=
 =?us-ascii?Q?mqittg3p72cLu8C6rCOt3N4z2TF4P4meAZTsD8IC4U6sOKwf60H49QArDdmO?=
 =?us-ascii?Q?iHVswmxQlvfsRTarfNxslvUB6SRXqf3I3D2m2XsaTfJcV6lDGW0ymJdWRJ4X?=
 =?us-ascii?Q?q0DnP2Olz+xoiScGLxlJbSQFyLB96v2B6qLvs2XD8SYpM1J73P5sRVX7JK2f?=
 =?us-ascii?Q?O60iiwvVEcVtyOMQ32SfTKQjChdaPlVjfq4QwOvhxYR5hxHc3MS6jkgVFKn1?=
 =?us-ascii?Q?WYwTEaEHaErg807k9LufuocdTDLSDvSzp9e4zhnpdL3l/zrVsbPLiRE+gInK?=
 =?us-ascii?Q?4RZK3ScA25gth/04IhlXFfClRmgJxMqKyGxptKQ8A5/VtFb3ca7CoR9Hzfcd?=
 =?us-ascii?Q?DMAzbhDuRsi3OP5ocQuYkQWoDowaSbRzln55BMG4jJd+4yPYWqqLCu+DxRH8?=
 =?us-ascii?Q?5gVKNL2RX+dnt8YTS9WQFSSqy0BielDdw+RjiKDQEkB9HNrWbNZcm/gEHBNf?=
 =?us-ascii?Q?T+k+Jpw6EquyuD48i2weHZ3dKs7i5qnGPOcVZQZLNSJfG9SmvWMwYsUnSzIr?=
 =?us-ascii?Q?CBPSZGwXlR/gt9Mxvg870ygBlTQi3qBVWp/cTH0TIalKslCaqvND29ULOYaL?=
 =?us-ascii?Q?yHMygJtWsNSzPIQ1lJreZW/II3jxfbC+G3zEz5NHfdKwC2VtpuEQP1tPa6IW?=
 =?us-ascii?Q?0wqPswDTaAszhqiiAZWxcO9ShfjZPDQDYWsPwXPzly4rJS7UkdKn6iBG/bU7?=
 =?us-ascii?Q?uoIgBZBTRqQHkaRu5LJKEfXVVP+QsfgHvXNNmuL4s2mI4FbJFU41N8je2yDx?=
 =?us-ascii?Q?R5n9OIC8MYa60gyWK2UePjj1KUBD7kcUs1LsRjJ0X2RqafuthFl8wxMR26xF?=
 =?us-ascii?Q?JV0XKa0niq7qwuW0rZ+WH0qh/HKlajvTqLHrlVzVBHmJfz31H6vLXqkVrvKq?=
 =?us-ascii?Q?6Je9GQZ2/Xqj9QwLA4+BO9wuNpbGfCv7va9DCTQivTE4IETveyOj04+0sAL2?=
 =?us-ascii?Q?7L00gDVqDhdVD6CYRPoZ5LtxUqwH7T3/qZExL3EpGFZwxVYC4TdEc85AitiC?=
 =?us-ascii?Q?OpmSrEr6iad101wbl8g3QwMQZkjeBKM8CcNvHRtbhchFrA4lDE2prSuDNQ2a?=
 =?us-ascii?Q?ktxyum4ocADBDs0lSaFfbch34or+9mzc9mJxyb3POshifSb/kh/9xgLUlUBN?=
 =?us-ascii?Q?zoP6Q7ToJSviIuatZHJ2fR0pNjFouiC6U8lCaQsWtwf+ssDCX0qB5Q=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a3a8a5-414b-4be7-3a22-08da43a835e3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:24:56.8083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5708
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes in v4: (Linus Walleij's Suggestion)
 - Remove the driver specific dsi_dcs_write_seq macro
 - Use the newly introduced mipi_dsi_dcs_write_seq macro instead

Changes in v3: (Mostly Linus Walleij's Suggestions)
 - Removed ctx->prepared state variable as it's handled by the core
 - Print error in dsi_dcs_write_seq macro if it fails to write
 - Removed magic power on sequences as panel works fine without them

 MAINTAINERS                               |   7 +
 drivers/gpu/drm/panel/Kconfig             |  11 +
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 285 ++++++++++++++++++++++
 4 files changed, 304 insertions(+)
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
index 000000000000..386f8321b930
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -0,0 +1,285 @@
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
+};
+
+static inline
+struct ebbg_ft8719 *to_ebbg_ft8719(struct drm_panel *panel)
+{
+	return container_of(panel, struct ebbg_ft8719, panel);
+}
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
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display brightness: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
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
+	return 0;
+}
+
+static int ebbg_ft8719_unprepare(struct drm_panel *panel)
+{
+	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
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
2.36.1

