Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220E5B5FA7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878E10E021;
	Mon, 12 Sep 2022 17:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058A10E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 17:55:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id r12so9935634ljg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NTG+R3pZlLIJPHgeXX/mlsOSFnC3Jz44r7bWUfR9fC8=;
 b=mn6GNMHa20/DYriyrEhhJEDF8TnJJbvn85MIaRgq0xW9zcyRvLhUggYtbw6deGduUZ
 s1af/ENhlHoCCvz5f2yTfRZj+4X2gI3lc0uvUoj0LSKXnRzc+19YEQfVqEt3l8/W46Ok
 taDa26uQw2XRRbe0UhdCbQWCxXwe8ICQRfsYc7zs+nXtVcVezM+QnTw1X0DegV9Nw18X
 mb0o/l7LGCv7vkQ4u7M2jbBWjG2UjWQttcA+1MUtCdmTTw+/uC1oc9DvtK89tdRVAZNn
 ZDxXzGUyXgobsP7Jb6+v3aQ7TCrWm/GKHgA82SEyCWZym9jrVW+P0d+Djsp3pEyLlmOY
 Ov3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NTG+R3pZlLIJPHgeXX/mlsOSFnC3Jz44r7bWUfR9fC8=;
 b=eHgyGMHihJVVaRg/4dmyhs1UauWUmpcwXJVj7N+zgfFh7kF/oAhQv0gInZoyVasUWP
 OYxrevktV8zLFhX/cdeQGes9Ei36KsM4iOcPWrsBNGMyf/DD3p+NsyqcUiwnRNvG3vUq
 f/LO0Kkc4Y4vCJa7IMzQirzIBUlnARVr72Vj0Cfwqrm1NIbrAO8B+4GbEXJ4N7aHuk/l
 1Lclq04pWjZ9RITaj32bszTPi83t3c361wSFfTI7BM/Ml6lcy5/4xTsrQZ/a/uUV1c4Y
 KT+1T7YPxhc8w6tcfK+xxBamRE6fbXESQRzBOTBhA2mcfIiBMYykccpbkSqrjRqpR2du
 X6lA==
X-Gm-Message-State: ACgBeo3QElO9BiFlmIoRj/YDvTj02V4FoSwUMDSMSpuJxXZT2jD3P/kj
 /DUxMT8+kOW7SkLduOPl+yGLMQ==
X-Google-Smtp-Source: AA6agR4GFFFTyu756+XgH+YACjOPHmjMUpJ2tnva1s9mF5M7PhSwHXHQLDUHgLLaaLh1uu5GZ88soA==
X-Received: by 2002:a05:651c:12ca:b0:261:df67:b76f with SMTP id
 10-20020a05651c12ca00b00261df67b76fmr7562930lje.421.1663005356911; 
 Mon, 12 Sep 2022 10:55:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a056512349700b00499d70c0310sm1022316lfr.3.2022.09.12.10.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 10:55:56 -0700 (PDT)
Message-ID: <1f2dbfae-a29a-d654-0ad6-10125c6b6e0b@linaro.org>
Date: Mon, 12 Sep 2022 20:55:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/7] drm/msm: fix memory corruption with too many bridges
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-3-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2022 18:40, Johan Hovold wrote:
> Add the missing sanity checks on the bridge counter to avoid corrupting
> data beyond the fixed-sized bridge array in case there are ever more
> than eight bridges.
> 
> a3376e3ec81c ("drm/msm: convert to drm_bridge")
> ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
> a689554ba6ed ("drm/msm: Initial add DSI connector support")

Most probably you've missed the Fixes: here.

> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: stable@vger.kernel.org	# 3.12
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>   drivers/gpu/drm/msm/dsi/dsi.c       | 6 ++++++
>   drivers/gpu/drm/msm/hdmi/hdmi.c     | 5 +++++

Could you please split this into respective dp/dsi/hdmi patches. This 
will assist both the review and the stable team.

Otherwise LGTM.

>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e284fed8d30..fbe950edaefe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1604,6 +1604,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   		return -EINVAL;
>   
>   	priv = dev->dev_private;
> +
> +	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> +		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
> +		return -ENOSPC;
> +	}
> +
>   	dp_display->drm_dev = dev;
>   
>   	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 39bbabb5daf6..8a95c744972a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -218,6 +218,12 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		return -EINVAL;
>   
>   	priv = dev->dev_private;
> +
> +	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> +		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
> +		return -ENOSPC;
> +	}
> +
>   	msm_dsi->dev = dev;
>   
>   	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 93fe61b86967..a0ed6aa8e4e1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -300,6 +300,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   	struct platform_device *pdev = hdmi->pdev;
>   	int ret;
>   
> +	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> +		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
> +		return -ENOSPC;
> +	}
> +
>   	hdmi->dev = dev;
>   	hdmi->encoder = encoder;
>   

-- 
With best wishes
Dmitry

