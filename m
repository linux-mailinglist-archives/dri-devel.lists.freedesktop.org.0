Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3391974FB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005489EEB;
	Mon, 30 Mar 2020 07:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0BD89F38
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 19so16276191ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+VLbWu+D8TgeK5zW6p2aWDCiEGqay0lhDYDpwRkM9VE=;
 b=D2TtU3gFnd7SSpdWpvNErIhPswcBEddIihrL2PEMVX6DCkji+3tn3nJL6QNxuE3KZN
 UZC9HMLgcLYXNLTm3UegAWd9sAeHegVZqHLmlPY+5ZPlkwS71voF3id9b9J+a50OKf+Q
 XXSdvUhVK9IhPcupPAhiZ9vhcloAIko4KcmhbmkrRcPTAComnntoROdZ44vMZMaBMDMf
 IQOBmk+4lydUBb9jlxReAbmwPOSs8MxNWXWC244fKEfoSI9PgAmA7kd1K3AzJ5b2Fzzm
 /swgNGmKcvNrk0ZPanGgIuXHn1V4r3rPhE94y9E9QFRN23Ie3za31f1BV+3T38YSFDDp
 pG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+VLbWu+D8TgeK5zW6p2aWDCiEGqay0lhDYDpwRkM9VE=;
 b=Pz1UAOziJQVJCIdgq7DiA1Q5u8xfsPlz8J+HwRSzV8GdnwUQuk2GkOrX9UjVRT0lMD
 XxlasVYA1ccLKdlVcwrUWAu+kG9bwerx4VaEMSa8MPAYFrBtQ5mcadJs5DmlZUXBWv8G
 2p1R05rxCPZMsVWeE2aYgQZD7wvgY9dycGL/8OLugCk7NI0IPC1AFnIZcPTkB36Xe1t+
 5y6celfKDCdwRYqqnPe3h5M6AB5DicWIbGEPvxT9cPFVzuDM9CHFk6qKlt0WuWRUFm7Q
 uQvOXAnlY1ePWSIReEXouKdZulqnCEmuTMJwP1LOgEl2n2Xvstc5c0tXaK9ssFQlcjtr
 +Sfw==
X-Gm-Message-State: AGi0PubGlvfqpZFibH0xEc7Ds23rPZ59gqqXG9P7+Yvq4txmBR9VrI0+
 oNPlpF12f5R17n5efFUzZqM=
X-Google-Smtp-Source: APiQypInSDlCTRxykyd6QuIBzENcusxjIbug9n1nvvcfJFF3WBOKRBtFehjeBqpyZgJeyv2fKg8MNg==
X-Received: by 2002:a05:651c:50e:: with SMTP id
 o14mr5545140ljp.241.1585530586755; 
 Sun, 29 Mar 2020 18:09:46 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 12/22] memory: tegra20-emc: Use
 devm_platform_ioremap_resource
Date: Mon, 30 Mar 2020 04:08:54 +0300
Message-Id: <20200330010904.27643-13-digetx@gmail.com>
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 60b048ae9982..ef3abc18a3f4 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
