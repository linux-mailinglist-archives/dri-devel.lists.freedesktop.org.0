Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82C2AEA61
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698C89E19;
	Wed, 11 Nov 2020 07:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6652189D42
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:13 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h2so569213wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjtsQsCJihSVkHPvVSyTh7Vo5P6YOsjZY4JHUUyWhBM=;
 b=qF7inbuZED40ZBEQgZcwkqESS4IjxsImcS2LNNhro247GdyhS6mRzfBj2+cwCOhgB9
 4nIJmO+mxfdP6vrPAljdcRNmyebyAFGRENHzzyVGH3qCfMsLANCqNmhy7YZJoL1yTOS0
 RYsTdfsSftdj/R+USlBrsoDaC/UiplaNwmVKBu8umu8ur9d0iRXQUWDFpqB8yEXwvbTj
 NnFEzT3C3mcUapMKQLMDqLrZ8QN8naKTBNY07osHlStGlUr3z45FILOnlDmU7LdUi0LB
 NjyxgInWCLa79c6IywQRax0SxuDEfFbgLEMxyEt5PDOtLzyUUVHOapmvbD23JTAlg4bN
 z0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GjtsQsCJihSVkHPvVSyTh7Vo5P6YOsjZY4JHUUyWhBM=;
 b=TvMSrxEjpa0Wip8OgRucG4OT80mgZp2zFevPyQ1dxxqLXVdByOE5/Ih7eeUlNH3bZd
 62a5sUXfHEyH2hImkOZd2q+Msf47luVvuLmzOj8oJUbzOPpdADJyqLbE2/rw/kDOsqUt
 hPHkrjS/3k5xc2FC6oVw0nKH5sdCoRUpSc0y7d4/Cpy/kGaQM112BOWYK9e2KX0vy337
 cmHrL+mHt/djL4d3ak633Jl+hkJg5hdJ1DwSzNZYehzvcBjOueCgWJJ8CTLwNDdW+/s2
 bK0nd7Bm85AbwShhFCSTnW3U60ft4w5foFtHE+5UKzRQ9BcJyrsXj5Ruf4A6cWJ9LOOF
 ejnw==
X-Gm-Message-State: AOAM533KKkWwDxMy4n7PErtYvMldtUGbvQVzFPj50TZ2wp7gN5f4wrso
 Vq/E84t5C1o3chh/m0BNb9I=
X-Google-Smtp-Source: ABdhPJyZqr0B5HiYFrwPQUJcJTg6auyvSPy/3Lsois7R4I91PYn27QXinYePPmkAhhFSbVJzzb1LyA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr939369wme.0.1605057312178;
 Tue, 10 Nov 2020 17:15:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:11 -0800 (PST)
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
Subject: [PATCH v8 02/26] memory: tegra20-emc: Use dev_pm_opp_set_clkname()
Date: Wed, 11 Nov 2020 04:14:32 +0300
Message-Id: <20201111011456.7875-3-digetx@gmail.com>
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

The dev_pm_opp_get_opp_table() shouldn't be used by drivers, use
dev_pm_opp_set_clkname() instead.

Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5e10aa97809f..bb3f315c9587 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -902,7 +902,7 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
-	struct opp_table *opp_table;
+	struct opp_table *reg_opp_table = NULL, *clk_opp_table;
 	const char *rname = "core";
 	int err;
 
@@ -917,19 +917,24 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	}
 
 	/* voltage scaling is optional */
-	if (device_property_present(emc->dev, "core-supply"))
-		opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
-	else
-		opp_table = dev_pm_opp_get_opp_table(emc->dev);
+	if (device_property_present(emc->dev, "core-supply")) {
+		reg_opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
+		if (IS_ERR(reg_opp_table))
+			return dev_err_probe(emc->dev, PTR_ERR(reg_opp_table),
+					     "failed to set OPP regulator\n");
+	}
 
-	if (IS_ERR(opp_table))
-		return dev_err_probe(emc->dev, PTR_ERR(opp_table),
-				     "failed to prepare OPP table\n");
+	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
+	err = PTR_ERR_OR_ZERO(clk_opp_table);
+	if (err) {
+		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
+		goto put_reg_table;
+	}
 
 	err = dev_pm_opp_of_add_table(emc->dev);
 	if (err) {
 		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
-		goto put_table;
+		goto put_clk_table;
 	}
 
 	dev_info(emc->dev, "current clock rate %lu MHz\n",
@@ -946,8 +951,11 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 
 remove_table:
 	dev_pm_opp_of_remove_table(emc->dev);
-put_table:
-	dev_pm_opp_put_regulators(opp_table);
+put_clk_table:
+	dev_pm_opp_put_clkname(clk_opp_table);
+put_reg_table:
+	if (reg_opp_table)
+		dev_pm_opp_put_regulators(reg_opp_table);
 
 	return err;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
