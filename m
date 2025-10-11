Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92ABCF92E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCF710E330;
	Sat, 11 Oct 2025 17:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sg0Kc94D";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CFLgHpYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A4210E331
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:45 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVLm3kY4z9tX0;
 Sat, 11 Oct 2025 19:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fM37c4YVfvfjOC99xroIH5MTCuIyqrZFkGkR6ghzqLc=;
 b=sg0Kc94DVjLScX2WyYoSsEruAtnQCcvyUBO+7g0TiqUsSPSnNl7abvWlRLBXXXTasWS9hE
 6KaoFnf1e3vf8YcnrTTdGST+eueJ2dLpLW5gLqU2azKE9goqoc/9LQFyCtWb6En86eIW2Y
 XJdiC0bbjB6pwI82x/DlgV2kGmZ7KiViyTbPwfR186mGNso7fI8jduK1sXTYMmNCKzXL1m
 gljAEYhGd4o6vSHnE68FUcXJh3IAAeRZYlzP8SreFDNpGWbNJeFHbZAXtOZeGzssWJ8GlY
 m/m1pipItrr7uytQgQXlymMrBdd8sardGQfqwAWWm+58ljfg+gGzbLJuyplgMg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fM37c4YVfvfjOC99xroIH5MTCuIyqrZFkGkR6ghzqLc=;
 b=CFLgHpYIjdkGy8MPNZs1Ng1fR247eI4HMhDDHXtBJIX/LRHChf9VY7MEeO/HAfMBkip7af
 5mSibD5IxTthGClYAWEMobr6D6LeFdAQxOTKIuWFX6HB160LMuNEJGtjA4mUgXcTjtb3WB
 3m1+N1f3NuwERe3jh/xZrgbTfbQ2INLzUKY5C81gSwEk2D5Xg3GHqS90Y6TkCPv5PRzayv
 29o1fqxEEuA7NTmZbXixk/TPr4qjBL7eu5sAM8hWHHCXa3BrNvasvFTEFqc2Qjoj2pGWel
 CMvcsZhjoFxHchcjIT3xtERJ9751KFAXZdcZ/6Al8lC1QhTOtUkLIaeUCPTvmg==
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
Subject: [PATCH 18/39] drm/imx: dc: ic: Pass struct dc_ic_subdev_match_data
 via OF match data
Date: Sat, 11 Oct 2025 18:51:33 +0200
Message-ID: <20251011170213.128907-19-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d0baf2e493dfbaf76dd
X-MBO-RS-META: 4w5rhhqn5zfkuzp1t96msounapegtezo
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

Introduce struct dc_ic_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case is register map difference
and presence of user registers, and pass it as OF match data into the driver,
so the driver can use the match data to correctly set up the IRQ controller.
This is a preparatory patch for i.MX95 addition. No functional change.

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
 drivers/gpu/drm/imx/dc/dc-ic.c | 118 +++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index 67441b349a7d2..f327ef0918766 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -24,16 +24,17 @@
 #define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
 #define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
 
-#define IRQ_COUNT	49
-#define IRQ_RESERVED	35
-#define REG_NUM		2
+#define IRQ_COUNT_MAX	49
+#define REG_NUM_MAX	2
 
 struct dc_ic_data {
 	struct regmap		*regs;
 	struct clk_bulk_data	*clk_axi;
 	int			clk_axi_count;
-	int			irq[IRQ_COUNT];
+	int			irq[IRQ_COUNT_MAX];
 	struct irq_domain	*domain;
+	unsigned int		reg_enable;
+	unsigned int		reg_status;
 };
 
 struct dc_ic_entry {
@@ -41,60 +42,85 @@ struct dc_ic_entry {
 	int irq;
 };
 
-static const struct regmap_range dc_ic_regmap_write_ranges[] = {
+struct dc_ic_subdev_match_data {
+	const struct regmap_config	*regmap_config;
+	unsigned int			reg_enable;
+	unsigned int			reg_clear;
+	unsigned int			reg_status;
+	unsigned int			reg_count;
+	unsigned int			irq_count;
+	unsigned long			unused_irq[REG_NUM_MAX];
+	int				reserved_irq;
+	bool				user_irq;
+};
+
+static const struct regmap_range dc_ic_regmap_write_ranges_imx8qxp[] = {
 	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTCLEAR(1)),
 	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTCLEAR(1)),
 };
 
