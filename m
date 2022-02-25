Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD934C745B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185DD10E57B;
	Mon, 28 Feb 2022 17:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3F5010E4F3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 17:44:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 264311042;
 Mon, 28 Feb 2022 09:44:34 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0596F3F7F5;
 Mon, 28 Feb 2022 09:44:34 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 9CFC2680B93; Fri, 25 Feb 2022 14:01:01 +0000 (GMT)
Date: Fri, 25 Feb 2022 14:01:01 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 19/22] drm/komeda: plane: Remove redundant color
 encoding and range initialisation
Message-ID: <YhjhHfhhxr59cUFJ@e110455-lin.cambridge.arm.com>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-20-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221095918.18763-20-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:59:15AM +0100, Maxime Ripard wrote:
> The komeda KMS driver will call drm_plane_create_color_properties() with
> a default encoding and range values of BT601 and Limited Range,
> respectively.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in komeda_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Neat splitting of changes even if the removed lines were consecutive, thanks!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> index 383bb2039bd4..541949f2d44a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -143,11 +143,8 @@ static void komeda_plane_reset(struct drm_plane *plane)
>  	plane->state = NULL;
>  
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (state) {
> +	if (state)
>  		__drm_atomic_helper_plane_reset(plane, &state->base);
> -		state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
> -		state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
> -	}
>  }
>  
>  static struct drm_plane_state *
> -- 
> 2.35.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
