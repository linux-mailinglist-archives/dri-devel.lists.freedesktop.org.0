Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E6839733
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 19:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2385210E851;
	Tue, 23 Jan 2024 18:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB310E851;
 Tue, 23 Jan 2024 18:03:32 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a3106f5aac8so10395966b.0; 
 Tue, 23 Jan 2024 10:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706032951; x=1706637751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzP0eSKOjbnQ2ru8HTdKomejWSOPl2M8Q/mGuB9QTvM=;
 b=c/PxrEGYHSTZGfviKiZHqqtHvCLMiAYWDAx0SpztkC5egyMfxTeaIaL1qCfj6o8HYV
 Yghy4pIVCeC0XT5EiYCDKIxsvka81Kvos8kwbqQJJpZEQiOaQv6MYqj86/f3+OYOemNo
 ++npvd/i5iV9ZWgIEaIofZITIelnQLdXQ6PgwAzoh0q6qSKObeb+xyThW64+1dMaVGVr
 NXThGdaog/mYgo7Otpws0zpNji2vpN9NnJh4JeyVynxXGS4PHgudUJvEL83ATLNAgmpV
 i1oz86OMjxB8ETq54ZvM++Xvyj1L7lMpgHqsfv1dOoBe6E/fwp5l8WOSw4ZJuQ0pBviP
 IT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706032951; x=1706637751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzP0eSKOjbnQ2ru8HTdKomejWSOPl2M8Q/mGuB9QTvM=;
 b=riSXgGhK+rKO/pLN7S8TQCoc4G6uA0IoczSPmmkExC3yqSXGhWs235buZrsejvy60G
 iHSgHd3Fk+gZ8UmiTwVkcvIMCpnnql2WMSYMt0EJpZT1OLpCcAUn7hQyRLOfHPyhDuhg
 VRGiXscTsQN4anhEDaYSsEHU/Cb2uO14joINhSpy//bVjuuuWBRshbz6O9p7xLLvNbvl
 tkW5nY7YfT/XktZw5T/xg1bwheZLR3EM3EsJDDn8nt4BrhvQ3+6YNKkolouCLlEpFCJk
 fMYj+sqZ4xorJWVlueUX+LMrQZ1f+SZNf2b1NxprV41MoViX6HNgZqfV/QVjvykHavSr
 mBaw==
X-Gm-Message-State: AOJu0YzpnZfKLGRbjLmCDMTn9J/IWhD3QD/i53rbQlMLNW2raD+u/hqz
 u7p4ENxTprK6e7O6GJjziU3svw9+v5njxDUQnAc+/V7cIUhNE6/8fLii5zO8xolAwDia3mvg+2D
 Nw3VzVWVdfVo2napKr95kKezpQTM=
X-Google-Smtp-Source: AGHT+IFXNCzW7fj97YFexXyytl2W4XGvmpFASWQFHqqEseZhsAxlmfxjf3sCf6iXVl3hCAHBMPiR2WNUO1TEyg3u1mg=
X-Received: by 2002:a17:906:4094:b0:a30:dca4:ee7e with SMTP id
 u20-20020a170906409400b00a30dca4ee7emr135796ejj.93.1706032950735; Tue, 23 Jan
 2024 10:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com> <Zaq-r7UZpEy7_Rrn@intel.com>
 <ca1faaec-461b-401c-a86a-e0929d282b51@amd.com>
In-Reply-To: <ca1faaec-461b-401c-a86a-e0929d282b51@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 23 Jan 2024 19:02:19 +0100
Message-ID: <CAFZQkGyf5MxKeGgz09kgyYTp+g-Jk2uaiQkmzSX7BDGHpcz0CQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
To: Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com, Joshua Ashton <joshua@froggi.es>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mo., 22. Jan. 2024 um 16:50 Uhr schrieb Harry Wentland
<harry.wentland@amd.com>:
>
>
>
> On 2024-01-19 13:25, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Jan 19, 2024 at 03:12:35PM -0300, Andr=C3=A9 Almeida wrote:
> >> AMD GPUs can do async flips with changes on more properties than just
> >> the FB ID, so implement a custom check_async_props for AMD planes.
> >>
> >> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
> >> properties. For userspace to check if a driver support this two
> >> properties, the strategy for now is to use TEST_ONLY commits.
> >>
> >> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> >> ---
> >> v2: Drop overlay plane option for now
> >>
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++=
++
> >>   1 file changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b=
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> index 116121e647ca..7afe8c1b62d4 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> @@ -25,6 +25,7 @@
> >>    */
> >>
> >>   #include <drm/drm_atomic_helper.h>
> >> +#include <drm/drm_atomic_uapi.h>
> >>   #include <drm/drm_blend.h>
> >>   #include <drm/drm_gem_atomic_helper.h>
> >>   #include <drm/drm_plane_helper.h>
> >> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_s=
tate(struct drm_plane *plane,
> >>      drm_atomic_helper_plane_destroy_state(plane, state);
> >>   }
> >>
> >> +static int amdgpu_dm_plane_check_async_props(struct drm_property *pro=
p,
> >> +                                      struct drm_plane *plane,
> >> +                                      struct drm_plane_state *plane_s=
tate,
> >> +                                      struct drm_mode_object *obj,
> >> +                                      u64 prop_value, u64 old_val)
> >> +{
> >> +    struct drm_mode_config *config =3D &plane->dev->mode_config;
> >> +    int ret;
> >> +
> >> +    if (prop !=3D config->prop_fb_id &&
> >> +        prop !=3D config->prop_in_fence_fd &&
> >
> > IN_FENCE should just be allowed always.
> >
> >> +        prop !=3D config->prop_fb_damage_clips) {
> >
> > This seems a bit dubious to me. How is amdgpu using the damage
> > information during async flips?
>
> Yeah, I'm also not sure this is right. Has anyone tested this
> with a PSR SU panel?
>
> Harry

I attempted to, but according to
/sys/kernel/debug/dri/1/eDP-1/psr_state, PSR never kicks in on my
laptop at all. The only reason I wanted this property though is to
reduce the number of special cases for async pageflips compositors
have to implement; as it's not necessary for any functionality I think
it's also fine to leave it out.

> >> +            ret =3D drm_atomic_plane_get_property(plane, plane_state,
> >> +                                                prop, &old_val);
> >> +            return drm_atomic_check_prop_changes(ret, old_val, prop_v=
alue, prop);
> >> +    }
> >> +
> >> +    if (plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> >> +            drm_dbg_atomic(prop->dev,
> >> +                           "[OBJECT:%d] Only primary planes can be ch=
anged during async flip\n",
> >> +                           obj->id);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static const struct drm_plane_funcs dm_plane_funcs =3D {
> >>      .update_plane   =3D drm_atomic_helper_update_plane,
> >>      .disable_plane  =3D drm_atomic_helper_disable_plane,
> >> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_fun=
cs =3D {
> >>      .atomic_duplicate_state =3D amdgpu_dm_plane_drm_plane_duplicate_s=
tate,
> >>      .atomic_destroy_state =3D amdgpu_dm_plane_drm_plane_destroy_state=
,
> >>      .format_mod_supported =3D amdgpu_dm_plane_format_mod_supported,
> >> +    .check_async_props =3D amdgpu_dm_plane_check_async_props,
> >>   };
> >>
> >>   int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> >> --
> >> 2.43.0
> >