-static const struct regmap_access_table dc_ic_regmap_write_table = {
-	.yes_ranges = dc_ic_regmap_write_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges),
+static const struct regmap_access_table dc_ic_regmap_write_table_imx8qxp = {
+	.yes_ranges = dc_ic_regmap_write_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges_imx8qxp),
 };
 
-static const struct regmap_range dc_ic_regmap_read_ranges[] = {
+static const struct regmap_range dc_ic_regmap_read_ranges_imx8qxp[] = {
 	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTENABLE(1)),
 	regmap_reg_range(INTERRUPTSTATUS(0), INTERRUPTSTATUS(1)),
 	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTENABLE(1)),
 	regmap_reg_range(USERINTERRUPTSTATUS(0), USERINTERRUPTSTATUS(1)),
 };
 
-static const struct regmap_access_table dc_ic_regmap_read_table = {
-	.yes_ranges = dc_ic_regmap_read_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges),
+static const struct regmap_access_table dc_ic_regmap_read_table_imx8qxp = {
+	.yes_ranges = dc_ic_regmap_read_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges_imx8qxp),
 };
 
-static const struct regmap_range dc_ic_regmap_volatile_ranges[] = {
+static const struct regmap_range dc_ic_regmap_volatile_ranges_imx8qxp[] = {
 	regmap_reg_range(INTERRUPTPRESET(0), INTERRUPTCLEAR(1)),
 	regmap_reg_range(USERINTERRUPTPRESET(0), USERINTERRUPTCLEAR(1)),
 };
 
-static const struct regmap_access_table dc_ic_regmap_volatile_table = {
-	.yes_ranges = dc_ic_regmap_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges),
+static const struct regmap_access_table dc_ic_regmap_volatile_table_imx8qxp = {
+	.yes_ranges = dc_ic_regmap_volatile_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges_imx8qxp),
 };
 
-static const struct regmap_config dc_ic_regmap_config = {
+static const struct regmap_config dc_ic_regmap_config_imx8qxp = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.wr_table = &dc_ic_regmap_write_table,
-	.rd_table = &dc_ic_regmap_read_table,
-	.volatile_table = &dc_ic_regmap_volatile_table,
+	.wr_table = &dc_ic_regmap_write_table_imx8qxp,
+	.rd_table = &dc_ic_regmap_read_table_imx8qxp,
+	.volatile_table = &dc_ic_regmap_volatile_table_imx8qxp,
 	.max_register = USERINTERRUPTSTATUS(1),
 };
 
+static const struct dc_ic_subdev_match_data dc_ic_match_data_imx8qxp = {
+	.regmap_config = &dc_ic_regmap_config_imx8qxp,
+	.reg_enable = USERINTERRUPTENABLE(0),
+	.reg_clear = USERINTERRUPTCLEAR(0),
+	.reg_status = USERINTERRUPTSTATUS(0),
+	.reg_count = 2,
+	.irq_count = 49,
+	.user_irq = true,
+	.unused_irq = { 0x00000000, 0xfffe0008 },
+	.reserved_irq = 35,
+};
+
 static void dc_ic_irq_handler(struct irq_desc *desc)
 {
 	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
 	struct dc_ic_data *data = entry->data;
-	unsigned int status, enable;
+	unsigned int status, enable, offset;
 	unsigned int virq;
 
 	chained_irq_enter(irq_desc_get_chip(desc), desc);
 
-	regmap_read(data->regs, USERINTERRUPTSTATUS(entry->irq / 32), &status);
-	regmap_read(data->regs, USERINTERRUPTENABLE(entry->irq / 32), &enable);
+	offset = entry->irq / 32;
+	regmap_read(data->regs, data->reg_status + 4 * offset, &status);
+	regmap_read(data->regs, data->reg_enable + 4 * offset, &enable);
 
 	status &= enable;
 
@@ -107,11 +133,10 @@ static void dc_ic_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
-static const unsigned long unused_irq[REG_NUM] = {0x00000000, 0xfffe0008};
-
 static int dc_ic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct dc_ic_subdev_match_data *dc_ic_match_data = device_get_match_data(dev);
 	struct irq_chip_generic *gc;
 	struct dc_ic_entry *entry;
 	struct irq_chip_type *ct;
@@ -123,7 +148,7 @@ static int dc_ic_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	entry = devm_kcalloc(dev, IRQ_COUNT, sizeof(*entry), GFP_KERNEL);
+	entry = devm_kcalloc(dev, dc_ic_match_data->irq_count, sizeof(*entry), GFP_KERNEL);
 	if (!entry)
 		return -ENOMEM;
 
@@ -133,7 +158,7 @@ static int dc_ic_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	}
 
