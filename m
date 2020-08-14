Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A03245D3B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEF86E49D;
	Mon, 17 Aug 2020 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615AC6EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i10so8121779ljn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWeHmMe/ryLDZxWCOth5wddRP8FFmI3RUHaspfVKI8Y=;
 b=Zz0wAqtSlkr9O05GGrzY90VWvI1zhGc7XuNqBbwNY3C7PZ0D8SIXKFA60E7vyPXamM
 DW1n/aSkt3IIsi25DO1aAbyfbgUs+nhyfM22ZdxEPyeIITiwzqpMSapNyXAG67i6Fiuo
 chxoyipOD21Y7FMjEMTm/DdRn7R8dTesfuKeFEAS05VTQ3DzBZDHZ6h7swcCozHG4sUD
 ZH/YjSTjGIRJk6bpar1X0nxxNYw0Qj5py4llbRnAMf5rFBaxoGq4XenpiLMTovcqKJVH
 prEfkJeZIOUEd5sS1RAwWMvY3mrnfqdpnl7B0LWeEXNk027jps5/sTLRZXs0Q9sN9LDW
 nidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWeHmMe/ryLDZxWCOth5wddRP8FFmI3RUHaspfVKI8Y=;
 b=FPoMFQOFgyL9ngnvN7FjrJ0zH73Lz+5lI03go331svy9xwiSXUuNxpWDcWIXKf2h3q
 Q0qXPYI4JSLGLvJEn4p5YdLDb5xrJPp2tjaLR341zYYV4ZuY+RIGbgWlUaQyCdij0bkQ
 Y9Q1OIIVHbF0gsvl1a0ciaMrNN2XCiON7Ang+MxUJV2G3qqnY0qTuQIMG3qM3QDqvCX2
 kjlzBbRmIKImSHbcHjPkeIG/bEMAZHxVivazS3/+BQ+k48kmJHtjYs7XifMDj7WvlIoi
 OTxyYwyJKBHEd8TWx9tjZFT2+jatsmFY56tJRbGeWDAkz7MbFWYrGotML55Dzj8K2v11
 jw+g==
X-Gm-Message-State: AOAM5306AtEukJR/HM70Nl1/4N0XdKDSVQFMpNHeypWnDSP2aLujkkka
 iO+YQy2NzhyqiMAX7ELYNf0=
X-Google-Smtp-Source: ABdhPJyUPne+A9YG43mcnvypj+/+sED/3AV1gDnow59UIVAb7F2oJ5XCQ4ocDI5zrbmwimksMrj8sg==
X-Received: by 2002:a2e:7615:: with SMTP id r21mr87723ljc.371.1597363628835;
 Thu, 13 Aug 2020 17:07:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:08 -0700 (PDT)
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
Subject: [PATCH v5 07/36] memory: tegra124-emc: Use
 devm_platform_ioremap_resource
Date: Fri, 14 Aug 2020 03:05:52 +0300
Message-Id: <20200814000621.8415-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 93e9835e9761..8d7fc3fb00bb 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1194,7 +1194,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct platform_device *mc;
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1204,8 +1203,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
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
