Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10494E4F54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290910E628;
	Wed, 23 Mar 2022 09:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C710E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:25:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 5so1676915lfp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Juf92GMTHpmMkgNT+Bu9hsmroalPnLe/TYDdQ6uD+Us=;
 b=uHSe+nJjlYX6H5pscOJGLhrBUHR7Oq/TuIukAgYMXgWsYrviiAMwl1kr8rcXj+VEA9
 KnTMi5lRfe4WGh3WJFT+IADOzn2GbpNfNuy5UrZKPD+6qvNMSD1+Oq0fu4FxTJLpmJj9
 LcK8Pv2Ln8EAuL2bAbkFxdkTd/Gw+pfPSwJyPYDVk/2SHn1ML75/RDD8wCfybUCK2G1c
 WSUtm4XQEn4RBHx2julims6IyWFeYnRL+r8E8kJ6pM2GMHr3U1XbY4yrOz6Iqna0GRQ9
 nk6rMvQZVoebPjUT32Zn5UDiEtBGaqsX5G3/li8xaexL72Erq1szFSOtBuD3tlbUrtJb
 /wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Juf92GMTHpmMkgNT+Bu9hsmroalPnLe/TYDdQ6uD+Us=;
 b=klvTDs2+PUWt14YEYi3HP+Ne5ojgAX7E3AkIw/Pf+iTmhH0BQrYQG57oaThhdmTJcw
 UbgXTIcLShbpd0D2whm1Gebqz9Rx7P3uLXsKWX3DMT6iBgw1GcJmheY3HZ80YQLCoCFv
 kVWSdvi2zcw2BITYigNouqfaU0dNYulKu4vvRHISvKwBnn+sDARGP6245UsJHZPSl9WI
 3aEtl+rrSJWeWCDv2Tv5galiCsfh/yVO5w5Ih0aky14tuzBxNfPuoQfiBCxhZXbyYAih
 Z0tC9vSdxpokrg0WBHuPnK+Z4G+hQQBkDdyR1KjuicFn93hns7wrpZLBWE6NYWBD2qN5
 fieA==
X-Gm-Message-State: AOAM533jE1AfIJV8wYeFqdbi2MdpfX6wPBBSuMtPmUwpdu850oUECp2Z
 iYDhElGspbXluqeBnbsg3MpCVg==
X-Google-Smtp-Source: ABdhPJzrJwYjyYsR5vtHo9KZas5unZhWQZ0JIbeTB07nxdy7LgYIVg3N0vKE+yfJxplcdKJX4DOkWg==
X-Received: by 2002:a05:6512:b19:b0:448:3b73:e8fb with SMTP id
 w25-20020a0565120b1900b004483b73e8fbmr21844441lfu.42.1648027545455; 
 Wed, 23 Mar 2022 02:25:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 br12-20020a056512400c00b0044a2c454ebcsm986026lfb.27.2022.03.23.02.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 02:25:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 6/6] drm/msm: make mdp5/dpu devices master components
Date: Wed, 23 Mar 2022 12:25:38 +0300
Message-Id: <20220323092538.1757880-7-dmitry.baryshkov@linaro.org>
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

The msm_mdss serves several roles at this moment. It provides IRQ domain
used by MDP5 and DPU drivers but it also serves as a component master
for both those usecases. MDP4 (which does not have separate MDSS device)
is the component master on it's own.
Remove this assymmetry and make both MDP5 and DPU component masters too.
This removes a need to care about drm/components from msm_mdss driver,
removes an mdss pointer from struct msm_drm_private and simplifies the
interface between mdp5/dpu and msm_drv.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 80 ++++++++----------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 16 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 47 +++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 32 +++++-----
 drivers/gpu/drm/msm/msm_drv.h            |  6 +-
 drivers/gpu/drm/msm/msm_kms.h            |  3 -
 drivers/gpu/drm/msm/msm_mdss.c           | 61 +++---------------
 7 files changed, 67 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 38627ccf3068..ab8a35e09bc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -381,8 +381,8 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	struct icc_path *path1;
 	struct drm_device *dev = dpu_kms->dev;
 
-	path0 = of_icc_get(dev->dev, "mdp0-mem");
-	path1 = of_icc_get(dev->dev, "mdp1-mem");
+	path0 = of_icc_get(dev->dev->parent, "mdp0-mem");
+	path1 = of_icc_get(dev->dev->parent, "mdp1-mem");
 
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
@@ -837,6 +837,9 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	_dpu_kms_hw_destroy(dpu_kms);
 
 	msm_kms_destroy(&dpu_kms->base);
+
+	if (dpu_kms->rpm_enabled)
+		pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static irqreturn_t dpu_irq(struct msm_kms *kms)
@@ -978,7 +981,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	if (!domain)
 		return 0;
 
-	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
+	mmu = msm_iommu_new(dpu_kms->dev->dev->parent, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(mmu);
@@ -1172,40 +1175,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return rc;
 }
 
