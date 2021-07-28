Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC33D88DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95886E4A2;
	Wed, 28 Jul 2021 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2CF6E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:31:13 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ccfc103d-ef75-11eb-9082-0050568c148b;
 Wed, 28 Jul 2021 07:31:19 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 66DB5194B99;
 Wed, 28 Jul 2021 09:31:33 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:31:10 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 14/14] drm/kmb: Enable support for fbcon (framebuffer
 console)
Message-ID: <YQEHvqSrvySUTCaE@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-14-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-14-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Tue, Jul 27, 2021 at 05:31:26PM -0700, Anitha Chrisanthus wrote:
> From: Edmund Dea <edmund.j.dea@intel.com>
> 
> Enable support for fbcon (framebuffer console).
> The user can initialize fbcon by loading kmb-drm with the parameter
> console=1.

I do not see the poit of the boot parameter??
Why is it needed here but not in other drivers?

> 
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index d0de1db03493..d39d004f513a 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
> @@ -15,6 +16,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_irq.h>
> @@ -25,7 +27,13 @@
>  #include "kmb_dsi.h"
>  #include "kmb_regs.h"
>  
> -static int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> +/* Module Parameters */
> +static bool console;
> +module_param(console, bool, 0400);
> +MODULE_PARM_DESC(console,
> +		 "Enable framebuffer console support (0=disable [default], 1=on)");
> +
> +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
kmb_display_clk_enable lost a "static" - it will result in a warning if
you build with W=1

>  {
>  	int ret = 0;
>  
> @@ -546,6 +554,9 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_register;
>  
> +	if (console)
> +		drm_fbdev_generic_setup(&kmb->drm, 32);
> +
>  	return 0;
>  
>   err_register:
> -- 
> 2.25.1
