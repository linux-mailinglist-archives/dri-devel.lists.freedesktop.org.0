Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434041F711
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 23:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B056E56D;
	Fri,  1 Oct 2021 21:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF1F6E560
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 21:45:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i25so43737882lfg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/3QM+JWeDJkTe4t3CtmCDkFs9BoPpAtgcYva2gyfDlw=;
 b=pB5FIZYV+BREE/kNjfkIrKBciv7pI7+03MvHIx12OEzfaXErvh15RwP6E4Yk9Z3iXq
 Y0CutAM4QjWI7YVk4GT2mgln5Fg1QDDIOCSTbk6sfPiQbyTDTaG8Cl8Bnig4FvqnXBzO
 AyetwfEYYSdp6bqH6zuJ9r5u3KvqvqgmdSsakGxCh5cp2eWifGRTXwDd6gmcavGkqT91
 9Mc1cW9c1W6G2AVcU/BB3qCM3hQLeYt/ZkG7VdxWTelg2SIEQMV5QCEL8SneCxxvem81
 WIELhyeyScTgMdN0kSQQA8BboX3b4C1k6ArQB0PWsI/GPHlvGDPUEiIU2QfU7CqiFgAL
 FDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/3QM+JWeDJkTe4t3CtmCDkFs9BoPpAtgcYva2gyfDlw=;
 b=p1W03CQkPG5aABYTXxWEOX4wwHTaf49UpHjrdJi1kU3dPq7VaMsHCVQkkqZg56fhRu
 hRQH8Fm7hqWR6snFsHfPSw40fLfdVd/DY8+MEEfQwg3v+nIvSCdf1x9d5x0tHc5/TO/K
 NHkNY3NM5zLhDUYfU9wC5tYUuXxZxw3ExGODjLLXf9ZHZfMxYV91e4dnl4gef/2TtUMe
 CqGhfggep/KoolZ3M4QXgorgM4Kbk1dSJIHdXBkpVvkN3Fa7mq1QKj/2fF+jR8Jt7jFd
 0wkuxjLGnwZUJ4MKql1A2q8DWaX0vmtZOi85IfJsrPpCdPEUmpGA4OSiFqUOP4U3bpDK
 nYMA==
X-Gm-Message-State: AOAM532hSh12e7oAxe3WEv+UwLEDI+IXI3+jh1iIe5a2Hlj5Ihj86IDo
 MygdSQaaUPtYFuD5NiUvFNVegA==
X-Google-Smtp-Source: ABdhPJw6MWBrdW/oxXgWl6yPDf7EjHUf1K+v4NhgkOTmf9ESfQWJ8lvv4sfudi5dhIHnJ3bY9LClGA==
X-Received: by 2002:a2e:bc27:: with SMTP id b39mr331770ljf.438.1633124743260; 
 Fri, 01 Oct 2021 14:45:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c5sm772982ljd.94.2021.10.01.14.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 14:45:42 -0700 (PDT)
Subject: Re: [PATCH][V2] drm/msm: Fix potential integer overflow on 32 bit
 multiply
To: Colin King <colin.king@canonical.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929115352.212849-1-colin.king@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e1d66d58-7bfa-ec21-9c19-5c81c071932a@linaro.org>
Date: Sat, 2 Oct 2021 00:45:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929115352.212849-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2021 14:53, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where clock is 2147485 or greater the 32 bit multiplication
> by 1000 will cause an integer overflow. Fix this by making the constant
> 1000 an unsigned long to ensure a long multiply occurs to avoid the

You are talking about 'unsigned long' here, however in the patch you've 
used just 'unsigned' suffix. So, which one should be used?

I suspect that wanted to use UL here, since mode->clock is int, so it is 
int * unsigned.

Also I'd suggest to define a helper function macro in the drm_modes.h(?) 
that would take struct drm_display_mode pointer and return proper clock. 
See icc_units_to_bps() for the inspiration.


