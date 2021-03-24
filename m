Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD8346F7F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 03:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E7C6E252;
	Wed, 24 Mar 2021 02:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95F6E252
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:27:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94871580;
 Wed, 24 Mar 2021 03:27:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616552873;
 bh=c7+kEyIoAOQeyLvRmP4n95GhCtkq6avlgEpmeNUVx18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ih6A+94tDhI+I/348blbo/dUK/GbIo+4SUix7Ko8e0QSqbrHe5FxtM2V4tqmHEcSS
 lLnU8FwudbI95WD7HXoZrRuAU/ej2ItJWN8o/g23UwsmS2/BBhzv+A/EX4VbCd6xCb
 nQlEoqC8o/t6QtgW4AIhsTLtfYtRUh7NPIkxHDtM=
Date: Wed, 24 Mar 2021 04:27:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/4] drm/ingenic: Register devm action to cleanup
 encoders
Message-ID: <YFqjf0GMiAPL6aBt@pendragon.ideasonboard.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <20210124085552.29146-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210124085552.29146-4-paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Thank you for the patch.

On Sun, Jan 24, 2021 at 08:55:51AM +0000, Paul Cercueil wrote:
> Since the encoders have been devm-allocated, they will be freed way
> before drm_mode_config_cleanup() is called. To avoid use-after-free
> conditions, we then must ensure that drm_encoder_cleanup() is called
> before the encoders are freed.
> 
> v2: Use the new __drmm_simple_encoder_alloc() function
> 
> v3: Use the new drmm_plain_simple_encoder_alloc() macro
> 
> Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
> Cc: <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Notes:
>     Use the V1 of this patch to fix v5.11 and older kernels. This V3 only
>     applies on the current drm-misc-next branch.
> 
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 7bb31fbee29d..b23011c1c5d9 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1014,20 +1014,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>  			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
>  								 DRM_MODE_CONNECTOR_DPI);
>  
> -		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> -		if (!encoder)
> -			return -ENOMEM;
> +		encoder = drmm_plain_simple_encoder_alloc(drm, DRM_MODE_ENCODER_DPI);
> +		if (IS_ERR(encoder)) {
> +			ret = PTR_ERR(encoder);
> +			dev_err(dev, "Failed to init encoder: %d\n", ret);
> +			return ret;
> +		}
>  
>  		encoder->possible_crtcs = 1;
>  
>  		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
>  
> -		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DPI);
> -		if (ret) {
> -			dev_err(dev, "Failed to init encoder: %d\n", ret);
> -			return ret;
> -		}
> -
>  		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>  		if (ret) {
>  			dev_err(dev, "Unable to attach bridge\n");

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
