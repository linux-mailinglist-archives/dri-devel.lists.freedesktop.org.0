Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729949F5FBF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 08:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280D10E429;
	Wed, 18 Dec 2024 07:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X0TEM8Ko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6A410E429
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 07:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 274365C5EA7;
 Wed, 18 Dec 2024 07:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D16C4CECE;
 Wed, 18 Dec 2024 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734508786;
 bh=sqi+j1FWp7VAY/ARAadBpUhCp9Sk4hgOZxPX95wClrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0TEM8Koa59ree2WPetcR04rE84cgfBQw46LRKM3wLj29lxQ8tpTmoj2xBlumhjlT
 71clqYVjOL0cNR465CyvpA/0Vn/WDPI8lgOHqCEcwen6xr76dhF+VcZ0hP3ZHlCrYs
 bAvnJNlFQT+2AsgLx7mI4BapfT940lJWO/bRzmmQVDpEwKUnz7oG3eMtgEJqrVVDpK
 e0KKdfj3cuXNvUVWPaqvY99mxU4hDBwaQ1qAIfy20mrsc497E/Ilk084B/ni5JlTB/
 UirwcLtdloZe94am91hJbMF08vjJaH1fr+lQleSHJj9nqm0DCzBCDTN8toxM9zPP1r
 XNvyI7qxTSosg==
Date: Wed, 18 Dec 2024 08:59:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <20241218-wild-red-manatee-bb2a34@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
 <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="woythu4oziodei4y"
Content-Disposition: inline
In-Reply-To: <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
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


--woythu4oziodei4y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
MIME-Version: 1.0

On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > framework, I stumbled upon an issue while handling the Audio InfoFram=
es.
> > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > there was no simple way to get the drm_connector that stayed at the e=
nd
> > > of the bridge chain. At the same point the drm_hdmi_connector functio=
ns
> > > expected to get drm_connector instance.
> > >
> > > While looking for a way to solve the issue, I stumbled upon several
> > > deficiencies in existing hdmi_codec_ops implementations. Only few of =
the
> > > implementations were able to handle codec's 'plugged' callback. One
> > > third of the drivers didn't implement the get_eld() callback.
> > >
> > > Most of the issues can be solved if drm_connector handles
> > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > implementation, be it a driver that implements drm_connector or
> > > drm_bridge.
> > >
> > > Implement such high-level framework, adding proper support for Audio
> > > InfoFrame generation to the LT9611 driver.
> > >
> > > Several design decisions to be kept in mind:
> > >
> > > - drm_connector_hdmi_codec is kept as simple as possible. It implemen=
ts
> > >   generic functionality (ELD, hotplug, registration).
> > >
> > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > >   supported).
> > >
> > > - drm_bridge_connector provides a way to link HDMI audio codec
> > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > >   framework.
> > >
> > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > >   drivers should opt-in capture support rather than having to opt-out=
 of
> > >   it.
> >
> > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > tested?
>=20
> LT9611 is actually tested, VC4 is only compile-tested. Should I put an RF=
T tag?

Yeah, we definitely need to test it on the pi3 (polling-based) and the
pi4 (irq-based) at least.

Dave, Maira, could you give it a try?

Maxime

--woythu4oziodei4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2KA6gAKCRAnX84Zoj2+
doM7AYDYL5BrruN7W/ACWXLqTjEYQHCFy+iryAfwh6yE4f0RPJ6YFzy8mnTd+X1L
Jm9FiCABgPBOTqSnWYqNQjCLhnY0tzsDweW5w5m2sSKXDd0eMFfMFWxI2AeBQJRe
UpFPPwBPkQ==
=R0UZ
-----END PGP SIGNATURE-----

--woythu4oziodei4y--
