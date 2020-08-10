Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E319C2405EE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919A489F63;
	Mon, 10 Aug 2020 12:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5B89F63
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:32:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p20so8004814wrf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qiBlCT0CmMLPmjEFWa4H8ZWJGwruSUVSu7vq1kDQkTQ=;
 b=K5Jqq/0Q0h1y9FdE8Bes/1VsjtRCMwDYpuk5RUIV98F9NZiXxyGjtv7bi5b6G2Y5oD
 Wl7pWLnXIw883f7VK05nN6rocWS+S4sG21OocCnrkNqzHd066ji+kb+qGaAJwBDjOFBA
 Y5z2IbLz9BW1kO52TeFN8TGMQ0AgmvhHDKHtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qiBlCT0CmMLPmjEFWa4H8ZWJGwruSUVSu7vq1kDQkTQ=;
 b=hr7bg+16s1QbsKPavhPfCU086FEHMc1aYX4bhDh1XXQcJluDnlnQF/HkT8/oh3duJw
 vL3dKxaa8E2x6KTMJIHavGeann312Qlo1R5Sjq31eQLXXe/EUuBEjCwRUMbFiEbb2yj3
 e6XbGvnVv3kIxzzEwdpS8ZZwG9gKmq3qMQV6z/mbSHoLNo8Ob/hqKsahcoL43LlAotUd
 pLuj/QSW4LwAznWRvYqEsfPWpWEJSmOr1IOqa6ufC6ASnLSCFbmkc4LOn3PTh/Tnsoq6
 t6tbDZeaDd1j2aCI/3n6RPf+JVeQP5qWHm7mYQUwWXtI113qPAuAw6BcLNEXN6KH23+d
 Lc9A==
X-Gm-Message-State: AOAM532QG/0R2owtFRQ3+5Hs8i2ht+eBR8IuQTgU+fQDLswP1RUeGPWC
 KzBbmXgbqL8YlqSWep9LuEriug==
X-Google-Smtp-Source: ABdhPJyJUgfux8Q1niSc3vUENPwAc6xFy56CildJBLY8dMP5c4whUz/sgsc6N+ZoBSoMxNAfM1PgIw==
X-Received: by 2002:adf:f847:: with SMTP id d7mr1175192wrq.328.1597062723270; 
 Mon, 10 Aug 2020 05:32:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i14sm23698674wrc.19.2020.08.10.05.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:32:02 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:32:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated
 tiling_flags and tmz_surface in prepare_planes
Message-ID: <20200810123200.GL2352366@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
 <20200810122553.GI2352366@phenom.ffwll.local>
 <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
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
Cc: "Olsak, Marek" <Marek.Olsak@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 02:30:05PM +0200, Christian K=F6nig wrote:
> Am 10.08.20 um 14:25 schrieb Daniel Vetter:
> > On Fri, Aug 07, 2020 at 10:29:09AM -0400, Kazlauskas, Nicholas wrote:
> > > On 2020-08-07 4:30 a.m., daniel@ffwll.ch wrote:
> > > > On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
> > > > > [Why]
> > > > > We're racing with userspace as the flags could potentially change
> > > > > from when we acquired and validated them in commit_check.
> > > > Uh ... I didn't know these could change. I think my comments on Bas'
> > > > series are even more relevant now. I think long term would be best =
to bake
> > > > these flags in at addfb time when modifiers aren't set. And otherwi=
se
> > > > always use the modifiers flag, and completely ignore the legacy fla=
gs
> > > > here.
> > > > -Daniel
> > > > =

> > > There's a set tiling/mod flags IOCTL that can be called after addfb h=
appens,
> > > so unless there's some sort of driver magic preventing this from work=
ing
> > > when it's already been pinned for scanout then I don't see anything s=
topping
> > > this from happening.
> > > =

> > > I still need to review the modifiers series in a little more detail b=
ut that
> > > looks like a good approach to fixing these kind of issues.
> > Yeah we had the same model for i915, but it's awkward and can surprise
> > compositors (since the client could change the tiling mode from underne=
ath
> > the compositor). So freezing the tiling mode at addfb time is the right
> > thing to do, and anyway how things work with modifiers.
> > =

> > Ofc maybe good to audit the -amd driver, but hopefully it doesn't do
> > anything silly with changed tiling. If it does, it's kinda sad day.
> =

> Marek should know this right away, but I think we only set the tilling fl=
ags
> once while exporting the BO and then never change them.

Yeah it's the only reasonable model really, since set/get_tiling is not
synchronized with any winsys protocol. So full of races by design.

