Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A71F0F28
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABED06E424;
	Sun,  7 Jun 2020 19:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0C56E1E0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:16 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so6813512ljb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pFrdABztThT716Jqq69x971kwm0U7felWA1j1wl/1bI=;
 b=k56xqon4R+K/TQIXYrna6CxZqeeBZXJUJjLkrXhbn/1IudCgzPhWq8iqFLm120YG7B
 BO7HMLeaqtrE/+cZumDn2VQaNZIjdAB+3Z/pfTQPAPnBVYEQFrUcdYxcU/u70G+mppeY
 QhrlBffFq+Ycn7SayICgYe/uaYJzlBsl4yLEMtKXm3fQa/mdND0okHb5TtJGmQumjB1Q
 32bFFqgcX2c2e9GeM+yMQIoGn/SVVQhx3NYikBxPJmOs3sQF9GLOY6+kznr2c8AkKpub
 ho6lKbeXMUZUWjiMRf5TvGyZRWtQRpx1O0Qn9XH465HY4Ew6osUvvZT8gU19aZgzWbQG
 HnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pFrdABztThT716Jqq69x971kwm0U7felWA1j1wl/1bI=;
 b=TKTC+i9paUYO/1xcCTkG1Zpqk2Ji1b7oeB+lKmOuBO6q4qU+NQ1vzGAKczqhIsu6zP
 wCiRX8i8cBUDlqCexGMbwwpEkDLYai1ogxbrnFri5005aaIFz74iGhhMf1cUS+T7ZeC7
 bvjSNulVk1UnsQIs53kNOyQXSB405AngCZL+e/U466sdqWWa0jQJjc2XnQXiJI4nAQib
 8d/YORmETdBcIW9sPK426DxHDlZEhdPolJdknJw6udVuzkmrWtUXlwMf6ANvPuQ684Ak
 RR2KD87Rxu3sS58fStw51dQWien2kkdeVsPLtaEg+xqPvtxC7ebzJifUW+ijkzCeyH5J
 4vIQ==
X-Gm-Message-State: AOAM533CDZDQE9I9oFpY4B1MqB8iZDUsoho6G3HpGfAweyij9Wdmk3OF
 UC2iji4TBbvx7XpDruJuavQ=
X-Google-Smtp-Source: ABdhPJyGSJXaUvZ/7BCEtk384hJS0GQy9Oe46xyflS+AiCq0x4jwKwnU8TG6cLBVse3aTYldcwl/sg==
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr9549002ljl.425.1591556234651; 
 Sun, 07 Jun 2020 11:57:14 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:14 -0700 (PDT)
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
Subject: [PATCH v3 04/39] memory: tegra20-emc: Make driver modular
Date: Sun,  7 Jun 2020 21:54:55 +0300
Message-Id: <20200607185530.18113-5-digetx@gmail.com>
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

This patch adds modularization support to the Tegra20 EMC driver. Driver
now can be compiled as a loadable kernel module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +-
 drivers/memory/tegra/tegra20-emc.c | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

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
index 027f46287dbf..035d9251e28a 100644
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
@@ -745,9 +753,7 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int __init tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_DESCRIPTION("NVIDIA Tegra20 EMC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
