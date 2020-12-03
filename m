Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F932CE9E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE946EC7F;
	Fri,  4 Dec 2020 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B436D89E38
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 19:24:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d20so4356346lfe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=QEWd41CnpBZr+s2jfgx+kjdr+OCukSXqV2r6K1UXFHqwAs5EIFN5R7KspcuRNSy1Pl
 Y6+/hiCvJPOJmAFhOz9DwZYDavZsbvhL656T5Z6obbmbOGaORouwra6oEYcyd0Gq0xhR
 8pdKrbho6alWI7XE3EFZAqMoIWu1OPm/qHbZRoCPKdbr8SOjqM/lL0ghe4fYhXMzFzac
 WbqI2BUkTP3Ms6EqSbIenuBwfYqpyBC2EvbWX+99aWAnOyms6PnO2CiaoPzV+a7FGJgg
 JgXZUpmVY4kncmdqMOTxAEMaU/2bhKnfXrQgEdbs9zQXLl7+TnQQw7J1QfYAlbgz4JRi
 fyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=FGu9jiqtLpf68FwylFMO848yfILGYMkUrplA247eG7yfhD9qVqo575auRVA4N+XPlo
 VVkpfAiidj3f7RF/LxAqMaIv4x/uSuN4nOwPW2HuQaw3paDpayKPQOPPaxWxkSLEsQfV
 Ee3ayCkZlED9SehZi42iPDU49B6BWIYDsO/FGovdTupzZdySWIfgeZUORV+0YnoxHwun
 msRb3II5TKfD0mXOlUt5EFWOieCYWC06mzJo4ItEY6xpWB1+hfiqVGn+GImFlZl2VKLC
 JMXHko+bAuYNnjP4c+72cHOE6RSKxUYlRMXSjSMBl2S+bfaeaK7hbcqHdeSBLIF6nXRM
 quGA==
X-Gm-Message-State: AOAM5314HRPOvqSaRpAeI1oo7seC+9ru4F+C2Pr6XBMpLbz6nrdp5tJY
 et9kfVQbBGvNqDzlovc0nVk=
X-Google-Smtp-Source: ABdhPJy+HAc8kMCWNUM3YphR3pr0R4c3XmFLHkdYKSGR+qdqRI98D+7+uOENw7Va9fyDd4M+wT4NWw==
X-Received: by 2002:ac2:53af:: with SMTP id j15mr1956530lfh.256.1607023497187; 
 Thu, 03 Dec 2020 11:24:57 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.gmail.com with ESMTPSA id z7sm861932lfq.50.2020.12.03.11.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 11:24:56 -0800 (PST)
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
Subject: [PATCH v11 05/10] memory: tegra124-emc: Continue probing if timings
 are missing in device-tree
Date: Thu,  3 Dec 2020 22:24:34 +0300
Message-Id: <20201203192439.16177-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203192439.16177-1-digetx@gmail.com>
References: <20201203192439.16177-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