-static int dpu_kms_init(struct drm_device *dev)
-{
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
-	int irq;
-
-	if (!dev) {
-		DPU_ERROR("drm device node invalid\n");
-		return -EINVAL;
-	}
-
-	priv = dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (irq < 0) {
-		DPU_ERROR("failed to get irq: %d\n", irq);
-		return irq;
-	}
-	dpu_kms->base.irq = irq;
-
-	return 0;
-}
-
-static int dpu_bind(struct device *dev, struct device *master, void *data)
+static int dpu_kms_init(struct drm_device *ddev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct msm_drm_private *priv = ddev->dev_private;
+	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
+	int irq;
 	int ret = 0;
 
-	priv->kms_init = dpu_kms_init;
-
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
@@ -1227,8 +1205,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	}
 	dpu_kms->num_clocks = ret;
 
-	platform_set_drvdata(pdev, dpu_kms);
-
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
@@ -1242,31 +1218,25 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 	priv->kms = &dpu_kms->base;
 
-	return ret;
-}
-
-static void dpu_unbind(struct device *dev, struct device *master, void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
+	if (irq < 0) {
+		DPU_ERROR("failed to get irq: %d\n", irq);
+		return irq;
+	}
+	dpu_kms->base.irq = irq;
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+	return 0;
 }
 
-static const struct component_ops dpu_ops = {
-	.bind   = dpu_bind,
-	.unbind = dpu_unbind,
-};
-
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return component_add(&pdev->dev, &dpu_ops);
+	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &dpu_ops);
+	component_master_del(&pdev->dev, &msm_drm_ops);
+
 	return 0;
 }
 
@@ -1274,7 +1244,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
 	int i;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
 	/* Drop the performance state vote */
 	dev_pm_opp_set_rate(dev, 0);
@@ -1290,7 +1261,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 {
 	int rc = -1;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	int i;
@@ -1320,9 +1292,11 @@ static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
-const struct of_device_id dpu_dt_match[] = {
+static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", },
 	{ .compatible = "qcom,qcm2290-dpu", },
 	{ .compatible = "qcom,sdm845-dpu", },
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 2e5f6b6fd3c3..834d16bced9d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -577,21 +577,7 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->kms_init = mdp4_kms_init;
-
-	platform_set_drvdata(pdev, priv);
-
-	/*
-	 * on MDP4 based platforms, the MDP platform device is the component
-	 * master that adds other display interface components to itself.
-	 */
-	return msm_drv_probe(&pdev->dev, &pdev->dev);
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0c78608832c3..e552de09641d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -203,6 +203,8 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
+static void mdp5_destroy(struct platform_device *pdev);
+
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -221,6 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
+	mdp5_destroy(mdp5_kms->pdev);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -544,6 +547,8 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
 	return 0;
 }
 
+static int mdp5_init(struct platform_device *pdev, struct drm_device *dev);
+
 static int mdp5_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -555,6 +560,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	int irq, i, ret;
 	struct device *iommu_dev;
 
+	ret = mdp5_init(to_platform_device(dev->dev), dev);
+
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
 	if (!kms)
@@ -804,8 +811,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
-	priv->kms_init = mdp5_kms_init;
-
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms) {
 		ret = -ENOMEM;
@@ -915,35 +920,11 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	return ret;
 }
 
