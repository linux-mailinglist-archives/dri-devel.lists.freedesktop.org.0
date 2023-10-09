Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA07BE8A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE010E290;
	Mon,  9 Oct 2023 17:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAC510E290
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:48:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so6032927e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696873723; x=1697478523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l++4rL4XecTw0084NzypTs/OyWZ9YQbmVr6dxqDns8=;
 b=xNvyv9qBRVFzeR6r7Oq6FAwpPD/fZO/Xyv/OYZc1oIu1kA/1xIh/4i2Cu+MDE5b/he
 oZ1tVt9KgCEzFv3Pbxqygy6jkD0cUtH6Bw0BKmvIMNjwBpw/y9RIEdPVzo3hnGhmAx7B
 DmAnu/NwEWxbWBXzllu1EcM1L8oKtmeBhDkjBfe/7CPEOjbMuFklh55Mw9nuljQDubuI
 +9qWElWvPrhxOCTHVVP4vLnIMlca0WXye0kG+cnjfYIxZqX7TeLr2YNiQMkZe4rkTbFO
 K360I4Mt20osQxvzYCgoeoU9RAIZbZhjKNZGstkt+R3MHAdqcY2YNBNglp8GU33VDu0e
 h83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873723; x=1697478523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/l++4rL4XecTw0084NzypTs/OyWZ9YQbmVr6dxqDns8=;
 b=lPH+HJhPRYbHwOSTJYrF5ERMMYFYkDQq9XyAZKC3guA6sUbtnSy5+w0JVbkkUzZogZ
 C31LQteSbOwTL4oe+NKZQApoZrJnZZ7ktTfr39mlyt+F5mq17fLdug952aOEzNz3HybY
 5DH1TZl4OPCevl4yLv0SEVbE7z2wq8cCxU2ID2UFVMu5Eb9A9iIfxw+LT+/l6gO1V59H
 tq/dhtVWj58fJTq+ZS0729l7PGQtPFRPc3dT1osSnRDTSKQDDPPrzEGp19+5gEbN5ux+
 tIN4AVbo4eFuQlG9jm/jwmNCR7aD8CodJAD1hpFMrx6r1lUIcC3G8IssIQZDwD5rfPKb
 aj8w==
X-Gm-Message-State: AOJu0YwSnBg84qpiN8A9YMWnXO3OeqQ7r9r9pPA8wUoUdy8JILwxrGzx
 k5Al8ttJG+ZHh9D7SPI1RsxlFQ==
X-Google-Smtp-Source: AGHT+IFr+V//dps6ByBx5GuZ/rNQl7CcNW8Nb5WWC31PYVzPKhNmW+78kSg/S5Vqp/p2ljgU39nvNg==
X-Received: by 2002:a05:6512:e96:b0:500:b3fe:916e with SMTP id
 bi22-20020a0565120e9600b00500b3fe916emr18247595lfb.2.1696873723425; 
 Mon, 09 Oct 2023 10:48:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:48:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 3/4] drm/msm/mdp4: move resource allocation to the _probe
 function
Date: Mon,  9 Oct 2023 20:48:39 +0300
Message-Id: <20231009174840.2726861-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
References: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 106 +++++++++++------------
 1 file changed, 51 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 807ca3961c5f..18735bbaf798 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -135,8 +135,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 		pm_runtime_disable(dev);
 
 	mdp_kms_destroy(&mdp4_kms->base);
-
-	kfree(mdp4_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
@@ -380,56 +378,27 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp4_kms *mdp4_kms;
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	int irq, ret;
+	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
 
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
-	if (!mdp4_kms) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
-		return -ENOMEM;
-	}
-
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		goto fail;
 	}
 
-	priv->kms = &mdp4_kms->base.base;
 	kms = priv->kms;
 
 	mdp4_kms->dev = dev;
 
-	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
-	if (IS_ERR(mdp4_kms->mmio)) {
-		ret = PTR_ERR(mdp4_kms->mmio);
-		goto fail;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto fail;
-	}
-
-	kms->irq = irq;
-
-	/* NOTE: driver for this regulator still missing upstream.. use
-	 * _get_exclusive() and ignore the error if it does not exist
-	 * (and hope that the bootloader left it on for us)
-	 */
-	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
-	if (IS_ERR(mdp4_kms->vdd))
-		mdp4_kms->vdd = NULL;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
@@ -438,24 +407,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 		}
 	}
 
-	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
-	if (IS_ERR(mdp4_kms->clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
-		ret = PTR_ERR(mdp4_kms->clk);
-		goto fail;
-	}
-
-	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
-	if (IS_ERR(mdp4_kms->pclk))
-		mdp4_kms->pclk = NULL;
-
-	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
-	if (IS_ERR(mdp4_kms->axi_clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
-		ret = PTR_ERR(mdp4_kms->axi_clk);
-		goto fail;
-	}
-
 	clk_set_rate(mdp4_kms->clk, max_clk);
 
 	read_mdp_hw_revision(mdp4_kms, &major, &minor);
@@ -470,10 +421,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_kms->rev = minor;
 
 	if (mdp4_kms->rev >= 2) {
-		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
-		if (IS_ERR(mdp4_kms->lut_clk)) {
+		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
-			ret = PTR_ERR(mdp4_kms->lut_clk);
+			ret = -ENODEV;
 			goto fail;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
@@ -557,7 +507,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct mdp4_kms *mdp4_kms;
+	int irq;
+
+	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
+	if (!mdp4_kms)
+		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
+
+	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
+	if (IS_ERR(mdp4_kms->mmio))
+		return PTR_ERR(mdp4_kms->mmio);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	mdp4_kms->base.base.irq = irq;
+
+	/* NOTE: driver for this regulator still missing upstream.. use
+	 * _get_exclusive() and ignore the error if it does not exist
+	 * (and hope that the bootloader left it on for us)
+	 */
+	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
+	if (IS_ERR(mdp4_kms->vdd))
+		mdp4_kms->vdd = NULL;
+
+	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
+	if (IS_ERR(mdp4_kms->clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
+
+	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
+	if (IS_ERR(mdp4_kms->pclk))
+		mdp4_kms->pclk = NULL;
+
+	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
+	if (IS_ERR(mdp4_kms->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
+
+	/*
+	 * This is required for revn >= 2. Handle errors here and let the kms
+	 * init bail out if the clock is not provided.
+	 */
+	mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
+	if (IS_ERR(mdp4_kms->lut_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
+
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
 }
 
 static void mdp4_remove(struct platform_device *pdev)
-- 
2.39.2

