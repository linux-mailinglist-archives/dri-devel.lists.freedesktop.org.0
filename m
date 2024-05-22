Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9298CBE7F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525B710EC4C;
	Wed, 22 May 2024 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rVkHzB15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA8010EC4C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 09:48:13 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so6897039e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716371291; x=1716976091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wOYgFzdldhFOs8AkqkazEb6OybG4e8b+WL3wRmANGa0=;
 b=rVkHzB15DCNgfYEBrrVjthsTVTCug220O3kTc+mZmzHSRUz9X2qLSrP2R7g1RHLciz
 BVu6NDO1Kvi18DoGmvQTa9WfiIwXpxZH0udmWK+Ca3XGn4y00IFzphaQ6A/OkO/A9Tes
 LlSoYVO4T0gqIRYUh7xuZwq7Ca9lURwP+25E4UKySygFzQkJuOFwpbRxtBhGKcF7rLBM
 SCpLTRtWDUYAB8K7dkjT5UPRc2oRT25kTpqtejdaV7VX6GBNNzsOi3tKDwqOPmGA9h9L
 T+Q6PCW2HGcL+xb1JUskVortvCtPq4KOndhbESN28ydNO3ZlKpLo5qSb1fSO7QxJDD+s
 JjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716371291; x=1716976091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOYgFzdldhFOs8AkqkazEb6OybG4e8b+WL3wRmANGa0=;
 b=psKyeyV2Iys7VGl3Cb2sY06wb8wIxpBEv6k9DhTe0tvMLNd418JcFltCuvhgjdJZty
 cmPEybO/Xb+VjBTeIMDsukuEkheF6KDl12wGB5y6Fjf0GcvjlkqUYG3TRPfuxa0SoWKh
 s6ZH4J7ZFtZ66mUgzP/nzubjWfKxoRr+ZI+AzBFIS51F5mNkcYEeT5AkbsY+NT4OATqj
 pT4DzkB90eYpHVPt0gd62VqJDSinfRtWt0VrvkR+DUV8TQaUYpd2KrZX3u8kMO3cC6Da
 JsWcuyFZOEG5Q0/aghmAiZY+9GvPh44uzWPKiESD9ikGtU+pPtw1ScnYBeAcAZAejJwE
 GNQw==
X-Gm-Message-State: AOJu0Ywo8ak3saPCE6B84sdPL8uE4TpvtRm7tRHRt1ZDrQctop3mC7Mi
 cPrE6FVuJZseLTQFPYGIa9BZhSO1L45vNMUIhDoonXNMxeeQ1uOXWdVsJRxW6vM=
X-Google-Smtp-Source: AGHT+IE2KdRn8tiZE5EhAMqBZDzzCFB+zAishxFGbPK+g4iaMbgPVJWTe8n8SoI27ZkHJmcECOuQ2w==
X-Received: by 2002:ac2:5e85:0:b0:51f:d72:cd2d with SMTP id
 2adb3069b0e04-526bf35cb2amr849600e87.22.1716371291176; 
 Wed, 22 May 2024 02:48:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad640sm4913602e87.61.2024.05.22.02.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 02:48:10 -0700 (PDT)
Date: Wed, 22 May 2024 12:48:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, ictor.liu@nxp.com, 
 sui.jingfeng@linux.dev, aford@beaconembedded.com, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
Message-ID: <idjjg2lj7labpaq55u5ttn42fcp3ryae2ctvaw4c5lqlfp2wmz@2r6tilyvqbaf>
References: <20240521011614.496421-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521011614.496421-1-aford173@gmail.com>
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

On Mon, May 20, 2024 at 08:16:14PM -0500, Adam Ford wrote:
> In the process of adding support for shared IRQ pins, a scenario
> was accidentally created where adv7511_irq_process returned
> prematurely causing the EDID to fail randomly.
> 
> Since the interrupt handler is broken up into two main helper functions,
> update both of them to treat the helper functions as IRQ handlers. These
> IRQ routines process their respective tasks as before, but if they
> determine that actual work was done, mark the respective IRQ status
> accordingly, and delay the check until everything has been processed.
> 
> This should guarantee the helper functions don't return prematurely
> while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
> 
> Reported by: Liu Ying <victor.liu@nxp.com>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index ea271f62b214..ec0b7f3d889c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -401,7 +401,7 @@ struct adv7511 {
>  
>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>  #else
>  static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index 44451a9658a3..4efb2cabf1b5 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
>  	cec_received_msg(adv7511->cec_adap, &msg);
>  }
>  
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  {
>  	unsigned int offset = adv7511->info->reg_cec_offset;
>  	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
> @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  				ADV7511_INT1_CEC_RX_READY3;
>  	unsigned int rx_status;
>  	int rx_order[3] = { -1, -1, -1 };
> -	int i;
> +	int i, ret = 0;
> +	int irq_status = IRQ_NONE;
>  
> -	if (irq1 & irq_tx_mask)
> +	if (irq1 & irq_tx_mask) {
>  		adv_cec_tx_raw_status(adv7511, irq1);
> +		irq_status = IRQ_HANDLED;
> +	}
>  
>  	if (!(irq1 & irq_rx_mask))
> -		return;
> +		return irq_status;
>  
> -	if (regmap_read(adv7511->regmap_cec,
> -			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
> -		return;
> +	ret = regmap_read(adv7511->regmap_cec,
> +			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
> +	if (ret < 0)
> +		return ret;

Ok, maybe I was wrong with my previous suggestion. The code starts to
look more and more clumsy.  Do we really care about error status at all?
Maybe it's enough to return IRQ_NONE here from the IRQ handlers?

>  
>  	/*
>  	 * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX
> @@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  
>  		adv7511_cec_rx(adv7511, rx_buf);
>  	}
> +
> +	return IRQ_HANDLED;
>  }
>  
>  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 66ccb61e2a66..56dd2d5a0376 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  {
>  	unsigned int irq0, irq1;
>  	int ret;
> +	int cec_status;

cec_status ends up being unset if CEC is disabled.

> +	int irq_status = IRQ_NONE;
>  
>  	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>  	if (ret < 0)
> @@ -478,38 +480,41 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* If there is no IRQ to handle, exit indicating no IRQ data */
> -	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> -	    !(irq1 & ADV7511_INT1_DDC_ERROR))
> -		return -ENODATA;
> -
>  	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>  	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>  
> -	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder)
> +	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder) {
>  		schedule_work(&adv7511->hpd_work);
> +		irq_status = IRQ_HANDLED;
> +	}
>  
>  	if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
>  		adv7511->edid_read = true;
>  
>  		if (adv7511->i2c_main->irq)
>  			wake_up_all(&adv7511->wq);
> +		irq_status = IRQ_HANDLED;
>  	}
>  
>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> -	adv7511_cec_irq_process(adv7511, irq1);
> +	cec_status = adv7511_cec_irq_process(adv7511, irq1);
> +
> +	if (cec_status < 0)
> +		return cec_status;
>  #endif
>  
> -	return 0;
> +	/* If there is no IRQ to handle, exit indicating no IRQ data */
> +	if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
> +		return IRQ_HANDLED;
> +
> +	return IRQ_NONE;
>  }
>  
>  static irqreturn_t adv7511_irq_handler(int irq, void *devid)
>  {
>  	struct adv7511 *adv7511 = devid;
> -	int ret;
>  
> -	ret = adv7511_irq_process(adv7511, true);
> -	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> +	return adv7511_irq_process(adv7511, true);

This should be return ret < 0 ? IRQ_NONE : ret. We should not be
returning negative error via irqreturn_t.

>  }
>  
>  /* -----------------------------------------------------------------------------
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
