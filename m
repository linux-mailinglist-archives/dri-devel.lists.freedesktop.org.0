Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A5798875
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C3E10E8CD;
	Fri,  8 Sep 2023 14:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4260910E8B8;
 Fri,  8 Sep 2023 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MF2zceLuFhGGeLdiSJkuoIjBOsmAXygPHChJYW8TspY=; b=KWgLE6ehESwJAH9XveQ8pSjWx3
 yrXw9pphvt9wCY3U8vOyZRuTqf6NeAItMradqzkIYdFWaF1N0FGxZMqP41ZnjbpBkGcXQ8bL+sNrP
 ayKH/oGXnKOiFJHgludyxTL0BlBNhedsClrpyOlejN6qTcjRLRVcpZMRoB/QOrn6zxpCIjp6lURUS
 Go4tceDrXTAjEVIWjmgHmstftZxdOup9El2LuqVVWgpGf3BSP4+AhM+WRmFHIg2OU7TfkB7MIrKBk
 3NDDLExrCVqeAG2gMjLR94gHjEO7hkZGbG863HkhBW0WpTr7Dsr2vwpnYt5rtir0evirRbSthIHqj
 Ae7f13Pg==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qecME-001P1W-Ak; Fri, 08 Sep 2023 16:21:13 +0200
Date: Fri, 8 Sep 2023 13:21:07 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 11/34] drm/amd/display: add plane shaper LUT and TF
 driver-specific properties
Message-ID: <20230908142107.ihlfqp7kybbjddiq@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-12-mwen@igalia.com>
 <26a6d3ed-472a-4c70-a6ce-29f3ea7c81f5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a6d3ed-472a-4c70-a6ce-29f3ea7c81f5@amd.com>
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
 Alex Hung <alex.hung@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06, Harry Wentland wrote:
> On 2023-08-10 12:02, Melissa Wen wrote:
> > On AMD HW, 3D LUT always assumes a preceding shaper 1D LUT used for
> > delinearizing and/or normalizing the color space before applying a 3D
> > LUT. Add pre-defined transfer function to enable delinearizing content
> > with or without shaper LUT, where AMD color module calculates the
> > resulted shaper curve. We apply an inverse EOTF to go from linear values
> > to encoded values. If we are already in a non-linear space and/or don't
> > need to normalize values, we can bypass shaper LUT with a linear
> > transfer function that is also the default TF value.
> > 
> 
> I think the color module will combine the TF and the custom 1D LUT
> into the LUT that's actually programmed. We should spell out this
> behavior in the comments below and in the patch description as it's
> important for a userspace application to know.
> 
> The same applies to all other TF+LUT blocks.

yeah, you're right, I'll describe it better.

Thanks,

Melissa

