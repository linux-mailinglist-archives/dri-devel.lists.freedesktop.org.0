Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DD8ADD33
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 07:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182D10FA8F;
	Tue, 23 Apr 2024 05:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pHoS7+PM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75940112316
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 05:46:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DB95CE0EF0;
 Tue, 23 Apr 2024 05:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB58C116B1;
 Tue, 23 Apr 2024 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713851162;
 bh=4m4S4iaNoFCD5VJ6S4cA667fbteVW4wdxQCTE6NM2CY=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=pHoS7+PMKebC1m2RzgTCKQO65bIg/+V/GP8DBkY6vKbBV+0pMb5XEUe6rmGzDRelI
 2HWt2UPYATZ+YLQjix77Pybemb0d7i4p1gP+uioryjVcAT9TYF8mPWCcmnq9pKI8dC
 KBjsV3ZfGIcyeVwjymzhWNk37jDugEQQ/stvvctlxSTJAWVIQVhDRclprnN8IkuL40
 U22tMNS5+1fXvFKoEyakjetMFZ/M1zYiB/6jilNduio/EyzHCiGwro54+mru3aPO2k
 XWgjGYuHYbMhf9HG6V71VboQIYJfCxwuTVBgbKj8/oO6T2HRjuOYWX6gO+gs2zjq8H
 Vf45davhLmpcA==
Date: Tue, 23 Apr 2024 14:45:58 +0900
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 soc@kernel.org
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
Message-ID: <ZidLFpREqwKd9FHK@finisterre.sirena.org.uk>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
 <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ww8fNriCpgA4t3ar"
Content-Disposition: inline
In-Reply-To: <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
X-Cookie: TANSTAAFL
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ww8fNriCpgA4t3ar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 04:43:46PM +0100, Mark Brown wrote:
> On Wed, Mar 27, 2024 at 11:57:02AM +0100, Maxime Ripard wrote:
>=20
> > DRM_DW_HDMI has a number of dependencies that might not be enabled.
> > However, drivers were used to selecting it while not enforcing the
> > DRM_DW_HDMI dependencies.
> >=20
> > This could result in Kconfig warnings (and further build breakages) such
> > as:
> >=20
> >   Kconfig warnings: (for reference only)
> >      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
> >      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_BRIDGE [=3Dy=
] && DRM_DISPLAY_HELPER [=3Dn]
> >      Selected by [m]:
> >      - DRM_SUN8I_DW_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM_SUN4I [=3Dm]

> This has landed in -next and appears to be causing breakage for several
> platforms using these devices.  For example I'm seeing the HDMI fail to
> probe on sun50i-a64-pin64-plus with arm64 defconfig, the DT kselftest
> result isn't terribly informative but it can be seen here:

It has now been *three* weeks that this breakage has sat unaddressed in
-next, this has been making my CI for -next unusable.  Given that
getting the defconfig bits of this merged appears somwhow unreasonably
difficult can we please drop these changes from the DRM tree until some
strategy for getting everything merged is put into place?

--ww8fNriCpgA4t3ar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYnSxIACgkQJNaLcl1U
h9DO/Af+JThtSrbnCe6qv2KyUQjklU/Q3jii/SGSG6EkkThvcMOrvLeuzOGmgn4q
AYESNMJikjvXh+sdbMPuA5/AOQk/T1Cig5ljEnYqcZKZFo+Q98Fmdacu15o2/PU9
CA7fQx7W69f6ua4dx10zFBMKVuV/Z1tTWCj5TYBeQj21rbI6e1UL2epdXY8OX6U7
fDiPatmH8ZujrRQcJIa70xD/qkI17aIdYmucme7yz+ouLp1ow079ZQ8OapDqnEkk
IroiNHzN7hHnZ3TqqP2IlAOF6kVmxUG7/CukMg/rqROa+T184oh2Lm2emOnijuXR
mNo+xrLxvj/O+VGG3illQC+1O7nq9g==
=vweS
-----END PGP SIGNATURE-----

--ww8fNriCpgA4t3ar--
