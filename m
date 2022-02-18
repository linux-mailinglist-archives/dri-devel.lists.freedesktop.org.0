Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F04BC196
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43C810E135;
	Fri, 18 Feb 2022 21:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFE410E12F;
 Fri, 18 Feb 2022 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645218878; x=1676754878;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yp0OC/oQprRMTW2AssP6O/TBviyCfpXpGcwtCGmffQc=;
 b=ovU4Apd63wsA8s8mJ7BxNMM7yK06N/8DARKmpLGNdakeVKXNCiXQ7Dnm
 q3gtjV28WX6H7Ygr9QAvea3Ou8wJHGEZ5XDC60pUBnjuCwrQNBX9PYLp1
 VyvXwKKNw0AOZjmM3zrW2XevuoiDLWb9CYSRSLYCkMfbgjU4kFoGq4WEi Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Feb 2022 13:14:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:14:37 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 18 Feb 2022 13:14:36 -0800
Received: from [10.110.101.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 18 Feb
 2022 13:14:35 -0800
Message-ID: <48bc4693-c6ba-11fe-86e6-fbcf784fee8d@quicinc.com>
Date: Fri, 18 Feb 2022 13:14:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
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


On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels. The panel bridge attaches
> to the encoder before the "dp" bridge has a chace to do so. Change
> panel_bridge attachment to come after dp_bridge attachment.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d19eba..26ef41a4c1b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>   
>   	drm_connector_attach_encoder(connector, dp_display->encoder);
>   
> -	if (dp_display->panel_bridge) {
> -		ret = drm_bridge_attach(dp_display->encoder,
> -					dp_display->panel_bridge, NULL,
> -					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -		if (ret < 0) {
> -			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
> -			return ERR_PTR(ret);
> -		}
> -	}
> -
>   	return connector;
>   }
>   
> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   		return ERR_PTR(rc);
>   	}
>   
> +	if (dp_display->panel_bridge) {
> +		rc = drm_bridge_attach(dp_display->encoder,
> +					dp_display->panel_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (rc < 0) {
> +			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
> +			drm_bridge_remove(bridge);
> +			return ERR_PTR(rc);
> +		}
> +	}
> +
>   	return bridge;
>   }
