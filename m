Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F45747803
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 19:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B147E10E309;
	Tue,  4 Jul 2023 17:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6810E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 17:45:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso9438171e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688492756; x=1691084756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHTrgKfFcRKzVIctqRvTHb6iki9OEIlz2ugj/l8crtg=;
 b=UNTo8TA9fqjrRbfVe/oQN+adhrLgZ4XQlDfyPoT2EQv7p9VQnEhA5ZXvIAkIS4Z40k
 61oYc4rlhSV6kmKz2/V0z0F+oAt8LTOPkWM98R0K6aysk6KMxnlVpyB42SN/j00Ay/Dz
 tdqyFsud24MmfDxH+w0maO5MJR+ag/o4JzFfW37Q/qCURkJyt9Xwubx7nRGd1fVreF9T
 sK5gRj0ceOCWeYUGI4bK/pPivDUpjG1GuRoUSOHVW5GyMwFKopT+5GbfE/C3IjXcEEvt
 sAao2imTwtDOFp9JnpWjgQygJXW6mwav+Z+iHshWjRkN8WeIldAjIPBZzwd8xFIIu5Jc
 s8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492756; x=1691084756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHTrgKfFcRKzVIctqRvTHb6iki9OEIlz2ugj/l8crtg=;
 b=KHkCvtwoYxazR3IzaV0sxN5kFc3CNI10UGzgveFhGTDZ6ihlfLS3Mtfa9CNlXhdUh8
 09wNeCf0b112+0Rjf5UX5le3zngpAk+IrUGwBYXvP2bEm56FY/ngfSkWft0mV09F5m/P
 vDuqe9Y02mDQJlOXyInwT9oLMb7fGeNZ7VTowb2379G+C6wLQRIsKsIJ0itI6I8vVqQR
 3fgK0JhHcYiD8poPUQ8LE0A8V3acxM//2XMPmldpzyrsGmppsoPvFFiT3wMkGb8cU5ox
 W5lDpHL+FLxuyVW4qbQNGr+qbL/LZXEBdshoI25s4WBDdAEMYNua1ruu+chJAbJ31EDI
 OhGQ==
X-Gm-Message-State: ABy/qLZOxt7QAw4L9hMM1BGCb/Kt1s91fWsSJJ4tApJq5txB6d29OrLO
 PiSSlpUI+HG3P6aJaLxtZMBH6A==
X-Google-Smtp-Source: APBJJlE5Lp8TBm59s/LU7Cyadob3uPlibX65Ol1LdMcnX5Wqk+FiXBs7nOXaPnS2f9pE1MkhnTuiDw==
X-Received: by 2002:a05:6512:3d0f:b0:4f9:58bd:9e5c with SMTP id
 d15-20020a0565123d0f00b004f958bd9e5cmr10738953lfv.3.1688492756172; 
 Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:45:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 2/4] drm/msm/dpu: move resource allocation to the _probe
 function
Date: Tue,  4 Jul 2023 20:45:51 +0300
Message-Id: <20230704174553.216248-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
References: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 133 +++++++++++-------------
 1 file changed, 61 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 22e5b430770e..e819e6f47bc1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -388,8 +388,7 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
-	struct drm_device *dev = dpu_kms->dev;
-	struct device *dpu_dev = dev->dev;
+	struct device *dpu_dev = &dpu_kms->pdev->dev;
 
 	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
 	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
@@ -830,21 +829,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
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
@@ -1038,30 +1025,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
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
@@ -1186,33 +1149,11 @@ static int dpu_kms_init(struct drm_device *ddev)
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
@@ -1225,26 +1166,74 @@ static int dpu_kms_init(struct drm_device *ddev)
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
 
 static int dpu_dev_remove(struct platform_device *pdev)
-- 
2.39.2

