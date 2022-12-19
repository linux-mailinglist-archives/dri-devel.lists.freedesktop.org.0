Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128296509A9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 10:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94410E219;
	Mon, 19 Dec 2022 09:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FB410E219
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:57:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7Ctl-0007es-GS; Mon, 19 Dec 2022 10:57:29 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7Ctj-000Im8-GJ; Mon, 19 Dec 2022 10:57:27 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7Cti-000A2F-GS; Mon, 19 Dec 2022 10:57:26 +0100
Message-ID: <25a5e32654a2e1dbe5d0b92af78c1316e0249d60.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/imx/lcdc: Implement DRM driver for imx21
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 19 Dec 2022 10:57:26 +0100
In-Reply-To: <20221216210054.vxz7rble3k6nwxat@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
 <e33399bfe5b761ee85cf491247773f2e2fdf579b.camel@pengutronix.de>
 <20221216210054.vxz7rble3k6nwxat@pengutronix.de>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-16 at 22:00 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hallo Philipp,
>=20
> On Fri, Dec 16, 2022 at 07:05:13PM +0100, Philipp Zabel wrote:
> > On Fr, 2022-12-16 at 18:50 +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > From: Marian Cichy <m.cichy@pengutronix.de>
> > >=20
> > > Add support for the LCD Controller found on i.MX21 and i.MX25.
> > >=20
> > > It targets to be a drop in replacement for the imx-fb driver.
> > >=20
> > > Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> > > [ukl: Rebase to v6.1, various smaller fixes]
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > =C2=A0drivers/gpu/drm/imx/Kconfig         |   1 +
> > > =C2=A0drivers/gpu/drm/imx/Makefile        |   1 +
> >=20
> > I miss drivers/gpu/drm/imx/lcdc/{Kconfig,Makefile}.
>=20
> Their content is:
>=20
> ----- Kconfig -----
> config DRM_IMX_LCDC
> 	tristate "Freescale i.MX LCDC displays"
> 	depends on DRM && (ARCH_MXC || COMPILE_TEST)
> 	select DRM_GEM_DMA_HELPER
> 	select DRM_KMS_HELPER
> 	help
> 	  Found on i.MX1, i.MX21, i.MX25 and i.MX27.
> ----- Makefile -----
> obj-y +=3D imx-lcdc.o
> ----- >8 -----------
>=20
> will resend the series once both dependent patches are in Linus' tree.
> Until then this v3 should be good enough to give reviewers a chance to
> look.

Please also rebase past 8ab59da26bc0 ("drm/fb-helper: Move generic
fbdev emulation into separate source file") and 00b5497d642b
("drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()").
These changes let me compile imx-lcdc.c on top of drm-misc-next:

----------8<----------
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc=
/imx-lcdc.c
index 79fbb7956374..1bb46a346377 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -4,7 +4,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_generic.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -368,7 +368,6 @@ static const struct drm_simple_display_pipe_funcs imx_l=
cdc_pipe_funcs =3D {
 	.disable =3D imx_lcdc_pipe_disable,
 	.check =3D imx_lcdc_pipe_check,
 	.update =3D imx_lcdc_pipe_update,
-	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
 };
=20
 static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs =3D {
---------->8----------

regards
Philipp

