Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55416419DBE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4289F49;
	Mon, 27 Sep 2021 18:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77789FAC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 18:00:25 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id g14so16621425pfm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+a7FKoAYL96RPr7QGB+xkOteevSmzHcwGmtuLohIN4=;
 b=b/opL5QdAO5JDtZRjNuLtZQB/wib0usA33ZEHqJAYreIpRU/NtWka3Z1lPgKGBurqF
 qtg47my+uHjW3vpgdrtd9bvjcDcayVvHg0fMWGju5Uwm4LP2FFLetaGlofSo6sL5vi/y
 XNVcsAIuTod4ooj0W5mOYNv54mwVOVVemSZCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+a7FKoAYL96RPr7QGB+xkOteevSmzHcwGmtuLohIN4=;
 b=Vh9Fwiy5DHGXJIHmdqY/ivONLIIxYJM/6FC/eCXNoTb3O7Sa4JS9hqYC1zw9u2fmCN
 pg5G90CqRoGEvf/JEpfeBrhPO3qjrGTtgSknb7X4MAMsgCe36zFUkj7zIfT9zK73TLic
 rHut+/S4NR91ipGrDj3fYNW3wEdIwmyOckbyjt8Fh4qW1nMKxDCBr0C/WhBF6CohrpfY
 3cD6JAlNLc29O2YCIEFDDJIpiyK5k1tuQZ+WBbcoqsGSg+hStKiw+VLRN9qpKjOiNN5X
 AN8Be2uWjSNjd2xpZs1CMqmEFj9Q+Wx4iVlcsvaSDzU7fc5dneNkBvwCRELbgwd6FY/a
 kUPQ==
X-Gm-Message-State: AOAM5304W3Gy83uRNvfBkwIWzm8Pp22NuMK1VyCqNEklTX7SlU7oKe5a
 SVsK/uhqyaVyeftQLy0fW47gww==
X-Google-Smtp-Source: ABdhPJxq7Y5R55DSsFgb767+FM/jYFg4xB9p3IXsKCB/X5PXOi8QwLfnVvoTDnR7LOJjxiCl1fIfRg==
X-Received: by 2002:a63:8541:: with SMTP id u62mr822463pgd.308.1632765625576; 
 Mon, 27 Sep 2021 11:00:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82d7:f099:76bc:7017])
 by smtp.gmail.com with UTF8SMTPSA id b2sm18139527pfr.58.2021.09.27.11.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 11:00:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Thomas Hebb <tommyhebb@gmail.com>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/3] drm/rockchip: dsi: Disable PLL clock on bind error
Date: Mon, 27 Sep 2021 10:59:44 -0700
Message-Id: <20210927105928.v2.3.I8bb7a91ecc411d56bc155763faa15f289d7fc074@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210927175944.3381314-1-briannorris@chromium.org>
References: <20210927175944.3381314-1-briannorris@chromium.org>
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

Reported-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
- New

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index fa4080176719..0ed13d81fe60 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -943,7 +943,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 	ret = clk_prepare_enable(dsi->grf_clk);
 	if (ret) {
 		DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n", ret);
-		goto out_pm_runtime;
+		goto out_pll_clk;
 	}
 
 	dw_mipi_dsi_rockchip_config(dsi);
@@ -955,17 +955,19 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
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
 
 	return 0;
 
+out_pll_clk:
+	clk_disable_unprepare(dsi->pllref_clk);
 out_pm_runtime:
 	pm_runtime_put(dsi->dev);
 	if (dsi->slave)
-- 
2.33.0.685.g46640cef36-goog

