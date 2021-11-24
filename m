Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8145CD7E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 20:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B06E1F2;
	Wed, 24 Nov 2021 19:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB5B6E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 19:45:31 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id i63so7767984lji.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 11:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FYe8SZY8tKnKyO3YnDz/mlszVEbqAvVXRrJA/Pn5hGs=;
 b=enw7Ei65RL89rluLa7X0Z0lz/BscBdapoamvmqrdwSKCagZuJTGLxdhyOpFeetD70P
 wax4ZkfqAmLHKLYS+xwtCYQEPS/FIS3xUh5bJeFISrO0ByfOpSA5OSat/2LG39J4T07K
 B0frj1f6G81QVcOnnU1oEqG6VFXXwlktPyQErkQOfCL1JQwBiUK2A2gLlEBCK5YthMHQ
 RR5sE2ZA3QDPRkwZ+S2gf6OhFfmloFV4Ym5WUI8V7PbcYpNYIZIfbJGbHYxR5aOw/UIK
 z8YEJ6EuN3ghBehTI9ktuBXRpeKfc6fKXhZ6OjWDOkfx+5kO4cePiSSA8jG+SUgFSzkF
 S8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FYe8SZY8tKnKyO3YnDz/mlszVEbqAvVXRrJA/Pn5hGs=;
 b=VPrX/pa8JM/p83+H25I+iFp1eD+ZKT+ctrBfsflf8OtvSM4cEjh3xEQqjKo5Gc55Hr
 5D0uu2InGmFsMnJ3J+PFUDZApD4V/c6Ar4DOfLcekcnyRvlT6E7rh188wx7qNnnkT5Yt
 mbIsxalu1yoHklket3lA4e9xeciyP5T58Y76/lvRBJZRTffyg11XVRVBu71/euigoy2Z
 8u9EWsVN4yDLPMlqrUR9oTSG6aXPcz4gY3miG0Fv9C+M3x0ucSwgNJ7qpiXIQPm/piT9
 BqGXX/QXVi+qk5Ay7pgjC3lS8eyhSi7AwvaMYXlYcxvxlRCQccXNlhRDYx1zWAH+SMgK
 TLgg==
X-Gm-Message-State: AOAM531zvx7NDTp+GunRtRlrG9hHyg92SODCq3LCCVvz5lO9bQxKaf4H
 mti97r6e06bnLspT/Wtap19DrA==
X-Google-Smtp-Source: ABdhPJwxcub+kL6aUHYpIX6Ga9P2hZ9V4SPH5upele4k0jWTFeYQe8HtM8Y5JLoB/xvSqxpt2+0LFw==
X-Received: by 2002:a05:651c:1791:: with SMTP id
 bn17mr17399555ljb.525.1637783129355; 
 Wed, 24 Nov 2021 11:45:29 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h14sm68197lfu.195.2021.11.24.11.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 11:45:28 -0800 (PST)
Subject: Re: [PATCH v3] drm/msm/dp: employ bridge mechanism for display enable
 and disable
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1637002123-18682-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <02b7b643-f6d4-aa5f-6e05-46aa7c3a81cb@linaro.org>
Date: Wed, 24 Nov 2021 22:45:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637002123-18682-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2021 21:48, Kuogee Hsieh wrote:
> Currently the msm_dp_*** functions implement the same sequence which would
> happen when drm_bridge is used. hence get rid of this intermediate layer
> and align with the drm_bridge usage to avoid customized implementation.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Changes in v2:
> -- revise commit text
> -- rename dp_bridge to msm_dp_bridge
> -- delete empty functions
> 
> Changes in 3:
> -- replace kzalloc() with devm_kzalloc()
> -- replace __dp_display_enable() with dp_display_enable()
> -- replace __dp_display_disable() with dp_display_disable()
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++
>   drivers/gpu/drm/msm/dp/dp_display.c         |  4 +-
>   drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c             | 91 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h               | 16 +++--
>   6 files changed, 113 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 31050aa..c4e08c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1003,9 +1003,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   
>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
> -		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
> -
>   	list_for_each_entry(conn_iter, connector_list, head)
>   		if (conn_iter->encoder == drm_enc)
>   			conn = conn_iter;
> @@ -1181,14 +1178,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   
>   	_dpu_encoder_virt_enable_helper(drm_enc);
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> -		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
> -		if (ret) {
> -			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
> -				ret);
> -			goto out;
> -		}
> -	}
>   	dpu_enc->enabled = true;
>   
>   out:
> @@ -1214,11 +1203,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	/* wait for idle */
>   	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> -		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
> -			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
> -	}
> -
>   	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>   
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> @@ -1243,11 +1227,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   
>   	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>   
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> -		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
> -			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
> -	}
> -
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 27d98b5..d16337f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -557,6 +557,13 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   				  encoder->base.id, rc);
>   			return rc;
>   		}
> +
> +		rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);
> +		if (rc) {
> +			DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
> +				encoder->base.id, rc);
> +			return rc;
> +		}

