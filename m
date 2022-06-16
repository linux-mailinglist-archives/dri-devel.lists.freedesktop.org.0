Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE654DACD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15E11A0CD;
	Thu, 16 Jun 2022 06:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CBD113EA2;
 Thu, 16 Jun 2022 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655361456; x=1686897456;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=paemgS18JWZMUOA+NupPoktR7TSWRKxfJ4CKW88ZFTE=;
 b=WzCEtSRuSLq/EDXZWWfrJbwpvuHQ/9/yLDlfVPpkKnpP0T/wwxXf8Kp6
 9lUTRkJd4u46ERvLRoHVx29XO6Md13g6FhCjn3YQF9df+x0TB/Nj6vA8e
 rL6QoPx5n3Q2cB6flD0QgDnMNFaLB7NaD148unoWaUbuUr3PwG80sBnJ1 w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 23:37:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:37:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:37:35 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:37:33 -0700
Message-ID: <e47c0edc-a855-4760-56fc-69710c499ebc@quicinc.com>
Date: Wed, 15 Jun 2022 23:37:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/mdp4: get rid of struct mdp4_platform_config
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
 <20220505135008.1351533-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505135008.1351533-3-dmitry.baryshkov@linaro.org>
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
> Struct mdp4_platform_config is a relict from the DT-conversion time.
> Move the max_clk field to the mdp4_kms_init(), the place where it is
> used and drop the struct mdp4_platform_config and the mdp4_get_config()
> function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 21 ++++++---------------
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  5 -----
>   2 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 1fba6ab06eb1..ccde710c63fa 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -13,8 +13,6 @@
>   #include "msm_mmu.h"
>   #include "mdp4_kms.h"
>   
> -static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev);
> -
>   static int mdp4_hw_init(struct msm_kms *kms)
>   {
>   	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
> @@ -384,7 +382,6 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
>   static int mdp4_kms_init(struct drm_device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev->dev);
> -	struct mdp4_platform_config *config = mdp4_get_config(pdev);
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct mdp4_kms *mdp4_kms;
>   	struct msm_kms *kms = NULL;
> @@ -392,6 +389,10 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	struct msm_gem_address_space *aspace;
>   	int irq, ret;
>   	u32 major, minor;
> +	unsigned long max_clk;
> +
> +	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
> +	max_clk = 266667000;
>   
>   	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
>   	if (!mdp4_kms) {
> @@ -459,7 +460,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	clk_set_rate(mdp4_kms->clk, config->max_clk);
> +	clk_set_rate(mdp4_kms->clk, max_clk);
>   
>   	read_mdp_hw_revision(mdp4_kms, &major, &minor);
>   
> @@ -479,7 +480,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   			ret = PTR_ERR(mdp4_kms->lut_clk);
>   			goto fail;
>   		}
> -		clk_set_rate(mdp4_kms->lut_clk, config->max_clk);
> +		clk_set_rate(mdp4_kms->lut_clk, max_clk);
>   	}
>   
>   	pm_runtime_enable(dev->dev);
> @@ -552,16 +553,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	return ret;
>   }
>   
> -static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
> -{
> -	static struct mdp4_platform_config config = {};
> -
> -	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
> -	config.max_clk = 266667000;
> -
> -	return &config;
> -}
> -
>   static const struct dev_pm_ops mdp4_pm_ops = {
>   	.prepare = msm_pm_prepare,
>   	.complete = msm_pm_complete,
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index 7cc549b6a82b..01179e764a29 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -42,11 +42,6 @@ struct mdp4_kms {
>   };
>   #define to_mdp4_kms(x) container_of(x, struct mdp4_kms, base)
>   
> -/* platform config data (ie. from DT, or pdata) */
> -struct mdp4_platform_config {
> -	uint32_t max_clk;
> -};
> -
>   static inline void mdp4_write(struct mdp4_kms *mdp4_kms, u32 reg, u32 data)
>   {
>   	msm_writel(data, mdp4_kms->mmio + reg);
