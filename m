Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27A33A610
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADFF6E0DC;
	Sun, 14 Mar 2021 16:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86B76E0DC;
 Sun, 14 Mar 2021 16:35:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j18so4490152wra.2;
 Sun, 14 Mar 2021 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wztVjPrbaWUiGypvft6cn5K7xFwngQ+a+vmAeJ+d5sc=;
 b=gZ63/BBVKEvbFwRt6vnGpOTOZzf+jEJGMgOWLucPD2hCX1Gq7BbSzsBXORqyxGjnz3
 9+6jfdEpD16ubrdhyv/41cqJIBZIQXyj0undmJjqqr/op2c7I0KZBGpo8tgnVQYAmMpg
 2lC4Xdse0JHm8+nmIOaNT9ainSSu0CktacH1pEoj259ys4OypRaYkVLzZpWLvrmIaCM+
 2Gi8bAlMndI3q9qCr74w2A3rTaJkTyb7I2/iLC7HChnGoBz4yoAC1mnYnqD7ceNaACYe
 EEtviL2vSzgji6mY8X+PXXV9b8xe27kOY2A4qjctp/IRBYSBxcKUfd7nYCywa9A6y0mU
 +opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wztVjPrbaWUiGypvft6cn5K7xFwngQ+a+vmAeJ+d5sc=;
 b=GzAfOxm/yt0/wn4a/V4rADMli/XAaCz+lp5dVK6Q8yuwTEuSA9/v3uadvqmo83OVhg
 wzP12qT5Xu7di1HGGnfRpxOBPaCrH6AkDJI7ETbH4T7fKkuATazyJn8vDOi36RGA+mDK
 6H9pqsz61exHnXEwbgSAUrPDR+fgOBrgF22WOFogZD/K6dD3akyiPpGDPuHjBv4+q8ns
 dRVpLhlmMqqxQsXhMO3u2HZysHCbBabW86tm+ulLCvY3H1tqggZC80ESizQodJJv74me
 VF8NYtH6QX3OOqxxMEFT2tPcN3xGzQvQb0I9eElAipOu51kfz/PgsK8jX3zoAwUfnSHu
 ISlg==
X-Gm-Message-State: AOAM530fitKYhsDUpxgnqCYL0t73qQLl4aV4JzJPRr5QN1Ou8rBDUM0w
 gsGFiIurU5Na/qqutJ9KbTLMNGIj1VA=
X-Google-Smtp-Source: ABdhPJzvr9Lkkt1hNoHreSALn01qCW8D0EVwWu49kIaEFRwZgYUEUti/e7ibV8Z4E4X6E3VPTTQfCw==
X-Received: by 2002:adf:f743:: with SMTP id z3mr23604775wrp.304.1615739701459; 
 Sun, 14 Mar 2021 09:35:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:35:01 -0700 (PDT)
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
Subject: [PATCH v3 15/15] memory: samsung: exynos5422-dmc: Convert to use
 resource-managed OPP API
Date: Sun, 14 Mar 2021 19:34:08 +0300
Message-Id: <20210314163408.22292-16-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 1dabb509dec3..56f6e65d40cd 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -343,7 +343,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	int idx;
 	unsigned long freq;
 
-	ret = dev_pm_opp_of_add_table(dmc->dev);
+	ret = devm_pm_opp_of_add_table(dmc->dev);
 	if (ret < 0) {
 		dev_err(dmc->dev, "Failed to get OPP table\n");
 		return ret;
@@ -354,7 +354,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	dmc->opp = devm_kmalloc_array(dmc->dev, dmc->opp_count,
 				      sizeof(struct dmc_opp_table), GFP_KERNEL);
 	if (!dmc->opp)
-		goto err_opp;
+		return -ENOMEM;
 
 	idx = dmc->opp_count - 1;
 	for (i = 0, freq = ULONG_MAX; i < dmc->opp_count; i++, freq--) {
@@ -362,7 +362,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 
 		opp = dev_pm_opp_find_freq_floor(dmc->dev, &freq);
 		if (IS_ERR(opp))
-			goto err_opp;
+			return PTR_ERR(opp);
 
 		dmc->opp[idx - i].freq_hz = freq;
 		dmc->opp[idx - i].volt_uv = dev_pm_opp_get_voltage(opp);
@@ -371,11 +371,6 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	}
 
 	return 0;
-
-err_opp:
-	dev_pm_opp_of_remove_table(dmc->dev);
-
-	return -EINVAL;
 }
 
 /**
@@ -1567,8 +1562,6 @@ static int exynos5_dmc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dmc->mout_bpll);
 	clk_disable_unprepare(dmc->fout_bpll);
 
-	dev_pm_opp_remove_table(dmc->dev);
-
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
