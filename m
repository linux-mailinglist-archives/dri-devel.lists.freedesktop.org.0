Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CD2F0BE6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 05:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53B89B8E;
	Mon, 11 Jan 2021 04:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C189B83
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 04:47:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id n3so7669457pjm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XD7tvFGN3IxIWU+2iTGhYLlRWQFvJrJsXmN7RwoxZJo=;
 b=NIb79AR6TanCl5pjG6v3ruDYPijk9ktw82udfuL7TCHXgm+b3dtOuJs7DDBQxHWWeg
 f/dorYAEUvDlzVdHliWPXL1QeOHgdtjmolGReF0IwS10uLqdyDJzK4ik63ysEzU8TINW
 rptJrcuuEoLtIhY8z8HvmI8J6d0QbNQHDP+lg5pHHXzTeIgq5KQYU8/EZ0ZPBD/W6To8
 sCRa/90AEqWqRlfQPIJSMUZWPBJifR+8m2Qf9AtP7YNqAMlOKCytmcHdX6hgB1x6ij4k
 X/jJUFgvBi2TDh6Q2xpgLS3naigoNi+yjQQj7JgFKny3pdF0DLENtH/wwXlLndp5U23W
 D+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XD7tvFGN3IxIWU+2iTGhYLlRWQFvJrJsXmN7RwoxZJo=;
 b=Tagv0lAVo93iKKMpSnOapHx3Qg5UrsCqJzA1CuHpsNYgY2cnUPMHxPdFjqaKy0pBoG
 LLsXyrNpiXCqOTAbke7G2im9ezF23XM3RppEAxvwwcoV3QuPKuq3l0YQq9j0r6CUeYy6
 fVyRKxvPVN1C0MgSzwOILERyzuq8b9SHJWcPyeSxiNR4pb5wAwuUtT6SCo0qlKJf0AQw
 a/wybrk5Pp7zZOAshY983v2H9BkAoHKNrs38OmvYSU2mFnHFeiNarWyg7N05Il+fiHkB
 GVg0ydVE2qhBHOGI6qrLxw+UlpmtEWtJOlTRkDD+j00HYjysAPCDi7EbE5t8tos2dNdk
 80lw==
X-Gm-Message-State: AOAM532V429BxDxgWzoKbZoV1FFOei9oTardutL0TYElrEhDPfydsqZx
 v0GWxbmqf7bfB0i9n7Fut2w=
X-Google-Smtp-Source: ABdhPJxDS6uKzsKL5VW0vWuGgi1aUkg43+d3HPZfBGPyAvAVW+yCN8kldY7VfvcMaw3AEg5sKzpYjw==
X-Received: by 2002:a17:902:fe91:b029:da:6bf3:7ba0 with SMTP id
 x17-20020a170902fe91b02900da6bf37ba0mr14956309plm.2.1610340419884; 
 Sun, 10 Jan 2021 20:46:59 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z6sm17442303pfj.22.2021.01.10.20.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 20:46:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] drm/aspeed: Use dt matching for default register values
Date: Mon, 11 Jan 2021 15:16:38 +1030
Message-Id: <20210111044638.290909-3-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111044638.290909-1-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are minor differences in the values for the threshold value and
the scan line size between families of ASPEED SoC. Additionally the SCU
register for the output control differs between families.

This adds device tree matching to parameterise these values, allowing us
to add support for the AST2400 now, and in the future the AST2600.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  7 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 10 +++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 48 +++++++++++++++++++-----
 3 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index f1e7e56abc02..c81d214688f2 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -11,6 +11,10 @@ struct aspeed_gfx {
 	struct reset_control		*rst;
 	struct regmap			*scu;
 
+	u32				dac_reg;
+	u32				throd_val;
+	u32				scan_line_max;
+
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
 };
@@ -100,6 +104,3 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 /* CRT_THROD */
 #define CRT_THROD_LOW(x)		(x)
 #define CRT_THROD_HIGH(x)		((x) << 8)
