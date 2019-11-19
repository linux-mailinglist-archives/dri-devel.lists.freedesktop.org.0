Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A0103037
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BE26EA14;
	Tue, 19 Nov 2019 23:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340386E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id DD23A28FCA2
Received: by earth.universe (Postfix, from userid 1000)
 id 1B3363C0C78; Tue, 19 Nov 2019 22:15:06 +0100 (CET)
Date: Tue, 19 Nov 2019 22:15:06 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191119211506.pvcnmgrfy5wa7kkf@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
 <20191119150643.GI35479@atomide.com>
 <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
 <20191119194628.7709b1fe@aktux>
MIME-Version: 1.0
In-Reply-To: <20191119194628.7709b1fe@aktux>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0945008594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0945008594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmcfo7pimza6hnl5"
Content-Disposition: inline


--nmcfo7pimza6hnl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 19, 2019 at 07:46:28PM +0100, Andreas Kemnade wrote:
> On Tue, 19 Nov 2019 17:55:57 +0200
> Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>=20
> > On 19/11/2019 17:06, Tony Lindgren wrote:
> >=20
> > >> The userspace apps need to do this. If they're using single-bufferin=
g, then
> > >> using the dirtyfb ioctl should do the trick, after the SGX has finis=
hed
> > >> drawing. =20
> > >=20
> > > Sounds like that's not happening.
> > >=20
> > > But why would the userspace app need to know this might be needed for
> > > a DSI command mode display and that it's not needed for HDMI? =20
> >=20
> > When double-buffering, the userspace doesn't need to care, as the=20
> > page-flip ioctl explicitly tells that the buffer is ready.
> >=20
> > When single buffering, either the userspace has to tell that the buffer=
=20
> > is now ready, or the kernel has to guess based on something. But afaics=
,=20
> > the latter is always a guess, and may not be a good guess.
> >=20
> > The kernel could trigger a delayed update based on, say, page fault if=
=20
> > drawing with CPU. But how much delayed... And with this scenario, we=20
> > would somehow need to find a way to catch the writes from any IP to the=
=20
> > buffer, and afaik there's no such thing.
> >=20
> > >> It's probably somewhat difficult if EGL is controlling the display, =
as,
> > >> afaik, SGX EGL is closed source, and that's probably where it should=
 be
> > >> done.
> > >>
> > >> But adding back the hacky omap gem sync stuff, and then somehow gues=
sing
> > >> from the sync finish that some display needs to be updated... It jus=
t does
> > >> not sound right to me. =20
> > >=20
> > > Right it's ugly. Still sounds like we need something in the kernel
> > > that knows "this is a DSI command mode LCD and needs to be updated". =
=20
> >=20
> well, if we look broader around and not only at the remaining displays
> to be converted from omapdrm to generic and look at more displays, there
> are also EPDs.
>=20
> > I think one option is to refresh the command mode display all the time.=
=20
> > Either using a timer, or trigger updates based on the previous update=
=20
> > being finished.
> >=20
> > Of course, that's kind of against the whole point of manual update=20
> > display, but then it should effectively behave like a conventional=20
> > always-updating display (except your HW is more expensive and consumes=
=20
> > more power than a conventional display).
> >=20
> And again as an extreme example about power consumption: EPDs.
> So I guess we need a generic interface for userspace-triggered
> refreshes anyways. And in that case that are only partly refreshes.

You can do exactly this using the dirtyfb ioctl, which tells the
kernel, that some parts of the framebuffer are "dirty" and should
be send to the hardware. This is being used by the kernel console
and X.org. For omapdrm this triggers a full refresh of DSI command
mode panels.

The second method (which only supports full framebuffer for obvious
reasons) is double buffering. If you toggle from first to second
framebuffer, the driver will send the framebuffer to hardware. This
is being used by Weston when the DRM backend is selected.

-- Sebastian

--nmcfo7pimza6hnl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3UW1YACgkQ2O7X88g7
+poO5g/6A361Iq4TDgLeC3gHmTbaFwxPZL+BB4PxfblpqkoR0Elt3jLk7LGWVhZr
UT9oNIWTxGGKwU3N4sBO9fTY4SZxe7HgZagDzPY6VLtOwbw3zzLG0JSrSoXQNVyQ
RvjNpwasdvCrKhHTOn4Zepw+I4bfkPke0qB+YUAXvWPnOUtE0Rp5jzgD3CqofNsO
M3ujTneLHe1d288vj4beaHEPDtspQX/9h8ZYw8OBTZl/btAWgJLltYzQW/XV+5Jl
VsevGm0Qps9mV1DH8jjwqZSxP9RkP+IN4A+1UyNOSCRYVzeIVc1bCZ4BjkQfkKDX
u7jUeeN0NSnUDE8Osc25RFVyMNc1yobYmEuIPEDoahkpgyA5aaRYfZVf0AfuG1Wq
KwNKeqOBzAoA8ly/3SSQty9/jOQUhptnHd++ZorSQWHA9yy4eqEJtd4Phquql6Tp
0cOW2rp2m6RpqvybSr7aydBi3q0sgpf48IiMk7qy8/7xqGhKFWh/sKe7mSPFj2B5
FKPQ9ppe3VunUv3w3/dxsyBDIdUHfmJA7/hl9CcqR2n+PBV61TU4lJ385Nk+l2fU
+rNs4UE6g5TG0oIusQqxUK2hRiOXDBQ8GYWhoaRYcRZYkzdCYoDGqMrYvaDRJVKu
wl6Xa6LLBHkMjeso5JrXsiqUzo0pPAIZKydhTbxaG5C3svw2FRY=
=72OO
-----END PGP SIGNATURE-----

--nmcfo7pimza6hnl5--

--===============0945008594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0945008594==--
