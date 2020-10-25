Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2672987E2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E086E88B;
	Mon, 26 Oct 2020 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512CD6E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j30so9423525lfp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SK4mi4uPijedwapHTvsgA4XRJA8rJ81UCcUw/rkRDT0=;
 b=oWfNh0TnVrlfrER/pSC3S0HngwdJVUEVprw9AJ7ZTjeAZ4ypifGCr4JaLsmtQ5rSMp
 NP2b/L/QmJ4SJPoiyPPs4DCI2LbdQHK8dn8PJVu8En/xcHBefZK7xnybpEUpsuzWBBPT
 MJKyawREcvZXsS1o4FGhn7fDCy/pHkvVZ6pZN79murFKRQNNnKfHFsxXc3goXo0cUmwj
 PqeBM/Q1YtMJXkpMbhJtGTh84uc1Lcq6X8Pu6X3AnwE3zpotj47mq3f6OpQIcI0H1o7e
 E1xna5MFtAxyiF7tcyKEKEwbo7wYC7EdqpRe7DBZCfjoI56hxcaY6Y7rXrX8Dgp7ugEz
 slyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SK4mi4uPijedwapHTvsgA4XRJA8rJ81UCcUw/rkRDT0=;
 b=B941V6silwTndg/HyjDLN3s+RxuNwIkFcTozoLDoLCi7zkPdyc/Fxw5+ijwt/CcG+P
 66w4R9FP0IQHnDhz9C1kIDG4p1pkHnNECPWHo/Py9BVFilDqmkdk4LDsXVyWLaPl61XB
 8mTX9vr0q1Y/da4n7fv6kSc6eHwGkZMK6POTGw5GIgmQ8q8maM9FcjM3U8hDItNrwEpX
 KKVO5rkkCn0U3uTa8Krg//bBfU/6UWmWs8CFxtHnv69MLHEUdIkm8d26tkN/AWuGOPpO
 hV2wzlLqjbdoc7Wr15Yh9xnsnaDbvLoYyP/atdON7VyZ9vHb04BdUB8Vpj8v2eNgb5XY
 oEUQ==
X-Gm-Message-State: AOAM532EjVarbOjSlcVNEfCmFatTcGK2kpQg7WjTfKCdKTzUFOrx8opq
 ePMq0Ouehv02I3Mokrun10A=
X-Google-Smtp-Source: ABdhPJz8J+3PAUyWg+GX6iBLvZsb4KMZxRBUq+g7QPwhtNzgE5vfBxmo9k+d9RHakO69bfv4wqvYXA==
X-Received: by 2002:ac2:47f3:: with SMTP id b19mr4296256lfp.192.1603664303791; 
 Sun, 25 Oct 2020 15:18:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:23 -0700 (PDT)
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
Subject: [PATCH v6 31/52] memory: tegra20-emc: Use
 devm_platform_ioremap_resource()
Date: Mon, 26 Oct 2020 01:17:14 +0300
Message-Id: <20201025221735.3062-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 0baa6590adea..ce22ca7cfb77 100644
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
