Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41419754C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7628B6E178;
	Mon, 30 Mar 2020 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB4789F38
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v4so12678085lfo.12
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4nV204hC2fwmDzQEKB7qIbLyFjMrEPQFeaJnZkMKlE=;
 b=R7kFkFZL6GQa6/p+lME2mLpX2W5dglEo3Y4GeoORp/vqCkVpf6z+ZPv39VaO1xXro4
 mQsaenLZx+2m/AT2NLRsaKlD8CBYxhTQgQgzHClo9305BMfGFgJxD4dkgzyh15zGWPCv
 /IzIQ00ewvfY0d063gwLr52+/gRpcmjkRIwDc2tqhtjLLIbHKv0FtGFI+LjP0HsKg+rf
 Rl+Zlv7YoJdhxKyyJ+g7Mv9QTB3wNZMQW0LtU6TlddjA8WCJ9ko4UnHy06YG5xtWVFku
 RfXAkeNAeblEcDc0KDdlgGHfUG2mmrp8FCN7juWdik7Qa6m1MbxKWSgtCBETnHrSi6cn
 52cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4nV204hC2fwmDzQEKB7qIbLyFjMrEPQFeaJnZkMKlE=;
 b=q+bXdpUngoBCUDSNZ2jHPdAhlD+Dp9u+xgs6LpkMnlnAKvMURttSZ2AXUdGvtR9CZP
 nH0Nd08kRcSNxmiGQ2M3bAl9qSR3W/Fa7lW2f+OY5V3lPqWTDSpg6ouNVQc2OtzAfeeA
 Py9VoHoN+5yuYfK356E0nPMKR9kQTU04tlWJZ5A0v0n8sTHadjdKClcY/+2z0v1BMjdY
 uVgngAGBhQDi3jckafK0xDJIajkfkCNdqY0y5pZf68fk1dI332UDU5D7GLD/cF14G9fc
 7E3Yr9LPWUn8GQ72Rr/VnTyIK4n6z9KG7mTeixzE89biD+Nf0G/+A+sv2JJOyI5K9E1Z
 xQgA==
X-Gm-Message-State: AGi0Pub2n1ZpGVeVsO08gBKfKftmMbN3tstFbIceC+GcEdV/Z3Hk5R2r
 +fBypdBP0qrq5i1ZPkbX6mU=
X-Google-Smtp-Source: APiQypI0tJdoYescE/nvG1PxhKj3scyF/qbpV/MJqUUuemjN7l29mlKc0xbwtcvYsD7sjXssHhQOsA==
X-Received: by 2002:a19:ed14:: with SMTP id y20mr6637613lfy.179.1585530587814; 
 Sun, 29 Mar 2020 18:09:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 13/22] memory: tegra20-emc: Continue probing if timings are
 missing in device-tree
Date: Mon, 30 Mar 2020 04:08:55 +0300
Message-Id: <20200330010904.27643-14-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

EMC driver will become mandatory after turning it into interconnect
provider because interconnect users, like display controller driver, will
fail to probe using newer device-trees that have interconnect properties.
Thus make EMC driver to probe even if timings are missing in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 37 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index ef3abc18a3f4..3a6eb5cc5c29 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -383,6 +383,11 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	u32 value, ram_code;
 	int err;
 
+	if (of_get_child_count(dev->of_node) == 0) {
+		dev_info(dev, "device-tree doesn't have memory timings\n");
+		return NULL;
+	}
+
 	if (!of_property_read_bool(dev->of_node, "nvidia,use-ram-code"))
 		return of_node_get(dev->of_node);
 
@@ -451,6 +456,9 @@ static long emc_round_rate(unsigned long rate,
 	struct tegra_emc *emc = arg;
 	unsigned int i;
 
+	if (!emc->num_timings)
+		return clk_get_rate(emc->clk);
+
 	min_rate = min(min_rate, emc->timings[emc->num_timings - 1].rate);
 
 	for (i = 0; i < emc->num_timings; i++) {
@@ -656,13 +664,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct tegra_emc *emc;
 	int irq, err;
 
-	/* driver has nothing to do in a case of memory timing absence */
-	if (of_get_child_count(pdev->dev.of_node) == 0) {
-		dev_info(&pdev->dev,
-			 "EMC device tree node doesn't have memory timings\n");
-		return 0;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "interrupt not specified\n");
@@ -670,23 +671,20 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return irq;
 	}
 
-	np = tegra_emc_find_node_by_ram_code(&pdev->dev);
-	if (!np)
-		return -EINVAL;
-
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
-	if (!emc) {
-		of_node_put(np);
+	if (!emc)
 		return -ENOMEM;
-	}
 
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-	err = tegra_emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
+	np = tegra_emc_find_node_by_ram_code(&pdev->dev);
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	}
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
@@ -699,7 +697,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq, err);
+		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n",
+			irq, err);
 		return err;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
