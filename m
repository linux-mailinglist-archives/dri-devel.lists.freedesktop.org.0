Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C431AC0F45
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153510E9F0;
	Thu, 22 May 2025 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oz+QvmtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEEE10E9F0;
 Thu, 22 May 2025 15:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 148DEA4EB04;
 Thu, 22 May 2025 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A09C4CEE4;
 Thu, 22 May 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747926119;
 bh=1AAQm9CHyytzF4+9O6MKBfp9oHP7mXu2dEOCXa+XQ60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oz+QvmtPcLQhIfHb7Dmv2r8M+WiSoRM5qPUWyn0k87l+wT8VAirzhjzTpBW0eGBlb
 UmHr0bWOMyDkznyYF5LwH3teEaFZ1uE9qr6HXEdA+j0uBq3hgFzQ6nt0ZspVQXE85T
 OIIkY81dtcbV0m2gziJg01/r6Y2SIPkamj7M1kl4Hwl0qo9CYgYZTmBxYNa7ftFs4G
 zPja9fq08Kq/yFwJiQQ67CJDZJ1PPEHri6tbgslerK1on4Zw3xOpk7dM39CBPgwm8x
 voI88BFxvrFhvQuMo4HtIGvK0M5a3QE0bAoKlVQx3xcpqnnkL1paG+vNMl/2NKstkd
 Ah2lYGSdfnOWQ==
Date: Thu, 22 May 2025 17:01:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250522-eager-cautious-dragon-c09cbe@houat>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lkfsaolmoihne3h2"
Content-Disposition: inline
In-Reply-To: <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
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


--lkfsaolmoihne3h2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Thu, May 22, 2025 at 11:20:17AM +0800, Liu Ying wrote:
> >>       drm: convert many bridge drivers from devm_kzalloc() to devm_drm=
_bridge_alloc() API
> >=20
> > This patch affects multiple drivers. Running get_maintainers.pl
> > points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> > this looks like due to the 'N:' line in:
> >=20
> > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > M:	Shawn Guo <shawnguo@kernel.org>
> > M:	Sascha Hauer <s.hauer@pengutronix.de>
> > R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> > ...
> > T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > N:	imx
> > ...
> >=20
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MA=
INTAINERS?ref_type=3Dheads#L2511-2528)
> >=20
> > Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> > file that is touched by the patch. That regexp appears overly generic t=
o me.
> >=20
> > Shawn, can it be fixed by making it less generic?
> >=20
> > If not, can we at least add a band-aid 'X:' entry for
> > drivers/gpu/drm/bridge/imx?
> >=20
> > I think the other matching entry is the one to consider:
> >=20
> > DRM DRIVERS FOR FREESCALE IMX BRIDGE
> > M:	Liu Ying <victor.liu@nxp.com>
> > L:	dri-devel@lists.freedesktop.org
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-c=
ombiner.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-l=
ink.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi=
=2Eyaml
> > F:	drivers/gpu/drm/bridge/imx/
> >=20
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MA=
INTAINERS?ref_type=3Dheads#L7940-7948)
> >=20
> > However it does not list any trees. I _guess_ drm-misc applies here as
> > a fallback as well as common sense.
> >=20
> > Liu, should this entry have a 'T:' line for drm/misc?
>=20
> These bridge drivers also don't have a 'T:' line:
>=20
> DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
> DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
> DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
> DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
> LONTIUM LT8912B MIPI TO HDMI BRIDGE
> MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
> MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
>=20
> I think that they fallback to drm-misc since "DRM DRIVERS FOR BRIDGE CHIP=
S"
> covers them.  I don't have strong opinion on adding a "T" line to them, at
> least to "DRM DRIVERS FOR FREESCALE IMX BRIDGE".  Anyway, it would be good
> to know comments from maintainers for "DRM DRIVERS FOR BRIDGE CHIPS" and
> "DRM DRIVERS".

That's good enough to me. drivers/gpu/drm/bridge is indeed under the
maintenance of drm-misc and there's no exception afaik.

get_maintainers.pl also properly reports it, so I'm not sure we need to
do anything there.

Maxime

--lkfsaolmoihne3h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC88ZAAKCRAnX84Zoj2+
djG+AX9azcCjWg3uajj8kpv9U5tIOYfiLFB/+gEceKcg1OKQ4lA85Sy7O401gsKA
sHQZxUMBf0Vj0sOJiWj/u8nCjMwjpC+xsQThFbSdD/ITqF4PFVw2BCwG7J/5XsKx
gWgLGdqwyQ==
=0NYb
-----END PGP SIGNATURE-----

--lkfsaolmoihne3h2--
