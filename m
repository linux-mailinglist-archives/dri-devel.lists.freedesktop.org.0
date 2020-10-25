Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD42987CA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980AE6E83A;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877986E139
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m16so7720619ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KYnDvMkLMERuQbQeyFl4CeENAxlm67gUy3culAwcSN0=;
 b=hKDJfgh2nxkwmAvNx9C1gAnn5Nt+v/I/UgZKkNCG1j+HeG+8RwQ1IzNefwNFh7Capj
 37BdEHDnGML8a6bwoSFgHkQNskFux9VLJdGyfaj1mpj4COazb026N5fC8v/RizVRkI99
 oSXqRmXl1aGU02A2JAH3664aPbjC7Le7+OnocBptZxTCibt9Ew3IzN8MEDt9qE47FSbP
 fZHWToFepUA2FKOT7+CQyU1cBQc9ex2DcBcfeEAv7uOO0VoDtGcgtNF3EUySAJkAoaat
 boEsw0R0iEAZl/XVXGVIJgzGud4bpCrlAJ6wG5Y0gg824e+Y4z53hUne6dJ091wOiw4D
 vuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KYnDvMkLMERuQbQeyFl4CeENAxlm67gUy3culAwcSN0=;
 b=oB2czeQOyX4SESVfmXPQf6y54LtnuzIVKUwkgUbhvtd2YYcIMNXGX3MsuhUHiQTKcd
 krUaD9lDzezcuGSupI5/zELKjJ8arcuAIn0Hpo1Q6knRHX9V5NSGZ7YTO10mHnW2+43S
 /bdGWbcwBldwf5RlWHT/LsX/XuqwS/utQemqxUku22ac4iB0YczIa+fYv8oqTncyRiIO
 LoKyxz71t2/ahLrABMjXsJK7qTc2ZK13N/Gp1qM46YseAV5h2hqRnblZfXPqWnQ4KRVQ
 xDVXbBDRPAwQQQQRpUJlNIGQsIJxL+5Cw4zv10akw4/01hK3Ids99i7bl3OqKS16o9SI
 TDUw==
X-Gm-Message-State: AOAM5325Vy1ltYVt4uQRgXZ6dyue0R2dT0y99bSDpS8bOOGsWilLGyc3
 q9sL4jJ4wke5jirhBovp8AQ=
X-Google-Smtp-Source: ABdhPJz62dra825y4ptqKraHUjLbpgvnCmBJFUqz5R61yS0AG9wXG82ZbNL3B9+Ndg61Wnb5c5d6TA==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr4274751ljg.355.1603664315036; 
 Sun, 25 Oct 2020 15:18:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:34 -0700 (PDT)
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
Subject: [PATCH v6 41/52] memory: tegra124-emc: Use
 devm_platform_ioremap_resource()
Date: Mon, 26 Oct 2020 01:17:24 +0300
Message-Id: <20201025221735.3062-42-digetx@gmail.com>
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
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 48e772ec544d..2814b1b4a1d9 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1181,7 +1181,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1191,8 +1190,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->dev = &pdev->dev;
 
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
