Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67664F0B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5694010E614;
	Fri, 16 Dec 2022 18:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C010E614
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:06:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F68-00051g-Uf; Fri, 16 Dec 2022 19:06:16 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F67-004yPx-A8; Fri, 16 Dec 2022 19:06:16 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F67-000DBm-2o; Fri, 16 Dec 2022 19:06:15 +0100
Message-ID: <bf1e9ada62efedcf3be57cbd57a9260d35b83fc0.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/2] drm/imx/lcdc: Implement DRM driver for imx21
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 16 Dec 2022 19:06:14 +0100
In-Reply-To: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-16 at 18:50 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> Changes since v2:
>=20
> =C2=A0- added allOf as Krzysztof requested
> =C2=A0- reworked driver based on Philipp's comments
> =C2=A0=C2=A0=C2=A0(improved error handling, different selects, moved driv=
er to a subdirectory,
> =C2=A0=C2=A0=C2=A0header sorting, drm_err instead of DRM_ERROR, inlined
> =C2=A0=C2=A0=C2=A0imx_lcdc_check_mode_change, make use of dev_err_probe()=
)
> =C2=A0
>=20
>=20
>=20
> Krzysztof also pointed out that we're now having two compatibles for a
> single hardware. Admittedly this is unusual, but this is the chance that
> the (bad) compatible identifier imx21-fb gets deprecated. The hardware
> is called LCDC and only the linux (framebuffer) driver is called imxfb.
>=20
> The two prerequisite commits on top of v6.1 are:
>=20
> =C2=A0- 93266da2409b ("dt-bindings: display: Convert fsl,imx-fb.txt to
> =C2=A0=C2=A0=C2=A0dt-schema") which is currently in next via branch 'for-=
next' of
> =C2=A0=C2=A0=C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/robh/linu=
x.git .
>=20
> =C2=A0- "drm/imx: move IPUv3 driver into separate subdirectory"
> =C2=A0=C2=A0=C2=A0from https://lore.kernel.org/r/20221125112519.3849636-1=
-l.stach@pengutronix.de

This is on drm-misc-next now, so patch 2 applies there.

regards
Philipp
