Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056627572F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BD289D77;
	Wed, 23 Sep 2020 11:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846889D77;
 Wed, 23 Sep 2020 11:31:56 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4c14:a400:24d7:51ff:fed6:906d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: mvlad)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6DDA22964A5;
 Wed, 23 Sep 2020 12:31:55 +0100 (BST)
Date: Wed, 23 Sep 2020 14:31:52 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
Message-ID: <20200923113152.GB8478@xpredator>
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
 <CAKMK7uHr3dKu8o4e3hoSe3S5MfVtZ92nLk1VGZTqSuDsH6kphg@mail.gmail.com>
 <20200923111443.GA8478@xpredator>
 <CAKMK7uGwTbt4OdfVGVLk_0i_F5LNTx1RAaNz_D8LxnpwJo-i2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGwTbt4OdfVGVLk_0i_F5LNTx1RAaNz_D8LxnpwJo-i2Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0845379807=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0845379807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 01:16:42PM +0200, Daniel Vetter wrote:
> On Wed, Sep 23, 2020 at 1:14 PM Marius Vlad <marius.vlad@collabora.com> w=
rote:
> >
> > On Wed, Sep 23, 2020 at 12:58:30PM +0200, Daniel Vetter wrote:
> > > On Tue, Sep 22, 2020 at 3:36 PM Marius Vlad <marius.vlad@collabora.co=
m> wrote:
> > > >
> > > > On Fri, Jan 31, 2020 at 07:34:00AM +0000, Daniel Stone wrote:
> > > > > On Thu, 5 Jul 2018 at 11:21, Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> > > > > > When doing an atomic modeset with ALLOW_MODESET drivers are all=
owed to
> > > > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > > > reconfiguring global resources).
> > > > > >
> > > > > > But in nonblocking mode userspace has then no idea this happene=
d,
> > > > > > which can lead to spurious EBUSY calls, both:
> > > > > > - when that other CRTC is currently busy doing a page_flip the
> > > > > >   ALLOW_MODESET commit can fail with an EBUSY
> > > > > > - on the other CRTC a normal atomic flip can fail with EBUSY be=
cause
> > > > > >   of the additional commit inserted by the kernel without users=
pace's
> > > > > >   knowledge
> > > > > >
> > > > > > For blocking commits this isn't a problem, because everyone els=
e will
> > > > > > just block until all the CRTC are reconfigured. Only thing user=
space
> > > > > > can notice is the dropped frames without any reason for why fra=
mes got
> > > > > > dropped.
> > > > > >
> > > > > > Consensus is that we need new uapi to handle this properly, but=
 no one
> > > > > > has any idea what exactly the new uapi should look like. As a s=
top-gap
> > > > > > plug this problem by demoting nonblocking commits which might c=
ause
> > > > > > issues by including CRTCs not in the original request to blocki=
ng
> > > > > > commits.
> > > > Gentle ping. I've tried out Linus's master tree and, and like Pekka,
> > > > I've noticed this isn't integrated/added.
> > > >
> > > > Noticed this is fixing (also) DPMS when multiple outputs are in use.
> > > > Wondering if we can just use a _ONCE() variant instead of WARN_ON()=
=2E I'm seeing
> > > > the warning quite often.
> > >
> > > On which driver/chip does this happen?
> > I've tried it out on i915.
>=20
> lspci -nn please.
Sure,

$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen Core =
Processor Host Bridge/DRAM Registers [8086:5914] (rev 08)
00:02.0 VGA compatible controller [0300]: Intel Corporation UHD Graphics 62=
0 [8086:5917] (rev 07)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200=
 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 08)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 x=
HCI Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise Point-LP=
 CSME HECI #1 [8086:9d3a] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot Port #1 [8086:9d10] (rev f1)
00:1c.2 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot Port #3 [8086:9d12] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot Port #5 [8086:9d14] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot Port #9 [8086:9d18] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point LPC Controller/e=
SPI Controller [8086:9d4e] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC [8=
086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio [8=
086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus [8086:9d23] =
(rev 21)
01:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PC=
I Express Card Reader [10ec:525a] (rev 01)
02:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wirele=
ss Network Adapter [168c:003e] (rev 32)
6e:00.0 Non-Volatile memory controller [0108]: Toshiba Corporation Device [=
1179:0116]

(it's a xps laptop)

>=20
> Also adding Ville, who has an idea where this can all go wrong. The
> one he pointed out thus far is gen12+ only though.
> -Daniel
>=20
> > > -Daniel
> > >
> > > >
> > > > >
> > > > > Thanks for writing this up Daniel, and for reminding me about it =
some
> > > > > time later as well ...
> > > > >
> > > > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > > > >
> > > > > Cheers,
> > > > > Daniel
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAl9rMiQACgkQ9jQS5glH
1u+vJw//cder6Xw9NHtwbglN1tv7dva+dbXlzNuIf1hVgApnfIwYMtBFIDrrrVIu
JQ8IH2MUeS66G5/eLSFgZHYJhL7ujj40mBud1feucGx2Ybfz3l357GSfI7wG8BkL
Whct/cKeAZy8knQPsFlt0mip9CMs37OwHbkTBOu5K1SktVWUYg21Eye+76NmvG7s
PlaIcftgC4gdfsW8Sma4BxM7XJU3E4igOu27HOaX1DwmsFEbblwC/SDltDQch+hM
Do2G89xbpu0IuQSZ/IJqRnWCfzOsiwPgfm3Yt8ofeZDfmlb3RJsCidGGUUuIoGDW
Rbl63vZkGtdNd9bjL0cHxdopag+e9Vjg//QaUgpAF2YScexdlYkJnLeJ2UFFU137
QZ6rDluB38sD7k1II5Cb8aMNUapwMi2AP4vBVkr7F7iLmWEgDxbTxvCqbJi4RMK7
iBAXyVJN5pqN6Kj0iaPnwUFVBSo7zWwOHUFKT4qNqN56GGX2/4pYtTdJA5+Ute/i
MY+ALtXCxb0a2gleTQa5l9AjIbe3HbMfiDCpBl0wfzbnmS5OOd/xiDO4ZpEUB5G+
kVDVbXd+rEXvwgdqUUfPa6ag1wIdY2IMRs11PmP1FHAIvJA+Mvnzr1rBMe7M2xUG
XtcqAc1Khqmg6x7h/Y1/KMSaQ2cIaRTvdHFmecd25hB2mj5rnHI=
=sgFU
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

--===============0845379807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0845379807==--
