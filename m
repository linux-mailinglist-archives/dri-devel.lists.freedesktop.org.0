Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EDDC41F14
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603F10E0C9;
	Fri,  7 Nov 2025 23:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8UyO+at";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CA210E0C9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 23:23:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi
 [82.203.161.95])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 641187E4;
 Sat,  8 Nov 2025 00:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762557698;
 bh=ckYpq461PfsLtpuZRSdnO1Hpr8pG5yQGPSwPZgGzK/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8UyO+atuJKTkeCoAICUyTPcilTtuIckKBlivjMAwUSQ/Q0C8T0T1Z7aZ8zCk3CaU
 0nt+f6cZ9nDryYzBbkXlr5hOLc+bVRQ9kJNfdhccwGYWgaIVLaHZ5DBJucROqkwjrA
 6ckisRlHFq5A5SNvaHGl/LtUFZz1tfTez0ce2JnA=
Date: Sat, 8 Nov 2025 01:23:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
Message-ID: <20251107232329.GI5558@pendragon.ideasonboard.com>
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.

Could you please explain what broke ? What panel are you using ?

> The previous behavior
> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
> previous behavior for maximum compatibility.
> 
> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 9413b76d0bfce..98bd7f40adbea 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -492,9 +492,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  
>  	/* Configuration for Video Parameters, input is always RGB888 */
>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;

I don't think this restores the previous behaviour. You would need to
write

	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;

> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
> +	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;

Same here.

>  
>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)

-- 
Regards,

Laurent Pinchart
