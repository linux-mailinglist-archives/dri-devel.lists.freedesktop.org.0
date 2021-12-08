Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D620146C975
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 01:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733B6E15F;
	Wed,  8 Dec 2021 00:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2C36E072;
 Wed,  8 Dec 2021 00:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638924165; x=1670460165;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IOXhzLbAbOjYfOtaCa+yYMGoFtzfVki0B97LX03IghI=;
 b=I8a9ajy6EbV3HF1+91ugGlXoe7WaasH5AwbWmULR/WrMQUmlp1GnBTI2
 QSfNHCXapxJrvadAp8j8KP4dxhkbFDK3CZNfC5i7OwGmcVJ/xGUTc1DVt
 WFr26dgG5Cdpp13vN4PzhqsE1ldbMLM1rjaKjGJnsdMT6Cp7Hi+dU4rlw g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 07 Dec 2021 16:42:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 16:42:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 16:42:43 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 7 Dec 2021
 16:42:41 -0800
Message-ID: <8c9c4f59-cef0-baa6-0a40-0a3c1fce3470@quicinc.com>
Date: Tue, 7 Dec 2021 16:42:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dsi: fix initialization in the bonded DSI case
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211125180114.561278-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211125180114.561278-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/25/2021 10:01 AM, Dmitry Baryshkov wrote:
> Commit 739b4e7756d3 ("drm/msm/dsi: Fix an error code in
> msm_dsi_modeset_init()") changed msm_dsi_modeset_init() to return an
> error code in case msm_dsi_manager_validate_current_config() returns
> false. However this is not an error case, but a slave DSI of the bonded
> DSI link. In this case msm_dsi_modeset_init() should return 0, but just
> skip connector and bridge initialization.
> 
> To reduce possible confusion, drop the
> msm_dsi_manager_validate_current_config() function, and specif 'bonded
> && !master' condition directly in the msm_dsi_modeset_init().
> 
> Fixes: 739b4e7756d3 ("drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c         | 10 +++++++---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 17 -----------------
>   3 files changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75ae3008b68f..fc280cc43494 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -215,9 +215,13 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		goto fail;
>   	}
>   
> -	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
> -		ret = -EINVAL;
> -		goto fail;
> +	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
> +	    !msm_dsi_is_master_dsi(msm_dsi)) {
> +		/*
> +		 * Do not return an eror here,
> +		 * Just skip creating encoder/connector for the slave-DSI.
> +		 */
> +		return 0;
>   	}
>   
>   	msm_dsi->encoder = encoder;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 66443dc98500..ef8212990254 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -82,7 +82,6 @@ int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>   int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>   void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
> -bool msm_dsi_manager_validate_current_config(u8 id);
>   void msm_dsi_manager_tpg_enable(void);
>   
>   /* msm dsi */
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a152dbf63038..a73cfeb93e90 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -645,23 +645,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
>   	return ERR_PTR(ret);
>   }
>   
> -bool msm_dsi_manager_validate_current_config(u8 id)
> -{
> -	bool is_bonded_dsi = IS_BONDED_DSI();
> -
> -	/*
> -	 * For bonded DSI, we only have one drm panel. For this
> -	 * use case, we register only one bridge/connector.
> -	 * Skip bridge/connector initialisation if it is
> -	 * slave-DSI for bonded DSI configuration.
> -	 */
> -	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id)) {
> -		DBG("Skip bridge registration for slave DSI->id: %d\n", id);
> -		return false;
> -	}
> -	return true;
> -}
> -
>   /* initialize bridge */
>   struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>   {
> 
