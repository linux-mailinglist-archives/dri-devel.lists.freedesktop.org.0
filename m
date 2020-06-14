Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8091F878F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 09:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52056E15B;
	Sun, 14 Jun 2020 07:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02DE6E15B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 07:44:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 965248051D;
 Sun, 14 Jun 2020 09:44:42 +0200 (CEST)
Date: Sun, 14 Jun 2020 09:44:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm: mcde: Fix display initialization problem
Message-ID: <20200614074441.GA220677@ravnborg.org>
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200613223027.4189309-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=Zvhud1mh3OEFsl6IILoA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Sun, Jun 14, 2020 at 12:30:26AM +0200, Linus Walleij wrote:
> The following bug appeared in the MCDE driver/display
> initialization during the recent merge window.
> 
> First the place we call drm_fbdev_generic_setup() in the
> wrong place: this needs to be called AFTER calling
> drm_dev_register() else we get this splat:
> 
>  ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
> mcde a0350000.mcde: Device has not been registered.
> Modules linked in:
> Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
> [<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
> [<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
> [<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
> [<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
> [<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
> [<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
> [<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
> (...)
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Yup, this is the right way to do it.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

One small thing to consider, see below. But for another patch.

> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index 84f3e2dbd77b..80082d6dce3a 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -209,7 +209,6 @@ static int mcde_modeset_init(struct drm_device *drm)
>  
>  	drm_mode_config_reset(drm);
>  	drm_kms_helper_poll_init(drm);
> -	drm_fbdev_generic_setup(drm, 32);
>  
>  	return 0;
>  }
> @@ -264,6 +263,8 @@ static int mcde_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto unbind;
>  
> +	drm_fbdev_generic_setup(drm, 32);
Consider using mode_config.preferred_depth, then you can pass 0 here.


> +
>  	return 0;
>  
>  unbind:
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
