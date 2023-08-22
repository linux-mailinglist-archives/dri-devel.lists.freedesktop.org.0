Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694EA78406B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3110E333;
	Tue, 22 Aug 2023 12:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C1610E333;
 Tue, 22 Aug 2023 12:11:16 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BCDB7660719F;
 Tue, 22 Aug 2023 13:11:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692706274;
 bh=4PgVBAWNFKHM/4/FMf01r6GpvSfyQ3NniBnjpOYGyZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fSC+8jLzde/apQtUPw425oNrZSFWpPP/xLuG97gi+oVoKRIvu7As3/c0+8Uyo4W1b
 lbCaw5yH8hWEE/mfFz4Wd06LpacgIhMpVXptphqRg8ZUiZNdcjBgI+1oXXxE2r6e7I
 p+sd9LdxRv0C0UHPEj7uNdvNMXmjNxa2NYPQGUsSdLhvyAEiMxDBUv+UXJAL9jbecV
 mn0vctpGtjBxpymHSbiO8/OrFamFA7p+YrrruinzXofGjvl3K+o5gXBsTZ2j/1bEn5
 kYNuXcUyYNmLpvMVWalTGxFxjyvr6pxO96HNGHWO/b5aBz/Pop1uumFOV8r/kEYgkB
 fkY1Kcprql0pg==
Date: Tue, 22 Aug 2023 15:11:10 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230822151110.3107b745.pekka.paalanen@collabora.com>
In-Reply-To: <20230810160314.48225-20-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023 15:02:59 -0100
Melissa Wen <mwen@igalia.com> wrote:

> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
> regarging CRTC color properties to manage plane and CRTC color
> correction combinations.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
>  1 file changed, 41 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 68e9f2c62f2e..74eb02655d96 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	return 0;
>  }
>  
> -/**
> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
> - * @crtc: amdgpu_dm crtc state
> - * @dc_plane_state: target DC surface
> - *
> - * Update the underlying dc_stream_state's input transfer function (ITF) in
> - * preparation for hardware commit. The transfer function used depends on
> - * the preparation done on the stream for color management.
> - *
> - * Returns:
> - * 0 on success. -ENOMEM if mem allocation fails.
> - */
> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> -				      struct dc_plane_state *dc_plane_state)
> +static int
> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> +			     struct dc_plane_state *dc_plane_state)
>  {
>  	const struct drm_color_lut *degamma_lut;
>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  						 &degamma_size);
>  		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
>  
> -		dc_plane_state->in_transfer_func->type =
> -			TF_TYPE_DISTRIBUTED_POINTS;
> +		dc_plane_state->in_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>  
>  		/*
>  		 * This case isn't fully correct, but also fairly
> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				   degamma_lut, degamma_size);
>  		if (r)
>  			return r;
> -	} else if (crtc->cm_is_degamma_srgb) {
> +	} else {
>  		/*
>  		 * For legacy gamma support we need the regamma input
>  		 * in linear space. Assume that the input is sRGB.
> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  
>  		if (tf != TRANSFER_FUNCTION_SRGB &&
>  		    !mod_color_calculate_degamma_params(NULL,
> -			    dc_plane_state->in_transfer_func, NULL, false))
> +							dc_plane_state->in_transfer_func,
> +							NULL, false))
>  			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
> + * @crtc: amdgpu_dm crtc state
> + * @dc_plane_state: target DC surface
> + *
> + * Update the underlying dc_stream_state's input transfer function (ITF) in
> + * preparation for hardware commit. The transfer function used depends on
> + * the preparation done on the stream for color management.
> + *
> + * Returns:
> + * 0 on success. -ENOMEM if mem allocation fails.
> + */
> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> +				      struct dc_plane_state *dc_plane_state)
> +{
> +	bool has_crtc_cm_degamma;
> +	int ret;
> +
> +	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
> +	if (has_crtc_cm_degamma){
> +		/* AMD HW doesn't have post-blending degamma caps. When DRM
> +		 * CRTC atomic degamma is set, we maps it to DPP degamma block
> +		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
> +		 * linearize (implicit degamma) from sRGB/BT709 according to
> +		 * the input space.

Uhh, you can't just move degamma before blending if KMS userspace
wants it after blending. That would be incorrect behaviour. If you
can't implement it correctly, reject it.

I hope that magical unexpected linearization is not done with atomic,
either.

Or maybe this is all a lost cause, and only the new color-op pipeline
UAPI will actually work across drivers.


Thanks,
pq

> +		 */
> +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> +		if (ret)
> +			return ret;
>  	} else {
>  		/* ...Otherwise we can just bypass the DGM block. */
>  		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;

