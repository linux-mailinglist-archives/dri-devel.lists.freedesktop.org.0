Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15A8D1A38
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140AC10E360;
	Tue, 28 May 2024 11:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="JABCX4NK";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jn5/LwSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB03410E360
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1716897025; x=1748433025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/58gdiJpM0B3ImJiCbj+KqJdGf8LvDGPhKIR6a6hhbM=;
 b=JABCX4NK7ccyXYheN7YAuGiR9ZiekVPNvT/+sNfo39z5xZza27PgXrC0
 PfaH40xSSef6rsiK4TqaaOWOq24r7qNg8VVHRTtQ61AVGII0t/J0zJ3yO
 Fz/DzFD+LSR/sIqVLujmQCcLn3PfOyR4hfjHmBXALLAUNlwdhN3HPPgSN
 EshvtnP1ZzfRkbAcUMB6+xNzUXLqrezEhJMYOrMQR1MrjeKytEzHp9ter
 jdzjS+pwlYV9yZrYECjVprjXeTk6kEPlUECm/HcdOjokeZZU31vk/FViy
 u/Gy32/WbmeatDCnxba5Vz1LPtsh3UEWMZag4hbD1EBH13SIS/hrvEmP7 g==;
X-CSE-ConnectionGUID: PrY+tUZASFe3HnFpq9Lp/A==
X-CSE-MsgGUID: tuuXUIU6TLKb2D2PbQRM3w==
X-IronPort-AV: E=Sophos;i="6.08,195,1712613600"; d="scan'208";a="37103537"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 May 2024 13:50:20 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1413D163F66; Tue, 28 May 2024 13:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1716897010;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/58gdiJpM0B3ImJiCbj+KqJdGf8LvDGPhKIR6a6hhbM=;
 b=jn5/LwSMBdGE+BWjDxi0RR5faA1n+uSIqWJBNMw2n68YARuq3DbPhFy9cv9LpHRQy7b4mr
 3EyI+S3oMDZ1RJpbKokB2tD1kimPMkGYiAtLn8SHRLscQKrriuwoccm8p8nPevD/C+7DSE
 40FCnqHIPl6ZeVqdxKr3kxMwd1tcqN7hAZseS/96c3iYd8HvlhxMe6usl6aNb/WOkXLNb+
 zSQxEXBBYuxSVjTOgLljprQOvEvlEXa7ngGODLpFjVmnlSIHsfDgdKds2SFSe7BELkAPM/
 PKgDTUwI60WgyP6ScfOBU36jHZQ1WSKniQUjJJEuNRryo0K3TzxBzz/GvwlTUA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
Date: Tue, 28 May 2024 13:50:07 +0200
Message-ID: <2814548.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <40bc3142-c7be-4dfc-a2ff-6ac209112aa6@nxp.com>
References: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
 <40bc3142-c7be-4dfc-a2ff-6ac209112aa6@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

thanks for your feedback.

Am Dienstag, 28. Mai 2024, 12:02:29 CEST schrieb Liu Ying:
> On 05/28/2024, Alexander Stein wrote:
> > Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
> > removed), it lines up with the other error paths in probe function.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/=
drm/bridge/imx/imx93-mipi-dsi.c
> > index 2347f8dd632f9..8331db3b4f054 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > @@ -841,11 +841,9 @@ static int imx93_dsi_probe(struct platform_device =
*pdev)
> >  		return -ENOMEM;
> > =20
> >  	dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ct=
rl");
> > -	if (IS_ERR(dsi->regmap)) {
> > -		ret =3D PTR_ERR(dsi->regmap);
> > -		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(dsi->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
> > +				     "failed to get block ctrl regmap");
>=20
> Missing \n.
>=20
> And, a build warning:
> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c: In function =E2=80=98imx93_d=
si_probe=E2=80=99:
> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:837:13: warning: unused varia=
ble =E2=80=98ret=E2=80=99 [-Wunused-variable]
>   837 |         int ret;
>       |             ^~~
>=20

Nice catch. Thanks. I'll send v2 tomorrow.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


