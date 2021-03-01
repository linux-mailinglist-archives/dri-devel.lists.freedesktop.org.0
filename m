Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956BF329520
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064C6E8A8;
	Mon,  1 Mar 2021 23:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7D6E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:18 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y12so8676088ljj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFg8JcWXyY2OGGMhqP+ZEB31pQUymR3GBzUkTBvm1ik=;
 b=Lb3XX0AhMyNS0gBsYf/gakRG6b/duv1VfVOmFvv0P1Ruro6s3xmUOpZv+/Q4Rwdzwm
 h7fgRZDPAmUDnZuAh/tBG3PsdtZ0Fti+uS2UDjlrPfKFGaJ898qMpZR2GXajP36PhdND
 GiRh12d1CcxOf50jQ5tFGSh6lGenMZyKBFCgo21NyOIlH17VOIHXagyd4TNpWAcQfAwl
 BtobIVBGX1SVwOz/YKd3h8EN/kIMZvuqtF6GilXK5lQ48s4HOepHSkdMUyWKlq/RH8sQ
 TkvXxQfkMJx1ydPFNThQYpYhMOzP3wMlZLsYsUqAhCKeIrIT+/2y+2I+i8jxmKSGb1kV
 GQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFg8JcWXyY2OGGMhqP+ZEB31pQUymR3GBzUkTBvm1ik=;
 b=S2XmHfl9iq4A1w2ADsr5fz6kaqA+EdFLmhTZSA/4gcV7p33zHumi+h/9v7JHjL3o7k
 pHqhGJcKMDi1MhuRvx9uVso4s2V8IPEm47bH8E88kD9xdGa/d8lCl7sqr7jmfZ+0v3dW
 QpCseRuXTnWgiy1fVpPazsIAA3rasy9/Pyt8iMq9RzlUmcTYx3QgeWTSKeIpVENHBILo
 YVDgfSRphZHQGrEusroypLqObFI313kG4FLwt406Fm5/qFpy+N9oqz2xIkkN8rG1Bwe6
 Yu77/ZJRCSH1xlVyXz77jfo7TA8cd+LpirAXhc2C6nFee1frDL9PBOmzwwHOG0nADDx1
 elbw==
X-Gm-Message-State: AOAM532AXGD2KSFrZntVOGDGT7RgvxTn0cNtL/oOXo7lF4IF2lqdQ89z
 4jCJa5mY7snVQu23wNE6Kd6akw==
X-Google-Smtp-Source: ABdhPJyQ3PA2C/BS+n5Qp6W7I8EG3hQWozXMKKHE1EZTxUJ6VAc6GI68+VqjLOXv5zAl9Add4g4D7g==
X-Received: by 2002:a2e:854a:: with SMTP id u10mr10589375ljj.309.1614641177218; 
 Mon, 01 Mar 2021 15:26:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 12/24] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date: Tue,  2 Mar 2021 02:24:55 +0300
Message-Id: <20210301232506.3057401-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
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
index 8c0bc5ccba8f..0c26451db310 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -734,7 +734,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -748,31 +748,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
