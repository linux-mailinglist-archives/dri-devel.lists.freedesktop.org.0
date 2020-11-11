Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F502AEA71
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6AD89EF7;
	Wed, 11 Nov 2020 07:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E189E0D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so753373wrx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGnE/w0793PmiZunMZUFRQQsSOAX6VpoE5tQ0qL0TNQ=;
 b=CcfAfEc6Wxuq43NPB2gcWjtzwD+rbTxfWxHbeLec/lZwZ6dFPoXjmeEUgLjljQgcld
 8bVDr2hyPhV0gPawzmCUcXpu5S1kfmWxH0asby0EFWuIEvCGEIWJH0Fhyg66gyRTdZVh
 QoDQo7/B8uOk3Ag8f5qy05A0PJa7Xj3rv7xDKjTcwC68fYmEhbnd+s/XpaMfFWtqb+Pl
 +6VLSz3am4vwEWBFThAUB2PPFLh8DnT4pMDBmJl3eRlLSiAhHxWaxZZAtuv50i8MBKxf
 g3j7DQA8P/hivATvNN7WiIbLK6ZOjG00myzY8WtM134yExNprTRQQQsid2x2eCZv3FLk
 tDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGnE/w0793PmiZunMZUFRQQsSOAX6VpoE5tQ0qL0TNQ=;
 b=oVBPBI/1R35G8Iu4kY0xXSPyZUStlgLqBXRtAIiPMsc09Q/XKljTbHO2SdrDro0+7o
 Xx0pT90IhLO7OWqqXkRa7Tu/BqtsmeNLpzWHuS4HwBVJeSaUwU1vI4US5rkil1esQnSm
 5GR9XfvWPqWBdKoAOQzwmBT4xfNbHICjsSEkqWw4y5ovVvirRUxJLFONw/6Ea4s6JZRV
 +IgFvdpQ7JNS3FyxKE6A0q2yKjYeH60TxgwLm5seWd2zcC272Eu62E1qgIaBaA2fQZkz
 EKjCOZEOqieJekFXZyvDse+3jpA4vgTgI4Dm4++zNOScEFDM/em/G6DiKXsOdQWb19nw
 4SZw==
X-Gm-Message-State: AOAM5303Qzho0bs7HTM6ysK7EBPbAfvHAXDy3di7kqk0R28/x0WULF4/
 2rCJs1M5CrvZhbiJnO7Eck0=
X-Google-Smtp-Source: ABdhPJxT2Qem7xK8FMBf7L9oqeIzo9kSbIvbZEskaZoYi7GPZRzXLlBpaEcV3CmGbBmP3438ikSLUQ==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr24606051wro.246.1605057326400; 
 Tue, 10 Nov 2020 17:15:26 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:25 -0800 (PST)
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
Subject: [PATCH v8 10/26] memory: tegra30-emc: Factor out clk initialization
Date: Wed, 11 Nov 2020 04:14:40 +0300
Message-Id: <20201111011456.7875-11-digetx@gmail.com>
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
 drivers/memory/tegra/tegra30-emc.c | 70 ++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index d27df842a667..1df42e212d73 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1550,6 +1550,49 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
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
@@ -1599,25 +1642,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
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
@@ -1632,13 +1663,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
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
 
 static int tegra_emc_suspend(struct device *dev)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
