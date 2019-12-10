Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6311921F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0A6E92C;
	Tue, 10 Dec 2019 20:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49CE6E92C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:34:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 960AF20061;
 Tue, 10 Dec 2019 21:34:20 +0100 (CET)
Date: Tue, 10 Dec 2019 21:34:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 5/5] Revert "drm: atmel-hlcdc: enable sys_clk during
 initalization."
Message-ID: <20191210203419.GB24756@ravnborg.org>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-6-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575984287-26787-6-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XYAwZIGsAAAA:8
 a=vRqltxJg2XVFi9nfVjoA:9 a=CjuIK1q_8ugA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cladiu

On Tue, Dec 10, 2019 at 03:24:47PM +0200, Claudiu Beznea wrote:
> This reverts commit d2c755e66617620b729041c625a6396c81d1231c.
> ("drm: atmel-hlcdc: enable sys_clk during initalization."). With
> commit "drm: atmel-hlcdc: enable clock before configuring timing engine"
> there is no need for this patch. Code is also simpler.
> 
> Cc: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Getting further in the patches tells me you looked at the
patch I referenced in previous mail.
Please squash the two patches together - that would make it
easier to follow what is done.

With the two patches applied sysclk is enabled only in mode_set_nofb()
and atomic_enable(). And disabled in atomic_disable().
This is simpler and we drop the conditionals. Also good.
So the end result looks OK.

	Sam

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 8dc917a1270b..112aa5066cee 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -721,18 +721,10 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>  	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
>  	dev->dev_private = dc;
>  
> -	if (dc->desc->fixed_clksrc) {
> -		ret = clk_prepare_enable(dc->hlcdc->sys_clk);
> -		if (ret) {
> -			dev_err(dev->dev, "failed to enable sys_clk\n");
> -			goto err_destroy_wq;
> -		}
> -	}
> -
>  	ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>  	if (ret) {
>  		dev_err(dev->dev, "failed to enable periph_clk\n");
> -		goto err_sys_clk_disable;
> +		goto err_destroy_wq;
>  	}
>  
>  	pm_runtime_enable(dev->dev);
> @@ -768,9 +760,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>  err_periph_clk_disable:
>  	pm_runtime_disable(dev->dev);
>  	clk_disable_unprepare(dc->hlcdc->periph_clk);
> -err_sys_clk_disable:
> -	if (dc->desc->fixed_clksrc)
> -		clk_disable_unprepare(dc->hlcdc->sys_clk);
>  
>  err_destroy_wq:
>  	destroy_workqueue(dc->wq);
> @@ -795,8 +784,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
>  
>  	pm_runtime_disable(dev->dev);
>  	clk_disable_unprepare(dc->hlcdc->periph_clk);
> -	if (dc->desc->fixed_clksrc)
> -		clk_disable_unprepare(dc->hlcdc->sys_clk);
>  	destroy_workqueue(dc->wq);
>  }
>  
> @@ -910,8 +897,6 @@ static int atmel_hlcdc_dc_drm_suspend(struct device *dev)
>  	regmap_read(regmap, ATMEL_HLCDC_IMR, &dc->suspend.imr);
>  	regmap_write(regmap, ATMEL_HLCDC_IDR, dc->suspend.imr);
>  	clk_disable_unprepare(dc->hlcdc->periph_clk);
> -	if (dc->desc->fixed_clksrc)
> -		clk_disable_unprepare(dc->hlcdc->sys_clk);
>  
>  	return 0;
>  }
> @@ -921,8 +906,6 @@ static int atmel_hlcdc_dc_drm_resume(struct device *dev)
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
>  	struct atmel_hlcdc_dc *dc = drm_dev->dev_private;
>  
> -	if (dc->desc->fixed_clksrc)
> -		clk_prepare_enable(dc->hlcdc->sys_clk);
>  	clk_prepare_enable(dc->hlcdc->periph_clk);
>  	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, dc->suspend.imr);
>  
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
