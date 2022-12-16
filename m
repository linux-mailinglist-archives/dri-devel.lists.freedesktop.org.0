Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8664F051
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 18:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9366710E608;
	Fri, 16 Dec 2022 17:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67610E608
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 17:23:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6EOv-0000AB-A4; Fri, 16 Dec 2022 18:21:37 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6EOt-004yFx-MX; Fri, 16 Dec 2022 18:21:36 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6EOt-000CKw-R8; Fri, 16 Dec 2022 18:21:35 +0100
Message-ID: <726d6dade0104b1dec7b9b8f7674a4bb137e8c3b.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: move IPUv3 driver into separate subdirectory
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>
Date: Fri, 16 Dec 2022 18:21:35 +0100
In-Reply-To: <20221216120352.7ke5msphsqfybagb@pengutronix.de>
References: <20221125112519.3849636-1-l.stach@pengutronix.de>
 <20221216120352.7ke5msphsqfybagb@pengutronix.de>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-16 at 13:03 +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Fri, Nov 25, 2022 at 12:25:19PM +0100, Lucas Stach wrote:
> > diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefil=
e
> > index b644deffe948..909622864716 100644
> > --- a/drivers/gpu/drm/imx/Makefile
> > +++ b/drivers/gpu/drm/imx/Makefile
> > @@ -1,12 +1,4 @@
> > [...]
> > =C2=A0obj-$(CONFIG_DRM_IMX_DCSS) +=3D dcss/
> > +obj-$(CONFIG_DRM_IMX) +=3D ipuv3/
>=20
> I wonder if it would make sense to rename DRM_IMX to DRM_IMX_IPUV3 ?!
>=20
> > diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ip=
uv3/Kconfig
> > new file mode 100644
> > index 000000000000..f518eb47a18e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> > [...]
> > +config DRM_IMX_HDMI
> > +	tristate "Freescale i.MX DRM HDMI"
> > +	select DRM_DW_HDMI
> > +	depends on DRM_IMX && OF
> > +	help
> > +	  Choose this if you want to use HDMI on i.MX6.
> > +
>=20
> Trailing empty line could be dropped.

I'll do that when applying.

regards
Philipp
