Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A385E798905
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCCE10E8D8;
	Fri,  8 Sep 2023 14:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAB510E8D6;
 Fri,  8 Sep 2023 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2k5excPh8Wio9CT2leD729aD7a7dogzGNloeg+hMYyE=; b=LVoPziK9thjWa6dZod6b5xrL4K
 IFT3XWEy2VYGwpKnHEujnaAlUkAaSdmw7r84VkmcwH2mcy3h6jMXncnBpBBdRAt8hcjsffOKFP5oM
 egAvDW6h1ggwUBc2Sky/VlGQ3Bx/bfq+FzBDBiLn5JeGfHQ85AEJ75lrUBXrG941WXrX8ZRjCK9W8
 ePHzTx84/iqcf2U7DltrrsplZ/J8Zdg1EKwPBo/jEi+XF3P6ldPGCRmwhRPSL+gN7wGB2Wa+yonEy
 P/tuOUqzy6yvkxOEsf/gYcjJBd5UOg6Std1KBk1V83HMn0O7jAQZXDzBJwjoITlwPfBMPHAwGBLMZ
 Uj+utxZA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qecg6-001POW-O9; Fri, 08 Sep 2023 16:41:46 +0200
Date: Fri, 8 Sep 2023 13:41:29 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 32/34] drm/amd/display: add plane CTM driver-specific
 property
Message-ID: <20230908144129.o2rtvyydy5lhggre@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-33-mwen@igalia.com>
 <d50e07fe-4e8e-4e18-ae75-ba351c3c95ad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50e07fe-4e8e-4e18-ae75-ba351c3c95ad@amd.com>
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
> 
> 
> On 2023-08-10 12:03, Melissa Wen wrote:
> > Plane CTM for pre-blending color space conversion. Only enable
> > driver-specific plane CTM property on drivers that support both pre- and
> > post-blending gamut remap matrix, i.e., DCN3+ family. Otherwise it
> > conflits with DRM CRTC CTM property.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 ++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 +++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
> >  4 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > index abb871a912d7..84bf501b02f4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -363,6 +363,8 @@ struct amdgpu_mode_info {
> >  	 * @plane_hdr_mult_property:
> >  	 */
> >  	struct drm_property *plane_hdr_mult_property;
> > +
> > +	struct drm_property *plane_ctm_property;
> >  	/**
> >  	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> >  	 * that converts color content before 3D LUT.
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 095f39f04210..6252ee912a63 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -769,6 +769,13 @@ struct dm_plane_state {
> >  	 * S31.32 sign-magnitude.
> >  	 */
> >  	__u64 hdr_mult;
> > +	/**
> > +	 * @ctm:
> > +	 *
> > +	 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
> > +	 * blob (if not NULL) is a &struct drm_color_ctm.
> > +	 */
> > +	struct drm_property_blob *ctm;
> >  	/**
> >  	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
> >  	 * array of &struct drm_color_lut.
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 4356846a2bce..86a918ab82be 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -218,6 +218,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_hdr_mult_property = prop;
> >  
> > +	prop = drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_PLANE_CTM", 0);
> 
> We'll want to wrap the property creation/attachment with
> #ifdef AMD_PRIVATE_COLOR here as well.

yeah, it's already wrapped because it's created and attached together
with the other properties.

> 
> Harry
> 
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_ctm_property = prop;
> > +
> >  	prop = drm_property_create(adev_to_drm(adev),
> >  				   DRM_MODE_PROP_BLOB,
> >  				   "AMD_PLANE_SHAPER_LUT", 0);
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 3fd57de7c5be..0b1081c690cb 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1355,6 +1355,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_get(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->ctm)
> > +		drm_property_blob_get(dm_plane_state->ctm);
> >  	if (dm_plane_state->shaper_lut)
> >  		drm_property_blob_get(dm_plane_state->shaper_lut);
> >  	if (dm_plane_state->lut3d)
> > @@ -1436,6 +1438,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_put(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->ctm)
> > +		drm_property_blob_put(dm_plane_state->ctm);
> >  	if (dm_plane_state->lut3d)
> >  		drm_property_blob_put(dm_plane_state->lut3d);
> >  	if (dm_plane_state->shaper_lut)
> > @@ -1473,6 +1477,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> >  				   dm->adev->mode_info.plane_hdr_mult_property,
> >  				   AMDGPU_HDR_MULT_DEFAULT);
> >  
> > +	/* Only enable plane CTM if both DPP and MPC gamut remap is available. */
> > +	if (dm->dc->caps.color.mpc.gamut_remap)
> > +		drm_object_attach_property(&plane->base,
> > +					   dm->adev->mode_info.plane_ctm_property, 0);
> > +
> >  	if (dpp_color_caps.hw_3d_lut) {
> >  		drm_object_attach_property(&plane->base,
> >  					   mode_info.plane_shaper_lut_property, 0);
> > @@ -1530,6 +1539,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
> >  			dm_plane_state->hdr_mult = val;
> >  			dm_plane_state->base.color_mgmt_changed = 1;
> >  		}
> > +	} else if (property == adev->mode_info.plane_ctm_property) {
> > +		ret = drm_property_replace_blob_from_id(plane->dev,
> > +							&dm_plane_state->ctm,
> > +							val,
> > +							sizeof(struct drm_color_ctm), -1,
> > +							&replaced);
> > +		dm_plane_state->base.color_mgmt_changed |= replaced;
> > +		return ret;
> >  	} else if (property == adev->mode_info.plane_shaper_lut_property) {
> >  		ret = drm_property_replace_blob_from_id(plane->dev,
> >  							&dm_plane_state->shaper_lut,
> > @@ -1591,6 +1608,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
> >  		*val = dm_plane_state->degamma_tf;
> >  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> >  		*val = dm_plane_state->hdr_mult;
> > +	} else if (property == adev->mode_info.plane_ctm_property) {
> > +		*val = (dm_plane_state->ctm) ?
> > +			dm_plane_state->ctm->base.id : 0;
> >  	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
> >  		*val = (dm_plane_state->shaper_lut) ?
> >  			dm_plane_state->shaper_lut->base.id : 0;
> 
