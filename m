Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D15589541
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 02:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74CB14B66C;
	Thu,  4 Aug 2022 00:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6E2113C91;
 Thu,  4 Aug 2022 00:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659572319; x=1691108319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i99TJo8RbVnlx7Q6fpfJKMDoIMtmjkVLJodpurQRRV4=;
 b=nxVrafCkOStWnxmP0qToIU07jOtEx/J+wWSeS41JCRqc/Oe9kQzqjqsa
 fZpIQq6ULEH/JvhT0bIM7ZLXIo3empzZvVTufpJiPGIgXjbJxLm8tAQoi
 v2waTktVgbJjlko7LKmyFFj9x6EgS/kRe4lauoGxC4JEb+aOEBH85p6UQ 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 17:18:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 17:18:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 17:18:38 -0700
Received: from [10.38.247.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 17:18:34 -0700
Message-ID: <ce929e8d-cecb-b06d-507d-2d411c98c46f@quicinc.com>
Date: Wed, 3 Aug 2022 17:18:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2022 3:37 PM, Douglas Anderson wrote:
> As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
> initial load w/ the bulk API") we can now specify the initial load in
> the bulk data rather than having to manually call regulator_set_load()
> on each regulator. Let's use it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes in v3:
> - Update commit message to point at the git hash of the regulator change.
> 
> Changes in v2:
> - ("Use the new regulator bulk feature to specify the load") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++----------
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++----------
>   2 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9df278d39559..a0a1b6d61d05 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -260,8 +260,10 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
>   	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
>   	int i, ret;
>   
> -	for (i = 0; i < num; i++)
> +	for (i = 0; i < num; i++) {
>   		s[i].supply = regs[i].name;
> +		s[i].init_load_uA = regs[i].enable_load;
> +	}
>   
>   	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
>   	if (ret < 0) {
> @@ -270,15 +272,6 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
>   		return ret;
>   	}
>   
> -	for (i = 0; i < num; i++) {
> -		if (regs[i].enable_load >= 0) {
> -			ret = regulator_set_load(s[i].consumer,
> -						 regs[i].enable_load);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7c105120d73e..efb6b1726cdb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -515,8 +515,10 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>   	int num = phy->cfg->reg_cfg.num;
>   	int i, ret;
>   
> -	for (i = 0; i < num; i++)
> +	for (i = 0; i < num; i++) {
>   		s[i].supply = regs[i].name;
> +		s[i].init_load_uA = regs[i].enable_load;
> +	}
>   
>   	ret = devm_regulator_bulk_get(dev, num, s);
>   	if (ret < 0) {
> @@ -529,15 +531,6 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>   		return ret;
>   	}
>   
> -	for (i = 0; i < num; i++) {
> -		if (regs[i].enable_load >= 0) {
> -			ret = regulator_set_load(s[i].consumer,
> -							regs[i].enable_load);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
>   	return 0;
>   }
>   
