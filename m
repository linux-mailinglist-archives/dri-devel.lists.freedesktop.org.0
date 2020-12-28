Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F172E6F7D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541C589301;
	Tue, 29 Dec 2020 09:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED028999C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 15:49:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y19so24637342lfa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 07:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zfb2Oj304hhOwNOrbWB2XftwVoXzBWq5pLB1bTxGch8=;
 b=iKAngwlt+W4NxAIhqG3ODUV2rL1VHbtt064egT/aLYXOjgxVVioyQMQPdfh9xqFnzW
 2j/7TLctY7/Jt/+zLn39D3TIWWiEHxZd46vbYzYHsv5mIgW5XRl0m5tqQlrrL7JY+iTG
 dTLC22cOtc+kENBLIZjGD7xvCZP3nAt26NJA2FiumScaMui6AW0oPSGO35BEOi9MQMke
 970Qd8GzgEFT9EfM6bneVleleEezvSil/17XxsxD6XMpKOLpuaZWd5l64enrOJ0d/HXM
 LsLNRmXCO1KqdWCT3uE6t7oM7ibVHHZi10/38/+P6rA39s69pZvDA4bkuvuQwKI2g2XY
 hB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zfb2Oj304hhOwNOrbWB2XftwVoXzBWq5pLB1bTxGch8=;
 b=rW0AcOezyW29WvcdfG9ZsoAIfpYi7PNIHsVjPDqguBa8urW9AfNVJuE/IavZxudzXb
 aoK8YlmSBQAAJhZdSLRB1OZL6UpqP+HL0baUhXmmGPBVyjkO75ubTwwpBaKzsScttUhf
 9HBNWvC0VmM2JzWx6CI7eip/mQIQWM1lPuDarXypeCbw4q3wqAKTBTkPDC8qZbKglXSt
 AGOvs6HCBJ5v+SuRBBpbII/0pZstp2JA5RHd/xJEHmihpHHM2kuRG1AnQcs8t6O2U2mv
 dMZh1XfHE4SmGabJfF5YRbVt8wD7FCEEbezx0io58y1Xbe/NiIabN7z0aKORDl+jU1NJ
 9wdg==
X-Gm-Message-State: AOAM531a3ruk37q7wyvaKCBWP8sVA7DfTqtpZkEBQfi/nE4wo1u16ATA
 w6Wu16zDo7SdDvjHRd2idBmLko/heao=
X-Google-Smtp-Source: ABdhPJxG3IWIMT27oeVAaZqGgz4TA2twhb51FD6wTCGze7pM3+B5tX3hafbdwAiOVbMcB7IcbTK1rQ==
X-Received: by 2002:a2e:8e2a:: with SMTP id r10mr21685009ljk.237.1609170581530; 
 Mon, 28 Dec 2020 07:49:41 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm6502262ljd.25.2020.12.28.07.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 07:49:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v12 2/5] memory: tegra124-emc: Continue probing if timings are
 missing in device-tree
Date: Mon, 28 Dec 2020 18:49:17 +0300
Message-Id: <20201228154920.18846-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228154920.18846-1-digetx@gmail.com>
References: <20201228154920.18846-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index edfbf6d6d357..8fb8c1af25c9 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1201,23 +1201,15 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	ram_code = tegra_read_ram_code();
 
 	np = tegra_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
-	if (!np) {
-		dev_err(&pdev->dev,
-			"no memory timings for RAM code %u found in DT\n",
-			ram_code);
-		return -ENOENT;
-	}
-
-	err = tegra_emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
-
-	if (emc->num_timings == 0) {
-		dev_err(&pdev->dev,
-			"no memory timings for RAM code %u registered\n",
-			ram_code);
-		return -ENOENT;
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	} else {
+		dev_info(&pdev->dev,
+			 "no memory timings for RAM code %u found in DT\n",
+			 ram_code);
 	}
 
 	err = emc_init(emc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
