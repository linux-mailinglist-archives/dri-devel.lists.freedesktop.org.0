Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4785677F15
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0310E4BE;
	Mon, 23 Jan 2023 15:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8E10E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:14:03 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id k13so11742319plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6pfGP8F/CZnmySkaMhl1te7xx0K6up+05928JeSO18=;
 b=bzEq6n/wOq1mlBfsA4JQkknI8/aXMN4OWoe+E89gCAUtqQxelvajOO8O3wKNFvP5x0
 aAdCrz4T8oC7zaVi3MsuDzQt6lGBqRELr21KLjFz0fxATDPqfROMBAe2MqOyazKsVfHC
 q2n2ylujKGoDBuAfJRJeqa8pvQNLUaJRPF+Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6pfGP8F/CZnmySkaMhl1te7xx0K6up+05928JeSO18=;
 b=K2EtwBpaLyoJfcdD+ItF9dntSH3qo6PpbTMPQFg8HipmZc+kH6zC/qIK83r+QndH+r
 aeaT5FxVy3RfFJ6cRarPShE5fY2e5kWFsrWNsNb/1QjKA0ABr4gUFUt0meWBqtaCnl+o
 UbrSthamk0MgJfuXI0nvbDtajjOQMml9hX8cDAqCf3hsGT112L2Zl1IBomszyxtQ8ICG
 bb29AUic6GzoLAAqMu9Q8ImiAsvbNVjEysH4dj2TZgmhr+WXmGZH6KGPy4eqRPzVi82i
 MM/3ssHqd2eYU4m8SZlrOg4Dc7zCNqDCIqaTybbKTMS/7/aVxnxccHpQlahf6cSKOqsH
 gAOQ==
X-Gm-Message-State: AFqh2kroPYzwwivgWbmcpAGLAYOCuKe4AUGvNkHP8sVrOACsOcxD2cIV
 WtHY+fkOuAcG7AYBa58HA/R61w==
X-Google-Smtp-Source: AMrXdXtH8irfTH+lPKvFcQkH/zsJjqSvNR735rZI5zay4dBem4sLtmYax3KbyBeUjH0JgfTfqc6weQ==
X-Received: by 2002:a17:903:32d1:b0:195:e86f:ff18 with SMTP id
 i17-20020a17090332d100b00195e86fff18mr15065335plr.42.1674486843206; 
 Mon, 23 Jan 2023 07:14:03 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:14:02 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host irq
 hooks
Date: Mon, 23 Jan 2023 20:42:07 +0530
Message-Id: <20230123151212.269082-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable and disable of te_gpio's are Exynos platform specific
irq handling, so add the exynos based irq operations and hook
them for exynos plat_data.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 55 +++++++++++++++++++++----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index fc7f00ab01b4..5e672209ed5f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -290,9 +290,15 @@ struct exynos_dsim_host_ops {
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 };
 
+struct exynos_dsim_irq_ops {
+	void (*enable)(struct exynos_dsi *dsim);
+	void (*disable)(struct exynos_dsi *dsim);
+};
+
 struct exynos_dsi_plat_data {
 	enum exynos_dsi_type hw_type;
 	const struct exynos_dsim_host_ops *host_ops;
+	const struct exynos_dsim_irq_ops *irq_ops;
 };
 
 struct exynos_dsi {
@@ -307,7 +313,6 @@ struct exynos_dsi {
 	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
-	struct gpio_desc *te_gpio;
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
@@ -331,6 +336,7 @@ struct exynos_dsi {
 
 struct exynos_dsi_enc {
 	struct drm_encoder encoder;
+	struct gpio_desc *te_gpio;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1344,18 +1350,38 @@ static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_enable_irq(struct exynos_dsi *dsim)
 {
-	enable_irq(dsi->irq);
+	struct _exynos_dsi *dsi = dsim->priv;
 
 	if (dsi->te_gpio)
 		enable_irq(gpiod_to_irq(dsi->te_gpio));
 }
 
-static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_disable_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio)
 		disable_irq(gpiod_to_irq(dsi->te_gpio));
+}
+
+static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	enable_irq(dsi->irq);
+
+	if (pdata->irq_ops && pdata->irq_ops->enable)
+		pdata->irq_ops->enable(dsi);
+}
+
+static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	if (pdata->irq_ops && pdata->irq_ops->disable)
+		pdata->irq_ops->disable(dsi);
 
 	disable_irq(dsi->irq);
 }
@@ -1384,9 +1410,10 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
+static int exynos_dsi_register_te_irq(struct exynos_dsi *dsim,
 				      struct device *panel)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
 	int ret;
 	int te_gpio_irq;
 
@@ -1394,7 +1421,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	if (!dsi->te_gpio) {
 		return 0;
 	} else if (IS_ERR(dsi->te_gpio)) {
-		dev_err(dsi->dev, "gpio request failed with %ld\n",
+		dev_err(dsim->dev, "gpio request failed with %ld\n",
 				PTR_ERR(dsi->te_gpio));
 		return PTR_ERR(dsi->te_gpio);
 	}
@@ -1404,7 +1431,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
-		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
+		dev_err(dsim->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
 		return ret;
 	}
@@ -1412,8 +1439,10 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	return 0;
 }
 
-static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
+static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio) {
 		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
 		gpiod_put(dsi->te_gpio);
@@ -2033,6 +2062,11 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsim_irq_ops exynos_dsi_irq_ops = {
+	.enable = _exynos_dsi_enable_irq,
+	.disable = _exynos_dsi_disable_irq,
+};
+
 static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.register_host = exynos_dsi_register_host,
 	.unregister_host = exynos_dsi_unregister_host,
@@ -2043,26 +2077,31 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS3250,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS4210,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5410,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5422,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5433,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
-- 
2.25.1

