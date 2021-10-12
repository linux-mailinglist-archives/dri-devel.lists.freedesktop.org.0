Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3142AD93
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334866E029;
	Tue, 12 Oct 2021 20:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595BE6E029
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 20:05:35 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id b9e2600b-2b97-11ec-ac3c-0050568cd888;
 Tue, 12 Oct 2021 20:05:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C80D9194C4A;
 Tue, 12 Oct 2021 22:05:20 +0200 (CEST)
Date: Tue, 12 Oct 2021 22:05:31 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: of: Add drm_of_lvds_get_data_mapping
Message-ID: <YWXqi6IbRaK/0FrM@ravnborg.org>
References: <20211011112133.5313-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011112133.5313-1-marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Oct 11, 2021 at 01:21:33PM +0200, Marek Vasut wrote:
> Add helper function to convert DT "data-mapping" property string value
> into media bus format value, and deduplicate the code in panel-lvds.c
> and lvds-codec.c .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Drop bogus semicolon
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 21 ++++++------------
>  drivers/gpu/drm/drm_of.c            | 33 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-lvds.c  | 18 ++++------------
>  include/drm/drm_of.h                |  7 ++++++
>  4 files changed, 51 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index ad460b96c0a3..f991842a161f 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -14,6 +14,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  
>  struct lvds_codec {
> @@ -118,7 +119,6 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *bus_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> -	const char *mapping;
>  	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> @@ -174,22 +174,15 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  			return -ENXIO;
>  		}
>  
> -		ret = of_property_read_string(bus_node, "data-mapping",
> -					      &mapping);
> +		ret = drm_of_lvds_get_data_mapping(bus_node);
>  		of_node_put(bus_node);
> -		if (ret < 0) {
> +		if (ret == -ENODEV) {
>  			dev_warn(dev, "missing 'data-mapping' DT property\n");
> +		} else if (ret) {
> +			dev_err(dev, "invalid 'data-mapping' DT property\n");
> +			return ret;
>  		} else {
> -			if (!strcmp(mapping, "jeida-18")) {
> -				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> -			} else if (!strcmp(mapping, "jeida-24")) {
> -				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> -			} else if (!strcmp(mapping, "vesa-24")) {
> -				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> -			} else {
> -				dev_err(dev, "invalid 'data-mapping' DT property\n");
> -				return -EINVAL;
> -			}
> +			lvds_codec->bus_format = ret;
>  			lvds_codec->bridge.funcs = &funcs_decoder;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 37c34146eea8..a9217bc18e8f 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -402,3 +402,36 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
>  		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
> +
> +/**
> + * drm_of_lvds_get_data_mapping - Get LVDS data mapping
> + * @port: DT port node of the LVDS source or sink
> + *
> + * Convert DT "data-mapping" property string value into media bus format value.
> + *
> + * Return:
> + * MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - data-mapping is "jeida-18"
> + * MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA - data-mapping is "jeida-24"
> + * MEDIA_BUS_FMT_RGB888_1X7X4_SPWG - data-mapping is "vesa-24"
> + * -EINVAL - the "data-mapping" property is unsupported
> + * -ENODEV - the "data-mapping" property is missing
> + */
I tried to look at the output of this - it looks bad.

See the chapter "Return values" here: https://docs.kernel.org/doc-guide/kernel-doc.html
Sorry for not catching this during the first review.

	Sam
