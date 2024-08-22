Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F695B7E8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB38210E0BA;
	Thu, 22 Aug 2024 14:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CB10E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:05:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886C3DA7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:06:00 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 409703F66E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:05:34 -0700 (PDT)
Date: Thu, 22 Aug 2024 15:05:27 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "hongchi.peng" <hongchi.peng@siengine.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: komeda: Fix an issue related to normalized zpos
Message-ID: <ZsdFp5Nq25q8rrVP@e110455-lin.cambridge.arm.com>
References: <20240821085613.5408-1-hongchi.peng@siengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240821085613.5408-1-hongchi.peng@siengine.com>
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

Hi Hongchi,

On Wed, Aug 21, 2024 at 04:56:13PM +0800, hongchi.peng wrote:
> We use komeda_crtc_normalize_zpos to normalize zpos of affected planes
> to their blending zorder in CU. If there's only one slave plane in
> affected planes and its layer_split property is enabled, order++ for
> its split layer, so that when calculating the normalized_zpos
> of master planes, the split layer of the slave plane is included, but
> the max_slave_zorder does not include the split layer and keep zero
> because there's only one slave plane in affacted planes, although we
> actually use two slave layers in this commit.
> 
> In most cases, this bug does not result in a commit failure, but assume
> the following situation:
>     slave_layer 0: zpos = 0, layer split enabled, normalized_zpos =
>     0;(use slave_layer 2 as its split layer)
>     master_layer 0: zpos = 2, layer_split enabled, normalized_zpos =
>     2;(use master_layer 2 as its split layer)
>     master_layer 1: zpos = 4, normalized_zpos = 4;
>     master_layer 3: zpos = 5, normalized_zpos = 5;
>     kcrtc_st->max_slave_zorder = 0;
> When we use master_layer 3 as a input of CU in function
> komeda_compiz_set_input and check it with function
> komeda_component_check_input, the parameter idx is equal to
> normailzed_zpos minus max_slave_zorder, the value of idx is 5
> and is euqal to CU's max_active_inputs, so that
> komeda_component_check_input returns a -EINVAL value.

Yes, indeed, you have found a bug in the calculations when layer_split is set.
But I was also looking through the code trying to find where layer_split gets
set and I could not find it, do you have some extra patches?

> 
> To fix the bug described above, when calculating the max_slave_zorder
> with the layer_split enabled, count the split layer in this calculation
> directly.
> 
> Signed-off-by: hongchi.peng <hongchi.peng@siengine.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index fe46b0ebefea..b3db828284e4 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -159,7 +159,7 @@ static int komeda_crtc_normalize_zpos(struct drm_crtc *crtc,
>  	struct drm_plane_state *plane_st;
>  	struct drm_plane *plane;
>  	struct list_head zorder_list;
> -	int order = 0, err;
> +	int order = 0, slave_zpos, err;

Also, the build bot has already flagged it, your patch needs some improvements.
slave_zpos needs to be u32 if it's going to be compared against max_slave_zorder.

Best regards,
Liviu

>  
>  	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
>  			 crtc->base.id, crtc->name);
> @@ -199,10 +199,13 @@ static int komeda_crtc_normalize_zpos(struct drm_crtc *crtc,
>  				 plane_st->zpos, plane_st->normalized_zpos);
>  
>  		/* calculate max slave zorder */
> -		if (has_bit(drm_plane_index(plane), kcrtc->slave_planes))
> +		if (has_bit(drm_plane_index(plane), kcrtc->slave_planes)) {
> +			slave_zpos = plane_st->normalized_zpos;
> +			if (to_kplane_st(plane_st)->layer_split)
> +				slave_zpos++;
>  			kcrtc_st->max_slave_zorder =
> -				max(plane_st->normalized_zpos,
> -				    kcrtc_st->max_slave_zorder);
> +				max(slave_zpos, kcrtc_st->max_slave_zorder);
> +		}
>  	}
>  
>  	crtc_st->zpos_changed = true;
> -- 
> 2.34.1
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
