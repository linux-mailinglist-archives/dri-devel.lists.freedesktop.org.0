Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5B82C137
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132210E11A;
	Fri, 12 Jan 2024 13:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE210E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:58:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7935BB821C0;
 Fri, 12 Jan 2024 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84400C433C7;
 Fri, 12 Jan 2024 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705067884;
 bh=QJD2h98QYNh2Lt+yR/zYkXBkXbv9AmHZ/JuiqaxdMyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDHftBV75J5Ngo2CNBfS7nVJWwrnT8Dif/4PX4uHOUUcH8m5pNegMYsgGUPsww73c
 SdSBcKvv0JQ+PuMjxZZElmSK/tbw0A1Skxc8l6m674kIe6/QXg9IeU89m3f0547L2N
 xa/d3UaDt6eovzeRVffLe3ItOCsmThSTp6c4km/7eU5kgf+01AKaC2PGkPRStFJCui
 A1Ro9CMeSbOVdVn/+X7Z0W8uJ5e/f76w1ZOeMf/+PYE38syNlJwfiUyLMzjjG6MZEN
 TOlU195e6FHeBO3JUMgW8oTgPvopHNPzPUeMVG14JEs+ArRO2HRkRh8wvlat/IxQf9
 sCh0PeH5XS2/A==
Date: Fri, 12 Jan 2024 14:58:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Message-ID: <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
 <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dx7jbw5j4zmrh2br"
Content-Disposition: inline
In-Reply-To: <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 noralf@tronnes.org, tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dx7jbw5j4zmrh2br
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 02:44:57PM +0100, Daniel Vetter wrote:
> On Thu, Jan 04, 2024 at 05:00:50PM +0100, Jocelyn Falempe wrote:
> > Add support for the drm_panic module, which displays a user-friendly
> > message to the screen when a kernel panic occurs.
> >=20
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> >  drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index 7ce1c4617675..6dd2afee84d4 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -25,6 +25,7 @@
> >  #include <drm/drm_gem_shmem_helper.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_panic.h>
> >  #include <drm/drm_probe_helper.h>
> > =20
> >  #define DRIVER_NAME	"simpledrm"
> > @@ -985,6 +986,19 @@ static struct simpledrm_device *simpledrm_device_c=
reate(struct drm_driver *drv,
> >  	return sdev;
> >  }
> > =20
> > +static int simpledrm_get_scanout_buffer(struct drm_device *dev,
> > +					struct drm_scanout_buffer *sb)
> > +{
> > +	struct simpledrm_device *sdev =3D simpledrm_device_of_dev(dev);
>=20
> So I guess simpledrm is the reason why the get_scanout_buffer hook is at
> the device level and not at the plane level. Even from the few drivers you
> have in your series it seems very much the exception, so I'm not sure
> whether that's the best design.
>=20
> I guess we'll know when we see the plane iterator code with the right
> locking, whether it's ok to have that in driver hooks or it's better to
> pull it out into shared code.

Wouldn't the CRTC level be better than the planes?

Maxime

--dx7jbw5j4zmrh2br
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaFFaQAKCRDj7w1vZxhR
xdpfAP9BcoJ0mF7cF94TvaCjeIH6ml9OCImj8Ty/oDoaWqQBbwD6AsFl9/ups6V1
kJ/jbm8S9TmEpmw5iG610Z1pUnXOAgQ=
=2dIE
-----END PGP SIGNATURE-----

--dx7jbw5j4zmrh2br--
