Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B12C814E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E32F6E43B;
	Mon, 30 Nov 2020 09:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5746E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:45:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 699E1538;
 Mon, 30 Nov 2020 10:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729536;
 bh=dLflTmOIkLg0RE21TBafla5xpd1cc4ICLoZJddMxEBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESX5O356HWf4r3CNb1rV44NW+wmZrNNP4syyPXLpciJLM2qnORiH+Nvq7awwOI2v8
 4NKbh+1LZTngNVm9VFV3B2IebsigWlZCFJxf5qj5UTTl9U85zg/XXPpaUxHGKd89KR
 jnltaQMJhcFaqJDIN4Ye4vmoV3tgzMzq6H5ejRkE=
Date: Mon, 30 Nov 2020 11:45:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201130094527.GD4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119160134.9244-5-nikhil.nd@ti.com>
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

On Thu, Nov 19, 2020 at 09:31:32PM +0530, Nikhil Devshatwar wrote:
> Remove the old code to iterate over the bridge chain, as this is
> already done by the framework.
> The bridge state should have the negotiated bus format and flags.
> Use these from the bridge's state.
> If the bridge does not support format negotiation, error out
> and fail.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> 
> Notes:
>     changes from v2:
>     * Remove the old code and use the flags from the bridge state
> 
>  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index e278a9c89476..08d5083c5508 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -21,37 +21,29 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
>  {
>  	struct drm_device *ddev = encoder->dev;
>  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
> -	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct drm_bridge_state *bstate;
>  	struct drm_bridge *bridge;
> -	bool bus_flags_set = false;
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> -	/*
> -	 * Take the bus_flags from the first bridge that defines
> -	 * bridge timings, or from the connector's display_info if no
> -	 * bridge defines the timings.
> -	 */
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		if (!bridge->timings)
> -			continue;
> -
> -		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
> -		bus_flags_set = true;
> -		break;
> +	/* Copy the bus_format and flags from the first bridge's state */
> +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> +	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> +	if (bstate) {
> +		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> +		tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;
> +	} else {
> +		dev_err(ddev->dev, "Could not get the bridge state\n");
> +		return -EINVAL;
>  	}

I'd write this

	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
	if (!bstate) {
		dev_err(ddev->dev, "Could not get the bridge state\n");
		return -EINVAL;
	}

	tcrtc_state->bus_format = bstate->input_bus_cfg.format;
	tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;
>  
> -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> -			__func__);
> +	if (tcrtc_state->bus_format == 0 ||
> +	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> +
> +		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
>  		return -EINVAL;
>  	}
>  
> -	// XXX any cleaner way to set bus format and flags?
> -	tcrtc_state->bus_format = di->bus_formats[0];
> -	if (!bus_flags_set)
> -		tcrtc_state->bus_flags = di->bus_flags;
> -
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
