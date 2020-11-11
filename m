Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFE2AEA7B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34B689F19;
	Wed, 11 Nov 2020 07:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6A89E11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so718233wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=UAREEgI3cbyJi9cBfgE72sf74JOhJ7Wdt8SYY4CxrqamEkdkUDNcJTlqWcP6q5xbjM
 8ymdLZVPvsJlnqsKX+p1yazwPe2yBwr4SAza4iBJbJBOHkVio84XinYiEBN7Vq+XgwdA
 AY1dEDhkfvi2NCl2ImCZEFqttMpQwny1Vg4yBF01SFndKI7F4l+eviHfnXkH9XFvd0Rn
 nGoR59IM0nGthDtQ5FaxsBuBXmU0yfa8/UrTyoxMWqpq34VrSNJ7EqoUWuRbxgyEoW2q
 QYoAniol5IRPFVZb0OZzB3XpShBM5F1MPYllf3aOJ7SLhVJKwO27Hwnhz3uDIih2ZLDK
 s9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=Qp/4bfn2aKYEdSKrJNF9UxE8fV9CBythohBJtRziOIpiDL6OAUoVVHsNjilukpZHm7
 K4SbkOlI5IAV0wJZmpXPt6NPb1nhxbk7ppms3FTJ+Iq3Di1+ozzXMsK8OLSdfJE2frQh
 NT5xzpNncei+zvHFSEpFvTSHKstaAd/+LYNnum4sZXCJMkF8mQhcy7SJSaODFaj66UUi
 GcWB6v9kZy3fcxOfHZwDhT55Qe4gwVgACq4vMsTun/ySGQCdSc6xosSf4WY+FMujGnDK
 Mc2v0Mx9e9dEDpydzZ5+Ua0zSBuCsz+PxmJc2cBJ0qR6+AQldq3Jp0sN9JkIPlikLCXr
 XMLQ==
X-Gm-Message-State: AOAM531PwBOSf1g40NqprBjtHA3CRaA4YhhGHI6+V3Jmtstu7rLhvzJ1
 J/ZQLoyyMeGFgfGhOk4bt0E=
X-Google-Smtp-Source: ABdhPJwP2Md9t/kDAOA0Ws2ahugPNxFWZWYrlV3nv2wq6b/GxsIiNeVNI1kojRkZ+Ll1oYqVC4ClEg==
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr28079897wru.296.1605057329868; 
 Tue, 10 Nov 2020 17:15:29 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:29 -0800 (PST)
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
Subject: [PATCH v8 12/26] memory: tegra124-emc: Continue probing if timings
 are missing in device-tree
Date: Wed, 11 Nov 2020 04:14:42 +0300
Message-Id: <20201111011456.7875-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
