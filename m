Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E975DAAFA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307589A8B;
	Thu, 17 Oct 2019 11:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B027989A8B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:11:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b9so1886474wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 04:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uVoXPPtms2OBj9SVIoZ3oN8jHS0q6WrUSpAbwHPKjrg=;
 b=OIjIyMgvx9VFrpYKEsZCb0fXEvhCjmDyIebhvmtN/RPPKzkLePElOjpYYgr2iDIx4x
 CmalRYaOOTWu4QthNeaIQOKylr5/hIG5zeI00kkL7mcG4wtNG95kVAYLZ9mB240o4QfB
 TokXab66noXt/gUBCxRUwm/YncOGrAYOSzexCtmFSVIiRXBapllc0BIiHm2DIxTaWgoG
 /cmgF76bufWWYS0iiBMKZjWfd+IOu5cJQCGkRqZNnorafTqFYzPgbkIdy0Fi9yd4Vylb
 0IdbFcPGfiumEboWDnJK0NJYjUrvQWkbe7QrEmec7BLgsfQj8cFjsT5P0EscAfR2I75R
 baVw==
X-Gm-Message-State: APjAAAXU7iuLGAZP02bELHhID000vBIFhbvQc2Dl0Hpfadg4n/bd02E2
 rYZbComOqAvlYAJ59qxIZ0w=
X-Google-Smtp-Source: APXvYqzO6ItEC3kt8jHNlX8r4xUT/KN/LQBY0LzMSmWlc636G/V/pvm/CFIOecA2do+FFkDUPQMN7w==
X-Received: by 2002:a5d:544a:: with SMTP id w10mr2479776wrv.271.1571310694122; 
 Thu, 17 Oct 2019 04:11:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n1sm1959172wrg.67.2019.10.17.04.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 04:11:32 -0700 (PDT)
Date: Thu, 17 Oct 2019 13:11:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017111131.GB3122066@ulmo>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
 <20191017101116.3d5okxmto5coecad@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20191017101116.3d5okxmto5coecad@pengutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uVoXPPtms2OBj9SVIoZ3oN8jHS0q6WrUSpAbwHPKjrg=;
 b=gPxNkUdZqcMM9+6sy0HJERWLjuFkJJrrDGM3u6HPwRkjvFaYvif8HzG8KxxboGrVIW
 TkOyUKHGLyFD3mmiC84rYOnRuQZ/m7H9uVVNhQE1ffUmYGADEnvzc2B2loGuS/0FbvbX
 S8X8yHPvCxJ5rDSqd4ywqqp0m+7UdbnzcKDJKdwYLCvOGvapxjBBkUlGz8/2AxHNiCu0
 HlZ/fk+cKj5DsqEpzAPLzDWVu/p+K5Qi+779lELsQZwdYioMB6bZaFyCHAuAlow39aTx
 EoSffv1+i4P9aZhE9254IQkehTP6dy4v4kOf4if3PGbVEDotsL4HZgNKtN4QX8R6TxV8
 +ShQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
 Lee Jones <lee.jones@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Adam Ford <aford173@gmail.com>
