Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245961F0F11
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE57B6E409;
	Sun,  7 Jun 2020 19:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486736E392
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a9so14203081ljn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cheeB0fZKRZ//Ml/fXNdvoie/fMScv9EjJj9t5vhyMg=;
 b=d7V9jtJcvc5vO9jCeIgVSYZ+WELLgMvs2NOjcjbfikELvYAUdN+4lavIHaaSFPfqBs
 jV3DSDKn2Ia1XxUPRIwfOHdDJTBHkwzLbnbkkn529xLMfvlcnbJiJn4BoMJzlzkP1nLy
 bUvzu7vSyFhbnzD5e6DEdZ1L69I314R1rKEGKyJNuigUqC6bPmjA2RvyM5okPMkQr3Vn
 FgbF19BVOXj7WnlcqpDAF9dMZdZUqzsfKssXoQ5YEENhTYK0D+YR2tZ6cyowo9R3Ege3
 oG+NrkVllri5gNmdKhgPmIqRGcADykZlFbdkmocli5m13YxcmiFivvQkW+h/TKX3zOC9
 WryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cheeB0fZKRZ//Ml/fXNdvoie/fMScv9EjJj9t5vhyMg=;
 b=olGh1EN/oGI546rHM6uFAqBs5DvPLkncN/CHW7hfBxvbBKZ+iFfX5ZZmlCTuotjPzT
 aPRLAecGRuVVJUssgfG56K7DvqgMU5mz8bXaBRhkXFpCaCnrh5tHAme/Fa8scWyQYmVg
 h/gt8/4f4I06dhvWAMGM76dBSXb4NrDFmhbOdSWVJ7Zio2VWCieLjwd3PScfkhwceTD5
 +/qRHIINOoUlwIHn3sKvUKqG3VzGSRwWRgQA+iJZroGPC/YQFYLwxAFYbEVwUaBykcp2
 cj4j2KOKjzTJavQFvK15w42G0wFPwSMKEAkHSwNV/IgHTErCIgO0KDhPcWewzoWl74aE
 GE+w==
X-Gm-Message-State: AOAM533OvydVj5Fmq8x/b2vNpoWmi7VuHUEYrT/C5QHmC9XS7y4p8sbQ
 5pkwHzlpVFjWcaIme9piq1Y=
X-Google-Smtp-Source: ABdhPJwQpY8ksMO/LvCcyofbXlo5qyf8SnLXRKK2DnwLIZoG+7H/HsHXQlM+b4uHolxZG4PPP/J2fw==
X-Received: by 2002:a2e:9ac6:: with SMTP id p6mr9920940ljj.417.1591556268742; 
 Sun, 07 Jun 2020 11:57:48 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:48 -0700 (PDT)
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
Subject: [PATCH v3 29/39] memory: tegra20-emc: Use
 devm_platform_ioremap_resource
Date: Sun,  7 Jun 2020 21:55:20 +0300
Message-Id: <20200607185530.18113-30-digetx@gmail.com>
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a95522020a25..79fdae042b57 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -689,7 +689,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	int irq, err;
 
 	/* driver has nothing to do in a case of memory timing absence */
@@ -724,8 +723,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
