Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8961F4F36
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E86A6E440;
	Wed, 10 Jun 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7A66E2B6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c17so24950754lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1xmJI2wEsKx15gxVFToDA8k277dA+aVdNRSjtw532Q=;
 b=jwai/ySvMG2SOpgXWptw9ExpQJHqPtNxxhpItbxsXRMG+cXLRf7VbMd1lpBsfN6/y2
 vkWlcvRWuhPrdBu8xOsY5m9Cwf7/Giy0OwSEX2wJRlnnuuZproLDgHkc++28MiP6dpdj
 IJilEBBb3GLS3Pr2Xr6AX4+79Wd1c4fp4gX4c+dBwLWXcTPHN89M8cNv9ygCs2GBFeAA
 eXo8pIswH/3vpJELo2UFYL4nmKTItqRF8jt7MM58TtB+TnLENgGwveQmSVwzq6t/lrcl
 NsZzGNat2XQZaXQRQD2/REqb9LdlXj/YLQ0H1bCzjqx80DF7QhqjFmIqIATlm4GMfoQ1
 VIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1xmJI2wEsKx15gxVFToDA8k277dA+aVdNRSjtw532Q=;
 b=ruJn1RrYZlBaFXZNNC4+69AlfvnvlrglhE/B4uE1Tw5gtWW6k9y227g6xEQNqW8+zj
 4x0uAfUxXdglPmvbGh0cDp+f6lrZqOH9/TrjEzgG2Qngmzx+Pds7nDgJrgaI6swtmLkW
 IpN5s6oFdGa+nPK0pPBgQOu+TRlIEX4kDWFa/AN8kjlGghGDuRP7ZW0lTIUdd0pN90uX
 m4eQrxvCljuez2KcIgXLTpt+GGNWNn6REnnWYbjXYz/CbcUyA943EbHi7tbiVaQYYWKU
 tWV0GSWa7kIDEcuScpsR2+rop+lC8zD8LZewPq7XXNyKyJvJHBUqoAwLG6gikjbpbFze
 k2vA==
X-Gm-Message-State: AOAM5334M080FoZYcXVBMBs66zDydN76kuvSXspPof6fEMLBY/MrXlnw
 64jLG41vhC55dL9/8lcU9+M=
X-Google-Smtp-Source: ABdhPJxgOd5E/XqEq6dnHLHSm3Vtx6kil4z4i6HE/DOKF9W8VzGStj+lWjbzv3Vk4apN+A9ZUJH+yw==
X-Received: by 2002:a05:651c:2cc:: with SMTP id
 f12mr682762ljo.329.1591708469801; 
 Tue, 09 Jun 2020 06:14:29 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:29 -0700 (PDT)
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
Subject: [PATCH v4 04/37] memory: tegra20-emc: Make driver modular
Date: Tue,  9 Jun 2020 16:13:31 +0300
Message-Id: <20200609131404.17523-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
