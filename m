Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4234420E7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 20:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7D89F01;
	Mon,  1 Nov 2021 19:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4D89F01;
 Mon,  1 Nov 2021 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p5j38nD4C6JFRNTsNhzwvjuue/W06jEH6YlXaA0bpeU=; b=jbLZtsyJxM9oj7PQePkpXtK5kb
 mdV8zpactjaZuYEv7XKtLrdyChEfIsddeHZmX+saHhtRh1zMhukiG2cGhihHIl8Z8UjnYpqazgi2j
 G3ePggflvINuBVvN2eCr9T1rW0dtWweZvQsBCe8hWVN+P6rW1XD0lrJ60kTFeQsfD+R5rmFk6AcEp
 g3XRtTlrMWsFCxgx63tAQuWvV5+01JJcrfMq6IgR2tbhufHcGwh2NpJoNFXcIDu/FwonZiE7NG6Az
 nhFopVf6K+QEVodyZG7hO5dCIitxX13/iU3mPU3o2/puUu2cS3cP7L7hutsDVf+nVy6jSZ9VYmlQL
 E0ISl+bQ==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1mhd5b-000303-Us; Mon, 01 Nov 2021 21:35:27 +0200
MIME-Version: 1.0
Date: Mon, 01 Nov 2021 21:35:25 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 24/34] drm/tilcdc: Migrate to aggregate driver
In-Reply-To: <20211026000044.885195-25-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
 <20211026000044.885195-25-swboyd@chromium.org>
Message-ID: <db784574b2cbe57ac0efbe045c9576f3@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Saravana Kannan <saravanak@google.com>, Tomi Valkeinen <tomba@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-26 3:00, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to 
> all
> the component devices that make up the aggregate device.
> 
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks,
Jyri

>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 6b03f89a98d4..d5c6567eec8d 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -531,13 +531,16 @@ static const struct dev_pm_ops tilcdc_pm_ops = {
>  /*
>   * Platform driver:
>   */
> -static int tilcdc_bind(struct device *dev)
> +static int tilcdc_bind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
> +
>  	return tilcdc_init(&tilcdc_driver, dev);
>  }
> 
> -static void tilcdc_unbind(struct device *dev)
> +static void tilcdc_unbind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
>  	struct drm_device *ddev = dev_get_drvdata(dev);
> 
>  	/* Check if a subcomponent has already triggered the unloading. */
> @@ -547,9 +550,13 @@ static void tilcdc_unbind(struct device *dev)
>  	tilcdc_fini(dev_get_drvdata(dev));
>  }
> 
> -static const struct component_master_ops tilcdc_comp_ops = {
> -	.bind = tilcdc_bind,
> -	.unbind = tilcdc_unbind,
> +static struct aggregate_driver tilcdc_aggregate_driver = {
> +	.probe = tilcdc_bind,
> +	.remove = tilcdc_unbind,
> +	.driver = {
> +		.name = "tilcdc_drm",
> +		.owner = THIS_MODULE,
> +	},
>  };
> 
>  static int tilcdc_pdev_probe(struct platform_device *pdev)
> @@ -566,12 +573,9 @@ static int tilcdc_pdev_probe(struct 
> platform_device *pdev)
>  	ret = tilcdc_get_external_components(&pdev->dev, &match);
>  	if (ret < 0)
>  		return ret;
> -	else if (ret == 0)
> +	if (ret == 0)
>  		return tilcdc_init(&tilcdc_driver, &pdev->dev);
> -	else
> -		return component_master_add_with_match(&pdev->dev,
> -						       &tilcdc_comp_ops,
> -						       match);
> +	return component_aggregate_register(&pdev->dev,
> &tilcdc_aggregate_driver, match);
>  }
> 
>  static int tilcdc_pdev_remove(struct platform_device *pdev)
> @@ -581,10 +585,10 @@ static int tilcdc_pdev_remove(struct
> platform_device *pdev)
>  	ret = tilcdc_get_external_components(&pdev->dev, NULL);
>  	if (ret < 0)
>  		return ret;
> -	else if (ret == 0)
> +	if (ret == 0)
>  		tilcdc_fini(platform_get_drvdata(pdev));
>  	else
> -		component_master_del(&pdev->dev, &tilcdc_comp_ops);
> +		component_aggregate_unregister(&pdev->dev, 
> &tilcdc_aggregate_driver);
> 
>  	return 0;
>  }
