Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF3464247
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C86E5C1;
	Tue, 30 Nov 2021 23:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00A06E578
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:23:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 13so44200499ljj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8oXDZz/nBiCoTxlA9cxo84oljRiezPiTcqnco4cDqBk=;
 b=XLJCgMVTmKwMDnr4RG5eYQpE9FsJM2y9fVDdPVIAH5kcazxZjIUW2SpduflsgGc3eB
 fLA3MbrcHO4RHDW5OkjazNWvA9hFc277AMv4N7pHrO7L1dnUHYQLBUdAPwEwaw/t6NvW
 hs/XuA+I5O2h55OwBE54dHrKZ2nU3IasUtX6kfoPfh0rYu6q9cmMxZsEsdIdTczjXLuG
 4+t50E20QynLHZbSg/ycbMWdatMbiTzUgoz8N+kJ1ptotFylyMa+GedCFpK/jbVmGKn6
 9K0ZXvSlcKUp6YhyKOg/MSwMH8LpC1CLDDh5R9GrSWgffH9SmiqS1mGvl64fn84K25r7
 h0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oXDZz/nBiCoTxlA9cxo84oljRiezPiTcqnco4cDqBk=;
 b=zygUP6IqKJDRol5OQ6t6UQ8DenwihXGeM9FTxymuElo95SYwN0QBXAOX4kizIuRwNE
 PghbmWWUmMUDD09iXJzl697jXRVnqCZSmwKX6jHRwttWONEn7kEPv2vWaXdQprKmLOIg
 02ObOPyk9hcNfU+572kpXqUC2KhQ821UajL9tC021GB4PbE4d1RupCQPWYHtOpoSJ5kB
 Uy/Zv/JeMnL3rZHRDHnANl0OSZ/zFpWFBWw+Ry/byGMLwZSnAuxC+wb8qIL+O2F7zMrf
 SgcPMCobj5njkFlDPGJWwrYLen/MrULnP6dy9ai9pZU6POPnlgZaSBFzVtIF4NEgfmQa
 LXAw==
X-Gm-Message-State: AOAM530gCK7cuJn4YzUOF8sBgNMA+1CbySncWyy5rNfpIbSync7PteiZ
 pBGKCmkni48h73lRKH22x9M=
X-Google-Smtp-Source: ABdhPJwhO36R3bhfl68pi/e8OJisT16/7YFpWDC1P8eGYpr3I9krZ+BceKfz24DQI/E5GNm2WLZwlA==
X-Received: by 2002:a05:651c:1024:: with SMTP id
 w4mr1886130ljm.154.1638314635334; 
 Tue, 30 Nov 2021 15:23:55 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:23:55 -0800 (PST)
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
Subject: [PATCH v16 01/40] soc/tegra: Enable runtime PM during OPP
 state-syncing
Date: Wed,  1 Dec 2021 02:23:08 +0300
Message-Id: <20211130232347.950-2-digetx@gmail.com>
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

GENPD core now can set up domain's performance state properly while device
is RPM-suspended. Runtime PM of a device must be enabled during setup
because GENPD checks whether device is suspended and check doesn't work
while RPM is disabled. Instead of replicating the boilerplate RPM-enable
code around OPP helper for each driver, let's make OPP helper to take care
of enabling it.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..35c882da55fc 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/of.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
@@ -43,6 +44,7 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
 {
 	unsigned long rate;
 	struct clk *clk;
+	bool rpm_enabled;
 	int err;
 
 	clk = devm_clk_get(dev, NULL);
@@ -57,8 +59,31 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
 		return -EINVAL;
 	}
 
+	/*
+	 * Runtime PM of the device must be enabled in order to set up
+	 * GENPD's performance properly because GENPD core checks whether
+	 * device is suspended and this check doesn't work while RPM is
+	 * disabled. This makes sure the OPP vote below gets cached in
+	 * GENPD for the device. Instead, the vote is done the next time
+	 * the device gets runtime resumed.
+	 */
+	rpm_enabled = pm_runtime_enabled(dev);
+	if (!rpm_enabled)
+		pm_runtime_enable(dev);
+
+	/* should never happen in practice */
+	if (!pm_runtime_enabled(dev)) {
+		dev_WARN(dev, "failed to enable runtime PM\n");
+		pm_runtime_disable(dev);
+		return -EINVAL;
+	}
+
 	/* first dummy rate-setting initializes voltage vote */
 	err = dev_pm_opp_set_rate(dev, rate);
+
+	if (!rpm_enabled)
+		pm_runtime_disable(dev);
+
 	if (err) {
 		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
 		return err;
-- 
2.33.1

