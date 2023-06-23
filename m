Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5B73BAE9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AFB10E0A9;
	Fri, 23 Jun 2023 14:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BDB10E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:58:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D768FD5F;
 Fri, 23 Jun 2023 16:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687532283;
 bh=HrdXUDw9AKd9rLNjuYJdpn9trFqz0nsG31l0bn5OKO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZp7Vh0h6FGcZ/T8AZ7LwzFq4uBuI4Y9qphZYCkhCCLQxteuSPsfnHWX9XcJ14zHe
 yHKdgyVxFDEDxy0uSJ10KfCxEENmcF+wHhTLNkEbM1ttFFZoT3xThmfxcShIrAR6M2
 pnXKdg47dO10wQO9By9hZ1GY2EdQZguNQSMhTJkw=
Date: Fri, 23 Jun 2023 17:58:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 04/39] drm: renesas: shmobile: Fix ARGB32 overlay format
 typo
Message-ID: <20230623145838.GA17477@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <7cc1dea4833e6fb9b30aa35f801f14338578dfb1.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7cc1dea4833e6fb9b30aa35f801f14338578dfb1.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:16AM +0200, Geert Uytterhoeven wrote:
> When configurating a CHn Source Image Format Register (LDBBSIFR), one
> should use the corresponding LDBBSIFR_RPKF_* definition for overlay
> planes, not the DDFR_PKF_* definition for the primary plane.
> 
> Fortunately both definitions resolve to the same value, so this bug did
> not cause any harm.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

With the typo in the commit message fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 0e34573c3cb3d032..7e49e2873da1bb6f 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -94,10 +94,10 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
>  		break;
>  	case DRM_FORMAT_ARGB8888:
> -		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
> +		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
>  		break;
>  	case DRM_FORMAT_XRGB8888:
> -		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
> +		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
>  		break;
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV21:

-- 
Regards,

Laurent Pinchart
