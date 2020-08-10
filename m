Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BC2405D6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEDC89F5F;
	Mon, 10 Aug 2020 12:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2567789F63
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:25:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 184so8156437wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b3OoEEdMwMrmKUMYmH+zb4XpVVjWGK+gf31ILXRHaSw=;
 b=kb9fzKclPhf56lIrTevHzKGEbJzJlHS1bVfd6A2NCGcg3LwML2AIzje9k869hkdq3N
 t/3s7UvEuc27IZJ/BPKqv1tugdEK4DZxxlc23m/VAxrQUjdnGXRVtGIM7HKV1cWPo6xD
 hLJEWHVLWBfw3Qksy7UzRQv1yqnaDhw8Fv8fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b3OoEEdMwMrmKUMYmH+zb4XpVVjWGK+gf31ILXRHaSw=;
 b=r5XCjGmxq8OxB1nVHaaISkZ6sm3HaKVX84RBVA6oi8FBdnAjMFYWvlxBxyS1IS6jYs
 v8r2g5uUomUqE/Yiw1xR3Rwp6UM6hXTkNqwXM2rF+UpXn08iodMHQ2wHS5uZyn6R00bp
 342UIKb23Jdm6ZWH1jJ884MF8IC/RmXdcPFIiEhpWGfIeoAdgNwZiUp/WpeSjFNwal3N
 OU6qjgGMN4GBFFkxX7PZcSn4nMeRtZaiG4ATvlhs+tN+HP1mIciyLZ1e9gSiDZ2fHiZP
 6ha/YWIE1TX3ByxvpnpzAl9lmrrhHL7RmaMffVVnbDbrN6aVM8cAEGkiCWm/x1PzkNPM
 G58A==
X-Gm-Message-State: AOAM533PBZ9vi1ewxY4YynQ6+GgadjNwWHR/snHQX98M1vW8DrZUbUyB
 M4QpGXMiqLr+a3+Y65aXNTwcTg==
X-Google-Smtp-Source: ABdhPJxIjqkTUhXE3Vs74CTmFKDG0oeOy6Hu70Ht3cj2yYP5cL5K288kmMPDcGl7h4/dN1o/IyfAdQ==
X-Received: by 2002:a1c:80c1:: with SMTP id
 b184mr26695970wmd.121.1597062356672; 
 Mon, 10 Aug 2020 05:25:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m8sm21030820wro.75.2020.08.10.05.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:25:55 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:25:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated
 tiling_flags and tmz_surface in prepare_planes
Message-ID: <20200810122553.GI2352366@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 10:29:09AM -0400, Kazlauskas, Nicholas wrote:
> On 2020-08-07 4:30 a.m., daniel@ffwll.ch wrote:
> > On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
> > > [Why]
> > > We're racing with userspace as the flags could potentially change
> > > from when we acquired and validated them in commit_check.
> > 
> > Uh ... I didn't know these could change. I think my comments on Bas'
> > series are even more relevant now. I think long term would be best to bake
> > these flags in at addfb time when modifiers aren't set. And otherwise
> > always use the modifiers flag, and completely ignore the legacy flags
> > here.
> > -Daniel
> > 
> 
> There's a set tiling/mod flags IOCTL that can be called after addfb happens,
> so unless there's some sort of driver magic preventing this from working
> when it's already been pinned for scanout then I don't see anything stopping
> this from happening.
> 
> I still need to review the modifiers series in a little more detail but that
> looks like a good approach to fixing these kind of issues.

Yeah we had the same model for i915, but it's awkward and can surprise
compositors (since the client could change the tiling mode from underneath
the compositor). So freezing the tiling mode at addfb time is the right
thing to do, and anyway how things work with modifiers.

Ofc maybe good to audit the -amd driver, but hopefully it doesn't do
anything silly with changed tiling. If it does, it's kinda sad day.

Btw for i915 we even went a step further, and made the set_tiling ioctl
return an error if a framebuffer for that gem_bo existed. Just to make
sure we don't ever accidentally break this.

Cheers, Daniel

> 
> Regards,
> Nicholas Kazlauskas
> 
> > > 
> > > [How]
> > > We unfortunately can't drop this function in its entirety from
> > > prepare_planes since we don't know the afb->address at commit_check
> > > time yet.
> > > 
> > > So instead of querying new tiling_flags and tmz_surface use the ones
> > > from the plane_state directly.
> > > 
> > > While we're at it, also update the force_disable_dcc option based
> > > on the state from atomic check.
> > > 
> > > Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > ---
> > >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
> > >   1 file changed, 19 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index bf1881bd492c..f78c09c9585e 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
> > >   	struct list_head list;
> > >   	struct ttm_validate_buffer tv;
> > >   	struct ww_acquire_ctx ticket;
> > > -	uint64_t tiling_flags;
> > >   	uint32_t domain;
> > >   	int r;
> > > -	bool tmz_surface = false;
> > > -	bool force_disable_dcc = false;
> > > -
> > > -	dm_plane_state_old = to_dm_plane_state(plane->state);
> > > -	dm_plane_state_new = to_dm_plane_state(new_state);
> > >   	if (!new_state->fb) {
> > >   		DRM_DEBUG_DRIVER("No FB bound\n");
> > > @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
> > >   		return r;
> > >   	}
> > > -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
> > > -
> > > -	tmz_surface = amdgpu_bo_encrypted(rbo);
> > > -
> > >   	ttm_eu_backoff_reservation(&ticket, &list);
> > >   	afb->address = amdgpu_bo_gpu_offset(rbo);
> > >   	amdgpu_bo_ref(rbo);
> > > +	/**
> > > +	 * We don't do surface updates on planes that have been newly created,
> > > +	 * but we also don't have the afb->address during atomic check.
> > > +	 *
> > > +	 * Fill in buffer attributes depending on the address here, but only on
> > > +	 * newly created planes since they're not being used by DC yet and this
> > > +	 * won't modify global state.
> > > +	 */
> > > +	dm_plane_state_old = to_dm_plane_state(plane->state);
> > > +	dm_plane_state_new = to_dm_plane_state(new_state);
> > > +
> > >   	if (dm_plane_state_new->dc_state &&
> > > -			dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
> > > -		struct dc_plane_state *plane_state = dm_plane_state_new->dc_state;
> > > +	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
> > > +		struct dc_plane_state *plane_state =
> > > +			dm_plane_state_new->dc_state;
> > > +		bool force_disable_dcc = !plane_state->dcc.enable;
> > > -		force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
> > >   		fill_plane_buffer_attributes(
> > >   			adev, afb, plane_state->format, plane_state->rotation,
> > > -			tiling_flags, &plane_state->tiling_info,
> > > -			&plane_state->plane_size, &plane_state->dcc,
> > > -			&plane_state->address, tmz_surface,
> > > -			force_disable_dcc);
> > > +			dm_plane_state_new->tiling_flags,
> > > +			&plane_state->tiling_info, &plane_state->plane_size,
> > > +			&plane_state->dcc, &plane_state->address,
> > > +			dm_plane_state_new->tmz_surface, force_disable_dcc);
> > >   	}
> > >   	return 0;
> > > -- 
> > > 2.25.1
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
