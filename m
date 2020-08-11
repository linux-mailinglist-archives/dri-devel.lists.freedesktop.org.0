Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0F241BA9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 15:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0076E516;
	Tue, 11 Aug 2020 13:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298A6E50C;
 Tue, 11 Aug 2020 13:42:25 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id 2so1885760pjx.5;
 Tue, 11 Aug 2020 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=acr0H6bjplSuH3jFhn/PRz6bXpxAqSXjdFwXNbPnR24=;
 b=UdtCloL2EaQh4RPmsH4JGk21oKU+bstNRN0MFNJfd7QgJGlRbv6SGW9/k2X05bmZ+7
 32Ln0xXzJUt9BX1E3K0k8WyMIYLQDi/HhNYjYNxqJKS3AA2P9P4QzIk2VaovlaOAzyDG
 p2uMMmRUYqpAwvyMBAawJkN+toi7QlZle5Npr6wFYVDo/xV4CUHB+8avlvc7LhKDr0zW
 wkEOeWhYlBpS5IQ9pPhdvl8mJBuibEd4OeQYU/r7TmWiCiE2yBC/F/5F3gUiIMN5FcAP
 Zvq30v17dVgJmvWyZe4lX3t/iAYP8cw4MLkzp4IDif8rXzjgZd0b+v3Uqj4D1DBGOs5z
 BhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acr0H6bjplSuH3jFhn/PRz6bXpxAqSXjdFwXNbPnR24=;
 b=jFIy+zHQ05zd7kHmVwdXHijOYG4Q4TYH8kVpIm3359hOIAh3JhgK24Vrk4bFmQwZvT
 1PpFWQLetF7xDVqTKtMgs0bIZLz0Sz+MBMEsLl+5L1X7o+UoDU041HdQP+ZOOKZmDbZS
 RXhq+GuP5/ZDM65TGc0UqPDQarIMmWVOxvxaIQIdXU9mD+uaNiWxbG0IjekA2EAlkGy7
 dSnplWwx8XeGCK7eBAg8Gd666sRrp0T2U4xzQHWQCurVyhjipGX7BjGJL+hDuaTkdBqd
 B4T/6npEnCD88OKmSVphQ+ZAeM7FmPwyBt/5weNjkdRVuUOXmFNTwfauLYF1p9/uXTik
 fs+g==
X-Gm-Message-State: AOAM530uoOWVRAp9y8ZLUoKbUrkbUz6UjGxl42/4wHTILla7CTer6DTU
 /ua/tVIoD8XfH1skCWFO/ij5lqhyLZiTUn+zVXDz9g==
X-Google-Smtp-Source: ABdhPJxg9zr+OF3zRlqH9dkmkmCbrvGaJ5IDw55tVUj1Fomooaz0Dol415tx9iZWqC8iYBvpmqSlZtx4DIL02Czp2ss=
X-Received: by 2002:a17:902:a50e:: with SMTP id
 s14mr905557plq.164.1597153343910; 
 Tue, 11 Aug 2020 06:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
 <20200810122553.GI2352366@phenom.ffwll.local>
 <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
In-Reply-To: <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 11 Aug 2020 09:42:11 -0400
Message-ID: <CAAxE2A5BXVJ9xQ=C6F=Df1MCGUKTjV7yR=6x5hu6vfARp1SD7Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated tiling_flags
 and tmz_surface in prepare_planes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1182794003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1182794003==
Content-Type: multipart/alternative; boundary="000000000000b7389d05ac9a3d36"

--000000000000b7389d05ac9a3d36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are a few cases when the flags can change, for example DCC can be
disabled due to a hw limitation in the 3d engine. Modifiers give the
misleading impression that they help with that, but they don't. They don't
really help with anything.

Marek

