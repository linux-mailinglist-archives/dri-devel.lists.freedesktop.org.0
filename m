Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B72FFE7E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36256E9BA;
	Fri, 22 Jan 2021 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xanadu.blop.info (xanadu.blop.info [178.79.145.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A8E6E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 16:26:35 +0000 (UTC)
Received: from [127.0.0.1] (helo=xanadu.blop.info)
 by xanadu.blop.info with smtp (Exim 4.89)
 (envelope-from <lucas@debian.org>)
 id 1l2cn0-0001Ik-Ej; Thu, 21 Jan 2021 17:26:30 +0100
Received: (nullmailer pid 16901 invoked by uid 1000);
 Thu, 21 Jan 2021 16:26:22 -0000
Date: Thu, 21 Jan 2021 17:26:22 +0100
From: Lucas Nussbaum <lucas@debian.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
Message-ID: <20210121162622.GA16797@xanadu.blop.info>
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121110406.yeb4zoqwwgilyrhq@gilmour>
MIME-Version: 1.0
In-Reply-To: <20210121110406.yeb4zoqwwgilyrhq@gilmour>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Content-Type: multipart/mixed; boundary="===============0418424476=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0418424476==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On 21/01/21 at 12:04 +0100, Maxime Ripard wrote:
> Hi Lucas, Ryutaroh,
>=20
> On Thu, Jan 21, 2021 at 11:57:58AM +0100, Maxime Ripard wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >=20
> > LBM base address is measured in units of pixels per cycle.
> > That is 4 for 2711 (hvs5) and 2 for 2708.
> >=20
> > We are wasting 75% of lbm by indexing without the scaling.
> > But we were also using too high a size for the lbm resulting
> > in partial corruption (right hand side) of vertically
> > scaled images, usually at 4K or lower resolutions with more layers.
> >=20
> > The physical RAM of LBM on 2711 is 8 * 1920 * 16 * 12-bit
> > (pixels are stored 12-bits per component regardless of format).
> >=20
> > The LBM adress indexes work in units of pixels per clock,
> > so for 4 pixels per clock that means we have 32 * 1920 =3D 60K
> >=20
> > Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> This one should fix your issue
>=20
> Feel free to test it and let me know if it's not the case

I confirm that the patches fix the issue I was seeing.

Thanks!

Lucas

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE/t7ByzN7z1CfQ8IkORS1MvTfvpkFAmAJqy4ACgkQORS1MvTf
vpln6w/6AzLnuDP7TAvRkH+N1Eth1BaqdaZXjMNSmQF+qcAQTbnSXnoLia/q3wVE
6eRxPz1phHG++upClmnGAU4ftCAru6lvSxtpB8kJeniWlZWK8Jq3LdnkA6Z2J/0i
FVa50HVDTMNUlz/bN6hQXZzV4lAVIhoTlk6WNq/4XsVUaQnsynSNqaXJhRj97FQv
M5McSxwIvn8Ru5b2UqtYsXcAsGG1aH8pNztmpFUUGr1mGaXBmzloQw3RemPlorYB
xh9eX6ylq4TyM50L8IBKkn75J1TLRvyZqARWxyCoZX/VuN23ZnqA2PUj1hSrcekP
LVaaGF5/ZogJKH/5LqD2CnOg3A/zxtMF4o5QESk9CGoqTdK+STjU87MA5CQgymd6
D4M+7sse2apJ03fsoNFPpxfB79oEdf8LUSzY/fiWk5+PW5fd023kj24DcC1OhCjv
lmD1ABNq2MBOiSYRRJOiYY+4/9n9iC8ZavkV1ceCk/aaLsZJCsGRbt89x39L1+Io
+A1DhG27yboEcMZ1uw6FnxqL4tF3j1F9YP3UPkrYnC3IAq6jQyJi3uU/4IHPtWBc
oY9m/SEWtqV18uRkL9rSr1iGqgxCD9dA//ZS/wvwsslAmneBo5/kEGZWiBTdzT+u
rsFSUCziIKhV+OHJVPXftBS9KQqxKu+OB/BzDsHRvwIWNfUFyeE=
=gNEM
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============0418424476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0418424476==--
