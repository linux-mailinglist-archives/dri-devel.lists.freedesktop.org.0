Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4C197541
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E489FF7;
	Mon, 30 Mar 2020 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A2889F19
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r7so8639977ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mKtQtW5d+QZO5sS4d1TUhWoxitfV+iMW6pt/UheZUU=;
 b=IpN+1WW8ChpXXkajbJachp67OlaAqUuv/Zf20DrTCZHaySBU2fAlUgIwqIHczpK8qX
 +alZPRKVhBmDxBRSkDeVJx1pyCL9DS4AlnNYeaM8ZSBbg2v1/H+yBAki8/3+bomrgcsp
 PuutNcuikmjNfan5jYP/KkZ7bmSMMDpawtswfi+4UeR/pjKVkLjHeGukwhGRjF8QokQM
 aBe6Ybf5NyRAur7XkkxgzZ6Sb2r+FfGMJMRHBH0/8lxERqbKev9S6NdEU+Ks2QJnvL6d
 /Z4BmRD72wxGmVPDnVj8xQq1ekMLRO7NL4ESIm6Ts/wpmgHRIN5tvVNUY/53nX7bMvNp
 IdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mKtQtW5d+QZO5sS4d1TUhWoxitfV+iMW6pt/UheZUU=;
 b=lDNOfMaYABQpbI6capNieXIdHE/hvThh6TL0av1gMbbCBGtDTUrewYGstWZP4kGckj
 78vWDD1NUFUF1ojXMxWlbFoC7mfnoa6qYbG5XM/rSrEdSIPp+8Nwn5PrF5ddpadb/OlX
 qWpPl6WQ9vRkcww1nByNLWsWy14UvseV3bcq3Xm1OWTOabEglTDPaPXJInVCTain9YrY
 CAH568XON8teSaloe2ndjVDba54Grpt2ATyXJz8uLxjir/47pdvC1V6Y8UnTnYeDaBCT
 cyg3LOkc30c4j/IE3N4jeMBLH/WUQM9OBzWQ+Z+G3/a2FU9lON49RYQtfkRDHsIvLs50
 Y2BA==
X-Gm-Message-State: AGi0PuYwK7DAe+C9f/SwWOl9X/+kluY2aKq+8V64hAbY/RqwPI4DabI1
 ec+sS1T+WItawmuFU28KgGY=
X-Google-Smtp-Source: APiQypKABPDN7b8JWZ/OsG7aVs2aEJwYWKVYjc05Q4ZDGuMcNnfRbs7SVkk1TaRzip93+KQTiztvGQ==
X-Received: by 2002:a2e:a495:: with SMTP id h21mr5723315lji.123.1585530590977; 
 Sun, 29 Mar 2020 18:09:50 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 16/22] memory: tegra30-emc: Continue probing if timings are
 missing in device-tree
Date: Mon, 30 Mar 2020 04:08:58 +0300
Message-Id: <20200330010904.27643-17-digetx@gmail.com>
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
 drivers/memory/tegra/tegra30-emc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 900a291803ca..69698665d431 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -988,6 +988,11 @@ static struct device_node *emc_find_node_by_ram_code(struct device *dev)
 	u32 value, ram_code;
 	int err;
 
+	if (of_get_child_count(dev->of_node) == 0) {
+		dev_info(dev, "device-tree doesn't have memory timings\n");
+		return NULL;
+	}
+
 	ram_code = tegra_read_ram_code();
 
 	for_each_child_of_node(dev->of_node, np) {
@@ -1057,6 +1062,9 @@ static long emc_round_rate(unsigned long rate,
 	struct tegra_emc *emc = arg;
 	unsigned int i;
 
+	if (!emc->num_timings)
+		return clk_get_rate(emc->clk);
+
 	min_rate = min(min_rate, emc->timings[emc->num_timings - 1].rate);
 
 	for (i = 0; i < emc->num_timings; i++) {
@@ -1263,12 +1271,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct tegra_emc *emc;
 	int err;
 
-	if (of_get_child_count(pdev->dev.of_node) == 0) {
-		dev_info(&pdev->dev,
-			 "device-tree node doesn't have memory timings\n");
-		return -ENODEV;
-	}
-
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
 	if (!np) {
 		dev_err(&pdev->dev, "could not get memory controller node\n");
@@ -1280,10 +1282,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (!mc)
 		return -ENOENT;
 
-	np = emc_find_node_by_ram_code(&pdev->dev);
-	if (!np)
-		return -EINVAL;
-
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
 	if (!emc) {
 		of_node_put(np);
@@ -1297,10 +1295,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-	err = emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
+	np = emc_find_node_by_ram_code(&pdev->dev);
+	if (np) {
+		err = emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	}
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
