Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2A4E72E0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7CB10E42B;
	Fri, 25 Mar 2022 12:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139CB10E324
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:17:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t25so13052059lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwg04vrWojl1s7enz55iC1ZWaKwjiMGFIQm3cEt5Giw=;
 b=U40ahOnyompqSxTstIdSjxYigZeHjcVFZIuWA2eMtAUJOPvjUHjLrxowOR27OCotY5
 y7Z8uj4tC8i2UCa66VLql8YaGkiVf6uk/9xuMvETCNNP5AXvRy4SN1/xAvTCcLRbjtYA
 gQd6qsP1iSAW4cekpyNG519eLmohQiuAx8K7706nFnNMMS3Un5fOBpQM/vlbOY3WlqWg
 6kvQFd2104iJ2EvTHDg1gKhRRDpUHZzF0ojfFUegqasAPUOgYm0mLRmf7nYHcrL1t4Fu
 oZrf2UTQFneCmCgzZCycMcxPDd+jkzQIS22qg6AJM9F+OXbuH+JMp58Y/Cw7D7Mzb5Es
 JbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwg04vrWojl1s7enz55iC1ZWaKwjiMGFIQm3cEt5Giw=;
 b=QoKDmRvn1BYvLKaHaiYBk8xqgwHC9H/HAuo4YWQsXT85hPe8wvQMECPbk3P8rGbTyv
 6UZfQqk8ZMTca6phX8Z2bx9xT28RRzLi7URSDLNg4SgfbXTsbDr+4iJDe2ByIlsLMjzh
 GZ2B0LIlk3KrHaCxeaOEEEOpMO6BbjOuBCmhs4tKRdGPYqMkS/AWzCQI2vPEZyy9483m
 EzJuxXG24e9cqK4u4LeB2DtZauE75FnPfn/Vye92KbvxErV5ZseYlxte4+rUpgn6ACZE
 Xf/JhzBUdu0nuk05DfvPIFWHOzphKLdADXeiyI5BOpCDnxm/n1YqA3P/Nq4v6F74CAQM
 E9Hg==
X-Gm-Message-State: AOAM533O8hFgwPs1sm3MuuoSaCQ29YHNVYB9oEf5PZBq0WXcmu/DTvYH
 jZrxmazwmmuSLC4H5HEl2nQyWw==
X-Google-Smtp-Source: ABdhPJy1zFbAVIfMRJTG7KULe3iB0nBOlpVShj3zsR8hQBCu0N8uOqTotVhC4H0HbvfaLUbDM0S9dA==
X-Received: by 2002:a05:6512:22c2:b0:44a:4e65:8fb3 with SMTP id
 g2-20020a05651222c200b0044a4e658fb3mr7629016lfu.194.1648210663237; 
 Fri, 25 Mar 2022 05:17:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.164])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05651210c900b00448956cb40csm688489lfg.109.2022.03.25.05.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 05:17:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 3/6] drm/msm: split the main platform driver
Date: Fri, 25 Mar 2022 15:17:33 +0300
Message-Id: <20220325121736.2162912-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
References: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the msm platform driver is a multiplex handling several cases:
- headless GPU-only driver,
- MDP4 with flat device nodes,
- MDP5/DPU MDSS with all the nodes being children of MDSS node.

This results in not-so-perfect code, checking the hardware version
(MDP4/MDP5/DPU) in several places, checking for mdss even when it can
not exist, etc. Split the code into three handling subdrivers (mdp4,
mdss and headless msm).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  56 ++++++
 drivers/gpu/drm/msm/msm_drv.c            | 228 ++++-------------------
 drivers/gpu/drm/msm/msm_drv.h            |  27 ++-
 drivers/gpu/drm/msm/msm_kms.h            |   7 -
 drivers/gpu/drm/msm/msm_mdss.c           | 175 ++++++++++++++++-
 5 files changed, 288 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3cf476c55158..5dc839184aef 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -569,3 +569,59 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 
 	return &config;
 }
