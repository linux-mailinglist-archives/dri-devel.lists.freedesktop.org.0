Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC941B96B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C7C6E9C9;
	Tue, 28 Sep 2021 21:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1493D6E9C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:36:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 u1-20020a17090ae00100b0019ec31d3ba2so2674620pjy.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LNSqUpNDlXbVZHt+Lb7O7KY/KMDbp0tDoKUCa6MfgQ=;
 b=BSP9s5A6HNs96Xx3gqzT+DHPRVUCnZ4QKZEF4NOnGWm0ur51PvnoX9wbs02LwzNzwQ
 ul1lq7z8w8PFSB7SbjCJH01zZU7Hv604HAD2e1CjM1A/DQG+YJQVbteLvOHVwYSQw9UH
 TCehEAZQTlJrOdXrob7IQA9eZy1fITvLTASSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LNSqUpNDlXbVZHt+Lb7O7KY/KMDbp0tDoKUCa6MfgQ=;
 b=MSw0qMSmlrDCBBbRpNt5WPeqyVIR46PAr0jd3XZZJGxt9xK1LqKPAfmkXyS4GIwqA5
 88cWfsUiOKN5tlBvIldOpi+Le7Bk++T1FlJSY7NL1B6NwVv/r10gd8F4teo0aGea7DZX
 827X1W59W7T8uVkUHstKBJ0cbzlMUBAis5lIZmNPKPfy4R526UtL5DMlZK3xWCNQ8Uqm
 0c9P9uy9KWAx5LYmB4NJ+EksvK3r0yxqiw6Dc59YTv7Eu8dRPsIzKnb0H7gt4XA3WnqI
 qEvmROMWgoiaheUQcbCPRYhX7QeYyidJg5Fhig2jGW659mWuNULtUY+pJP3fHRozuS7n
 wPHA==
X-Gm-Message-State: AOAM530CE1YAAhaEU5HOopWRtpP30GUBwRE3Cb8OkkntXpa4H/fehM7D
 0Vt0hQKPPIvwXOVMFpKfJI1Ehw==
X-Google-Smtp-Source: ABdhPJxjbWSkdJdJzilKLHeRp1lHIcZWzW4YtepNGEvc8VW+u0wUL7tQbw8C+0nidF1DgUI3HUWpyw==
X-Received: by 2002:a17:90b:1d12:: with SMTP id
 on18mr2316906pjb.180.1632864972431; 
 Tue, 28 Sep 2021 14:36:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d7ca:580:94ab:8af8])
 by smtp.gmail.com with UTF8SMTPSA id i24sm76520pjl.8.2021.09.28.14.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 14:36:11 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 4/4] drm/rockchip: dsi: Disable PLL clock on bind error
Date: Tue, 28 Sep 2021 14:35:52 -0700
Message-Id: <20210928143413.v3.4.I8bb7a91ecc411d56bc155763faa15f289d7fc074@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928213552.1001939-1-briannorris@chromium.org>
References: <20210928213552.1001939-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix some error handling here noticed in review of other changes.

Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reported-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

Changes in v3:
- Add Fixes, Reviewed-by

Changes in v2:
- New

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 8ea852880d1c..59c3d8ef6bf9 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -945,7 +945,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 	ret = clk_prepare_enable(dsi->grf_clk);
 	if (ret) {
 		DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n", ret);
-		goto out_pm_runtime;
+		goto out_pll_clk;
 	}
 
 	dw_mipi_dsi_rockchip_config(dsi);
@@ -957,19 +957,21 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 	ret = rockchip_dsi_drm_create_encoder(dsi, drm_dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
-		goto out_pm_runtime;
+		goto out_pll_clk;
 	}
 
 	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
-		goto out_pm_runtime;
+		goto out_pll_clk;
 	}
 
 	dsi->dsi_bound = true;
 
 	return 0;
 
+out_pll_clk:
+	clk_disable_unprepare(dsi->pllref_clk);
 out_pm_runtime:
 	pm_runtime_put(dsi->dev);
 	if (dsi->slave)
-- 
2.33.0.685.g46640cef36-goog

