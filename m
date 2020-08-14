Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1C245D1A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF546E451;
	Mon, 17 Aug 2020 07:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FFC6EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v4so8141935ljd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIrGwjD1iHBjbgO0XtrpSwX/BLmgL9dZfCne4W2SiCk=;
 b=LbtCfTO27eokMwsq2DXckd5k0TxggqW33ku8u/msDCQTtqigGb+PKkahJ7BkG7H3Rr
 tMG9CtBMyGYm9JDDgPZYtf84O1xlXVQvbJiu+sy5emWf5sU9I1SF0PNZlSzIkbcRTbim
 CMmEjTpVYOzx/YY65/BxCw4dOrqi1sRxqNI5LALUsAqRCOoeSs6xYimLqipJhqlzv44r
 UBOizpQ8+bTHavLZcqiTgx6/5IEm2sanrwV+FPdUx3m6BDadbTrnXMD6dx6L55iS2j4g
 wPKKFEu1KMztU0sIRd2XQAtDBtg4RSV5u2UuJTqyDk1pX9dFTbI5VveE25HFAC+ouQtZ
 pE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIrGwjD1iHBjbgO0XtrpSwX/BLmgL9dZfCne4W2SiCk=;
 b=kur2fxJwxT5fTbaxSZqMVrg9Vir2ita+ykbhop2rL1fkSx4qVNgvxnH+SvX+OY7YO7
 f4VtrUEMGNNNu9I2cWLI5e9EPVXDROWwgTJ3IBdZHm2mkztfgaomPzqdetcpBNhpWcyZ
 RoajcmaT2XWAFLIGn+rCL56xDmNYifU3azym9juBzHTjwhpxMTZ55uGKtg27zT8xABkP
 bCRX5FrdkbJYJ9YxxcqRFuk8TJ7pn56dxxUJiDR97buEocUDzu/xKk0/YN2nNt/cFf2N
 hNNwII2eCKkQYF1Pvvsg4PieZQZjmwNWRp/++m+ug6UJv/wIc9fhM8pkZImO12rWV5AI
 5bAg==
X-Gm-Message-State: AOAM530ujUQPK6Pi98khg2zIX5OkkcKNS1E8g3jRACVcmB0HlyQ7q/EO
 /X+KtFthCSrSV1Nr+gCK+30=
X-Google-Smtp-Source: ABdhPJwsGNdqaiG3qjnWpdDDeJLZEKD9805FDw+vSZ0mlkZ69bjVXOmKffJdaqnZ2xEYkCRC/euxdA==
X-Received: by 2002:a2e:9f4e:: with SMTP id v14mr128407ljk.72.1597363626437;
 Thu, 13 Aug 2020 17:07:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:05 -0700 (PDT)
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
Subject: [PATCH v5 05/36] memory: tegra30-emc: Make driver modular
Date: Fri, 14 Aug 2020 03:05:50 +0300
Message-Id: <20200814000621.8415-6-digetx@gmail.com>
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

This patch adds modularization support to the Tegra30 EMC driver. Driver
now can be compiled as a loadable kernel module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +-
 drivers/memory/tegra/mc.c          |  3 +++
 drivers/memory/tegra/tegra30-emc.c | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 7e0e1ef87763..bd453de9d446 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -18,7 +18,7 @@ config TEGRA20_EMC
 	  external memory.
 
 config TEGRA30_EMC
-	bool "NVIDIA Tegra30 External Memory Controller driver"
+	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
 	help
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..772aa021b5f6 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -298,6 +299,7 @@ int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tegra_mc_write_emem_configuration);
 
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 {
@@ -309,6 +311,7 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 
 	return dram_count;
 }
+EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
 
 static int load_one_timing(struct tegra_mc *mc,
 			   struct tegra_mc_timing *timing,
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index e448a55cb812..f3082964cfb6 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1343,6 +1343,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
 
+	/*
+	 * Don't allow the kernel module to be unloaded. Unloading adds some
+	 * extra complexity which doesn't really worth the effort in a case of
+	 * this driver.
+	 */
+	try_module_get(THIS_MODULE);
+
 	return 0;
 
 unset_cb:
@@ -1393,6 +1400,7 @@ static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra30-emc", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
 
 static struct platform_driver tegra_emc_driver = {
 	.probe = tegra_emc_probe,
@@ -1403,9 +1411,8 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int __init tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra30 EMC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
