Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196AF2A78DA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E16C6E9C5;
	Thu,  5 Nov 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B26E235
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y184so26066282lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ontILFu87u1f4MUNSf7ISJYhooI1Fl6nxuqtZ8MK7KA=;
 b=KpiAXbIN9xyIT49De3HrEvU5DGh8CkAdeTEamjiprGA+wcYsFBjI7VaEwyQPpkJ0AH
 UcyWqBFvUp1Mi9/k+nOg0MXFukdp0qAlfHvpTMoL+qOyT+riM702VbkA7BwBl6WNydlA
 ycrTD1A/+45wJ0xinDRB8U3yXvEckk0H+vD4djxHznRHV9VNo22Xys6qNzKk6rlOuMeM
 OhFLTlyybkJ3hNdz/w91rbNUz36x0KXzyyGeCedtZjyesOeMyEV9J3A1CvMe2QDe0WHX
 XJAUu8XGCa41g/+o/TS+Dg+FFZJxCmQbHDhlJ01XTBCoZimI+uafm2pG7o4xw+eBaNdA
 Fazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ontILFu87u1f4MUNSf7ISJYhooI1Fl6nxuqtZ8MK7KA=;
 b=h1sR5HKO2smMYsgcId7Bty0q+VnWIoEMArcXIUIfKPXcQ8YKgVuOtz69CpcUX17VuE
 PcAobdxQQC6HfKrUQCnUDeFDdsTmplbinRvgOyj7ateM83qTyQlA8JS2qb25QsAT90d3
 N23/BdztUW0/iX98t382+qh1Sw0GMamMtLknuGU4MMgpY+3SVvrnHYdZ92qAT1+gN06G
 wOMmZGTK3uBS1hguh5OmSet3EG0nB3yvpvAdRaNo1PaIxGfJ9dB+4UEyVzjqY5M2p95X
 uKhnd7rjsP0cVOam16QZEaKeSlqOwLgMoiDQnAOQ0jM05TxZgmmxalYAEXzu40b+7orK
 He/g==
X-Gm-Message-State: AOAM531eghIua0zelSDZGac1ix14C2ngTdhYDu6+Qun4Ishk3lFoTJ4s
 w04Bsuv0Tjb9tMQ1Tfr1zow=
X-Google-Smtp-Source: ABdhPJwFwRfM8+FLmXLSCezu8zR7YUZ+l+xLpkCbgrgY7ovwtYaZEuVGHW6YCQ0T4DaEpbT7+RwT4Q==
X-Received: by 2002:a19:8605:: with SMTP id i5mr5409733lfd.356.1604508604974; 
 Wed, 04 Nov 2020 08:50:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:04 -0800 (PST)
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
Subject: [PATCH v7 29/47] memory: tegra: Use devm_platform_ioremap_resource()
Date: Wed,  4 Nov 2020 19:49:05 +0300
Message-Id: <20201104164923.21238-30-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

Use devm_platform_ioremap_resource() helper which makes code a bit
cleaner.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 drivers/memory/tegra/tegra20-emc.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 35dbceb7f841..ee8ee39e98ed 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1179,7 +1179,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1189,8 +1188,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 027f46287dbf..5ba4e495bfc3 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -654,7 +654,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	int irq, err;
 
 	/* driver has nothing to do in a case of memory timing absence */
@@ -689,8 +688,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
