Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E41AE4BD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 20:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15A26E4B3;
	Fri, 17 Apr 2020 18:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CC86E4B3;
 Fri, 17 Apr 2020 18:28:38 +0000 (UTC)
IronPort-SDR: g6cw2N+c1wx3khx9fyvFxpFR4kZmCfbLHfXkwlvDJEUKTQjj0djNihfZjcs4ta96mjO8in+xuU
 ZObI/ItjL9VQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 11:28:38 -0700
IronPort-SDR: V9FV1aztj3YODmKpHxiQG+8utpy9tAVRywC/JHnthL/wcvoiaOSryR5C+MH4l6QITld3joGzUx
 BxTPKP26LMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="244777861"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 17 Apr 2020 11:28:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Apr 2020 21:28:34 +0300
Date: Fri, 17 Apr 2020 21:28:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200417182834.GS6112@intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
 <20200417152310.GQ3456981@phenom.ffwll.local>
 <20200417154313.GO6112@intel.com>
 <CAKMK7uGBWyPtm0dva=Ndk6xJx7nUKJ20kn8S37iFB8s85WWmdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGBWyPtm0dva=Ndk6xJx7nUKJ20kn8S37iFB8s85WWmdw@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: stable <stable@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 08:10:26PM +0200, Daniel Vetter wrote:
> On Fri, Apr 17, 2020 at 5:43 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Apr 17, 2020 at 05:23:10PM +0200, Daniel Vetter wrote:
> > > On Thu, Apr 16, 2020 at 08:04:20PM +0300, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > >
> > > > Revert back to comparing fb->format->format instead fb->format for =
the
> > > > page flip ioctl. This check was originally only here to disallow pi=
xel
> > > > format changes, but when we changed it to do the pointer comparison
> > > > we potentially started to reject some (but definitely not all) modi=
fier
> > > > changes as well. In fact the current behaviour depends on whether t=
he
> > > > driver overrides the format info for a specific format+modifier com=
bo.
> > > > Eg. on i915 this now rejects compression vs. no compression changes=
 but
> > > > does not reject any other tiling changes. That's just inconsistent
> > > > nonsense.
> > > >
> > > > The main reason we have to go back to the old behaviour is to fix p=
age
> > > > flipping with Xorg. At some point Xorg got its atomic rights taken =
away
> > > > and since then we can't page flip between compressed and non-compre=
ssed
> > > > fbs on i915. Currently we get no page flipping for any games pretty=
 much
> > > > since Mesa likes to use compressed buffers. Not sure how compositor=
s are
> > > > working around this (don't use one myself). I guess they must be do=
ing
> > > > something to get non-compressed buffers instead. Either that or
> > > > somehow no one noticed the tearing from the blit fallback.
> > >
> > > Mesa only uses compressed buffers if you enable modifiers, and there'=
s a
> > > _loooooooooooot_ more that needs to be fixed in Xorg to enable that f=
or
> > > real. Like real atomic support.
> >
> > Why would you need atomic for modifiers? Xorg doesn't even have
> > any sensible framework for atomic and I suspect it never will.
> =

> Frankly if no one cares about atomic in X I don't think we should do
> work-arounds for lack of atomic in X.
> =

> > > Without modifiers all you get is X tiling,
> > > and that works just fine.
> > >
> > > Which would also fix this issue here you're papering over.
> > >
> > > So if this is the entire reason for this, I'm inclined to not do this.
> > > Current Xorg is toast wrt modifiers, that's not news.
> >
> > Works just fine. Also pretty sure modifiers are even enabled by
> > default now in modesetting.
> =

> Y/CSS is harder to scan out, you need to verify with TEST_ONLY whether
> it works. Otherwise good chances for some oddball black screens on
> configurations that worked before. Which is why all non-atomic
> compositors reverted modifiers by default again.

Y alone is hard to scanout also, and yet we do nothing to reject that.
It's just an inconsistent mess.

If we really want to keep this check then we should rewrite it
to be explicit:

if (old_fb->format->format !=3D new_fb->format->format ||
    is_ccs(old_fb->modifier) !=3D is_ccs(new_fb->modifier))
    return -EINVAL;

Now it's just a random thing that may even stop doing what it's
currently doing if anyone touches their .get_format_info()
implementation.

> =

> > And as stated the current check doesn't have consistent behaviour
> > anyway. You can still flip between different modifiers as long a the
> > driver doesn't override .get_format_info() for one of them. The *only*
> > case where that happens is CCS on i915. There is no valid reason to
> > special case that one.
> =

> The thing is, you need atomic to make CCS work reliably enough for
> compositors and distros to dare enabling it by default.

If it's not enabled by default then there is no harm in letting people
explicitly enable it and get better performance.

> CCS flipping
> works with atomic. I really see no point in baking this in with as
> uapi.

It's just going back to the original intention of the check.
Heck, the debug message doesn't even match what it's doing now.

> Just fix Xorg.

Be serious. No one is going to rewrite all the randr code to be atomic.

> -Daniel
> =

> >
> > > -Daniel
> > >
> > > >
> > > > Looking back at the original discussion on this change we pretty mu=
ch
> > > > just did it in the name of skipping a few extra pointer dereference=
s.
> > > > However, I've decided not to revert the whole thing in case someone
> > > > has since started to depend on these changes. None of the other che=
cks
> > > > are relevant for i915 anyways.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Fixes: dbd4d5761e1f ("drm: Replace 'format->format' comparisons to =
just 'format' comparisons")
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plan=
e.c
> > > > index d6ad60ab0d38..f2ca5315f23b 100644
> > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > @@ -1153,7 +1153,7 @@ int drm_mode_page_flip_ioctl(struct drm_devic=
e *dev,
> > > >     if (ret)
> > > >             goto out;
> > > >
> > > > -   if (old_fb->format !=3D fb->format) {
> > > > +   if (old_fb->format->format !=3D fb->format->format) {
> > > >             DRM_DEBUG_KMS("Page flip is not allowed to change frame=
 buffer format.\n");
> > > >             ret =3D -EINVAL;
> > > >             goto out;
> > > > --
> > > > 2.24.1
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
> =

> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
