Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33937A3233C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8847510E0FA;
	Wed, 12 Feb 2025 10:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BVr9syjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CF10E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:08:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8822A5C5DEF;
 Wed, 12 Feb 2025 10:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAACC4CEDF;
 Wed, 12 Feb 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739354896;
 bh=SZIYgUNCCnIL5V0seV/NEEb2Rim4jnuOX/CWoopZRZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BVr9syjrufyTLY9xamchuxaxhtBwatQn4E5nLYGo3FDTekqf1z2gkJHayWmn9KZaJ
 bNmP+QFDQx2oinhW1Bj8Zj+b3YdHej+ggMUb99OkAqJ08Cn0ZnMEiP6iW06TKEJA7k
 HutHsQ865WyPlyj253gDAw15bF0gKSH/wal3TwAhWjNPV2Hm3BDwBeNpRHvvk/6isx
 IpAoIPlguCWJeEc7sJKvTz3WzPGkRV8tk5fZJD2h8DBGZFpfQp1qNbsZNRmZjIVSQ0
 SyZuGYTItv+KchRHitB/qEwzMHf8LMQ/7DlPxayOqcbKZ3+Oas2iu2Jhda2oPHr+y0
 agQ0hJJV4eLlw==
Date: Wed, 12 Feb 2025 11:08:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250212-petite-persimmon-termite-c0bce2@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
 <20250211-venomous-dragon-of-competition-d76bf9@houat>
 <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="c2fwd2zsskly2q4c"
Content-Disposition: inline
In-Reply-To: <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
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


--c2fwd2zsskly2q4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 02:55:10AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 09:48:31AM +0100, Maxime Ripard wrote:
> > On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > > > Hi Maxime, Dmitry
> > > >=20
> > > > On Fri, 7 Feb 2025 21:54:06 +0200
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > >=20
> > > > > > > +/* Internal function (for refcounted bridges) */
> > > > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > > > +{
> > > > > > > +	struct drm_bridge *bridge =3D container_of(kref, struct drm=
_bridge, refcount);
> > > > > > > +	void *container =3D ((void *)bridge) - bridge->container_of=
fset;
> > > > > > > +
> > > > > > > +	DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, con=
tainer); =20
> > > > > >=20
> > > > > > Pointers are not really useful to track here, since they are ob=
fuscated
> > > > > > most of the time. Using the bridge device name would probably b=
e better
> > > > > > (or removing the SHOUTING DEBUG entirely :)) =20
> > > > >=20
> > > > > bridge device name or bridge funcs (I opted for the latter for the
> > > > > debugfs file)
> > > >=20
> > > > These DRM_DEBUG()s proved extremely useful exactly because of the
> > > > pointer. This is because when using hotplug one normally has the sa=
me
> > > > device added and removed multiple times, and so the device name or
> > > > bridge funcs is always the same, preventing from understanding which
> > > > instance is leaking, or being freed, get, put, etc.
> > > >=20
> > > > Do you think this is a sufficient motivation to keep it?
> > >=20
> > > Then it should be something like %px. I found that %p is mangled.
> > > What about having both device name _and_ a pointer?
> >=20
> > No, %px must not be used there. %p is mangled but should be consistent
> > across calls. But yeah, it's kind of the reason I suggested to use the
> > bridge device name instead.
>=20
> Then we need to extend struct drm_bridge with struct device *dev (which
> I would appreciate, it will solve whole hdmi_audio_dev / CEC device /
> etc story).

Let's not get carried away and start yet another side discussion here.
Most of these log messages need to be reworked anyway, so I'm sure we
can find something that wouldn't require yet another rework to argue
about.

Maxime

--c2fwd2zsskly2q4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6xzDQAKCRAnX84Zoj2+
dkT0AYCkUL7FAvh7cyVAWf35anla6gaIPKKt7fnIaZU+CIoMLp/xlH2vfqItsVOF
V6M0p+4BgJd7VNGXdmw73nQmuc5U6UM6/Rn1xP94EajbmmZyjqxzR+xwsOjC0P2J
qhJjJSwQoQ==
=IEWS
-----END PGP SIGNATURE-----

--c2fwd2zsskly2q4c--
