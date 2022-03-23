Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05B4E5A1A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA710E0EA;
	Wed, 23 Mar 2022 20:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C2810E06D;
 Wed, 23 Mar 2022 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648068417; x=1679604417;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AxGelGzu1bTctS6PiTzNznlLWIWY7xFgvOsi7zpXH2o=;
 b=THm3XeQHW9AYP1cJTnKsjBX3VWAAg6jiSygtc+igv3EpvRdJHu8GPnLq
 HUNKI0V4jZsWEpRj7QmnPjWXicIwLRzrL+6ma9HIt/fTUYnm6Mrnfr1Zb
 oAPWrA7R6xE+pIUB69tUK6wXsNNtZYlf/6SP/YSPjJIypUMeu1esTBPx2 M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 13:46:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 13:46:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:46:55 -0700
Received: from [10.110.28.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:46:54 -0700
Message-ID: <813b8db3-dfe5-0a79-f625-2b96fede9385@quicinc.com>
Date: Wed, 23 Mar 2022 13:46:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] drm/msm/dp: simplify dp_connector_get_modes()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Sankeerth
 Billakanti" <quic_sbillaka@quicinc.com>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
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


On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
> Since dp_panel_get_modes() handling for dp_mode was removed,
> dp_display_get_modes also doesn't change the passed dp_mode, drop the
> unused dp_mode variable being allocated unused and then freed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 ++------
>   drivers/gpu/drm/msm/dp/dp_display.h |  3 +--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 29 +----------------------------
>   3 files changed, 4 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3dd790083cf7..be1e9c558fda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -999,8 +999,7 @@ int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
>   	return MODE_OK;
>   }
>   
> -int dp_display_get_modes(struct msm_dp *dp,
> -				struct dp_display_mode *dp_mode)
> +int dp_display_get_modes(struct msm_dp *dp)
>   {
>   	struct dp_display_private *dp_display;
>   	int ret = 0;
> @@ -1012,11 +1011,8 @@ int dp_display_get_modes(struct msm_dp *dp,
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> -	ret = dp_panel_get_modes(dp_display->panel,
> +	return dp_panel_get_modes(dp_display->panel,
>   		dp->connector);
> -	if (dp_mode->drm_mode.clock)
> -		dp->max_pclk_khz = dp_mode->drm_mode.clock;
> -	return ret;
>   }
>   
>   bool dp_display_check_video_test(struct msm_dp *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 7af2b186d2d9..6efb5c853c89 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -33,8 +33,7 @@ struct msm_dp {
>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>   		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>   int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
> -int dp_display_get_modes(struct msm_dp *dp_display,
> -		struct dp_display_mode *dp_mode);
> +int dp_display_get_modes(struct msm_dp *dp_display);
>   int dp_display_request_irq(struct msm_dp *dp_display);
>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 80f59cf99089..af5f1b001192 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -55,49 +55,22 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   {
>   	int rc = 0;
>   	struct msm_dp *dp;
> -	struct dp_display_mode *dp_mode = NULL;
> -	struct drm_display_mode *m, drm_mode;
>   
>   	if (!connector)
>   		return 0;
>   
>   	dp = to_dp_connector(connector)->dp_display;
>   
> -	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
> -	if (!dp_mode)
> -		return 0;
> -
>   	/* pluggable case assumes EDID is read when HPD */
>   	if (dp->is_connected) {
> -		/*
> -		 *The get_modes() function might return one mode that is stored
> -		 * in dp_mode when compliance test is in progress. If not, the
> -		 * return value is equal to the total number of modes supported
> -		 * by the sink
> -		 */
> -		rc = dp_display_get_modes(dp, dp_mode);
> +		rc = dp_display_get_modes(dp);
>   		if (rc <= 0) {
>   			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
> -			kfree(dp_mode);
>   			return rc;
>   		}
> -		if (dp_mode->drm_mode.clock) { /* valid DP mode */
> -			memset(&drm_mode, 0x0, sizeof(drm_mode));
> -			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
> -			m = drm_mode_duplicate(connector->dev, &drm_mode);
> -			if (!m) {
> -				DRM_ERROR("failed to add mode %ux%u\n",
> -				       drm_mode.hdisplay,
> -				       drm_mode.vdisplay);
> -				kfree(dp_mode);
> -				return 0;
> -			}
> -			drm_mode_probed_add(connector, m);
> -		}
>   	} else {
>   		DRM_DEBUG_DP("No sink connected\n");
>   	}
> -	kfree(dp_mode);
>   	return rc;
>   }
>   
