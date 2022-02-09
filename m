Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714034AEB1C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAF10E3DB;
	Wed,  9 Feb 2022 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB010E3DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:33:33 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ABCC93;
 Wed,  9 Feb 2022 08:33:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644392012;
 bh=o/z2KhKCn2IJ7ICppXi0+Dc5j/8PPU9JYGCy5x/ffjI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g7ca6IkDa4P7vhdE2vsf47XnNpQe5mVeUvxGMC20MDldNYcDXC3gf3zSLVbnp9cLc
 2fUJaVnLk1/dQbpVEvAQUzUb1N33LoxMl6NsDZxtE/KHFKyob+4wrhtOwVjhs2vTLd
 tIkyreelgC3pNugIGwtNXT79B1mkjLIu5SKzWKZM=
Message-ID: <a1d9a65d-9118-96c0-33f8-13e6b7e27329@ideasonboard.com>
Date: Wed, 9 Feb 2022 09:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/23] drm/omap: plane: Remove redundant zpos
 initialisation
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-16-maxime@cerno.tech>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220207163515.1038648-16-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2022 18:35, Maxime Ripard wrote:
> The omap KMS driver will call drm_plane_create_zpos_property() with an
> init value of the plane index and the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in omap_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index e67baf9a942c..d96bc929072a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -414,13 +414,6 @@ static void omap_plane_reset(struct drm_plane *plane)
>   		return;
>   
>   	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
> -
> -	/*
> -	 * Set the zpos default depending on whether we are a primary or overlay
> -	 * plane.
> -	 */
> -	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
> -			   ? 0 : omap_plane->id;
>   	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
>   	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
>   }

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
