Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD12405DE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F5389F6D;
	Mon, 10 Aug 2020 12:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2581789F6D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:28:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a14so7991807wra.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eaIFsD+hoNLL20dznuclcVsRdvgYr891wOnd6wLUjec=;
 b=Yvy/UK8vKUjrKoyV+hTC42+eQBPiz1TOCCHOBCZ/Cr7lLUPoUSvho737YejL1LWMNg
 8dbyJSyva8raZdNFV0/AZiPEfJ0q3bsqkSJdu251XZQ3kgzdjFIkXtF+w+6tGeOX3vG8
 lCQO3V/RiSTo9+b4Npk7GtcqmZ0Ta+LaEWOoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eaIFsD+hoNLL20dznuclcVsRdvgYr891wOnd6wLUjec=;
 b=HPgmdZcT8Q78H9acGi7SBWpTM9boS2xqOjMW1wqwb3flhqxQy0Vd2lg4+gDf9YwFuu
 KrEczeIJopHAowEc6zC9mK1dj/8YlWNdGcayD0ermYG5hEGaxJIfDNkkouKjn+Xy/Urv
 UTlWoqkWVqwHhYXjvSDfEeQBUy5FbjroI3v5hr1lNhfE8PKowJ5kRHS7DXrzZVD5YBZL
 qgvj4OwMp7YHERJ8QPH/JeokdvEicP2znp8jNQxMl75S7OLoQEff60lSnibdBxaBTDQR
 3/xyAw7JB240L6KKhku/o53VG16AZg5AMY+vqLhlUlizcng2udJLp2SvnPPktfC9FbfF
 VkAw==
X-Gm-Message-State: AOAM531UL/Eh/CmUw2XGQ68vAn9xe2/TietymazXgz0ZCDVLEghpYASg
 +V33Mkrb4QYG96y+4FT/uO2rFSlZlHM=
X-Google-Smtp-Source: ABdhPJw7YOfKEvH1CsffpGjmuSHWL9OJ7P8To7sa/l5yz1NIVFwTz2OfpIGtChWTZL4wOce2Xr0yDQ==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr23231761wrn.28.1597062502722; 
 Mon, 10 Aug 2020 05:28:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm20800057wrr.10.2020.08.10.05.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:28:22 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:28:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, daniel@ffwll.ch, daniel@fooishbar.org,
 maraeo@gmail.com
Subject: Re: [PATCH 6/8] drm/amd/display: Set DC options from modifiers.
Message-ID: <20200810122820.GJ2352366@phenom.ffwll.local>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-7-bas@basnieuwenhuizen.nl>
 <20200805073210.GU6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805073210.GU6419@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 05, 2020 at 09:32:10AM +0200, daniel@ffwll.ch wrote:
