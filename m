Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5917BB3F8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 11:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F100310E4D4;
	Fri,  6 Oct 2023 09:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DC510E4D4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696583403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cr92X8RrcZBDuxHPt3OLE6tLbx3yBjB901o1qrpUbkA=;
 b=Cypej0Sx2Up0+aHUfrBkwk9N1lTwXoju526ySsv4ublJ6YDeH8tPngwbWY9l6VBjjEyzwL
 fqIviQP5/ObFONdU+ZBbjUW5Qv1JWD8haRM4oBJlfsssfse6hNzMrU2WzcIkz9+GaS6BlW
 PCW+qkbxkC0IL/50pnCEP7rwFYfzCR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-a66rrW3WPKCNJUsE7-vomw-1; Fri, 06 Oct 2023 05:09:52 -0400
X-MC-Unique: a66rrW3WPKCNJUsE7-vomw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4065d52a83aso12552235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 02:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696583391; x=1697188191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cr92X8RrcZBDuxHPt3OLE6tLbx3yBjB901o1qrpUbkA=;
 b=B+/51MeUPVW6CSNIXpPyTj03iL1gXsi4XYhuqZV9WFk6QHMLuNFWv+382JVplhRBqP
 OWgN9mrqjVElYPuSQLBQ3Q8sh1cYb1At7xgkosyaDr7A0Szkdc0idlwMJONrkvLyv0q9
 3VKbpO9Pj/FKJnZmG66FJzmP8r0SfRu2B0kd4AVgZW4hmOOy1sxeXhh3p0DqhLz2xUUl
 HSwwUUzddf1JrHiD8P0TQiLaaFV8UYrfiJTO+mk094DakAyIj6vB8u2/f7bPecgdwyVY
 EZ/dutCmx3vD0Z3kxZ6HMrjlvThKDRUyyXCwPSdXSE/iaWrv4dCgZFgjwIpqlMR2VJwH
 7wYQ==
X-Gm-Message-State: AOJu0YwRDl7p0+mSzZEkWCrBU8sjj/5+i8iEw7bNoVIBC1/yx6O7qjYS
 XIquR6vRfsipykNJa96fAH0c5o0gL66Hu4XNzg+zUwEvWBXEaDA0UyKIbO/zjTq3uHD/37Fu4G0
 hUTeioB8doVYNoA7GFRiXB9jx8LvN
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id
 15-20020a05600c22cf00b0040145425eddmr7115119wmg.34.1696583391272; 
 Fri, 06 Oct 2023 02:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXLY3L3IdQjrjCNjOXebkXEZrmULAEKmDz3vgFG+mYypBOht2L1/CFKwQyIKCOgyjukMYJiQ==
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id
 15-20020a05600c22cf00b0040145425eddmr7115092wmg.34.1696583390821; 
 Fri, 06 Oct 2023 02:09:50 -0700 (PDT)
Received: from toolbox ([2001:9e8:89bc:cf00:7c0e:f203:f32:6eaf])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1c7919000000b00405c7591b09sm3270792wme.35.2023.10.06.02.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 02:09:50 -0700 (PDT)
Date: Fri, 6 Oct 2023 11:09:48 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v4 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Message-ID: <20231006090948.GA400742@toolbox>
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-10-mwen@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20231005171527.203657-10-mwen@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 04:15:04PM -0100, Melissa Wen wrote:
> Add 3D LUT property for plane color transformations using a 3D lookup
> table. 3D LUT allows for highly accurate and complex color
> transformations and is suitable to adjust the balance between color
> channels. It's also more complex to manage and require more
> computational resources.
> 
> Since a 3D LUT has a limited number of entries in each dimension we want
> to use them in an optimal fashion. This means using the 3D LUT in a
> colorspace that is optimized for human vision, such as sRGB, PQ, or
> another non-linear space. Therefore, userpace may need one 1D LUT
> (shaper) before it to delinearize content and another 1D LUT after 3D
> LUT (blend) to linearize content again for blending. The next patches
> add these 1D LUTs to the plane color mgmt pipeline.
> 
> v3:
> - improve commit message about 3D LUT
> - describe the 3D LUT entries and size (Harry)
> 
> v4:
> - advertise 3D LUT max size as the size of a single-dimension
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 +++++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
>  4 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 62044d41da75..f7adaa52c23f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,24 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @plane_lut3d_property: Plane property for color transformation using
> +	 * a 3D LUT (pre-blending), a three-dimensional array where each
> +	 * element is an RGB triplet. Each dimension has a size of the cubed
> +	 * root of lut3d_size. The array contains samples from the approximated

This should be "Each dimension has a size of lut3d_size" now.

> +	 * function. On AMD, values between samples are estimated by
> +	 * tetrahedral interpolation. The array is accessed with three indices,
> +	 * one for each input dimension (color channel), blue being the
> +	 * outermost dimension, red the innermost.
> +	 */
> +	struct drm_property *plane_lut3d_property;
> +	/**
> +	 * @plane_degamma_lut_size_property: Plane property to define the max
> +	 * size of 3D LUT as supported by the driver (read-only). The max size
> +	 * is the max size of one dimension and, therefore, the max number of
> +	 * entries for 3D LUT array is the 3D LUT size cubed;
> +	 */
> +	struct drm_property *plane_lut3d_size_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index bb2ce843369d..7a2350c62cf1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -784,6 +784,11 @@ struct dm_plane_state {
>  	 * TF is needed for any subsequent linear-to-non-linear transforms.
>  	 */
>  	__u64 hdr_mult;
> +	/**
> +	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
>  };
>  
>  struct dm_crtc_state {
> @@ -869,6 +874,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  
>  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  
> +/* 3D LUT max size is 17x17x17 (4913 entries) */
> +#define MAX_COLOR_3DLUT_SIZE 17
> +#define MAX_COLOR_3DLUT_BITDEPTH 12
> +/* 1D LUT size */
>  #define MAX_COLOR_LUT_ENTRIES 4096
>  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index caf49a044ab4..011f2f9ec890 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -230,6 +230,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_hdr_mult_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_LUT3D", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_size_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index ae64d4b73360..068798ffdd56 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1359,6 +1359,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_get(dm_plane_state->lut3d);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> @@ -1432,6 +1434,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_put(dm_plane_state->lut3d);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1462,6 +1466,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  	drm_object_attach_property(&plane->base,
>  				   dm->adev->mode_info.plane_hdr_mult_property,
>  				   AMDGPU_HDR_MULT_DEFAULT);
> +
> +	if (dpp_color_caps.hw_3d_lut) {
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_size_property,
> +					   MAX_COLOR_3DLUT_SIZE);
> +	}
>  }
>  
>  static int
> @@ -1493,6 +1505,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->hdr_mult = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_lut3d_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->lut3d,
> +							val, -1,
> +							sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1520,6 +1540,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = dm_plane_state->degamma_tf;
>  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>  		*val = dm_plane_state->hdr_mult;
> +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> +		*val = (dm_plane_state->lut3d) ?
> +			dm_plane_state->lut3d->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}
> -- 
> 2.40.1
> 

