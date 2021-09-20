Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42D412252
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23CB6E843;
	Mon, 20 Sep 2021 18:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDCE6E7EF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g1so71798917lfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9QYtupMPLyzQnqOhwfXP4oUoMqt4gxj3ewFZ5B73Ts=;
 b=FLondlZAByswkCx76NUTut2FKe5HTLd6RMUKRjGcVS5xrGzeF4n55ShR0KiVsRbPKS
 xAPy+xlX3OUlHnUtXOFxwCN+8d5gJs2a2z0WdqOsIedoGjefZRbmdyux39rTxexL89cO
 Oajkf7cwNhOKm3ecjfD489L8XHwLcw8uMdMLgeD9tRdTKa0md7Xrvw+UUV66F+XDzklb
 kg3rGsoaIptbGC7oXHOx3h0d9BWGJ53uW38q7qiKdQ9PH5r0DsKUpkJM0PowNppUniFU
 p1HEvNelypwSp0k0w0BFnLTWa5S8F1mgxziNA7Ia3Jv1I1/5V6DwYtvbiYnbQuWV2CWf
 c/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9QYtupMPLyzQnqOhwfXP4oUoMqt4gxj3ewFZ5B73Ts=;
 b=u1Fgk+cEs/XfOX4kA9NgToYqoRnBwZmdhV3lq/MvUgJigUdsZkFjEVj9YuiqENeFdZ
 Imrdn0C2mmWQPSmQUWa7Fmo2RobnRVbbyVoWkpFn28W00OSqp0J1GyNyU/zJkv1hF0j1
 79gT4vHJdVlGnlAN3N+svPewhwppyVdwP/Xv9DG34DaSI4MG+Sf1ELYB/pOwvbtwdvNZ
 ZMYEwJYLzeoxMJGXPUxTaEMhbcQOnChYf26HX783UW6BSnw1TipEtxM4gb7Xo34kchLJ
 JVbZiBqTLCWvpZumgVewkI2Dg8J79DJqs9IduV6f3oVsvZaMZ2932IG2KYBQ9Q9PQgKL
 skZQ==
X-Gm-Message-State: AOAM533QrvaPh/c7+Zo+pTC8V3l3q7Mt0nWhSnls/yR4p47oX3ewPT/l
 +ucd8opcmglx9O4/sac87ro=
X-Google-Smtp-Source: ABdhPJx9TGtvBZ/IypK8WLsx2yRQVD/sNzzkimN7hcbYTGAHJuhtbGsTO+/Kb00HqQOXbH0CjLvTpA==
X-Received: by 2002:a05:651c:206:: with SMTP id
 y6mr9048284ljn.98.1632161545955; 
 Mon, 20 Sep 2021 11:12:25 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:25 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v12 21/35] spi: tegra20-slink: Add OPP support
Date: Mon, 20 Sep 2021 21:11:31 +0300
Message-Id: <20210920181145.19543-22-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 8ce840c7ecc8..1a92978d2120 100644
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
@@ -680,7 +683,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1082,6 +1085,11 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	init_completion(&tspi->xfer_completion);
 
 	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		goto exit_pm_disable;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
-- 
2.32.0

