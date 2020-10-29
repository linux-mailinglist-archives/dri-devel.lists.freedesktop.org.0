Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468429F8C0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281726E924;
	Thu, 29 Oct 2020 22:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F36E924
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:58:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C8A50E;
 Thu, 29 Oct 2020 23:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604012299;
 bh=PTVUL1WXwVs1ktyUsDKxyKEeNoRKT/lKQOuh7jfstVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJK78Jeia/rlPvAqB7+8nODfvpJLbxvRm7MHLdHobi8i3OQpICZY5EMD+WI4GSLWn
 oUtreubCh/Ld12XuF7/DUvXWoE4wipCzIYonsPPFrnUTYFvWJM+VpFuLcuuJaG25ZQ
 IfRy1T/oEDoKVDkmhJLd4hKVhPobdK4l1QraBOwg=
Date: Fri, 30 Oct 2020 00:57:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH 2/5] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201029225730.GK15024@pendragon.ideasonboard.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-3-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016103917.26838-3-nikhil.nd@ti.com>
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

On Fri, Oct 16, 2020 at 04:09:14PM +0530, Nikhil Devshatwar wrote:
> When there is a chain of bridges attached to the encoder,
> the bus_format should be ideally set from the input format of the
> first bridge in the chain.
> 
> Use the bridge state to get the negotiated bus_format.
> If the bridge does not support format negotiation, error out
> and fail.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_encoder.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index e278a9c89476..ae7f134754b7 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -22,6 +22,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
>  	struct drm_device *ddev = encoder->dev;
>  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
>  	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct drm_bridge_state *bstate;
>  	struct drm_bridge *bridge;
>  	bool bus_flags_set = false;
>  
> @@ -41,14 +42,19 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
>  		break;
>  	}
>  
> -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> -			__func__);
> +	/* Copy the bus_format from the input_bus_format of first bridge */
> +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> +	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> +	if (bstate)
> +		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> +
> +	if (tcrtc_state->bus_format == 0 ||
> +	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> +
> +		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
>  		return -EINVAL;
>  	}
>  
> -	// XXX any cleaner way to set bus format and flags?
> -	tcrtc_state->bus_format = di->bus_formats[0];
>  	if (!bus_flags_set)
>  		tcrtc_state->bus_flags = di->bus_flags;

Shouldn't the flags also be retrieved from the bridge state ?

>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
