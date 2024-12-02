Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73C9E03B8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480010E03E;
	Mon,  2 Dec 2024 13:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdXrnYBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0510E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 13:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BB4B0A40D37;
 Mon,  2 Dec 2024 13:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0F6C4CED1;
 Mon,  2 Dec 2024 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733146808;
 bh=LPw13BPxd7XHqSIBSbW2aDnWNRRtsfeLNYIXzAdMOso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdXrnYBH6FFjeIjzud5NsZpdsNDvf7MHSH5RpHzOAo2l3Mjux9miEWAJjdlNOMpo2
 1Kz7jRB+lhXqqrQCQETXJ4wusDkwMnM1PEka/yW3pYyw/1ddv7bbFmcvG3eltuk9Oc
 yW7oa8jioaRh6pIHhtQe7Z8bZJYdZrlQajiBlZcX3O6oyBcaCu/Is5cyi6EYA2h+7a
 hMURtU/5Wn3d1sNE5u+EAcsjTBNoab74/oioao/sc3Yxlsartyy5U4xOPTSjAOf9X8
 Yw1H3dyhAX1iLPR+q+Qzgi+2dnmLyR32975lUXdVlES7g0MSsrbG+AHLlgXGNV5KVc
 cfuo68OLMh9ZA==
Date: Mon, 2 Dec 2024 13:39:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <8a6bb3c4-73ee-4608-a59f-1590f52b8db4@sirena.org.uk>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
 <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
 <20241202-daft-fervent-grouse-2c0cf7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3+lNg7eZO9lVqR5n"
Content-Disposition: inline
In-Reply-To: <20241202-daft-fervent-grouse-2c0cf7@houat>
X-Cookie: (null cookie
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


--3+lNg7eZO9lVqR5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2024 at 02:29:55PM +0100, Maxime Ripard wrote:
> On Mon, Dec 02, 2024 at 12:59:22PM +0000, Mark Brown wrote:
> > On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> > > On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:

> > > > The no_capture_mute flag might differ from platform to platform,
> > > > especially in the case of the wrapping implementations, like the

> > > I appreciate it might be a dumb question, but I never really understood
> > > what no_capture_mute was all about. And in that context, why some
> > > drivers would need / use it, and some won't.

> > It's just what it says, it's a flag saying the device doesn't support
> > muting the capture side.

> Right, but then HDMI is output only, so it still doesn't really make
> sense to me why we'd want to mute the capture side?

This is an ASoC patch and you didn't mention where the flag was...
there's going to be HDMI capture hardware I guess?

--3+lNg7eZO9lVqR5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNuK0ACgkQJNaLcl1U
h9BdEAf9HK4EDgrVNfcv0E00Pk4tgBmushLydSQ4M197p6K6qrBg9uVaMSpUWEP3
haScBykJfEBLMuyzWn5Pt5DIQSL1snfw1LKSZcLI6rmjXj3gi2RR9as/xrdlqJzF
omrNsbXdAPCQtKk+HU4NAnhiARLKDFJ/SSF6J3exNcwro7WQl6+5BWF7ZOGr04GU
eGf8TTSw4whQBQQuDh287WvJNCPYNtptohaiFFAtxozv+gwI9ik6dE1el/l/3dAl
iO8/iyIxmHO32eJ4oRf2h5sExtYG36AdN96q9JnEGs712ZK+nX5tWeW0BGFqnict
SsAH3aFhLULXn2ijgLvXrqaH4A3kMA==
=HKwN
-----END PGP SIGNATURE-----

--3+lNg7eZO9lVqR5n--