On Mon., Aug. 10, 2020, 08:30 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 10.08.20 um 14:25 schrieb Daniel Vetter:
> > On Fri, Aug 07, 2020 at 10:29:09AM -0400, Kazlauskas, Nicholas wrote:
> >> On 2020-08-07 4:30 a.m., daniel@ffwll.ch wrote:
> >>> On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
> >>>> [Why]
> >>>> We're racing with userspace as the flags could potentially change
> >>>> from when we acquired and validated them in commit_check.
> >>> Uh ... I didn't know these could change. I think my comments on Bas'
> >>> series are even more relevant now. I think long term would be best to
> bake
> >>> these flags in at addfb time when modifiers aren't set. And otherwise
> >>> always use the modifiers flag, and completely ignore the legacy flags
> >>> here.
> >>> -Daniel
> >>>
> >> There's a set tiling/mod flags IOCTL that can be called after addfb
> happens,
> >> so unless there's some sort of driver magic preventing this from worki=
ng
> >> when it's already been pinned for scanout then I don't see anything
> stopping
> >> this from happening.
> >>
> >> I still need to review the modifiers series in a little more detail bu=
t
> that
> >> looks like a good approach to fixing these kind of issues.
> > Yeah we had the same model for i915, but it's awkward and can surprise
> > compositors (since the client could change the tiling mode from
> underneath
> > the compositor). So freezing the tiling mode at addfb time is the right
> > thing to do, and anyway how things work with modifiers.
> >
> > Ofc maybe good to audit the -amd driver, but hopefully it doesn't do
> > anything silly with changed tiling. If it does, it's kinda sad day.
>
> Marek should know this right away, but I think we only set the tilling
> flags once while exporting the BO and then never change them.
>
> Regards,
> Christian.
>
> >
> > Btw for i915 we even went a step further, and made the set_tiling ioctl
> > return an error if a framebuffer for that gem_bo existed. Just to make
> > sure we don't ever accidentally break this.
> >
> > Cheers, Daniel
> >
> >> Regards,
> >> Nicholas Kazlauskas
> >>
> >>>> [How]
> >>>> We unfortunately can't drop this function in its entirety from
> >>>> prepare_planes since we don't know the afb->address at commit_check
> >>>> time yet.
> >>>>
> >>>> So instead of querying new tiling_flags and tmz_surface use the ones
> >>>> from the plane_state directly.
> >>>>
> >>>> While we're at it, also update the force_disable_dcc option based
> >>>> on the state from atomic check.
> >>>>
> >>>> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> >>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >>>> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >>>> ---
> >>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36
> ++++++++++---------
> >>>>    1 file changed, 19 insertions(+), 17 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> index bf1881bd492c..f78c09c9585e 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>> @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct
> drm_plane *plane,
> >>>>            struct list_head list;
> >>>>            struct ttm_validate_buffer tv;
> >>>>            struct ww_acquire_ctx ticket;
> >>>> -  uint64_t tiling_flags;
> >>>>            uint32_t domain;
> >>>>            int r;
> >>>> -  bool tmz_surface =3D false;
> >>>> -  bool force_disable_dcc =3D false;
> >>>> -
> >>>> -  dm_plane_state_old =3D to_dm_plane_state(plane->state);
> >>>> -  dm_plane_state_new =3D to_dm_plane_state(new_state);
> >>>>            if (!new_state->fb) {
> >>>>                    DRM_DEBUG_DRIVER("No FB bound\n");
> >>>> @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct
> drm_plane *plane,
> >>>>                    return r;
> >>>>            }
> >>>> -  amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
> >>>> -
> >>>> -  tmz_surface =3D amdgpu_bo_encrypted(rbo);
> >>>> -
> >>>>            ttm_eu_backoff_reservation(&ticket, &list);
> >>>>            afb->address =3D amdgpu_bo_gpu_offset(rbo);
> >>>>            amdgpu_bo_ref(rbo);
> >>>> +  /**
> >>>> +   * We don't do surface updates on planes that have been newly
> created,
> >>>> +   * but we also don't have the afb->address during atomic check.
> >>>> +   *
> >>>> +   * Fill in buffer attributes depending on the address here, but
> only on
> >>>> +   * newly created planes since they're not being used by DC yet an=
d
> this
> >>>> +   * won't modify global state.
> >>>> +   */
> >>>> +  dm_plane_state_old =3D to_dm_plane_state(plane->state);
> >>>> +  dm_plane_state_new =3D to_dm_plane_state(new_state);
> >>>> +
> >>>>            if (dm_plane_state_new->dc_state &&
> >>>> -                  dm_plane_state_old->dc_state !=3D
> dm_plane_state_new->dc_state) {
> >>>> -          struct dc_plane_state *plane_state =3D
> dm_plane_state_new->dc_state;
> >>>> +      dm_plane_state_old->dc_state !=3D dm_plane_state_new->dc_stat=
e) {
> >>>> +          struct dc_plane_state *plane_state =3D
> >>>> +                  dm_plane_state_new->dc_state;
> >>>> +          bool force_disable_dcc =3D !plane_state->dcc.enable;
> >>>> -          force_disable_dcc =3D adev->asic_type =3D=3D CHIP_RAVEN &=
&
> adev->in_suspend;
> >>>>                    fill_plane_buffer_attributes(
> >>>>                            adev, afb, plane_state->format,
> plane_state->rotation,
> >>>> -                  tiling_flags, &plane_state->tiling_info,
> >>>> -                  &plane_state->plane_size, &plane_state->dcc,
> >>>> -                  &plane_state->address, tmz_surface,
> >>>> -                  force_disable_dcc);
> >>>> +                  dm_plane_state_new->tiling_flags,
> >>>> +                  &plane_state->tiling_info,
> &plane_state->plane_size,
> >>>> +                  &plane_state->dcc, &plane_state->address,
> >>>> +                  dm_plane_state_new->tmz_surface,
> force_disable_dcc);
> >>>>            }
> >>>>            return 0;
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000b7389d05ac9a3d36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There are a few cases when the flags can change, for exam=
ple DCC can be disabled due to a hw limitation in the 3d engine. Modifiers =
give the misleading impression that they help with that, but they don&#39;t=
. They don&#39;t really help with anything.<div dir=3D"auto"><br></div><div=
 dir=3D"auto">Marek</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon., Aug. 10, 2020, 08:30 Christian K=C3=B6nig=