-static int mdp5_bind(struct device *dev, struct device *master, void *data)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(master);
-	struct drm_device *ddev = priv->dev;
-	struct platform_device *pdev = to_platform_device(dev);
-
-	DBG("");
-
-	return mdp5_init(pdev, ddev);
-}
-
-static void mdp5_unbind(struct device *dev, struct device *master,
-			void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	mdp5_destroy(pdev);
-}
-
-static const struct component_ops mdp5_ops = {
-	.bind   = mdp5_bind,
-	.unbind = mdp5_unbind,
-};
-
 static int mdp5_setup_interconnect(struct platform_device *pdev)
 {
-	struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
-	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
+	struct icc_path *path0 = of_icc_get(pdev->dev.parent, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(pdev->dev.parent, "mdp1-mem");
+	struct icc_path *path_rot = of_icc_get(pdev->dev.parent, "rotator-mem");
 
 	if (IS_ERR(path0))
 		return PTR_ERR(path0);
@@ -979,13 +960,13 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return component_add(&pdev->dev, &mdp5_ops);
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
 {
 	DBG("");
-	component_del(&pdev->dev, &mdp5_ops);
+	component_master_del(&pdev->dev, &msm_drm_ops);
 	return 0;
 }
 
@@ -1011,9 +992,11 @@ static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
-const struct of_device_id mdp5_dt_match[] = {
+static const struct of_device_id mdp5_dt_match[] = {
 	{ .compatible = "qcom,mdp5", },
 	/* to support downstream DT files */
 	{ .compatible = "qcom,mdss_mdp", },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b37a2601d4c3..c5eaf3ee1ccf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -992,10 +992,10 @@ static int compare_of(struct device *dev, void *data)
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
+static int add_components_mdp(struct device *master_dev,
 			      struct component_match **matchptr)
 {
-	struct device_node *np = mdp_dev->of_node;
+	struct device_node *np = master_dev->of_node;
 	struct device_node *ep_node;
 
 	for_each_endpoint_of_node(np, ep_node) {
@@ -1005,7 +1005,7 @@ static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
 
 		ret = of_graph_parse_endpoint(ep_node, &ep);
 		if (ret) {
-			DRM_DEV_ERROR(mdp_dev, "unable to parse port endpoint\n");
+			DRM_DEV_ERROR(master_dev, "unable to parse port endpoint\n");
 			of_node_put(ep_node);
 			return ret;
 		}
@@ -1082,17 +1082,23 @@ const struct component_master_ops msm_drm_ops = {
 	.unbind = msm_drm_unbind,
 };
 
-int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
+int msm_drv_probe(struct device *master_dev,
+	int (*kms_init)(struct drm_device *dev))
 {
+	struct msm_drm_private *priv;
 	struct component_match *match = NULL;
 	int ret;
 
-	if (mdp_dev) {
-		/* add the MDP component itself */
-		drm_of_component_match_add(master_dev, &match, compare_of,
-				mdp_dev->of_node);
+	priv = devm_kzalloc(master_dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-		ret = add_components_mdp(master_dev, mdp_dev, &match);
+	priv->kms_init = kms_init;
+	dev_set_drvdata(master_dev, priv);
+
+	/* Add mdp components if we have KMS. */
+	if (kms_init) {
+		ret = add_components_mdp(master_dev, &match);
 		if (ret)
 			return ret;
 	}
@@ -1122,14 +1128,6 @@ int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
 
 static int msm_pdev_probe(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-
 	return msm_drv_probe(&pdev->dev, NULL);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6bad7e7b479d..35bd3ed60f84 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -126,9 +126,6 @@ struct msm_drm_private {
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
 
-	/* top level MDSS wrapper device (for MDP5/DPU only) */
-	struct msm_mdss *mdss;
-
 	/* possibly this should be in the kms component, but it is
 	 * shared by both mdp4 and mdp5..
 	 */
@@ -579,7 +576,8 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_pm_prepare(struct device *dev);
 void msm_pm_complete(struct device *dev);
 
-int msm_drv_probe(struct device *master_dev, struct device *mdp_dev);
+int msm_drv_probe(struct device *dev,
+	int (*kms_init)(struct drm_device *dev));
 void msm_drv_shutdown(struct platform_device *pdev);
 
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1f571372e928..ab25fff271f9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -194,9 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 }
 
-extern const struct of_device_id dpu_dt_match[];
-extern const struct of_device_id mdp5_dt_match[];
-
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 7451105cbf01..9ecae833037d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -261,20 +261,20 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 
 static int __maybe_unused mdss_runtime_suspend(struct device *dev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct msm_mdss *mdss = dev_get_drvdata(dev);
 
 	DBG("");
 
-	return msm_mdss_disable(priv->mdss);
+	return msm_mdss_disable(mdss);
 }
 
 static int __maybe_unused mdss_runtime_resume(struct device *dev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct msm_mdss *mdss = dev_get_drvdata(dev);
 
 	DBG("");
 
-	return msm_mdss_enable(priv->mdss);
+	return msm_mdss_enable(mdss);
 }
 
 static int __maybe_unused mdss_pm_suspend(struct device *dev)
@@ -297,31 +297,12 @@ static int __maybe_unused mdss_pm_resume(struct device *dev)
 static const struct dev_pm_ops mdss_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
 	SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
 };
 
-static int find_mdp_node(struct device *dev, void *data)
-{
-#ifdef CONFIG_DRM_MSM_DPU
-	if (of_match_node(dpu_dt_match, dev->of_node))
-		return true;
-#endif
-
-#ifdef CONFIG_DRM_MSM_MDP5
-	if (of_match_node(mdp5_dt_match, dev->of_node))
-		return true;
-#endif
-
-	return false;
-}
-
 static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
-	struct msm_drm_private *priv;
 	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
-	struct device *mdp_dev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -329,14 +310,7 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	priv->mdss = mdss;
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, mdss);
 
 	/*
 	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
@@ -350,39 +324,18 @@ static int mdss_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	mdp_dev = device_find_child(dev, NULL, find_mdp_node);
-	if (!mdp_dev) {
-		DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
-		of_platform_depopulate(dev);
-		ret = -ENODEV;
-		goto fail;
-	}
-
-	/*
-	 * on MDP5 based platforms, the MDSS platform device is the component
-	 * that adds MDP5 and other display interface components to
-	 * itself.
-	 */
-	ret = msm_drv_probe(dev, mdp_dev);
-	put_device(mdp_dev);
-	if (ret)
-		goto fail;
-
 	return 0;
 
 fail:
-	of_platform_depopulate(dev);
-	msm_mdss_destroy(priv->mdss);
+	msm_mdss_destroy(mdss);
 
 	return ret;
 }
 
 static int mdss_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct msm_mdss *mdss = priv->mdss;
+	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
-	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
 	msm_mdss_destroy(mdss);
-- 
2.35.1

