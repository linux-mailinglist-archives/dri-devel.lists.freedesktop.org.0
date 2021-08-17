Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C023EE24B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9506E0A6;
	Tue, 17 Aug 2021 01:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CF089A83
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n7so30326036ljq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=hNWZ3lDQBB9G0NfTmCUH5K27tkGRQQ+XAmdCjgXsoLk44TVXnSV0rZZArfsM7BjMNQ
 NzXAqYUV8bprqa1tDC9g84EyQd3o8jniWwkMjyQMMuqUkUkg6juIVGYjyUCbChTFmc7C
 Y9kAvvDPB9tH2tyarHnY6QH7UIi/z4zffPnrrS03ZW5T6FXyCYoeQLuQKPtpL84Si2yR
 MkQ+LN020YkVrk5A8hxNQQXfqHQiqTAV1n8zak/R17pXJIG49Dyerbvv/lIRePo4u9Cy
 r4NoX8Q2wawaT0cFfMSzhTg/VWuRq5m8tSgtaZnX2c9Uv2OXGulLsD2BxcAnqIFKNTgY
 /46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=YNk+Nq/px0NFzZWZd/qe5rW+SA04vv7RcCNmfvIOL42iHf8NfCmaPfnh11low0w5dM
 aqWmugB2L/nGr7MH8Xw9woazA/JPGE3IWzG0r0peAxVsO1cpjSMOIhCTvSERHu3LHFqg
 fzH4eeSo/FIJAbxVK2iuEUQOCWoQUH7lqyEL5dOS76TV3xSERsoz8Tjxvv2WMAlbaeKq
 IEjJgn9BYLsVMplr4ErtFsZigWIjVK1Mxt4jk9rhTktqh9YRl9/yeq6kl/tSdfCsWlV8
 ebSK/CLX3nmQkeZd8dG3nAWoE2zLcipwn2X2Z7rCPsFJ6in/y8EfUN3154br2g4Oq0zy
 fN+g==
X-Gm-Message-State: AOAM530R5aEZmzb5rYwPIYfl7IFh2JuXlLeejk0oEPrOfhUmIKK1qpup
 ErWksKzX+5P/lJRsC4kLZiE=
X-Google-Smtp-Source: ABdhPJw/eckx03zVOJf2hmuiHkhQYzKLMML9PEB8kcVT0ZNZolUJSB9HB3aBM4EeNCzEcW2W6988dw==
X-Received: by 2002:a2e:9e04:: with SMTP id e4mr832311ljk.431.1629163805018;
 Mon, 16 Aug 2021 18:30:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:04 -0700 (PDT)
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
Subject: [PATCH v8 03/34] soc/tegra: Don't print error message when OPPs not
 available
Date: Tue, 17 Aug 2021 04:27:23 +0300
Message-Id: <20210817012754.8710-4-digetx@gmail.com>
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..a42d4f98c078 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -111,9 +111,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.32.0

