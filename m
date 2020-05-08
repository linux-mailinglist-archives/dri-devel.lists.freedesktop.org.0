Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045001CB567
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 19:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB776EB3C;
	Fri,  8 May 2020 17:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE066EB3C;
 Fri,  8 May 2020 17:09:43 +0000 (UTC)
IronPort-SDR: /+dD9hdiz6LtX7Zj1is7Tnq94O19KxYwxewcXc1MmVxnfiuZDChxmyqFBSrHU+uU0REzmHYKqO
 x66wFciOZY4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 10:09:43 -0700
IronPort-SDR: VfaqUptVu/bVBogD4N8hx8N4u1Y1eU06bAepQECQZGaK7snz3O7sio9UysfzZw6+hNMBL28qkY
 X1pmCf5piARA==
X-IronPort-AV: E=Sophos;i="5.73,368,1583222400"; d="scan'208";a="261058312"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 10:09:42 -0700
Date: Fri, 8 May 2020 10:08:40 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200508170840.GE1219060@intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
 <20200417152310.GQ3456981@phenom.ffwll.local>
 <20200417154313.GO6112@intel.com>
 <CAKMK7uGBWyPtm0dva=Ndk6xJx7nUKJ20kn8S37iFB8s85WWmdw@mail.gmail.com>
 <20200417182834.GS6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417182834.GS6112@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 09:28:34PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Apr 17, 2020 at 08:10:26PM +0200, Daniel Vetter wrote:
> > On Fri, Apr 17, 2020 at 5:43 PM Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Apr 17, 2020 at 05:23:10PM +0200, Daniel Vetter wrote:
> > > > On Thu, Apr 16, 2020 at 08:04:20PM +0300, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > >
> > > > > Revert back to comparing fb->format->format instead fb->format fo=
r the
> > > > > page flip ioctl. This check was originally only here to disallow =
pixel
> > > > > format changes, but when we changed it to do the pointer comparis=
on
> > > > > we potentially started to reject some (but definitely not all) mo=
difier
> > > > > changes as well. In fact the current behaviour depends on whether=
 the
> > > > > driver overrides the format info for a specific format+modifier c=
ombo.
> > > > > Eg. on i915 this now rejects compression vs. no compression chang=
es but
> > > > > does not reject any other tiling changes. That's just inconsistent
> > > > > nonsense.
> > > > >
> > > > > The main reason we have to go back to the old behaviour is to fix=
 page
> > > > > flipping with Xorg. At some point Xorg got its atomic rights take=
n away
> > > > > and since then we can't page flip between compressed and non-comp=
ressed
> > > > > fbs on i915. Currently we get no page flipping for any games pret=
ty much
> > > > > since Mesa likes to use compressed buffers. Not sure how composit=
ors are
> > > > > working around this (don't use one myself). I guess they must be =
doing
> > > > > something to get non-compressed buffers instead. Either that or
> > > > > somehow no one noticed the tearing from the blit fallback.
> > > >
> > > > Mesa only uses compressed buffers if you enable modifiers, and ther=
e's a
> > > > _loooooooooooot_ more that needs to be fixed in Xorg to enable that=
 for
> > > > real. Like real atomic support.
> > >
> > > Why would you need atomic for modifiers? Xorg doesn't even have
> > > any sensible framework for atomic and I suspect it never will.
> > =

> > Frankly if no one cares about atomic in X I don't think we should do
> > work-arounds for lack of atomic in X.
> > =

> > > > Without modifiers all you get is X tiling,
> > > > and that works just fine.
> > > >
> > > > Which would also fix this issue here you're papering over.
> > > >
> > > > So if this is the entire reason for this, I'm inclined to not do th=
is.
> > > > Current Xorg is toast wrt modifiers, that's not news.
> > >
> > > Works just fine. Also pretty sure modifiers are even enabled by
> > > default now in modesetting.
> > =

> > Y/CSS is harder to scan out, you need to verify with TEST_ONLY whether
> > it works. Otherwise good chances for some oddball black screens on
> > configurations that worked before. Which is why all non-atomic
> > compositors reverted modifiers by default again.
> =

> Y alone is hard to scanout also, and yet we do nothing to reject that.
> It's just an inconsistent mess.
> =

> If we really want to keep this check then we should rewrite it
> to be explicit:
> =

> if (old_fb->format->format !=3D new_fb->format->format ||
>     is_ccs(old_fb->modifier) !=3D is_ccs(new_fb->modifier))
>     return -EINVAL;
> =

> Now it's just a random thing that may even stop doing what it's
> currently doing if anyone touches their .get_format_info()
> implementation.
> =

> > =

> > > And as stated the current check doesn't have consistent behaviour
> > > anyway. You can still flip between different modifiers as long a the
> > > driver doesn't override .get_format_info() for one of them. The *only*
> > > case where that happens is CCS on i915. There is no valid reason to
> > > special case that one.
> > =

> > The thing is, you need atomic to make CCS work reliably enough for
> > compositors and distros to dare enabling it by default.
> =

> If it's not enabled by default then there is no harm in letting people
> explicitly enable it and get better performance.
> =

> > CCS flipping
> > works with atomic. I really see no point in baking this in with as
> > uapi.
> =

> It's just going back to the original intention of the check.
> Heck, the debug message doesn't even match what it's doing now.
> =

> > Just fix Xorg.
> =

> Be serious. No one is going to rewrite all the randr code to be atomic.

I fully understand Daniel's concern here, but I also believe this won't be
done so soon at least. Meanwhile would it be acceptable to have a comment
with the code /* XXX: Xorg blah... */ or /* FIXME: After Xorg blah.. */
?

> =

> > -Daniel
> > =

> > >
> > > > -Daniel
> > > >
> > > > >
> > > > > Looking back at the original discussion on this change we pretty =
much
> > > > > just did it in the name of skipping a few extra pointer dereferen=
ces.
> > > > > However, I've decided not to revert the whole thing in case someo=
ne
> > > > > has since started to depend on these changes. None of the other c=
hecks
> > > > > are relevant for i915 anyways.
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Fixes: dbd4d5761e1f ("drm: Replace 'format->format' comparisons t=
o just 'format' comparisons")
> > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_pl=
ane.c
> > > > > index d6ad60ab0d38..f2ca5315f23b 100644
> > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > @@ -1153,7 +1153,7 @@ int drm_mode_page_flip_ioctl(struct drm_dev=
ice *dev,
> > > > >     if (ret)
> > > > >             goto out;
> > > > >
> > > > > -   if (old_fb->format !=3D fb->format) {
> > > > > +   if (old_fb->format->format !=3D fb->format->format) {
> > > > >             DRM_DEBUG_KMS("Page flip is not allowed to change fra=
me buffer format.\n");
> > > > >             ret =3D -EINVAL;
> > > > >             goto out;
> > > > > --
> > > > > 2.24.1
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > >
> > > --
> > > Ville Syrj=E4l=E4
> > > Intel
> > =

> > =

> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