> 
> Harry
> 
> > v2:
> > - squash commits for shaper LUT and shaper TF
> > - define inverse EOTF as supported shaper TFs
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 16 ++++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 +++++++++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 32 +++++++++++++++++++
> >  4 files changed, 88 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > index 730a88236501..4fb164204ee6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -363,6 +363,22 @@ struct amdgpu_mode_info {
> >  	 * @plane_hdr_mult_property:
> >  	 */
> >  	struct drm_property *plane_hdr_mult_property;
> > +	/**
> > +	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> > +	 * that converts color content before 3D LUT.
> > +	 */
> > +	struct drm_property *plane_shaper_lut_property;
> > +	/**
> > +	 * @shaper_lut_size_property: Plane property for the size of
> > +	 * pre-blending shaper LUT as supported by the driver (read-only).
> > +	 */
> > +	struct drm_property *plane_shaper_lut_size_property;
> > +	/**
> > +	 * @plane_shaper_tf_property: Plane property to set a predefined
> > +	 * transfer function for pre-blending shaper (before applying 3D LUT)
> > +	 * with or without LUT.
> > +	 */
> > +	struct drm_property *plane_shaper_tf_property;
> >  	/**
> >  	 * @plane_lut3d_property: Plane property for gamma correction using a
> >  	 * 3D LUT (pre-blending).
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index deea90212e31..6b6c2980f0af 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -769,6 +769,17 @@ struct dm_plane_state {
> >  	 * S31.32 sign-magnitude.
> >  	 */
> >  	__u64 hdr_mult;
> > +	/**
> > +	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
> > +	 * array of &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *shaper_lut;
> > +	/**
> > +	 * @shaper_tf:
> > +	 *
> > +	 * Predefined transfer function to delinearize color space.
> > +	 */
> > +	enum amdgpu_transfer_function shaper_tf;
> >  	/**
> >  	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> >  	 * &struct drm_color_lut.
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 7e6d4df99a0c..fbcee717bf0a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -151,6 +151,14 @@ static const u32 amdgpu_eotf =
> >  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
> >  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
> >  
> > +static const u32 amdgpu_inv_eotf =
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF);
> > +
> >  static struct drm_property *
> >  amdgpu_create_tf_property(struct drm_device *dev,
> >  			  const char *name,
> > @@ -209,6 +217,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_hdr_mult_property = prop;
> >  
> > +	prop = drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_PLANE_SHAPER_LUT", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_shaper_lut_property = prop;
> > +
> > +	prop = drm_property_create_range(adev_to_drm(adev),
> > +					 DRM_MODE_PROP_IMMUTABLE,
> > +					 "AMD_PLANE_SHAPER_LUT_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_shaper_lut_size_property = prop;
> > +
> > +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> > +					 "AMD_PLANE_SHAPER_TF",
> > +					 amdgpu_inv_eotf);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_shaper_tf_property = prop;
> > +
> >  	prop = drm_property_create(adev_to_drm(adev),
> >  				   DRM_MODE_PROP_BLOB,
> >  				   "AMD_PLANE_LUT3D", 0);
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 882391f7add6..8d6ddf19bb87 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1332,6 +1332,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
> >  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
> >  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> >  	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
> > +	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> >  }
> >  
> >  static struct drm_plane_state *
> > @@ -1353,11 +1354,14 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_get(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->shaper_lut)
> > +		drm_property_blob_get(dm_plane_state->shaper_lut);
> >  	if (dm_plane_state->lut3d)
> >  		drm_property_blob_get(dm_plane_state->lut3d);
> >  
> >  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> >  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> > +	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
> >  
> >  	return &dm_plane_state->base;
> >  }
> > @@ -1430,6 +1434,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> >  		drm_property_blob_put(dm_plane_state->degamma_lut);
> >  	if (dm_plane_state->lut3d)
> >  		drm_property_blob_put(dm_plane_state->lut3d);
> > +	if (dm_plane_state->shaper_lut)
> > +		drm_property_blob_put(dm_plane_state->shaper_lut);
> >  
> >  	if (dm_plane_state->dc_state)
> >  		dc_plane_state_release(dm_plane_state->dc_state);
> > @@ -1462,6 +1468,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> >  				   AMDGPU_HDR_MULT_DEFAULT);
> >  
> >  	if (dpp_color_caps.hw_3d_lut) {
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_shaper_lut_property, 0);
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_shaper_lut_size_property,
> > +					   MAX_COLOR_LUT_ENTRIES);
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_shaper_tf_property,
> > +					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
> >  		drm_object_attach_property(&plane->base,
> >  					   mode_info.plane_lut3d_property, 0);
> >  		drm_object_attach_property(&plane->base,
> > @@ -1499,6 +1513,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
> >  			dm_plane_state->hdr_mult = val;
> >  			dm_plane_state->base.color_mgmt_changed = 1;
> >  		}
> > +	} else if (property == adev->mode_info.plane_shaper_lut_property) {
> > +		ret = drm_property_replace_blob_from_id(plane->dev,
> > +							&dm_plane_state->shaper_lut,
> > +							val, -1,
> > +							sizeof(struct drm_color_lut),
> > +							&replaced);
> > +		dm_plane_state->base.color_mgmt_changed |= replaced;
> > +		return ret;
> > +	} else if (property == adev->mode_info.plane_shaper_tf_property) {
> > +		if (dm_plane_state->shaper_tf != val) {
> > +			dm_plane_state->shaper_tf = val;
> > +			dm_plane_state->base.color_mgmt_changed = 1;
> > +		}
> >  	} else if (property == adev->mode_info.plane_lut3d_property) {
> >  		ret = drm_property_replace_blob_from_id(plane->dev,
> >  							&dm_plane_state->lut3d,
> > @@ -1534,6 +1561,11 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
> >  		*val = dm_plane_state->degamma_tf;
> >  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> >  		*val = dm_plane_state->hdr_mult;
> > +	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
> > +		*val = (dm_plane_state->shaper_lut) ?
> > +			dm_plane_state->shaper_lut->base.id : 0;
> > +	} else if (property == adev->mode_info.plane_shaper_tf_property) {
> > +		*val = dm_plane_state->shaper_tf;
> >  	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> >  		*val = (dm_plane_state->lut3d) ?
> >  			dm_plane_state->lut3d->base.id : 0;
> 