-
-/* Default Threshold Seting */
-#define G5_CRT_THROD_VAL	(CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3C))
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index e54686c31a90..4e8126edacbd 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -60,7 +60,8 @@ static void aspeed_gfx_enable_controller(struct aspeed_gfx *priv)
 	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
 
 	/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
+	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), BIT(16));
+
 
 	writel(ctrl1 | CRT_CTRL_EN, priv->base + CRT_CTRL1);
 	writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
@@ -74,7 +75,7 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	writel(ctrl1 & ~CRT_CTRL_EN, priv->base + CRT_CTRL1);
 	writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
 
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
+	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
@@ -127,7 +128,8 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	 * Terminal Count: memory size of one scan line
 	 */
 	d_offset = m->hdisplay * bpp / 8;
-	t_count = (m->hdisplay * bpp + 127) / 128;
+	t_count = DIV_ROUND_UP(m->hdisplay * bpp, priv->scan_line_max);
+
 	writel(CRT_DISP_OFFSET(d_offset) | CRT_TERM_COUNT(t_count),
 			priv->base + CRT_OFFSET);
 
@@ -135,7 +137,7 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	 * Threshold: FIFO thresholds of refill and stop (16 byte chunks
 	 * per line, rounded up)
 	 */
-	writel(G5_CRT_THROD_VAL, priv->base + CRT_THROD);
+	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
 static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 8ada7e944147..de0f0bf82c6b 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -7,6 +7,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -57,6 +58,31 @@
  * which is available under NDA from ASPEED.
  */
 
+struct aspeed_gfx_config {
+	u32 dac_reg;		/* DAC register in SCU */
+	u32 throd_val;		/* Default Threshold Seting */
+	u32 scan_line_max;	/* Max memory size of one scan line */
+};
+
+static const struct aspeed_gfx_config ast2400_config = {
+	.dac_reg = 0x2c,
+	.throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
+	.scan_line_max = 64,
+};
+
+static const struct aspeed_gfx_config ast2500_config = {
+	.dac_reg = 0x2c,
+	.throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
+	.scan_line_max = 128,
+};
+
+static const struct of_device_id aspeed_gfx_match[] = {
+	{ .compatible = "aspeed,ast2400-gfx", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-gfx", .data = &ast2500_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_gfx_of_table);
+
 static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.fb_create		= drm_gem_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
@@ -97,13 +123,13 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	return IRQ_NONE;
 }
 
-
-
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct device_node *np = pdev->dev.of_node;
+	const struct aspeed_gfx_config *config;
+	const struct of_device_id *match;
 	struct resource *res;
 	int ret;
 
@@ -112,6 +138,15 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	match = of_match_device(aspeed_gfx_match, &pdev->dev);
+	if (!match)
+		return -EINVAL;
+	config = match->data;
+
+	priv->dac_reg = config->dac_reg;
+	priv->throd_val = config->throd_val;
+	priv->scan_line_max = config->scan_line_max;
+
 	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
 		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");
@@ -206,11 +241,6 @@ static const struct drm_driver aspeed_gfx_driver = {
 	.minor = 0,
 };
 
-static const struct of_device_id aspeed_gfx_match[] = {
-	{ .compatible = "aspeed,ast2500-gfx" },
-	{ }
-};
-
 #define ASPEED_SCU_VGA0		0x50
 #define ASPEED_SCU_MISC_CTRL	0x2c
 
@@ -228,7 +258,7 @@ static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
 	if (val > 3)
 		return -EINVAL;
 
-	rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
+	rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
 	if (rc < 0)
 		return 0;
 
@@ -241,7 +271,7 @@ static ssize_t dac_mux_show(struct device *dev, struct device_attribute *attr, c
 	u32 reg;
 	int rc;
 
-	rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
+	rc = regmap_read(priv->scu, priv->dac_reg, &reg);
 	if (rc)
 		return rc;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
