Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F2245D42
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C422389DA7;
	Mon, 17 Aug 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51606EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m22so8090882ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSEBi5t/1eWk9v8pfAjD69qdXwECFUtZk9QQF5NKtbc=;
 b=r8XC1uLiNnkeMxT5jfdRxcYhubnseQuxIrcuYOdPtmdaOUGD671s9Mfkp6A9wYGt5D
 Lrgab0YOqlQoRtsGSlOgD/03cOyUQdu8iLJjKBRDQlxedvv6/ViFhXTUpSDf7k31VFX4
 ATne1xkPNOYwEco/qDU1ZTSJ9nGSmtumJZfdL4JuR2d7VowgvrLA+mVJVdtY0UEAh24N
 2lO+5J2GxZIp1dQtjPmjchVvUtA8yn6jKV1VDyGxSSNvk0IeP6ef9Y/7TyhPx6hSIe7C
 FSKDdA6z/j+zdGwbFDG8ILynmXGFlYZ0adHS75Igpzskpbrk0nxMoiuZzKkT+AiE0ToW
 gW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSEBi5t/1eWk9v8pfAjD69qdXwECFUtZk9QQF5NKtbc=;
 b=PAACoyJzmN1FLDWTTjnD6Qq610Y131uufRhZDivhTxNoMi7i/qOZf5Ka8Kj6WLVLFA
 u4650E7MkXR5hFuL0nwkxsmPf3o8ygSdTBwduNxf1um6Ga7gs7VL6Nr7YVNOjabqtqVA
 S3LV81nFzFAhNafIlyAR2Zvg8Ays/jeHgGE+1usGlkvxzXwxw+LHGoTSUU6MmRdPV2lJ
 GgC0yU8nISHrol1onhXSiMua4UodaLoAYmsqJQ1cXD0u4pXavUbuLH4AWyXzNkp1bnS7
 wnk9e8iFVkx6meV1KGC8JZ5HlePEX6wrIy5RbKNwyVyw8QrSSXO+EyoXbJ2GzyeLUOqQ
 c/yA==
X-Gm-Message-State: AOAM530zuXNXiSaoCB0QFA6J946HLGBHwGM5ijoE2keXsjPQOQ0+3S4u
 rZDfaDWU12T2hzBKSHAnqGY=
X-Google-Smtp-Source: ABdhPJwP6MWMSylZ6EWHBUyEkh77vK1pHLi32W8cHZCx+9E+VZjNPW94F78XIa1PEjLWMgxfDy10SQ==
X-Received: by 2002:a2e:8084:: with SMTP id i4mr101890ljg.447.1597363631084;
 Thu, 13 Aug 2020 17:07:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:10 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 09/36] memory: tegra20-emc: Initialize MC timings
Date: Fri, 14 Aug 2020 03:05:54 +0300
Message-Id: <20200814000621.8415-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to add interconnect support to the EMC driver. Once this
support will be added, the Tegra20 devfreq driver will no longer be
able to use clk_round_rate(emc) for building up OPP table. It's quite
handy that struct tegra_mc contains memory timings which could be used
by the devfreq drivers instead of the clk rate-rounding. The tegra_mc
timings are populated by the MC driver only for Tegra30+ SoCs, hence
the Tegra20 EMC could populate timings by itself.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +-
 drivers/memory/tegra/tegra20-emc.c | 54 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index c1cad4ce6251..5bf75b316a2f 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -10,7 +10,7 @@ config TEGRA_MC
 config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
-	depends on ARCH_TEGRA_2x_SOC
+	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5aa3a1da2975..a02ffc09c39e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -15,12 +15,15 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
 #include <soc/tegra/fuse.h>
 
+#include "mc.h"
+
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
@@ -650,6 +653,45 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static int tegra_emc_init_mc_timings(struct tegra_emc *emc)
+{
+	struct tegra_mc_timing *timing;
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+	unsigned int i;
+
+	if (!emc->num_timings)
+		return 0;
+
+	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-mc-gart");
+	if (!np)
+		return -ENOENT;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return -ENOENT;
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return -EPROBE_DEFER;
+
+	/* shouldn't happen */
+	WARN_ON(mc->num_timings);
+	WARN_ON(mc->timings);
+
+	mc->timings = devm_kcalloc(emc->dev, emc->num_timings, sizeof(*timing),
+				   GFP_KERNEL);
+	if (!mc->timings)
+		return -ENOMEM;
+
+	for (i = 0; i < emc->num_timings; i++, mc->num_timings++)
+		mc->timings[i].rate = emc->timings[i].rate;
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -721,6 +763,18 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
+	/*
+	 * Only Tegra30+ SoCs are having Memory Controller timings initialized
+	 * by the MC driver. For Tegra20 we need to populate the MC timings
+	 * from here. The MC timings will be used by the Tegra20 devfreq driver.
+	 */
+	err = tegra_emc_init_mc_timings(emc);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize mc timings: %d\n",
+			err);
+		goto unset_cb;
+	}
+
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
