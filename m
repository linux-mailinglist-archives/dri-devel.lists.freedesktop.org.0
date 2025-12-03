Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC80C9D929
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 03:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14B389C29;
	Wed,  3 Dec 2025 02:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zm9LEz3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E79D89C29
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 02:24:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net
 [221.113.100.198])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BB07BB5;
 Wed,  3 Dec 2025 03:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764728556;
 bh=wT2DANF+meWmSjCurwWa1uu27bdlxRsyR8fhhcZwSjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zm9LEz3sW38O4ZicxkXZc0V/Iro4w3X7zJjw8KNFg+2ze6yk/mBYJpq2i9srsjXHe
 S69TuDVchr9BOtbQbMRWe5LGjY5mMH5toCiM33oU4/VIyO84bhyH5lttU7EHlNuiLq
 1ap/LVMcMVzAig95ZgWZDrtJgj5flUTki7OgIUSo=
Date: Wed, 3 Dec 2025 11:24:30 +0900
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
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC
 and !DRM_MODE_FLAG_P.SYNC
Message-ID: <20251203022430.GK8219@pendragon.ideasonboard.com>
References: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
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

Hi Marek,

Thank you for the patch.

On Tue, Dec 02, 2025 at 07:11:06PM +0100, Marek Vasut wrote:
> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
> for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
> previous behavior for maximum compatibility.
> 
> The change of behavior is visible below, consider Vertical mode->flags
> for simplicity sake, although the same applies to Horizontal ones:
> 
> Before 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
> 
> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> 
> After 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
> 
> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
> 
> The "Neither" case behavior is different, because DRM_MODE_FLAG_N[HV]SYNC is
> really not equivalent !DRM_MODE_FLAG_P[HV]SYNC .
> 
> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
> V2: - Update commit message
>     - Use only !P[HV]SYNC
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 9413b76d0bfce..4ef2e3c129ed7 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -492,9 +492,9 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  
>  	/* Configuration for Video Parameters, input is always RGB888 */
>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
>  
>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)

-- 
Regards,

Laurent Pinchart
