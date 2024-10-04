Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1C99023D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E49110E9D6;
	Fri,  4 Oct 2024 11:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UNQVrijK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25F410E9D0;
 Fri,  4 Oct 2024 11:43:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24E740004;
 Fri,  4 Oct 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QZWiHkDyKURInoFltY84uhrhq994xOqoPrbxVrfp62E=;
 b=UNQVrijK5voQW5PMBC+4zh8Zz3sgTg3GEsky2Dufh+vjcwYEKkSkLcniJ2hvqBqKY7O6ba
 dUeNjJlz1wdlbIld0su1RiyPC8kwTD8eLhT3zaCtQ0Vfm5UEu1Fdo71SWjuCQA/YI1hqT9
 xrma0Wsogp90/Sbn+VlK63n6yR2KiJiZw8HD+FBVS3/NHYm5g8gbn0gPs3hdN2vnggdD8W
 wv1qyChdjjNksOwzPnd1EhM5otjchXDMgcXckTOB0W0FOsxcijtm0i2G8pre7rOGmtM8Li
 FgmSWs++4uD63ulqUsX1pqZdXaj+zFwXZOSce1mIfFJhqjVXqrfh6hnaGhLjFw==
Date: Fri, 4 Oct 2024 13:43:26 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 41/44] drm/colorop: allow non-bypass colorops
Message-ID: <Zv_U3h146lThx__w@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-42-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-42-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 03/10/24 - 16:01, Harry Wentland wrote:
> Not all HW will be able to do bypass on all color
> operations. Introduce an 'allow_bypass' boolean for
> all colorop init functions and only create the BYPASS
> property when it's true.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
>  drivers/gpu/drm/drm_atomic.c                  |  3 +-
>  drivers/gpu/drm/drm_colorop.c                 | 51 ++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
>  include/drm/drm_colorop.h                     | 10 ++--
>  5 files changed, 60 insertions(+), 34 deletions(-)
> 

[...]

> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>  
> -	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
>  	if (ret)
>  		goto cleanup;
>  
> @@ -48,7 +48,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>  
> -	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
>  	if (ret)
>  		goto cleanup;
>  
> @@ -64,7 +64,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>  
> -	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
>  	if (ret)
>  		goto cleanup;
>  
> @@ -80,7 +80,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>  
> -	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
>  	if (ret)
>  		goto cleanup;

You allow the bypass here, but you forgot to add a check in apply_colorop 
to bypass the colorop when this is set. It seems to be the case in the AMD 
driver too. Or maybe you wanted to pass false in "allow_bypass"?

>  
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index d3a00296973d..b8c1c4da3444 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -333,14 +333,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>  }
>  
>  int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
> -			      struct drm_plane *plane, u64 supported_tfs);
> +			      struct drm_plane *plane, u64 supported_tfs,
> +			      bool allow_bypass);
>  int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
>  				  struct drm_plane *plane, uint32_t lut_size,
> -				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
> +				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				  bool allow_bypass);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> -			     struct drm_plane *plane);
> +			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> -			      struct drm_plane *plane);
> +			      struct drm_plane *plane, bool allow_bypass);
>  
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> -- 
> 2.46.2
> 
