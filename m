Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA54EA056F6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3B10E826;
	Wed,  8 Jan 2025 09:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="UgUyk4VE";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="U+KzuCHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A5110E826
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736328999; x=1767864999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ByQ6/5pKHP8MQj/YBuiBtBApZpE+BRhKSooauRrD8M0=;
 b=UgUyk4VEsvtYL7IfFRqc6L4YYT8WXKW7xej8r9KWUsCVZOBcnS/E7moJ
 uv6+sU4zVNI9wr/Th2hc6341TU3akAakab3De8B/WhYdI6KFUVcaetb/h
 ry/tdiqnu075PWPfUNTOktRPq/VjDiAwpFVH1FyjCZmWE+4+m1UoVHqS9
 yV7XxuxqWGxHZO/dFfaeL7qGpG8SlMDtwQmbiBN5Q4XUtD6eAVHKK707q
 fJdzQ+meHEcQav81FtbB2z2gOnf6iFw0gzuVPE3wRnyHF+7y934wrks9g
 6DPuuqKC5YSRwiI03j2CdBiCmybTB1BbiRg50cR3oGsRrEF7FE9fb61ek g==;
X-CSE-ConnectionGUID: lBMLYARPRLWZT5KwbkWfUg==
X-CSE-MsgGUID: Zd4zm9GtRyqHqZSqH3f2CQ==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; d="scan'208";a="40915819"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:36:34 +0100
X-CheckPoint: {677E4722-2-3C670366-E45AD810}
X-MAIL-CPID: A643DC748E8B87B427C9C77EF9A89612_4
X-Control-Analysis: str=0001.0A682F20.677E4722.00EF, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37A1B165CAE; Wed,  8 Jan 2025 10:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736328989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByQ6/5pKHP8MQj/YBuiBtBApZpE+BRhKSooauRrD8M0=;
 b=U+KzuCHEcTYSgV86jGNGaa/mv07FsZ9PohRUU45OuleOyyJbt4plTlOs9OC5h7EZa6pfs3
 xlVysXyvSKiMOCJ4e9ke95vO13cPqh1HfgX8vWkZ2jAN2EB0MoIxNTAf4wbKa6PejaL/EW
 jar7uQZDyqpbdVuuUaEDl6oJFRZzUGbz27SSfYKXF1+RuuRrslFncfWHLEIPOW6btF7WcO
 XVACAELq3PbfNTlzg7AzZcgnLm7d1xi7Kdf+ERCCssq4TaNZvPf0DdIRe288BQfroOV9ZF
 uQB8SZfm+4qUhh1bs+Y2Sw358tBuiNhsWy+yyN8ZLOay3berwGebv/Qlx8V9RA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Date: Wed, 08 Jan 2025 10:36:24 +0100
Message-ID: <1842588.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <add11437-4fa8-489a-9cde-9c08cfd71db3@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
 <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
 <add11437-4fa8-489a-9cde-9c08cfd71db3@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Mittwoch, 8. Januar 2025, 04:22:19 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > This simplifies the code and gives additional information upon deferral.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
> >  1 file changed, 7 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu=
/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > index 65cf3a6c8ec69..038eaff889bb7 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > @@ -398,20 +398,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct pl=
atform_device *pdev)
> >  		return -ENOMEM;
> > =20
> >  	p2d->regmap =3D syscon_node_to_regmap(np->parent);
> > -	if (IS_ERR(p2d->regmap)) {
> > -		ret =3D PTR_ERR(p2d->regmap);
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(p2d->regmap))
> > +		return dev_err_probe(dev, ret, "failed to get regmap\n");
>=20
> s/ret/PTR_ERR(p2d->regmap)/

Thanks for the catch.

> > =20
> >  	ret =3D imx_scu_get_handle(&p2d->ipc_handle);
> > -	if (ret) {
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> > -				      ret);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> > =20
> >  	p2d->dev =3D dev;
> > =20
> > @@ -422,13 +414,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct pla=
tform_device *pdev)
> >  	}
> > =20
> >  	p2d->next_bridge =3D imx8qxp_pxl2dpi_find_next_bridge(p2d);
> > -	if (IS_ERR(p2d->next_bridge)) {
> > -		ret =3D PTR_ERR(p2d->next_bridge);
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> > -				      ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(p2d->next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
> > +				     "failed to find next bridge\n");
> > =20
> >  	ret =3D imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
> >  	if (ret)
>=20
> imx8qxp_pxl2dpi_parse_dt_companion() may return -EPROBE_DEFER too, so it =
needs
> to be changed.

True, I added a dev_err_probe to that function when companion bridge cannot
be found.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


