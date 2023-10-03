Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2278B7B6E38
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886110E2CB;
	Tue,  3 Oct 2023 16:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAAA10E044;
 Tue,  3 Oct 2023 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mC5KvqAUUt1HmxrwWBpCZ6+i79R9/zHwAdCBb4tj81Q=; b=j04w112eJ4csoDr1uhW3QWmV1T
 0BnUewlQ8jvxF6ZkfQEi1/+GV7RK2auoXXzDx0TmztMJ1g5KXGlxdCN/+zobmZWX/ZwqTma2eUr7X
 WDD2YFpZhVnSyBtKYhz2TbzSMi0KhhsB35qjsfME1C7YATVNWUqrO/lmIBhpA55mvOelQKQE7rA7i
 stia7j81yWCoBsofSSRa/ldW7WTlOPBlZ9lBBo1GEFOf/wV+Wz/uZTKxnpw818w3/VLSormUDAnwI
 51iDc4N1mbqqSj5V80iVWoRB143/fyhqFMuF9GQrWJwVQXpReC0gVesWcMAQIh88IYcsb19iD14oc
 Jh/k68Ew==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qni5y-00BKVd-Sz; Tue, 03 Oct 2023 18:18:03 +0200
Date: Tue, 3 Oct 2023 15:17:40 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Message-ID: <20231003161725.newwn5dthlk5ycqk@mail.igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-10-mwen@igalia.com>
 <728a979a-7f0a-4a90-a7d5-1c8b1c3ab1d3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <728a979a-7f0a-4a90-a7d5-1c8b1c3ab1d3@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/27, Harry Wentland wrote:
> 
> 
> On 2023-09-25 15:49, Melissa Wen wrote:
> > Add 3D LUT property for plane color transformations using a 3D lookup
> > table. 3D LUT allows for highly accurate and complex color
> > transformations and is suitable to adjust the balance between color
> > channels. It's also more complex to manage and require more
> > computational resources. Since a 3D LUT has a limited number of entries
> > in each dimension we want to use them in an optimal fashion. This means
> > using the 3D LUT in a colorspace that is optimized for human vision,
> > such as sRGB, PQ, or another non-linear space. Therefore, userpace may
> > need one 1D LUT (shaper) before it to delinearize content and another 1D
> > LUT after 3D LUT (blend) to linearize content again for blending. The
> > next patches add these 1D LUTs to the plane color mgmt pipeline.
> > 
> > v3:
> > - improve commit message about 3D LUT
> > - describe the 3D LUT entries and size (Harry)
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 17 ++++++++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > index 66bae0eed80c..1b5f25989f7f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -363,6 +363,23 @@ struct amdgpu_mode_info {
> >  	 * @plane_hdr_mult_property:
> >  	 */
> >  	struct drm_property *plane_hdr_mult_property;
> > +	/**
> > +	 * @plane_lut3d_property: Plane property for color transformation using
> > +	 * a 3D LUT (pre-blending), a three-dimensional array where each
> > +	 * element is an RGB triplet. Each dimension has a size of the cubed
> > +	 * root of lut3d_size. The array contains samples from the approximated
> > +	 * function. On AMD, values between samples are estimated by
> > +	 * tetrahedral interpolation. The array is accessed with three indices,
> > +	 * one for each input dimension (color channel), blue being the
> > +	 * outermost dimension, red the innermost.
> > +	 */
> > +	struct drm_property *plane_lut3d_property;
> > +	/**
> > +	 * @plane_degamma_lut_size_property: Plane property to define the max
> > +	 * size of 3D LUT as supported by the driver (read-only). The max size
> > +	 * is the max size of one dimension cubed.
> > +	 */
> 
> I've been thinking about this some more and don't particulary
> like that we're reporting the size as the dimension cubed, e.g.,
> 4913 (17^3) instead of 17. This works for an AMD private API
> (and I'm okay with keeping it as-is if changing it is a lot of
> effort at this point) but in a generic API it would be a source
> of bugs or undefined behavior if a driver mistakenly reported
> a size that doesn't have an even cubed root.
> 
> Reporting the size of a single dimension (e.g., 17 in the case
> of the current AMD driver) would be clearer.
> 
> Could we still change that?

I understand your points, makes sense. I'll send a version that fits the
single-dimension size.

Thanks for the suggestion.

Melissa

> 
> Harry
> 
> 
> > +	struct drm_property *plane_lut3d_size_property;
> >  };
> >  
> >  #define AMDGPU_MAX_BL_LEVEL 0xFF
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 7ca594c7dfbe..dbd36fc24eca 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -773,6 +773,11 @@ struct dm_plane_state {
> >  	 * S31.32 sign-magnitude.
> >  	 */
> >  	__u64 hdr_mult;
> > +	/**
> > +	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> > +	 * &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *lut3d;
> >  };
> >  
> >  struct dm_crtc_state {
> > @@ -858,6 +863,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >  
> >  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
> >  
> > +/* 3D LUT max size is 17x17x17 */
> > +#define MAX_COLOR_3DLUT_ENTRIES 4913
> > +#define MAX_COLOR_3DLUT_BITDEPTH 12
> > +/* 1D LUT size */
> >  #define MAX_COLOR_LUT_ENTRIES 4096
> >  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
> >  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index f274909c0c7e..e2f3f2099cac 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -207,6 +207,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_hdr_mult_property = prop;
> >  
> > +	prop = drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_PLANE_LUT3D", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_lut3d_property = prop;
> > +
> > +	prop = drm_property_create_range(adev_to_drm(adev),
> > +					 DRM_MODE_PROP_IMMUTABLE,
> > +					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_lut3d_size_property = prop;
> > +
> >  	return 0;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index b66da6b76f5c..56f9109ecf60 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1361,6 +1361,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_get(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->lut3d)
> > +		drm_property_blob_get(dm_plane_state->lut3d);
> >  
> >  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> >  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> > @@ -1434,6 +1436,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_put(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->lut3d)
> > +		drm_property_blob_put(dm_plane_state->lut3d);
> >  
> >  	if (dm_plane_state->dc_state)
> >  		dc_plane_state_release(dm_plane_state->dc_state);
> > @@ -1464,6 +1468,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> >  	drm_object_attach_property(&plane->base,
> >  				   dm->adev->mode_info.plane_hdr_mult_property,
> >  				   AMDGPU_HDR_MULT_DEFAULT);
> > +
> > +	if (dpp_color_caps.hw_3d_lut) {
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_lut3d_property, 0);
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_lut3d_size_property,
> > +					   MAX_COLOR_3DLUT_ENTRIES);
> > +	}
> >  }
> >  
> >  static int
> > @@ -1495,6 +1507,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
> >  			dm_plane_state->hdr_mult = val;
> >  			dm_plane_state->base.color_mgmt_changed = 1;
> >  		}
> > +	} else if (property == adev->mode_info.plane_lut3d_property) {
> > +		ret = drm_property_replace_blob_from_id(plane->dev,
> > +							&dm_plane_state->lut3d,
> > +							val, -1,
> > +							sizeof(struct drm_color_lut),
> > +							&replaced);
> > +		dm_plane_state->base.color_mgmt_changed |= replaced;
> > +		return ret;
> >  	} else {
> >  		drm_dbg_atomic(plane->dev,
> >  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> > @@ -1522,6 +1542,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
> >  		*val = dm_plane_state->degamma_tf;
> >  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> >  		*val = dm_plane_state->hdr_mult;
> > +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> > +		*val = (dm_plane_state->lut3d) ?
> > +			dm_plane_state->lut3d->base.id : 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> 
