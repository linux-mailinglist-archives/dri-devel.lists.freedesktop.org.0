Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD402987D4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547F66E845;
	Mon, 26 Oct 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D006E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a7so9393648lfk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUjUPaHt1SM/rbNjaaosf0keIlgfJghzEnTIAKmBLW0=;
 b=baiADdmvC1n8u5S9oCySw/VOnvKHAup04huGK6DB3va3DHCRhu+NENJU3rhUDVz+ll
 T/qKn26rjsp5r0Iqv/TGa4vW59bwm79iIZf1hbnyn7jYwZq3zJU75KYPwq5JiUKyijxw
 C1XePTRy95fzAgYXjTrMXN2RKA7UDf19PVBKV377UEEcYAGP6eQRQHyJuImfaSM74ZZ9
 WOvI14zDyJ9XqwQuHUoM6TG6jxDX3xmiZmV+aK1Dk3ooarr+JggfzJ+2NBdfFUmwH0Co
 1LiBfRQAIobPZw6ngIwtItpMQBZBS7Zc0gXaSQsgxW3PClq64RdKpC7HWH48Nh13S645
 SNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUjUPaHt1SM/rbNjaaosf0keIlgfJghzEnTIAKmBLW0=;
 b=Evx3385aga6n0J5kx7A8VmU2BpJ13Cvnjx8PUJz3DjwMzi+kjEKWByqZhv9Ap4LgXc
 K62dwskOgK1jDZOCqZnXdP6zfu1LVT3/mn5nxEbc3FIE+eius7HAv2+Bj3xs0V7C0EAU
 ImeaTYkk0E+W70ifUduYDPJtpyHUSx4bmCiGeNqZA50APrU+usDKYcWnaz9JqJoBRruO
 XOfkHCXAnFNvWhXYKz7d0uJXleSUjVhMtVBSR5CKhYM/U7PmNPyRsTPTwyKdaxqmzE+2
 uHS23egmGSxU9wi3Wkrs/4Y/ppQDqBWaigRt20sY6jqwRHfMMerOI2ryALNpHvRcX6Mu
 7CZQ==
X-Gm-Message-State: AOAM530A0RqDrGqriwjp9QrBJZjrC3013DF1I7ek2bDQMDqD6WEadBS2
 4MjEEmnsJ4wWMA10rmFaSFY=
X-Google-Smtp-Source: ABdhPJxth3ZWnKpchePBQUQe8A+OZsbsAJLioxg4K82Z79/f8b9W7z7GR5YS5NNWo3d7POb4I9QdKQ==
X-Received: by 2002:a05:6512:20ca:: with SMTP id
 u10mr3869843lfr.247.1603664302677; 
 Sun, 25 Oct 2020 15:18:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:22 -0700 (PDT)
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
Subject: [PATCH v6 30/52] memory: tegra20-emc: Make driver modular
Date: Mon, 26 Oct 2020 01:17:13 +0300
Message-Id: <20201025221735.3062-31-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
index b38e5255effe..ff426747cd7d 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -9,7 +9,7 @@ config TEGRA_MC
 	  NVIDIA Tegra SoCs.
 
 config TEGRA20_EMC
-	bool "NVIDIA Tegra20 External Memory Controller driver"
+	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
 	depends on ARCH_TEGRA_2x_SOC
 	help
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 027f46287dbf..0baa6590adea 100644
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
