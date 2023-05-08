Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D756F9DC3
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2624A10E0C9;
	Mon,  8 May 2023 02:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10CA10E0C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:36:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3238E814;
 Mon,  8 May 2023 04:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513413;
 bh=ZeWXo8ydNnQ/SEuU7ErZbF/jRFicIzvB6hsedNkcwB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+TeAYDMuzfa+m/kc1W2yPJbbNiIsr2yRi97482Er1JLqKOoWgp7YLDwQmaFevNhw
 ILDunrQeBD0nSTgO1iM0zJupbsDuHk74zfZ/5eFVOw1HZmqE7CdRP1KkGWAKWGrXNg
 sUssa8RtbJ803S08E+DqOrVJTcJDfWRhRkZqdfSA=
Date: Mon, 8 May 2023 05:37:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 14/53] drm/bridge: synopsys: Convert to platform remove
 callback returning void
Message-ID: <20230508023711.GC23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-15-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-15-u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:37PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the synopsis bridge drivers from always returning zero
> in the remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++----
>  4 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index 4efb62bcdb63..67b8d17a722a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -584,13 +584,11 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int snd_dw_hdmi_remove(struct platform_device *pdev)
> +static void snd_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
>  
>  	snd_card_free(dw->card);
> -
> -	return 0;
>  }
>  
>  #if defined(CONFIG_PM_SLEEP) && defined(IS_NOT_BROKEN)
> @@ -625,7 +623,7 @@ static SIMPLE_DEV_PM_OPS(snd_dw_hdmi_pm, snd_dw_hdmi_suspend,
>  
>  static struct platform_driver snd_dw_hdmi_driver = {
>  	.probe	= snd_dw_hdmi_probe,
> -	.remove	= snd_dw_hdmi_remove,
> +	.remove_new = snd_dw_hdmi_remove,
>  	.driver	= {
>  		.name = DRIVER_NAME,
>  		.pm = PM_OPS,
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index c8f44bcb298a..9389ce526eb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -296,19 +296,17 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dw_hdmi_cec_remove(struct platform_device *pdev)
> +static void dw_hdmi_cec_remove(struct platform_device *pdev)
>  {
>  	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
>  
>  	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
>  	cec_unregister_adapter(cec->adap);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver dw_hdmi_cec_driver = {
>  	.probe	= dw_hdmi_cec_probe,
> -	.remove	= dw_hdmi_cec_remove,
> +	.remove_new = dw_hdmi_cec_remove,
>  	.driver = {
>  		.name = "dw-hdmi-cec",
>  	},
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> index 557966239677..423762da2ab4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> @@ -172,18 +172,16 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(dw->audio_pdev);
>  }
>  
> -static int snd_dw_hdmi_remove(struct platform_device *pdev)
> +static void snd_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
>  
>  	platform_device_unregister(dw->audio_pdev);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver snd_dw_hdmi_driver = {
>  	.probe	= snd_dw_hdmi_probe,
> -	.remove	= snd_dw_hdmi_remove,
> +	.remove_new = snd_dw_hdmi_remove,
>  	.driver	= {
>  		.name = DRIVER_NAME,
>  	},
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index d751820c6da6..26c187d20d97 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -216,18 +216,16 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int snd_dw_hdmi_remove(struct platform_device *pdev)
> +static void snd_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct platform_device *platform = dev_get_drvdata(&pdev->dev);
>  
>  	platform_device_unregister(platform);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver snd_dw_hdmi_driver = {
>  	.probe	= snd_dw_hdmi_probe,
> -	.remove	= snd_dw_hdmi_remove,
> +	.remove_new = snd_dw_hdmi_remove,
>  	.driver	= {
>  		.name = DRIVER_NAME,
>  	},
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
