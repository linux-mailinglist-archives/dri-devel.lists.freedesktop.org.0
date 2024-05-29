Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D408D29BE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 03:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A98310E048;
	Wed, 29 May 2024 01:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZc4+3/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179610E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:03:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2096397;
 Wed, 29 May 2024 03:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716944609;
 bh=fgo5a3ZKm77fFhK0LxNJout6rxDethZcR9BxU8V/lOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZc4+3/0e7OORhNh10LdGDxqzoGzSMyVsEdwt7L0p6OvfyIOdpwX1o16KgMA1Qr+k
 K6jHfJHwRFL8pnhyumjCJXzZMDL5hH0IdJ+vlhzD7hzQ+mDaZplv8LAkH8KchLCUex
 HAdsyJEcpSdxBOe6Vl/WweVnOujETWyzaZo3o2eM=
Date: Wed, 29 May 2024 04:03:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <20240529010320.GI1436@pendragon.ideasonboard.com>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
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

Hi Geert,

Thank you for the patch.

On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Armadillo-800-EVA.
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>  	.atomic_disable = shmob_drm_plane_atomic_disable,
>  };
>  
> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> +	.atomic_check = shmob_drm_plane_atomic_check,
> +	.atomic_update = shmob_drm_plane_atomic_update,
> +	.atomic_disable = shmob_drm_plane_atomic_disable,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>  
>  	splane->index = index;
>  
> -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_plane_helper_funcs);

It's not very nice to have to provide different operations for the
primary and overlay planes. The documentation of
drm_fb_dma_get_scanout_buffer() states

 * @plane: DRM primary plane

If the intent is that only primary planes will be used to display the
panic message, shouldn't drm_panic_register() skip overlay planes ? It
would simplify drivers.

>  
>  	return &splane->base;
>  }

-- 
Regards,

Laurent Pinchart
