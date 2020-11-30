Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557F2C8119
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1876E43C;
	Mon, 30 Nov 2020 09:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963606E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:36:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A794F538;
 Mon, 30 Nov 2020 10:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606728968;
 bh=cGaOyd/ORtDbRCEdMagZsxaI1iPZ37RPraGt0jkMy0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WR2s/Ftsm7uL5+sOP6trAee1DIMwonUz61bnejjNkl1NA9HBjKT9t7DGL6tgMpNBu
 oVP34xbJMIhDxDgPlBG5cCY4piFXPERMe9MeFoVfo1+1XBdLnOZxKKlxI0tbnFHXNG
 YYiGalphS1LIgdyyAw2ddZ8PybGEpIDtwCRfBMHg=
Date: Mon, 30 Nov 2020 11:36:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201130093600.GB4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119160134.9244-2-nikhil.nd@ti.com>
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

On Thu, Nov 19, 2020 at 09:31:29PM +0530, Nikhil Devshatwar wrote:
> bus_flags can be specified by a bridge in the timings.
> If the bridge provides it, Override the bus_flags when propagating
> from next bridge.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> 
> Notes:
>     changes from v2:
>     * update comment
>     changes from v1:
>     * Check for timings
>     * Prioritize timings flags over next bridge's flags
> 
>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..13b67fc0dad3 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -975,6 +975,14 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>  	 * duplicate the "dummy propagation" logic.
>  	 */
>  	bridge_state->input_bus_cfg.flags = output_flags;
> +
> +	/*
> +	 * If legacy bus flags are provided in bridge->timings, use those as
> +	 * input flags instead of propagating the output flags.
> +	 */
> +	if (bridge->timings && bridge->timings->input_bus_flags)
> +		bridge_state->input_bus_cfg.flags =
> +			bridge->timings->input_bus_flags;

Hasn't Boris commented in his review of v1 that bus flags should be set
in atomic_check, even when they're static ? We're moving towards
removing timings->input_bus_flags, so this patch goes in the wrong
direction :-S

>  }
>  
>  /**

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
