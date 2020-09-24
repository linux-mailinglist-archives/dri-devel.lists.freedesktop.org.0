Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F267277A30
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBB6E497;
	Thu, 24 Sep 2020 20:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411D6E497
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:29:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 388BE2007E;
 Thu, 24 Sep 2020 22:29:36 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:29:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] drm/ingenic: Add support for reserved memory
Message-ID: <20200924202934.GK1223313@ravnborg.org>
References: <20200915123818.13272-1-paul@crapouillou.net>
 <20200915123818.13272-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915123818.13272-4-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=Uiir0mAzoKyVEoIzVM8A:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 02:38:18PM +0200, Paul Cercueil wrote:
> Add support for static memory reserved from Device Tree. Since we're
> using GEM buffers backed by CMA, it is interesting to have an option to
> specify the CMA area where the GEM buffers will be allocated.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index aa32660033d2..44b0d029095e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> @@ -827,6 +828,11 @@ static void ingenic_drm_unbind_all(void *d)
>  	component_unbind_all(priv->dev, &priv->drm);
>  }
>  
> +static void __maybe_unused ingenic_drm_release_rmem(void *d)
> +{
> +	of_reserved_mem_device_release(d);
> +}
> +
>  static int ingenic_drm_bind(struct device *dev, bool has_components)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -848,6 +854,19 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>  		return -EINVAL;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
> +		ret = of_reserved_mem_device_init(dev);
> +
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(dev, ret, "Failed to get reserved memory\n");
> +
> +		if (ret != -ENODEV) {
> +			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>  	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
>  				  struct ingenic_drm, drm);
>  	if (IS_ERR(priv))
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
