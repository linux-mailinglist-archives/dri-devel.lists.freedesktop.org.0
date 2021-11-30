Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD7464297
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6B6E7EC;
	Tue, 30 Nov 2021 23:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A76E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id d11so44285687ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eME+Ghk5yYp+vqFqDcay3Mk1GyWQJky7Yrr0vWPMFpg=;
 b=Hp/kcTE3+FG+iHC4vDD1K9H3BwGkmxkvbqO5yGK+uA2zxJhFyynAVgeKawKy0FXPY1
 U2ueDUgbXAIFcHq1rkd9w12smB96KNZeeIwaCRid/bM4t6xF/Oaqw5wOlsa2f+3YqsUz
 d3hnWVBLdWb27bzK5B/QRHi1w7kanSQyMpT9xHvaNFOwycehr1tRLmoDmbu+ePNcJJID
 mUjOm07Bd+YGVVq44gm11XYjjSCeMD4JSpjsASm3wyq5opIER0BCz3mgpM3iFyhsbCTB
 RsEKsDGSjidvcWQLIasP4M47RFyDNcm7j0YJh2TpvNorPa6MVTxirVoj+AoD/dnb3w42
 ZNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eME+Ghk5yYp+vqFqDcay3Mk1GyWQJky7Yrr0vWPMFpg=;
 b=JwZpW4LwWWRooxj/hiLFEcWqtM01Owss7DOpsrtaJ92S78p/tP8C8YwIvagzfrjrEZ
 bW/dpSA/99nGOEPbpxsBmEti3Rox9ryJ9hH5fBnAGX3IT42L1Sl+tHx5hYs4YYBhH09s
 SrahXsTikhHND4bAcBj+wl0Q5trFHK+1AJ9+wSCX1VTkURsCM8fpJI6ivBFcaXHVfNA7
 PYEB+osQXBd591xN5uX6WK0Ga+eI+GgDWRqG+zYO53G9wkVdoqpf1bVUvoPGqskoV6D4
 01GMFUrzaZ9bSdJmSqRPq+5Hre4qZ5GNtVxFI8yXjxMu+4q0grsW/kmdJ3N6lmt6l/2d
 hPeQ==
X-Gm-Message-State: AOAM533R1ys8iXUpYVF82nO/KV/U1NlPS+fIt8PSX4LAU/ncdOjXxZD8
 bwcIL2RhADRtrBjo/aSlY/+vWp+B65o=
X-Google-Smtp-Source: ABdhPJwZJi8XFTq1MWTLjHF/OqzoNlH8yU6buUDXoCpqkTXi8DvjyqXvCF8bIUywGvL0zdAGH4x+Gw==
X-Received: by 2002:a2e:781a:: with SMTP id t26mr1975988ljc.90.1638314658388; 
 Tue, 30 Nov 2021 15:24:18 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:18 -0800 (PST)
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
Subject: [PATCH v16 24/40] spi: tegra20-slink: Add OPP support
Date: Wed,  1 Dec 2021 02:23:31 +0300
Message-Id: <20211130232347.950-25-digetx@gmail.com>
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index e8204e155484..2a03739a0c60 100644
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
 
@@ -1066,6 +1069,10 @@ static int tegra_slink_probe(struct platform_device *pdev)
 		goto exit_free_master;
 	}
 
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		goto exit_free_master;
+
 	tspi->max_buf_size = SLINK_FIFO_DEPTH << 2;
 	tspi->dma_buf_size = DEFAULT_SPI_DMA_BUF_LEN;
 
-- 
2.33.1

