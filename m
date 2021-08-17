Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7D3EE28F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4445F6E0C8;
	Tue, 17 Aug 2021 01:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8216E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:29 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y34so38165163lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
 b=akMX2IQiN5C+wsFejbQ7AaZ+aEU812b5i7ElnI7gcJqxm1qRG/X5nkz7zPNl/SEuMH
 QYUoyowBTGQltjI7rFnyUsvx1P3XCb2OTN8HMc5ZVPvu356dI6iNPo+FE1gI3G2skcAZ
 zA06NlaJ0U14aSpiH7ZYOwXfSia2rN6scqCmOQTUapIIluAVOffKIxK+c1yKDRTvbUY2
 3HH/mdwiEU/wLbJGKSQojE13f0Fb0t1wG+JFucgpENZr3k6Vt8XgEIqnJmTsyJD5X4NS
 LYXnAFgRsIPnmTCV8x/cfPZl/+PqCsMY81oJpWDePTLH7Xxhs3PQ8mSYbT1yqTQ/4Y3Y
 RO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL4BVrLk7WYd6afEPPAKr2OvrAlyWTvGqySuaSzvsoU=;
 b=TgiPgVNyvhfuDqyfz4g4XX/LucojTDxK2fW66v1/UDoak+caKHsvShRy7uHrk7zZQ1
 CCSzhCfVc3FhD344UpN0amZMnDbUiNxpDrtbAvNJgT+KCzdN6xBTHhb39KQPm29BWiYT
 /m8lwV4BpPcjg27LJftVVSp/GQoAjY9suHtTukyiT8io3/LgbPp6SHV0QVtD/M4+g+CS
 iqO+d2QZx4B0xZBhbD0lbbd369LBwm5oqeCTLWNsGlkxRFq9v0q1/Xdsiue3J5yX4hmq
 QGZGnvjNRV/1L8iL1KxA/zdrlusllBST2dOpQf10G7/fNBNLHDD7k8Y1n6tIT5wNMkVZ
 g6LQ==
X-Gm-Message-State: AOAM531zBiP27fErvMCaa/Xv/ku0r7jUFxK3QNuiAPd7rfy1ZIoqHZnX
 w/wGC+70duhbAzGgsBQqGa8=
X-Google-Smtp-Source: ABdhPJw02p9RsEdccY59vWAtODBKBNtEXdwRJ/qwlwTWkchrOt3IUpFpHFlVjjDlgZH5cc57idRxWQ==
X-Received: by 2002:a19:f009:: with SMTP id p9mr516594lfc.227.1629163827643;
 Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:27 -0700 (PDT)
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
Subject: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
Date: Tue, 17 Aug 2021 04:27:42 +0300
Message-Id: <20210817012754.8710-23-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index deff16ba6d58..37cb15dc59f7 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -18,12 +18,15 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
+#include <soc/tegra/common.h>
+
 #define SLINK_COMMAND			0x000
 #define SLINK_BIT_LENGTH(x)		(((x) & 0x1f) << 0)
 #define SLINK_WORD_SIZE(x)		(((x) & 0x1f) << 5)
@@ -683,7 +686,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1054,6 +1057,10 @@ static int tegra_slink_probe(struct platform_device *pdev)
 		goto exit_free_master;
 	}
 
+	ret = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* disabled clock may cause interrupt storm upon request */
 	tspi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(tspi->clk)) {
@@ -1205,6 +1212,12 @@ static int tegra_slink_runtime_resume(struct device *dev)
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
 	int ret;
 
+	ret = dev_pm_opp_sync(dev);
+	if (ret) {
+		dev_err(dev, "failed to sync OPP: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(tspi->clk);
 	if (ret < 0) {
 		dev_err(tspi->dev, "clk_prepare failed: %d\n", ret);
-- 
2.32.0

