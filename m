Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5A45F1B2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DA46F965;
	Fri, 26 Nov 2021 16:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCA06F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r26so25480077lfn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
 b=TCD9cLoCNbfUnZM9J4HcmwXzAfE4L8q7phnym6pZ33wnza+OUwA0voHnXlbFX8BALc
 98huQvHMfRZhR6vs0iXkCJdDzPLwc5Iu+hxNfnAJnOhuly6FVmgiTFQv0PNbYTrY2rHK
 dXyOTzj2XWTpCS6APfNz7Hm9xKXXuqF/C+ZhAAm2IgEouLO7p3q6Mlpn1p7veF13LonA
 /7ZVdUUY7c6q4wvZ6+486FTu58keZbE7EBmxdkLoAiwTtH0JeaxWgQvf0AkdolivqHRy
 bEpOVWzuuV7+krtw1TWDsd1Sze10F/d3Wbvxxvs00NCVytod7kMqi7KRBBzLhKj0lu3v
 rHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
 b=bNZxIXOKZjHa2ALYHdihpGSPezSDmg/41g/iY8bqFmLEn6E48KVIQV2hvcJpznjQUG
 Vio7cks+FqZZ0LrRG84d7OT4a/fBJWFhp7yYNuEnA6y9oc37x/UiTxx5w4prOClV94oJ
 zW4YJK3ZbBg42kTVAw3bFy6xY3YA8Qs/OUJ1yaW+l+LgTLJuFlMYWpwvUAyjkX7yHQQt
 I/uofWKZkIj+pJYY7ikNTq3d97Zhb1GjFtMea7PuJYLUaJdUkJrdTvub1HLKXFZHtHrE
 kytOfmaIlrPwQkwWgR2s6rltqEa+tKyx6dY4gl5ucAsjVttVv7S+YmjmdvuXz5kzF6r4
 IsnA==
X-Gm-Message-State: AOAM532Zh509IOZwI7USQhXFNmxQzgeXx0isf8i0lXvOfa8CtbXCyum+
 ohVl8RXzrmR9H4s621Ncjkc=
X-Google-Smtp-Source: ABdhPJy2HOctdB6ar2RL70kTPxIThtcFWFugw3cBJPBAONKS4zeQwsXwB5N/38mWQcSQnbt2QPuv7A==
X-Received: by 2002:ac2:4e0b:: with SMTP id e11mr30573216lfr.208.1637943585591; 
 Fri, 26 Nov 2021 08:19:45 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 07/20] ASoC: tegra20: spdif: Support device-tree
Date: Fri, 26 Nov 2021 19:17:54 +0300
Message-Id: <20211126161807.15776-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra20_spdif.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e45e371edc42..6650875d2555 100644
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

