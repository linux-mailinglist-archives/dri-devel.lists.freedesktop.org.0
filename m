Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC072AEA90
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2C89F6F;
	Wed, 11 Nov 2020 07:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA0989D64
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so762314wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaEGNlagm12rE9D/Wwm7i6p9QUikpwKV1tx7Tt13Q1s=;
 b=FrJAgroaw87i4Fom8Zp2mStkjQuZklEi5B+Wzm5MqgQs7TVYDTSIIBbx8YrnX5gn9n
 W19VdWJ0NghMs3ldUZhf94DBe38JAZUnfdV/pLY8AOQuEwaVhsdF0UuJuYNCjwLEdgLX
 VVEGnqNad6r0IrG6A1QTL+HKoEecxVT2nzEQToOLfEQqAbjVfaslUJVXmaNUzmGhe0Yi
 gJNqGxwCepBRYKLMDSOCI/vnrn4PCJgoWmKxUWaLwFcVaPEElizMhsDJoI9USkQtsA/v
 dV2C5+G4V2FXfZX5+cubMaFSkDDQXMFebzF1s2ykwGJKfIJcZ6kELhT1SfE4K7VPcSdo
 hcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TaEGNlagm12rE9D/Wwm7i6p9QUikpwKV1tx7Tt13Q1s=;
 b=pK5RGxXY7Dfq9GMwjCzVPUPrMysxFYLkxIkZ96vXhlPkgQczLKDW0Un6Ts141TLdmX
 jKbMcPBQki68PcprqpwSnlKhz+9Wb67Z2Vjkdosr/ib5yMu4XGMhoVITSrBib3O1K32Q
 glmD09tERD8+l+X5+Y+GRitcRigPmQve05BfpXqhDOckN7qMb5nZjpXtoCreKP9PdNue
 pHmR9NY0TcaWc+gJ7Vw7oTLqD3AjD66tBrISIkQEYKWxhHYxLfZ+G78LVqfhMoIzxWs0
 4dPjQCsv1kPUqM0eq2OMsh9/ThAthHbcp1k6ykR2xvTMRZZROE67VqeB4d4cRDqU+AxR
 c6CA==
X-Gm-Message-State: AOAM5311NS3HooslHO/DV4fxaqqWsUcHEYLzhk5AWs2q65me0f/7fPil
 rzzhBQne9CRKIKQ+uWX3Ouc=
X-Google-Smtp-Source: ABdhPJz6ljHmxkfhc3SNdcEVqNIvy7oRVDOWk6rMWdNFVJu/Q0bDA/QujtchGwgSZQUeFOX3HhhX3g==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr25595932wrt.141.1605057313860; 
 Tue, 10 Nov 2020 17:15:13 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:13 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 03/26] memory: tegra20-emc: Factor out clk initialization
Date: Wed, 11 Nov 2020 04:14:33 +0300
Message-Id: <20201111011456.7875-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out clk initialization and make it resource-managed. This makes
easier to follow code and will help to make further changes cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 70 ++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index bb3f315c9587..d01b556a6d06 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -960,6 +960,49 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	return err;
 }
 
+static void devm_tegra_emc_unset_callback(void *data)
+{
+	tegra20_clk_set_emc_round_callback(NULL, NULL);
+}
+
+static void devm_tegra_emc_unreg_clk_notifier(void *data)
+{
+	struct tegra_emc *emc = data;
+
+	clk_notifier_unregister(emc->clk, &emc->clk_nb);
+}
+
+static int tegra_emc_init_clk(struct tegra_emc *emc)
+{
+	int err;
+
+	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
+
+	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
+				       NULL);
+	if (err)
+		return err;
+
+	emc->clk = devm_clk_get(emc->dev, NULL);
+	if (IS_ERR(emc->clk)) {
+		dev_err(emc->dev, "failed to get EMC clock: %pe\n", emc->clk);
+		return PTR_ERR(emc->clk);
+	}
+
+	err = clk_notifier_register(emc->clk, &emc->clk_nb);
+	if (err) {
+		dev_err(emc->dev, "failed to register clk notifier: %d\n", err);
+		return err;
+	}
+
+	err = devm_add_action_or_reset(emc->dev,
+				       devm_tegra_emc_unreg_clk_notifier, emc);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -1003,25 +1046,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
-
-	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk)) {
-		err = PTR_ERR(emc->clk);
-		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
-		goto unset_cb;
-	}
-
-	err = clk_notifier_register(emc->clk, &emc->clk_nb);
-	if (err) {
-		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
-			err);
-		goto unset_cb;
-	}
+	err = tegra_emc_init_clk(emc);
+	if (err)
+		return err;
 
 	err = tegra_emc_opp_table_init(emc);
 	if (err)
-		goto unreg_notifier;
+		return err;
 
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_rate_requests_init(emc);
@@ -1036,13 +1067,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	try_module_get(THIS_MODULE);
 
 	return 0;
-
-unreg_notifier:
-	clk_notifier_unregister(emc->clk, &emc->clk_nb);
-unset_cb:
-	tegra20_clk_set_emc_round_callback(NULL, NULL);
-
-	return err;
 }
 
 static const struct of_device_id tegra_emc_of_match[] = {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
