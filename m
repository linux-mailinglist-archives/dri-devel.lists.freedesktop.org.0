Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D07A5288E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 11:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F666E0B7;
	Tue, 25 Jun 2019 09:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF736E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:47:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so2236974wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 02:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lYoRiYMPDqJ615Z1cmg/E7Z6c9CCp2cXFBXsrhXIk/Q=;
 b=qP6Aj1RoeEfOfcrsqap5P+7a5RwOky+P/fz01AP1zhBUhZvWKVuanTjqmBkndbwzFR
 pFPX3fJ7VK2CugW7+tK6s2hNVq6swNirmIUVhM2xA79IUAkDrbx1RxSpfY5i1FdbOqOi
 owRK1v9OF1ENXZ6q8AHvwPyRpwOWjzzJmhskM9i3jhfGSDLiPC+KIoWbKL2UUvlP9G1I
 8+rpF1cRuPK7MnsSE83ddQWCIkPdy0Q8aTtGOym00gtElgCCsz3Sma+x9k1XLK2Nyxwv
 ET2dLt4KFQTDTn0gyDJ+x5ocxfql4RRN7aTVTayejjWslJAKsN8YUZuKjwb4g/qdhK/N
 HhqQ==
X-Gm-Message-State: APjAAAXLNMhKNSFm8Kq+4JEfG/Lcs/7z+r7nEoSN48sCKk/agW1LH373
 DJaPBI6jN/tVsxRZjuADI+0h8flD6k4=
X-Google-Smtp-Source: APXvYqymw/zXJ2rbnbNEhN/CLa/1taPiU4sl3wi/5yVBLGK+MMOJHgL3CHclaDRU07sY5n6ZnSXcLg==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr19325923wmu.137.1561456078097; 
 Tue, 25 Jun 2019 02:47:58 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id m9sm12433654wrn.92.2019.06.25.02.47.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 02:47:57 -0700 (PDT)
Date: Tue, 25 Jun 2019 11:47:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
Message-ID: <20190625094756.GC1516@ulmo>
References: <20190522163428.7078-1-paul@crapouillou.net>
 <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
 <20190621135608.GB11839@ulmo>
 <20190624112844.fmwbfpdxjkst3u7r@holly.lan>
 <1561386717.20436.0@crapouillou.net>
MIME-Version: 1.0
In-Reply-To: <1561386717.20436.0@crapouillou.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lYoRiYMPDqJ615Z1cmg/E7Z6c9CCp2cXFBXsrhXIk/Q=;
 b=hJ1QrRsmQszF8RNHk4snwHNOtUbSau5zU14890YS7sTTXvGMDB8Kvil3SjOBv+zxZ2
 wyq3XmBe2jMbMYLRjnMHGirh/el872bcuo7P0Tthrl50rfPZdulFjnLx6Lxbjdg/7U9v
 IbERJWHB+AgiOS2ixE6N/PWhgAPidFONtT4jfH+cjX7vErJukTQNVXsoxWrdTYy6E39k
 5yaH8cv4GpTfLgV1tru5JQyyyq+l65WAlNajWuN6Ok+h/afr/iC0eVE42evcNduevPnW
 YL8SsTP9Qcy3waWLM/kCtv2CRipyxQXI9LwhkcwJhcSVz6CDHoFKr8wUNa1zEFYw+RJo
 CSFg==
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0722142565=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0722142565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2019 at 04:31:57PM +0200, Paul Cercueil wrote:
>=20
>=20
> Le lun. 24 juin 2019 =C3=A0 13:28, Daniel Thompson <daniel.thompson@linar=
o.org> a
> =C3=A9crit :
> > On Fri, Jun 21, 2019 at 03:56:08PM +0200, Thierry Reding wrote:
> > >  On Fri, Jun 21, 2019 at 01:41:45PM +0100, Daniel Thompson wrote:
> > >  > On 22/05/2019 17:34, Paul Cercueil wrote:
> > >  > > When the driver probes, the PWM pin is automatically configured
> > > to its
> > >  > > default state, which should be the "pwm" function.
> > >  >
> > >  > At which point in the probe... and by who?
> > >=20
> > >  The driver core will select the "default" state of a device right
> > > before
> > >  calling the driver's probe, see:
> > >=20
> > >  	drivers/base/pinctrl.c: pinctrl_bind_pins()
> > >=20
> > >  which is called from:
> > >=20
> > >  	drivers/base/dd.c: really_probe()
> > >=20
> >=20
> > Thanks. I assumed it would be something like that... although given
> > pwm-backlight is essentially a wrapper driver round a PWM I wondered why
> > the pinctrl was on the backlight node (rather than the PWM node).
> >=20
> > Looking at the DTs in the upstream kernel it looks like ~20% of the
> > backlight drivers have pinctrl on the backlight node. Others presumable
> > have none or have it on the PWM node (and it looks like support for
> > sleeping the pins is *very* rare amoung the PWM drivers).
>=20
> If your PWM driver has more than one channel and has the pinctrl node, you
> cannot fine-tune the state of individual pins. They all share the same
> state.

But that's something that could be changed, right? We could for example
extend the PWM bindings to allow describing each PWM instance via a sub-
node of the controller node. Pin control states could be described on a
per-channel basis that way.