> overflow before assigning the result to the long result in variable
> requested.  Most probably a theoretical overflow issue, but worth fixing
> to clear up static analysis warnings.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")
> Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Fixes: ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
> Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: Find and fix all unintentional integer overflows that match this
>      overflow pattern.
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c    | 2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c   | 2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                    | 4 ++--
>   drivers/gpu/drm/msm/edp/edp_connector.c             | 2 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c              | 2 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_connector.c           | 2 +-
>   7 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> index 88645dbc3785..83140066441e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> @@ -50,7 +50,7 @@ static void mdp4_dtv_encoder_mode_set(struct drm_encoder *encoder,
>   
>   	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
>   
> -	mdp4_dtv_encoder->pixclock = mode->clock * 1000;
> +	mdp4_dtv_encoder->pixclock = mode->clock * 1000U;
>   
>   	DBG("pixclock=%lu", mdp4_dtv_encoder->pixclock);
>   
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index 10eb3e5b218e..d90dc0a39855 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -225,7 +225,7 @@ static void mdp4_lcdc_encoder_mode_set(struct drm_encoder *encoder,
>   
>   	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
>   
> -	mdp4_lcdc_encoder->pixclock = mode->clock * 1000;
> +	mdp4_lcdc_encoder->pixclock = mode->clock * 1000U;
>   
>   	DBG("pixclock=%lu", mdp4_lcdc_encoder->pixclock);
>   
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7288041dd86a..a965e7962a7f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -64,7 +64,7 @@ static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
>   	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
>   	long actual, requested;
>   
> -	requested = 1000 * mode->clock;
> +	requested = 1000U * mode->clock;
>   	actual = mdp4_lcdc_round_pixclk(encoder, requested);
>   
>   	DBG("requested=%ld, actual=%ld", requested, actual);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 62e75dc8afc6..6babeb79aeb0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1316,7 +1316,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   	opts_dp->lanes = ctrl->link->link_params.num_lanes;
>   	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
>   	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> -					ctrl->link->link_params.rate * 1000);
> +					ctrl->link->link_params.rate * 1000U);
>   
>   	phy_configure(phy, &dp_io->phy_opts);
>   	phy_power_on(phy);
> @@ -1336,7 +1336,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>   	int ret = 0;
>   
>   	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
> -					ctrl->dp_ctrl.pixel_rate * 1000);
> +					ctrl->dp_ctrl.pixel_rate * 1000U);
>   
>   	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
>   	if (ret)
> diff --git a/drivers/gpu/drm/msm/edp/edp_connector.c b/drivers/gpu/drm/msm/edp/edp_connector.c
> index 73cb5fd97a5a..837e7873141f 100644
> --- a/drivers/gpu/drm/msm/edp/edp_connector.c
> +++ b/drivers/gpu/drm/msm/edp/edp_connector.c
> @@ -64,7 +64,7 @@ static int edp_connector_mode_valid(struct drm_connector *connector,
>   	struct msm_kms *kms = priv->kms;
>   	long actual, requested;
>   
> -	requested = 1000 * mode->clock;
> +	requested = 1000L * mode->clock;
>   	actual = kms->funcs->round_pixclk(kms,
>   			requested, edp_connector->edp->encoder);
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 6e380db9287b..e4c68a59772a 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -209,7 +209,7 @@ static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>   
>   	mode = adjusted_mode;
>   
> -	hdmi->pixclock = mode->clock * 1000;
> +	hdmi->pixclock = mode->clock * 1000U;
>   
>   	hstart = mode->htotal - mode->hsync_start;
>   	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index 58707a1f3878..ce116a7b1bba 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -385,7 +385,7 @@ static int msm_hdmi_connector_mode_valid(struct drm_connector *connector,
>   	struct msm_kms *kms = priv->kms;
>   	long actual, requested;
>   
> -	requested = 1000 * mode->clock;
> +	requested = 1000U * mode->clock;
>   	actual = kms->funcs->round_pixclk(kms,
>   			requested, hdmi_connector->hdmi->encoder);
>   
> 


-- 
With best wishes
Dmitry
