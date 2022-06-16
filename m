Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3254DAC5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439C6113CCF;
	Thu, 16 Jun 2022 06:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C417113B50;
 Thu, 16 Jun 2022 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655361375; x=1686897375;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6uO1/U8p9gV8E92GnIp5ctp/Lr3j2fXbsBDKvSrZ4xI=;
 b=t6A9lbExkSxPPPl13doDM/pSp5hUQbYbUgxZycjKw7eyB3Jybl0aZWDU
 7xVgbbStwYRfDu3nQ2YHqRfztXj2Mk3RZfM0bVuM4atj/prKnaG74YBwl
 bK4UJQ7KyWEyH5cj1XMBJRWU6kP5J+QmGrwXw3uZThWs1kuR9MLluQ4jX U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2022 23:36:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:36:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:36:13 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:36:11 -0700
Message-ID: <989c9a5b-7ca8-aa90-e789-6a4252bca7e4@quicinc.com>
Date: Wed, 15 Jun 2022 23:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/mdp4: move iommu_domain_alloc() call close to
 its usage
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
 <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/2022 6:50 AM, Dmitry Baryshkov wrote:
> Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
> This allows us to drop it from struct mdp4_cfg_platform which
> remained from the pre-DT days.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 8 ++++----
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 1 -
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index fb48c8c19ec3..1fba6ab06eb1 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -388,6 +388,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct mdp4_kms *mdp4_kms;
>   	struct msm_kms *kms = NULL;
> +	struct iommu_domain *iommu;
>   	struct msm_gem_address_space *aspace;
>   	int irq, ret;
>   	u32 major, minor;
> @@ -495,9 +496,9 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	mdp4_disable(mdp4_kms);
>   	mdelay(16);
>   
> -	if (config->iommu) {
> -		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
> -			config->iommu);
> +	iommu = iommu_domain_alloc(pdev->dev.bus);
> +	if (iommu) {
> +		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
>   
>   		aspace  = msm_gem_address_space_create(mmu,
>   			"mdp4", 0x1000, 0x100000000 - 0x1000);
> @@ -557,7 +558,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>   
>   	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>   	config.max_clk = 266667000;
> -	config.iommu = iommu_domain_alloc(&platform_bus_type);
>   
>   	return &config;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index e8ee92ab7956..7cc549b6a82b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -44,7 +44,6 @@ struct mdp4_kms {
>   
>   /* platform config data (ie. from DT, or pdata) */
>   struct mdp4_platform_config {
> -	struct iommu_domain *iommu;
>   	uint32_t max_clk;
>   };
>   
