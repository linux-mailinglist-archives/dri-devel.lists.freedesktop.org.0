Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEED54D0CD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3374B10F0FC;
	Wed, 15 Jun 2022 18:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF7D10F512;
 Wed, 15 Jun 2022 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655317127; x=1686853127;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4rDC6HkC57kfZ9Y0khsdh8c7IO8Owe/lcbEYTn/FxbA=;
 b=JP9gNLTr8RYwtNmiw3dEUdpFK42Kvo0Xaarnp5OpQxfoLYKNa7qvyFIk
 2ENE+d1ffGEUKD5rmemILvWYYtYVwcliq8uHwGc2JFcUeKJChhY/m7Mxy
 T5SZWENrYP1INuGfYo7ShCFHuoTJPTKSTXLCWsI9KoqUFIsywXveAfaYK E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 11:18:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 11:18:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 11:18:30 -0700
Received: from [10.38.242.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 11:18:28 -0700
Message-ID: <4867fb96-7d49-cf09-3fac-50ad86e766f5@quicinc.com>
Date: Wed, 15 Jun 2022 11:18:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/5] drm/msm/mdp5: move iommu_domain_alloc() call close
 to its usage
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505001605.1268483-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, Robin
 Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2022 5:16 PM, Dmitry Baryshkov wrote:
> Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
> This allows us to drop final bits of struct mdp5_cfg_platform which
> remained from the pre-DT days.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
>   3 files changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1bf9ff5dbabc..714effb967ff 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -1248,8 +1248,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
>   	{ .revision = 3, .config = { .hw = &sdm630_config } },
>   };
>   
> -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
> -
>   const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
>   {
>   	return cfg_handler->config.hw;
> @@ -1274,10 +1272,8 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>   		uint32_t major, uint32_t minor)
>   {
>   	struct drm_device *dev = mdp5_kms->dev;
> -	struct platform_device *pdev = to_platform_device(dev->dev);
>   	struct mdp5_cfg_handler *cfg_handler;
>   	const struct mdp5_cfg_handler *cfg_handlers;
> -	struct mdp5_cfg_platform *pconfig;
>   	int i, ret = 0, num_handlers;
>   
>   	cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
> @@ -1320,9 +1316,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>   	cfg_handler->revision = minor;
>   	cfg_handler->config.hw = mdp5_cfg;
>   
> -	pconfig = mdp5_get_config(pdev);
> -	memcpy(&cfg_handler->config.platform, pconfig, sizeof(*pconfig));
> -
>   	DBG("MDP5: %s hw config selected", mdp5_cfg->name);
>   
>   	return cfg_handler;
> @@ -1333,12 +1326,3 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>   
>   	return ERR_PTR(ret);
>   }
> -
> -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
> -{
> -	static struct mdp5_cfg_platform config = {};
> -
> -	config.iommu = iommu_domain_alloc(&platform_bus_type);
> -
> -	return &config;
> -}
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> index 6b03d7899309..c2502cc33864 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> @@ -104,14 +104,8 @@ struct mdp5_cfg_hw {
>   	uint32_t max_clk;
>   };
>   
> -/* platform config data (ie. from DT, or pdata) */
> -struct mdp5_cfg_platform {
> -	struct iommu_domain *iommu;
> -};
> -
>   struct mdp5_cfg {
>   	const struct mdp5_cfg_hw *hw;
> -	struct mdp5_cfg_platform platform;
>   };
>   
>   struct mdp5_kms;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 9b7bbc3adb97..1c67c2c828cd 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -558,6 +558,7 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	struct msm_gem_address_space *aspace;
>   	int irq, i, ret;
>   	struct device *iommu_dev;
> +	struct iommu_domain *iommu;
>   
>   	ret = mdp5_init(to_platform_device(dev->dev), dev);
>   
> @@ -601,14 +602,15 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	}
>   	mdelay(16);
>   
> -	if (config->platform.iommu) {
> +	iommu = iommu_domain_alloc(&platform_bus_type);
> +	if (iommu) {
>   		struct msm_mmu *mmu;
>   
>   		iommu_dev = &pdev->dev;
>   		if (!dev_iommu_fwspec_get(iommu_dev))
>   			iommu_dev = iommu_dev->parent;
>   
> -		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
> +		mmu = msm_iommu_new(iommu_dev, iommu);
>   
>   		aspace = msm_gem_address_space_create(mmu, "mdp5",
>   			0x1000, 0x100000000 - 0x1000);
