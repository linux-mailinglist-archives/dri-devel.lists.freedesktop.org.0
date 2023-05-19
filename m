Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A3709B9E
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9A710E546;
	Fri, 19 May 2023 15:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1701C10E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 15:49:43 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ac8d9399d5so39275671fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684511382; x=1687103382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnOy3xXVbZBcw8tuSp38bYTCu1PvdF8k1HAWiCvu54c=;
 b=VVkR2j/NOlOxHM/B7faQwk8qAx3TeoxX8ZLAfFNPxP6hFUbXZp+NSG5VKylzZNeIT8
 VWoegMs/s9JiiunagKPhteWANGdCT0RDgucig0YlP0j2/1sajx9RjdH31bWK7I+QpDQ/
 5vhJYyFATJoLrg0KA7B79OMue9inxxI+YroL99O9SBeDcx2thAQoc0H+UG60GHDGoBUp
 ibdUcusD/QcVAorhVRlD4d2UdzsOsD/4ol02ieK9DAr5LK29TDEOzkCO82t882CqIw7y
 PFhDSntGWja8cuu6Da8GIod3sQmYt4q/UzSkTE8IjtCFIZfC1K6t/wPZAavDOab5MDVg
 e7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684511382; x=1687103382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnOy3xXVbZBcw8tuSp38bYTCu1PvdF8k1HAWiCvu54c=;
 b=cHcYm+aqIzKAsfWvL5PBGgDF+NbMPI/W0TaVpjvFsyl+0E9Dak+1UajeKvppkhwxhq
 NW+Lt50cnUetutICf2Yx+89Zm08ISD+Upv/5MSM3bEEO1RDOaNonh2SaqOSSR5KPnlgU
 fT4Jb9qUXFM65E0XQmoQTj8LnxSQq+uSzYH0dRTDAA1ekPgbWh8EImiUfBP0N5/jVMSE
 XauTT/iBnbhM6JIIO5KWknEVKmCJhJ8koTupK/GAz4UvF6Bisi2TDvyVB5dimME/LSU9
 5Lhk7uwCv8FpEBVwneeP+UTeRudw+yBHnfsw5GtbbDQ0f86ErmZNz4LZZhOdZis3o+6k
 fAqA==
X-Gm-Message-State: AC+VfDwnEj8XDA6xtDe1OB/QLoqQVVSdMOwPFjovYu0XM+NgfP3FAhCo
 hjc8xAPO3o6gXa8sMa++XIbKQw==
X-Google-Smtp-Source: ACHHUZ5unJI7LT83cS2mbrlmzrYyfmxct/dzSY9H+Vz1NTmvfESLjsasBB6t3LWhi88e2P8kNYRPWQ==
X-Received: by 2002:a2e:984d:0:b0:2ad:dd7e:6651 with SMTP id
 e13-20020a2e984d000000b002addd7e6651mr989010ljj.43.1684511382103; 
 Fri, 19 May 2023 08:49:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 08:49:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 4/4] drm/msm/mdp5: move resource allocation to the _probe
 function
Date: Fri, 19 May 2023 18:49:38 +0300
Message-Id: <20230519154938.3929839-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
References: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
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
probe callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++++-------------
 1 file changed, 44 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7fd89c93a491..2881bf17d649 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -554,20 +554,16 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct platform_device *pdev;
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
-	struct msm_kms *kms;
+	struct msm_kms *kms = priv->kms;
 	struct msm_gem_address_space *aspace;
-	int irq, i, ret;
+	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
 
-	/* priv->kms would have been populated by the MDP5 driver */
-	kms = priv->kms;
-	if (!kms)
-		return -ENOMEM;
-
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+
 	pdev = mdp5_kms->pdev;
 
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
@@ -576,15 +572,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
-	kms->irq = irq;
-
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
 
 	/* make sure things are off before attaching iommu (bootloader could
@@ -787,60 +774,23 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_cfg *config;
 	u32 major, minor;
 	int ret;
 
-	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
-	if (!mdp5_kms) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	spin_lock_init(&mdp5_kms->resource_lock);
-
 	mdp5_kms->dev = dev;
-	mdp5_kms->pdev = pdev;
 
 	ret = mdp5_global_obj_init(mdp5_kms);
 	if (ret)
 		goto fail;
 
-	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
-	if (IS_ERR(mdp5_kms->mmio)) {
-		ret = PTR_ERR(mdp5_kms->mmio);
-		goto fail;
-	}
-
-	/* mandatory clocks: */
-	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
-	if (ret)
-		goto fail;
-
-	/* optional clocks: */
-	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
-	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
-	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
-
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
 	pm_runtime_enable(&pdev->dev);
 	mdp5_kms->rpm_enabled = true;
 
@@ -931,15 +881,53 @@ static int mdp5_setup_interconnect(struct platform_device *pdev)
 
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct mdp5_kms *mdp5_kms;
+	int ret, irq;
 
 	DBG("");
 
+	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
+	if (!mdp5_kms)
+		return -ENOMEM;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
+	mdp5_kms->pdev = pdev;
+
+	spin_lock_init(&mdp5_kms->resource_lock);
+
+	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(mdp5_kms->mmio))
+		return PTR_ERR(mdp5_kms->mmio);
+
+	/* mandatory clocks: */
+	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
+	if (ret)
+		return ret;
+
+	/* optional clocks: */
+	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
+
+	mdp5_kms->base.base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
-- 
2.39.2

