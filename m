Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E12245692
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB91389CF9;
	Sun, 16 Aug 2020 07:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A289CF9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:46:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4582380528;
 Sun, 16 Aug 2020 09:46:32 +0200 (CEST)
Date: Sun, 16 Aug 2020 09:46:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 8/8] drm: mxsfb: Add support for the bus-width DT property
Message-ID: <20200816074630.GI1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-9-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8
 a=tAAkY-M6p667TXfKU-sA:9 a=tuZZfSq4q83BLy7T:21 a=b_aeklcsRL_HFftP:21
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Thu, Aug 13, 2020 at 04:29:10AM +0300, Laurent Pinchart wrote:
> A new bus-width DT property has been introduced in the bindings to allow
> overriding the bus width. Support it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

We already reads the bus-width in following files in drm:
atmel-hlcdc/atmel_hlcdc_output.c bridge/ti-tfp410.c

So this calls for a common helper to do this like:

int drm_of_bus_fmt(const struct device_node *ep)
{
}

This helper could then read bus-width, data-shift (if relevant)
and return the relevant bus format.

I can see that bridge/ti-tfp410.c assumes 12 equals
MEDIA_BUS_FMT_RGB888_2X12_LE where as mxsfb assumes 12 is
MEDIA_BUS_FMT_RGB444_1X12.
I do not know why neither how to handle this difference.
Maybe this is something to do with DVI as this is what tfp410
seems to support.

	Sam


> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 8c549c3931af..fab3aae8cf73 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -95,10 +95,36 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->drm;
>  	struct drm_connector_list_iter iter;
> +	struct device_node *ep;
>  	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> +	u32 bus_width = 0;
>  	int ret;
>  
> +	ep = of_graph_get_endpoint_by_regs(drm->dev->of_node, 0, 0);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	of_property_read_u32(ep, "bus-width", &bus_width);
> +	of_node_put(ep);
> +
> +	switch (bus_width) {
> +	case 16:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	case 18:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	case 24:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	case 0:
> +		break;
> +	default:
> +		DRM_DEV_ERROR(drm->dev, "Invalid bus-width %u", bus_width);
> +		return -ENODEV;
> +	}
> +
>  	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
>  					  &bridge);
>  	if (ret)
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index 399d23e91ed1..c4f7a8a0c891 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -32,6 +32,8 @@ struct mxsfb_drm_private {
>  	struct clk			*clk_axi;
>  	struct clk			*clk_disp_axi;
>  
> +	u32				bus_format;
> +
>  	struct drm_device		*drm;
>  	struct {
>  		struct drm_plane	primary;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index b721b8b262ce..6d512f346918 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -50,11 +50,15 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->drm;
>  	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
> -	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	u32 bus_format;
>  	u32 ctrl, ctrl1;
>  
> -	if (mxsfb->connector->display_info.num_bus_formats)
> +	if (mxsfb->bus_format)
> +		bus_format = mxsfb->bus_format;
> +	else if (mxsfb->connector->display_info.num_bus_formats)
>  		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +	else
> +		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
>  			     bus_format);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
