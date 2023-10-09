Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E655E7BE89E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3E10E296;
	Mon,  9 Oct 2023 17:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7810E0BA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:48:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso6348799e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696873723; x=1697478523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/chvZNkOAPCM4yUDgRtU7R4U+Xkrk2E5nKrKDhgris=;
 b=gBD8fel8mS/2hBEA4FNgR1ctrrno0Igh+s9cfBuOWOqc/8RzndtL5jgExD8TgPYMbc
 SCNZqWjAV4VEpgY969r/faQB2PIylZCETNYlHNock5wsWPiMjwl9ixxrQahHL/+wE60W
 yzs9WBg0gHGm040XSoBGgBTXxhGe3w36ZGt6a+/BROBbjilSZDpszMycdGicXqKxEz4T
 Ba5GH0U7147ToX9Nt8NeuES4hsLjTYGi+tqcyl7rPGj1vtwE27rARohmlzjJjmgteaHo
 rRPNZr68B7zOC/XkgR2RagSqA59U8+EhTZWY/WCXRwYyLd2bZJkUtzelMQqxcA9ZCAjb
 lemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873723; x=1697478523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/chvZNkOAPCM4yUDgRtU7R4U+Xkrk2E5nKrKDhgris=;
 b=CtumsBLOM3qhBPyiLaGi7epFA3hOTAWvSt/RzlHo+iEuZfkKzt7xXRj6FTKEGQksvB
 tf9KSG9ctj+uDrRp5tUAsQA+RwdVOu614q5K186+mkiSxb+ejsi7shhagdNWensVi9qk
 uVhaQTr/GhzLgY9mDxdXnhCILiuaYjJRVjOj1KfVKvVI3zCrXS+7uIA6YFAIRVz716jz
 vQYM19lOO3yrCg8YvXOHHQLDaNwdqYmHgW0KkkZG7qwZk/rpwcJ10AJIKEkCFjPD320D
 NdOBERRzVHCjSjETs6lIGmN2Yt0p1Cgwlc5SjDwtp5f9kr+lRuIbRgU0+vJjnBuf/Kto
 YhGw==
X-Gm-Message-State: AOJu0YxhVSuw3Shz3G/OJcLLYg3sswxYAUh6KPSuhy73f7e1jH3CEV6p
 X/ajTy/CWohDcJbIMH4HO6i0uA==
X-Google-Smtp-Source: AGHT+IGbrnH3yesbV/VzvO4GbUuJ8UBZAlHmq0Fkq+JpJvbFTplTvZ9bTDTRA43WqOxhbloSrgcO4g==
X-Received: by 2002:a05:6512:39d0:b0:504:51e9:89a2 with SMTP id
 k16-20020a05651239d000b0050451e989a2mr20666577lfu.32.1696873722805; 
 Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 2/4] drm/msm/dpu: move resource allocation to the _probe
 function
Date: Mon,  9 Oct 2023 20:48:38 +0300
Message-Id: <20231009174840.2726861-3-dmitry.baryshkov@linaro.org>
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

This also drops devm_iounmap() calls. It is too early to have them
_dpu_kms_hw_destroy() (or it will break if for some reason DPU device is
rebound into the composite device) and it doesn't make sense to have
them in dpu_dev_remove (as everything will be torn down by the devres
anyway after the device is unbound from the driver).

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 133 +++++++++++-------------
 1 file changed, 61 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 41bd57597381..12d604b6b7e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -389,8 +389,7 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
-	struct drm_device *dev = dpu_kms->dev;
-	struct device *dpu_dev = dev->dev;
+	struct device *dpu_dev = &dpu_kms->pdev->dev;
 
 	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
 	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
@@ -829,21 +828,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
 	dpu_kms->catalog = NULL;
 
-	if (dpu_kms->vbif[VBIF_NRT])
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_NRT]);
-	dpu_kms->vbif[VBIF_NRT] = NULL;
-
-	if (dpu_kms->vbif[VBIF_RT])
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_RT]);
-	dpu_kms->vbif[VBIF_RT] = NULL;
-
 	if (dpu_kms->hw_mdp)
 		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
 	dpu_kms->hw_mdp = NULL;
-
-	if (dpu_kms->mmio)
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->mmio);
-	dpu_kms->mmio = NULL;
 }
 
 static void dpu_kms_destroy(struct msm_kms *kms)
@@ -1079,30 +1066,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
-	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp");
-	if (IS_ERR(dpu_kms->mmio)) {
-		rc = PTR_ERR(dpu_kms->mmio);
-		DPU_ERROR("mdp register memory map failed: %d\n", rc);
-		dpu_kms->mmio = NULL;
-		goto error;
-	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
-		DPU_ERROR("vbif register memory map failed: %d\n", rc);
-		dpu_kms->vbif[VBIF_RT] = NULL;
-		goto error;
-	}
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
-	dpu_kms_parse_data_bus_icc_path(dpu_kms);
-
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
 		goto error;
@@ -1241,33 +1204,11 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms;
-	int irq;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
-	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1280,26 +1221,74 @@ static int dpu_kms_init(struct drm_device *ddev)
 		return ret;
 	}
 	dpu_kms->dev = ddev;
-	dpu_kms->pdev = pdev;
 
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	dpu_kms->pdev = pdev;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	dpu_kms->mmio = msm_ioremap(pdev, "mdp");
+	if (IS_ERR(dpu_kms->mmio)) {
+		ret = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+		dpu_kms->mmio = NULL;
+		return ret;
+	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return ret;
+	}
+
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
+
+	ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	if (ret)
+		return ret;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static void dpu_dev_remove(struct platform_device *pdev)
-- 
2.39.2

