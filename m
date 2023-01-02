Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB065B28B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 14:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A05D10E30E;
	Mon,  2 Jan 2023 13:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6312C10E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 13:13:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76AA87C5;
 Mon,  2 Jan 2023 14:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672665209;
 bh=C72eokuJdJg837vqIQrKAfORNK1FxmCUZvrxVAG3ioM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjNwmIX1ohtz2oy++Akw7OGFgz09ZocQ42jzUl+Eg+Q7HmuFUS7KzlTRRjS9owfog
 8Oi07yHPkS2HPkwpm2spTYRXr4jF2YgndnLaKSqIMVeLOHPWNwQEyi8KVGbspDyQs5
 2vtrCryepOuoIqkmgo4aQF1A3Fg/U7A9XfWpGY7A=
Date: Mon, 2 Jan 2023 15:13:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH v10 3/5] drm/bridge: cdns-dsi: Move to drm/bridge/cadence
Message-ID: <Y7LYdgmjPqMoQd8y@pendragon.ideasonboard.com>
References: <20230102100942.1828-1-r-ravikumar@ti.com>
 <20230102100942.1828-4-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230102100942.1828-4-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, a-bhatia1@ti.com, narmstrong@baylibre.com,
 airlied@linux.ie, tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, jpawar@cadence.com, lee.jones@linaro.org,
 vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rahul,

Thank you for the patch.

On Mon, Jan 02, 2023 at 03:39:40PM +0530, Rahul T R wrote:
> Move the cadence dsi bridge under drm/bridge/cadence
> directory, to prepare for adding j721e wrapper
> support
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                        | 11 -----------
>  drivers/gpu/drm/bridge/Makefile                       |  1 -
>  drivers/gpu/drm/bridge/cadence/Kconfig                | 11 +++++++++++
>  drivers/gpu/drm/bridge/cadence/Makefile               |  2 ++
>  .../bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c}    |  0
>  5 files changed, 13 insertions(+), 12 deletions(-)
>  rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (100%)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 57946d80b02d..8b2226f72b24 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -15,17 +15,6 @@ config DRM_PANEL_BRIDGE
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> -config DRM_CDNS_DSI
> -	tristate "Cadence DPI/DSI bridge"
> -	select DRM_KMS_HELPER
> -	select DRM_MIPI_DSI
> -	select DRM_PANEL_BRIDGE
> -	select GENERIC_PHY_MIPI_DPHY
> -	depends on OF
> -	help
> -	  Support Cadence DPI to DSI bridge. This is an internal
> -	  bridge and is meant to be directly embedded in a SoC.
> -
>  config DRM_CHIPONE_ICN6211
>  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 1884803c6860..52f6e8b4a821 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> index 1d06182bea71..8fbb46c66094 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -25,3 +25,14 @@ config DRM_CDNS_MHDP8546_J721E
>  	  initializes the J721E Display Port and sets up the
>  	  clock and data muxes.
>  endif
> +
> +config DRM_CDNS_DSI
> +	tristate "Cadence DPI/DSI bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> +	select GENERIC_PHY_MIPI_DPHY
> +	depends on OF
> +	help
> +	  Support Cadence DPI to DSI bridge. This is an internal
> +	  bridge and is meant to be directly embedded in a SoC.

Could you please move this to the top to keep entries sorted
alphabetically ?

> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> index 4d2db8df1bc6..e3d8e9a40784 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
>  cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> +obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> +cdns-dsi-y := cdns-dsi-core.o

Same here.

Conditionally-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

with this addressed (which means you can add my Reviewed-by in the next
version).

> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> similarity index 100%
> rename from drivers/gpu/drm/bridge/cdns-dsi.c
> rename to drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c

-- 
Regards,

Laurent Pinchart