+
+static const struct dev_pm_ops mdp4_pm_ops = {
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
+};
+
+static int mdp4_probe(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/*
+	 * on MDP4 based platforms, the MDP platform device is the component
+	 * that adds other display interface components to itself.
+	 */
+	return msm_drv_probe(&pdev->dev, &pdev->dev);
+}
+
+static int mdp4_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &msm_drm_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mdp4_dt_match[] = {
+	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mdp4_dt_match);
+
+static struct platform_driver mdp4_platform_driver = {
+	.probe      = mdp4_probe,
+	.remove     = mdp4_remove,
+	.shutdown   = msm_drv_shutdown,
+	.driver     = {
+		.name   = "mdp4",
+		.of_match_table = mdp4_dt_match,
+		.pm     = &mdp4_pm_ops,
+	},
+};
+
+void __init msm_mdp4_register(void)
+{
+	platform_driver_register(&mdp4_platform_driver);
+}
+
+void __exit msm_mdp4_unregister(void)
+{
+	platform_driver_unregister(&mdp4_platform_driver);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index d3cce39c13bf..16d8aa225405 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -256,10 +256,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-#define KMS_MDP4 4
-#define KMS_MDP5 5
-#define KMS_DPU  3
-
 static int get_mdp_ver(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -970,50 +966,7 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-static int __maybe_unused msm_runtime_suspend(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct msm_mdss *mdss = priv->mdss;
-
-	DBG("");
-
-	if (mdss)
-		return msm_mdss_disable(mdss);
-
-	return 0;
-}
-
-static int __maybe_unused msm_runtime_resume(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct msm_mdss *mdss = priv->mdss;
-
-	DBG("");
-
-	if (mdss)
-		return msm_mdss_enable(mdss);
-
-	return 0;
-}
-
-static int __maybe_unused msm_pm_suspend(struct device *dev)
-{
-
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return msm_runtime_suspend(dev);
-}
-
-static int __maybe_unused msm_pm_resume(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return msm_runtime_resume(dev);
-}
-
-static int __maybe_unused msm_pm_prepare(struct device *dev)
+int msm_pm_prepare(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1024,7 +977,7 @@ static int __maybe_unused msm_pm_prepare(struct device *dev)
 	return drm_mode_config_helper_suspend(ddev);
 }
 
-static void __maybe_unused msm_pm_complete(struct device *dev)
+void msm_pm_complete(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1036,8 +989,6 @@ static void __maybe_unused msm_pm_complete(struct device *dev)
 }
 
 static const struct dev_pm_ops msm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
-	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
 	.prepare = msm_pm_prepare,
 	.complete = msm_pm_complete,
 };
@@ -1061,25 +1012,11 @@ static int compare_of(struct device *dev, void *data)
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *mdp_dev,
+static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = mdp_dev->of_node;
 	struct device_node *ep_node;
-	struct device *master_dev;
-
-	/*
-	 * on MDP4 based platforms, the MDP platform device is the component
-	 * master that adds other display interface components to itself.
-	 *
-	 * on MDP5 based platforms, the MDSS platform device is the component
-	 * master that adds MDP5 and other display interface components to
-	 * itself.
-	 */
-	if (of_device_is_compatible(np, "qcom,mdp4"))
-		master_dev = mdp_dev;
-	else
-		master_dev = mdp_dev->parent;
 
 	for_each_endpoint_of_node(np, ep_node) {
 		struct device_node *intf;
@@ -1120,60 +1057,6 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int find_mdp_node(struct device *dev, void *data)
-{
-	return of_match_node(dpu_dt_match, dev->of_node) ||
-		of_match_node(mdp5_dt_match, dev->of_node);
-}
-
-static int add_display_components(struct platform_device *pdev,
-				  struct component_match **matchptr)
-{
-	struct device *mdp_dev;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	/*
-	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
-	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
-	 * Populate the children devices, find the MDP5/DPU node, and then add
-	 * the interfaces to our components list.
-	 */
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-	case KMS_DPU:
-		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
-			return ret;
-		}
-
-		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
-		if (!mdp_dev) {
-			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
-			of_platform_depopulate(dev);
-			return -ENODEV;
-		}
-
-		put_device(mdp_dev);
-
-		/* add the MDP component itself */
-		drm_of_component_match_add(dev, matchptr, compare_of,
-					   mdp_dev->of_node);
-		break;
-	case KMS_MDP4:
-		/* MDP4 */
-		mdp_dev = dev;
-		break;
-	}
-
-	ret = add_components_mdp(mdp_dev, matchptr);
-	if (ret)
-		of_platform_depopulate(dev);
-
-	return ret;
-}
-
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
@@ -1214,93 +1097,70 @@ static void msm_drm_unbind(struct device *dev)
 	msm_drm_uninit(dev);
 }
 
