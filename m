Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF9485D66
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9210E596;
	Thu,  6 Jan 2022 00:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8C10E571
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:43:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id s4so1530471ljd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGudmzCH+AInTPbZnOPpn7Q33sLqz600KKjlDY9DmNw=;
 b=e8NoV73GzoYGIlDFtP2vtSQQnR/ahK/IuUu2RCMcJQeHL5TAh2ypM0W8dCG0p5rnqL
 VsbLqnDdrjatkeIt7AKlQwusxEjJIzvWkVgx9++RrO20pIdYUep6LxQl/eFBUIsSjWFj
 paZtnA1ksRlXezxEOrJQN1gKUUNOW3NDPhgqK5uu1Q4igTlUVcFF6HJ4Jp4G9JXPQSPq
 4EbAOgu8uch334+MJ1dPxQ4c8Lt8LFDPzaHpSARIPQuQf2g6oeV++WsKmqDrJxnx/PJU
 +6g8fc+fiFqs4lycYSRXx8rzhB+dAJ3Fe5DXFOKDKNVtmmIOEkDpVh5qXr4yvak2XrCP
 Qeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RGudmzCH+AInTPbZnOPpn7Q33sLqz600KKjlDY9DmNw=;
 b=3mMxjAKIBp9aVpfVlezR7pKgxePbxAxkWrC5A7cSHLyEle/zCzT+aby66mTIlrdl6j
 J6UbiAiZHFXGQsz80IaYVoBjNK/Qxr5eJDhIjBpThisuLhY1rDruBVlf1IW0Tnyzsrm8
 fpL3MO81+cIcMezQBVKymu97CI0/oWR+pMxHh+HdJZltvUXZGrGLZunyVHAuCcJ53uqS
 0jE0cA9VIyTGUpRUAFSANQ6oVaEHxjOa82zntwD+NLQ2sraMnb0APotDyG6gXRf1YEW9
 fuV/uez/ieIo7Y7vfubh22m21tDuLu9M6Hzqm9BJLGCW4U3JmTl4bDfuGJBsnA4Ww7NK
 NCnA==
X-Gm-Message-State: AOAM530A047X006bmY7EO+tcTpB/of1dkClzzBbd5kRdCfSFew6Jtibi
 42NeI2xxlshg9xaYOvC0OHeyvhMFOdgnlw==
X-Google-Smtp-Source: ABdhPJyAPwu+FQfZIiB96MninkAAdt1n8SuhHpGOwRhzKYBoEFXSnFBSfXTtH7IBZ6g8sqy0/zwg5A==
X-Received: by 2002:a2e:8643:: with SMTP id i3mr26711316ljj.163.1641429785815; 
 Wed, 05 Jan 2022 16:43:05 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 16:43:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Subject: [PATCH 4/4] drm/msm: stop using device's match data pointer
Date: Thu,  6 Jan 2022 03:42:57 +0300
Message-Id: <20220106004257.451572-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
References: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's make the match's data pointer a (sub-)driver's private data. The
only user currently is the msm_drm_init() function, using this data to
select kms_init callback. Pass this callback through the driver's
private data instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++---
 drivers/gpu/drm/msm/msm_drv.c            | 38 ++++++------------------
 drivers/gpu/drm/msm/msm_drv.h            |  5 +---
 drivers/gpu/drm/msm/msm_kms.h            |  4 ---
 drivers/gpu/drm/msm/msm_mdss.c           | 23 +++++++-------
 7 files changed, 41 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 354991816041..d631f14b99d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1175,7 +1175,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return rc;
 }
 
-struct msm_kms *dpu_kms_init(struct drm_device *dev)
+static int dpu_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -1183,7 +1183,7 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 
 	if (!dev) {
 		DPU_ERROR("drm device node invalid\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	priv = dev->dev_private;
@@ -1192,11 +1192,11 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
 	if (irq < 0) {
 		DPU_ERROR("failed to get irq: %d\n", irq);
-		return ERR_PTR(irq);
+		return irq;
 	}
 	dpu_kms->base.irq = irq;
 
-	return &dpu_kms->base;
+	return 0;
 }
 
 static int dpu_bind(struct device *dev, struct device *master, void *data)
@@ -1207,6 +1207,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct dpu_kms *dpu_kms;
 	int ret = 0;
 
+	priv->kms_init = dpu_kms_init;
+
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 089914dd058f..7cfa50ae0f6e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -389,7 +389,7 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 	DRM_DEV_INFO(dev->dev, "MDP4 version v%d.%d", *major, *minor);
 }
 
-struct msm_kms *mdp4_kms_init(struct drm_device *dev)
+static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct mdp4_platform_config *config = mdp4_get_config(pdev);
@@ -403,8 +403,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
-		ret = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
@@ -551,12 +550,13 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
-	return kms;
+	return 0;
 
 fail:
 	if (kms)
 		mdp4_destroy(kms);