The only thing I'd worry about is if you do set_tiling after addfb in your
ddx. That one is save, but would badly break if we sample modifiers from
set_tiling flags only once at addfb time.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Btw for i915 we even went a step further, and made the set_tiling ioctl
> > return an error if a framebuffer for that gem_bo existed. Just to make
> > sure we don't ever accidentally break this.
> > =

> > Cheers, Daniel
> > =

> > > Regards,
> > > Nicholas Kazlauskas
> > > =

> > > > > [How]
> > > > > We unfortunately can't drop this function in its entirety from
> > > > > prepare_planes since we don't know the afb->address at commit_che=
ck
> > > > > time yet.
> > > > > =

> > > > > So instead of querying new tiling_flags and tmz_surface use the o=
nes
> > > > > from the plane_state directly.
> > > > > =

> > > > > While we're at it, also update the force_disable_dcc option based
> > > > > on the state from atomic check.
> > > > > =

> > > > > Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > > > > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > > > Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > > ---
> > > > >    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++-=
--------
> > > > >    1 file changed, 19 insertions(+), 17 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > index bf1881bd492c..f78c09c9585e 100644
> > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(stru=
ct drm_plane *plane,
> > > > >    	struct list_head list;
> > > > >    	struct ttm_validate_buffer tv;
> > > > >    	struct ww_acquire_ctx ticket;
> > > > > -	uint64_t tiling_flags;
> > > > >    	uint32_t domain;
> > > > >    	int r;
> > > > > -	bool tmz_surface =3D false;
> > > > > -	bool force_disable_dcc =3D false;
> > > > > -
> > > > > -	dm_plane_state_old =3D to_dm_plane_state(plane->state);
> > > > > -	dm_plane_state_new =3D to_dm_plane_state(new_state);
> > > > >    	if (!new_state->fb) {
> > > > >    		DRM_DEBUG_DRIVER("No FB bound\n");
> > > > > @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(str=
uct drm_plane *plane,
> > > > >    		return r;
> > > > >    	}
> > > > > -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
> > > > > -
> > > > > -	tmz_surface =3D amdgpu_bo_encrypted(rbo);
> > > > > -
> > > > >    	ttm_eu_backoff_reservation(&ticket, &list);
> > > > >    	afb->address =3D amdgpu_bo_gpu_offset(rbo);
> > > > >    	amdgpu_bo_ref(rbo);
> > > > > +	/**
> > > > > +	 * We don't do surface updates on planes that have been newly c=
reated,
> > > > > +	 * but we also don't have the afb->address during atomic check.
> > > > > +	 *
> > > > > +	 * Fill in buffer attributes depending on the address here, but=
 only on
> > > > > +	 * newly created planes since they're not being used by DC yet =
and this
> > > > > +	 * won't modify global state.
> > > > > +	 */
> > > > > +	dm_plane_state_old =3D to_dm_plane_state(plane->state);
> > > > > +	dm_plane_state_new =3D to_dm_plane_state(new_state);
> > > > > +
> > > > >    	if (dm_plane_state_new->dc_state &&
> > > > > -			dm_plane_state_old->dc_state !=3D dm_plane_state_new->dc_stat=
e) {
> > > > > -		struct dc_plane_state *plane_state =3D dm_plane_state_new->dc_=
state;
> > > > > +	    dm_plane_state_old->dc_state !=3D dm_plane_state_new->dc_st=
ate) {
> > > > > +		struct dc_plane_state *plane_state =3D
> > > > > +			dm_plane_state_new->dc_state;
> > > > > +		bool force_disable_dcc =3D !plane_state->dcc.enable;
> > > > > -		force_disable_dcc =3D adev->asic_type =3D=3D CHIP_RAVEN && ade=
v->in_suspend;
> > > > >    		fill_plane_buffer_attributes(
> > > > >    			adev, afb, plane_state->format, plane_state->rotation,
> > > > > -			tiling_flags, &plane_state->tiling_info,
> > > > > -			&plane_state->plane_size, &plane_state->dcc,
> > > > > -			&plane_state->address, tmz_surface,
> > > > > -			force_disable_dcc);
> > > > > +			dm_plane_state_new->tiling_flags,
> > > > > +			&plane_state->tiling_info, &plane_state->plane_size,
> > > > > +			&plane_state->dcc, &plane_state->address,
> > > > > +			dm_plane_state_new->tmz_surface, force_disable_dcc);
> > > > >    	}
> > > > >    	return 0;
> > > > > -- =

> > > > > 2.25.1
> > > > > =

> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