-static const struct component_master_ops msm_drm_ops = {
+const struct component_master_ops msm_drm_ops = {
 	.bind = msm_drm_bind,
 	.unbind = msm_drm_unbind,
 };
 
-/*
- * Platform driver:
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
 {
 	struct component_match *match = NULL;
-	struct msm_mdss *mdss;
-	struct msm_drm_private *priv;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-		mdss = msm_mdss_init(pdev, true);
-		break;
-	case KMS_DPU:
-		mdss = msm_mdss_init(pdev, false);
-		break;
-	default:
-		mdss = NULL;
-		break;
-	}
-	if (IS_ERR(mdss)) {
-		ret = PTR_ERR(mdss);
-		return ret;
-	}
-
-	priv->mdss = mdss;
+	if (mdp_dev) {
+		/* add the MDP component itself */
+		drm_of_component_match_add(master_dev, &match, compare_of,
+				mdp_dev->of_node);
 
-	if (get_mdp_ver(pdev)) {
-		ret = add_display_components(pdev, &match);
+		ret = add_components_mdp(master_dev, mdp_dev, &match);
 		if (ret)
-			goto fail;
+			return ret;
 	}
 
-	ret = add_gpu_components(&pdev->dev, &match);
+	ret = add_gpu_components(master_dev, &match);
 	if (ret)
-		goto fail;
+		return ret;
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
 	 */
-	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	ret = dma_set_mask_and_coherent(master_dev, ~0);
 	if (ret)
-		goto fail;
+		return ret;
 
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	ret = component_master_add_with_match(master_dev, &msm_drm_ops, match);
 	if (ret)
-		goto fail;
+		return ret;
 
 	return 0;
+}
 
-fail:
-	of_platform_depopulate(&pdev->dev);
+/*
+ * Platform driver:
+ * Used only for headlesss GPU instances
+ */
 
-	if (priv->mdss)
-		msm_mdss_destroy(priv->mdss);
+static int msm_pdev_probe(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv;
 
-	return ret;
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	return msm_drv_probe(&pdev->dev, NULL);
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct msm_mdss *mdss = priv->mdss;
-
 	component_master_del(&pdev->dev, &msm_drm_ops);
-	of_platform_depopulate(&pdev->dev);
-
-	if (mdss)
-		msm_mdss_destroy(mdss);
 
 	return 0;
 }
 
-static void msm_pdev_shutdown(struct platform_device *pdev)
+void msm_drv_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
@@ -1311,28 +1171,12 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
-	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
-	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
-	{}
-};
-MODULE_DEVICE_TABLE(of, dt_match);
-
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_pdev_shutdown,
+	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.of_match_table = dt_match,
 		.pm     = &msm_pm_ops,
 	},
 };
@@ -1349,6 +1193,8 @@ static int __init msm_drm_register(void)
 	msm_hdmi_register();
 	msm_dp_register();
 	adreno_register();
+	msm_mdp4_register();
+	msm_mdss_register();
 	return platform_driver_register(&msm_platform_driver);
 }
 
@@ -1356,6 +1202,8 @@ static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
 	platform_driver_unregister(&msm_platform_driver);
+	msm_mdss_unregister();
+	msm_mdp4_unregister();
 	msm_dp_unregister();
 	msm_hdmi_unregister();
 	adreno_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f68aa685ed7..2fdaf4a614cc 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -431,10 +431,18 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
-void __init msm_mdp_register(void);
-void __exit msm_mdp_unregister(void);
-void __init msm_dpu_register(void);
-void __exit msm_dpu_unregister(void);
+#define KMS_MDP4 4
+#define KMS_MDP5 5
+#define KMS_DPU  3
+
+void msm_mdp4_register(void);
+void msm_mdp4_unregister(void);
+void msm_mdp_register(void);
+void msm_mdp_unregister(void);
+void msm_dpu_register(void);
+void msm_dpu_unregister(void);
+void msm_mdss_register(void);
+void msm_mdss_unregister(void);
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
@@ -534,4 +542,15 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
 }
 
+/* Driver helpers */
+
+extern const struct component_master_ops msm_drm_ops;
+
+int msm_pm_prepare(struct device *dev);
+void msm_pm_complete(struct device *dev);
+
+int msm_drv_probe(struct device *master_dev, struct device *mdp_dev);
+void msm_drv_shutdown(struct platform_device *pdev);
+
+
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 09c219988884..13c2eb0b2bcf 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -201,13 +201,6 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev);
 extern const struct of_device_id dpu_dt_match[];
 extern const struct of_device_id mdp5_dt_match[];
 