-	data->regs = devm_regmap_init_mmio(dev, base, &dc_ic_regmap_config);
+	data->regs = devm_regmap_init_mmio(dev, base, dc_ic_match_data->regmap_config);
 	if (IS_ERR(data->regs))
 		return PTR_ERR(data->regs);
 
@@ -143,9 +168,12 @@ static int dc_ic_probe(struct platform_device *pdev)
 				     "failed to get AXI clock\n");
 	data->clk_axi_count = ret;
 
-	for (i = 0; i < IRQ_COUNT; i++) {
+	data->reg_enable = dc_ic_match_data->reg_enable;
+	data->reg_status = dc_ic_match_data->reg_status;
+
+	for (i = 0; i < dc_ic_match_data->irq_count; i++) {
 		/* skip the reserved IRQ */
-		if (i == IRQ_RESERVED)
+		if (i == dc_ic_match_data->reserved_irq)
 			continue;
 
 		ret = platform_get_irq(pdev, i);
@@ -165,18 +193,22 @@ static int dc_ic_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < REG_NUM; i++) {
+	for (i = 0; i < dc_ic_match_data->reg_count; i++) {
 		/* mask and clear all interrupts */
+		regmap_write(data->regs, dc_ic_match_data->reg_enable + (4 * i), 0x0);
+		regmap_write(data->regs, dc_ic_match_data->reg_clear + (4 * i), 0xffffffff);
+
+		if (!dc_ic_match_data->user_irq)
+			continue;
+
 		regmap_write(data->regs, USERINTERRUPTENABLE(i), 0x0);
-		regmap_write(data->regs, INTERRUPTENABLE(i), 0x0);
 		regmap_write(data->regs, USERINTERRUPTCLEAR(i), 0xffffffff);
-		regmap_write(data->regs, INTERRUPTCLEAR(i), 0xffffffff);
 
 		/* set all interrupts to user mode */
 		regmap_write(data->regs, USERINTERRUPTMASK(i), 0xffffffff);
 	}
 
-	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+	data->domain = irq_domain_add_linear(dev->of_node, dc_ic_match_data->irq_count,
 					     &irq_generic_chip_ops, data);
 	if (!data->domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
@@ -194,21 +226,21 @@ static int dc_ic_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < IRQ_COUNT; i += 32) {
+	for (i = 0; i < dc_ic_match_data->irq_count; i += 32) {
 		gc = irq_get_domain_generic_chip(data->domain, i);
 		gc->reg_base = base;
-		gc->unused = unused_irq[i / 32];
+		gc->unused = dc_ic_match_data->unused_irq[i / 32];
 		ct = gc->chip_types;
 		ct->chip.irq_ack = irq_gc_ack_set_bit;
 		ct->chip.irq_mask = irq_gc_mask_clr_bit;
 		ct->chip.irq_unmask = irq_gc_mask_set_bit;
-		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
-		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
+		ct->regs.ack = dc_ic_match_data->reg_clear + (i / 8);
+		ct->regs.mask = dc_ic_match_data->reg_enable + (i / 8);
 	}
 
-	for (i = 0; i < IRQ_COUNT; i++) {
+	for (i = 0; i < dc_ic_match_data->irq_count; i++) {
 		/* skip the reserved IRQ */
-		if (i == IRQ_RESERVED)
+		if (i == dc_ic_match_data->reserved_irq)
 			continue;
 
 		data->irq[i] = irq_of_parse_and_map(dev->of_node, i);
@@ -225,11 +257,13 @@ static int dc_ic_probe(struct platform_device *pdev)
 
 static void dc_ic_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	const struct dc_ic_subdev_match_data *dc_ic_match_data = device_get_match_data(dev);
 	struct dc_ic_data *data = dev_get_drvdata(&pdev->dev);
 	int i;
 
-	for (i = 0; i < IRQ_COUNT; i++) {
-		if (i == IRQ_RESERVED)
+	for (i = 0; i < dc_ic_match_data->irq_count; i++) {
+		if (i == dc_ic_match_data->reserved_irq)
 			continue;
 
 		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
@@ -268,7 +302,7 @@ static const struct dev_pm_ops dc_ic_pm_ops = {
 };
 
 static const struct of_device_id dc_ic_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-intc", },
+	{ .compatible = "fsl,imx8qxp-dc-intc", .data = &dc_ic_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 
-- 
2.51.0

