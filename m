Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610BCFCE57
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F72C10E0C1;
	Wed,  7 Jan 2026 09:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eJVtBzDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142F10E0C1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:37:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7133E4E41FCA;
 Wed,  7 Jan 2026 09:37:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3A77F606F8;
 Wed,  7 Jan 2026 09:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 438FD103C86E9; Wed,  7 Jan 2026 10:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767778628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Jw9fYqtCDXfPtT+8UOX2Xqrz6As8LIZX/uUf/suEIp4=;
 b=eJVtBzDDN9p/slaW/fBHnk6sVTQesibf2sguJrNYrWaLClMnA9NKlPA4Ehezr7dp/2Wuke
 TtkA9rGEI3kgx5Up+CjRj68avMbdok0rWTvevos1bkIUmBtsEc3fEQAZZNRjssRPAloNrC
 VfxUf5Z15TAE+A3Jw8pC2+6bVzQsAaV+4oOVdZHc8zL4SSQ9M3QGpLQjsSiKDMF3meKpSN
 YPF2lEeX7O9RW27hBkGMeIALtYqJ6aPxfiYjy+nR4V04yL93puBZHruosW7nlE02Kh9nWH
 Bq1tRPOh8ZxhL8aaB7bxftYzP2XBxLgSOURHpSrQZbKVffuOe3IhbgOhgwE4BA==
Date: Wed, 7 Jan 2026 10:36:55 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v3 04/22] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Message-ID: <20260107103655.2d25bcc3@kmaincent-XPS-13-7390>
In-Reply-To: <f9fb8050-89f9-4449-bc2c-ff284873be79@ti.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-4-9bad0f742164@bootlin.com>
 <f9fb8050-89f9-4449-bc2c-ff284873be79@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 6 Jan 2026 13:30:40 -0600
Andrew Davis <afd@ti.com> wrote:
> >   static int tilcdc_init(const struct drm_driver *ddrv, struct device *=
dev)
> >   {
> >   	struct drm_device *ddev;
> >   	struct platform_device *pdev =3D to_platform_device(dev);
> >   	struct device_node *node =3D dev->of_node;
> > +	const struct of_device_id *of_id;
> >   	struct tilcdc_drm_private *priv;
> >   	u32 bpp =3D 0;
> >   	int ret;
> > @@ -209,6 +222,10 @@ static int tilcdc_init(const struct drm_driver *dd=
rv,
> > struct device *dev) if (IS_ERR(ddev))
> >   		return PTR_ERR(ddev);
> >  =20
> > +	of_id =3D of_match_node(tilcdc_of_match, node); =20
>=20
> You should be able to use `device_get_match_data()` here, then you would
> also be able to keep the tilcdc_of_match table down were it was before.

Indeed. Didn't know this helper.
Thanks you!

--
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