-struct msm_mdss;
-
-struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5);
-int msm_mdss_enable(struct msm_mdss *mdss);
-int msm_mdss_disable(struct msm_mdss *mdss);
-void msm_mdss_destroy(struct msm_mdss *mdss);
-
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 62007a4f29a2..5e63d3dc308c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -10,6 +10,9 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pm_runtime.h>
 
+#include "msm_drv.h"
+#include "msm_kms.h"
+
 /* for DPU_HW_* defines */
 #include "disp/dpu1/dpu_hw_catalog.h"
 
@@ -126,7 +129,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-int msm_mdss_enable(struct msm_mdss *msm_mdss)
+static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
 
@@ -162,14 +165,14 @@ int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	return ret;
 }
 
-int msm_mdss_disable(struct msm_mdss *msm_mdss)
+static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
 
 	return 0;
 }
 
-void msm_mdss_destroy(struct msm_mdss *msm_mdss)
+static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 {
 	struct platform_device *pdev = to_platform_device(msm_mdss->dev);
 	int irq;
@@ -212,7 +215,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
 	struct msm_mdss *msm_mdss;
 	int ret;
@@ -255,3 +258,167 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 
 	return msm_mdss;
 }
+
+static int __maybe_unused mdss_runtime_suspend(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+
+	DBG("");
+
+	return msm_mdss_disable(priv->mdss);
+}
+
+static int __maybe_unused mdss_runtime_resume(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+
+	DBG("");
+
+	return msm_mdss_enable(priv->mdss);
+}
+
+static int __maybe_unused mdss_pm_suspend(struct device *dev)
+{
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mdss_runtime_suspend(dev);
+}
+
+static int __maybe_unused mdss_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mdss_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops mdss_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
+	SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
+};
+
+static int get_mdp_ver(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return (int) (unsigned long) of_device_get_match_data(dev);
+}
+
+static int find_mdp_node(struct device *dev, void *data)
+{
+	return of_match_node(dpu_dt_match, dev->of_node) ||
+		of_match_node(mdp5_dt_match, dev->of_node);
+}
+
+static int mdss_probe(struct platform_device *pdev)
+{
+	struct msm_mdss *mdss;
+	struct msm_drm_private *priv;
+	int mdp_ver = get_mdp_ver(pdev);
+	struct device *mdp_dev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
+	if (IS_ERR(mdss))
+		return PTR_ERR(mdss);
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	priv->mdss = mdss;
+	platform_set_drvdata(pdev, priv);
+
+	/*
+	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
+	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
+	 * Populate the children devices, find the MDP5/DPU node, and then add
+	 * the interfaces to our components list.
+	 */
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
+		goto fail;
+	}
+
+	mdp_dev = device_find_child(dev, NULL, find_mdp_node);
+	if (!mdp_dev) {
+		DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
+		of_platform_depopulate(dev);
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	/*
+	 * on MDP5 based platforms, the MDSS platform device is the component
+	 * that adds MDP5 and other display interface components to
+	 * itself.
+	 */
+	ret = msm_drv_probe(dev, mdp_dev);
+	put_device(mdp_dev);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	of_platform_depopulate(dev);
+	msm_mdss_destroy(priv->mdss);
+
+	return ret;
+}
+
+static int mdss_remove(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct msm_mdss *mdss = priv->mdss;
+
+	component_master_del(&pdev->dev, &msm_drm_ops);
+	of_platform_depopulate(&pdev->dev);
+
+	msm_mdss_destroy(mdss);
+
+	return 0;
+}
+
+static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
+	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mdss_dt_match);
+
+static struct platform_driver mdss_platform_driver = {
+	.probe      = mdss_probe,
+	.remove     = mdss_remove,
+	.shutdown   = msm_drv_shutdown,
+	.driver     = {
+		.name   = "msm-mdss",
+		.of_match_table = mdss_dt_match,
+		.pm     = &mdss_pm_ops,
+	},
+};
+
+void __init msm_mdss_register(void)
+{
+	platform_driver_register(&mdss_platform_driver);
+}
+
+void __exit msm_mdss_unregister(void)
+{
+	platform_driver_unregister(&mdss_platform_driver);
+}
-- 
2.35.1