There is no need to teach DPU driver about all the gory details of DP 
internals. Move this call to the msm_dp_modeset_init().

>   	}
>   
>   	return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2f113ff..51770a4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1674,8 +1674,8 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>   }
>   
>   void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode)
>   {
>   	struct dp_display_private *dp_display;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 76f45f9..2237e80 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -13,6 +13,7 @@
>   struct msm_dp {
>   	struct drm_device *drm_dev;
>   	struct device *codec_dev;
> +	struct drm_bridge *bridge;
>   	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
>   	struct drm_panel *drm_panel;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f33e315..b341f1f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -5,12 +5,21 @@
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
>   #include <drm/drm_crtc.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
>   #include "dp_drm.h"
>   
> +
> +struct msm_dp_bridge {
> +	struct drm_bridge bridge;
> +	struct msm_dp *dp_display;
> +};
> +
> +#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
> +
>   struct dp_connector {
>   	struct drm_connector base;
>   	struct msm_dp *dp_display;
> @@ -162,3 +171,85 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>   
>   	return connector;
>   }
> +
> +static int dp_bridge_attach(struct drm_bridge *drm_bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	return 0;
> +}

As far as I see from drm_bridge_attach() there is no need to provide 
stubs for attach callback. Please drop it.

> +
> +static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	msm_dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
> +}
> +
> +static void dp_bridge_enable(struct drm_bridge *drm_bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	msm_dp_display_enable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void dp_bridge_disable(struct drm_bridge *drm_bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +	msm_dp_display_disable(dp_display, drm_bridge->encoder);
> +}
> +
> +static const struct drm_bridge_funcs dp_bridge_ops = {
> +	.attach       = dp_bridge_attach,
> +	.mode_fixup   = NULL,
> +	.pre_enable   = NULL,

No need to initialize fields to default values (NULL). Drop these two 
please.

> +	.enable       = dp_bridge_enable,
> +	.disable      = dp_bridge_disable,
> +	.post_disable = dp_bridge_post_disable,
> +	.mode_set     = dp_bridge_mode_set,
> +};
> +
> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> +			struct drm_encoder *encoder)
> +{
> +	int rc;
> +	struct msm_drm_private *priv;
> +	struct msm_dp_bridge *dp_bridge;
> +	struct drm_bridge *bridge;
> +
> +	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
> +	if (!dp_bridge)
> +		return -ENOMEM;
> +
> +	dp_bridge->dp_display = dp_display;
> +
> +	bridge = &dp_bridge->bridge;
> +	bridge->funcs = &dp_bridge_ops;
> +	bridge->encoder = encoder;
> +
> +	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (rc) {
> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> +		kfree(dp_bridge);
> +		return rc;
> +	}
> +
> +	priv = dev->dev_private;
> +	priv->bridges[priv->num_bridges++] = bridge;
> +	dp_display->bridge = bridge;
> +
> +	return 0;
> +} > diff --git a/drivers/gpu/drm/msm/msm_drv.h 
b/drivers/gpu/drm/msm/msm_drv.h
> index 4bb797e..9a2092f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -388,8 +388,10 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
>   int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
>   int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
>   void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode);
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode);
> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> +			struct drm_encoder *encoder);
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>   
> @@ -426,10 +428,16 @@ static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
>   }
>   static inline void msm_dp_display_mode_set(struct msm_dp *dp,
>   				struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode)
>   {
>   }
> +static inline int msm_dp_bridge_init(struct msm_dp *dp_display,
> +				struct drm_device *dev,
> +				struct drm_encoder *encoder)
> +{
> +	return -EINVAL;
> +}

If msm_dp_bridge_init() becomes DP-internal function, this is unnecessary.

>   
>   static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   {
> 


-- 
With best wishes
Dmitry
