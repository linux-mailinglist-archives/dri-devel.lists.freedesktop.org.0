Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD31B1F0F13
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6C66E3EE;
	Sun,  7 Jun 2020 19:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DFA6E391
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s1so17784837ljo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/aMBkNYS1l8Movaag8RDV924EOkO8H/4xoiXZl2WiM=;
 b=GTlefWECu/G29LjpCAIpxjCOUFiA8eAXuiWyHiMbICAos73tv92mfFafb0TW5OvmQO
 CZ3wah4xZcJOe5t6GIlzYpN4m1UOskyr7Iybv0Rin7JLkxGc9BZqxgX8IW7GeAlscrP0
 ziI0vTRXlxzHIDk7xOsD/Hg5FAvJYUXw/DwA50k2x8DimEndkp6GZYIJ/Yc84EOZo32G
 iuKgKqr8J/atODjv1abhjYZfHe+5JEazr7arX8SI+fJ8Jy5e2Rd7pjmAAt09ANEegYJq
 x5buSn9t6r3k3o+KLsg4Dt4pcCRpua2Nei8qqCRO8kxkbBSVp8b/upmXTzeJ4IUlvJHl
 8hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/aMBkNYS1l8Movaag8RDV924EOkO8H/4xoiXZl2WiM=;
 b=bcI4hqARS0b4yjPfiKYqeY8ASXT1GarVmbiGM5QJApF/zo1PTH5/iMRxj3C5WlLkZQ
 ScMDhjwEJC8UW22W4rwDqZ/1rf3BlSwgdrsh57ccTnkanyKIKsTxzd1zHAPERiLa/M+q
 71qDQIa9Mh6fP7WtZSbMmXWscsjawBQn8u9kvF54HDl2KSOJH+M7V3nNhb41kSh5H5l2
 I9JQ0XxjHSfVXWIOV4wB8NCfhxFLa1oNiW8fUVytSGIwp2g0UkRTmG0wUQ3LQhPivfMv
 anp1xOW4dic+jk90rNHvwjbaeleYDVBaCMlAk+NXpj53ZNwjgRlJOUMbh9qSkICfEEZ5
 gotA==
X-Gm-Message-State: AOAM5332xoRXx825ONr/QJpGfy9dCQfjSJE7pgTGjg2lKjEW9AK0yPJ1
 u+hMxDd7MRvjWXXpmrkgThE=
X-Google-Smtp-Source: ABdhPJyl2mCiNiylo8SFzh15mikFwk4nidSsQRH+DDDM7Vcu+uuHrcsG0hfKfbwp27Pa/rx/yHAxyA==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr4441620ljj.166.1591556235980; 
 Sun, 07 Jun 2020 11:57:15 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:15 -0700 (PDT)
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
Subject: [PATCH v3 05/39] memory: tegra30-emc: Make driver modular
Date: Sun,  7 Jun 2020 21:54:56 +0300
Message-Id: <20200607185530.18113-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
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
 drivers/memory/tegra/tegra30-emc.c | 16 +++++++++++-----
 3 files changed, 15 insertions(+), 6 deletions(-)

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
index 055af0e08a2e..205d8053fa75 100644
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
@@ -1403,9 +1411,7 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int __init tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_DESCRIPTION("NVIDIA Tegra30 EMC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
