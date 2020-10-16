Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703CA290D30
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DE56EE99;
	Fri, 16 Oct 2020 21:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B085B6EE99
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:19:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 428CE8062D;
 Fri, 16 Oct 2020 23:19:45 +0200 (CEST)
Date: Fri, 16 Oct 2020 23:19:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] omapfb: connector-hdmi: simplify the return
 expression of hdmic_connect
Message-ID: <20201016211943.GG1496366@ravnborg.org>
References: <20200921131051.92661-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921131051.92661-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=no2T8IuB39rNVZpCtwQA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qinglang Miao

On Mon, Sep 21, 2020 at 09:10:51PM +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

I dropped the changes to gpio-cs5535.c when I applied this patch to
drm-misc-next. It looks like an accident that it was included here.

	Sam

> ---
>  drivers/gpio/gpio-cs5535.c                                 | 6 +-----
>  drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c | 7 +------
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
> index 53b24e3ae..57b9ddffd 100644
> --- a/drivers/gpio/gpio-cs5535.c
> +++ b/drivers/gpio/gpio-cs5535.c
> @@ -345,12 +345,8 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
>  				mask_orig, mask);
>  
>  	/* finally, register with the generic GPIO API */
> -	err = devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
> +	return devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
>  				     &cs5535_gpio_chip);
> -	if (err)
> -		return err;
> -
> -	return 0;
>  }
>  
>  static struct platform_driver cs5535_gpio_driver = {
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> index 49551afbd..670b9c6eb 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> @@ -50,18 +50,13 @@ static int hdmic_connect(struct omap_dss_device *dssdev)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *in = ddata->in;
> -	int r;
>  
>  	dev_dbg(ddata->dev, "connect\n");
>  
>  	if (omapdss_device_is_connected(dssdev))
>  		return 0;
>  
> -	r = in->ops.hdmi->connect(in, dssdev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return in->ops.hdmi->connect(in, dssdev);
>  }
>  
>  static void hdmic_disconnect(struct omap_dss_device *dssdev)
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
