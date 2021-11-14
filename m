Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4A44FAAC
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978026E8B0;
	Sun, 14 Nov 2021 19:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5836E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y26so37505021lfa.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJyi42euXBD3SLFWkAig1L26OU8nvTPoOeHmCjkl8Pw=;
 b=m+tKiQF1UfXveaaEoR5NXfWAGdDwZ1EI0fv5wWOQjXzxXS7LWqXUBIHNoqQIZcJks+
 bYO7VRJo08iGjzATxYAghlYCBfPlLNZByrG9sZuL+n9+kTgs+A1c+eE8D9aAr/XDyLsy
 2wO67BVC9Cm+LkPqVebesjbhq1/oFTkZnNeHNEWjJBr8zeAxsErVVtGjpLr/sVjN8p2f
 KJm/fJGpRd4RH/7MqYPxN60BwCbWcOQvV8oNjiYNCAvknufspZByBxOuzY1+WvddEwge
 z5SKzGV56o4MGJTK6MmkJCKHJXo7OPJm7hOuV9ekp4HKi708gHiEhg9btbQccppAO/C/
 oi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJyi42euXBD3SLFWkAig1L26OU8nvTPoOeHmCjkl8Pw=;
 b=csNyKZkDaUX8XKogzer5PuRfPcEW3aI4ZjUaQ0QrdR1Q+RhzY+C/7A35zmXWjw9GCf
 Q5/RK1XCU2RLxiHxdebwqe19YESLobAi/nr2RkWyQh+UM5t7oABnp80WgJqV7/rjk3Uf
 EKuikIVgbFXhY9xDcwU4pH980t2nJHoxy69WG7a6eXQ9l71hNxUol36rCmLJ9hxJ0yQH
 TQmEzmSGyUY0K5juOuSdZS+ghi2jLivmQUAfeuoKucJni06VpobwnPIdVcDbTJnSSuBq
 mH9bci2pY5lGTHOwaIgoG1zV2IZcMPltbUBlCeWINAPxlnxthGT1Z03kZLI37dfEStsy
 +Nsg==
X-Gm-Message-State: AOAM533Bhnt6mk9+FdSdvGyryOQY4GX8LpJwVw+LJAE25RnQ+1RB+VUD
 m3EcbeCrE8MAy1kdxjVv7aA=
X-Google-Smtp-Source: ABdhPJxWnkMCSazgFKTxmisGh39c9ndglfNZLnXP5yEtBf3Rud8Pq+Q56I/bCua3TWC86tH59SjWHA==
X-Received: by 2002:a05:6512:3c9f:: with SMTP id
 h31mr29188639lfv.407.1636918577628; 
 Sun, 14 Nov 2021 11:36:17 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 22/39] mtd: rawnand: tegra: Add runtime PM and OPP support
Date: Sun, 14 Nov 2021 22:34:18 +0300
Message-Id: <20211114193435.7705-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NAND on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now NAND must be resumed using
runtime PM API in order to initialize the NAND power state. Add runtime PM
and OPP support to the NAND driver.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 58 ++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 32431bbe69b8..b36e5260ae27 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -17,8 +17,11 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define COMMAND					0x00
 #define   COMMAND_GO				BIT(31)
 #define   COMMAND_CLE				BIT(30)
@@ -1151,6 +1154,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctrl->dev = &pdev->dev;
+	platform_set_drvdata(pdev, ctrl);
 	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
@@ -1166,14 +1170,23 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->clk))
 		return PTR_ERR(ctrl->clk);
 
-	err = clk_prepare_enable(ctrl->clk);
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
+
+	/*
+	 * This driver doesn't support active power management yet,
+	 * so we will simply keep device resumed.
+	 */
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_resume_and_get(&pdev->dev);
 	if (err)
 		return err;
 
 	err = reset_control_reset(rst);
 	if (err) {
 		dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
-		goto err_disable_clk;
+		goto err_put_pm;
 	}
 
 	writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_CMD);
@@ -1188,21 +1201,20 @@ static int tegra_nand_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), ctrl);
 	if (err) {
 		dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
-		goto err_disable_clk;
+		goto err_put_pm;
 	}
 
 	writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CTRL);
 
 	err = tegra_nand_chips_init(ctrl->dev, ctrl);
 	if (err)
-		goto err_disable_clk;
-
-	platform_set_drvdata(pdev, ctrl);
+		goto err_put_pm;
 
 	return 0;
 
-err_disable_clk:
-	clk_disable_unprepare(ctrl->clk);
+err_put_pm:
+	pm_runtime_put_sync_suspend(ctrl->dev);
+	pm_runtime_force_suspend(ctrl->dev);
 	return err;
 }
 
@@ -1219,11 +1231,40 @@ static int tegra_nand_remove(struct platform_device *pdev)
 
 	nand_cleanup(chip);
 
+	pm_runtime_put_sync_suspend(ctrl->dev);
+	pm_runtime_force_suspend(ctrl->dev);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)
+{
+	struct tegra_nand_controller *ctrl = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(ctrl->clk);
+	if (err) {
+		dev_err(dev, "Failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_nand_runtime_suspend(struct device *dev)
+{
+	struct tegra_nand_controller *ctrl = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(ctrl->clk);
 
 	return 0;
 }
 
+static const struct dev_pm_ops tegra_nand_pm = {
+	SET_RUNTIME_PM_OPS(tegra_nand_runtime_suspend, tegra_nand_runtime_resume,
+			   NULL)
+};
+
 static const struct of_device_id tegra_nand_of_match[] = {
 	{ .compatible = "nvidia,tegra20-nand" },
 	{ /* sentinel */ }
@@ -1234,6 +1275,7 @@ static struct platform_driver tegra_nand_driver = {
 	.driver = {
 		.name = "tegra-nand",
 		.of_match_table = tegra_nand_of_match,
+		.pm = &tegra_nand_pm,
 	},
 	.probe = tegra_nand_probe,
 	.remove = tegra_nand_remove,
-- 
2.33.1

