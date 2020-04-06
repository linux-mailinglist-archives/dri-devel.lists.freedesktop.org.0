Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8F19EEFC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 02:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12206E22D;
	Mon,  6 Apr 2020 00:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8E16E22D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 00:58:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 753A3312;
 Mon,  6 Apr 2020 02:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586134708;
 bh=FfFAq3k/hGpTAOFis11FvXbtnCb+lYdKBpw4czzn3gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UAqFIpZeYBRhGmgeH8J0JyjiO8PsDwnQ//BX0MlLF91hApakzcGIfTRKX/Wffffec
 czAdhmo4vv4YfQO6jmfubONM1+GSN9nPnyl72afKHcHAngTT/HPRnbCrbAn1K2UyMf
 VXy26WEc0m19GrKzi8Frrro8bWcUiTQjPYpSPwqs=
Date: Mon, 6 Apr 2020 03:58:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER handling
Message-ID: <20200406005817.GA11665@pendragon.ideasonboard.com>
References: <20200331141629.14047-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331141629.14047-1-vincent.whitchurch@axis.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, narmstrong@baylibre.com,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl, a.hajda@samsung.com,
 kernel@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vincent,

Thank you for the patch.

On Tue, Mar 31, 2020 at 04:16:29PM +0200, Vincent Whitchurch wrote:
> If adv7511's devm_clk_get() for the cec clock returns -EPROBE_DEFER, we
> end up in an infinite probe loop.  This happens:
> 
>  (1) adv7511's probe is called.
> 
>  (2) adv7511's probe adds some secondary i2c devices which bind to the
>  dummy driver and thus call driver_deferred_probe_trigger() and
>  increment deferred_trigger_count (see driver_bound()).
> 
>  (3) adv7511's probe returns -EPROBE_DEFER, and since the
>  deferred_trigger_count has changed during the probe call,
>  driver_deferred_probe_trigger() is called immediately (see
>  really_probe()) and adv7511's probe is scheduled.
> 
>  (4) Goto step 1.

Lovely :-S

> [   61.972915] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039
> [   61.992734] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003f
> [   61.993343] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003f'
> [   61.993626] really_probe: bus: 'i2c': really_probe: bound device 0-003f to driver dummy
> [   61.995604] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-0038
> [   61.996381] driver_bound: driver: 'dummy': driver_bound: bound to device '0-0038'
> [   61.996663] really_probe: bus: 'i2c': really_probe: bound device 0-0038 to driver dummy
> [   61.998651] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003c
> [   61.999222] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003c'
> [   61.999496] really_probe: bus: 'i2c': really_probe: bound device 0-003c to driver dummy
> [   62.010050] really_probe: i2c 0-0039: Driver adv7511 requests probe deferral
> [   62.011380] really_probe: bus: 'platform': really_probe: probing driver pwm-clock with device clock-cec
> [   62.012812] really_probe: platform clock-cec: Driver pwm-clock requests probe deferral
> [   62.024679] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039
> 
> Fix this by calling devm_clk_get() before registering the secondary
> devices.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 30 +++++++-------------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++--
>  2 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index a20a45c0b353..4b0fee32be21 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -286,28 +286,17 @@ static const struct cec_adap_ops adv7511_cec_adap_ops = {
>  	.adap_transmit = adv7511_cec_adap_transmit,
>  };
>  
> -static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
> -{
> -	adv7511->cec_clk = devm_clk_get(dev, "cec");
> -	if (IS_ERR(adv7511->cec_clk)) {
> -		int ret = PTR_ERR(adv7511->cec_clk);
> -
> -		adv7511->cec_clk = NULL;
> -		return ret;
> -	}
> -	clk_prepare_enable(adv7511->cec_clk);
> -	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
> -	return 0;
> -}
> -
>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  {
>  	unsigned int offset = adv7511->type == ADV7533 ?
>  						ADV7533_REG_CEC_OFFSET : 0;
> -	int ret = adv7511_cec_parse_dt(dev, adv7511);
> +	int ret;
>  
> -	if (ret)
> -		goto err_cec_parse_dt;
> +	if (!adv7511->cec_clk)
> +		goto err_cec_no_clock;
> +
> +	clk_prepare_enable(adv7511->cec_clk);
> +	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
>  
>  	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
>  		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
> @@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  err_cec_alloc:
>  	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
>  		 ret);
> -err_cec_parse_dt:
> +	clk_disable_unprepare(adv7511->cec_clk);
> +	/* Ensure that adv7511_remove() doesn't attempt to disable it again. */

Would it make sense to call devm_clk_put() here to already release the
clock ? Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	adv7511->cec_clk = NULL;
> +err_cec_no_clock:
>  	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
>  		     ADV7511_CEC_CTRL_POWER_DOWN);
> -	return ret == -EPROBE_DEFER ? ret : 0;
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9e13e466e72c..ebc548e23ece 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1122,6 +1122,15 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	if (ret)
>  		return ret;
>  
> +	adv7511->cec_clk = devm_clk_get(dev, "cec");
> +	if (IS_ERR(adv7511->cec_clk)) {
> +		ret = PTR_ERR(adv7511->cec_clk);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		adv7511->cec_clk = NULL;
> +	}
> +
>  	ret = adv7511_init_regulators(adv7511);
>  	if (ret) {
>  		dev_err(dev, "failed to init regulators\n");
> @@ -1226,8 +1235,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  
>  err_unregister_cec:
>  	i2c_unregister_device(adv7511->i2c_cec);
> -	if (adv7511->cec_clk)
> -		clk_disable_unprepare(adv7511->cec_clk);
>  err_i2c_unregister_packet:
>  	i2c_unregister_device(adv7511->i2c_packet);
>  err_i2c_unregister_edid:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
