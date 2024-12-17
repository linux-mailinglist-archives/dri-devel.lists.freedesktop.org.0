Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C29F455A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44C910E00B;
	Tue, 17 Dec 2024 07:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qgygh1jB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390410E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:43:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22183A41E15;
 Tue, 17 Dec 2024 07:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A648EC4CED3;
 Tue, 17 Dec 2024 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734421393;
 bh=SFEB+1CioxLc5lMZKoURIeOpaioyZPe04X8yK/3CHYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qgygh1jBZx5lw8SjMJZ9Rn89E9kJt7oapQfMySMCzPSBHCgBuwR0KzOWAzB51uN3c
 DFJJcdWpUijv2S9WKbhoJTLFMnw/TcqLsu5f+u/7yuUVgx8eq6k1P3RVktd6ksDe9r
 3KznClF/Fti3bWkP8h+V0dhDiQ7Kmfn+uvsey1jDZE5nv2DuAeGCNztZP5D18mHk93
 EE6lfm4G8EkU3pUWUW93gmUoHmLrgxokZ7oLJWxRvx1PCwHnSvvTJa1WsGv2sBnKJ3
 Di+eL1PIokZY3FnyLKS0DJF1ewNV7svRLMJRIZn0urB0dqfOOOgE7vxYn2sCjTERi+
 5SngBCjqBp21A==
Date: Tue, 17 Dec 2024 08:43:10 +0100
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
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <20241217-heretic-hopeful-jaguar-aeabec@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
 <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="c4s3lijvuloytprp"
Content-Disposition: inline
In-Reply-To: <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
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


--c4s3lijvuloytprp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
MIME-Version: 1.0

Hi,

On Mon, Dec 16, 2024 at 07:47:32PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> > > +struct drm_connector_hdmi_codec_funcs {
> > > +	/**
> > > +	 * @audio_startup:
> > > +	 *
> > > +	 * Called when ASoC starts an audio stream setup. The
> > > +	 * @hdmi_audio_startup is optional.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*audio_startup)(struct drm_connector *connector);
> > > +
> > > +	/**
> > > +	 * @prepare:
> > > +	 * Configures HDMI-encoder for audio stream. Can be called
> > > +	 * multiple times for each setup. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*prepare)(struct drm_connector *connector,
> > > +		       struct hdmi_codec_daifmt *fmt,
> > > +		       struct hdmi_codec_params *hparms);
> >=20
> > Missing newline
> >=20
> > > +	/**
> > > +	 * @audio_shutdown:
> > > +	 *
> > > +	 * Shut down the audio stream. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	void (*audio_shutdown)(struct drm_connector *connector);
> >=20
> > And thus we can probably just call that one shutdown?
>=20
> It should be called automatically by the sound system. I'd rather not
> call items directly that we are not supposed to call.

I meant that with my suggestion to call the function
drm_connector_hdmi_audio_init, that structure would be called
drm_connector_hdmi_audio_funcs, and thus the audio prefix in
audio_shutdown is redundant.

Maxime

--c4s3lijvuloytprp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2EriQAKCRAnX84Zoj2+
dn+KAXsHF1Me3a69DjYay1zSH0/PHfBLCaIV8MGlbctx2pAUq5SnrvsJZ2avXBJl
7I+LlxABewcJcOkSen/hN0RxUNmpQaMQSHXReIonARDyzvaXra1BL1nAga4/ubzn
jeARugW3sQ==
=pdll
-----END PGP SIGNATURE-----

--c4s3lijvuloytprp--
