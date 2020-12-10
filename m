Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42152D5B2B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 14:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E996E0C6;
	Thu, 10 Dec 2020 13:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895906E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:05:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1knLcu-0006tP-Kd; Thu, 10 Dec 2020 14:04:56 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1knLcr-0005uN-JF; Thu, 10 Dec 2020 14:04:53 +0100
Date: Thu, 10 Dec 2020 14:04:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20201210130453.regjkemfneqbelsi@pengutronix.de>
References: <20201208044022.972872-1-bjorn.andersson@linaro.org>
 <20201210015136.GA18407@dragon>
MIME-Version: 1.0
In-Reply-To: <20201210015136.GA18407@dragon>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1593656513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1593656513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vktqqj3foceazlog"
Content-Disposition: inline


--vktqqj3foceazlog
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Thu, Dec 10, 2020 at 09:51:37AM +0800, Shawn Guo wrote:
> On Mon, Dec 07, 2020 at 10:40:22PM -0600, Bjorn Andersson wrote:
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> >=20
> > Special thanks to Doug Anderson for suggestions related to the involved
> > math.
> >=20
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 202 ++++++++++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index f27306c51e4d..43c0acba57ab 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -4,6 +4,7 @@
> >   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
> >   */
> > =20
> > +#include <linux/atomic.h>
> >  #include <linux/bits.h>
> >  #include <linux/clk.h>
> >  #include <linux/debugfs.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > =20
> > @@ -89,6 +91,11 @@
> >  #define SN_ML_TX_MODE_REG			0x96
> >  #define  ML_TX_MAIN_LINK_OFF			0
> >  #define  ML_TX_NORMAL_MODE			BIT(0)
> > +#define SN_PWM_PRE_DIV_REG			0xA0
> > +#define SN_BACKLIGHT_SCALE_REG			0xA1
> > +#define  BACKLIGHT_SCALE_MAX			0xFFFF
> > +#define SN_BACKLIGHT_REG			0xA3
> > +#define SN_PWM_EN_INV_REG			0xA5
> >  #define SN_AUX_CMD_STATUS_REG			0xF4
> >  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
> >  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> > @@ -111,6 +118,8 @@
> > =20
> >  #define SN_LINK_TRAINING_TRIES		10
> > =20
> > +#define SN_PWM_GPIO			3
>=20
> So this maps to the GPIO4 described in sn65dsi86 datasheet.  I'm
> wondering if it's more readable to define the following SHIFT constants
> (your code), and use GPIO_MUX_GPIO4_SHIFT >> 2 where you need GPIO
> offset?
>=20
> #define  GPIO_MUX_GPIO1_SHIFT	0
> #define  GPIO_MUX_GPIO2_SHIFT	2
> #define  GPIO_MUX_GPIO3_SHIFT	4
> #define  GPIO_MUX_GPIO4_SHIFT	6
>=20
> If you agree, you may consider to integrate this patch beforehand:
>=20
> https://github.com/shawnguo2/linux/commit/7cde887ffb3b27a36e77a08bee3666d=
14968b586

My preferred way here would be to add a prefix for the other constants.
It (IMHO) looks nicer and

	GPIO_INPUT_SHIFT

looks like a quite generic name for a hardware specific definition.
(Even if up to now there is no other code location using this name.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vktqqj3foceazlog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/SHPIACgkQwfwUeK3K
7An3bQf/TCV+GnguaD1LSJ2A9tlvNZtUZ1IR8zRMd7UYYoC4/txvHst8M6WSS3Kv
L5TymKzYqZuFIl9a9k6IGFaO1ZoraRkubVqAgDUMJLmMDQcDfZpRzU5YAs7jEc3M
KIjjwa5VJ2ibXJMUfKYOZOYsXt0kq+O8Y+8AMoBFU5khnB2gJgcTfhkymZ7O0K6Y
SQl0MOYVTpRPWVEQXrYNO3W9MQ9PnRIPD9hHm/HXOwTAEavYrAOTlIIELwc+6rzQ
qEjqaMfLq7zB/FC4m4CKjgWr9dP3gwdkTeIkKlqb8MPCbkmZU1gI+xcUTxjSUJgq
KADf+PlmwtCR7QRLlFVWKOyWICFxVw==
=Gpcn
-----END PGP SIGNATURE-----

--vktqqj3foceazlog--

--===============1593656513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1593656513==--
