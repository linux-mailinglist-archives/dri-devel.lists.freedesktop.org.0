Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9602CEC7C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C76E134;
	Fri,  4 Dec 2020 10:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA44F6E134
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:50:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 678181F45E07;
 Fri,  4 Dec 2020 10:50:33 +0000 (GMT)
Date: Fri, 4 Dec 2020 11:50:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201204115030.04509092@collabora.com>
In-Reply-To: <20201201121830.29704-6-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Dec 2020 17:48:28 +0530
Nikhil Devshatwar <nikhil.nd@ti.com> wrote:

> Remove the old code to iterate over the bridge chain, as this is
> already done by the framework.
> The bridge state should have the negotiated bus format and flags.
> Use these from the bridge's state.
> If the bridge does not support format negotiation, error out
> and fail.

That'd be even better if you implement the bridge interface instead of
the encoder one so we can get rid of the encoder_{helper}_funcs and use
drm_simple_encoder_init().

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> 
> Notes:
>     changes from v3:
>     * cosmetic updates
>     changes from v2:
>     * Remove the old code and use the flags from the bridge state
> 
>  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index e278a9c89476..5deb8102e4d3 100644
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
> +	if (!bstate) {
> +		dev_err(ddev->dev, "Could not get the bridge state\n");
> +		return -EINVAL;
>  	}
>  
> -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> -			__func__);
> +	tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> +	tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;
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
> -	if (!bus_flags_set)
> -		tcrtc_state->bus_flags = di->bus_flags;
> -
>  	return 0;
>  }
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
