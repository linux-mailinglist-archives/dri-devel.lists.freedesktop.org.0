Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8E321090
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 06:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA4B6E20C;
	Mon, 22 Feb 2021 05:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72F16E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:55:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C9C1344;
 Mon, 22 Feb 2021 06:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1613973305;
 bh=s5Sf/8itHX3j/tX54sgaRdM+CLR9kswsZj0KP+smwyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t21IH+Ye39Y0Mp3BGrGaxYYuREWC1aK8Gts+hbw69RcrQ254uOgUD2o7bKYMKNk3x
 bmfgW+gG8PhMvzQULviLdxHoiJ1PZhTydNWmN8w8AK/4cOH1YVcQZ7W93CAulBkpIj
 3Nm7mkMblnhijbqIkj+LTM+4Qtl/6ky+oCa8LpUQ=
Date: Mon, 22 Feb 2021 07:54:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 5/7] drm: bridge: Queue the bridge chain instead of
 stacking
Message-ID: <YDNHHk+9uIMGKZVF@pendragon.ideasonboard.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
 <20210214194102.126146-6-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214194102.126146-6-jagan@amarulasolutions.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Mon, Feb 15, 2021 at 01:11:00AM +0530, Jagan Teki wrote:
> drm_bridge_attach has stacked the bridge chain, so the bridge
> that gets pushed last can trigger its bridge function pre_enable
> first from drm_atomic_bridge_chain_pre_enable.
> 
> This indeed gives a chance to trigger slave bridge pre_enable
> first without triggering its host bridge pre_enable for the
> usual host to slave device model like DSI host with panel slave.
> 
> For fully enabled bridge drivers, host bridge pre_enable has all
> host related clock, reset, PHY configuration code that needs to
> initialized before sending commands or configuration from a slave
> to communicate its host.
> 
> Queue the bridge chain instead of stacking it so-that the bridges
> that got enqueued first can have a chance to trigger first.

First of all, won't thus break all the drivers that currently rely on
the existing behaviour ?

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - new patch
> 
>  drivers/gpu/drm/drm_bridge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..e75d1a080c55 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -191,9 +191,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	bridge->encoder = encoder;
>  
>  	if (previous)
> -		list_add(&bridge->chain_node, &previous->chain_node);
> +		list_add_tail(&bridge->chain_node, &previous->chain_node);
>  	else
> -		list_add(&bridge->chain_node, &encoder->bridge_chain);
> +		list_add_tail(&bridge->chain_node, &encoder->bridge_chain);

Then, this will create a really weird order, as the list will contain
bridges in the reverse order. Assuming three bridges, A, B and C, which
are connected at the hardware level as follows:

Encoder -> A -> B -> C

the list would contain

Encoder -> C -> B -> A

This isn't intuitive, and if you want to reverse the order in which
bridge operations are called, it would be better to do so in the
operations themselves, for instance replacing
list_for_each_entry_reverse() with list_for_each_entry() in
drm_atomic_bridge_chain_pre_enable(). Still, this will likely break
drivers that depend on the existing order, so I don't think that's an
acceptable solution as-is.

>  
>  	if (bridge->funcs->attach) {
>  		ret = bridge->funcs->attach(bridge, flags);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
