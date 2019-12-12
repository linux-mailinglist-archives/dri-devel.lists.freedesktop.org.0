Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6F11C9EE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 10:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590FD6E063;
	Thu, 12 Dec 2019 09:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733046E063
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 09:54:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C54872007F;
 Thu, 12 Dec 2019 10:54:17 +0100 (CET)
Date: Thu, 12 Dec 2019 10:54:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jerry Han <jerry.han.hq@gmail.com>
Subject: Re: [PATCH] drm/panel: boe-himax8279d: use drm_panel backlight support
Message-ID: <20191212095416.GB32429@ravnborg.org>
References: <20191212022614.14728-1-jerry.han.hq@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212022614.14728-1-jerry.han.hq@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=9elUfqcO1cmAmzWN_H0A:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=26CFN5KYESCqVWovzqLp:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jerry.

On Thu, Dec 12, 2019 at 10:26:14AM +0800, Jerry Han wrote:
> Use the backlight support in drm_panel to simplify the driver
> 
> Signed-off-by: Jerry Han <jerry.han.hq@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-boe-himax8279d.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> index 65ea6f673cdb..3a6ee2069158 100644
> --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> +++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> @@ -6,7 +6,6 @@
>   *
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -47,7 +46,6 @@ struct panel_info {
>  	struct mipi_dsi_device *link;
>  	const struct panel_desc *desc;
>  
> -	struct backlight_device *backlight;
>  	struct gpio_desc *enable_gpio;
>  	struct gpio_desc *pp33_gpio;
>  	struct gpio_desc *pp18_gpio;
> @@ -93,8 +91,6 @@ static int boe_panel_disable(struct drm_panel *panel)
>  	if (!pinfo->enabled)
>  		return 0;
>  
> -	backlight_disable(pinfo->backlight);
> -
>  	err = mipi_dsi_dcs_set_display_off(pinfo->link);
>  	if (err < 0) {
>  		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
> @@ -218,13 +214,6 @@ static int boe_panel_enable(struct drm_panel *panel)
>  		return ret;
>  	}
>  
> -	ret = backlight_enable(pinfo->backlight);
> -	if (ret) {
> -		DRM_DEV_ERROR(panel->drm->dev,
> -			      "Failed to enable backlight %d\n", ret);
> -		return ret;
> -	}
> -
>  	pinfo->enabled = true;
>  
>  	return 0;
> @@ -899,9 +888,9 @@ static int panel_add(struct panel_info *pinfo)
>  		return ret;
>  	}
>  
> -	pinfo->backlight = devm_of_find_backlight(dev);
> -	if (IS_ERR(pinfo->backlight))
> -		return PTR_ERR(pinfo->backlight);
> +	ret = drm_panel_of_backlight(&pinfo->base);
> +	if (ret)
> +		return ret;
>  
>  	drm_panel_init(&pinfo->base, dev, &panel_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);

The patch looks good.
But we still need the original patch fixed so it can build.

Please resend a v11 that can build.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
