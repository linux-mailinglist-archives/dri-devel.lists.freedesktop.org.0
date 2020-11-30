Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADF2C812F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281F989DFB;
	Mon, 30 Nov 2020 09:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68B89DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:40:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC92E538;
 Mon, 30 Nov 2020 10:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729220;
 bh=QhE8bY/XAvrPmuqhcFmUQf00kPLnRe+Pxcgy6t3BWEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qplpye5wK9z8fig/N5p9qYCTJ1mCknd9wJZHqqIsq3NFPSea8gxlWxiaGTyYf4Qy5
 L+BKNZmBz1hUYud//EE4zhXngNQTtsqEwkzYZMc53coN1pJdR2pjrwr/dfbPgtzGAf
 fmR2h7tDQxRyHf7sOxrFKTvf62F+MLS+f//vq+0I=
Date: Mon, 30 Nov 2020 11:40:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v3 2/6] drm/bridge: tfp410: Support format negotiation
 hooks
Message-ID: <20201130094012.GC4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-3-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119160134.9244-3-nikhil.nd@ti.com>
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
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

Thank you for the patch.

On Thu, Nov 19, 2020 at 09:31:30PM +0530, Nikhil Devshatwar wrote:
> With new connector model, tfp410 will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Use helper functions for state management.
> 
> Output format is expected to be MEDIA_BUS_FMT_FIXED
> Input format is the one selected by the bridge from DT properties.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Notes:
>     changes from v1:
>     * Use only MEDIA_BUS_FMT_FIXED for output
> 
>  drivers/gpu/drm/bridge/ti-tfp410.c | 33 ++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index ba3fa2a9b8a4..3def9acba86b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -204,12 +204,45 @@ static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
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
> +	 * Output of tfp410 is DVI, which is TMDS.
> +	 * There is no media format defined for this.
> +	 * Using MEDIA_BUS_FMT_FIXED for now.
> +	 */
> +	if (output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;
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
