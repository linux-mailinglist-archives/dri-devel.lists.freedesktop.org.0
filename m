Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA854D0EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7B10E4B4;
	Wed, 15 Jun 2022 18:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA9110E482;
 Wed, 15 Jun 2022 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655317758; x=1686853758;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IC82p9CAtjDymmAKbo/4xMBYEQZ50BEEHBAsW4UhZSg=;
 b=C6B+AKisfmaESrce5YphLOYBY/7PFR3NYmKCiHz+ZvNuwsGZEhFLqIOe
 65a3totCBEjuarf403WGfghEkxJOt5zNevSzNv02IO5QBko2Znu0TLhg9
 aw8aZwbirUqOjotGyBdFlLmDj9Mzl9zC2l8GdrPCj7/91t+LI7CZfjk6H I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 11:29:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 11:29:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 11:29:16 -0700
Received: from [10.38.242.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 11:29:14 -0700
Message-ID: <631d5ea2-9505-2d4c-5294-af000cac3784@quicinc.com>
Date: Wed, 15 Jun 2022 11:29:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/5] drm/msm: Stop using iommu_present()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505001605.1268483-4-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, Robin
 Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2022 5:16 PM, Dmitry Baryshkov wrote:
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
> 
> On Qualcomm platforms the IOMMU can be specified either for the MDP/DPU
> device or for its parent MDSS device depending on the actual platform.
> Check both of them, since that is how both DPU and MDP5 drivers work.
> 
> Co-developed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
I have the same question as patch (1) of this series here but i will let 
you answer it there, so this one is,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4a3dda23e3e0..a37a3bbc04d9 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -266,8 +266,14 @@ bool msm_use_mmu(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   
> -	/* a2xx comes with its own MMU */
> -	return priv->is_a2xx || iommu_present(&platform_bus_type);
> +	/*
> +	 * a2xx comes with its own MMU
> +	 * On other platforms IOMMU can be declared specified either for the
> +	 * MDP/DPU device or for its parent, MDSS device.
> +	 */
> +	return priv->is_a2xx ||
> +		device_iommu_mapped(dev->dev) ||
> +		device_iommu_mapped(dev->dev->parent);
>   }
>   
>   static int msm_init_vram(struct drm_device *dev)
