Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482E32471D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 23:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC86EC01;
	Wed, 24 Feb 2021 22:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178F86EBA4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 22:47:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id m11so3468821lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 14:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+EhLULxHZtitYfJyrWghw0Pq73IBIvjg1EFWi426yM=;
 b=FNuIaQkFNcTljA8L+euAvwQe9NOI39JuUyYd//d+ETVwXIw5tVlrkc0vQ5nKN7IEYK
 5jVJuYAZQMMNTNqmaan1oDd7HFVLMRRZpNTSwDr3AHHDpGNVbWDoe3bPQ/XisdngLf32
 AZGyUzqZHbcuKmcIYYLGs5Oq1yf/VHOM43paZf1hzeLWZrRrQK+LPun8mhel6q4S11aF
 sjte4dNRVEERb7MTkw1z6Ocp5nk6EBqhOFgiPa3LFV6dYFnWwKOhCnfPssLRTTIQTbsd
 jfQXfRPYeltbNrUP9y7bdWC0X+IVnxjsjT6R4yE7jGgTA1IEOr/LanX6sw0KSalOiIg7
 0v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+EhLULxHZtitYfJyrWghw0Pq73IBIvjg1EFWi426yM=;
 b=K3M4hU3EXOLGdSU93NmJ9B09Kioy6sn8Vx7CZsQqNGVlSQ72VYLy6M1LpXhacbaxi/
 xdTgsz+eJZz6bMpsjlt9NHjgYrlYQnECwN5r+dkE/dCyQdSauw+Ybyiwyy5iD466GmhB
 9Q1vCMVseNeGzDJiCojOziT580P4+E3nIuvMjWnkJqN57XLbEQIJCNheUMUVQTRo3+/6
 XAxispyz9eC7GS2WzNxrOqthjtTB4Yu6pJYkK6kXlBtSJIPvTohDz8FWZf737CacDFTD
 VdnalEX8flGlpPIjEesWQN7WtsfT16Im5UW1oNqtMVBnKdVihITOZibOC7I5cDS04aRd
 TgQQ==
X-Gm-Message-State: AOAM532WF9hXKyxUGU/ZOMYG7gxe6D113Ca0ff+xwP58QlDWTpoVfuFX
 zFWW5uqsY5kuxoSVS4a76W6BYg==
X-Google-Smtp-Source: ABdhPJxinUEQTILi+fIEftaSVri/anqPPkKu31M5Kgq0bodMglUL6YY2TRonGFWkgsiUQNElLeMNwA==
X-Received: by 2002:a2e:7202:: with SMTP id n2mr26874ljc.17.1614206872325;
 Wed, 24 Feb 2021 14:47:52 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h11sm766702lfd.243.2021.02.24.14.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:47:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
Date: Thu, 25 Feb 2021 01:47:51 +0300
Message-Id: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix setting min/max DSI PLL rate for the V4.1 7nm DSI PLL (used on
sm8250). Current code checks for pll->type before it is set (as it is
set in the msm_dsi_pll_init() after calling device-specific functions.

Cc: Jonathan Marek <jonathan@marek.ca>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     | 2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     | 6 ++++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
index a45fe95aff49..3dc65877fa10 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
@@ -163,7 +163,7 @@ struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
 		break;
 	case MSM_DSI_PHY_7NM:
 	case MSM_DSI_PHY_7NM_V4_1:
-		pll = msm_dsi_pll_7nm_init(pdev, id);
+		pll = msm_dsi_pll_7nm_init(pdev, type, id);
 		break;
 	default:
 		pll = ERR_PTR(-ENXIO);
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
index 3405982a092c..bbecb1de5678 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
@@ -117,10 +117,12 @@ msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 }
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id);
 #else
 static inline struct msm_dsi_pll *
-msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 93bf142e4a4e..c1f6708367ae 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -852,7 +852,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	return ret;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id)
 {
 	struct dsi_pll_7nm *pll_7nm;
 	struct msm_dsi_pll *pll;
@@ -885,7 +886,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll = &pll_7nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (type == MSM_DSI_PHY_7NM_V4_1) {
 		pll->min_rate = 600000000UL;
 		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
