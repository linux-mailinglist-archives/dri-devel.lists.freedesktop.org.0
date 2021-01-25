Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E63027F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 17:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27616E14C;
	Mon, 25 Jan 2021 16:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4F46E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 16:34:27 +0000 (UTC)
IronPort-SDR: hrXIyNd9BGkYRW4Uhwpi+P2lilmj53MQ0rdT7DP2HwWGHnW3YexFI4RoFl8klcAa1mB/bT96KW
 C3Laor57sfNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="158934658"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="158934658"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 08:34:27 -0800
IronPort-SDR: FTbaeyolMwytK8+02RgKDf3NV0yAXNpZXSpmOIIIVHHIsdFDVTRWIWTSxWOn0mKjaYak80Y+yQ
 EfMEYbq2BDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="429349640"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 25 Jan 2021 08:34:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Jan 2021 18:34:24 +0200
Date: Mon, 25 Jan 2021 18:34:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/simple-kms: Drop drm_simple_kms_format_mod_supported.
Message-ID: <YA7zEN70mvfRmKLK@intel.com>
References: <20210124204748.25234-1-mario.kleiner.de@gmail.com>
 <YA614iI5kHJMATye@intel.com>
 <CAEsyxyhspu5BfgVxfDkXBC1PM-m0+=iV7hUOO0Y2m+6APTm=gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyhspu5BfgVxfDkXBC1PM-m0+=iV7hUOO0Y2m+6APTm=gg@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 04:32:48PM +0100, Mario Kleiner wrote:
> On Mon, Jan 25, 2021 at 1:13 PM Ville Syrj=E4l=E4 <ville.syrjala@linux.in=
tel.com>
> wrote:
> =

> > On Sun, Jan 24, 2021 at 09:47:48PM +0100, Mario Kleiner wrote:
> > > The check was introduced to make sure that only the
> > > DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.
> > >
> > > However, if .format_mod_supported is not hooked up to
> > > drm_simple_kms_format_mod_supported then the core will
> > > simply validate modifiers against the format_modifiers
> > > list passed into drm_simple_display_pipe_init() or
> > > drm_universal_plane_init() and perform the same validation
> > > as drm_simple_kms_format_mod_supported() would have done.
> > >
> > > Additionally, if a kms driver / plane does not support
> > > modifiers, it will not reject fb updates with no modifiers/
> > > DRM_FORMAT_MOD_INVALID. This is important, because some
> > > simple drm drivers, e.g., pl111, pass NULL as format_modifiers
> > > list, so modifier support is disabled for these drivers,
> > > userspace would fall back to drmAddFB() without modifiers,
> > > and ergo the current drm_simple_kms_format_mod_supported()
> > > function would reject valid modifier-less fb's.
> > >
> > > So this should fix display on non-tinydrm drivers like
> > > pl111, and probably also for non-atomic clients?
> > >
> > > The Mesa vc4 gallium driver mentions pl111 as one possible
> > > display driver in render_only mode, so i assume this matters
> > > for some SoC's?
> > >
> > > The background for the patch that introduced this was to
> > > fix atomic modesetting in the X-Servers modesetting-ddx,
> > > but with atomic modesetting and format modifiers disabled
> > > in modesetting-ddx (and also current kernels when interacting
> > > with modesetting-ddx), i assume this should fix some panels.
> > >
> > > Note that i don't have any of the hw required for testing
> > > this, this is purely based on looking at the code, so this
> > > patch is only compile-tested.
> > >
> > > For more reference, this fix was motivated by some discussions
> > > around broken page-flipping on VideoCore6 / RaspberryPi 4
> > > with current Raspbian OS, so the experts may want to weigh
> > > in on that Mesa bug report as well, under the following link:
> > >
> > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/3601
> > >
> > > Fixes: dff906c3f91c ("drm/tinydrm: Advertise that we can do only
> > DRM_FORMAT_MOD_LINEAR.")
> > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > Cc: Eric Anholt <eric@anholt.net>
> > > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c
> > b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > index 743e57c1b44f..5f3e30553172 100644
> > > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > @@ -229,13 +229,6 @@ static void drm_simple_kms_plane_cleanup_fb(stru=
ct
> > drm_plane *plane,
> > >       pipe->funcs->cleanup_fb(pipe, state);
> > >  }
> > >
> > > -static bool drm_simple_kms_format_mod_supported(struct drm_plane *pl=
ane,
> > > -                                             uint32_t format,
> > > -                                             uint64_t modifier)
> > > -{
> > > -     return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> > > -}
> > > -
> > >  static const struct drm_plane_helper_funcs
> > drm_simple_kms_plane_helper_funcs =3D {
> > >       .prepare_fb =3D drm_simple_kms_plane_prepare_fb,
> > >       .cleanup_fb =3D drm_simple_kms_plane_cleanup_fb,
> > > @@ -250,7 +243,6 @@ static const struct drm_plane_funcs
> > drm_simple_kms_plane_funcs =3D {
> > >       .reset                  =3D drm_atomic_helper_plane_reset,
> > >       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_s=
tate,
> > >       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_sta=
te,
> > > -     .format_mod_supported   =3D drm_simple_kms_format_mod_supported,
> >
> > This will now cause also this driver to report a totally borked
> > IN_FORMATS blob.
> >
> > Would need this
> > https://patchwork.freedesktop.org/series/83018/
> >
> >
> The slight problem with that (see my comments in the linked Mesa bug
> report), is that at least one common userspace driver - modesetting-ddx -
> treat a lack of an IN_FORMATS blob not as "don't use modifiers for
> drm_framebuffers", but as "everything goes" -- Use every modifier and
> tiling format that the graphics driver exposes also for scanout buffers.
> I'm arguing in that bug report that modesetting-ddx shouldn't use atomic =
or
> modifiers at all, given how broken that driver is atm. in that area, so i=
'm
> not sure if my argument here is valid. Just saying that doing the "every
> modifier is valid for every format" in absence of  format_mod_supported()
> would probably be less harmful to some existing userspace. Ofc. then
> there's a reason why atomic gets rejected by the kernel for current
> modesetting-ddx...
> =

> I'm not sure if I'm arguing pro or contra your patch here btw. Just
> pointing out one possible victim if it were applied.

I have no idea how anything would get broken by it.

Currently:
- the broken IN_FORMAT blob says nothing is supported at all,
  so if someone consults it they won't be able to find a working
  pixel format
- if they ignore the broken IN_FORMAT blob then it doesn't matter
  if it's present or not.

I guess the only way somehting might be affected is if they just use
the presence of the IN_FORMATS blob as a hint for something but never
actually look at the contents.

> =

> but IIRC the bikeshed around that kinda suggested we should just
> > implement .format_mod_support() always. Can't quite recall the
> > details anymore.
> >
> >
> I see. But if .format_mod_supported() is always implemented, then we'd ne=
ed
> to handle the case modifier =3D=3D DRM_FORMAT_MOD_INVALID in the core or =
in
> each format_mod_supported() implementation, because currently iff this is
> hooked up, it gets always used, even if the user-space does not use
> modifiers. The X-Servers modesetting-ddx, e.g., does not use atomic or
> modifiers by default, and the linked Mesa bug report shows why - or at
> least why it shouldn't atm. I think none of the X drivers does.
> =

> The softer alternative solution instead of my patch would be to also acce=
pt
> modifier =3D=3D DRM_FORMAT_MOD_INVALID as valid for simple kms drivers.

DRM_FORMAT_MOD_INVALID is not a valid modifier.
What kind of broken code is using it?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
