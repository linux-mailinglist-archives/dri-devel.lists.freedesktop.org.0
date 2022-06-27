Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4255BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EA111B128;
	Mon, 27 Jun 2022 19:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CE211B128;
 Mon, 27 Jun 2022 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656358015; x=1687894015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p7RGYzYkoXiA7n4CTkYXOO66QGVDnCk+6bMDg4xrcKs=;
 b=ApoZK+CuDpla+MY379PtWLLN+64wh5dSl46qLCv1IVfsidDmwyG7LpnH
 QGoVufYl8qQ6lY6CL+H6WvrlbYVkGezeRwSNittJKsS9I72MP+EwcURYc
 DhzA4orYMQmO8RAamdvAIkMNvV1HgYuJpK22hAT9Fy5bCWOsn8e05VEwz c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 12:26:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 12:26:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 12:26:53 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 12:26:52 -0700
Message-ID: <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
Date: Mon, 27 Jun 2022 12:26:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
> If for some reason the msm_dp_config::descs array starts from non-zero
> index or contains the hole, setting the msm_dp_config::num_descs might
> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> rather than encoding the value manually.
>
> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
>   1 file changed, 27 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f87fa3ba1e25..6fed738a9467 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -131,35 +131,43 @@ struct msm_dp_config {
>   	size_t num_descs;
>   };
>   
> +static const struct msm_dp_desc sc7180_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +};
> +
>   static const struct msm_dp_config sc7180_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	},
> -	.num_descs = 1,
> +	.descs = sc7180_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
> +};
> +

why you want to do that?

It is very clear only one entry, why you want to make it 2 entry here?

can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?

> +static const struct msm_dp_desc sc7280_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>   };
>   
>   static const struct msm_dp_config sc7280_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> -		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> -	},
> -	.num_descs = 2,
> +	.descs = sc7280_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
> +};
> +
> +static const struct msm_dp_desc sc8180x_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
>   };
>   
>   static const struct msm_dp_config sc8180x_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> -	},
> -	.num_descs = 3,
> +	.descs = sc8180x_dp_descs,
> +	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> +};
> +
> +static const struct msm_dp_desc sm8350_dp_descs[] = {
> +	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>   };
>   
>   static const struct msm_dp_config sm8350_dp_cfg = {
> -	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	},
> -	.num_descs = 1,
> +	.descs = sm8350_dp_descs,
> +	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
>   };
>   
>   static const struct of_device_id dp_dt_match[] = {
