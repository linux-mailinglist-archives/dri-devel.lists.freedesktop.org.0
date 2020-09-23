Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CF2756EF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08376E960;
	Wed, 23 Sep 2020 11:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE706E960;
 Wed, 23 Sep 2020 11:14:48 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4c14:a400:24d7:51ff:fed6:906d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: mvlad)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2885629C364;
 Wed, 23 Sep 2020 12:14:47 +0100 (BST)
Date: Wed, 23 Sep 2020 14:14:43 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
Message-ID: <20200923111443.GA8478@xpredator>
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
 <CAKMK7uHr3dKu8o4e3hoSe3S5MfVtZ92nLk1VGZTqSuDsH6kphg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHr3dKu8o4e3hoSe3S5MfVtZ92nLk1VGZTqSuDsH6kphg@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: multipart/mixed; boundary="===============1384951616=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1384951616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 12:58:30PM +0200, Daniel Vetter wrote:
> On Tue, Sep 22, 2020 at 3:36 PM Marius Vlad <marius.vlad@collabora.com> w=
rote:
> >
> > On Fri, Jan 31, 2020 at 07:34:00AM +0000, Daniel Stone wrote:
> > > On Thu, 5 Jul 2018 at 11:21, Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
> > > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed=
 to
> > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > reconfiguring global resources).
> > > >
> > > > But in nonblocking mode userspace has then no idea this happened,
> > > > which can lead to spurious EBUSY calls, both:
> > > > - when that other CRTC is currently busy doing a page_flip the
> > > >   ALLOW_MODESET commit can fail with an EBUSY
> > > > - on the other CRTC a normal atomic flip can fail with EBUSY because
> > > >   of the additional commit inserted by the kernel without userspace=
's
> > > >   knowledge
> > > >
> > > > For blocking commits this isn't a problem, because everyone else wi=
ll
> > > > just block until all the CRTC are reconfigured. Only thing userspace
> > > > can notice is the dropped frames without any reason for why frames =
got
> > > > dropped.
> > > >
> > > > Consensus is that we need new uapi to handle this properly, but no =
one
> > > > has any idea what exactly the new uapi should look like. As a stop-=
gap
> > > > plug this problem by demoting nonblocking commits which might cause
> > > > issues by including CRTCs not in the original request to blocking
> > > > commits.
> > Gentle ping. I've tried out Linus's master tree and, and like Pekka,
> > I've noticed this isn't integrated/added.
> >
> > Noticed this is fixing (also) DPMS when multiple outputs are in use.
> > Wondering if we can just use a _ONCE() variant instead of WARN_ON(). I'=
m seeing
> > the warning quite often.
>=20
> On which driver/chip does this happen?
I've tried it out on i915.
> -Daniel
>=20
> >
> > >
> > > Thanks for writing this up Daniel, and for reminding me about it some
> > > time later as well ...
> > >
> > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > >
> > > Cheers,
> > > Daniel
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAl9rLiAACgkQ9jQS5glH
1u8bSxAAqdQ/WtRkNdIfWUw7AI0LWFLlPvcZxqgPN5pgZRHHuXPCjCwtiXLyiyHW
RotgvgPcLFfnxJ6jR8VAwkDp+J052yDidV2L5j10mvWIHzh3PCWYw/kJKovejCtQ
rE6hBktEMbKaQhWX0AysPQvlzLO8JFfXMuC/0Ubva19X85LZvlYfUA2ulfUAdStY
N+vlp5s3V3XO0bvGf1nmOm1W12I3G++egVs2KkTg0kW7OTlsqUhTlBkhSCRGGiCP
4PKY+X7J1Nfn44QYfvMmoZGwsbMX1JxYIJWoKc7SB/d9UDCN2s743BdJw6XxbIZ2
x7KJf6rTd3eh1YACSvDpZZf1b+h10SyAKmoIh5zitMlhCtUT7iywCHu0R/WMva7O
u/Sk+sAs02t+U8mpQywlNiZnrf8B2COjm/RSdCZWpBSoR+x69yVF9fULA99kVDaZ
tH5CrMdtgKcue/8Dc9ckVKbVrAPhly6tjo4Hwkx0hJ5u+0R04GLqMHVg/snRYDpW
j/PEddhpaXtvgL+UDLGUYCsURfVD0lGmHruHV7XA9wOhSmeSH/ySgcd3Uys0saFD
Ih6mCZHCFOwYXx0JBRvTgpbq8EIndjgbkoNw8/xWp9RMV/W6evI9YwkcRY7jLcZw
OdMunC3GeeMED3CtJq57vwMuvucCAKd2kAb7FL1YhupAcbGmb2c=
=xLmh
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============1384951616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1384951616==--
