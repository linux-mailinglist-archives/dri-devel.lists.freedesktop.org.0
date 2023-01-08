Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794AB661398
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 05:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7123D10E1D8;
	Sun,  8 Jan 2023 04:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C294210E1D8
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 04:45:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C6D36CF;
 Sun,  8 Jan 2023 05:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673153109;
 bh=hZGXNn+V/1UsNheKzNIQwf1rYleNIguWFPLX7Cjw+zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpemC62kmg90wYn43piv1XwqVLLsraBWYTl+X4qEVDIiFhf6mMbuyAaYb5lzZGxUo
 U1P2LBJ3vMuhi6mJyPXK2dLPJEuWHabLsY8ruMC9MtRGd4lgPu1Mz3d9f0fqU63D51
 x50CKkbnbzFHA6ME2bnnDgdkwa02j2UwPc/RCm4Y=
Date: Sun, 8 Jan 2023 06:45:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on
 that SoC
Message-ID: <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
References: <20230108043147.346349-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230108043147.346349-1-pbrobinson@gmail.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Thank you for the patch.

On Sun, Jan 08, 2023 at 04:31:47AM +0000, Peter Robinson wrote:
> There's a few components in the rcar-du drm directory that
> don't make sense to be slectedable if ARCH_RENESAS isn't because

s/slectedable/selectable/

> they are part of those SoCs so add a dependency and add compile
> check to ensure they're still tested.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index b2bddbeca878..4d2bff78a559 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST

As this module isn't useful without the DU driver, wouldn't it be better
to add a dependency on DRM_RCAR_DU, which itself already depends on
ARCH_RENESAS || COMPILE_TEST ? Same for the other two below.

>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_USE_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded LVDS encoders.
> @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_USE_MIPI_DSI
>  	bool "R-Car DU MIPI DSI Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
