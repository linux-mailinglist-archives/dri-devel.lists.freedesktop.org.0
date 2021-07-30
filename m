Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9623DB8A4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 14:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAFD6E214;
	Fri, 30 Jul 2021 12:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06716E214
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 12:31:57 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m9RgA-0001JJ-Uj; Fri, 30 Jul 2021 14:31:54 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m9Rg9-0007mm-Hz; Fri, 30 Jul 2021 14:31:53 +0200
Message-ID: <048851b26d012069ecaf52286ec48d2b4e38571d.camel@pengutronix.de>
Subject: Re: [PATCH 3/7] drm/imx/dcss: Enable COMPILE_TEST on all ARM64
 platforms
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>
Date: Fri, 30 Jul 2021 14:31:53 +0200
In-Reply-To: <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-07-30 at 14:10 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
>=20
> On Wed, Jul 28, 2021 at 5:37 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > To extend test coverage, relax the dependency on ARCH_MXC to also enabl=
e
> > compilation when COMPILE_TEST is selected.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/gpu/drm/imx/dcss/Kconfig
> > +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> > @@ -3,7 +3,8 @@ config DRM_IMX_DCSS
> >         select IMX_IRQSTEER
> >         select DRM_KMS_CMA_HELPER
> >         select VIDEOMODE_HELPERS
> > -       depends on DRM && ARCH_MXC && ARM64
> > +       depends on DRM
> > +       depends on ARM64 && (ARCH_MXC || COMPILE_TEST)
>=20
> As you now have two depends statements, I think this would be easier
> to read by maintaining a strict separation between "hard" and "soft"
> dependencies:
>=20
>     depends on DRM && ARM64
>     depends on ARCH_MXC || COMPILE_TEST

I would let (ARCH_MXC && ARM64) stay together, and as Tomi suggested,
lift the ARM64 limitation if COMPILE_TEST is enabled:

	depends on DRM
	depends on (ARCH_MXC && ARM64) || COMPILE_TEST

regards
Philipp
