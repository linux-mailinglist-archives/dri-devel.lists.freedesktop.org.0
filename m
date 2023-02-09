Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998876907BD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99910E9D3;
	Thu,  9 Feb 2023 11:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BFF10E9CE;
 Thu,  9 Feb 2023 11:51:10 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 617F466020BA;
 Thu,  9 Feb 2023 11:51:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675943468;
 bh=gEcYXKCtlo6yQqNyxWeotIj7uH3rY7t8jNu+XMLrCEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OxFBkh4bINEoSBBmZtKh3H9MQIy9+ce2V2Q/lhCJQm2ik6v3OtQZQf2dV/UL0dQTZ
 zmAVU4rahNyEz0/P+q8mukbn7CBDmm+NhwwIn8ZuT0wsvID+5pq7R9MkdKjmKeZn7N
 h/1PLjEXma88YRIsRM00FrQg1iE/yYrQgVTWiJpOdtXqNlzhScmUC0DPLRP+70FsKM
 I5AiuWk8F/o1pgWLb+GrCVU8TLRqY7hib+qLrIdp5H8NvUlk87SEf/LXutZU5lE7Wi
 /nwaDYhALdz879QOkolj7FE6mw2emWpJOQbFx1C24cgjRYXbZ+VBWBfgMF+g5b7E2i
 73q/OZ6yPhYSA==
Date: Thu, 9 Feb 2023 13:51:05 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230209135105.4137872c.pekka.paalanen@collabora.com>
In-Reply-To: <Y+QRSH3kLD4Xrktc@intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
 <Y+OdtR78JnQOTj38@intel.com> <Y+QRSH3kLD4Xrktc@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Feb 2023 23:16:56 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Feb 08, 2023 at 03:03:49PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Wed, Feb 08, 2023 at 02:13:12PM +0200, Pekka Paalanen wrote: =20
> > > On Wed,  8 Feb 2023 06:09:10 +0200
> > > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > >  =20
> > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > >=20
> > > > Add a new immutable plane property by which a plane can advertise
> > > > a handful of recommended plane sizes. This would be mostly exposed
> > > > by cursor planes as a slightly more capable replacement for
> > > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > > a one size fits all limit for the whole device.
> > > >=20
> > > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > > size via the cursor size caps. But always using the max sized
> > > > cursor can waste a surprising amount of power, so a better
> > > > stragey is desirable.
> > > >=20
> > > > Most other drivers don't specify any cursor size at all, in
> > > > which case the ioctl code just claims that 64x64 is a great
> > > > choice. Whether that is actually true is debatable.
> > > >=20
> > > > A poll of various compositor developers informs us that
> > > > blindly probing with setcursor/atomic ioctl to determine
> > > > suitable cursor sizes is not acceptable, thus the
> > > > introduction of the new property to supplant the cursor
> > > > size caps. The compositor will now be free to select a
> > > > more optimal cursor size from the short list of options.
> > > >=20
> > > > Note that the reported sizes (either via the property or the
> > > > caps) make no claims about things such as plane scaling. So
> > > > these things should only really be consulted for simple
> > > > "cursor like" use cases.
> > > >=20
> > > > Cc: Simon Ser <contact@emersion.fr>
> > > > Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om>
> > > > ---
> > > >  drivers/gpu/drm/drm_mode_config.c |  7 +++++++
> > > >  drivers/gpu/drm/drm_plane.c       | 33 +++++++++++++++++++++++++++=
++++
> > > >  include/drm/drm_mode_config.h     |  5 +++++
> > > >  include/drm/drm_plane.h           |  4 ++++
> > > >  include/uapi/drm/drm_mode.h       |  5 +++++
> > > >  5 files changed, 54 insertions(+)

...

> > > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mod=
e.h
> > > > index 46becedf5b2f..4f0551d7f481 100644
> > > > --- a/include/uapi/drm/drm_mode.h
> > > > +++ b/include/uapi/drm/drm_mode.h
> > > > @@ -849,6 +849,11 @@ struct drm_color_lut {
> > > >  	__u16 reserved;
> > > >  };
> > > > =20
> > > > +struct drm_plane_size_hint {
> > > > +	__u16 width;
> > > > +	__u16 height;
> > > > +}; =20
> > >=20
> > > Hi Ville,
> > >=20
> > > uAPI documentation is missing.
> > >=20
> > > When there is just a single recommended size listed, userspace has it
> > > easy: allocate a pair of DRM dumb buffers for each active CRTC, do
> > > atomic test commits with those, and if the test succeeds, copy in the
> > > pixels and fill the padding.
> > >=20
> > > What if we have multiple or a huge number of possible sizes? Probably
> > > for each KMS reconfiguration cycle (which could be up to every refresh
> > > cycle) userspace would need to allocate a new dumb buffer to have the
> > > right size, and then test. Is that something we can actually afford to
> > > do? I don't know. =20
> >=20
> > Why would you allocate multiple buffers? Just allocate one
> > with the max size and then you can reuse it at any smaller
> > size as needed. =20

We also need to double-buffer.

> Unfortunately the use of gbm here means the stride would
> be wrong for the smaller sizes. So I guess a different
> buffer for each size is what you need to do. Unless you
> can just ignore the original stride when filling the buffer.

Why would the stride be wrong? AddFB2 carries explicit stride.

You mean hardware would likely not accept the row padding?

When filling the buffer, we can simply fill the real buffer size.
That's what we already do to pad smaller surfaces up to the cursor size.

So essentially we would just re-do AddFB2 with any smaller size while
keeping the real stride. That's a good idea.

Maybe we could refine this so that userspace uses the stride and height
implied by the caps for allocation, and then use the exact cursor image
size for AddFB2? And have drivers pick any size between those two they
can use. The kernel would need the userspace to promise that the
padding is always zero-initialized, so the driver can simply scan out
any area of the buffer it needs.

Then we don't need SIZE_HINTS.


Thanks,
pq
