Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E957C2DCF93
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28D86E247;
	Thu, 17 Dec 2020 10:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627B6E247
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:37:58 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608201475;
 bh=d7Gy0zj37hSMKUVN1d6nJ1g/f7BFtutCjep99HMOhkI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DGEbIY9f7a8ahJiWz8sud8aQUUhIc7K/1gg/he5QERHuYxhG2Z2ZTG4RNs9qgPmqC
 OyrTqnYBTCsnEXcVPuuKF7o4MBvvDpXpNA0RcVHVKhWfvQ3sxkKUjGvUX+WJo0X05T
 +V5/FmjJ/1eOiFvTVnYllIzxcGME+h7VfGkLAkRNSJCtRfNTDk6Od2zC1bwe/IZwDV
 7M3Zz614unyWTz9Uk1GxaG12qOtC0s3YYIAfIZRhceAgkVEhoIq36n/UjQGcvOZEd+
 nQVCR/FjfsoxVvKqx9zTh6IPjc62uNw6OzEH/H0WgPRkRgYbri/u1nj97uy3FJ3O0l
 2H4aCmi0klARw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 7/8] drm/doc: fix drm_plane_type docs
Message-ID: <co84HmvozNSpZ7qlBqqkMdcpXRupOTigvbWZJvGIdtKH4Fr6GlF8-Np3s15jhMLSqL_cANTarQaL-6ixnVZTmGa7pSIfn2u86oaqEE3ww7U=@emersion.fr>
In-Reply-To: <X9p51qbZ6il8DH5T@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-8-contact@emersion.fr>
 <X9p51qbZ6il8DH5T@phenom.ffwll.local>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 16th, 2020 at 10:19 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Dec 16, 2020 at 09:22:21PM +0100, Simon Ser wrote:
> > The docs for enum drm_plane_type mention legacy IOCTLs, however the
> > plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
> > cursor fields are. Add a small paragraph to reference these.
> >
> > Instead, document expectations for primary and cursor planes for
> > non-legacy userspace. Note that these docs are for driver developers,
> > not userspace developers, so internal kernel APIs are mentionned.
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  include/drm/drm_plane.h | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index 1d82b264e5e4..94fdd0c68450 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -538,10 +538,14 @@ struct drm_plane_funcs {
> >   *
> >   * For compatibility with legacy userspace, only overlay planes are made
> >   * available to userspace by default. Userspace clients may set the
> > - * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> > + * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> >   * wish to receive a universal plane list containing all plane types. See also
> >   * drm_for_each_legacy_plane().
> >   *
> > + * In addition to setting each plane's type, drivers need to setup the
> > + * &drm_crtc.primary and optionally &drm_crtc.cursor for legacy IOCTLs. See
>
> 				insert "pointers" here ^ for readability.
>
> > + * drm_crtc_init_with_planes().
> > + *
> >   * WARNING: The values of this enum is UABI since they're exposed in the "type"
> >   * property.
> >   */
> > @@ -557,19 +561,20 @@ enum drm_plane_type {
> >  	/**
> >  	 * @DRM_PLANE_TYPE_PRIMARY:
> >  	 *
> > -	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
> > -	 * are the planes operated upon by CRTC modesetting and flipping
> > -	 * operations described in the &drm_crtc_funcs.page_flip and
> > -	 * &drm_crtc_funcs.set_config hooks.
>
> I think we should keep the notice which legacy entry hooks implicitly
> operate on the primary plane. Not sure why you're removing the above
> sentence. Maybe improve it by adding "See also &drm_crtc.primary." for
> more context?

I intentionally removed it, because setting the plane type will not magically
make it used for legacy IOCTLs. The previous version documented the legacy
IOCTLs behaviour in the primary and cursor type docs. That was misleading
because only the drm_crtc.{primary,cursor} pointers make it so a plane is used
for legacy IOCTLs, not the type.

This patch does keep a reference to drm_crtc.{primary,cursor}, in the paragraph
right above. Clicking on the reference will explain in detail which legacy
IOCTLs are affected. I don't think repeating the paragraph again in the primary
and cursor type docs is necessary.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