Content-Type: multipart/mixed; boundary="===============1448861735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1448861735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 12:11:16PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Oct 17, 2019 at 11:48:08AM +0200, Michal Vok=C3=A1=C4=8D wrote:
> > On 17. 10. 19 10:10, Uwe Kleine-K=C3=B6nig wrote:
> > > A previous change in the pwm core (namely 01ccf903edd6 ("pwm: Let
> > > pwm_get_state() return the last implemented state")) changed the
> > > semantic of pwm_get_state() and disclosed an (as it seems) common
> > > problem in lowlevel PWM drivers. By not relying on the period and duty
> > > cycle being retrievable from a disabled PWM this type of problem is
> > > worked around.
> > >=20
> > > Apart from this issue only calling the pwm_get_state/pwm_apply_state
> > > combo once is also more effective.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > >=20
> > > There are now two reports about 01ccf903edd6 breaking a backlight. As
> > > far as I understand the problem this is a combination of the backend =
pwm
> > > driver yielding surprising results and the pwm-bl driver doing things
> > > more complicated than necessary.
> > >=20
> > > So I guess this patch works around these problems. Still it would be
> > > interesting to find out the details in the imx driver that triggers t=
he
> > > problem. So Adam, can you please instrument the pwm-imx27 driver to
> > > print *state at the beginning of pwm_imx27_apply() and the end of
> > > pwm_imx27_get_state() and provide the results?
> > >=20
> > > Note I only compile tested this change.
> >=20
> > Hi Uwe,
> > I was just about to respond to the "pwm_bl on i.MX6Q broken on 5.4-RC1+"
> > thread that I have a similar problem when you submitted this patch.
> >=20
> > So here are my few cents:
> >=20
> > My setup is as follows:
> >  - imx6dl-yapp4-draco with i.MX6Solo
> >  - backlight is controlled with inverted PWM signal
> >  - max brightness level =3D 32, default brightness level set to 32 in D=
T.
> >=20
> > 1. Almost correct backlight behavior before 01ccf903edd6 ("pwm: Let
> >    pwm_get_state() return the last implemented state):
> >=20
> >  - System boots to userspace and backlight is enabled all the time from
> >    power up.
> >=20
> >    $ dmesg | grep state
> >    [    1.763381] get state end: -1811360608, enabled: 0
>=20
> What is -1811360608? When I wrote "print *state" above, I thought about
> something like:
>=20
> 	pr_info("%s: period: %u, duty: %u, polarity: %d, enabled: %d",
> 		__func__, state->period, state->duty_cycle, state->polarity, state->ena=
bled);
>=20
> A quick look into drivers/pwm/pwm-imx27.c shows that this is another
> driver that yields duty_cycle =3D 0 when the hardware is off.

It seems to me like the best recourse to fix this for now would be to
patch up the drivers that return 0 when the hardware is off by caching
the currently configured duty cycle.

How about the patch below?

Thierry

--- >8 ---
=46rom 15a52a7f1b910804fabd74a5882befd3f9d6bb37 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 17 Oct 2019 12:56:00 +0200
Subject: [PATCH] pwm: imx27: Cache duty cycle register value

The hardware register containing the duty cycle value cannot be accessed
when the PWM is disabled. This causes the ->get_state() callback to read
back a duty cycle value of 0, which can confuse consumer drivers.

Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/pwm/pwm-imx27.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index ae11d8577f18..4113d5cd4c62 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -85,6 +85,13 @@ struct pwm_imx27_chip {
 	struct clk	*clk_per;
 	void __iomem	*mmio_base;
 	struct pwm_chip	chip;
+
+	/*
+	 * The driver cannot read the current duty cycle from the hardware if
+	 * the hardware is disabled. Cache the last programmed duty cycle
+	 * value to return in that case.
+	 */
+	unsigned int duty_cycle;
 };
=20
 #define to_pwm_imx27_chip(chip)	container_of(chip, struct pwm_imx27_chip, =
chip)
@@ -155,14 +162,17 @@ static void pwm_imx27_get_state(struct pwm_chip *chip,
 	tmp =3D NSEC_PER_SEC * (u64)(period + 2);
 	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
=20
-	/* PWMSAR can be read only if PWM is enabled */
-	if (state->enabled) {
+	/*
+	 * PWMSAR can be read only if PWM is enabled. If the PWM is disabled,
+	 * use the cached value.
+	 */
+	if (state->enabled)
 		val =3D readl(imx->mmio_base + MX3_PWMSAR);
-		tmp =3D NSEC_PER_SEC * (u64)(val);
-		state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
-	} else {
-		state->duty_cycle =3D 0;
-	}
+	else
+		val =3D imx->duty_cycle;
+
+	tmp =3D NSEC_PER_SEC * (u64)(val);
+	state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
=20
 	if (!state->enabled)
 		pwm_imx27_clk_disable_unprepare(chip);
@@ -261,6 +271,13 @@ static int pwm_imx27_apply(struct pwm_chip *chip, stru=
ct pwm_device *pwm,
 		writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
 		writel(period_cycles, imx->mmio_base + MX3_PWMPR);
=20
+		/*
+		 * Store the duty cycle for future reference in cases where
+		 * the MX3_PWMSAR register can't be read (i.e. when the PWM
+		 * is disabled).
+		 */
+		imx->duty_cycle =3D duty_cycles;
+
 		cr =3D MX3_PWMCR_PRESCALER_SET(prescale) |
 		     MX3_PWMCR_STOPEN | MX3_PWMCR_DOZEN | MX3_PWMCR_WAITEN |
 		     FIELD_PREP(MX3_PWMCR_CLKSRC, MX3_PWMCR_CLKSRC_IPG_HIGH) |
--=20
2.23.0


--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oTGAACgkQ3SOs138+
s6ErwRAAqDNujr5rVterfUV5MOpCMJiGtVSWik2J4qpL+Sz0dMupM5exBLxllNkO
18mgYX5ioHsCvKjW1bEaqivlvpig65n33OBuq3/TT0XxXZd7pQNWckf8vngK7xIo
MSlKUGyDekWVVt7zocpTpVWoVpV5bXAZ1MTcQCrbKkUsvgE/TU5R4vdXgXX/qd1I
7QNygG/tj2rjHVfIQaG2RnOf8sEof4NHBR+GrLR9IVMfQjGW0eVqJ4Vjqc4P/JIj
dvKptasZHRZvuN7zpywh1Jt5x4/GSr9Bhctfv1YwyrJs0HBrGyMsHDgRBVn02Wux
P395+fNsA554ih7iS4uE8eiqX/TTeRZw2cUgAptzlZsQgAJIIU18ziLkA4xyqSbV
NQz8AXcpDQGr5iYyxEwc2Z4GohO5wGaGP+yryUhrRnYvw38gejzYQKe7D87c2WnF
653wEbBWeX3OJQWjYY3MorS22TpSX1R4/xPC+AhS25Japo8JJPOihRwqWGt3JTec
NpqUyihBg23rnlgkjN68z5iaXtWqtonug4VKExySDZqW8Reg6eITMoEyWHoJ54mx
C+EKCBSnKNVEmMoAeIavscOrUWuxtNo5NUmHIbOxLL3vaiK330JrUSEkNjVPBEmF
HKuzBeOHKtBYhgXW7IxyXmvpSPGyTjsmyT3rOXDxn9dZIKasHuI=
=GrXG
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============1448861735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1448861735==--