> > >  > > However, at this
> > >  > > point we don't know the actual level of the pin, which may be
> > > active or
> > >  > > inactive. As a result, if the driver probes without enabling the
> > >  > > backlight, the PWM pin might be active, and the backlight would
> > > be
> > >  > > lit way before being officially enabled.
> > >  > >
> > >  > > To work around this, if the probe function doesn't enable the
> > > backlight,
> > >  > > the pin is set to its sleep state instead of the default one,
> > > until the
> > >  > > backlight is enabled. Whenk the backlight is disabled, the pin
> > > is reset
> > >  > > to its sleep state.
> > >  > Doesn't this workaround result in a backlight flash between
> > > whatever enables
> > >  > it and the new code turning it off again?
> > >=20
> > >  Yeah, I think it would. I guess if you're very careful on how you
> > > set up
> > >  the device tree you might be able to work around it. Besides the
> > > default
> > >  and idle standard pinctrl states, there's also the "init" state. The
> > >  core will select that instead of the default state if available.
> > > However
> > >  there's also pinctrl_init_done() which will try again to switch to
> > > the
> > >  default state after probe has finished and the driver didn't switch
> > > away
> > >  from the init state.
> > >=20
> > >  So you could presumably set up the device tree such that you have
> > > three
> > >  states defined: "default" would be the one where the PWM pin is
> > > active,
> > >  "idle" would be used when backlight is off (PWM pin inactive) and
> > > then
> > >  another "init" state that would be the same as "idle" to be used
> > > during
> > >  probe. During probe the driver could then switch to the "idle"
> > > state so
> > >  that the pin shouldn't glitch.
> > >=20
> > >  I'm not sure this would actually work because I think the way that
> > >  pinctrl handles states both "init" and "idle" would be the same
> > > pointer
> > >  values and therefore pinctrl_init_done() would think the driver
> > > didn't
> > >  change away from the "init" state because it is the same pointer
> > > value
> > >  as the "idle" state that the driver selected. One way to work around
> > >  that would be to duplicate the "idle" state definition and
> > > associate one
> > >  instance of it with the "idle" state and the other with the "init"
> > >  state. At that point both states should be different (different
> > > pointer
> > >  values) and we'd get the init state selected automatically before
> > > probe,
> > >  select "idle" during probe and then the core will leave it alone.
> > > That's
> > >  of course ugly because we duplicate the pinctrl state in DT, but
> > > perhaps
> > >  it's the least ugly solution.
> > >  Adding Linus for visibility. Perhaps he can share some insight.
> >=20
> > To be honest I'm happy to summarize in my head as "if it flashes then
> > it's not
> > a pwm_bl.c's problem" ;-).
>=20
> It does not flash. But the backlight lits way too early, so we have a 1-2
> seconds
> of "white screen" before the panel driver starts.

I think this always goes both ways. If you set the sleep state for the
PWM on backlight probe with this patch, you may be able to work around
the problem of the backlight lighting up too early. But what if your
bootloader had already enabled the backlight and is showing a splash
screen during boot? Your patch would turn off the backlight and then it
would turn on again after everything else was initialized. That's one
type of flashing.

What we need in this case are explicit pin control states that will
enable fine-grained control over what happens. Anything implicit is
bound to fail because it bakes in an assumption (either that the
backlight is off during boot, or that it has been turned on already).

Ideally we'd need to detect that the backlight is on and if it is we
just don't do anything with it. Actually, I think that's what we want
even if the backlight is off. During probe the backlight state should
not be modified. You only want to modify it when you know that some
display driver is going to take over. If you can't seamlessly transition
to the kernel display driver, flashing may be okay. If your display
driver can take over seamlessly, then the backlight is likely already in
the desired state anyway.

Thierry

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0R7cwACgkQ3SOs138+
s6FL5Q/+LnIWzKdbonzgRFNIdGOvTzzhsl/UXibA/87usIpnjSEyvhDGTIPP/HAk
J0y5cyOws1pUhwyzmSbcz31MAsMUO4q9PjMFGRJHN0DbjEJSlFw8DgMV8Vii4jpk
xKiRTwch9VKjIe/iiT0kEk7C0ZlaKPu1fUoacN98UrskLNF4x3megjuvoZiGuiNu
URKLlTrYmHpcZUgGr6N+e1PHCHWnPGvWR5sk6FuQk7At//3gs1a40lOPSBDgxvwo
DuEHGi7SWZkgd1kVkPTxz4QiyHKt5Hw0ryw+BRyW2eqX2Od3LNJOFFHroR8vYKs4
7fo5hK4aoTDpNBbudd86dxo85XL7w+DMbz29u/punmSrxDFUKIDfOZqcyasFsm+r
JEoMPuZEjYr/6ssZpKebuInBiuBRyLY7PCCy7NU2lUb7/Ls79wYj1ZkURO3J2w5m
ioWNeDSqrgy6bEp699HPNaybR0ffxt4fqeP5cAhNUa1++Jc2b2C5UFcCgKuuks4t
fP/H+sjjvQHMI6m9wTdWrZzYHDNuHk414522/v6ybqqNf36seB5kStD3kGOBDsKo
MyLDMBuw5WXOmCaCSnjvZdOe3SFTY3n0yMl/JaxX5EWpCwxnZFSJpdKNantHdc2U
zvwFz5elaoCeu7P8HekTRV2e3xqeDeusk/OJrbPo5VJOaK+sIJs=
=B4rf
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

--===============0722142565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0722142565==--
