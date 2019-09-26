Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02441BEDC9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A166C6EE73;
	Thu, 26 Sep 2019 08:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086FE6EE73
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:49:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 2C9BB28A416
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/ioctl: Add a ioctl to label GEM objects
Date: Thu, 26 Sep 2019 10:49:08 +0200
Message-ID: <1894757.Cb9dXLQTjU@solembum>
Organization: Collabora Ltd.
In-Reply-To: <74b4cb8b-1bce-19d9-1022-aa5ed542e10c@suse.de>
References: <20190919125321.22880-1-rohan.garg@collabora.com>
 <74b4cb8b-1bce-19d9-1022-aa5ed542e10c@suse.de>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1508552229=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1508552229==
Content-Type: multipart/signed; boundary="nextPart2608882.T8YSptNoMx"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2608882.T8YSptNoMx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi

On jueves, 19 de septiembre de 2019 16:02:57 (CEST) Thomas Zimmermann wrote:
> Hi
> 
> Am 19.09.19 um 14:53 schrieb Rohan Garg:
> > DRM_IOCTL_BO_SET_LABEL lets you label GEM objects, making it
> > easier to debug issues in userspace applications.
> > 
> > Changes in v2:
> >   - Hoist the IOCTL up into the drm_driver framework
> > 
> > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> > ---
> > 
> >  drivers/gpu/drm/drm_gem.c      | 64 ++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_internal.h |  4 +++
> >  drivers/gpu/drm/drm_ioctl.c    |  1 +
> >  include/drm/drm_drv.h          | 18 ++++++++++
> >  include/drm/drm_gem.h          |  7 ++++
> >  include/uapi/drm/drm.h         | 20 +++++++++++
> >  6 files changed, 114 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 6854f5867d51..785ac561619a 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -941,6 +941,65 @@ drm_gem_release(struct drm_device *dev, struct
> > drm_file *file_private)> 
> >  	idr_destroy(&file_private->object_idr);
> >  
> >  }
> > 
> > +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> > +		       struct drm_file *file_priv)
> > +{
> > +	struct drm_label_object *args = data;
> > +
> > +	if (!args->len || !args->name)
> > +		return -EINVAL;
> > +
> > +	if (dev->driver->label)
> > +		return dev->driver->label(dev, args, file_priv);
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +/**
> > + * drm_gem_label - label a given GEM object
> > + * @dev: drm_device for the associated GEM object
> > + * @data: drm_label_bo struct with a label, label length and any relevant
> > flags + * @file_private: drm file-private structure to clean up
> > + */
> > +
> > +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object
> > *args, struct drm_file *file_priv)
> I'd like to set labels for internal GEM objects. Could you split off the
> object update code into something that is easily callable from within
> drivers? Something like
> 
>   // called by ioctl
>   int drm_gem_object_adopt_label(struct drm_gem_object *gem,
>         char *label)
>   {
>         // your object update code goes here
>   }
> 
>   // called by drivers
>   int drm_gem_object_set_label(struct drm_gem_object *gem,
>         const char *label)
>   {
> 	char* new_label = strdup(label)
> 	return drm_gem_object_adopt_label(gem, new_label);
>   }
> 
> 
> We have debugfs support for TTM-based GEM objects at [1]. I think the
> label would be a welcome addition to the output.
> 

Ack, I'll address this in v3.

Cheers
Rohan Garg
--nextPart2608882.T8YSptNoMx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl2Me4QACgkQpwS9TvJn
IJRaWQ//UHZVT1YriJGulZ2hKsSDFLJXS1IrHd4Qr3wDTiF9jquJyR07jZv7//e3
JeGry/QTUsEXUXCU4Z2GpYvsAFyfx2vqzDY/HLW2OCm/FIs6YiPBN5Bz6YgkqEzq
UOogXKvwt2+TvZ7Gf1ApRLsozaR/+GbhC4eW4WMrf8AJVp42p6Q4VUpf049vehYG
khexdFkl3Bohvb3dTeMBttVrFuxmTNjFNAMjpIVTGJ94sJiDjrRieA/HjY7cBT1W
uvcEmUa9jD8PdsmxbQRmKXBGohMI3ox9l+nu1q/xUOZMCz5eKa1cENCXjqd3xeMn
o94sGDw/XuVA1jjO6dU2zkhQna/IEoAIgTG8aCjhFX92n5vPPuSUo2TIT8qkQzz+
pBtOdUzzIjnO9DeqoPOEQVTrD74yNM3Omn4aqtrQLZj3u9KH4Hjh6DqWGf6fH+04
qjMAEqh5siqFHUmOkfUXqqZx2rCqRMKIwCipQ+rwpgviT2vjg0G6MmjpNHODTuG2
uXGpfS4rP1R2EsBQS0TXhh1neg6Y1nZjOabmkuaLsT308k6V1q6SuDOPt9jwxBie
qgBXZzhHhezGT5y983xokV1im61nJ8Fz4W+D5kPNvEHYM8oe0fPztK1O11EMqnht
Q4b1glh6nbxZmZEPUhFPJG5b5cMBpq17XxcPVLFF70bjU9SKvp8=
=xVIS
-----END PGP SIGNATURE-----

--nextPart2608882.T8YSptNoMx--




--===============1508552229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1508552229==--



