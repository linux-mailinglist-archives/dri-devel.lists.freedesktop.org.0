Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E86727F7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D68110E7F2;
	Wed, 18 Jan 2023 19:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0DF10E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:16:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DF21056;
 Wed, 18 Jan 2023 20:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674069387;
 bh=bKeQLKeTTFxJ85OHKNUDvpsQe5WNpGmEl0k/cSrjlMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPhtbm5YT6RiMFONRnNp+a0pPDkervaulIdbN2ddy3lcfq4xparm5S0LP+I/PmB6f
 6HFgRFkYfud1rV85NEQOhkKk99YzvXxaNmHCQFq6pJb7HWvc3CtWENQW/lkL2hwWGX
 DOX82DkGlueZzBI7JwMb7Eul9TsPMHs9sdaA5D98=
Date: Wed, 18 Jan 2023 21:16:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on
 that SoC
Message-ID: <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
References: <20230108060401.391061-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230108060401.391061-1-pbrobinson@gmail.com>
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

On Sun, Jan 08, 2023 at 06:04:01AM +0000, Peter Robinson wrote:
> There's a few components in the rcar-du drm directory that
> don't make sense to be selectable if DRM_RCAR_DU isn't because
> they are part of the IP block so add a dependency and add
> compile check to ensure they're still tested.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
> 
> v2:
> - typo fix in commit message
> - s/ARCH_RENESAS/DRM_RCAR_DU
> 
>  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index b2bddbeca878..362fb6099e9f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST

How about dropping COMPILE_TEST ? DRM_RCAR_DU itself has

	depends on ARCH_RENESAS || COMPILE_TEST

so if COMPILE_TEST is set we'll be able to test these drivers when
DRM_RCAR_DU is enabled. Same below.

I can update this when taking the patch in my tree, there's no need to
send a v3.

>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_USE_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded LVDS encoders.
> @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_USE_MIPI_DSI
>  	bool "R-Car DU MIPI DSI Encoder Support"
>  	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
>  	default DRM_RCAR_DU
>  	help
>  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
