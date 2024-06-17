Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF390AE7F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E89A10E3AC;
	Mon, 17 Jun 2024 13:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="jNlek0yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E5510E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=hh18nwxNAXXkVXOW3Y5Ih2WBgf6uP2NmlEPwcE7Vfxk=;
 t=1718629234; x=1719061234; b=jNlek0yNgGF51/O2HnjtEeOe5g6SEA4lTsOtHHdq2d4y48s
 aHDrxVv/1HL1TfgADyuL1ksotdGpYqI84bKkimqAqLDjFPsJb3c+JWQGj+gRD939AMf09DDRUBw7r
 96GB5TLInitracPTzO6NYVBSDRtQZOnJa6ONudGNUDTPzP0f3Z0JzG7m1yadrEdbZHrg18pGvvDIC
 sOoFg5D8QreHbtcRPiZq4qef/IS0A4aErp85ahZUhcuGA4RNFTKwTbwDai7Feecnmrrj4s+5amV2e
 cTQVhGyPVo9+YuP0dZhEKaT/o6XZyNaiqk0ZrVU7/EK47CI9xsOo108C2dw7BHTA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sJBy8-0002p2-1C; Mon, 17 Jun 2024 15:00:20 +0200
Message-ID: <7015c544-14c3-40af-aa10-e3088eea5633@leemhuis.info>
Date: Mon, 17 Jun 2024 15:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/bridge: adv7511: Fix Intermittent EDID failures
To: dmitry.baryshkov@linaro.org, Adam Ford <aford173@gmail.com>
Cc: victor.liu@nxp.com, sui.jingfeng@linux.dev, aford@beaconembedded.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240601132459.81123-1-aford173@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20240601132459.81123-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1718629234;
 b4fc6f0e; 
X-HE-SMSGID: 1sJBy8-0002p2-1C
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Hi! Top-posting for once, to make this easily accessible to everyone.

Hmm, seem nobody took a look at below fix for a regression that seems to
be caused by f3d9683346d6b1 ("drm/bridge: adv7511: Allow IRQ to share
GPIO pins") [which went into v6.10-rc1].

Adam and Dimitry, what are your stances on this patch from Adam? I'm
asking, as you authored respectively committed the culprit?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 01.06.24 15:24, Adam Ford wrote:
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
> Reported-by: Liu Ying <victor.liu@nxp.com>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ
> ---
> V2:  Fix uninitialized cec_status
>      Cut back a little on error handling to return either IRQ_NONE or
>      IRQ_HANDLED.
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
> index 44451a9658a3..651fb1dde780 100644
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
> +		return irq_status;
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
> index 66ccb61e2a66..c8d2c4a157b2 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  {
>  	unsigned int irq0, irq1;
>  	int ret;
> +	int cec_status = IRQ_NONE;
> +	int irq_status = IRQ_NONE;
>  
>  	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>  	if (ret < 0)
> @@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
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
> @@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, void *devid)
>  	int ret;
>  
>  	ret = adv7511_irq_process(adv7511, true);
> -	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> +	return ret < 0 ? IRQ_NONE : ret;
>  }
>  
>  /* -----------------------------------------------------------------------------
