Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091274AEB1D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3E410E3E4;
	Wed,  9 Feb 2022 07:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB110E3E4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:34:00 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E22D093;
 Wed,  9 Feb 2022 08:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644392039;
 bh=EPeZNo5lc0lgYfLiuhEIM6GbhGUlZiWrjfVD1bROpqQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wnHp68d7uLgqnYJ0iTnbX1goJPabGrT0WnCCvESZT0b9IWSXZW2x6VgJR1gR9ZPQ7
 /kTZl2czkUWRQYyozE5EEiI89/S4g3+xQPfhHmA5A6OqHcgDKxtorwOjDXE4QYTQVl
 23pqEYOVfZ3cnl1/PMdG2EDmXD8RvIGCpEwxku+Q=
Message-ID: <79913701-7411-6c33-e833-d34eb118557b@ideasonboard.com>
Date: Wed, 9 Feb 2022 09:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 23/23] drm/omap: plane: Remove redundant color encoding
 and range initialisation
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-24-maxime@cerno.tech>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220207163515.1038648-24-maxime@cerno.tech>
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
> The omap KMS driver will call drm_plane_create_color_properties() with
> a default encoding and range values of BT601 and Full Range,
> respectively.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in omap_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index d96bc929072a..b83d91ec030a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -403,7 +403,6 @@ void omap_plane_install_properties(struct drm_plane *plane,
>   
>   static void omap_plane_reset(struct drm_plane *plane)
>   {
> -	struct omap_plane *omap_plane = to_omap_plane(plane);
>   	struct omap_plane_state *omap_state;
>   
>   	if (plane->state)
> @@ -414,8 +413,6 @@ static void omap_plane_reset(struct drm_plane *plane)
>   		return;
>   
>   	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
> -	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
> -	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
>   }
>   
>   static struct drm_plane_state *

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
