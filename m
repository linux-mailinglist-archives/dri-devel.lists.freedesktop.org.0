Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E71A1CF6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EAD6E993;
	Wed,  8 Apr 2020 07:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9689DC2;
 Wed,  8 Apr 2020 07:57:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C6F9820029;
 Wed,  8 Apr 2020 09:57:51 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:57:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 32/44] drm/mcde: Use devm_drm_dev_alloc
Message-ID: <20200408075750.GN14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-33-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-33-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=8So5QykSJbI84FPh_KwA:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:58:16PM +0200, Daniel Vetter wrote:
> Already using devm_drm_dev_init, so very simple replacment.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

But one comment below.

> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index 88cc6b4a7a64..bdb525e3c5d7 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -307,24 +307,16 @@ static int mcde_probe(struct platform_device *pdev)
>  	int ret;
>  	int i;
>  
> -	mcde = kzalloc(sizeof(*mcde), GFP_KERNEL);
> -	if (!mcde)
> -		return -ENOMEM;
> -	mcde->dev = dev;
> -
> -	ret = devm_drm_dev_init(dev, &mcde->drm, &mcde_drm_driver);
> -	if (ret) {
> -		kfree(mcde);
> -		return ret;
> -	}
> +	mcde = devm_drm_dev_alloc(dev, &mcde_drm_driver, struct mcde, drm);
> +	if (IS_ERR(mcde))
> +		return PTR_ERR(mcde);
>  	drm = &mcde->drm;
>  	drm->dev_private = mcde;
> -	drmm_add_final_kfree(drm, mcde);
> +	mcde->dev = dev;
>  	platform_set_drvdata(pdev, drm);
>  
>  	/* Enable continuous updates: this is what Linux' framebuffer expects */
>  	mcde->oneshot_mode = false;
> -	drm->dev_private = mcde;
It is assinged twice - but this change really belongs in next patch.

>  
>  	/* First obtain and turn on the main power */
>  	mcde->epod = devm_regulator_get(dev, "epod");
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
