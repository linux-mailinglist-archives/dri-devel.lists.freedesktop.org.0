Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88ED570955
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616E90398;
	Mon, 11 Jul 2022 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA9F90398;
 Mon, 11 Jul 2022 17:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657561359; x=1689097359;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UMLPEIH6//nN7NZVFjr8bOKULdw0gq6WUbwlYKf3Nks=;
 b=K3+u4YeKUyXibaGmV+UtLO/ecbNV8gQ9J2/PWR+gA7Qa2op3qxtJcl1G
 DGNL11mvnnL+w2A0mbhn0ti123AkQ2unDGVpTcMvfhJdR3o+kj7ONH4DJ
 g5/ADxX6LAYOIRNMaudvNwF50idbvpVRErt02tZrl4+8qKS9ezDfHJxg0 Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 10:42:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 10:42:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 10:42:37 -0700
Received: from [10.38.245.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 10:42:34 -0700
Message-ID: <fb38d3c0-6c37-a4aa-60a0-e94d144a996f@quicinc.com>
Date: Mon, 11 Jul 2022 10:42:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/4] drm/msm/dsi: fetch DSC pps payload from struct
 mipi_dsi_device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
 <20220711094320.368062-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220711094320.368062-3-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod
 Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/11/2022 2:43 AM, Dmitry Baryshkov wrote:
> Now that struct mipi_dsi_device provides DSC data, fetch it from the
> mentioned struct rather than from the struct drm_panel itself. This
> would allow supporting MIPI DSI bridges handling DSC on their input
> side.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Would prefer to have Vinod's Tested-by on this series once we get all 
the R-bs but other than this change is,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a34078497af1..fb5ab6c718c8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1686,6 +1686,17 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>   	msm_host->lanes = dsi->lanes;
>   	msm_host->format = dsi->format;
>   	msm_host->mode_flags = dsi->mode_flags;
> +	if (dsi->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		if (!dsc) {
> +			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = dsi->dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
>   
>   	/* Some gpios defined in panel DT need to be controlled by host */
>   	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> @@ -2159,23 +2170,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> -	struct drm_panel *panel;
>   	int ret;
>   
>   	msm_host->dev = dev;
> -	panel = msm_dsi_host_get_panel(&msm_host->base);
> -
> -	if (!IS_ERR(panel) && panel->dsc) {
> -		struct msm_display_dsc_config *dsc = msm_host->dsc;
> -
> -		if (!dsc) {
> -			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
> -			if (!dsc)
> -				return -ENOMEM;
> -			dsc->drm = panel->dsc;
> -			msm_host->dsc = dsc;
> -		}
> -	}
>   
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
