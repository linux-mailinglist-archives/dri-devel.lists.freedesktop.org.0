Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868DE1F0F1E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89EE6E3FE;
	Sun,  7 Jun 2020 19:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B6F8926D
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so17748796ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eu8MrObQX4qoANIG2fS7sLLDmIFV2OlYxi+5WWSLEXA=;
 b=AO2u+AL2md2fHE3/M+qhRZkJHkN57VNYPwF53yC0LlEiqDEayeGkoDRm4INYQiPTcu
 UILsBPr6RINt4PeXyF+jYKzk/q1onbl8mnOYntuXqnuGDQBbPJJ3Ha+AeuUrgLEXpeYD
 uU4rsDab0iIprBbs5g5bf79f69/B2lUe5Dv6y/VqKFHO1w73A1jMzWBSn0wEC+C7T67C
 LfRXy2lpoi+P57/z8WCIYUfRqAmmk6GzZZPgqfWABbsWV7A538i6yyUjKzRwePcilSv6
 wwctvG1COSVGw79IgfkVRmMYkKsr+JCQnFCr+u3Zolc/RmA526GV9Ac+c0Zdzlt31+MG
 qBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eu8MrObQX4qoANIG2fS7sLLDmIFV2OlYxi+5WWSLEXA=;
 b=SlFyibSwr7unWI72rzC36+tPZUC5aJaYvXnZAjYeCPuopUCwLVDrWNLjkccdEfFbm3
 uo+EBT41lyEG7P1CS3jret8s0D83aTs0KqXqOkZ9T1M7ibY5+eRiy65DyHCZ5Dad16jS
 /GOoDJ0EAzTao5a4bSCi4nhV4tYFsmbcMIyJNWLMbMcCwwFgYaNjUoXc+Ttkh65dhsK1
 orq8HcxeNJHqFiG+EJxKobvjx87FQxdpcCSQ0WK6YXng1IX20x0SjTkUtZ6eJ0MqbkYn
 893MbwiGH0P17CZMhzl3Pi50YePBiugDREaUmtFr7SIGBTkhaYVALE9Sg1lBv6EgzbFA
 f7bA==
X-Gm-Message-State: AOAM532ZRhpeXbpI3BoSvnuWVsWQUBQ1RpBKCkdjbkN1Pa0iQ3li7f3T
 ugYhO8vsoepnkAga8X4U6UU=
X-Google-Smtp-Source: ABdhPJxB9BKEMaHB4+bqRbgTmGzlOqU21Wm2fXMTV5IfItU+9t4fvRuXNVDEZLm5kaRBchxCjOoJAA==
X-Received: by 2002:a2e:4601:: with SMTP id t1mr8893308lja.82.1591556274043;
 Sun, 07 Jun 2020 11:57:54 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:53 -0700 (PDT)
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
Subject: [PATCH v3 33/39] memory: tegra30-emc: Continue probing if timings are
 missing in device-tree
Date: Sun,  7 Jun 2020 21:55:24 +0300
Message-Id: <20200607185530.18113-34-digetx@gmail.com>
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

EMC driver will become mandatory after turning it into interconnect
provider because interconnect users, like display controller driver, will
fail to probe using newer device-trees that have interconnect properties.
Thus make EMC driver to probe even if timings are missing in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 205d8053fa75..76586edb34ee 100644
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
