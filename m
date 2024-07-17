Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB1933DD7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 15:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6CF10E0DF;
	Wed, 17 Jul 2024 13:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pbvj/YA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B37910E0DF;
 Wed, 17 Jul 2024 13:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A9EDCE13DE;
 Wed, 17 Jul 2024 13:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E96C32782;
 Wed, 17 Jul 2024 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721223769;
 bh=b6M2u0O/VcQWX4e8CRgM/0cmwdYjHB7jwSQO7Cq366U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pbvj/YA1Gs/hjRDC0IXr3+tRYix4k2pKaNUcxopwUOt2F3ENxPAeCd7DoRcMp7O0B
 UtRs91T42G/Tgpa0EcWDxZUv+lc0rM4ypbkFy3zjVSDe8hbjRV8lOGcgAAws7/rWT2
 hMWfV99wFXGsid9gYH9JPJe+Gwp7nsq2+Ti798NJ4mv4beRMWBtHXM07O8c+D1ncb5
 3Na3BkeEPeVECGuoDdhPLJch/+W5um8v4lCcvbzDZnLj51nlSj0p8xOEqgfiFUbvG+
 3zkYm6sbagImtoDSlJXsv9/nR27VdgbTGY8ixgsZkEWeJB/1U5WF01yc3llYodPJSe
 LpWYqd26vKK/g==
Date: Wed, 17 Jul 2024 15:42:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <20240717-bouncy-horned-mamba-5691b8@houat>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ldj6ctz25xj6y7b"
Content-Disposition: inline
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
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


--6ldj6ctz25xj6y7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> that are immutable by definition - e.g. ranges with min =3D=3D max or enu=
ms
> with a single value. This matches the behaviour of the IGT tests, see
> kms_properties.c / validate_range_prop(), validate_enum_prop(),
> validate_bitmask_prop().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We had a discussion yesterday about it on IRC with Sima, Simon and
Xaver.

https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;

The conclusion was that it would create an inconsistency between drivers
on whether a given property is immutable or not, which will lead to more
troubles for userspace.

It's not clear why Ville added that check in the first place, so the
best course of action is to remove the IGT test and get the discussion
started there.

Maxime

--6ldj6ctz25xj6y7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZpfKVgAKCRDj7w1vZxhR
xYH7AQD8w8myEhco9CqAfjh20D1tXY/mlB+W4/bdaby3K0NuIQD/cGVo42JNkoo/
jCNbgBRkiSwOXLi0a+whYQOE0kxTmwY=
=bR0t
-----END PGP SIGNATURE-----

--6ldj6ctz25xj6y7b--
