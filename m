Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F81F4F41
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8A46E379;
	Wed, 10 Jun 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CAE6E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c17so24953290lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBJCplGhLIr24UMQ5QWC+yX2Aq7GS8Qdhh51vOCv+Fo=;
 b=YfdrmR8+bDHqkjeC4uKTJ5SfBXCYYq9tKkjD6LLQ/KWTgLvccoblWEZvVMmOJgNUQW
 yhna0ZQ2wTmP0zb72B313sOCkye+v8ngFV0ACPv63pDPymxM9EV1I/BB6XAk+jw4AEnw
 8ziPfrb3maHCNCLZvCIoaYXpoXwGdKWtdvk7L3fA69n+mdFZIxDzNI4RQ+NlbTiZyLLY
 zgdGFkpK0LFJlAh6+kHzsloU/uiyQn/7vSdehhWuN6CHy/8D59reGUo7szSdY2d9NymF
 BnT//xnb6SwkF9pQHNC+8H/6MQuaRKC0T/qUPu9WuJZ4UDx2Q7XpwQCjYYx/U/FbRcHj
 KWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBJCplGhLIr24UMQ5QWC+yX2Aq7GS8Qdhh51vOCv+Fo=;
 b=Yiyl45mkGH7ob0To28QwePWBic/uySsJdCZsqClahZyOxe65I3iTGUtzrHxT6xr0s9
 tkr60n38GUkBPvWy+drTIOYE3+NDKejSQfoZPLmtMY/gQxgYy1q8i2CT08gVDfV30R5g
 /9ecWPBphLWUmPZdeZPIqSHQ5n0+aaV2QPwicThkdBvKR1YjczVyCemTWdTaOxvH10FZ
 UReIiY8TnhVO3XD9Oj17Y7kA/cA0Y9g0kHAYnTjhqvnMlIHwT9UOCUTDNO5ajVX+rgfl
 iiCBNMYmwF+ZXY+xICObHDXxwP2PEazSux8lLz54UKy9IJBJajvKRix86tcAvEIVBgXq
 JK0w==
X-Gm-Message-State: AOAM533fXE/AaG9ucIGz/fk7KGUh+gu8TTTMzQTCUOkb8yd8JkOdBx8u
 wSpVMF9x0OYocONy1C61T6I=
X-Google-Smtp-Source: ABdhPJzNyecHovhlUVhrBdJOpBTvH0mJxqq/5f5UqhaEKubxRG53/Ij7m4LrZV7osBBZOUCPJsDegQ==
X-Received: by 2002:a2e:1311:: with SMTP id 17mr13650703ljt.122.1591708505387; 
 Tue, 09 Jun 2020 06:15:05 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:15:04 -0700 (PDT)
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
Subject: [PATCH v4 33/37] memory: tegra30-emc: Continue probing if timings are
 missing in device-tree
Date: Tue,  9 Jun 2020 16:14:00 +0300
Message-Id: <20200609131404.17523-34-digetx@gmail.com>
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

EMC driver will become mandatory after turning it into interconnect
provider because interconnect users, like display controller driver, will
fail to probe using newer device-trees that have interconnect properties.
Thus make EMC driver to probe even if timings are missing in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 85d4effb8e6f..f6c688bfe41f 100644
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
