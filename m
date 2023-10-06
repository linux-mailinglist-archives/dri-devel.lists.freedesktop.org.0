Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CA7BB93C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A4110E4FB;
	Fri,  6 Oct 2023 13:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7BC10E4FD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:37:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5041335fb9cso2747133e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599444; x=1697204244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyJMLPywgfD3zTWmrTHppa2YLQ4qubiZc1LQVFl5178=;
 b=GwPXG9RcLHz9dDiqgpFVkJcdk1TH9fKeh5GJ+WEoWVmpaYWiwDgO2ZJgq69euc2hK8
 xGDQ2TZC5kV1UXQ/R+sYh1FKeiAdz646yyKfayPMfKsSb5INWg/AJBIFtrQu3zy4poKk
 KK+4P8b4mwcJF9FS/KH5vqv2vXj4PpafXeYhhO7PXrdKdMGChGu5zKZidpZ947/qViUd
 c3sRhLdGE/7M+WhUsnmoQ1E0rUmfqSfKBc8q/cD0HfHD7US60+DlGj/FCPPDpeqXgp68
 1ACy9endyma8RQjHZGN9aoX1f8vUGPZzvUgpDbJWpwvZguw9pPB0X+svTLdDz17O/V8n
 v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599444; x=1697204244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyJMLPywgfD3zTWmrTHppa2YLQ4qubiZc1LQVFl5178=;
 b=UjradSV84arVx+eH1nFYxN2K9cx0n/Qr2d7ypAifTcaTfnhruiWKLJIROk8KOtoaSd
 05ZM1fD9NG8uDb1qI/EEbIvU3u6lKWoSzHsRKCyJtxg7UzsM6Ro44t9OeNuh6QVeMZeh
 YXewFsLOMlyVLBP/Et0ADnw1auL8Iv+RxJfUWb0ZmMUV3dGRA4h9sxT1jQGp0eGb6YpL
 og723uczIbp5KMErR8oGrxqzz28bXN9XdK8NOAk0NmG9OLYvuEVbMvkccVtgzlN49Rch
 0niboCbpaqYzOTVaZck2qcyeMtycIJHI9i42s4WLsE5IFaMZvSaa2o8J96fSz/Hmo1SD
 Ltmw==
X-Gm-Message-State: AOJu0YyfCuvMBiaXu/nwrIJaMEsLxOrHL5EhHkZTPHxQqZo92esxacRd
 J0U6DZcd4H6jL7iJODhymZto3g==
X-Google-Smtp-Source: AGHT+IH6c2ZYwGnOkl33KIei9yXzOw5rsLB1ZiighPCughyBVaqBkrAqKQdB+hxQZ9tpdW15OCtWnw==
X-Received: by 2002:a05:6512:ba7:b0:500:a3be:1ab6 with SMTP id
 b39-20020a0565120ba700b00500a3be1ab6mr8799100lfv.6.1696599443728; 
 Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/5] drm/msm/dpu: support binding to the mdp5 devices
Date: Fri,  6 Oct 2023 16:37:17 +0300
Message-Id: <20231006133720.2471770-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/msm_io_utils.c      | 13 ++++
 3 files changed, 86 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 82381d12414d..20ba03e9c936 100644
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
index e2fc56f161b5..6eeb3517c3e4 100644
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

