Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54680235771
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1751189D8A;
	Sun,  2 Aug 2020 14:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A389D8A
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 14:26:08 +0000 (UTC)
Received: from earth.universe (dyndsl-037-138-184-041.ewe-ip-backbone.de
 [37.138.184.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A368F208C7;
 Sun,  2 Aug 2020 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596378367;
 bh=O1iXKRu7K0G1r3XxmedkO3b/Xi/37eJcuiLIvxIzx9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSa73/X/c5sxVfPtWcpkPTfmVMkyn423TdLypzcyX2+Gh2c0VI0S0ZWuqKNJG+JhU
 rclBSt15x0guFVu9Rul9OVdieiNglIjneuJLfjcyPezLKQDdzNl5qVNyQQ1o0XsdDl
 lv+bDfUxxyjX83ZFdJg9htGLerxLD54kTR2DueOc=
Received: by earth.universe (Postfix, from userid 1000)
 id 8E1F63C0B87; Sun,  2 Aug 2020 16:26:05 +0200 (CEST)
Date: Sun, 2 Aug 2020 16:26:05 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 21/22] drm/omap: display: Backlight update
Message-ID: <20200802142605.ih6hwhnjxnqhaflt@earth.universe>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-22-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-22-sam@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Zheng Bin <zhengbin13@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Aug 02, 2020 at 01:06:35PM +0200, Sam Ravnborg wrote:
> - Introduce backlight_{enable/disable)
> - Use get/set methods for backlight_properties
> - Drop redundant get_brightness() implementation
>   The default implementation return the current brightness value
> - Use macro for backlight initialization
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Zheng Bin <zhengbin13@huawei.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 35 ++++---------------
>  1 file changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 3484b5d4a91c..433e240896b3 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -110,15 +110,10 @@ static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>  	else
>  		return;
>  
> -	if (enable) {
> -		backlight->props.fb_blank = FB_BLANK_UNBLANK;
> -		backlight->props.state = ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
> -		backlight->props.power = FB_BLANK_UNBLANK;
> -	} else {
> -		backlight->props.fb_blank = FB_BLANK_NORMAL;
> -		backlight->props.power = FB_BLANK_POWERDOWN;
> -		backlight->props.state |= BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
> -	}
> +	if (enable)
> +		backlight_enable(backlight);
> +	else
> +		backlight_disable(backlight);
>  
>  	backlight_update_status(backlight);

backlight_update_status() is already called by backlight_enable/disable.

-- Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
