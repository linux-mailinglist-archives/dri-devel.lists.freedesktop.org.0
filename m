Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB48825D26
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECFE10E6C2;
	Fri,  5 Jan 2024 23:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9972810E6AF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 23:34:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e78f1f41fso63197e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 15:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704497659; x=1705102459; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3T5J8bNQK5XAdBehncduzCFxSoGLPqlnF2Hr6/4OwAc=;
 b=ddthgfzEoDKiNdHg1FY6/lTsr1h9H5ssg/xxbJgg3QLHkKneW9WNnwPYe4Dv3zaCBH
 5GNVs/XaiqJSN2nziV6aD/fWdXttM8h2jwuPLUJbakVeXq2rWA3YIubU7ly4OrLvWl+f
 D9FX2VuCvOZkzi6VQKL3kGfFrObKsxO/j5im8/qIN4g0fV+/rKcEmXLjPWqajGGrD19o
 uNN9LTS+FupzskvdHz001myWpypRa7IBLQJ3RLaBFPEPPzZ+wIsTzxz85biEpq95qwvk
 lG40yIkv+rwpHLmXWFYg3i8KM1aVeXajeWgPKnk+QEwl3cmdZhYzFw4S8R1gUhdXuQaf
 i+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704497659; x=1705102459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3T5J8bNQK5XAdBehncduzCFxSoGLPqlnF2Hr6/4OwAc=;
 b=tvAxU/dE5qDx0bg5bkF3xJjXG5mvs/BP+wfWD0x9otMBUCSC0jVJd6pheaRm61CFHg
 7SWoMnwFE1PX0YZYLObWzKwlWlyh6XNQHUvvKGN+BOhEyzCRhm7IxOiouQAQOVbvHm+q
 mGRSH2hvW8CshKW1hvpS5Q30dMldV1xmv8kKQaRxXPK3ZxXVCMqPFcmCfpnt2QIm/xfx
 HTA79sNvd1s6YUzCF1pZ4p7Sob1JKerNL8Dhs3vWZbENJREZU1t9LAXO6Wjtycmia2jT
 Voo+tn/PoBavD1UipnzHtqvGJfGjO9T4OKINYkdyBfvIFtlnlFojksHxiJKd0DAfyD4t
 h9tg==
X-Gm-Message-State: AOJu0Yyil7ueDuuf1wo3HpCeWrmdffYiXf9UGNHgutd2mkU8xCSVOjYf
 xqql8tWNpcbgzewJFCuz9bKfan+2siM5ew==
X-Google-Smtp-Source: AGHT+IHKWE78pMyEjlTpgPNa1sUMzNcI+WPVxfGXQ8Wb1NYK0/u1LUCOQwSo6DSENPY0rC9OYWezvw==
X-Received: by 2002:a05:6512:246:b0:50e:4acb:3d0d with SMTP id
 b6-20020a056512024600b0050e4acb3d0dmr65443lfo.47.1704497658844; 
 Fri, 05 Jan 2024 15:34:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac24f04000000b0050e74d04c8asm362211lfr.132.2024.01.05.15.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:34:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:34:16 +0200
Subject: [PATCH v3 2/4] drm/msm/dpu: support binding to the mdp5 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-migrate-mdp5-v3-2-3d2750378063@linaro.org>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5597;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=r6/gCr+xdab3sdKL6gyWMEBbRFCgBrcmQFNSej3FNt4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJH3hkLeNpca5eBe7y5aspXQ7mzoe0WXri4OI
 ml2TKAybc+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiR9wAKCRCLPIo+Aiko
 1aYnCACL5b6aY3/WBVU0bHnAtiSYAggE5sIpLL9DBYnCl9x56LYDer3A3MLpui4oSh09ZL+fHES
 im2z/U0d/I6rqRi53pBWdRLA/oVkdgRmc9JOj0mf9hMI2Xpc0v1J9sZZr3y7JbypSumNTlKeBUN
 muozWQ4OTUcz4fyVhq706SBY9ebMo/zbpGLrrW8I5jS92qz/Cdy7LV+UJVs/J9E0CFyNdoXKlzh
 OeXi7QhhvN4nQbooKV7zFi95i8FH7pbB2cUdm7Uiku6DQgS6ADJVQIMZzI1vdtBPM42nfRQB+09
 3Bjyiru4YK/nSzRJBvmSyN2zrl62lZ/MXmBRmMiLxQ7DMhFG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing MDP5 devices have slightly different bindings. The main
register region is called `mdp_phys' instead of `mdp'. Also vbif
register regions are a part of the parent, MDSS device. Add support for
handling this binding differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h           |  3 +
 drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
 3 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..aa9e0ad33ebb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1197,6 +1197,78 @@ static int dpu_kms_init(struct drm_device *ddev)
 	return 0;
 }
 
+static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
+{
+	struct platform_device *pdev = dpu_kms->pdev;
+	struct platform_device *mdss_dev;
+	int ret;
+
+	if (dpu_kms->pdev->dev.bus != &platform_bus_type)
+		return -EINVAL;
+
+	mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
+
+	dpu_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(dpu_kms->mmio)) {
+		ret = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+		dpu_kms->mmio = NULL;
+		return ret;
+	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
+						  dpu_kms->pdev,
+						  "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return ret;
+	}
+
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
+						   dpu_kms->pdev,
+						   "vbif_nrt_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
+
+	return 0;
+}
+
+static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
+{
+	struct platform_device *pdev = dpu_kms->pdev;
+	int ret;
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
+	return 0;
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1230,28 +1302,12 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->base.irq = irq;
 
-	dpu_kms->mmio = msm_ioremap(pdev, "mdp");
-	if (IS_ERR(dpu_kms->mmio)) {
-		ret = PTR_ERR(dpu_kms->mmio);
-		DPU_ERROR("mdp register memory map failed: %d\n", ret);
-		dpu_kms->mmio = NULL;
-		return ret;
-	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
-		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
+		ret = dpu_kms_mmap_mdp5(dpu_kms);
+	else
+		ret = dpu_kms_mmap_dpu(dpu_kms);
+	if (ret)
 		return ret;
-	}
-
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
 
 	ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd..01e783130054 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -476,6 +476,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *dev,
+			       const char *name);
 
 struct icc_path *msm_icc_get(struct device *dev, const char *name);
 
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index 59d2788c4510..afedd61c3e28 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -50,6 +50,19 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 	return clk;
 }
 
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *pdev,
+			       const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
 				  bool quiet, phys_addr_t *psize)
 {

-- 
2.39.2

