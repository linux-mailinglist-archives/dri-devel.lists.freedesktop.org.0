Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810944642F7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891136E86D;
	Tue, 30 Nov 2021 23:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716C6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b1so57751424lfs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R96ZVkrOm8k9eme6iC5AQ0TJyD6674Gzc/J8B1BaX4Y=;
 b=YwYQkon8iN+NiDe/EyeKJxHGIPoPL9A+sgTpR842ZTFcEQB72FZCbbscSUdBvPhcFg
 hiSiv/3AKmyp4UPcBEDxoVPseNWuD09pXe7BHp9DhRHHlRc33j8rMvy08Z1LAdvSLt/T
 e2mbiKf0lbEtMohV7PCmBcb2STauLhsOuB9gyLUHviNRthK/8dH4h+PubcVeCcqIwukb
 QFA6jULjg1ehI0/mvg29ArkdCY7Lg4GyLTFFH7a7LBKJYfreVPnvbeQN6s4PTJQii17Q
 tc07DtkjfpUYO2pRxPHN6Bj3iP26NZqpwIipOFj8n+gvELyiv8t7cM52UaCcpfKxcnl+
 HLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R96ZVkrOm8k9eme6iC5AQ0TJyD6674Gzc/J8B1BaX4Y=;
 b=4t/0bllBH8Z+bVNEyKjJ3iIFLLuL7oQBBfJl4G66aLSK8BIBJFHspRHFfImf8iDUcX
 4jyiV195QcC10xslD3k5AWHVoBYwxUkaOlF4mJI8qMjyFVvHQaKUbCDzjku+OtXTGu8w
 G1uM3REdDLymB1+x7v0DYsZg/Y2COAkkOYw7xIP2YzobXVCb/lr0uEtj5JGDCEejkxW2
 TJIblqbAe1xYUfzwDfrx2UM7kfns1zhQgAJmOi6QYcTCgBszNOQEJvW2+AICFdbK4ZnG
 yX8Bs/QPU+Ewh8C4eq6wMzAgH6YZCljAjhrfG0o/siagfL42Tf1wL61U5KWbXJROg5+9
 Okpg==
X-Gm-Message-State: AOAM532ABdqtEGHUgPlY9tk9AOtKwA9T6t+4Lw9Z/UJANcs79zg2q5ej
 h0d8s8jf7vJ1TbeQTx26RX8=
X-Google-Smtp-Source: ABdhPJziSMuiZmUlmSHwYsWA0HD5rwGgywuMdPzz8KtRoNj81d2gyk1bdG2UUr5x+sfySR5YNluKKA==
X-Received: by 2002:a19:7417:: with SMTP id v23mr2241897lfe.19.1638314654589; 
 Tue, 30 Nov 2021 15:24:14 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:14 -0800 (PST)
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
Subject: [PATCH v16 20/40] bus: tegra-gmi: Add runtime PM and OPP support
Date: Wed,  1 Dec 2021 02:23:27 +0300
Message-Id: <20211130232347.950-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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

The GMI bus on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now GMI must be resumed using
runtime PM API in order to initialize the GMI power state. Add runtime PM
and OPP support to the GMI driver.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/bus/tegra-gmi.c | 50 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index a6570789f7af..35b59f92fa66 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -13,8 +13,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define TEGRA_GMI_CONFIG		0x00
 #define TEGRA_GMI_CONFIG_GO		BIT(31)
 #define TEGRA_GMI_BUS_WIDTH_32BIT	BIT(30)
@@ -54,9 +57,10 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
 {
 	int err;
 
-	err = clk_prepare_enable(gmi->clk);
-	if (err < 0) {
-		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+	pm_runtime_enable(gmi->dev);
+	err = pm_runtime_resume_and_get(gmi->dev);
+	if (err) {
+		pm_runtime_disable(gmi->dev);
 		return err;
 	}
 
@@ -83,7 +87,9 @@ static void tegra_gmi_disable(struct tegra_gmi *gmi)
 	writel(config, gmi->base + TEGRA_GMI_CONFIG);
 
 	reset_control_assert(gmi->rst);
-	clk_disable_unprepare(gmi->clk);
+
+	pm_runtime_put_sync_suspend(gmi->dev);
+	pm_runtime_force_suspend(gmi->dev);
 }
 
 static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
@@ -213,6 +219,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 	if (!gmi)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gmi);
 	gmi->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -232,6 +239,10 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return PTR_ERR(gmi->rst);
 	}
 
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_gmi_parse_dt(gmi);
 	if (err)
 		return err;
@@ -247,8 +258,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, gmi);
-
 	return 0;
 }
 
@@ -262,6 +271,34 @@ static int tegra_gmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tegra_gmi_runtime_resume(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(gmi->clk);
+	if (err < 0) {
+		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_gmi_runtime_suspend(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(gmi->clk);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_gmi_pm = {
+	SET_RUNTIME_PM_OPS(tegra_gmi_runtime_suspend, tegra_gmi_runtime_resume,
+			   NULL)
+};
+
 static const struct of_device_id tegra_gmi_id_table[] = {
 	{ .compatible = "nvidia,tegra20-gmi", },
 	{ .compatible = "nvidia,tegra30-gmi", },
@@ -275,6 +312,7 @@ static struct platform_driver tegra_gmi_driver = {
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
+		.pm = &tegra_gmi_pm,
 	},
 };
 module_platform_driver(tegra_gmi_driver);
-- 
2.33.1

