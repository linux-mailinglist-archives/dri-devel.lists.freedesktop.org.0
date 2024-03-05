Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC6871801
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B422112924;
	Tue,  5 Mar 2024 08:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Urje1p8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE0112924
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:18:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A953CC8;
 Tue,  5 Mar 2024 09:17:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709626678;
 bh=aQlT/8nL6oz1JmEwS10Qg0k/nHJTXACjpqXGIT3caBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Urje1p8LiZLNSbDKARBxr0QGiU3RlKppsKJF+hofYjbP14x2FaJ7Y8MvSLps3tpmR
 Nbznjt+clMtw1BdjRtNfYoaTCCLxilbA6GMu51xWpXbn9eQDd8VgLdTfPGfha4AYho
 r8O2g3CTQKa2BjNe+rKfuV9sS3EKLAb6DGGWuRdk=
Date: Tue, 5 Mar 2024 10:18:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Message-ID: <20240305081816.GF12503@pendragon.ideasonboard.com>
References: <20240305004859.201085-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
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

Hello Adam,

Thank you for the patch.

On Mon, Mar 04, 2024 at 06:48:57PM -0600, Adam Ford wrote:
> The IRQ registration currently assumes that the GPIO is dedicated
> to it, but that may not necessarily be the case. If the board has
> another device sharing the GPIO, it won't be registered and the
> hot-plug detect fails to function.
> 
> Currently, the handler reads two registers and blindly
> assumes one of them caused the interrupt and returns IRQ_HANDLED
> unless there is an error. In order to properly do this, the IRQ
> handler needs to check if it needs to handle the IRQ and return
> IRQ_NONE if there is nothing to handle.  With the check added
> and the return code properly indicating whether or not it there
> was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> V2:  Add check to see if there is IRQ data to handle
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b5518ff97165..f3b4616a8fb6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* If there is no IRQ to handle, exit indicating no IRQ data */
> +	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> +	    !(irq1 & ADV7511_INT1_DDC_ERROR))
> +		return -ENODATA;
> +
>  	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>  	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>  
> @@ -1318,7 +1323,8 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
>  						adv7511_irq_handler,
> -						IRQF_ONESHOT, dev_name(dev),
> +						IRQF_ONESHOT | IRQF_SHARED,
> +						dev_name(dev),
>  						adv7511);
>  		if (ret)
>  			goto err_unregister_audio;

-- 
Regards,

Laurent Pinchart
