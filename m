Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3662A2F6A4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952A810E37E;
	Mon, 10 Feb 2025 18:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nU59BCnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266B210E37E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:16:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 666F2A41EF6;
 Mon, 10 Feb 2025 18:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C1FC4CEE6;
 Mon, 10 Feb 2025 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739211403;
 bh=P1ss1v0bvkD5l9H6qgtHX7kFY/vS319qh4txvfoWsq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nU59BCnvDkLk479ynMymoJdH9LGPPQspXrC9ge1Bqw5MC+ab9QddYvZz0MsQ6EH3g
 215Adk2n3B75BaYdQNBv8cAoNL+jFR77sl8JGjbz1PvZLlKeA1FERlRiBWEpzVB/Ou
 wt2yoOga77GA2y6TIH9MPaiwpW0Jmo0FdCZpUCB57ExqVHqMSGfsbkOK9K65Nu/3T4
 tBhmZLlvzoCYi0LlsXm5L86NGYCGcwbaLzbathKuqAM78nNkzgSXjDxs7Hl66xwjuB
 LvSdau0a9cqdIi+WrqnOH6FI9Zk1bPXKeA7GsUSj+tLSY0hvS5u6d6wAySJNd/hdQ7
 QlUYiB3+MArbQ==
Date: Mon, 10 Feb 2025 19:16:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
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
Message-ID: <20250210-spirited-premium-rabbit-34e1cc@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
 <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
 <20250210181203.36798a31@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rffgj3g2dkwuwd4j"
Content-Disposition: inline
In-Reply-To: <20250210181203.36798a31@booty>
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


--rffgj3g2dkwuwd4j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 06:12:03PM +0100, Luca Ceresoli wrote:
> Hello Maxime, Dmitry,
>=20
> On Mon, 10 Feb 2025 16:23:44 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>=20
> > On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org>
> > wrote:
> > >
> > > On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote: =20
> > > > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote: =20
> > > > > Hi,
> > > > >
> > > > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote: =
=20
> > > > > > DRM bridges are currently considered as a fixed element of a
> > > > > > DRM card, and thus their lifetime is assumed to extend for as
> > > > > > long as the card exists. New use cases, such as hot-pluggable
> > > > > > hardware with video bridges, require DRM bridges to be added
> > > > > > and removed to a DRM card without tearing the card down. This
> > > > > > is possible for connectors already (used by DP MST), so add
> > > > > > this possibility to DRM bridges as well.
> > > > > >
> > > > > > Implementation is based on drm_connector_init() as far as it
> > > > > > makes sense, and differs when it doesn't. A difference is
> > > > > > that bridges are not exposed to userspace, hence struct
> > > > > > drm_bridge does not embed a struct drm_mode_object which
> > > > > > would provide the refcount. Instead we add to struct
> > > > > > drm_bridge a refcount field (we don't need other struct
> > > > > > drm_mode_object fields here) and instead of using the
> > > > > > drm_mode_object_*() functions we reimplement from those
> > > > > > functions the few lines that drm_bridge needs for refcounting.
> > > > > >
> > > > > > Also add a new devm_drm_bridge_alloc() macro to allocate a
> > > > > > new refcounted bridge.
> > > > > >
> > > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> > > > >
> > > > > So, a couple of general comments:
> > > > >
> > > > > - I've said it a couple of times already, but I really think
> > > > > you're making it harder than necessary for you here. This (and
> > > > > only this!) should be the very first series you should be
> > > > > pushing. The rest can only ever work if that work goes through,
> > > > > and it's already hard enough as it is. So, split that patch
> > > > > into a series of its own, get that merged, and then we will be
> > > > > able to deal with panels conversion and whatever. That's even
> > > > > more true with panels since there's ongoing work that will make
> > > > > it easier for you too. So the best thing here is probably to
> > > > > wait. =20
>=20
> The idea you proposed was to handle the issues current panel bridge
> code adds to the hotplug work by adding a .destroy callback and some
> more devm magic. I explored the idea but even after some clarifications
> from you it still didn't appear clearly doable and correct to me. And
> even in the case it were perfectly correct and doable, it is based on
> adding more complexity and "magic" on top of a topic that is already
> hard to understand: panel_bridge lifetime.

Not really, no. I told you several time that you shouldn't deal with
panels yet.

> So I opted for the other way: rework panel_bridge code so its lifetime
> is clear and as one would expect (panel_bridge lifetime =3D=3D panel
> lifetime).
>=20
> Possibly more work for me, but now it's done and it's in these patches
> so why waiting?

No, it's not done. You have the same issue with panels than you are
trying to fix with bridges: it's allocated through devm so they'll get
destroyed too soon. The panel_bridge might work fine now, but the panel
won't.

So it's more work, more scope-creep, and more discussions. For example,
I'm really not convinced on moving the drm_panel code under bridge.

Splitting it up will allow you to at least merge the parts that are
somewhat agreed upon. But do however you want :)

Maxime

--rffgj3g2dkwuwd4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pChAAKCRAnX84Zoj2+
dpqyAX9yyUCN76HmBvf3yU/Fwr0oPMOIzqBP07NsD/+k2jjVzrgSQM4ai90MiX0b
lSvbIdkBgPRVzIb7rhd6y4Pi4tuJ69NyDfsvuORTdgT42FpLlM3GPs3pujt/R1o9
AnFVC6dF0w==
=Xy4e
-----END PGP SIGNATURE-----

--rffgj3g2dkwuwd4j--
