Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22A792CAA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015610E282;
	Tue,  5 Sep 2023 17:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233010E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2be32d17f04so43447311fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935836; x=1694540636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uOqmerGvTSg2KHk6AGJXGCXGcyQjRDDbjTmiUMSJN8=;
 b=rA5RTapQtlhsC4TRBkjllH/8s0i0b0AmjAkFIJ0qGtHVBO6V6Qx4ZAqEc/QGOLxFPp
 ELPuM2Wtp5wfYziqNV3mjg1cUgwrV/SWwprd3Zy/q25dqbloNq5PM0r8MbEhfKYppRQI
 asDmlTC2a2OG69CsCPas1lSQjG6cO4tHdiHpb5EkVCMPI7nvgR5GzPaFKc0Feu9pNLGd
 kdGsdEFG0mwWudwDswKqpqieqMsUq3ajTNjxbr3VgIm0PoZ7gciLz3rkVZe9a2JysTC1
 neSPTybUg01UKzKLWDUfxs6tZsnfrk2kW0yhWavFIzThGgq0F/PX1Zt3EgQxAPj47EJi
 BrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935836; x=1694540636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uOqmerGvTSg2KHk6AGJXGCXGcyQjRDDbjTmiUMSJN8=;
 b=N+aXpgVjOrq2QkmLCTGvHG1+66uld6hrxSt8ATpjnKw9YsbgorjBzHmjcLIk1rBzra
 AZRqL8yi07Srt3rWtlFHUjtbMM7r1glgsviVreoAvisvjB1S/Hl4SsHxq0fp0oA6T6Dz
 zEJvij3877nlZBT6ZTFQgZV/DZsOGAzWLNLnJoS5kloLTYdIcSAO9M6uJLGvlwhSaX9L
 BPIDChGEDobF6LxI/ZgiERp8nfIZx8dI4zRQ0IPJ/GcxNIYaSH0OdOPOQt0D/DJYA3bZ
 lg9TLkysT+N8CYLbWmxgtVJV8bsqDSDlLJqWImk7tSdTiOdo75/e3MvdP3162CUw34Oo
 s6GQ==
X-Gm-Message-State: AOJu0YwXQ5UDMzlFEKMqAT1Hd5etQat9xoMi0qkzvg7jUlEP7EUU2gNr
 gU0LNAmMR9heMi5x1R/FSzRSuw==
X-Google-Smtp-Source: AGHT+IFqKq8IzHRLohEGFtoXgB2/40bIW0rjb7SrIT6YuKN6nzsmuaUPPbHHu4qm/p4Igaob2dclxg==
X-Received: by 2002:a2e:9cc5:0:b0:2bc:ffcc:6cc0 with SMTP id
 g5-20020a2e9cc5000000b002bcffcc6cc0mr307906ljj.17.1693935836247; 
 Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/6] drm/msm/dpu: support binding to the mdp5 devices
Date: Tue,  5 Sep 2023 20:43:50 +0300
Message-Id: <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

Existing MDP5 devices have slightly different bindings. The main
register region is called `mdp_phys' instead of `mdp'. Also vbif
register regions are a part of the parent, MDSS device. Add support for
handling this binding differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 88 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h           |  3 +
 drivers/gpu/drm/msm/msm_io_utils.c      | 18 +++++
 3 files changed, 91 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..a9ba67e24e11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1054,37 +1054,53 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int i, rc = -EINVAL;
-	unsigned long max_core_clk_rate;
-	u32 core_rev;
+	struct platform_device *mdss_dev;
+	int rc;
 
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
+	mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
+
+	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp_phys");
+	if (IS_ERR(dpu_kms->mmio)) {
+		rc = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", rc);
+		dpu_kms->mmio = NULL;
 		return rc;
 	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
 
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
+						  dpu_kms->pdev,
+						  "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", rc);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return rc;
+	}
 
-	dev->mode_config.cursor_width = 512;
-	dev->mode_config.cursor_height = 512;
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
+						   dpu_kms->pdev,
+						   "vbif_nrt_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
 
-	rc = dpu_kms_global_obj_init(dpu_kms);
-	if (rc)
-		return rc;
+	return 0;
+}
 
-	atomic_set(&dpu_kms->bandwidth_ref, 0);
+static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
+{
+	int rc;
 
 	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp");
 	if (IS_ERR(dpu_kms->mmio)) {
 		rc = PTR_ERR(dpu_kms->mmio);
 		DPU_ERROR("mdp register memory map failed: %d\n", rc);
 		dpu_kms->mmio = NULL;
-		goto error;
+		return rc;
 	}
 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
 
@@ -1093,14 +1109,50 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
 		DPU_ERROR("vbif register memory map failed: %d\n", rc);
 		dpu_kms->vbif[VBIF_RT] = NULL;
-		goto error;
+		return rc;
 	}
+
 	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
+	return 0;
+}
+
+static int dpu_kms_hw_init(struct msm_kms *kms)
+{
+	struct dpu_kms *dpu_kms;
+	struct drm_device *dev;
+	int i, rc = -EINVAL;
+	unsigned long max_core_clk_rate;
+	u32 core_rev;
+
+	if (!kms) {
+		DPU_ERROR("invalid kms\n");
+		return rc;
+	}
+
+	dpu_kms = to_dpu_kms(kms);
+	dev = dpu_kms->dev;
+
+	dev->mode_config.cursor_width = 512;
+	dev->mode_config.cursor_height = 512;
+
+	rc = dpu_kms_global_obj_init(dpu_kms);
+	if (rc)
+		return rc;
+
+	atomic_set(&dpu_kms->bandwidth_ref, 0);
+
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
+		rc = dpu_kms_mmap_mdp5(dpu_kms);
+	else
+		rc = dpu_kms_mmap_dpu(dpu_kms);
+	if (rc)
+		return rc;
+
 	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 02fd6c7d0bb7..fdcbb02fa396 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -485,6 +485,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *dev,
+			       const char *name);
 
 struct icc_path *msm_icc_get(struct device *dev, const char *name);
 
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index 59d2788c4510..9d0d76f3a319 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -50,6 +50,24 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 	return clk;
 }
 
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *pdev,
+			       const char *name)
+{
+	struct resource *res;
+	void __iomem *ptr;
+
+	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	ptr = devm_ioremap_resource(&pdev->dev, res);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	return ptr;
+}
+
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
 				  bool quiet, phys_addr_t *psize)
 {
-- 
2.39.2

