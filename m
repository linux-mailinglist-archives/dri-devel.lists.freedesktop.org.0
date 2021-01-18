Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A782FB443
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C596E852;
	Tue, 19 Jan 2021 08:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1889CBC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 12:10:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8274BB7C4;
 Mon, 18 Jan 2021 12:10:41 +0000 (UTC)
Message-ID: <750e397a995502fe15aabe8d9ba1b944bfce1cb8.camel@suse.de>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>
Date: Mon, 18 Jan 2021 13:10:40 +0100
In-Reply-To: <03dc115b-2271-c7b2-289b-4710c97efb9a@i2se.com>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
 <20210113091957.odclfwmeykrkyq7v@gilmour>
 <20210113114223.GB4641@sirena.org.uk>
 <20210115181437.uqlkrbapv6ydswuy@gilmour>
 <20210115183949.GH4384@sirena.org.uk>
 <03dc115b-2271-c7b2-289b-4710c97efb9a@i2se.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>
Content-Type: multipart/mixed; boundary="===============1343046993=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1343046993==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8ZC7mFE38K9F9VmpR8HL"


--=-8ZC7mFE38K9F9VmpR8HL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan, Maxime,

On Mon, 2021-01-18 at 12:28 +0100, Stefan Wahren wrote:
> Hi,
>=20
> Am 15.01.21 um 19:39 schrieb Mark Brown:
> > On Fri, Jan 15, 2021 at 07:14:37PM +0100, Maxime Ripard wrote:
> > > On Wed, Jan 13, 2021 at 11:42:23AM +0000, Mark Brown wrote:
> > > > On Wed, Jan 13, 2021 at 10:19:57AM +0100, Maxime Ripard wrote:
> > > > > I'd like to get Mark's opinion before merging though
> > > > I'm not sure what the question is here?  I get CCed on a bunch of n=
ot
> > > > obviously relevant DRM patches so there's a good chance I've just
> > > > deleted some relevnat discussion.
> > > The patch is question is here:
> > > https://lore.kernel.org/dri-devel/1609256210-19863-1-git-send-email-s=
tefan.wahren@i2se.com/
> > > In particular, I'm not so sure whether it's fine to return -EPROBE_DE=
FER
> > > in the startup hook.
> > I wouldn't expect that to do anything useful and IIRC that error code
> > will end up in userspace which isn't good.  If the driver wants to defe=
r
> > probe it should defer it from the probe() routine, after the driver has
> > been instantiated I'm not sure what the expectation would be.  In
> > general a driver should acquire all resources it needs when probing.
>=20
> understand. Unfortunately, currently i don't have the time to
> investigate how we can achieve this with this drm driver.
>=20
> Maybe some else can take over?

My two cents: IIUC it's a tricky one since components don't have a way to
express dependencies. Somewhat similar to what happened with the DSI
bus/display race. To what extent vc4-crtc has a dependency with vc4-hdmi?
Couldn't we move vc4-hdmi component's registration at the end of
vc4_crtc_bind()?

Regards,
Nicolas


--=-8ZC7mFE38K9F9VmpR8HL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAFesAACgkQlfZmHno8
x/5fFwgAsicEUl0oiKDxkomw2jhG5oGD/iFYCosFj8kiXhE3RFGpKe9Bb4gYRKsi
7pcjsN5lzPJhssy18z0bTIISIm1wAYyB8ysbVMHqjykYrWbkeN+xXXEvsgFtX2aY
fNBMeyaUtWFXgk2RPd5wX4erTHUxpb44xt2I98YhEbjsIPinRX8DykRDUa8dZSFN
FhU/UkmCqJEq4T2j+Ne0cnriZjzd84/ULbE7oLBJwbYlj6lS7xlvvbyFOTvtw2rc
S696WxIeLhBnf7TZRHdVr8wc4Pewi0eC0lEtm6mguxio2aQ+V72zUi/Z2dOJmPZ7
krCUu4Wd9wAL104mFHkMB91E0vFzRg==
=fMa0
-----END PGP SIGNATURE-----

--=-8ZC7mFE38K9F9VmpR8HL--


--===============1343046993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1343046993==--

