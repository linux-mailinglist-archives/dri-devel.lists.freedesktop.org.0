Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C55408001
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FBD6E06D;
	Sun, 12 Sep 2021 20:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5846E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso5415905wme.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMziebaAeLQX+HJyIYKw3fi1qml9OJEejLLtUc1VAqA=;
 b=Ei9WKR/GHoqC55QC1McB0O+sSc+ZVrP42+/ld0Yvx1hLAYeGVJcEZP/drVDotJAHlP
 EW2Xu07jGsJUSSULxk0f7AuCuE/Xj+jm5s977iv7aPnKrRZDjDKc70qnWP7srThXvrLp
 Ku7S3LOt69sndgi1a9nypmX49Hl2EQNdP/4R6y1g78p6U/K8SmQpKjNn/Dtye5GAhNDv
 cdOcGWCB5YxsB6himB6JVE/YI7Pg2SiLoKj+gWg19d3PzpQC6OWdmdgRkDXygs8DwMzG
 wxaSbzQf3jN6TvKkQS6YMQbvcyI6j3QQM5VwEhus4v5GhWWsIlUyJ4lwVDuF99wZK36z
 vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMziebaAeLQX+HJyIYKw3fi1qml9OJEejLLtUc1VAqA=;
 b=ykT3OIHcwxQXTpSEvP96hJJ6mEFowrauMBoZvJ2V/qCRICePabp8/iN6Xx5Qe+hDPR
 aSsqfzPl27EGVAp3eVI7fDNyABvaF5kpevmooofXWWUGlTFaakiR+mawvFWzGwSdfzrE
 1jJS9nIXnmzBNrkJWDHe42PXERxC4wpzmXRf5ExbE0mkjsY6XUmnFO8yMYVc7500Vy1i
 uY3Qq3HcBzLDzvheL58MKDrGMeFUT41oF0g0WEi1ThgDALQWZ3/OaDOpHMdp1wCW4OeW
 jca0xBUrYItlG9ENbZB5nc56VoTGVo+R2Bgv+08PtWdlnjHtqC7vozDyA+p4Xxum/13v
 TMsQ==
X-Gm-Message-State: AOAM531RhN3sNnS5wWDgZUAWmGuzIuTY5Napx+M4wPXH2XiZcGjDE7xo
 +gNf9QzbpkSzmLPX/LJ3auc=
X-Google-Smtp-Source: ABdhPJwjo8d4FxDSXbfmAox/Ybla/jmb3joY5oa54PEnhjnpzCmC70nHAnUmh9uEC9aK11spOGE7IQ==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr8012955wmc.3.1631477415030;
 Sun, 12 Sep 2021 13:10:15 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:14 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 17/34] bus: tegra-gmi: Add runtime PM and OPP support
Date: Sun, 12 Sep 2021 23:08:15 +0300
Message-Id: <20210912200832.12312-18-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMI bus on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now GMI must be resumed using
runtime PM API in order to initialize the GMI power state. Add runtime PM
and OPP support to the GMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/bus/tegra-gmi.c | 52 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index a6570789f7af..72ef8a8c236b 100644
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
@@ -54,9 +57,9 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
 {
 	int err;
 
-	err = clk_prepare_enable(gmi->clk);
-	if (err < 0) {
-		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+	err = pm_runtime_resume_and_get(gmi->dev);
+	if (err) {
+		pm_runtime_disable(gmi->dev);
 		return err;
 	}
 
@@ -83,7 +86,8 @@ static void tegra_gmi_disable(struct tegra_gmi *gmi)
 	writel(config, gmi->base + TEGRA_GMI_CONFIG);
 
 	reset_control_assert(gmi->rst);
-	clk_disable_unprepare(gmi->clk);
+
+	pm_runtime_put(gmi->dev);
 }
 
 static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
@@ -213,6 +217,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 	if (!gmi)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gmi);
 	gmi->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -232,6 +237,14 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return PTR_ERR(gmi->rst);
 	}
 
+	err = devm_pm_runtime_enable(gmi->dev);
+	if (err)
+		return err;
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_gmi_parse_dt(gmi);
 	if (err)
 		return err;
@@ -247,8 +260,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, gmi);
-
 	return 0;
 }
 
@@ -262,6 +273,34 @@ static int tegra_gmi_remove(struct platform_device *pdev)
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
@@ -275,6 +314,7 @@ static struct platform_driver tegra_gmi_driver = {
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
+		.pm = &tegra_gmi_pm,
 	},
 };
 module_platform_driver(tegra_gmi_driver);
-- 
2.32.0

