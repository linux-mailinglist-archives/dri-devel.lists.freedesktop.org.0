Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCDCDADAF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8C96E4B5;
	Thu, 17 Oct 2019 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80D6E4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:59:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y135so6988134wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 05:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eGUIK0PpAIsIpRLm9AJuAXW9uw/3C3pe7mkSPVQ9iKY=;
 b=J+aPVrLPK8+V80kRlqTaUZ04q4Zd5ZkkY/IK2JIW2209CFXbktzy+GTWisS/SLxR81
 Ojh+K12gv474N6a47A1oNLmtfnbtrR1SbM6INJosZSCWJBdB1sCu7aUBtj+8pApdryke
 S+aHo8Hzmqw60/sZd0j+cqhMcUBpm3b5u/32LUE/xBuGJTKXi8rwxze2WWuLqBRumSiX
 IazPolIFxkQybaFJ2UHI8jKMiBf++L0Nd6u8y+C0STH/6m4a84abmV2HB7B2LhnM8Q8S
 zM4fm9z0NbE7dA1W+6j3MRSsu3bOFeq4e+Y8skDgfNUQNGrDqfM0+mQzIwbC54PUorut
 CnXw==
X-Gm-Message-State: APjAAAVobkuPc9CKRWVlpPsdYiNlVTLggzersgeenP3GB37KfQbkqA2w
 erj1tCIskctU4k35J5BSrNM=
