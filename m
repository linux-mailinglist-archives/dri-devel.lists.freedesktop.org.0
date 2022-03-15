Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B74DA2AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0189CB9;
	Tue, 15 Mar 2022 18:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A4589CB9;
 Tue, 15 Mar 2022 18:50:34 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v75so294546oie.1;
 Tue, 15 Mar 2022 11:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5EpZyHvK/9ZxjXCKi6CiCtxau1q0Ts04ssDumse25PQ=;
 b=BLJJ42Ex1mFe88c2MCUq4Y0lbYrXnB9HfIAkjkfpsS8Mx4Mthk7lRsRxf+x/cj5b3D
 6LCNF8jlK1bLdPsNuZJcWmEM+JPKxfmRq7KOUzo87kH4hg7KAFe3E5GapvDYYsf/6CKq
 4xIS9+NoZXeDFyQt+s+z5zABt/c+LZQzPLfGbDcSUBab6oX9ro4rOpQjK2eblKumnTII
 G0NVM0ir95qwYTafEg+Ice4kW5h2gUq76Np3BmHXxTiwA0fP8TJxvOzXzTO7PbSsYsAX
 4hEwwVfGR/Xi1tnOOlncCmvk5ZYVCn8Q1T1K7C0ycF5E/+suFPjpxpOd74cwkWhr4B75
 c8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5EpZyHvK/9ZxjXCKi6CiCtxau1q0Ts04ssDumse25PQ=;
 b=7LjNx6eAas2gltPzAz4lzsABKN/j+hlee6GgqWvxDG0CChDKQ/XMphZnsv0thyIYzw
 bKrlZXDBplKsJ58+Vuc4RoJ8OgLKWlpWz0PvpWqJ199BdizHiBQ4VJ9tsmDFLGPRW0nB
 xuJkK1ljzJKMS0Hqmo8zp46UqG6Y6Z39WeJ6Wz4gCzo9zwuTPL8bzrxrhwV1ePVb0+P5
 +y/A6Rb57x3xHAtIlqHi2iERurxfM+1Uxcva3pEgW5xaqru1ORBS+xc29+Oo1gasyCaS
 pIn0oof4sj3F3E7uQMY0qrA8z2/nmBx/cm2d6UnPyo9y7IhfvZM3teRMYb3BIPzN6o/4
 NQkQ==
X-Gm-Message-State: AOAM532qHHbQZJZvYhGVO3GtlzJN5ojDjLN93ew7/sNmPNM9sBAtwgH0
 tN0FhO8W41wmJdKlLbu/dHLk2Jqsm9l3wsGS3lk=
X-Google-Smtp-Source: ABdhPJw4xZoctJq8r8I/9JaVKTPIAkv27veVysiq+Mt1npo2UrORBPz8DR4FqggY8pQsmgKcgaEn1186r2WOhe4p+lc=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2373290oin.253.1647370234282; Tue, 15 Mar
 2022 11:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-5-ville.syrjala@linux.intel.com>
 <b3f6777d-7a0d-3109-9312-8059e6ba8e3a@amd.com>
In-Reply-To: <b3f6777d-7a0d-3109-9312-8059e6ba8e3a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 14:50:23 -0400
Message-ID: <CADnq5_PSnPO4ifjw5QmUNsvNpWA3gwUva7c5Pi5hzA7zMUjjEw@mail.gmail.com>
Subject: Re: [PATCH 04/22] drm/amdgpu: Use drm_mode_copy()
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 18, 2022 at 11:32 AM Harry Wentland <harry.wentland@amd.com> wr=
ote:
>
>
>
> On 2022-02-18 05:03, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > struct drm_display_mode embeds a list head, so overwriting
> > the full struct with another one will corrupt the list
> > (if the destination mode is on a list). Use drm_mode_copy()
> > instead which explicitly preserves the list head of
> > the destination mode.
> >
> > Even if we know the destination mode is not on any list
> > using drm_mode_copy() seems decent as it sets a good
> > example. Bad examples of not using it might eventually
> > get copied into code where preserving the list head
> > actually matters.
> >
> > Obviously one case not covered here is when the mode
> > itself is embedded in a larger structure and the whole
> > structure is copied. But if we are careful when copying
> > into modes embedded in structures I think we can be a
> > little more reassured that bogus list heads haven't been
> > propagated in.
> >
> > @is_mode_copy@
> > @@
> > drm_mode_copy(...)
> > {
> > ...
> > }
> >
> > @depends on !is_mode_copy@
> > struct drm_display_mode *mode;
> > expression E, S;
> > @@
> > (
> > - *mode =3D E
> > + drm_mode_copy(mode, &E)
> > |
> > - memcpy(mode, E, S)
> > + drm_mode_copy(mode, E)
> > )
> >
> > @depends on !is_mode_copy@
> > struct drm_display_mode mode;
> > expression E;
> > @@
> > (
> > - mode =3D E
> > + drm_mode_copy(&mode, &E)
> > |
> > - memcpy(&mode, E, S)
> > + drm_mode_copy(&mode, E)
> > )
> >
> > @@
> > struct drm_display_mode *mode;
> > @@
> > - &*mode
> > + mode
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 4 ++--
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_connectors.c
> > index fa20261aa928..673078faa27a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > @@ -626,7 +626,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_e=
ncoder *encoder,
> >               if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> >                       if (mode->hdisplay !=3D native_mode->hdisplay ||
> >                           mode->vdisplay !=3D native_mode->vdisplay)
> > -                             memcpy(native_mode, mode, sizeof(*mode));
> > +                             drm_mode_copy(native_mode, mode);
> >               }
> >       }
> >
> > @@ -635,7 +635,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_e=
ncoder *encoder,
> >               list_for_each_entry_safe(mode, t, &connector->probed_mode=
s, head) {
> >                       if (mode->hdisplay =3D=3D native_mode->hdisplay &=
&
> >                           mode->vdisplay =3D=3D native_mode->vdisplay) =
{
> > -                             *native_mode =3D *mode;
> > +                             drm_mode_copy(native_mode, mode);
> >                               drm_mode_set_crtcinfo(native_mode, CRTC_I=
NTERLACE_HALVE_V);
> >                               DRM_DEBUG_KMS("Determined LVDS native mod=
e details from EDID\n");
> >                               break;
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index bd23c9e481eb..514280699ad5 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -6318,7 +6318,7 @@ get_highest_refresh_rate_mode(struct amdgpu_dm_co=
nnector *aconnector,
> >               }
> >       }
> >
> > -     aconnector->freesync_vid_base =3D *m_pref;
> > +     drm_mode_copy(&aconnector->freesync_vid_base, m_pref);
> >       return m_pref;
> >  }
> >
> > @@ -6432,8 +6432,8 @@ create_stream_for_sink(struct amdgpu_dm_connector=
 *aconnector,
> >               recalculate_timing =3D is_freesync_video_mode(&mode, acon=
nector);
> >               if (recalculate_timing) {
> >                       freesync_mode =3D get_highest_refresh_rate_mode(a=
connector, false);
> > -                     saved_mode =3D mode;
> > -                     mode =3D *freesync_mode;
> > +                     drm_mode_copy(&saved_mode, &mode);
> > +                     drm_mode_copy(&mode, freesync_mode);
> >               } else {
> >                       decide_crtc_timing_for_drm_display_mode(
> >                               &mode, preferred_mode, scale);
>
