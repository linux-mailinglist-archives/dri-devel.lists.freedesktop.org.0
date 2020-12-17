Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0DB2DDFAE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394089BD4;
	Fri, 18 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067396E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m25so59783926lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAtdibIFrFoBdbWxAk3vr83zchLhlmDglPbN6gXDjkM=;
 b=N3Ck5qX6m1iyF3ASnevrle+liHZfmUJKPpVtCyekINsKU3z6ST0UE5bLfsWvIqI28T
 q7/Vi3Sc4DvowsD/9Kmvo9md/xI9QWZRDL4tjGFj4npdFEjHST28bU04ou4et5wKrnOO
 fGttY/cszQ/PtGCr9+VXIP0aN0P10J7+bkhjTUGdyAz347VikCOIE1A/6pxOdMKz2ypq
 G0p8gf3pn4Qae0IPmyP+JyNMnhpFGkCQ/5nzKj46gc4j5Wo6lbhgkrL0lY/7fhfeBAg0
 g6JRxyE7jW+z6VXVtkverbxDgAkw6Wh0KasCpETW49fvq3UdS3d9CrPZiAEb+zOriUYO
 zpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAtdibIFrFoBdbWxAk3vr83zchLhlmDglPbN6gXDjkM=;
 b=TONrl7APEc2MFlyPi0TldiCCurY2Y56dgOtr7DTkHw969PWXy1SeFnp6wn5T2xtVMD
 wxLkQj6UfvS1YvQxYrdxVmmLEJG1+eQ2q4XRSq4/QpkIY5ljLNV85PMHDmRd1GPX1/C0
 Y67cf3Qhu8gPtYvKROZs+0JGMaHUCXtZLiP+OT+SRE9But8csWmUvBez+rQrTzDaTFJo
 wP6I0TcoonSyq6j/BI0TIEDVlIzjkZnbXEmX8KU3oX8WbDR/pHVWqMPiJFSqP5AoMZoA
 ys6/4AfUuMWEacIAb+0kLo2aQIHblz4HKBZsz2cdnovaA0SuuM45tbK9hpMlAZNCfbEf
 9dGg==
X-Gm-Message-State: AOAM531X+0sV04xmyBBhvOFydsokqV0lX5gyxTDB4mNoFzRXnraAUmHD
 +1yqKRE0ZFPs/eh3OzhHhIg=
X-Google-Smtp-Source: ABdhPJzE3wxZCPlLlrNCFylC3Z8X0gJtULmex2P6xsR9syJz5fbiVRh05vs/uMJBZetmgQF7Q/iIjg==
X-Received: by 2002:a2e:b5b3:: with SMTP id f19mr223623ljn.199.1608228488528; 
 Thu, 17 Dec 2020 10:08:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:08 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 42/48] memory: tegra30-emc: Use
 devm_tegra_core_dev_init_opp_table()
Date: Thu, 17 Dec 2020 21:06:32 +0300
Message-Id: <20201217180638.22748-43-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
initialization.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 57 +++---------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 44ac155936aa..c6309afd9939 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1480,58 +1480,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return err;
 }
 
-static int tegra_emc_opp_table_init(struct tegra_emc *emc)
-{
-	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
-	struct opp_table *clk_opp_table, *hw_opp_table;
-	int err;
-
-	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
-	err = PTR_ERR_OR_ZERO(clk_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
-		return err;
-	}
-
-	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(hw_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		goto put_clk_table;
-	}
-
-	err = dev_pm_opp_of_add_table(emc->dev);
-	if (err) {
-		if (err == -ENODEV)
-			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
-		else
-			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
-
-		goto put_hw_table;
-	}
-
-	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		 hw_version, clk_get_rate(emc->clk) / 1000000);
-
-	/* first dummy rate-set initializes voltage state */
-	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
-	if (err) {
-		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
-		goto remove_table;
-	}
-
-	return 0;
-
-remove_table:
-	dev_pm_opp_of_remove_table(emc->dev);
-put_hw_table:
-	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
-
-	return err;
-}
-
 static void devm_tegra_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
@@ -1577,6 +1525,7 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
 	struct tegra_emc *emc;
 	int err;
@@ -1626,7 +1575,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = tegra_emc_opp_table_init(emc);
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(&pdev->dev, &opp_params);
 	if (err)
 		return err;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