X-Google-Smtp-Source: APXvYqw1gwohicC0woIA61sOkk34Ll3Dk14yZplifPlNQB21iudRORkj2ab8GxEfGrqYznlMmnxrKg==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr2729881wmc.140.1571317174304; 
 Thu, 17 Oct 2019 05:59:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id g4sm2233226wrw.9.2019.10.17.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 05:59:33 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:59:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017125932.GB3768303@ulmo>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
 <20191017101116.3d5okxmto5coecad@pengutronix.de>
 <20191017111131.GB3122066@ulmo>
 <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eGUIK0PpAIsIpRLm9AJuAXW9uw/3C3pe7mkSPVQ9iKY=;
 b=lrC6hwEdkyzsD3dqVOf9L5gCGbE7EF8CM0OWn62lW9KNoa+HsR9rk6EHAfSW85Ixl5
 ZkUmTl4CjVt/AuuAv42Pk6dc+fQqvkjX9TI4ox3hw/Tg/szJb/JcJ5WKXvAkkxx5BdAn
 qIuVdyPGWINm0tuSfNQojYFzeZhyCWnGul0U7R0U72vJEhYIt/yUJcvrJe2SpQ3eyW5/
 UYRxSSYdJeSMCa1xdLrIV3XJlWtHiy9mNcssV0/P9KjlUQ7TqvXwp9q/rrBlD1eFR4vj
 soxP+A2dCIIBO5wycOV+QrZGxLFCGZMrbxA3K0QW8wcjBD53MYe35ANL5jws6q/T7UOC
 k/Aw==
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
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Adam Ford <aford173@gmail.com>
Content-Type: multipart/mixed; boundary="===============1458256940=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1458256940==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 02:09:17PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Oct 17, 2019 at 01:11:31PM +0200, Thierry Reding wrote:
> > On Thu, Oct 17, 2019 at 12:11:16PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Oct 17, 2019 at 11:48:08AM +0200, Michal Vok=C3=A1=C4=8D wrot=
e:
> > > > On 17. 10. 19 10:10, Uwe Kleine-K=C3=B6nig wrote:
> > > > > A previous change in the pwm core (namely 01ccf903edd6 ("pwm: Let
> > > > > pwm_get_state() return the last implemented state")) changed the
> > > > > semantic of pwm_get_state() and disclosed an (as it seems) common
> > > > > problem in lowlevel PWM drivers. By not relying on the period and=
 duty
> > > > > cycle being retrievable from a disabled PWM this type of problem =
is
> > > > > worked around.
> > > > >=20
> > > > > Apart from this issue only calling the pwm_get_state/pwm_apply_st=
ate
> > > > > combo once is also more effective.
> > > > >=20
> > > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
=2Ede>
> > > > > ---
> > > > > Hello,
> > > > >=20
> > > > > There are now two reports about 01ccf903edd6 breaking a backlight=
=2E As
> > > > > far as I understand the problem this is a combination of the back=
end pwm
> > > > > driver yielding surprising results and the pwm-bl driver doing th=
ings
> > > > > more complicated than necessary.
> > > > >=20
> > > > > So I guess this patch works around these problems. Still it would=
 be
> > > > > interesting to find out the details in the imx driver that trigge=
rs the
> > > > > problem. So Adam, can you please instrument the pwm-imx27 driver =
to
> > > > > print *state at the beginning of pwm_imx27_apply() and the end of
> > > > > pwm_imx27_get_state() and provide the results?
> > > > >=20
> > > > > Note I only compile tested this change.
> > > >=20
> > > > Hi Uwe,
> > > > I was just about to respond to the "pwm_bl on i.MX6Q broken on 5.4-=
RC1+"
> > > > thread that I have a similar problem when you submitted this patch.
> > > >=20
> > > > So here are my few cents:
> > > >=20
> > > > My setup is as follows:
> > > >  - imx6dl-yapp4-draco with i.MX6Solo
> > > >  - backlight is controlled with inverted PWM signal
> > > >  - max brightness level =3D 32, default brightness level set to 32 =
in DT.
> > > >=20
> > > > 1. Almost correct backlight behavior before 01ccf903edd6 ("pwm: Let
> > > >    pwm_get_state() return the last implemented state):
> > > >=20
> > > >  - System boots to userspace and backlight is enabled all the time =
=66rom
> > > >    power up.
> > > >=20
> > > >    $ dmesg | grep state
> > > >    [    1.763381] get state end: -1811360608, enabled: 0
> > >=20
> > > What is -1811360608? When I wrote "print *state" above, I thought abo=
ut
> > > something like:
> > >=20
> > > 	pr_info("%s: period: %u, duty: %u, polarity: %d, enabled: %d",
> > > 		__func__, state->period, state->duty_cycle, state->polarity, state-=
>enabled);
> > >=20
> > > A quick look into drivers/pwm/pwm-imx27.c shows that this is another
> > > driver that yields duty_cycle =3D 0 when the hardware is off.
> >=20
> > It seems to me like the best recourse to fix this for now would be to
> > patch up the drivers that return 0 when the hardware is off by caching
> > the currently configured duty cycle.
> >=20
> > How about the patch below?
> >=20
> > Thierry
> >=20
> > --- >8 ---
> > From 15a52a7f1b910804fabd74a5882befd3f9d6bb37 Mon Sep 17 00:00:00 2001
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Date: Thu, 17 Oct 2019 12:56:00 +0200
> > Subject: [PATCH] pwm: imx27: Cache duty cycle register value
> >=20
> > The hardware register containing the duty cycle value cannot be accessed
> > when the PWM is disabled. This causes the ->get_state() callback to read
> > back a duty cycle value of 0, which can confuse consumer drivers.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > ---
> >  drivers/pwm/pwm-imx27.c | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> > index ae11d8577f18..4113d5cd4c62 100644
> > --- a/drivers/pwm/pwm-imx27.c
> > +++ b/drivers/pwm/pwm-imx27.c
> > @@ -85,6 +85,13 @@ struct pwm_imx27_chip {
> >  	struct clk	*clk_per;
> >  	void __iomem	*mmio_base;
> >  	struct pwm_chip	chip;
> > +
> > +	/*
> > +	 * The driver cannot read the current duty cycle from the hardware if
> > +	 * the hardware is disabled. Cache the last programmed duty cycle
> > +	 * value to return in that case.
> > +	 */
> > +	unsigned int duty_cycle;
> >  };
> > =20
> >  #define to_pwm_imx27_chip(chip)	container_of(chip, struct pwm_imx27_ch=
ip, chip)
> > @@ -155,14 +162,17 @@ static void pwm_imx27_get_state(struct pwm_chip *=
chip,
> >  	tmp =3D NSEC_PER_SEC * (u64)(period + 2);
> >  	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
> > =20
> > -	/* PWMSAR can be read only if PWM is enabled */
> > -	if (state->enabled) {
> > +	/*
> > +	 * PWMSAR can be read only if PWM is enabled. If the PWM is disabled,
> > +	 * use the cached value.
> > +	 */
> > +	if (state->enabled)
> >  		val =3D readl(imx->mmio_base + MX3_PWMSAR);
> > -		tmp =3D NSEC_PER_SEC * (u64)(val);
> > -		state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
> > -	} else {
> > -		state->duty_cycle =3D 0;
> > -	}
> > +	else
> > +		val =3D imx->duty_cycle;
> > +
> > +	tmp =3D NSEC_PER_SEC * (u64)(val);
> > +	state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
> > =20
> >  	if (!state->enabled)
> >  		pwm_imx27_clk_disable_unprepare(chip);
> > @@ -261,6 +271,13 @@ static int pwm_imx27_apply(struct pwm_chip *chip, =
struct pwm_device *pwm,
> >  		writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
> >  		writel(period_cycles, imx->mmio_base + MX3_PWMPR);
> > =20
> > +		/*
> > +		 * Store the duty cycle for future reference in cases where
> > +		 * the MX3_PWMSAR register can't be read (i.e. when the PWM
> > +		 * is disabled).
> > +		 */
> > +		imx->duty_cycle =3D duty_cycles;
> > +
>=20
> I wonder if it would be more sensible to do this in the pwm core
> instead. Currently there are two drivers known with this problem. I
> wouldn't be surprised if there were more.

I've inspected all the drivers and didn't spot any beyond cros-ec and
i.MX that have this problem. There's also no good way to do this in the
core, because the core doesn't know whether or not the driver is capable
of returning the correct duty cycle on hardare readout. So the core
would have to rely on state->duty_cycle that is passed in, but then the
offending commit becomes useless because the whole point was to return
the state as written to hardware (rather than the software state which
was being returned before that patch).

> If we want to move clients to not rely on .period and .duty_cycle for a
> disabled PWM (do we?) a single change in the core is also beneficial
> compared to fixing several lowlevel drivers.

These are really two orthogonal problems. We don't currently consider
enabled =3D 0 to be equivalent to duty_cycle =3D 0 at an API level. I'm not
prepared to do that at this point in the release cycle either.

What this here has shown is that we have at least two drivers that don't
behave the way they are supposed to according to the API and they break
consumers. If they break for pwm-backlight, it's possible that they will
break for other consumers as well. So the right thing to do is fix the
two drivers that are broken.

After -rc1 we no longer experiment. Instead we clean up the messes we've
made. We can revisit the other points once mainline is fixed.

Thierry

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oZbQACgkQ3SOs138+
s6GxaQ//YDkUfShTKEsd0Bal9lljox+JNZNqGm+xir9cV2Y9QJuJuW7PipXlpC84
ar8D0C1cBjzUzYfcLO24xOcS77UyDyfqNXIIWZ0x7z+pJKn7kvk/EWWYb688yV72
Gba48kTDJctpYJrSMGXzRr1HwgYd9in4tDo0zvWU0Q3nVItXkaukXabMFDcl0HiW
dGLRuwGlc6sBunWrZfV2sF6shTsv11ooUG2T0bzM7mPwCm/afUUw+CHOJ8wOiRlN
J88UplHzDJOHEuPqHnJCnCq3UUfA93rpr9/YtYAbTpJo6ApNsrRnM1lRsZh0w5YE
v3YODJwPXba5g1Jq2TtGeegnOhdXTZ7LuuOrb0Lle4wCtTYch/Kx2Iim/AYJlLj6
VWMKJCU2tLy/sdSVrLaTCZXtVYVygWAZin7sgcQLgMui7l9R4CeXyoTq2fEOWPpK
ehD4fjrlGqfmyimxT50fOjijYzI3699ks3E8RsIqKsR5Tuc2Bt/78H80+GcyRRoi
8tue11EkABjRulCGoiskCJolc+o+V5Zx2zIqBfUlMJGV7/xZ+RKOVmGX1b3+t3f1
MqUSTjtnDuIuhByeaHej7tt1NXmUwTAcRbuYtNW9e4XGXHR9RO8viqr8t1OkkRRr
8j2FUl+fQoMEBNUB0aGc20NIIuQ0LV+Alzb2iIfAMJkdl+ViHRc=
=IbCT
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--

--===============1458256940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1458256940==--
