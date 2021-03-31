Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83C34FE6F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E046EA53;
	Wed, 31 Mar 2021 10:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512C66EA4E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g8so28497930lfv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
 b=DdxFqg+UJ9FKMjIZZi6fUqHc4tQRMvdxxHSUffVfU9HMSXKru6kzhwCpfjYqStkBfC
 XT/FIkqJJHOafINowWPi9PbRGtpulo5RxKaAKD7YM4E/aHe+528vrocpPq4tROISvgT3
 CntWnbju89GHH8MhAeBNJwu4Ad5bf7Zae66wHoajRteIgbRJktTRO9dQuRmJfJAY+TBA
 xcR8QJ6q33ZKrAK+ZSO0PIQqnhYyMQZB5x9+/fElOYsKfjIU3MYhS4Wl2GV8LdAt8Q++
 twxhYWtg90yFKkpYDB9PvGqKH3ql3xUpMoE3unLNVZRvyJt753SVUCw1r+BYXrgj8J6T
 HAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
 b=MZ3iEfGbNa7SaPl0c31VLbLZJNRG5Fjmrd/da+oz3nfs/uoxhWUuowqKKGKMBBje4W
 5y9+PzoOjrllQwvZKw/FGpuGSxlvTK//yDXcgSgGt+HrTI0s/UL5K0EvTOmpX99/s+by
 rfXGobvQ1sKjhrD6tffX6Lc5bBkjjqjKlgKzApSm83IfLSBtu7OXP6bjJqJ00bIZHlwO
 Bw6/g23pF1zAEc6fFrlTBepPgAmWowoNdocllN6HUHvF+CI3gr+VgVjvTEnbCZxWXhzT
 alCCiBRU7s4WrgPqK6sFbMzhLO6E184m5DevXyQQ4J3SxfL6yvN8Y+9WgiBJAg8jy21B
 Jd6g==
X-Gm-Message-State: AOAM5334cNh/F7Gjrti2lpm+p9oFpcS/2CNo1I0/e0D1r6SMmQs6mt8y
 HhouZfKVaf372WPwEBcmm4th+w==
X-Google-Smtp-Source: ABdhPJyAC6SLSg7+Dr9VzDvUXl2f9g0aYK2FUaDNGTXtEdt2Nc3MfNNNyGtrjO5BCFE0WkejuQ6wnQ==
X-Received: by 2002:a19:7716:: with SMTP id s22mr1877170lfc.542.1617188267795; 
 Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 12/24] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date: Wed, 31 Mar 2021 13:57:23 +0300
Message-Id: <20210331105735.3690009-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index df3b91b0ea88..46561435a27d 100644
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
