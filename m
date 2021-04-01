Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB955351645
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F46ECD1;
	Thu,  1 Apr 2021 15:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BAA6ECD2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:40:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w18so2503450edc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twoNb6b7leWh8AV7R7ZmVfx/R5TDXseUKmzkX/40PoU=;
 b=PFwzxtailwS3bmCyT6YGNaKXm81RnKbZ7HF5A6Ocdsf4HmgOR1JHWHvvpriHp1wFdH
 bAUbPmlNtEnNZMH1hJxEIaQLSLzE7LjEedR/0hVjCgkPtrrO13pQdlXg3eu8skpc387j
 8rHFs0V2L5K0w9BrBvgVaOgX1GpCgUg540sK/fgfhMwhFLClyB0EvNsnVAyIwO0kFaOQ
 CSh1BpaWsef/56/9ZiDaQlRNh0i0rSyHvNpuhlj6OX11Mh/6Waa+hJWRGneWxBjiT0Ip
 0HcqwnPoTvMR144tL4eaNFx6Z4Buxsf7BTQq6BmDVmXuxGwgTLrdiCdFLtY379+wwWnq
 O1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twoNb6b7leWh8AV7R7ZmVfx/R5TDXseUKmzkX/40PoU=;
 b=akPz6BSlsX4DEtylOMba4uUOWerWDabO8xvGxGOG/zr97n/oWomPAaF+um1OhOeyz/
 P8svxBFV1xmGcnlG+7XtTw+4yqv8EoYwD3cSYhFkbQg3yvgy5NsAZdTRESWEJughI1Qz
 NFWbXKcInkIwKaNHcLqVkodjoN6gHrrZ2xjJP0FEKYddlsWxYyftIGOisF6FdXa+up6+
 UkEDhLGuM9XAHTtU39gDOESYv+zb9Tvm+P6vfhEfc1C7PpSHHOpAF2XXWajCJpJjQUvG
 Uxdvs82TbpNMHmcORVD4fBMSG87is8/j4NxBRh6Q+GjffURwapLaN4fIigpo9koMyRgQ
 N1oQ==
X-Gm-Message-State: AOAM533JQe/a8uiHiRyWnwqlIjRiD4uU+q277lacGAb8SQS1R6eVjkw1
 LuisF8dy56qHjH3Rq+pDVEc=
X-Google-Smtp-Source: ABdhPJxJyRtuAtKA/CV4uekPtJtBZLlFJzWYg+4Yfy3PcRDDipfNE4cD/0a6EkZS5MG0oTso9aOgZA==
X-Received: by 2002:a05:6402:270c:: with SMTP id
 y12mr10639711edd.284.1617291643281; 
 Thu, 01 Apr 2021 08:40:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p3sm2987504ejd.7.2021.04.01.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:40:42 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/tegra: sor: Fully initialize SOR before registration
Date: Thu,  1 Apr 2021 17:41:05 +0200
Message-Id: <20210401154105.3345412-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401154105.3345412-1-thierry.reding@gmail.com>
References: <20210401154105.3345412-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Before registering the SOR host1x client, make sure that it is fully
initialized. This avoids a potential race condition between the SOR's
probe and the host1x device initialization in cases where the SOR is
the final sub-device to register to a host1x instance.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 7b88261f57bb..b29bc10a0a4d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3916,17 +3916,10 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sor);
 	pm_runtime_enable(&pdev->dev);
 
-	INIT_LIST_HEAD(&sor->client.list);
+	host1x_client_init(&sor->client);
 	sor->client.ops = &sor_client_ops;
 	sor->client.dev = &pdev->dev;
 
-	err = host1x_client_register(&sor->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
-			err);
-		goto rpm_disable;
-	}
-
 	/*
 	 * On Tegra210 and earlier, provide our own implementation for the
 	 * pad output clock.
@@ -3938,13 +3931,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				      sor->index);
 		if (!name) {
 			err = -ENOMEM;
-			goto unregister;
+			goto uninit;
 		}
 
 		err = host1x_client_resume(&sor->client);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to resume: %d\n", err);
-			goto unregister;
+			goto uninit;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
@@ -3955,14 +3948,20 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		err = PTR_ERR(sor->clk_pad);
 		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto unregister;
+		goto uninit;
+	}
+
+	err = __host1x_client_register(&sor->client);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
+			err);
+		goto uninit;
 	}
 
 	return 0;
 
-unregister:
-	host1x_client_unregister(&sor->client);
-rpm_disable:
+uninit:
+	host1x_client_exit(&sor->client);
 	pm_runtime_disable(&pdev->dev);
 remove:
 	tegra_output_remove(&sor->output);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
