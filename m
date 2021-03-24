Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6C347C12
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155FE6EC5D;
	Wed, 24 Mar 2021 15:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E046EA1F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w37so32506798lfu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
 b=Tc25TD5+7Gwo1HO4vQj/3EiBeyJcsnhH7fA3aeCN5TNcqbP/oVU4HMDFXqOtqwP+P2
 Zdq93VMu2vCBVadNX3nvEKyzRcDkbHi5u2/7Avu8aDQtVOtDidA95usU5UlmTP+MJ/R6
 sVguu0bJ75WatTP8XaB3NJPDsLzgw/cpxzjobzcFr8p3kaQeKo57bqtNmE82PfYjpSy1
 ALGNzNRoBz1hiCw566AJcCM/S2N5vCB83Fk0QWPJT3VWfBIoZiTqvExohdsc93hFEM+I
 m2YFbOjtRW6ndpLOdLmt8Zb49bk/7dz3sjQR81yB/rfa3Un0WCyMj02Fn14szlge6Tfv
 vP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
 b=s4Xq99b8wpXZMFSO97zWG7/M80/hYpJcfMFbQpMWrqeyUHkZAb7Xp7p8BuA5CgXxWt
 hE5dLyHOfVhjlsH07g8KEL0tTjXc3HJw0AphLc0a99pKnzGXdeeE47ZYD2a3neFGJnmT
 90x2dJMXpVbUmsm+6Ad89pHKKzrYJ9ZFldT3kwjbF6WaWtMOE5ApWtceUh8UMfqLMDTx
 ecN/sIulI3lREFJUqzfn/g7Zjm7Geg1Fj95sT45PPo+T6p6ApldTVOKL7pjvAhvDkfk7
 c4rGP2+Pqm8e3Ekk3BStVGiTAnZnB3XaFsDIUtBMleTA9Np993sDrwZEeWUV/Go7z2gB
 TMWg==
X-Gm-Message-State: AOAM5339/VW8NKpuVhKDOSWWxLCOdd+tpI2oGxq2cdBEIPy8zYNDwF48
 aS1X/oaw9YhWi99/wIhjNZKKQQ==
X-Google-Smtp-Source: ABdhPJwkT+pO34l6OqgP6jbUkA2UjX0bT6Qiqht5D9qWgnV/qsJJoLaKaul/Sz5nGrQya5lfmFU+tQ==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr2232448lfe.486.1616599168652; 
 Wed, 24 Mar 2021 08:19:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 16/28] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date: Wed, 24 Mar 2021 18:18:34 +0300
Message-Id: <20210324151846.2774204-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4a8577a08f57..74a4e2daade8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
