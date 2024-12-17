Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715F9F5206
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8A910E41D;
	Tue, 17 Dec 2024 17:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KOzwMCZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CA810E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:13:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94E575C63C7;
 Tue, 17 Dec 2024 17:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E999BC4CED3;
 Tue, 17 Dec 2024 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734455610;
 bh=jLjXGQRuYhHX2FPYDCj3e7QwJ0rtcdIW6eV0G++iz2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KOzwMCZFWUA2AqJ1WijKIDZ3FG9jWwCSzdAkuGZZk8CcgC3MyQihVL/tAVIiQAakk
 qyHscAgc8d66oucPc5BpPhk/KTUJ71yRFgZoX3tX7UkL4+zbh2hDnsSf/GHyjtNKSW
 RjOrc1ydi4UaaLqtcsRPq6vPcccmYLHTyP10s8zr1KbVVEGlKdA1f5DjB+yx2Wj4ei
 DfdAyXT08iOVVhOxzzrk7PBP3Jip+7BZAHqv+G3+oyIpMIa08Ye/iSu1kSKJYt840D
 i8Igg57Gubrn1nFnXYuUHv2WdInHj9fnqvBVbcvBArEHmirJx3HKuYIClQkXQtu753
 6iWHuWgzJcXvg==
Date: Tue, 17 Dec 2024 18:13:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Message-ID: <20241217-curly-mauve-scallop-d84a3d@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
 <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tibevjcmq2hqubs4"
Content-Disposition: inline
In-Reply-To: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
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


--tibevjcmq2hqubs4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
MIME-Version: 1.0

On Sun, Dec 08, 2024 at 01:06:46PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > > already reads EDID and propagates it to the drm_connector. Stop
> > > rereading EDID as a part of the .get_modes() callback and just update
> > > the list of modes. This matches the behaviour of the i915 driver.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> > >  1 file changed, 21 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800=
f02926300ffceb75c69 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct=
 drm_connector *connector,
> > > =20
> > >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connec=
tor)
> > >  {
> > > -	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> > >  	struct vc4_dev *vc4 =3D to_vc4_dev(connector->dev);
> > > -	const struct drm_edid *drm_edid;
> > >  	int ret =3D 0;
> > > =20
> > > -	/*
> > > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doin=
g so
> > > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > > -	 * .adap_enable, which leads to that funtion being called with our =
mutex
> > > -	 * held.
> > > -	 *
> > > -	 * Concurrency isn't an issue at the moment since we don't share
> > > -	 * any state with any of the other frameworks so we can ignore
> > > -	 * the lock for now.
> > > -	 */
> > > -
> > > -	drm_edid =3D drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > > -			connector->display_info.source_physical_address, false);
> > > -	if (!drm_edid)
> > > -		return 0;
> > > -
> > >  	ret =3D drm_edid_connector_add_modes(connector);
> > > -	drm_edid_free(drm_edid);
> >=20
> > I don't think that works though, for mostly two reasons:
> >=20
> >  1) We're not sure we'll even have an hotplug interrupt if the system
> >     boots with the connector plugged in for example.
> >=20
> >  2) afaik, the get_modes ioctl directly calls get_modes too.
>=20
> I think both paths use .fill_modes, not get_modes.

The standard fill_modes helper calls get_modes.

> And fill_modes explicitly calls .detect / .detect_ctx. It would be
> nice if somebody can verify the change on the acual hw. But as I
> wrote, i915 driver does exactly the same: the EDID is read / updated
> in .detect_ctx(), while .get_modes() only performs
> drm_edid_connector_add_modes(). Okay, there is one significant
> difference which we should probably patch out: the .force() is also
> implemented to update EDID in the forced case. I should probably do
> the same for the drivers being handled in this patchset.

Ack. Worst case scenario we can fix it later on.

Maxime

--tibevjcmq2hqubs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GxNwAKCRAnX84Zoj2+
dkQFAX0SszndvYXwUlXHlEuKUMjRu6IRXcqwYhtGDEU4Pa5CP+DEeeU2aVcCBV57
8JlgY1EBgJoNXW3bl5jfa7bCf56cHn19NuMdQETCLtTWVjLm+TwQe7iYK5KnDYrP
uvMZWYlUTg==
=d8qr
-----END PGP SIGNATURE-----

--tibevjcmq2hqubs4--
