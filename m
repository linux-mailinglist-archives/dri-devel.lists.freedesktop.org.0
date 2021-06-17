Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410623ABA04
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 18:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C246E941;
	Thu, 17 Jun 2021 16:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008C56E941
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 16:54:43 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ltvHp-00088t-6u; Thu, 17 Jun 2021 18:54:37 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ltvHl-0007GX-6x; Thu, 17 Jun 2021 18:54:33 +0200
Date: Thu, 17 Jun 2021 18:54:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210617165433.ltugrrj6ntmc6j57@pengutronix.de>
References: <20210615231828.835164-1-bjorn.andersson@linaro.org>
 <20210615231828.835164-2-bjorn.andersson@linaro.org>
 <20210616075637.jtoa25uyhnqkctlu@pengutronix.de>
 <YMq/6VhXrYJoTVnj@yoga>
 <20210617062449.qwsjcpkyiwzdyfi3@pengutronix.de>
 <YMt6gvXQKijtPOql@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ynj7mvu5qvymdtyg"
Content-Disposition: inline
In-Reply-To: <YMt6gvXQKijtPOql@yoga>
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
Cc: linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ynj7mvu5qvymdtyg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Thu, Jun 17, 2021 at 11:38:26AM -0500, Bjorn Andersson wrote:
> On Thu 17 Jun 01:24 CDT 2021, Uwe Kleine-K?nig wrote:
> > On Wed, Jun 16, 2021 at 10:22:17PM -0500, Bjorn Andersson wrote:
> > > > > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_dev=
ice *pwm,
> > > > > +			   const struct pwm_state *state)
> > > > > +{
> > > > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> > > > > +	unsigned int pwm_en_inv;
> > > > > +	unsigned int backlight;
> > > > > +	unsigned int pre_div;
> > > > > +	unsigned int scale;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!pdata->pwm_enabled) {
> > > > > +		ret =3D pm_runtime_get_sync(pdata->dev);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > > > +
> > > > > +		ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > > > > +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > > > > +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > > > > +		if (ret) {
> > > > > +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> > > > > +			goto out;
> > > > > +		}
> > > >=20
> > > > Do you need to do this even if state->enabled is false?
> > >=20
> > > I presume I should be able to explicitly mux in the GPIO function and
> > > configure that to output low. But I am not able to find anything in t=
he
> > > data sheet that would indicate this to be preferred.
> >=20
> > My question targetted a different case. If the PWM is off
> > (!pdata->pwm_enabled) and should remain off (state->enabled is false)
> > you can shortcut here, can you not?
>=20
> Right, if we're going off->off then we don't need to touch the hardware.
>=20
> But am I expected to -EINVAL improper period and duty cycle even though
> enabled is false?
>=20
> And also, what is the supposed behavior of enabled =3D false? Is it
> supposedly equivalent of asking for a duty_cycle of 0?

In my book enabled =3D false is just syntactic sugar to say:
"duty_cycle=3D0, period=3Dsomething small". So to answer your questions: if
enabled =3D false, the consumer doesn't really care about period and
duty_cycle. Some care that the output becomes inactive, some others
don't, so from my POV just emit the inactive level on the output and
ignore period and duty_cycle.

> > > > Does this already modify the output pin?
> > >=20
> > > Yes, coming out of reset this pin is configured as input, so switching
> > > the mux here will effectively start driving the pin.
> >=20
> > So please document this in the format the recently added drivers do,
> > too. See e.g. drivers/pwm/pwm-sifive.c. (The idea is to start that with
> > " * Limitations:" to make it easy to grep it.)
> >=20
>=20
> Okay, will do. Although I believe that for this driver it makes sense to
> place such comment close to this function, rather than at the top of the
> driver.

Yes, agreed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ynj7mvu5qvymdtyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDLfkUACgkQwfwUeK3K
7AnH5wf9GbfRNjWF8Bc/5z4m+rwW3D767cCXpR3eGzF6IIUlZfbil4VSg4h/s12J
+RfY8gCgXx2ks8sTTI3W4lT5MyDMX3xtaxxoPxB3BJPtCGZLuXIZxNONrIyRpDHc
4WO7T4E/UkZzQVIOlGmeGS0XT04kZoM7Zp9cjjKvwXn7h3PvOt1KT7I6oNT37iCc
vY79UoYUAsC/JVQYgVw7p/VmpF68VwxIlrvcvLbdotMUoWNKEPGu8/ozP18hXbfA
9+xGUIz8iptWZbhkn3jQrH2+2sg4RLleAbTKtUg1euHkcLrQbPWqaVYjcHtLgEVv
+dnK9ZYd7PP/5FZjwhdJZ+FnAi1u0g==
=JfHp
-----END PGP SIGNATURE-----

--ynj7mvu5qvymdtyg--
