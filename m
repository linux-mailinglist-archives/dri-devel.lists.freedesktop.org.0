Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CF253AA7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 01:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5D6E430;
	Wed, 26 Aug 2020 23:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C966E430
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:28:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F6AB9CE;
 Thu, 27 Aug 2020 01:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598484491;
 bh=O8ndg0UPIQjM0dz2qQIXbh1Plsmoz6YWLXsdZ4+/8Wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2Iv3jGSAwjcOR9sNWxLmCj/jtx9kNIsLjQn2Ex/itV3s+InIdVUOSceqa4oBX2Hw
 Kf0eSRuzHWjiLsvKktXgwd6SoL+KeiEgGfJIbGhMaMS5Dyehdk74kIpU6xk3YNADXa
 bE5FTEGzLSIudUc5pwDTJlQ+In8lKJvT3z8p93XM=
Date: Thu, 27 Aug 2020 02:27:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/tidss: Add prepare_fb to the plane helper funcs
Message-ID: <20200826232751.GB28543@pendragon.ideasonboard.com>
References: <20200826134409.473554-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826134409.473554-1-tomi.valkeinen@ti.com>
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Gowtham Tammana <g-tammana@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gowtham,

Thank you for the patch.

On Wed, Aug 26, 2020 at 04:44:09PM +0300, Tomi Valkeinen wrote:
> From: Gowtham Tammana <g-tammana@ti.com>
> 
> drm_gem_fb_prepare_fb() extracts fence and attaches to plane state.
> The fence info is needed if implicit fencing is used. Add this as
> prepare_fb function pointer to plane helper funcs.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/tidss/tidss_plane.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 43e72d0b2d84..35067ae674ea 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "tidss_crtc.h"
>  #include "tidss_dispc.h"
> @@ -150,6 +151,7 @@ static void drm_plane_destroy(struct drm_plane *plane)
>  }
>  
>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> +	.prepare_fb = drm_gem_fb_prepare_fb,
>  	.atomic_check = tidss_plane_atomic_check,
>  	.atomic_update = tidss_plane_atomic_update,
>  	.atomic_disable = tidss_plane_atomic_disable,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
