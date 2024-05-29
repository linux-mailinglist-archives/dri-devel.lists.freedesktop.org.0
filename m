Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060E8D35BD
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 13:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9C8113916;
	Wed, 29 May 2024 11:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YIJgZ2K0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1531D113916
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 11:45:56 +0000 (UTC)
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716983155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69NDQ0vBpwNw2iv9td+lvBVPzBboKDYczx8upcdamkg=;
 b=YIJgZ2K0/w0rwVyPyHCV7/zWP9j400R6BbWF8jrwTMpMW1h2ERQVP4tMBQQnVi2ZikNhld
 eGuD6BRxI5KH/f0iJylu1CvwAdBe8KAVsjW3lpVhRGsCiA4Nyqn37XYurzOr/d1+S7PGqp
 I0U/3TysZDWJMUe8t2sqGOfy4Fjm258=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: kieran.bingham+renesas@ideasonboard.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: jfalempe@redhat.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Message-ID: <206f2a01-a8a0-4066-bec8-1cf7a9f8b7a9@linux.dev>
Date: Wed, 29 May 2024 19:45:47 +0800
MIME-Version: 1.0
Subject: Re: drm: renesas: rcar-du: Add drm_panic support for non-vsp
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/27/24 21:35, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

After all concerns resolved:


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

> ---
> Tested on Koelsch (R-Car M2-W).
> 
> Support for DU variants using the VSP-compositor is more convoluted,
> and left to the DU experts.
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> index e445fac8e0b46c21..c546ab0805d656f6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> @@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
>   	.atomic_update = rcar_du_plane_atomic_update,
>   };
>   
> +static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
> +	.atomic_check = rcar_du_plane_atomic_check,
> +	.atomic_update = rcar_du_plane_atomic_update,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static struct drm_plane_state *
>   rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
>   {
> @@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>   		if (ret < 0)
>   			return ret;
>   
> -		drm_plane_helper_add(&plane->plane,
> -				     &rcar_du_plane_helper_funcs);
> +		if (type == DRM_PLANE_TYPE_PRIMARY)
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_primary_plane_helper_funcs);
> +		else
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_plane_helper_funcs);


Maybe we could do some untangle, but this is not a strong requirement.
Thanks.

Best regards
Sui

>   		drm_plane_create_alpha_property(&plane->plane);
>   