, &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzum=
erken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Am 1=
0.08.20 um 14:25 schrieb Daniel Vetter:<br>
&gt; On Fri, Aug 07, 2020 at 10:29:09AM -0400, Kazlauskas, Nicholas wrote:<=
br>
&gt;&gt; On 2020-08-07 4:30 a.m., <a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a> wrote:<br>
&gt;&gt;&gt; On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas =
wrote:<br>
&gt;&gt;&gt;&gt; [Why]<br>
&gt;&gt;&gt;&gt; We&#39;re racing with userspace as the flags could potenti=
ally change<br>
&gt;&gt;&gt;&gt; from when we acquired and validated them in commit_check.<=
br>
&gt;&gt;&gt; Uh ... I didn&#39;t know these could change. I think my commen=
ts on Bas&#39;<br>
&gt;&gt;&gt; series are even more relevant now. I think long term would be =
best to bake<br>
&gt;&gt;&gt; these flags in at addfb time when modifiers aren&#39;t set. An=
d otherwise<br>
&gt;&gt;&gt; always use the modifiers flag, and completely ignore the legac=
y flags<br>
&gt;&gt;&gt; here.<br>
&gt;&gt;&gt; -Daniel<br>
&gt;&gt;&gt;<br>
&gt;&gt; There&#39;s a set tiling/mod flags IOCTL that can be called after =
addfb happens,<br>
&gt;&gt; so unless there&#39;s some sort of driver magic preventing this fr=
om working<br>
&gt;&gt; when it&#39;s already been pinned for scanout then I don&#39;t see=
 anything stopping<br>
&gt;&gt; this from happening.<br>
&gt;&gt;<br>
&gt;&gt; I still need to review the modifiers series in a little more detai=
l but that<br>
&gt;&gt; looks like a good approach to fixing these kind of issues.<br>
&gt; Yeah we had the same model for i915, but it&#39;s awkward and can surp=
rise<br>
&gt; compositors (since the client could change the tiling mode from undern=
eath<br>
&gt; the compositor). So freezing the tiling mode at addfb time is the righ=
t<br>
&gt; thing to do, and anyway how things work with modifiers.<br>
&gt;<br>
&gt; Ofc maybe good to audit the -amd driver, but hopefully it doesn&#39;t =
do<br>
&gt; anything silly with changed tiling. If it does, it&#39;s kinda sad day=
.<br>
<br>
Marek should know this right away, but I think we only set the tilling <br>
flags once while exporting the BO and then never change them.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Btw for i915 we even went a step further, and made the set_tiling ioct=
l<br>
&gt; return an error if a framebuffer for that gem_bo existed. Just to make=
<br>
&gt; sure we don&#39;t ever accidentally break this.<br>
&gt;<br>
&gt; Cheers, Daniel<br>
&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Nicholas Kazlauskas<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; [How]<br>
&gt;&gt;&gt;&gt; We unfortunately can&#39;t drop this function in its entir=
ety from<br>
&gt;&gt;&gt;&gt; prepare_planes since we don&#39;t know the afb-&gt;address=
 at commit_check<br>
