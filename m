Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A4859E5B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA310E13B;
	Mon, 19 Feb 2024 08:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yb1KFBGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6A310E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:35:30 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512acc1a881so1050521e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708331728; x=1708936528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Zfx3ZEwTL6FBC4zykr6yONY+eAjewsuouiDmLMUTrYA=;
 b=Yb1KFBGDeOcXc5xU9CE7R8dinQAe6+kHmPRXla4EnMFTqh5BtWVIGW0gcOOvYzfJPD
 GKKhs4oCHCBy8ce1KcKeBG3p3jOzRv1mpq3Wevkn3LBnrDfZB3xn6U3oQzjW/1B0E/qE
 qk2F8qL41MjzUoBP5QW0Zb7MzKL1TbjdmbaL0AtWEcsFi4KN54Y7l9xp6Ww4+qTX7hp+
 dOk5ewIDYKkbFLGHhOgT72SJWN7IPN51d1iku17zgD+66/EpG9TUU+jbj2v0uVVLyzRD
 44vCkr7htl/+cGfHTW53aDPrEjxywnBbydkabtF4wbVeIxkM7z90V9TTRBIThh3Te5EI
 pneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708331728; x=1708936528;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zfx3ZEwTL6FBC4zykr6yONY+eAjewsuouiDmLMUTrYA=;
 b=WDI12uymHRONT3yV/kMf65BZIxIutWuaRq1EcPd7zR7Dy79Qk8bzoDVNnOmOrmCeS6
 cJniAAHn2bBAMwtmzg2iXq6MjU7iaujSqcacy6zKb8Ow+vFCQnk1i9f/h8YFkPOVfdqf
 DjFxxa1vY9q6EqPUugmxdqTNo0yWAYZ7DhfMnWpT7/i/BwFzi5GrpbzkifVKsxBCk4o4
 NbJ+Mi/DMea4kRkhS7Zp2BAGT1km+z/xNeFleMtAvPTipjENYHkAEfS+eiyPtoj4gzQj
 mcbC6NA1wudoQZGw3LYbA2FEEWJinEBiqx8vgwOxOpHuqvbW3CGBK8ZXBfk1/o/kHV9W
 ZlVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTLJ7kfJ3vwNOSYQMCA/4uM1j1fcmau6n0GJuKdYwB5uHMttiCNHKKn0uCWrmDgXjdoj5y1PlqOr1IZgkWFhlw5jm+4Zd5glnj1mk8Tk1N
X-Gm-Message-State: AOJu0YznQJ27KROq0txUMGRtnP6uDhgAJj+YyP57RDn93oskQzH8Edqx
 yrPXylc/y0jRwInIWGxrVSlMxT4xPm9N+ddiVmLOsBUwjkO1DM62GVJUDA/98O4=
X-Google-Smtp-Source: AGHT+IHAyjCKKOsQG0yPf8hX1IXJFzN7yXOpiya+w8YNkF07mLmOCTuQMvbFv0PBrJP8aIFB+GAJ0Q==
X-Received: by 2002:ac2:4433:0:b0:512:b915:3b18 with SMTP id
 w19-20020ac24433000000b00512b9153b18mr587309lfl.52.1708331728474; 
 Mon, 19 Feb 2024 00:35:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f?
 ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a7bc4d3000000b004126101915esm4868608wmk.4.2024.02.19.00.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:35:28 -0800 (PST)
