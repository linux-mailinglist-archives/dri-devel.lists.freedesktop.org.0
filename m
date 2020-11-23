Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAC2BFDE1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A667A89AAD;
	Mon, 23 Nov 2020 01:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE789B49
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so21457569lfc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=Lde7ZDqYx8dJkOCebv5BhXG3l/59/kykD0OHSLRbiHLoPp9Zr+KqwSdCUovpwbuIuV
 40Ug0wZPdzOm8sh2YNsTpr5iL/RKpwFVLyxj4Sys6+Eap181JcU3vjo723T3i3KGazdR
 XS74fVh70SrgGeRQvRbJSkiSKDmwmrh9OQN/DQ+0oPMuJEUdOdVp+puLukxtEHalqguO
 Sk4KL6W+bYqot121mvuO/oNuDSDJTR9SZElXwIpyqXLL7ErUgSPK4FbO2gJm44d/e5N+
 Ecx1mtB6GcfdH7aGbhQhdU1/kcFThaPWohUx9Kf9wDSI2Ee8FnMnXHvbEBSIdzYciw3r
 2HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=NBr0TYo4VwJ5Lwb3AvXWviNE028d8RGy4JNpxXkQ5bVWGVR24SXbKQrYeY6OHxjdi1
 rrw5bhUbsG86JMQ4TkxNcdFkWWX6MmewzNBwURXrHPPD3nC2NFqN2owNZUogE9c8pvTT
 2DIDLvdVZf4IlE8NsfwBxZtujOE4vTvZaWug8Kvsap/UKuTApz/m2LMdHkWExtJfQQM7
 Kw3M89t1WTdR7Ew2uV2bm3wMOzOZepKkro32CKTGRQMLX4Q5VUPCx9TfxzFiAecnUpgm
 U4DXHg603xKLsOK2s89c7XSXUzL5nyCcickL3Z/+Vpc3boCuyZ8xwCaAB92U/KoXxZz7
 YUkQ==
X-Gm-Message-State: AOAM530yvsEwB4mq/Cn78vxubmMjCyV83dqy0iG5CKoOL9nk7IkgJZXF
 /1tsRIdIbQe/838QXJ3xNWM=
X-Google-Smtp-Source: ABdhPJz1K729hX4qJiI+60UtmuZxTEjD8U6Rdp0X8aJQjoLdzHwtLAL92XIpv4YmX0zgw9gEY+MSPg==
X-Received: by 2002:ac2:5591:: with SMTP id v17mr11553276lfg.562.1606091479185; 
 Sun, 22 Nov 2020 16:31:19 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:18 -0800 (PST)
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
Subject: [PATCH v10 05/19] memory: tegra124-emc: Continue probing if timings
 are missing in device-tree
Date: Mon, 23 Nov 2020 03:27:09 +0300
Message-Id: <20201123002723.28463-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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
