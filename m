Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6B2948B5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD316E99F;
	Wed, 21 Oct 2020 07:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580956F448
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d81so2703365wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twq11JCTg4YQPPBb170KYVskL+0y3cSGC0QSvk3HH7Y=;
 b=Y0K8WJVBkIOPg/vWN/gU1vxXt++vSz7StmVppBiSGnmhyGQBKOMQ8hAIb04Afhwj6a
 62+XiBskbzrvJhI4iA0oRmM8jG4MwFzf8EzwA9mCx+eRDjY5tuMZVIjPVJ8rJQ2l4mjy
 apDGCrIAKYw2L5zy+NC2R9nsPefpTGiANnp5FUzPb6gSHYA1D1/yvF9vZW62tnEW5JcL
 xwFxp2jAZEsl/dwdQzPJ5USMd9KZCSRimXYGtlaWRbKTSqVErYT5qC9uimgEP7SMH445
 ob07PhCQGEjZ7ZEZ1pg47Ci1z5OU9XyECBPwHRgN1OQ1psyp6Mqkj4qX5B7Dx+Smj61Z
 eOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twq11JCTg4YQPPBb170KYVskL+0y3cSGC0QSvk3HH7Y=;
 b=b5302LYe7VDdyNJnbZcgdwd6unz0HrZ1uIoN77g9qsQNCRyZFIL4dDApjJsx1OZq3y
 FjjMjb8ppK5ey4aX3azJiP+2X5PVwmh2cF0XYZQHQOrztViPc28gQxavKV0dVKXe8Tg9
 CZD6xQgA8AVJWljaIAaMPn7XoNx2Q+MLpZKUNKkmuMylIC5VHPan+bqXcE6hZOaVsgMC
 MEpYGpT9Fr/+rAWOrg5LonUJyGSgSj7FCc5iQefReeent/J5ztsFSyAcKgOe9zkTDZ/D
 Co6S7wTo0xf05vbH1q1D/Ab/DIDN8gcDee97O8hJ0mBcuoDCBM2db0uBfbHZ+jWsTC2z
 E5Qw==
X-Gm-Message-State: AOAM533lZj9BDHIhKvcd+GKRb5o1tma9SQ61HWVUElg/v0fWK81p9/AP
 VH362YmrKPQrg3AVccwcrvl9Ew==
X-Google-Smtp-Source: ABdhPJyenmhTxFRDWjoJTAfZ9z3NaV+DCbnu64Fauv9XbNcdJIz9d1gaggKnqTTQxm1DBo/NklsnPQ==
X-Received: by 2002:a1c:de8a:: with SMTP id v132mr2244614wmg.173.1603215785045; 
 Tue, 20 Oct 2020 10:43:05 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:04 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/mediatek: dsi: add support for mipi26m clk
Date: Tue, 20 Oct 2020 19:42:50 +0200
Message-Id: <20201020174253.3757771-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MT8167 SoC needs an additional clock to be enabled. Add support for
the mipi26m clk.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 461643c05689..08786734df8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -193,6 +193,7 @@ struct mtk_dsi {
 	struct clk *engine_clk;
 	struct clk *digital_clk;
 	struct clk *hs_clk;
+	struct clk *mipi26m;
 
 	u32 data_rate;
 
@@ -653,6 +654,12 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		goto err_disable_engine_clk;
 	}
 
+	ret = clk_prepare_enable(dsi->mipi26m);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable mipi26m clock: %d\n", ret);
+		goto err_phy_power_off;
+	}
+
 	mtk_dsi_enable(dsi);
 
 	if (dsi->driver_data->has_shadow_ctl)
@@ -710,6 +717,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
 	clk_disable_unprepare(dsi->engine_clk);
 	clk_disable_unprepare(dsi->digital_clk);
+	clk_disable_unprepare(dsi->mipi26m);
 
 	phy_power_off(dsi->phy);
 }
@@ -1086,6 +1094,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
+	dsi->mipi26m = devm_clk_get_optional(dev, "mipi26m");
+
 	dsi->hs_clk = devm_clk_get(dev, "hs");
 	if (IS_ERR(dsi->hs_clk)) {
 		ret = PTR_ERR(dsi->hs_clk);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
