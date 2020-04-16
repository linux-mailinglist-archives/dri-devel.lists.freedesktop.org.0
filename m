Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530411ACECB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1546E32A;
	Thu, 16 Apr 2020 17:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE446E32C;
 Thu, 16 Apr 2020 17:36:50 +0000 (UTC)
IronPort-SDR: Gr7luhNjj8C+v2345aDJDBLZKFa1T4O9oHMqhJqCcClVX30jsNkRsjhmQslSSja+5sLJLKVVI0
 0hlyX0dvhwCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 10:36:49 -0700
IronPort-SDR: bYcMqP7HHeFuyMHxyG2Cy/+9vdE3DmC7lIFJbp3qnzvpgt9XWYaneT880u5jTfPqaavYiHzmuL
 OPHinUX3Hxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; d="scan'208";a="364065411"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 16 Apr 2020 10:36:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Apr 2020 20:36:45 +0300
Date: Thu, 16 Apr 2020 20:36:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200416173645.GK6112@intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
 <20200416170814.GI4796@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416170814.GI4796@pendragon.ideasonboard.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 08:08:14PM +0300, Laurent Pinchart wrote:
> Hi Ville,
> =

> Thank you for the patch.
> =

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
> > =

> > Looking back at the original discussion on this change we pretty much
> > just did it in the name of skipping a few extra pointer dereferences.
> > However, I've decided not to revert the whole thing in case someone
> > has since started to depend on these changes. None of the other checks
> > are relevant for i915 anyways.
> =

> Do display controller usually support changing modifiers for page flips
> ? I understand from the information about that i915 does, but is that
> usual ? Could there be drivers that really on this check to reject
> modifier changes, and that aren't prepared to handle them if they are
> not rejected by the core ? I'm not opposed to this change, but I'd like
> to carefully consider the fallout.

After a bit of grepping I can't actually see any other driver providing
a .get_format_info() hook. So looks like there is no change in behaviour
for any other driver. Based on that we could even do a full revert, but
meh.

> =

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
> =

> -- =

> Regards,
> =

> Laurent Pinchart

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
