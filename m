Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61205385E1
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 18:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A1210E099;
	Mon, 30 May 2022 16:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2041.outbound.protection.outlook.com [40.92.18.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BAA10E099
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 16:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epOad6gaOTbJWHu/yuID0/9uBzRmG+pLhVRKJqj6b0zquCJDKSgdwVFdXptuOpt1Z83ZXSkHiegJs2XJllYHrJShLzPkQF/qWBFbnAVNLh9lYxxWJR2qOqxkWR/71NeR5En4UfU5mwiCzy5MQDSTVdzch6y1xOV0m7H/giAZcctHNNTxOfjFGHJSt8DDKxJkP9ED98ZdS+bXnwMQYSyJBMZYS+/ayNEYN1qmMO9yhVoc7QoeetYUzKzASYzCAbOMi5StOehhOzR1hYjIkdFxzD+p5Ms8TUn7lFtZOfE8sXLmLKbHg4iUbitWZLTM+IdGBIq8rXu2pCcK9hZGiBRIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctsUi1x6bw2wTpee189KJWkY0mC16fjDshtBT6469xA=;
 b=HhEs+fSVK2+nnNXsoTwqyECCYlccd3OMIz2tzW4IOvk981OoZDy7kj7z79L9Rp9Gf9+lpgCvfXxLuUe4VU4oEVX+SRG47NcNqU7R8X4jCbZoAS4vgwKAj+qZn3Layu0b9w00hniP9K1zCelKQb/Vibvr/Ix5cyMcq9Ho+OTJuLo2g421IW63ob9KWiINp5mnMOo1tqnyTaY5v/8Tql5gg7gGXqwuCSvw5IbjIWQNtrews/4qxKMV7guAdFpGWJbKTsAjz0a15OfR4xq4szuBhzv11HEW9PWVZv3t4hAwObzZP6IZY0UROh/ymOq6FqdGLSD0G1pAA2GDdmPHgMr68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB5880.namprd02.prod.outlook.com (2603:10b6:a03:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 16:08:38 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:08:38 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v3 3/3] drm/panel: introduce ebbg,ft8719 panel
Date: Mon, 30 May 2022 21:37:53 +0530
Message-ID: <BY5PR02MB7009301398881E89033F1DF0D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530160753.100892-1-jo@jsfamily.in>
References: <20220530160753.100892-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [YMao9ao9DTmTE1tF3WVGcBuenddA0/Y8xVYcorCtABx0/c3fYyC6rFfa2kdbg0fP]
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220530160753.100892-4-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c49bd06-f382-4473-1563-08da4256a7f0
X-MS-TrafficTypeDiagnostic: BYAPR02MB5880:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMrvWHE8qqPfUMM4B2esIt4UUe+Xavtg6d+h6/S4KE0LXh+8O2Hs1bK0YhQdbPMpv7Q3PIyCtFB/SCWIk7wt+/8v9Hfm460LxShyWHvX26fhAdWGWNNF1j0Lg6JdvRrn0MNC4PGqJibp3s3K/BTXiHI6NgR0zkiW/xtQqhq88QNzS492tJHp3ozKL0bw/741I3SODt/aMs+RN/E+mKvj3IWqggRDa+sLUVobleXEqEUdJJn6Go7bSwG5qUuf0fe9g+vtIzw8xE61aA1urjuQQA1w4qz8569KlKqOPhyOn3cN9IA/cLzPeW9hgxBGIeRtfaQguZhkWAsZblOzaGOIhf8PcGE5AmR3sBR5k2HN48uAJvrBOOvnVvaPcwds8owCcR4bXy8DVsBHKZMNW5ccULVBYNoe3eywMBupBBvsC+E8L5tXCGWbMYbD2r8Iu34Egu0YOrWo6BZgD+MX9U/StWsrO8mFW0oB/usWFxda8eAFCK0jxY+h/ME8bguXgE7HsdTT1PhYbXQoe9Y2LvvPv+D4Kvq2d6ukEhcS52u3VyPVDaWiRA5OQdEgYQ2VRffFfKOFYIjizRjcplFj9hUH4g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kRk7Z2osmO6jnH9EV0iUw1izPrl4wADjyHPQAzPooz6D2cw/Cqv1k5KrZeZ7?=
 =?us-ascii?Q?7DdSmj9d+OLyiUu3H8JhyjcGM57zhxcOacE8iWQnCij8HEknGcnhCExSCGlG?=
 =?us-ascii?Q?IRhMRo0PzNxRy4DC2QV0bmT8fmvktZrr7rVCLYbgkWEWdBbHOXkk5jO7+giQ?=
 =?us-ascii?Q?JJr/qcuP1pi/S4+OcUUiy1qWkjvEyrIKJ3I5f6ipl7/qTuQiJvrBJWHTGIUO?=
 =?us-ascii?Q?2zMov+YAU78B+1WtWW6/4b8TJwivsZa/SGqSw0+tKU5qV3ebbTBPLrZ+Ki1z?=
 =?us-ascii?Q?JJlKX+z3dzUMJSaEpSB3zKsPZTtcw39DM7h7JIDGhTRYod3QHS2xChMTCHmf?=
 =?us-ascii?Q?4EszT6nB0UytWLmdrY4uFLVsHlmAYnCJhM3i6M0hBpn906OQqDRgSLaOxkBE?=
 =?us-ascii?Q?XB7gIIu0LxtNguSSKz3i9G2DD8KDspR8Iunuy4e0XOt9iLNfoKp+bNptusRA?=
 =?us-ascii?Q?KxKN/M9+CnwuG7tLfbugkn9uOJtC1+mPzcwO5ae5p2bIa6Yw0XM7kArTHmzA?=
 =?us-ascii?Q?MtqwAD56cMJJiWUka9FxbtObRrfjk4RFcrFNLn3LLoEB564K5JlFtU2LGsTi?=
 =?us-ascii?Q?9E5imSBLd4vn5E9W9MdB1OOCYkL7GWyp4FUaiEoVCdOTRaQAQa0i/QMVZ7c2?=
 =?us-ascii?Q?/FR2bn18df+jlbbYgZYgEdSQl0wlPTlj1fGozeHykoM0xXAk7J64MLD43LkT?=
 =?us-ascii?Q?f4xAKGWd5CGyF+MztZyJL+uBZadJDJexnMmODMITOOoTdi138N1sn6Q1nWQZ?=
 =?us-ascii?Q?hpaSsLAboJviMe4FJf0WQjlh+tMNOnzyc1COlVoUKCEdmyBiHlVclUWPwKgd?=
 =?us-ascii?Q?+DxoQfcQ/9fyrr3ksIR5McdOytMsuFab/Y/hRzhyYpGN6yMeSmjIV2UiC0E5?=
 =?us-ascii?Q?F5PsfaKLhyruSlFUMQwLNmdD0+k5czY/PdTDWPd9QfENXemO2gdT71RqocpV?=
 =?us-ascii?Q?bvSMgexyIoYNBKG4nHS0kLD/Ul3z7gnAmFV3SUtUbKXipRPTQidkTSHcUDxs?=
 =?us-ascii?Q?vNOFoyTDJsFrK+Ytj/agWDVdq0DdvVK14CptAHMzNyeH7GBto6QwKYYuyyJ4?=
 =?us-ascii?Q?8/Jf2pFXo8xbi4IcHIV7cE2GFPseMUrTHEagDkJ2vH1z1E7Km1cjrzxKEeBi?=
 =?us-ascii?Q?eKlGv2Sb7X/YN8gfOS7+dOo+xfiUd9/C0UGxuhfwZ3i9lASyWopbcFMKIqW3?=
 =?us-ascii?Q?44s4TK93CaEHqVZu4xGrtXMRlWCVywv/nOudWBusUejLTispDrt0x6Jofszb?=
 =?us-ascii?Q?K1H0C63gLspPdMPu5z9k7Hv2uH0DX3jM1fmmvnihBzCRXQWHsUadeXH7HnQE?=
 =?us-ascii?Q?g4pYuYj9YcONMRVWv2ORyMnyRsgGvLmXNKRSSHS5liIwzpr9o3gv7OY0e5FV?=
 =?us-ascii?Q?2VPAT2oyT39RQfhL9O/+Xx6Cs/HWN54Zh/fMb9iuphpHHxUKFgpg7zUwHLsS?=
 =?us-ascii?Q?ikYGkkfFPpPSgZ7ui2VWK+H9GMBcUgBlHw5rmIWtbp6AcuIWX7VEDA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c49bd06-f382-4473-1563-08da4256a7f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:08:38.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5880
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
Changes in v3: (Mostly Linus Walleij's Suggestions)
 - Removed ctx->prepared state variable as it's handled by the core
 - Print error in dsi_dcs_write_seq macro if it fails to write
 - Removed magic power on sequences as panel works fine without them

 MAINTAINERS                               |   7 +
 drivers/gpu/drm/panel/Kconfig             |  11 +
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 296 ++++++++++++++++++++++
 4 files changed, 315 insertions(+)
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
index 000000000000..9f3819cabd75
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -0,0 +1,296 @@
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
+#define dsi_dcs_write_seq(dsi, cmd, seq...) do {				\
+		static const u8 d[] = { cmd, seq };				\
+		struct device *dev = &dsi->dev;	\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0) {						\
+			dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
+			return ret;						\
+		}						\
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

