Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66904245D54
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69EB6E4FF;
	Mon, 17 Aug 2020 07:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59396EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v9so8114236ljk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AzqqsKlTIsKI+WxT+RXsQygXtSVSAqLrYwZmJLTNE94=;
 b=DnpQAdbhKIQvhGCJUiMtzMLFsEUCVFYhDtyao0O8CmRNuiU8bgqOEqx20RaCLZROe+
 pWNi/QlnMELpem+aW1gE2k5UAuHvyhQiH3II3NwlscixFJlAehP5xK913dQiLT5Iorab
 8Q/zVOccqKYZF57qdynjJXyH/bxaz5fTQhOwF+yKvVIkh46Z3FYRSaDLVG1VjAA79NRJ
 XTy40YEbsHZjpoHajJJc5dF0x6ZLi5xNa8dsJw3pT4+PQ1eg2yueLpZ5ASL44fYWnc4q
 h83f7bcmG4fft+0l2STGANN5VZzXUAP/lkjOjI/7NJgpcq6JIM0x/z4bp2JGYyEUepyt
 CQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AzqqsKlTIsKI+WxT+RXsQygXtSVSAqLrYwZmJLTNE94=;
 b=GRb9HLMlygqE+OlfoTZfpmtDRxD55yo5OybNku65tnw4cGt7xcbvML3RDmKfXnRxNh
 eWp9wIISmzSL8mER1jIdADBHePbAD/L7kp0TwlMD2xDiGbeAG1Ua/DWTxKmJ7b0rqZl7
 vk6Gktsaj/aRrKSAEXNMkq+9ir3w3StZwZwmmQpl9QPWrq0nBvl3bVVij/NEJ7u4WHiY
 GafcDTrezfVUCAtnGb/jVXV/v7DNjbgVW4o/tkeX4MDpuZ5ZE/DjPpK1GH0Oe2YY5u+V
 EBZ8kGFkGNtkWnJQ75Ayzy6Of5/4lR2yEbv3M1Vm+wZF7HLEXtpqbdB5xVl0USlRr7by
 7//A==
X-Gm-Message-State: AOAM531mHCm03hwgy9rNqUAkL3T+8cz536vPAvfBc6S2BkQHbKkTHXkp
 DDIFFP8FORmg9QkXE+ZnilxK6GYQ
X-Google-Smtp-Source: ABdhPJzjuZl+OgyrslWSF80X9s+m6CSaS1bXPxfLfgeKRWPgF2w9Ngkp8C82e1mbxQc8a6Oy46OLDw==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr125608ljn.22.1597363625363;
 Thu, 13 Aug 2020 17:07:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:04 -0700 (PDT)
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
Subject: [PATCH v5 04/36] memory: tegra20-emc: Make driver modular
Date: Fri, 14 Aug 2020 03:05:49 +0300
Message-Id: <20200814000621.8415-5-digetx@gmail.com>
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

This patch adds modularization support to the Tegra20 EMC driver. Driver
now can be compiled as a loadable kernel module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +-
 drivers/memory/tegra/tegra20-emc.c | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 9f0a96bf9ccc..7e0e1ef87763 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -8,7 +8,7 @@ config TEGRA_MC
 	  NVIDIA Tegra SoCs.
 
 config TEGRA20_EMC
-	bool "NVIDIA Tegra20 External Memory Controller driver"
+	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
 	depends on ARCH_TEGRA_2x_SOC
 	help
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 83ca46345aba..5aa3a1da2975 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -724,6 +724,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
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
@@ -736,6 +743,7 @@ static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra20-emc", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
 
 static struct platform_driver tegra_emc_driver = {
 	.probe = tegra_emc_probe,
@@ -745,9 +753,8 @@ static struct platform_driver tegra_emc_driver = {
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
+MODULE_DESCRIPTION("NVIDIA Tegra20 EMC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
