Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381250723F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 17:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A189B0B;
	Tue, 19 Apr 2022 15:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9440894DE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 15:53:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t25so30156949lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PM6Rw7sOQNj7kYQapqsOz//5J9gQr2TIyN2+FW78B7I=;
 b=ye8iFtI5Gybhqg0xrO8gbvys2nbOPNOX1vEr/xL+d/bbX7zwyxNbixdoLvMQHAl8iA
 sPrDYhORDTMdK+QdhDufG5fq7xPaQKpJjKcrmjmR1ZjUYAS9lg3+Yu1ptNHkHGaN+KRn
 QpKJ43zfxxUxfzkSQq9Q14UogLa7ch0136y9TLD4N/lk+zuQss7mWKt3VYxrIZ17H8cD
 WYSpfuZlg+5cMey50aS1bH3rV/sYjiruC/h6MhOTiF22olmOMmDfUTo5zn2A4kzPjlRs
 mLnr9KnGhVaxy394D7JRyGUjqvgA/4FpoxYsWfQtC54+TjqdT0PXGyEYJ4KRgFFhr2ZH
 guKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PM6Rw7sOQNj7kYQapqsOz//5J9gQr2TIyN2+FW78B7I=;
 b=GwOjj4FXDqWxk0ttqYixld14hTpIN+QxQGaRc+QMG85soQCm/hGWPoZZ5bYsp5kGD1
 tu47cXTI4KWoYU7AGgF3YfavKW0RtKI1dut2vBSPm4miP4VReOneaI6kPGH4ISFwU8L/
 x3+8sp8koRLOph5JxvUoVzfcbYgk5+2UPqC+WqdWL7gGZ4Hz30JlY/Gr65V1y/6BQE0B
 6q51p9REPFwpJYCOIZpCxkOGdAX4S3uBiZX/aw7MhaSZ/jcg4IcgnpLkjHPRbnsIyIky
 6Lvw9o1zBx/gm+EJMxfui/QqSJFoXKZQ684HXzK70t7e255dyqDswVsYkaBXJ1nHach1
 hrgA==
X-Gm-Message-State: AOAM531FsA3XI/BKBgSKJzkhq2ajcXllz9ol+bLAbSYL8eEoQix7+nGU
 KGbUmvaOZ+h7w0JScqNmxO6k2A==
X-Google-Smtp-Source: ABdhPJzwpjcLzAny8RkMJuPX8CXYlUEiIIicqgsynwuvQcaV3sI1X6OMVKZLT08rKxEsvfrxc+WPPQ==
X-Received: by 2002:a05:6512:acf:b0:471:a932:a2ed with SMTP id
 n15-20020a0565120acf00b00471a932a2edmr2449051lfu.394.1650383630105; 
 Tue, 19 Apr 2022 08:53:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:53:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 4/6] drm/msm: stop using device's match data pointer
Date: Tue, 19 Apr 2022 18:53:44 +0300
Message-Id: <20220419155346.1272627-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
References: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
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
index 5dc839184aef..1a14f1d3cdf7 100644
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
index 8bcc86685f2d..c037b46da7f4 100644
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
@@ -397,30 +389,18 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
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
index d6b827bbeaf5..19d2767c5363 100644
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
index 43a8e3376f17..c94b78431687 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -310,13 +310,6 @@ static const struct dev_pm_ops mdss_pm_ops = {
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
@@ -327,12 +320,12 @@ static int mdss_probe(struct platform_device *pdev)
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
 
@@ -398,15 +391,15 @@ static int mdss_remove(struct platform_device *pdev)
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
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

