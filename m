Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023244FAB2
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02926E8C3;
	Sun, 14 Nov 2021 19:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8E26E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id d11so30713454ljg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eME+Ghk5yYp+vqFqDcay3Mk1GyWQJky7Yrr0vWPMFpg=;
 b=bFg8h8/P+d2aecGNZDminH4vVh8FQG3pJdQB+IZDVE3r8APoqa61h6T8eTRHFfUNgl
 +tOEg0lFag4es7FC/xoZnKbBuPoHU6qyClYU3zOxjvkyqiNML02m7JsDZtNpCHjZMpUb
 EElABcsUjWI38Fc2KcyHkCgI0rQOCWW4ULTt5ZoCq832j870aW+34mnLrz1qJpRjnYHl
 dYsVzG9nMYzP0DcVwRGktWm0larQSbBBslBaYNx/EsQQvw3cpN/qWrG7aWM+K5ZlNePW
 Lu/pS7rYxrfBklXfDLD8tZ96D7va5oWFpWUHELqKGd6LJCRUnykTQ1ZvdZW210wjrhj7
 q8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eME+Ghk5yYp+vqFqDcay3Mk1GyWQJky7Yrr0vWPMFpg=;
 b=A7VCwAg1yQrmW7+XwsOycetYEsbSzGDIyAQ+0R4F2sxnzTKhljtsAfaJE0XW6lfB3A
 kPLS1uXt6ZD2IfMb69Xc30jOZ5ruiLyFGHt/inssWa9uVXTki9cy/LrypaXy6nKzpjk1
 wzjj1vQf22zFwz9GjCOewaJ24mdS6zz3CPqdm6CRajna4HQ8GsFZ3m22OKiNrjN+czOC
 iPtqco3xVnY0Yluf/F2gGhHPOTeLuDVJy8eE/72z6k/U9SZCXnpWxtsEJVhvMJGWW0bc
 v1WRuhKOFogJJnV4Ax5BbIgFDeqkY9g3jEeEKhZvvU3gU9SrW286SdF2O+LfkyAyi9iH
 J0nw==
X-Gm-Message-State: AOAM531eCYe4paU2XgoDRujbJ8iPPSOdj6lQMximaSfGGTyMNHSWJzXq
 No8h30HP4H9MCoZgnuuFwTs=
X-Google-Smtp-Source: ABdhPJygjPj44AsTOUQ30aN1+BoQkySdT+eG7wqXuYbwmvJxklQymjHLciPrOIsTe87R22idnJSzoA==
X-Received: by 2002:a2e:3a09:: with SMTP id h9mr33037531lja.141.1636918578577; 
 Sun, 14 Nov 2021 11:36:18 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:18 -0800 (PST)
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
Subject: [PATCH v15 23/39] spi: tegra20-slink: Add OPP support
Date: Sun, 14 Nov 2021 22:34:19 +0300
Message-Id: <20211114193435.7705-24-digetx@gmail.com>
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

