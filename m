Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B430D29F80F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2956E91D;
	Thu, 29 Oct 2020 22:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEA66E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:32:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1D4850E;
 Thu, 29 Oct 2020 23:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604010759;
 bh=kGqQIOknp7777DweUncyig9nKtIqE8CEDYOUUeX1xMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyuWFm6qA6hslM5JTDXV4xKHvJOyYo1v1S0/lqjaNfUBA/sl3gzBAyu9buX0ZGxz3
 qt3OyjPJabgsdBfs5+aMMfWVgWypEGpiE7sNtzGqV0g9EJ42wuDOYyvCjMAwGTvW/d
 mQA/Ofz5Mw7GjBtZQ+KLfW45kccK2fGy6aFwpAts=
Date: Fri, 30 Oct 2020 00:31:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH 4/5] drm/bridge: tfp410: Support format negotiation
Message-ID: <20201029223150.GF15024@pendragon.ideasonboard.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-5-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016103917.26838-5-nikhil.nd@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

Thank you for the patch.

On Fri, Oct 16, 2020 at 04:09:16PM +0530, Nikhil Devshatwar wrote:
> With new connector model, tfp410 will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Use helper functions for state management.
> Support one of the two RGB formats as selected from DT bindings.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index ba3fa2a9b8a4..b65e48e080c7 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -204,12 +204,44 @@ static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> +static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      u32 output_fmt,
> +				      unsigned int *num_input_fmts)
> +{
> +	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	/*
> +	 * This bridge does not support media_bus_format conversion
> +	 * Propagate only if supported
> +	 */
> +	if (output_fmt != dvi->bus_format && output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;

On the output side, DVI transmits RGB24 data over three TMDS links (plus
one link for the clock). There's no media bus format that specifically
describe this, but among the possible values for dvi->bus_format
(MEDIA_BUS_FMT_RGB888_2X12_LE and MEDIA_BUS_FMT_RGB888_1X24),
MEDIA_BUS_FMT_RGB888_2X12_LE doesn't make any sense to describe the
output. We probably would need to introduce a specific media bus format
if we wanted to describe this accurately
(MEDIA_BUS_FMT_RGB888_DVI_SINGLE ?), which seems a bit overkill to
support single link DVI. If we take dual link DVI into account, more bit
depths are supported, as well as faster rates by transmitting to RGB888
pixels per clock, so more codes would be needed.

With support for single-link DVI only, we could decide, subsystem-wide,
to always use MEDIA_BUS_FMT_FIXED for DVI. We could also decide to
additional accept MEDIA_BUS_FMT_RGB888_1X24 to describe single-link DVI,
as a convention.

If the goal of the above check is to make the format negotiation fail
when the desired output format can't be supported by the TFP410, then I
would use

	if (output_fmt != dvi->MEDIA_BUS_FMT_RGB888_1X24 &&
	    output_fmt != MEDIA_BUS_FMT_FIXED)
		return NULL;

or simply

	if (output_fmt != MEDIA_BUS_FMT_FIXED)
		return NULL;

depending on what convention we enforce in the subsystem for DVI media
bus formats. I however wonder if this is needed at all, are there cases
where the output could support multiple bus formats and the tfp410
driver would need to make sure that only the 24-bit single link DVI gets
selected ? I suppose there are if we consider dual link DVI, but the DVI
connector driver (drivers/gpu/drm/bridge/display-connector.c) doesn't
report bus formats anyway.

> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = dvi->bus_format;
> +	return input_fmts;
> +}
> +
>  static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>  	.attach		= tfp410_attach,
>  	.detach		= tfp410_detach,
>  	.enable		= tfp410_enable,
>  	.disable	= tfp410_disable,
>  	.mode_valid	= tfp410_mode_valid,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
>  };
>  
>  static const struct drm_bridge_timings tfp410_default_timings = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
