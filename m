Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40A44AA99
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D3E6EAC2;
	Tue,  9 Nov 2021 09:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091A6EAC2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:29:57 +0000 (UTC)
Date: Tue, 09 Nov 2021 09:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636450195;
 bh=/JucvsG+2Uip2FHpv39gbX4OxJ6Tkg3ui7rdDzLp3hg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=i7Hu9chRgvwDN1/otDGNYob/gw2AVfIYbtDUt58hkKsUgE3AgL0lyCKrkAxGKLal7
 ajwjQ563RuCGNvgPXBkjIgJWnUG4V53ZJq5WlVqYJKmmO3PnzUzYjqQyXscOlrFK6Y
 jJM77ze0jNYX+OFiEyN90qrTaI3nauMkg7Mf587hU7fDC0UDHOSMzZAPpXwZ0qrvZU
 kiuFuYP5xk/IWAZfmsUZfJSlJP60xxLn4/SYPIcxyjGyfDpIuJzrR6Jk4BfDbp0RgF
 Zesf/rNMMWaUTuwAVibEbemwNkt0XScxPSyraiLQikYPwSHD0Tk+j+3mXsNSucimN0
 N6cgZlS+heUbQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <dGeG3QxOQ1QX1zh8rppvlkgIaYW-tP1fPJ_08FlKMZyl1l52qjBm7Aisp898z4wW-PmPfQ66gXNUTsfBG7sBvfF_QC13yaHXRdyxySfQDKg=@emersion.fr>
In-Reply-To: <YYo+UeTjGWU11+u6@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
 <YYo+UeTjGWU11+u6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, November 9th, 2021 at 10:24, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> On Tue, Nov 09, 2021 at 08:56:10AM +0000, Simon Ser wrote:
> > There are a few details specific to the GETFB2 IOCTL.
> >
> > It's not immediately clear how user-space should check for the
> > number of planes. Suggest using the pitches field.
> >
> > The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
> > So explicitly tell user-space to not look at it unless the flag is
> > set.
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  include/uapi/drm/drm.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 3b810b53ba8b..9809078b0f51 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -1096,6 +1096,22 @@ extern "C" {
> >  #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj=
_transfer)
> >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_=
syncobj_timeline_array)
> >
> > +/**
> > + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> > + *
> > + * This queries metadata about a framebuffer. User-space fills
> > + * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the res=
t of the
> > + * struct as the output.
> > + *
> > + * If the client is not DRM master and doesn't have &CAP_SYS_ADMIN,
> > + * &drm_mode_fb_cmd2.handles will be zeroed. Planes are valid until on=
e has a
> > + * zero &drm_mode_fb_cmd2.pitches -- this can be used to compute the n=
umber of
> > + * planes.
>
> Maybe explain that when actually importing the buffer userspace should
> look for non-zeor handles instead, since some drivers/formats leave a
> silly pitch value behind. Or at least I think that can happen. Just for
> additional robustness?

The IOCTL zeroes out the arrays at the start, so should be fine.

handles will all be zero if user-space is unprivileged, so can't use them t=
o
figure out the number of planes.

> > + *
> > + * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS wi=
ll be set
> > + * in &drm_mode_fb_cmd2.flags. Otherwise, &drm_mode_fb_cmd2.modifier h=
as
> > + * undefined contents.
>
> Uh is this true? We should always clear values to avoid accidental leaks
> and stuff.

See the commit message: the modifier array is zeroed, which means it's fill=
ed
with DRM_FORMAT_MOD_LINEAR instead of DRM_FORMAT_MOD_INVALID -- this as goo=
d as
undefined contents for me.

Since this is a pretty good footgun, maybe we should change this? But the d=
ocs
would still need to tell userspace to not look at the array because older
kernels will still exist.

> > + */
>
> I think kerneldoc for drm_mode_fb_cmd2 would be neat too, so we can
> document how pitch is supposed to work and all that stuff.

Agreed, maybe will take a stab at this once this one is merged.