> On Tue, Aug 04, 2020 at 11:31:17PM +0200, Bas Nieuwenhuizen wrote:
> > This sets the DC tiling options from the modifier, if modifiers
> > are used for the FB. This patch by itself does not expose the
> > support yet though.
> > 
> > There is not much validation yet to limit the scope of this
> > patch, but the current validation is at the same level as
> > the BO metadata path.
> > 
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 109 +++++++++++++++++-
> >  1 file changed, 103 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 6ef7f2f8acab..ac913b8f10ef 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3754,6 +3754,93 @@ fill_gfx9_plane_attributes_from_flags(struct amdgpu_device *adev,
> >  	return 0;
> >  }
> >  
> > +static bool
> > +modifier_has_dcc(uint64_t modifier)
> > +{
> > +	return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier);
> > +}
> > +
> > +static unsigned
> > +modifier_gfx9_swizzle_mode(uint64_t modifier)
> > +{
> > +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> > +		return 0;
> > +
> > +	return AMD_FMT_MOD_GET(TILE, modifier);
> > +}
> > +
> > +static void
> > +fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
> > +				  union dc_tiling_info *tiling_info,
> > +				  uint64_t modifier)
> > +{
> > +	unsigned int mod_bank_xor_bits = AMD_FMT_MOD_GET(BANK_XOR_BITS, modifier);
> > +	unsigned int mod_pipe_xor_bits = AMD_FMT_MOD_GET(PIPE_XOR_BITS, modifier);
> > +	unsigned int pkrs_log2 = AMD_FMT_MOD_GET(PACKERS, modifier);
> > +	unsigned int pipes_log2 = min(4u, mod_pipe_xor_bits);
> > +
> > +	fill_gfx9_tiling_info_from_device(adev, tiling_info);
> > +
> > +	if (!IS_AMD_FMT_MOD(modifier))
> > +		return;
> > +
> > +	tiling_info->gfx9.num_pipes = 1u << pipes_log2;
> > +	tiling_info->gfx9.num_shader_engines = 1u << (mod_pipe_xor_bits - pipes_log2);
> > +
> > +	if (adev->family >= AMDGPU_FAMILY_NV) {
> > +		tiling_info->gfx9.num_pkrs = 1u << pkrs_log2;
> > +	} else {
> > +		tiling_info->gfx9.num_banks = 1u << mod_bank_xor_bits;
> > +
> > +		/* for DCC we know it isn't rb aligned, so rb_per_se doesn't matter. */
> > +	}
> > +}
> > +
> > +static void
> > +block_alignment(unsigned int blocksize_log2, unsigned int *width, unsigned int *height)
> > +{
> > +	unsigned int height_log2 = blocksize_log2 / 2;
> > +	unsigned int width_log2 = blocksize_log2 - height_log2;
> > +
> > +	*width = 1u << width_log2;
> > +	*height = 1u << height_log2;
> > +}
> > +
> > +static int
> > +fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
> > +				      const struct amdgpu_framebuffer *afb,
> > +				      const enum surface_pixel_format format,
> > +				      const enum dc_rotation_angle rotation,
> > +				      const struct plane_size *plane_size,
> > +				      union dc_tiling_info *tiling_info,
> > +				      struct dc_plane_dcc_param *dcc,
> > +				      struct dc_plane_address *address,
> > +				      const bool force_disable_dcc)
> > +{
> > +	const uint64_t modifier = afb->base.modifier;
> > +	int ret;
> > +
> > +	fill_gfx9_tiling_info_from_modifier(adev, tiling_info, modifier);
> > +	tiling_info->gfx9.swizzle = modifier_gfx9_swizzle_mode(modifier);
> > +
> > +	if (modifier_has_dcc(modifier) && !force_disable_dcc) {
> > +		uint64_t dcc_address = afb->address + afb->base.offsets[1];
> > +
> > +		dcc->enable = 1;
> > +		dcc->meta_pitch = afb->base.pitches[1];
> > +		dcc->independent_64b_blks = AMD_FMT_MOD_GET(DCC_INDEPENDENT_64B, modifier);
> > +
> > +		address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
> > +		address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
> > +	}
> > +
> > +	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> >  static int
> >  fill_plane_buffer_attributes(struct amdgpu_device *adev,
> >  			     const struct amdgpu_framebuffer *afb,
> > @@ -3823,12 +3910,22 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
> >  
> >  
> >  	if (adev->family >= AMDGPU_FAMILY_AI) {
> > -		ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
> > -							    plane_size, tiling_info, dcc,
> > -							    address, tiling_flags,
> > -							    force_disable_dcc);
> > -		if (ret)
> > -			return ret;
> > +		if (afb->base.flags & DRM_MODE_FB_MODIFIERS) {
> > +			ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
> > +								      rotation, plane_size,
> > +								      tiling_info, dcc,
> > +								      address,
> > +								      force_disable_dcc);
> > +			if (ret)
> > +				return ret;
> > +		} else {
> > +			ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
> > +								  plane_size, tiling_info, dcc,
> > +								  address, tiling_flags,
> > +								  force_disable_dcc);
> > +			if (ret)
> > +				return ret;
> 
> So what we've done in i915, but might be too cumbersome with the amdgpu
> modifiers, is to map legacy tiling information into modifiers once, at the
> beginning of addfb. So in amdgpu_display_user_framebuffer_create(). And
> once modifiers are filled in, you ofc set the DRM_MODE_FB_MODIFIERS flag
> too in the fb.
> 
> Then all the display code only works with modifiers, instead of having a
> mix and possible confusion, with breakage when people only test the legacy
> path. Which I kinda expect to happen, since amd probably runs with their
> own ddx in their CI rig only.
> 
> This also avoids a bunch of layering and locking unprettiness, since
> display code doesn't need to dig around in gem_bo side of things. On that,
> there's another amdgpu_bo_get_tiling_flags in amdgpu_dm_commit_planes
> which probably shouldn't be there, and should use computed stuff from
> plane state or fb (I changed it to a lockless version to just hack around
> locking issues, but still there).
> 
> This hopefully/eventually should allow us to entirely phase out the legacy
> magic tiling blob attached to bo (we've pulled the trigger on that for
> intel now, would have needed to extend the uapi to keep it working was a
> good excuse).

Ok just learned that amdgpu hat set/get_tiling, so I'm upgrading my idea
here to a very strong recommendation, i.e. please do this except if
there's and amd ddx which somehow wants to change tiling mode while a fb
exists, and expects this to propagate.

In i915 we even disallow the set_tiling ioctl with an error if an fb
exists, just to make sure userspace behaves. Even if userspace uses
set_tiling, this way we can at least enforce the same semantics of "client
can't pull compositor over the table with a set_tiling at the wrong time"
of modifiers.
-Daniel

> 
> Cheers, Daniel
> 
> > +		}
> >  	} else {
> >  		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
> >  	}
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