&gt;&gt;&gt;&gt; time yet.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So instead of querying new tiling_flags and tmz_surface us=
e the ones<br>
&gt;&gt;&gt;&gt; from the plane_state directly.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; While we&#39;re at it, also update the force_disable_dcc o=
ption based<br>
&gt;&gt;&gt;&gt; on the state from atomic check.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cc: Bhawanpreet Lakha &lt;<a href=3D"mailto:Bhawanpreet.La=
kha@amd.com" target=3D"_blank" rel=3D"noreferrer">Bhawanpreet.Lakha@amd.com=
</a>&gt;<br>
&gt;&gt;&gt;&gt; Cc: Rodrigo Siqueira &lt;<a href=3D"mailto:Rodrigo.Siqueir=
a@amd.com" target=3D"_blank" rel=3D"noreferrer">Rodrigo.Siqueira@amd.com</a=
>&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:n=
icholas.kazlauskas@amd.com" target=3D"_blank" rel=3D"noreferrer">nicholas.k=
azlauskas@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=
 | 36 ++++++++++---------<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 19 insertions(+), 17 deletion=
s(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_=
dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt;&gt;&gt;&gt; index bf1881bd492c..f78c09c9585e 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br=
>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br=
>
&gt;&gt;&gt;&gt; @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_=
fb(struct drm_plane *plane,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct list_head =
list;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_valida=
te_buffer tv;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ww_acquire=
_ctx ticket;<br>
&gt;&gt;&gt;&gt; -=C2=A0 uint64_t tiling_flags;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domain;<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt;&gt;&gt;&gt; -=C2=A0 bool tmz_surface =3D false;<br>
&gt;&gt;&gt;&gt; -=C2=A0 bool force_disable_dcc =3D false;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -=C2=A0 dm_plane_state_old =3D to_dm_plane_state(plane-&gt=
;state);<br>
&gt;&gt;&gt;&gt; -=C2=A0 dm_plane_state_new =3D to_dm_plane_state(new_state=
);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!new_state-&g=
t;fb) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_DEBUG_DRIVER(&quot;No FB bound\n&quot;);<br>
&gt;&gt;&gt;&gt; @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare=
_fb(struct drm_plane *plane,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; -=C2=A0 amdgpu_bo_get_tiling_flags(rbo, &amp;tiling_flags)=
;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -=C2=A0 tmz_surface =3D amdgpu_bo_encrypted(rbo);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_eu_backoff_re=
servation(&amp;ticket, &amp;list);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 afb-&gt;address =
=3D amdgpu_bo_gpu_offset(rbo);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_bo_ref(rbo=
);<br>
&gt;&gt;&gt;&gt; +=C2=A0 /**<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0* We don&#39;t do surface updates on planes =
that have been newly created,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0* but we also don&#39;t have the afb-&gt;add=
ress during atomic check.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0*<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0* Fill in buffer attributes depending on the=
 address here, but only on<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0* newly created planes since they&#39;re not=
 being used by DC yet and this<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0* won&#39;t modify global state.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt; +=C2=A0 dm_plane_state_old =3D to_dm_plane_state(plane-&gt=
;state);<br>
&gt;&gt;&gt;&gt; +=C2=A0 dm_plane_state_new =3D to_dm_plane_state(new_state=
);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dm_plane_stat=
e_new-&gt;dc_state &amp;&amp;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dm_plane_state_old-&gt;dc_state !=3D dm_plane_state_new-&gt;dc_state=
) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dc_plane_state =
*plane_state =3D dm_plane_state_new-&gt;dc_state;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 dm_plane_state_old-&gt;dc_state !=3D=
 dm_plane_state_new-&gt;dc_state) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dc_plane_state =
*plane_state =3D<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dm_plane_state_new-&gt;dc_state;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool force_disable_dcc=
 =3D !plane_state-&gt;dcc.enable;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_disable_dcc =3D =
adev-&gt;asic_type =3D=3D CHIP_RAVEN &amp;&amp; adev-&gt;in_suspend;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fill_plane_buffer_attributes(<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adev, afb, plane_state-&gt;format, p=
lane_state-&gt;rotation,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tiling_flags, &amp;plane_state-&gt;tiling_info,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;plane_state-&gt;plane_size, &amp;plane_state-&gt;dcc,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;plane_state-&gt;address, tmz_surface,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 force_disable_dcc);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dm_plane_state_new-&gt;tiling_flags,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;plane_state-&gt;tiling_info, &amp;plane_state-&gt;plane_size,<b=
r>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;plane_state-&gt;dcc, &amp;plane_state-&gt;address,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dm_plane_state_new-&gt;tmz_surface, force_disable_dcc);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt; dri-devel mailing list<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=
=3D"_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt;&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/=
dri-devel" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.fr=
eedesktop.org/mailman/listinfo/dri-devel</a><br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/amd-gfx</a><br>
</blockquote></div>

--000000000000b7389d05ac9a3d36--

--===============1182794003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182794003==--
