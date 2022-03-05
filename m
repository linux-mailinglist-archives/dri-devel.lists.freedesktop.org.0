Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF354CE20C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 03:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C6210E15C;
	Sat,  5 Mar 2022 02:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF9410E15C;
 Sat,  5 Mar 2022 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646446211; x=1677982211;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M0QN8Xu+tQ+WnjDBTA6lFt/lFav21qjDZrs1tSORWxY=;
 b=AvdfelrXt7QPMaK5fl4Wg86nEpUtIM07YsCz3qR5XgL99FPEysT2YpeN
 /JFpUeZkz3H1W+3hr/F1nNBpsJjVxD6iq2Mbd87ZlXR4Sr8d9kZmLrR0X
 ieuCsCGxaHtzw6UKik+yfe/pl5YDRoRk1mCRonaIQHMHLC6rMcRGNorzV Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 04 Mar 2022 18:10:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 18:10:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 4 Mar 2022 18:10:09 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 4 Mar 2022
 18:10:08 -0800
Message-ID: <f9f5df47-0eae-abd0-67f5-2fe73594b7af@quicinc.com>
Date: Fri, 4 Mar 2022 18:10:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/5] drm/msm: split the main platform driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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



On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
> Currently the msm platform driver is a multiplex handling several cases:
> - headless GPU-only driver,
> - MDP4 with flat device nodes,
> - MDP5/DPU MDSS with all the nodes being children of MDSS node.
> 
> This results in not-so-perfect code, checking the hardware version
> (MDP4/MDP5/DPU) in several places, checking for mdss even when it can
> not exist, etc. Split the code into three handling subdrivers (mdp4,
> mdss and headless msm).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If this has been verified across MDP4, MDP5 and DPU,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  56 ++++++
>   drivers/gpu/drm/msm/msm_drv.c            | 228 ++++-------------------
>   drivers/gpu/drm/msm/msm_drv.h            |  27 ++-
>   drivers/gpu/drm/msm/msm_kms.h            |   7 -
>   drivers/gpu/drm/msm/msm_mdss.c           | 178 +++++++++++++++++-
>   5 files changed, 291 insertions(+), 205 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 3cf476c55158..c5c0650414c5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -569,3 +569,59 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>   
>   	return &config;
>   }
> +
> +static const struct dev_pm_ops mdp4_pm_ops = {
> +	.prepare = msm_pm_prepare,
> +	.complete = msm_pm_complete,
> +};
> +
> +static int mdp4_probe(struct platform_device *pdev)
> +{
> +	struct msm_drm_private *priv;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	/*
> +	 * on MDP4 based platforms, the MDP platform device is the component
> +	 * master that adds other display interface components to itself.
> +	 */
> +	return msm_drv_probe(&pdev->dev, &pdev->dev);
> +}
> +
> +static int mdp4_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &msm_drm_ops);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mdp4_dt_match[] = {
> +	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mdp4_dt_match);
> +
> +static struct platform_driver mdp4_platform_driver = {
> +	.probe      = mdp4_probe,
> +	.remove     = mdp4_remove,
> +	.shutdown   = msm_drv_shutdown,
> +	.driver     = {
> +		.name   = "mdp4",
> +		.of_match_table = mdp4_dt_match,
> +		.pm     = &mdp4_pm_ops,
> +	},
> +};
> +
> +void __init msm_mdp4_register(void)
> +{
> +	platform_driver_register(&mdp4_platform_driver);
> +}
> +
> +void __exit msm_mdp4_unregister(void)
> +{
> +	platform_driver_unregister(&mdp4_platform_driver);
> +}
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f3f33b8c6eba..2f44df8c5585 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -255,10 +255,6 @@ static int msm_drm_uninit(struct device *dev)
>   	return 0;
>   }
>   
> -#define KMS_MDP4 4
> -#define KMS_MDP5 5
> -#define KMS_DPU  3
> -
>   static int get_mdp_ver(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -941,50 +937,7 @@ static const struct drm_driver msm_driver = {
>   	.patchlevel         = MSM_VERSION_PATCHLEVEL,
>   };
>   
> -static int __maybe_unused msm_runtime_suspend(struct device *dev)
> -{
> -	struct msm_drm_private *priv = dev_get_drvdata(dev);
> -	struct msm_mdss *mdss = priv->mdss;
> -
> -	DBG("");
> -
> -	if (mdss)
> -		return msm_mdss_disable(mdss);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused msm_runtime_resume(struct device *dev)
> -{
> -	struct msm_drm_private *priv = dev_get_drvdata(dev);
> -	struct msm_mdss *mdss = priv->mdss;
> -
> -	DBG("");
> -
> -	if (mdss)
> -		return msm_mdss_enable(mdss);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused msm_pm_suspend(struct device *dev)
> -{
> -
> -	if (pm_runtime_suspended(dev))
> -		return 0;
> -
> -	return msm_runtime_suspend(dev);
> -}
> -
> -static int __maybe_unused msm_pm_resume(struct device *dev)
> -{
> -	if (pm_runtime_suspended(dev))
> -		return 0;
> -
> -	return msm_runtime_resume(dev);
> -}
> -
> -static int __maybe_unused msm_pm_prepare(struct device *dev)
> +int msm_pm_prepare(struct device *dev)
>   {
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev = priv ? priv->dev : NULL;
> @@ -995,7 +948,7 @@ static int __maybe_unused msm_pm_prepare(struct device *dev)
>   	return drm_mode_config_helper_suspend(ddev);
>   }
>   
> -static void __maybe_unused msm_pm_complete(struct device *dev)
> +void msm_pm_complete(struct device *dev)
>   {
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev = priv ? priv->dev : NULL;
> @@ -1007,8 +960,6 @@ static void __maybe_unused msm_pm_complete(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops msm_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
> -	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
>   	.prepare = msm_pm_prepare,
>   	.complete = msm_pm_complete,
>   };
> @@ -1032,25 +983,11 @@ static int compare_of(struct device *dev, void *data)
>    * is no external component that we need to add since LVDS is within MDP4
>    * itself.
>    */
> -static int add_components_mdp(struct device *mdp_dev,
> +static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
>   			      struct component_match **matchptr)
>   {
>   	struct device_node *np = mdp_dev->of_node;
>   	struct device_node *ep_node;
> -	struct device *master_dev;
> -
> -	/*
> -	 * on MDP4 based platforms, the MDP platform device is the component
> -	 * master that adds other display interface components to itself.
> -	 *
> -	 * on MDP5 based platforms, the MDSS platform device is the component
> -	 * master that adds MDP5 and other display interface components to
> -	 * itself.
> -	 */
> -	if (of_device_is_compatible(np, "qcom,mdp4"))
> -		master_dev = mdp_dev;
> -	else
> -		master_dev = mdp_dev->parent;
>   
>   	for_each_endpoint_of_node(np, ep_node) {
>   		struct device_node *intf;
> @@ -1091,60 +1028,6 @@ static int add_components_mdp(struct device *mdp_dev,
>   	return 0;
>   }
>   
> -static int find_mdp_node(struct device *dev, void *data)
> -{
> -	return of_match_node(dpu_dt_match, dev->of_node) ||
> -		of_match_node(mdp5_dt_match, dev->of_node);
> -}
> -
> -static int add_display_components(struct platform_device *pdev,
> -				  struct component_match **matchptr)
> -{
> -	struct device *mdp_dev;
> -	struct device *dev = &pdev->dev;
> -	int ret;
> -
> -	/*
> -	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
> -	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
> -	 * Populate the children devices, find the MDP5/DPU node, and then add
> -	 * the interfaces to our components list.
> -	 */
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP5:
> -	case KMS_DPU:
> -		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> -			return ret;
> -		}
> -
> -		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> -		if (!mdp_dev) {
> -			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> -			of_platform_depopulate(dev);
> -			return -ENODEV;
> -		}
> -
> -		put_device(mdp_dev);
> -
> -		/* add the MDP component itself */
> -		drm_of_component_match_add(dev, matchptr, compare_of,
> -					   mdp_dev->of_node);
> -		break;
> -	case KMS_MDP4:
> -		/* MDP4 */
> -		mdp_dev = dev;
> -		break;
> -	}
> -
> -	ret = add_components_mdp(mdp_dev, matchptr);
> -	if (ret)
> -		of_platform_depopulate(dev);
> -
> -	return ret;
> -}
> -
>   /*
>    * We don't know what's the best binding to link the gpu with the drm device.
>    * Fow now, we just hunt for all the possible gpus that we support, and add them
> @@ -1185,93 +1068,70 @@ static void msm_drm_unbind(struct device *dev)
>   	msm_drm_uninit(dev);
>   }
>   
> -static const struct component_master_ops msm_drm_ops = {
> +const struct component_master_ops msm_drm_ops = {
>   	.bind = msm_drm_bind,
>   	.unbind = msm_drm_unbind,
>   };
>   
> -/*
> - * Platform driver:
> - */
> -
> -static int msm_pdev_probe(struct platform_device *pdev)
> +int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
>   {
>   	struct component_match *match = NULL;
> -	struct msm_mdss *mdss;
> -	struct msm_drm_private *priv;
>   	int ret;
>   
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	platform_set_drvdata(pdev, priv);
> -
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP5:
> -		mdss = msm_mdss_init(pdev, true);
> -		break;
> -	case KMS_DPU:
> -		mdss = msm_mdss_init(pdev, false);
> -		break;
> -	default:
> -		mdss = NULL;
> -		break;
> -	}
> -	if (IS_ERR(mdss)) {
> -		ret = PTR_ERR(mdss);
> -		return ret;
> -	}
> -
> -	priv->mdss = mdss;
> +	if (mdp_dev) {
> +		/* add the MDP component itself */
> +		drm_of_component_match_add(master_dev, &match, compare_of,
> +				mdp_dev->of_node);
>   
> -	if (get_mdp_ver(pdev)) {
> -		ret = add_display_components(pdev, &match);
> +		ret = add_components_mdp(master_dev, mdp_dev, &match);
>   		if (ret)
> -			goto fail;
> +			return ret;
>   	}
>   
> -	ret = add_gpu_components(&pdev->dev, &match);
> +	ret = add_gpu_components(master_dev, &match);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	/* on all devices that I am aware of, iommu's which can map
>   	 * any address the cpu can see are used:
>   	 */
> -	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
> +	ret = dma_set_mask_and_coherent(master_dev, ~0);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
> -	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
> +	ret = component_master_add_with_match(master_dev, &msm_drm_ops, match);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	return 0;
> +}
>   
> -fail:
> -	of_platform_depopulate(&pdev->dev);
> +/*
> + * Platform driver:
> + * Used only for headlesss GPU instances
> + */
>   
> -	if (priv->mdss)
> -		msm_mdss_destroy(priv->mdss);
> +static int msm_pdev_probe(struct platform_device *pdev)
> +{
> +	struct msm_drm_private *priv;
>   
> -	return ret;
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return msm_drv_probe(&pdev->dev, NULL);
>   }
>   
>   static int msm_pdev_remove(struct platform_device *pdev)
>   {
> -	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> -	struct msm_mdss *mdss = priv->mdss;
> -
>   	component_master_del(&pdev->dev, &msm_drm_ops);
> -	of_platform_depopulate(&pdev->dev);
> -
> -	if (mdss)
> -		msm_mdss_destroy(mdss);
>   
>   	return 0;
>   }
>   
> -static void msm_pdev_shutdown(struct platform_device *pdev)
> +void msm_drv_shutdown(struct platform_device *pdev)
>   {
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
> @@ -1282,28 +1142,12 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>   	drm_atomic_helper_shutdown(drm);
>   }
>   
> -static const struct of_device_id dt_match[] = {
> -	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> -	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> -	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, dt_match);
> -
>   static struct platform_driver msm_platform_driver = {
>   	.probe      = msm_pdev_probe,
>   	.remove     = msm_pdev_remove,
> -	.shutdown   = msm_pdev_shutdown,
> +	.shutdown   = msm_drv_shutdown,
>   	.driver     = {
>   		.name   = "msm",
> -		.of_match_table = dt_match,
>   		.pm     = &msm_pm_ops,
>   	},
>   };
> @@ -1320,6 +1164,8 @@ static int __init msm_drm_register(void)
>   	msm_hdmi_register();
>   	msm_dp_register();
>   	adreno_register();
> +	msm_mdp4_register();
> +	msm_mdss_register();
>   	return platform_driver_register(&msm_platform_driver);
>   }
>   
> @@ -1327,6 +1173,8 @@ static void __exit msm_drm_unregister(void)
>   {
>   	DBG("fini");
>   	platform_driver_unregister(&msm_platform_driver);
> +	msm_mdss_unregister();
> +	msm_mdp4_unregister();
>   	msm_dp_unregister();
>   	msm_hdmi_unregister();
>   	adreno_unregister();
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9f68aa685ed7..2fdaf4a614cc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -431,10 +431,18 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>   
>   #endif
>   
> -void __init msm_mdp_register(void);
> -void __exit msm_mdp_unregister(void);
> -void __init msm_dpu_register(void);
> -void __exit msm_dpu_unregister(void);
> +#define KMS_MDP4 4
> +#define KMS_MDP5 5
> +#define KMS_DPU  3
> +
> +void msm_mdp4_register(void);
> +void msm_mdp4_unregister(void);
> +void msm_mdp_register(void);
> +void msm_mdp_unregister(void);
> +void msm_dpu_register(void);
> +void msm_dpu_unregister(void);
> +void msm_mdss_register(void);
> +void msm_mdss_unregister(void);
>   
>   #ifdef CONFIG_DEBUG_FS
>   void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
> @@ -534,4 +542,15 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>   	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
>   }
>   
> +/* Driver helpers */
> +
> +extern const struct component_master_ops msm_drm_ops;
> +
> +int msm_pm_prepare(struct device *dev);
> +void msm_pm_complete(struct device *dev);
> +
> +int msm_drv_probe(struct device *master_dev, struct device *mdp_dev);
> +void msm_drv_shutdown(struct platform_device *pdev);
> +
> +
>   #endif /* __MSM_DRV_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 09c219988884..13c2eb0b2bcf 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -201,13 +201,6 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev);
>   extern const struct of_device_id dpu_dt_match[];
>   extern const struct of_device_id mdp5_dt_match[];
>   
> -struct msm_mdss;
> -
> -struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5);
> -int msm_mdss_enable(struct msm_mdss *mdss);
> -int msm_mdss_disable(struct msm_mdss *mdss);
> -void msm_mdss_destroy(struct msm_mdss *mdss);
> -
>   #define for_each_crtc_mask(dev, crtc, crtc_mask) \
>   	drm_for_each_crtc(crtc, dev) \
>   		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 857eefbb8649..c89de88ed2d1 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -10,6 +10,9 @@
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/pm_runtime.h>
>   
> +#include "msm_drv.h"
> +#include "msm_kms.h"
> +
>   /* for DPU_HW_* defines */
>   #include "disp/dpu1/dpu_hw_catalog.h"
>   
> @@ -126,7 +129,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>   	return 0;
>   }
>   
> -int msm_mdss_enable(struct msm_mdss *msm_mdss)
> +static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   {
>   	int ret;
>   
> @@ -162,14 +165,14 @@ int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   	return ret;
>   }
>   
> -int msm_mdss_disable(struct msm_mdss *msm_mdss)
> +static int msm_mdss_disable(struct msm_mdss *msm_mdss)
>   {
>   	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
>   
>   	return 0;
>   }
>   
> -void msm_mdss_destroy(struct msm_mdss *msm_mdss)
> +static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
>   {
>   	struct platform_device *pdev = to_platform_device(msm_mdss->dev);
>   	int irq;
> @@ -212,7 +215,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
>   	return num_clocks;
>   }
>   
> -struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
> +static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
>   {
>   	struct msm_mdss *msm_mdss;
>   	int ret;
> @@ -255,3 +258,170 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
>   
>   	return msm_mdss;
>   }
> +
> +static int __maybe_unused mdss_runtime_suspend(struct device *dev)
> +{
> +	struct msm_drm_private *priv = dev_get_drvdata(dev);
> +
> +	DBG("");
> +
> +	return msm_mdss_disable(priv->mdss);
> +}
> +
> +static int __maybe_unused mdss_runtime_resume(struct device *dev)
> +{
> +	struct msm_drm_private *priv = dev_get_drvdata(dev);
> +
> +	DBG("");
> +
> +	return msm_mdss_enable(priv->mdss);
> +}
> +
> +static int __maybe_unused mdss_pm_suspend(struct device *dev)
> +{
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return mdss_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused mdss_pm_resume(struct device *dev)
> +{
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return mdss_runtime_resume(dev);
> +}
> +
> +static const struct dev_pm_ops mdss_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
> +	SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
> +	.prepare = msm_pm_prepare,
> +	.complete = msm_pm_complete,
> +};
> +
> +static int get_mdp_ver(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	return (int) (unsigned long) of_device_get_match_data(dev);
> +}
> +
> +static int find_mdp_node(struct device *dev, void *data)
> +{
> +	return of_match_node(dpu_dt_match, dev->of_node) ||
> +		of_match_node(mdp5_dt_match, dev->of_node);
> +}
> +
> +static int mdss_probe(struct platform_device *pdev)
> +{
> +	struct msm_mdss *mdss;
> +	struct msm_drm_private *priv;
> +	int mdp_ver = get_mdp_ver(pdev);
> +	struct device *mdp_dev;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +	if (IS_ERR(mdss)) {
> +		ret = PTR_ERR(mdss);
> +		platform_set_drvdata(pdev, NULL);
> +
> +		return ret;
> +	}
> +
> +	priv->mdss = mdss;
> +
> +	/*
> +	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
> +	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
> +	 * Populate the children devices, find the MDP5/DPU node, and then add
> +	 * the interfaces to our components list.
> +	 */
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> +		goto fail;
> +	}
> +
> +	mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> +	if (!mdp_dev) {
> +		DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> +		of_platform_depopulate(dev);
> +		ret = -ENODEV;
> +		goto fail;
> +	}
> +
> +	/*
> +	 * on MDP5 based platforms, the MDSS platform device is the component
> +	 * that adds MDP5 and other display interface components to
> +	 * itself.
> +	 */
> +	ret = msm_drv_probe(dev, mdp_dev);
> +	put_device(mdp_dev);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	of_platform_depopulate(dev);
> +	msm_mdss_destroy(priv->mdss);
> +
> +	return ret;
> +}
> +
> +static int mdss_remove(struct platform_device *pdev)
> +{
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct msm_mdss *mdss = priv->mdss;
> +
> +	component_master_del(&pdev->dev, &msm_drm_ops);
> +	of_platform_depopulate(&pdev->dev);
> +
> +	msm_mdss_destroy(mdss);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> +	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dt_match);
> +
> +static struct platform_driver mdss_platform_driver = {
> +	.probe      = mdss_probe,
> +	.remove     = mdss_remove,
> +	.shutdown   = msm_drv_shutdown,
> +	.driver     = {
> +		.name   = "msm-mdss",
> +		.of_match_table = mdss_dt_match,
> +		.pm     = &mdss_pm_ops,
> +	},
> +};
> +
> +void __init msm_mdss_register(void)
> +{
> +	platform_driver_register(&mdss_platform_driver);
> +}
> +
> +void __exit msm_mdss_unregister(void)
> +{
> +	platform_driver_unregister(&mdss_platform_driver);
> +}
