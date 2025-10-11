Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BCBCF8D7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCF210E312;
	Sat, 11 Oct 2025 17:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WdoTwcZI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ryJ4sYCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985FD10E312
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLC320Wz9spd;
 Sat, 11 Oct 2025 19:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNz+03qHJyVIWctmuqs68UAWGkjV8rHjE8hcCafmDww=;
 b=WdoTwcZIhA0VefqxXEgmYv3BZqCCxK7L5d7+xT2ufbkrDCTHejFDeWBb5VCmmMDx4omsxJ
 G/ZRtMxKI8mJKuGT8bozqkcU+8hXtYEUpS3a2dlTGwKfrIbN0pCDwuEO8AxTRtOb7KXvCN
 z0aZexXq+smEfpTTYgolEovE+WndK7cGvkkWR6zGIje/Reyu3PsotRJYVHlJc7zORBH4QJ
 eHXGMncURyQPr5UI8W/9F6VlwC0oFT5aA18usGNg7G4Uu1kacb6D0tQrStflBXOEKpYdOS
 ALQtDINXota3ug04s/+J5wswvuLvdzXkGHLIhvJkMRyZBSxszBii4heUx46wZg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNz+03qHJyVIWctmuqs68UAWGkjV8rHjE8hcCafmDww=;
 b=ryJ4sYCPl/6QImQ5PI7q0i2RDWqBQHIfEVzQRCN7duLNVC7oTfjxf+sX7rjLQf3CHuk469
 mxgPb23XwaGeNUrDo8PNqCS4pApy1kTBes6n6jCjeuMoFB7qxWWAlwUgZZpwFol4d5bZxD
 ZQegqnGvbv9s19Eel+usgVycf0lNYc4fvDBk4HOnsmwqwbHM0+oEmgzGMwGHpLKadozejT
 naoFEIEvBdBiyiUE12wx5uvG7OSG3/QlW4ozqgQH7Obd92vRI++reTiRbddp7RoRdXhhL3
 OBql9OybmIMVHwQ3AGApEPVpq6csb/wWRkwWGd35OHCMJ3r3z2/pi0LdWy2Sdw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 08/39] drm/imx: dc: de: Pass struct dc_de_subdev_match_data
 via OF match data
Date: Sat, 11 Oct 2025 18:51:23 +0200
Message-ID: <20251011170213.128907-9-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8bca66a0ea50a31b920
X-MBO-RS-META: juox1kmwi3qxeanbfgi5586c4mopcjyb
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

Introduce struct dc_de_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case is one register offset
and address space offsets, and pass it as OF match data into the driver,
so the driver can use the match data to correctly access Display Engine
polarity control register on each SoC. This is a preparatory patch for
i.MX95 addition. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-de.c | 44 +++++++++++++++++++++++-----------
 drivers/gpu/drm/imx/dc/dc-de.h |  1 +
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 81334c0088219..6331b2f3b622c 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -10,47 +10,62 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-de.h"
 #include "dc-drv.h"
 
-#define POLARITYCTRL		0xc
+#define POLARITYCTRL_IMX8QXP	0xc
 #define  POLEN_HIGH		BIT(2)
 
-static const struct dc_subdev_info dc_de_info[] = {
+struct dc_de_subdev_match_data {
+	const struct regmap_config	*regmap_config;
+	unsigned int			reg_polarityctrl;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_de_info_imx8qxp[] = {
 	{ .reg_start = 0x5618b400, .id = 0, },
 	{ .reg_start = 0x5618b420, .id = 1, },
 	{ /* sentinel */ },
 };
 
-static const struct regmap_range dc_de_regmap_ranges[] = {
-	regmap_reg_range(POLARITYCTRL, POLARITYCTRL),
+static const struct regmap_range dc_de_regmap_ranges_imx8qxp[] = {
+	regmap_reg_range(POLARITYCTRL_IMX8QXP, POLARITYCTRL_IMX8QXP),
 };
 
-static const struct regmap_access_table dc_de_regmap_access_table = {
-	.yes_ranges = dc_de_regmap_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges),
+static const struct regmap_access_table dc_de_regmap_access_table_imx8qxp = {
+	.yes_ranges = dc_de_regmap_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges_imx8qxp),
 };
 
-static const struct regmap_config dc_de_top_regmap_config = {
+static const struct regmap_config dc_de_top_regmap_config_imx8qxp = {
 	.name = "top",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.wr_table = &dc_de_regmap_access_table,
-	.rd_table = &dc_de_regmap_access_table,
-	.max_register = POLARITYCTRL,
+	.wr_table = &dc_de_regmap_access_table_imx8qxp,
+	.rd_table = &dc_de_regmap_access_table_imx8qxp,
+	.max_register = POLARITYCTRL_IMX8QXP,
+};
+
+static const struct dc_de_subdev_match_data dc_de_match_data_imx8qxp = {
+	.regmap_config = &dc_de_top_regmap_config_imx8qxp,
+	.reg_polarityctrl = POLARITYCTRL_IMX8QXP,
+	.info = dc_de_info_imx8qxp,
 };
 
 static inline void dc_dec_init(struct dc_de *de)
 {
-	regmap_write_bits(de->reg_top, POLARITYCTRL, POLARITYCTRL, POLEN_HIGH);
+	regmap_write_bits(de->reg_top, de->reg_polarityctrl, de->reg_polarityctrl, POLEN_HIGH);
 }
 
 static int dc_de_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_de_subdev_match_data *dc_de_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_de_info = dc_de_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res_top;
@@ -67,7 +82,7 @@ static int dc_de_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(base_top);
 
 	de->reg_top = devm_regmap_init_mmio(dev, base_top,
-					    &dc_de_top_regmap_config);
+					    dc_de_match_data->regmap_config);
 	if (IS_ERR(de->reg_top))
 		return PTR_ERR(de->reg_top);
 
@@ -84,6 +99,7 @@ static int dc_de_bind(struct device *dev, struct device *master, void *data)
 		return de->irq_seqcomplete;
 
 	de->dev = dev;
+	de->reg_polarityctrl = dc_de_match_data->reg_polarityctrl;
 
 	dev_set_drvdata(dev, de);
 
@@ -163,7 +179,7 @@ static const struct dev_pm_ops dc_de_pm_ops = {
 };
 
 static const struct of_device_id dc_de_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-display-engine" },
+	{ .compatible = "fsl,imx8qxp-dc-display-engine", .data = &dc_de_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 1ac70b4f6276f..e054ad88190e1 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -42,6 +42,7 @@ struct dc_de {
 	int irq_shdload;
 	int irq_framecomplete;
 	int irq_seqcomplete;
+	unsigned int reg_polarityctrl;
 };
 
 /* Domain Blend Unit */
-- 
2.51.0

