Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEA1AE163
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055D16EC47;
	Fri, 17 Apr 2020 15:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828F6EC4E;
 Fri, 17 Apr 2020 15:43:19 +0000 (UTC)
IronPort-SDR: xVOmT3jIEUeITTS4DL6pxDe4/36jG7LfZq+iQOmdMJ0Hu7OBX/K/fsLTzMn2oIoJchpTNHWUfe
 5kHzwD4i062A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 08:43:18 -0700
IronPort-SDR: WcLv1QNWJl57GpWwDOAQ9iRfQku3rP52s0EbmCy4dQKp4LuHb7WplwbGupvBzYE8a8Inajk0zA
 V1umjrf8bp8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="244737378"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 17 Apr 2020 08:43:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Apr 2020 18:43:13 +0300
Date: Fri, 17 Apr 2020 18:43:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200417154313.GO6112@intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
 <20200417152310.GQ3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417152310.GQ3456981@phenom.ffwll.local>
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
Cc: stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 05:23:10PM +0200, Daniel Vetter wrote:
> On Thu, Apr 16, 2020 at 08:04:20PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Revert back to comparing fb->format->format instead fb->format for the
> > page flip ioctl. This check was originally only here to disallow pixel
> > format changes, but when we changed it to do the pointer comparison
> > we potentially started to reject some (but definitely not all) modifier
> > changes as well. In fact the current behaviour depends on whether the
> > driver overrides the format info for a specific format+modifier combo.
> > Eg. on i915 this now rejects compression vs. no compression changes but
> > does not reject any other tiling changes. That's just inconsistent
> > nonsense.
> > =

> > The main reason we have to go back to the old behaviour is to fix page
> > flipping with Xorg. At some point Xorg got its atomic rights taken away
> > and since then we can't page flip between compressed and non-compressed
> > fbs on i915. Currently we get no page flipping for any games pretty much
> > since Mesa likes to use compressed buffers. Not sure how compositors are
> > working around this (don't use one myself). I guess they must be doing
> > something to get non-compressed buffers instead. Either that or
> > somehow no one noticed the tearing from the blit fallback.
> =

> Mesa only uses compressed buffers if you enable modifiers, and there's a
> _loooooooooooot_ more that needs to be fixed in Xorg to enable that for
> real. Like real atomic support.

Why would you need atomic for modifiers? Xorg doesn't even have
any sensible framework for atomic and I suspect it never will.

> Without modifiers all you get is X tiling,
> and that works just fine.
> =

> Which would also fix this issue here you're papering over.
> =

> So if this is the entire reason for this, I'm inclined to not do this.
> Current Xorg is toast wrt modifiers, that's not news.

Works just fine. Also pretty sure modifiers are even enabled by
default now in modesetting.

And as stated the current check doesn't have consistent behaviour
anyway. You can still flip between different modifiers as long a the
driver doesn't override .get_format_info() for one of them. The *only*
case where that happens is CCS on i915. There is no valid reason to
special case that one.

> -Daniel
> =

> > =

> > Looking back at the original discussion on this change we pretty much
> > just did it in the name of skipping a few extra pointer dereferences.
> > However, I've decided not to revert the whole thing in case someone
> > has since started to depend on these changes. None of the other checks
> > are relevant for i915 anyways.
> > =

> > Cc: stable@vger.kernel.org
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Fixes: dbd4d5761e1f ("drm: Replace 'format->format' comparisons to just=
 'format' comparisons")
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index d6ad60ab0d38..f2ca5315f23b 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -1153,7 +1153,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *d=
ev,
> >  	if (ret)
> >  		goto out;
> >  =

> > -	if (old_fb->format !=3D fb->format) {
> > +	if (old_fb->format->format !=3D fb->format->format) {
> >  		DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer forma=
t.\n");
> >  		ret =3D -EINVAL;
> >  		goto out;
> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