Message-ID: <4cfb1b74-7941-45af-a60e-0661b1888b79@linaro.org>
Date: Mon, 19 Feb 2024 09:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drm/meson: improve encoder probe / initialization
 error handling
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2024 18:50, Martin Blumenstingl wrote:
> Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
> meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
> are used at probe time during driver initialization. Also switch all
> error prints inside those functions to use dev_err_probe() for
> consistency.
> 
> This makes the code more straight forward to read and makes the error
> prints within those functions consistent (by logging all -EPROBE_DEFER
> with dev_dbg(), while actual errors are logged with dev_err() and get
> the error value printed).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This is meant to be applied on top of my other patch called
> "drm/meson: Don't remove bridges which are created by other drivers" [0]
> 
> 
> [0] https://lore.kernel.org/dri-devel/20240215220442.1343152-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_drv.c          |  6 +++---
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c | 24 ++++++++++------------
>   drivers/gpu/drm/meson/meson_encoder_cvbs.h |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_dsi.c  | 23 +++++++++------------
>   drivers/gpu/drm/meson/meson_encoder_dsi.h  |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++-------
>   drivers/gpu/drm/meson/meson_encoder_hdmi.h |  2 +-
>   7 files changed, 35 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index cb674966e9ac..17a5cca007e2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -312,7 +312,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   
>   	/* Encoder Initialization */
>   
> -	ret = meson_encoder_cvbs_init(priv);
> +	ret = meson_encoder_cvbs_probe(priv);
>   	if (ret)
>   		goto exit_afbcd;
>   
> @@ -326,12 +326,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   		}
>   	}
>   
> -	ret = meson_encoder_hdmi_init(priv);
> +	ret = meson_encoder_hdmi_probe(priv);
>   	if (ret)
>   		goto exit_afbcd;
>   
>   	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> -		ret = meson_encoder_dsi_init(priv);
> +		ret = meson_encoder_dsi_probe(priv);
>   		if (ret)
>   			goto exit_afbcd;
>   	}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 3407450435e2..d1191de855d9 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -219,7 +219,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_cvbs_init(struct meson_drm *priv)
> +int meson_encoder_cvbs_probe(struct meson_drm *priv)
>   {
>   	struct drm_device *drm = priv->drm;
>   	struct meson_encoder_cvbs *meson_encoder_cvbs;
> @@ -240,10 +240,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   
>   	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
>   	of_node_put(remote);
> -	if (!meson_encoder_cvbs->next_bridge) {
> -		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!meson_encoder_cvbs->next_bridge)
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find CVBS Connector bridge\n");
>   
>   	/* CVBS Encoder Bridge */
>   	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
> @@ -259,10 +258,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   	/* Encoder */
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
>   				      DRM_MODE_ENCODER_TVDAC);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to init CVBS encoder\n");
>   
>   	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
>   
> @@ -276,10 +274,10 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   
>   	/* Initialize & attach Bridge Connector */
>   	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
> -	if (IS_ERR(connector)) {
> -		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
> -		return PTR_ERR(connector);
> -	}
> +	if (IS_ERR(connector))
> +		return dev_err_probe(priv->dev, PTR_ERR(connector),
> +				     "Unable to create CVBS bridge connector\n");
> +
>   	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
>   
>   	priv->encoders[MESON_ENC_CVBS] = meson_encoder_cvbs;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> index 09710fec3c66..7b7bc85c03f7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> @@ -24,7 +24,7 @@ struct meson_cvbs_mode {
>   /* Modes supported by the CVBS output */
>   extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
>   
> -int meson_encoder_cvbs_init(struct meson_drm *priv);
> +int meson_encoder_cvbs_probe(struct meson_drm *priv);
>   void meson_encoder_cvbs_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_VENC_CVBS_H */
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 311b91630fbe..7816902f5907 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -100,7 +100,7 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_dsi_init(struct meson_drm *priv)
> +int meson_encoder_dsi_probe(struct meson_drm *priv)
>   {
>   	struct meson_encoder_dsi *meson_encoder_dsi;
>   	struct device_node *remote;
> @@ -118,10 +118,9 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> -	if (!meson_encoder_dsi->next_bridge) {
> -		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!meson_encoder_dsi->next_bridge)
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find DSI transceiver bridge\n");
>   
>   	/* DSI Encoder Bridge */
>   	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
> @@ -135,19 +134,17 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
>   	/* Encoder */
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
>   				      DRM_MODE_ENCODER_DSI);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to init DSI encoder\n");
>   
>   	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
>   
>   	/* Attach DSI Encoder Bridge to Encoder */
>   	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to attach bridge\n");
>   
>   	/*
>   	 * We should have now in place:
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
> index 9277d7015193..85d5b61805f2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
> @@ -7,7 +7,7 @@
>   #ifndef __MESON_ENCODER_DSI_H
>   #define __MESON_ENCODER_DSI_H
>   
> -int meson_encoder_dsi_init(struct meson_drm *priv);
> +int meson_encoder_dsi_probe(struct meson_drm *priv);
>   void meson_encoder_dsi_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_ENCODER_DSI_H */
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index c4686568c9ca..22e07847a9a7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -354,7 +354,7 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_hdmi_init(struct meson_drm *priv)
> +int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   {
>   	struct meson_encoder_hdmi *meson_encoder_hdmi;
>   	struct platform_device *pdev;
> @@ -374,8 +374,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   
>   	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
>   	if (!meson_encoder_hdmi->next_bridge) {
> -		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
> -		ret = -EPROBE_DEFER;
> +		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				    "Failed to find HDMI transceiver bridge\n");
>   		goto err_put_node;
>   	}
>   
> @@ -393,7 +393,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
>   				      DRM_MODE_ENCODER_TMDS);
>   	if (ret) {
> -		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
> +		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
>   		goto err_put_node;
>   	}
>   
> @@ -403,7 +403,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret) {
> -		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
>   		goto err_put_node;
>   	}
>   
> @@ -411,8 +411,9 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
>   							&meson_encoder_hdmi->encoder);
>   	if (IS_ERR(meson_encoder_hdmi->connector)) {
> -		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
> -		ret = PTR_ERR(meson_encoder_hdmi->connector);
> +		ret = dev_err_probe(priv->dev,
> +				    PTR_ERR(meson_encoder_hdmi->connector),
> +				    "Unable to create HDMI bridge connector\n");
>   		goto err_put_node;
>   	}
>   	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> index a6cd38eb5f71..fd5485875db8 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> @@ -7,7 +7,7 @@
>   #ifndef __MESON_ENCODER_HDMI_H
>   #define __MESON_ENCODER_HDMI_H
>   
> -int meson_encoder_hdmi_init(struct meson_drm *priv);
> +int meson_encoder_hdmi_probe(struct meson_drm *priv);
>   void meson_encoder_hdmi_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_ENCODER_HDMI_H */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
