Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2A4E4F51
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553AE10E61F;
	Wed, 23 Mar 2022 09:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C7F10E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:25:45 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r22so1005907ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=koI2v25fQQaAQolUjXb20VbKFPRZFg5L1c73FDE09po=;
 b=gfymKmDeX9xb/l17/jE4FHnOXOFLY8X7/utMaTa07gyUhQzXc+94vOTDpdZUmA7DpL
 F4g3phESK/RF0o/N/lPlZcY954+PUzVG/MVnstdTUnzpHb7T0i+Q0rSYrCPo43JmimZt
 0J40tPjPSL14f+MsNdUuRhZOaZ8rDNbWKyUAsklakJDAhwvF0opIL3jwnRTGQ09KeiQr
 GJKCcFuz/yXPn9G59lgzL5XtlpmYpe22Xha03t3Rvnmnri89umS8e0NjyVRfjOKUcwWl
 iWX9jsD2BUspzgP73oBTxdAOk3JZQKUVQRWPb6QedzG/mSJWr7HxpkTPJ+UIYQ0Rm5Td
 xbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=koI2v25fQQaAQolUjXb20VbKFPRZFg5L1c73FDE09po=;
 b=N7hmmZ29EgY8zgMLtrR45b6hIxS2v+Njlxj6hsxbpvC+ny/hdJ+I6tznxUiEo9diVp
 9ws8pQRsmJ1pvQLPIYk/eSjERBGLwKZk9eh4ZhzFY5hBo7I8qtY3c1AZy2VZcVyvDLaH
 yOhE0EVrGNy6EJIMIsTIohFYuypDQ4be4H1lRn0bI41ypc/C6C0LZ4eTuRVv5YEw5liP
 qFCC0L/Jzbvjs8a9+Px+451kH/vUOZ7a2+RMRUvNDgz/6XvJsBb38gRr8tjPv1Jq+D/3
 ySohcyad5za5gMS7cxFMqshTMGKiObI79CUzHJEZx8Kolo3ejbsBTX8jQn0njfXzqqwm
 UZgg==
X-Gm-Message-State: AOAM530caTPHEbq1ay0tVrW729noK6suQBhoS80Di7ps3oFBuvOFxcc3
 oC/TgZb1sVIi21xSVlhHxzMzLeihzQmPaw==
X-Google-Smtp-Source: ABdhPJyEeKyFG1K5Vl9n5D3yFxHSyC7MxbyEipCn3HfbQhNd4vAALCCHTFAcAhwQCxNdkY8Kac+cHQ==
X-Received: by 2002:a2e:a4d1:0:b0:249:8c9c:5ae0 with SMTP id
 p17-20020a2ea4d1000000b002498c9c5ae0mr7608667ljm.283.1648027543672; 
 Wed, 23 Mar 2022 02:25:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 br12-20020a056512400c00b0044a2c454ebcsm986026lfb.27.2022.03.23.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 02:25:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 4/6] drm/msm: stop using device's match data pointer
Date: Wed, 23 Mar 2022 12:25:36 +0300
Message-Id: <20220323092538.1757880-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++---
 drivers/gpu/drm/msm/msm_drv.c            | 38 ++++++------------------
 drivers/gpu/drm/msm/msm_drv.h            |  5 +---
 drivers/gpu/drm/msm/msm_kms.h            |  4 ---
 drivers/gpu/drm/msm/msm_mdss.c           | 29 +++++++-----------
 7 files changed, 42 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..38627ccf3068 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1172,7 +1172,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return rc;
 }
 
-struct msm_kms *dpu_kms_init(struct drm_device *dev)
+static int dpu_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -1180,7 +1180,7 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 
 	if (!dev) {
 		DPU_ERROR("drm device node invalid\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	priv = dev->dev_private;
@@ -1189,11 +1189,11 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
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
@@ -1204,6 +1204,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct dpu_kms *dpu_kms;
 	int ret = 0;
 
+	priv->kms_init = dpu_kms_init;
+
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c5c0650414c5..2e5f6b6fd3c3 100644
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
index 3b92372e7bdf..0c78608832c3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -544,7 +544,7 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
 	return 0;
 }
 
-struct msm_kms *mdp5_kms_init(struct drm_device *dev)
+static int mdp5_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev;
@@ -558,7 +558,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
 	if (!kms)
-		return NULL;
+		return -ENOMEM;
 
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	pdev = mdp5_kms->pdev;
@@ -637,11 +637,12 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
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
@@ -803,6 +804,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
+	priv->kms_init = mdp5_kms_init;
+
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms) {
 		ret = -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 16d8aa225405..b37a2601d4c3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -256,13 +256,6 @@ static int msm_drm_uninit(struct device *dev)
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
@@ -349,7 +342,6 @@ static int msm_init_vram(struct drm_device *dev)
 
 static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
@@ -394,30 +386,18 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
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
index 2fdaf4a614cc..c1aaadfbea34 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -121,6 +121,7 @@ struct msm_drm_private {
 	struct drm_device *dev;
 
 	struct msm_kms *kms;
+	int (*kms_init)(struct drm_device *dev);
 
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
@@ -431,10 +432,6 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
-#define KMS_MDP4 4
-#define KMS_MDP5 5
-#define KMS_DPU  3
-
 void msm_mdp4_register(void);
 void msm_mdp4_unregister(void);
 void msm_mdp_register(void);
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
index 512708101931..cd05f92bee15 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -301,13 +301,6 @@ static const struct dev_pm_ops mdss_pm_ops = {
 	.complete = msm_pm_complete,
 };
 
-static int get_mdp_ver(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-
-	return (int) (unsigned long) of_device_get_match_data(dev);
-}
-
 static int find_mdp_node(struct device *dev, void *data)
 {
 	return of_match_node(dpu_dt_match, dev->of_node) ||
@@ -318,12 +311,12 @@ static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
 	struct msm_drm_private *priv;
-	int mdp_ver = get_mdp_ver(pdev);
+	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct device *mdp_dev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
+	mdss = msm_mdss_init(pdev, is_mdp5);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
@@ -389,15 +382,15 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mdss_dt_match[] = {
-	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
-	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,mdss" },
+	{ .compatible = "qcom,msm8998-mdss" },
+	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sc7180-mdss" },
+	{ .compatible = "qcom,sc7280-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.35.1

