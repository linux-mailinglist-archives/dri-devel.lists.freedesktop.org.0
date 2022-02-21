Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D734BDADA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4159B10E3BD;
	Mon, 21 Feb 2022 16:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056EA10E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 16:34:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFB9F482;
 Mon, 21 Feb 2022 17:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645461287;
 bh=pH812wBkwmwahgNdQmrpdAadbxYpF5mQrxwGyx+vH/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toOsy0irqhmaBh+Ui4+gshtDANbR/YDMwYwNqtKwkNEh3bGgXZ7Zbc7Bjx+kW4xNK
 2P5/6AOh0FHBCojRddxB6vgl7kusGmiRk0IgxLCJzPvLcO31gpJqC5OmTZAKL9WDbX
 q5WVCex9dfOVsGJwHfXWc9xIQ4G4HAxo9SMraR9Y=
Date: Mon, 21 Feb 2022 18:34:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Rodin <mrodin@de.adit-jv.com>
Subject: Re: [PATCH] drm: rcar-du: do not restart rcar-du groups on gen3
Message-ID: <YhO/HVluRy5g0i4q@pendragon.ideasonboard.com>
References: <1637680811-90510-1-git-send-email-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1637680811-90510-1-git-send-email-mrodin@de.adit-jv.com>
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
Cc: efriedrich@de.adit-jv.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 michael@rodin.online, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Sorry for getting back to you so late, your patch got burried in my
inbox.

On Tue, Nov 23, 2021 at 04:20:11PM +0100, Michael Rodin wrote:
> Restarting a display unit group can cause a visible flicker on the display.
> Particularly when a LVDS display is connected to a Salvator board and an
> HDMI display is (re)connected, then there will be 2 visible flickers on the
> LVDS display:

I can confirm the symptoms.

>  1. during atomic_flush (The need_restart flag is set in this case by
>     rcar_du_vsp_enable.):
>   rcar_du_crtc_atomic_flush
>     rcar_du_crtc_update_planes
>       ...
>       ...
>       /* Restart the group if plane sources have changed. */
>       if (rcrtc->group->need_restart)
>               rcar_du_group_restart(rcrtc->group);
>  2. during atomic_enable:
>   rcar_du_crtc_atomic_enable
>     rcar_du_crtc_start
>       rcar_du_group_start_stop(rcrtc->group, true);
> 
> To avoid flickers in all use cases, do not restart DU groups on the Gen3
> SoCs at all, since it is not required any more.

I've tested this patch, and it breaks the HDMI output on my Salvator-XS
M3N board. My test setup has a panel connected to LVDS0 and an HDMI
monitor connected to HDMI0. The kernel is configured with fbdev
emulation enabled. When the system boots, I get two penguins on the LVDS
panel and the HDMI monitor. I then run

$ modetest -M rcar-du -s HDMI-A-1@60:1024x768@XR24

(you may need to change the CRTC number depending on your setup)

Without this patch, I see a brief flicker on the LVDS panel, and a test
pattern on the HDMI monitor. With this patch, the flicker is gone, but
my HDMI monitor show an error message that complains about unsupported
timings.

The Gen3 documentation still documents many register bits as being
updated on DRES. I don't think we can get rid of group restart like
this.

> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 5 ++++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 2 --
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 8665a1d..ff0a1c8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -250,7 +250,7 @@ void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
>  	 * when the display controller will have to be restarted.
>  	 */
>  	if (start) {
> -		if (rgrp->used_crtcs++ != 0)
> +		if (rgrp->used_crtcs++ != 0 && rgrp->dev->info->gen != 3)
>  			__rcar_du_group_start_stop(rgrp, false);
>  		__rcar_du_group_start_stop(rgrp, true);
>  	} else {
> @@ -263,6 +263,9 @@ void rcar_du_group_restart(struct rcar_du_group *rgrp)
>  {
>  	rgrp->need_restart = false;
>  
> +	if (rgrp->dev->info->gen == 3)
> +		return;
> +
>  	__rcar_du_group_start_stop(rgrp, false);
>  	__rcar_du_group_start_stop(rgrp, true);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index b7fc5b0..a652c06 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -88,8 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>  	 * Ensure that the plane source configuration takes effect by requesting
>  	 * a restart of the group. See rcar_du_plane_atomic_update() for a more
>  	 * detailed explanation.
> -	 *
> -	 * TODO: Check whether this is still needed on Gen3.
>  	 */
>  	crtc->group->need_restart = true;
>  

-- 
Regards,

Laurent Pinchart
