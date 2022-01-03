Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79648306E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA14C10E119;
	Mon,  3 Jan 2022 11:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECFC10E119
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:22:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t26so69240010wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BNbTKpjbmWU2ee+fIXH6oE6o9ijvgMX48fYdOT45X/Q=;
 b=b3llH14P0tfs30LgRrpzXrfr0/n+TkaCFTaW3eqCfql3dGHMmzBmYbjldPk30kJtFq
 VeHKftyBKTQ4mXPxNBDGjuani4Inopixvs9yPJcxoJY02+glRC+806t5RC2nMMTxUMG7
 h7Ilc2xD1NY6yvaZLZSjJNO2DIjEB4KSoRDc8qnE3avLo1LlXmpZptmS7qfYmd0yPrV5
 oL2Aq71fYpe2+MCYZqyFIRInof5FoFR4DDY1XQCaI0HhVIb17K982XRxtz4jHHy44xqQ
 4Nn33FcnMU0VgVxLl2d0MkPjmJXvYo92PDEMo8UXpVIN2rydjDUSe06mDYsIwEKaMAWd
 mo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BNbTKpjbmWU2ee+fIXH6oE6o9ijvgMX48fYdOT45X/Q=;
 b=WP00nt8eE5GWXjLl+MfDulTA230QTDF7TN9yFiEv6sSjpW38bxg0NKqpf2grJzyZcN
 LLA1b3NFKXup7CSv62KKEUTMlO3YkUaT/VfVN24+b4pFrIMxgbqwtghPCOlWrR3DdW0h
 pHnuo7wY9/BPyKx4/YbmUQUcyn2+xWNkXoycOzZhR7cjh2XZ7PK9H8ItJqnWw6SA+bqy
 0CPljGeC883c4VH3+NRJQQyGqdbv5lb7qu+USoak00dj8RiooqMReYP1I2gjoLBHiZfu
 eo1B8PiaDHR3j1zzaGyEgMffKxEUgJthegE6vvACj5+XclAcdzMa3e7RrfSCM5EwUM18
 t7JQ==
X-Gm-Message-State: AOAM531YonX6Q+V0uRROBNSRG5HvWNL4M31Erwoq6l4+hrGJPS41JW2J
 Xb+Z0wBSpvg2MSNcYeLJmmXHHw==
X-Google-Smtp-Source: ABdhPJwlW5bTY0c+ncM+C9gmKuAqCov9E4Zx3krZ9I9IaDZkpiD+J1KC4iz71QV3+92ok2Ll7laMnQ==
X-Received: by 2002:adf:e0ce:: with SMTP id m14mr20370362wri.630.1641208948255; 
 Mon, 03 Jan 2022 03:22:28 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id b2sm38209160wrd.35.2022.01.03.03.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:22:27 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/meson: Fix error handling when afbcd.ops->init
 fails
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
 <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <386f5be4-eca0-6117-82f5-317b82ee66a7@baylibre.com>
Date: Mon, 3 Jan 2022 12:22:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/12/2021 00:55, Martin Blumenstingl wrote:
> When afbcd.ops->init fails we need to free the struct drm_device. Also
> all errors which come after afbcd.ops->init was successful need to exit
> the AFBCD, just like meson_drv_unbind() does.
> 
> Fixes: d1b5e41e13a7e9 ("drm/meson: Add AFBCD module driver")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index b919271a6e50..26aeaf0ab86e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -302,42 +302,42 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	if (priv->afbcd.ops) {
>  		ret = priv->afbcd.ops->init(priv);
>  		if (ret)
> -			return ret;
> +			goto free_drm;
>  	}
>  
>  	/* Encoder Initialization */
>  
>  	ret = meson_encoder_cvbs_init(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	if (has_components) {
>  		ret = component_bind_all(drm->dev, drm);
>  		if (ret) {
>  			dev_err(drm->dev, "Couldn't bind all components\n");
> -			goto free_drm;
> +			goto exit_afbcd;
>  		}
>  	}
>  
>  	ret = meson_encoder_hdmi_init(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_plane_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_overlay_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_crtc_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	drm_mode_config_reset(drm);
>  
> @@ -355,6 +355,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +exit_afbcd:
> +	if (priv->afbcd.ops)
> +		priv->afbcd.ops->exit(priv);
>  free_drm:
>  	drm_dev_put(drm);
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,

But this depends on patch 1, so I'll add the same Fixes tag on patch 1 and add to drm-misc-next so it won't pollute -fixes but will still be eventually be backported when landing on linus master.

Neil
