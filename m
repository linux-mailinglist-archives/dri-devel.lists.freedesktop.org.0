Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD192408061
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5F6E07F;
	Sun, 12 Sep 2021 20:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810E6E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i23so11324609wrb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/fuQ9/4B7O6NkGtlvGWmoFCTTuIvWwpexDnS+rspmU=;
 b=KqnSWSQwDdW+LsvhctV39BvkSonyOFoR8QZGL7wOrdePQCSFcXxBl/w5qvUrkyWCTf
 j/cfCy5Iw/mulmidbJzcfnMT1d9vxz0lmUcn3+e2cllkjmFEu9TkMN2YK4jbXamBj8f1
 qckhs3v3e7W2vjUni0tk4wmjOxt6uJG4GbpATnfH3pGBcCQjmcQqfSYN+V09NCV9rcZN
 TacNyjSdgre93p6KLKixeUnN7Kw8F/V5phgXRtEHZ5TaelM/s5p//+bw4Ck3Outu2D/S
 fg3vzFHm1zZLJCFr4E+jI62feQVIpBbKoChYrjaPqZFNM2EHoXfjGJ67uJLjRyYmzPAR
 GhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/fuQ9/4B7O6NkGtlvGWmoFCTTuIvWwpexDnS+rspmU=;
 b=uJPQAKL1yPm+M6LK2kSzLvSfkqUj6iqODPWYe8Pc9T6E+csGfYfoYp+IXnMCT4qqpo
 D0+Z/ti2JRp7eH7m1Cm3CGrH0ykmx0qa7JXBiuGsLMYsjchq28MENuNPK6uBg8TEsNe5
 4Ue1SdybszG3agRHGMhU+vjy34zl7SEO4zFbL+ZtK37MifKxMkJDmuWtS9DByb1Pq/Ni
 qENsrhxsw93Y9A+m0Ug8dOgdik3d1oAbUkFaQBoxGvsJIqrwRUjGcAs45w5iMGgZlJGH
 IouuOMh2FwTYE5FXWzUhIxMc4/wIoFZuN6i1KQMa3ONu9WtmAghDzz3L0VC/pSb3UWAV
 8xVA==
X-Gm-Message-State: AOAM531YgbISW/BvvHLq233zc5jr2dEyNiLohyF7ZkVi+Ttai02hCeIg
 YPK4LEGNsHyCYOZGTbvLgPA=
X-Google-Smtp-Source: ABdhPJx2T8jeUvLIRwUiWYF42kYGMTgqyMxMsfziWllGOoP3lQwH9NfZN9gWz+QVvhs3feNVef169w==
X-Received: by 2002:adf:f911:: with SMTP id b17mr8988366wrr.412.1631477444652; 
 Sun, 12 Sep 2021 13:10:44 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 29/34] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Sun, 12 Sep 2021 23:08:27 +0300
Message-Id: <20210912200832.12312-30-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5e1fc873bf8f..74de84a014e9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0

