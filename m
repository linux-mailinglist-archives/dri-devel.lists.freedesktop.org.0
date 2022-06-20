Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C155266E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 23:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972610F3D5;
	Mon, 20 Jun 2022 21:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C2E10F3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 21:31:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f39so3591708lfv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yP+P6IJQ0i72s/KiVTiNdt1xKwYjg9nXfM1TumgrgW0=;
 b=mvllWKmTmq2f+xTm1FJYJRAnt1Rxxz8eboJq8zxrxMlhpa5C2jaZMbo0wfq4JCAHHy
 Y84eiOmj1rehoUputTXVf0iuKuk4N/xONH1P9cJ6WXm0oKAFdN/X3b3YQI0ZIWDXfkAt
 n3fA9Tkbhon3TCDZPl6G1WcsLt9uphIMmbBXgiAnngkcX4iFAwI8NIEGMb8rOfEpFTZy
 Iulf1SIb/ZrPOv7APh9Q4T2N93G+5OETDX0LpLjvGWkaBBR6zccPPxsOqGoTHsVMgseW
 /YiMVrR21wGrp9ZzdM1+ztqoZhaw0VXcGn9rBE9Vl/Dz3LZ06XSSRoNRRqv/BGtbaIkf
 ecyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP+P6IJQ0i72s/KiVTiNdt1xKwYjg9nXfM1TumgrgW0=;
 b=RgLlDunA7ImzofaVf770B3WGBHMOsK+PfZRHMINm7GRnE3E9wLAXb9Cvolhjr3Fy0P
 bEZltSd7Uohm0sUdkGbVpHkCdVRmivnCAr0+D14H2ksRfDeBaaG7lUiefhQxuQv2Ptbk
 8bAg7RI3Eocj+/hQnvQ0OiVEVi1h39Xl6Gu2p1AQYj27bLnxH4xE4AmXCIL2Psh3rw1t
 ye0ChWobf13OarSNxWJ7hSeP6pRnWWrshxHAl3QC+i+lnurWWvKCieaeTcvcYEMqCTF9
 dr/K3PCC4j+eHHm4rnJaNmkDA4TeXMCUpNCziulYtO54sHi76LSMiodraquVAEWTzHuo
 r2TQ==
X-Gm-Message-State: AJIora9VLIVCrahz/kkOuxwtVa+S/9UyTzzpSMYCM67fSwBEnqm55aax
 hA8d1DLb0WstkxAa5hHpeXFE+g==
X-Google-Smtp-Source: AGRyM1urpItppQcrZk4V9waoq5Tg3kck+QC+bu9Cvu3rDFkk4xRM7emA08T1KInI1rfctYGTn9NL1Q==
X-Received: by 2002:a05:6512:1051:b0:479:6428:7a59 with SMTP id
 c17-20020a056512105100b0047964287a59mr15093000lfb.222.1655760659660; 
 Mon, 20 Jun 2022 14:30:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:30:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 3/4] drm/msm/mdp4: move resource allocation to the _probe
 function
Date: Tue, 21 Jun 2022 00:30:53 +0300
Message-Id: <20220620213054.1872954-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
 1 file changed, 51 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 41dc60784847..6499713eccf6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -139,8 +139,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 		pm_runtime_disable(dev);
 
 	mdp_kms_destroy(&mdp4_kms->base);
-
-	kfree(mdp4_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
@@ -383,57 +381,27 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp4_kms *mdp4_kms;
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct iommu_domain *iommu;
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
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
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
@@ -442,24 +410,6 @@ static int mdp4_kms_init(struct drm_device *dev)
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
@@ -474,10 +424,9 @@ static int mdp4_kms_init(struct drm_device *dev)
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
@@ -560,7 +509,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
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
 
 static int mdp4_remove(struct platform_device *pdev)
-- 
2.35.1

