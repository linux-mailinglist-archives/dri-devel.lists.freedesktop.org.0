Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EC4667F2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC386FB2C;
	Thu,  2 Dec 2021 16:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261F46FB21
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:24 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z7so38452322lfi.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=VKHmJthUvjXS59BALwb+ATthridW7xhHVa77qVsv2kC+AI1yk0gqoD7e7ukv/VdpgE
 eopIG8eEd/6R1JvOAEEMrOIyMyhtdTq1mHZsVA8ZtzZ+EK6FX8JC7mUrCiyqU0/3oHs3
 uSVimfLQzh+HuVn/l9jwjsiToGPQGOTPJrR+sUEXvpnydyvUi7IwPVr8UmRiCIZ+A0XF
 zmOH65X+Sqo+a0PTV2+8HOncLJ50wBUOqp1JIoTOXiKiawqGetLW5doVAxtq8jXdfdUf
 UloDRnGPTYX4CBrmG0xb4F2Kw1NSa+rYE8xI244v9jl8/Fob4k5tBG36hOXSR+hvt3jN
 TW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+cwXkLuYTguZ/egF0PR3HKcbjBSFy6IZ25EC5llUN0=;
 b=dcRYUwFM9pRAkl9bh8f8dIqXF4XRbZ7RdiqKv90tIMTJ/uNyW5iNs2LNvdWErtSDK/
 TozjlhnZkYw7l2yJmjAY+11mfKIyBSeMtOMGezsrv0joT5WNfkupOaUkLwa0TNMuxvBv
 aIHmOEUsT5SYbq0jjCLqUKStPDPyH9dSpQU/9U1qFFe4nE/SRmLA6WbIjc07dCSTH4oz
 mBOBgmGHJ1E2AOQL00Psc0IQ/lfTBBmAAH9olB/8F0Pc+Pqo/yTc5XAZyOl4So+YLi2P
 3qv5F8QEKj3kASuik3EEaZiVexpf8fuTooC9Kz5ipevlYzGKK7ApLALghFEumllwV9hA
 mshQ==
X-Gm-Message-State: AOAM530jWxAAmtYDomKAB3F009FGSJfYtGfs6mXr4WkYg11FAdftj6VR
 hbO0iUx6DPkCjkVV6AZmxhM=
X-Google-Smtp-Source: ABdhPJx4sY5bfWAJiUlJjt+ZI84qUzYJ5TudTm3UCnZQn0koHijjsXA+YonMWOeM5aRlqg5oafHiOQ==
X-Received: by 2002:a05:6512:3e1e:: with SMTP id
 i30mr12327554lfv.560.1638462322498; 
 Thu, 02 Dec 2021 08:25:22 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:22 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 07/20] ASoC: tegra20: spdif: Support device-tree
Date: Thu,  2 Dec 2021 19:23:28 +0300
Message-Id: <20211202162341.1791-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
that time. Revive driver by adding device-tree support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e45e371edc42..801784915004 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -270,7 +271,7 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
+	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		pr_err("Can't retrieve spdif clock\n");
 		ret = PTR_ERR(spdif->clk_spdif_out);
@@ -340,10 +341,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 			   tegra20_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id tegra20_spdif_of_match[] = {
+	{ .compatible = "nvidia,tegra20-spdif", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
+
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &tegra20_spdif_pm_ops,
+		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
@@ -354,4 +362,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

