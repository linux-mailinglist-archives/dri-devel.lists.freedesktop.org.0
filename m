Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CDB29F884
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631226E91F;
	Thu, 29 Oct 2020 22:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588646E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:40:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4353150E;
 Thu, 29 Oct 2020 23:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604011244;
 bh=UzwCqj3Lw33BWbdRyKIUhn0t+pMPDvgvQQaePyjZN2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F6iQ4Fi+pUi3jRf/YjHENY/Kn0SIdgptQUffPAKF1gatNRVUmQIPLlAfboL/Ejxyk
 Xm4zgXzdPNXsi6guv8iKFgVGrK4lGHSwlXznF/l6x6ijCKPJ/XsUnZ8Rggqtj83dE7
 8pgBEJNYNuQj7zD3xZQwue+BYmZlHatciXgZr/G4=
Date: Fri, 30 Oct 2020 00:39:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH 5/5] drm/bridge: mhdp8564: Support format negotiation
Message-ID: <20201029223955.GG15024@pendragon.ideasonboard.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-6-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016103917.26838-6-nikhil.nd@ti.com>
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

On Fri, Oct 16, 2020 at 04:09:17PM +0530, Nikhil Devshatwar wrote:
> With new connector model, mhdp bridge will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Support a single format for input.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..230f6e28f82f 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2078,6 +2078,34 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
>  	return &cdns_mhdp_state->base;
>  }
>  
> +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      u32 output_fmt,
> +				      unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;

Display port supports quite a few different formats. See my reply to
4/5, except it's worse in the DP case :-) Especially given that multiple
displays need to be taken into account. I'm afraid we need to decide how
to map media bus formats to different DP use cases, possibly adding new
bus formats as part of this exercise, and then revisit this patch.

> +
> +	*num_input_fmts = 0;
> +
> +	/*
> +	 * This bridge does not support media_bus_format conversion
> +	 * Propagate only if supported
> +	 */
> +	if (output_fmt != default_bus_format && output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = default_bus_format;
> +	return input_fmts;
> +}
> +
>  static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state,
> @@ -2142,6 +2170,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.atomic_duplicate_state = cdns_mhdp_bridge_atomic_duplicate_state,
>  	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
>  	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
> +	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
>  	.detect = cdns_mhdp_bridge_detect,
>  	.get_edid = cdns_mhdp_bridge_get_edid,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
