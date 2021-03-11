Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD8A337D97
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5F6EBA2;
	Thu, 11 Mar 2021 19:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483866EB9B;
 Thu, 11 Mar 2021 19:21:48 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u4so41678106lfs.0;
 Thu, 11 Mar 2021 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ncQjRjK6we9+VW90X3d+oYKqpNBh+iHtiBiBJx8Aeg=;
 b=l9H5XZVxeMPHehXPINPXOl+HRg28WGRb95v0DKcngMP4zV6Jd9yaFIMMrjgRwFyVzl
 TilKFAAp8P7x5irOWw16kuK4yqM6NDrZlMmKlFgMZA1ziYB/26w23z640Foe903XBUrL
 VFMC07CnbmcgLj/ZU3JGoApjVq5UvsV+R+8jgG2yTvfe3i+Wbw2vJKGnpKyhLj8WqNjY
 hwHQN3xKIj54vBH4M7GldI8MnukPeQ/IEML7d9CwLjXo2gYAJtS5XGhQv6OCcsKAueAU
 OR6TkLEigWl4mQe3DmzEo87gYdGEco2AuoHxdjkEEMulq7OwP6Jslg2eLH2kwYbo+weA
 Gfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ncQjRjK6we9+VW90X3d+oYKqpNBh+iHtiBiBJx8Aeg=;
 b=bl7Fe8l9i+Gpjrn1T3p1yZ/9U+F7uywv7ahFt06BFsZlB8vwpRzBW5FuiuiMpcvbuz
 DPCC7W6yCC9Nl/+OS1Jb9kXLGhMgS8cZAR2tTkxP+Gwq486fDoO+H3e4x2W/5JMWLekZ
 jJZjpnoKT17fQSW9MNnesIQYB5m3omQ82oALdd7eZS4w8mJ9VfyRZKVGiek6vsDY/kf7
 XSLhcNcuIlmk1FaS3l/bSDOIr+W7FfMslQWZC/9V73HNRSGYIwj5ffJzhXnB8HLBt+vV
 xXJTItcgFiC6rRscmGVV47xUrnN4dJQ99meGJeYdlsuSnHsz5qGd4j7Aq1ZOkA3AbRA4
 mfgw==
X-Gm-Message-State: AOAM530lpZP/x+hPuH2RyX9U9KO2Qs1fF5as2a942j0VxftyycH1yVR8
 MStkZedaU0X6Q1D41f2BiEyPUWussBg=
X-Google-Smtp-Source: ABdhPJzCh0Qft9dy6G5hWn6tIaRZlWEsGaeKss0+RsKBrcATwvRzpe98QMG4AbkTbMgmz6nalW3KdQ==
X-Received: by 2002:a19:309:: with SMTP id 9mr3246749lfd.268.1615490505282;
 Thu, 11 Mar 2021 11:21:45 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 07/14] spi: spi-geni-qcom: Convert to use resource-managed
 OPP API
Date: Thu, 11 Mar 2021 22:20:58 +0300
Message-Id: <20210311192105.14998-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Acked-by: Mark brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-geni-qcom.c  | 17 +++++++----------
 include/linux/qcom-geni-se.h |  2 --
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 881f645661cc..20cc29ea198b 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -666,6 +666,7 @@ static int spi_geni_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
+	struct opp_table *opp_table;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -691,14 +692,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 	mas->se.clk = clk;
-	mas->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
-	if (IS_ERR(mas->se.opp_table))
-		return PTR_ERR(mas->se.opp_table);
+
+	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto put_clkname;
+		return ret;
 	}
 
 	spi->bus_num = -1;
@@ -750,9 +752,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	free_irq(mas->irq, spi);
 spi_geni_probe_runtime_disable:
 	pm_runtime_disable(dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-put_clkname:
-	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return ret;
 }
 
@@ -766,8 +765,6 @@ static int spi_geni_remove(struct platform_device *pdev)
 
 	free_irq(mas->irq, spi);
 	pm_runtime_disable(&pdev->dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return 0;
 }
 
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index ec2ad4b0fe14..cddef864a760 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -47,7 +47,6 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
- * @opp_table:		Pointer to the OPP table
  */
 struct geni_se {
 	void __iomem *base;
@@ -57,7 +56,6 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
-	struct opp_table *opp_table;
 };
 
 /* Common SE registers */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