-	return ERR_PTR(ret);
+
+	return ret;
 }
 
 static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
@@ -583,6 +583,8 @@ static int mdp4_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->kms_init = mdp4_kms_init;
+
 	platform_set_drvdata(pdev, priv);
 
 	/*
@@ -600,7 +602,7 @@ static int mdp4_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mdp4_dt_match[] = {
-	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
+	{ .compatible = "qcom,mdp4" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mdp4_dt_match);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 12a5f81e402b..23990afa06f2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -551,7 +551,7 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
 	return 0;
 }
 
-struct msm_kms *mdp5_kms_init(struct drm_device *dev)
+static int mdp5_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev;
@@ -565,7 +565,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
 	if (!kms)
-		return NULL;
+		return -ENOMEM;
 
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	pdev = mdp5_kms->pdev;
@@ -644,11 +644,12 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
-	return kms;
+	return 0;
 fail:
 	if (kms)
 		mdp5_kms_destroy(kms);
-	return ERR_PTR(ret);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct platform_device *pdev)
@@ -810,6 +811,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
+	priv->kms_init = mdp5_kms_init;
+
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms) {
 		ret = -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 93207a9eee81..649a1fe56da3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -458,13 +458,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-static int get_mdp_ver(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-
-	return (int) (unsigned long) of_device_get_match_data(dev);
-}
-
 #include <linux/of_address.h>
 
 bool msm_use_mmu(struct drm_device *dev)
@@ -551,7 +544,6 @@ static int msm_init_vram(struct drm_device *dev)
 
 static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
@@ -599,30 +591,18 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	msm_gem_shrinker_init(ddev);
 
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP4:
-		kms = mdp4_kms_init(ddev);
-		priv->kms = kms;
-		break;
-	case KMS_MDP5:
-		kms = mdp5_kms_init(ddev);
-		break;
-	case KMS_DPU:
-		kms = dpu_kms_init(ddev);
-		priv->kms = kms;
-		break;
-	default:
+	if (priv->kms_init) {
+		ret = priv->kms_init(ddev);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "failed to load kms\n");
+			priv->kms = NULL;
+			goto err_msm_uninit;
+		}
+		kms = priv->kms;
+	} else {
 		/* valid only for the dummy headless case, where of_node=NULL */
 		WARN_ON(dev->of_node);
 		kms = NULL;
-		break;
-	}
-
-	if (IS_ERR(kms)) {
-		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		ret = PTR_ERR(kms);
-		priv->kms = NULL;
-		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index beddb29dc7f7..5634ee8fcc01 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -139,6 +139,7 @@ struct msm_drm_private {
 	struct drm_device *dev;
 
 	struct msm_kms *kms;
+	int (*kms_init)(struct drm_device *dev);
 
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
@@ -451,10 +452,6 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
-#define KMS_MDP4 4
-#define KMS_MDP5 5
-#define KMS_DPU  3
-
 void __init msm_mdp4_register(void);
 void __exit msm_mdp4_unregister(void);
 void __init msm_mdp_register(void);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 13c2eb0b2bcf..1f571372e928 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -194,10 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 }
 
-struct msm_kms *mdp4_kms_init(struct drm_device *dev);
-struct msm_kms *mdp5_kms_init(struct drm_device *dev);
-struct msm_kms *dpu_kms_init(struct drm_device *dev);
-
 extern const struct of_device_id dpu_dt_match[];
 extern const struct of_device_id mdp5_dt_match[];
 
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 69b96683d673..ab82e1e52fc4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -314,11 +314,11 @@ static const struct dev_pm_ops mdss_pm_ops = {
 	.complete = msm_pm_complete,
 };
 
-static int get_mdp_ver(struct platform_device *pdev)
+static bool get_is_mdp5(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	return (int) (unsigned long) of_device_get_match_data(dev);
+	return (bool) (unsigned long) of_device_get_match_data(dev);
 }
 
 static int find_mdp_node(struct device *dev, void *data)
@@ -331,21 +331,18 @@ static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
 	struct msm_drm_private *priv;
-	int mdp_ver = get_mdp_ver(pdev);
+	bool is_mdp5 = get_is_mdp5(pdev);
 	struct device *mdp_dev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (mdp_ver != KMS_MDP5 && mdp_ver != KMS_DPU)
-		return -EINVAL;
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, priv);
 
-	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
+	mdss = msm_mdss_init(pdev, is_mdp5);
 	if (IS_ERR(mdss)) {
 		ret = PTR_ERR(mdss);
 		platform_set_drvdata(pdev, NULL);
@@ -409,12 +406,12 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mdss_dt_match[] = {
-	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
-	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,mdss", .data = (void *)true },
+	{ .compatible = "qcom,sdm845-mdss", .data = (void *)false },
+	{ .compatible = "qcom,sc7180-mdss", .data = (void *)false },
+	{ .compatible = "qcom,sc7280-mdss", .data = (void *)false },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)false },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)false },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.34.1

