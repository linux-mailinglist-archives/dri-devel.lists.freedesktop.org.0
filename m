Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43632DB30E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 19:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B86E071;
	Thu, 17 Oct 2019 17:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89EE6E071
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 17:13:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j11so3261877wrp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 10:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nPslfkOtVleJKrTI5Krr4L0h8uWgtmF9Du4PaGrgtbU=;
 b=EFwhO9eq+4QN0hthkOc+1g74rlfkQl2KLVQFkslQrRxd/wlvuc+rpZBYtOncQGT+1u
 lAOF2jlZA0VRHjSV3esuu+Y9nu7L63xHzhls1PZHxGiK3zivydRIzGXw/3FpGQYPj1N0
 XVR9ceMFCrC3SWCuNtDBd1eCF1fwKR6cHZI+9LyQBkf1+TItuxLkCWMfZ9NX82x0qfvt
 agS1AMsXha539okpHzR8K5yNtu2w1yEcwYu22csPGITvO5Y10DnW6UE29xpoURhYcHEW
 12z2po964qvW5VqsiBnv613cb8XbDWCNHclxlpao4cwMRyXKXpw9TA/HSz5k4DiE0Gax
 h3+Q==
X-Gm-Message-State: APjAAAX9U5C4gTF6SNNDVSKxvVlYRQD2aNFb48kKkqeWGMAqiB8kqBOY
 WT9R94sbrbLESQ4sPBKjJHM=
X-Google-Smtp-Source: APXvYqxobDqMNWzbkyesCnCV4FiyVROpV7gnIsbRwxO69z2UlU3oLuCyVHT2fRW8wEsl7H4ZgdfPQA==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3919957wro.398.1571332409986; 
 Thu, 17 Oct 2019 10:13:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o22sm3330634wra.96.2019.10.17.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 10:13:27 -0700 (PDT)
Date: Thu, 17 Oct 2019 19:13:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017171326.GA531411@ulmo>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
 <20191017101116.3d5okxmto5coecad@pengutronix.de>
 <20191017111131.GB3122066@ulmo>
 <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
 <20191017125932.GB3768303@ulmo>
 <aa73b430-527c-8066-ad9c-edab62a05fc9@ysoft.com>
 <20191017151437.GA85210@ulmo>
 <CAHCN7xJduG9yxAhuW6D1_kpd5=p7LhO_YCWjVxcCoW5bmSEJGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJduG9yxAhuW6D1_kpd5=p7LhO_YCWjVxcCoW5bmSEJGQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nPslfkOtVleJKrTI5Krr4L0h8uWgtmF9Du4PaGrgtbU=;
 b=tQ6DRBwzgdO/y9FiCpIbFtmQFFeT+Jycy/pkNS1lx/5P2cLtRvUrGbHfxbx06roa2G
 af1KjP41erDSM46CNQ5VNfIPqZ1CBvoFdMd8oivfTALjtxDa38g762qgf94qgDtBOdRg
 jyH6iQYN/45K900YRZumxPu5rfwXYCWTdGF7fx8XMgTo5FncIXz0HDFPPMK9uIxXr9Xw
 WsoGi2TyW8h5zzQW1z2WYLey8huFOzuh2f1/chgcuoOI+Haxmk7arclxvoMpJIO2ctX/
 KAMZDC/xzDVqVJIvVJHr09aDoSESy86XlVRAsnrT2vv25VGkDswsRRTAweRkOPOeV4G3
 FUvA==
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============1809237559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1809237559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 12:07:21PM -0500, Adam Ford wrote:
> On Thu, Oct 17, 2019 at 10:14 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2019 at 03:58:25PM +0200, Michal Vok=C3=A1=C4=8D wrote:
> > > On 17. 10. 19 14:59, Thierry Reding wrote:
> > > > On Thu, Oct 17, 2019 at 02:09:17PM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > On Thu, Oct 17, 2019 at 01:11:31PM +0200, Thierry Reding wrote:
> > > > > > On Thu, Oct 17, 2019 at 12:11:16PM +0200, Uwe Kleine-K=C3=B6nig=
 wrote:
> > > > > > > On Thu, Oct 17, 2019 at 11:48:08AM +0200, Michal Vok=C3=A1=C4=
=8D wrote:
> > > > > > > > On 17. 10. 19 10:10, Uwe Kleine-K=C3=B6nig wrote:
> > > > > > > > > A previous change in the pwm core (namely 01ccf903edd6 ("=
pwm: Let
> > > > > > > > > pwm_get_state() return the last implemented state")) chan=
ged the
> > > > > > > > > semantic of pwm_get_state() and disclosed an (as it seems=
) common
> > > > > > > > > problem in lowlevel PWM drivers. By not relying on the pe=
riod and duty
> > > > > > > > > cycle being retrievable from a disabled PWM this type of =
problem is
> > > > > > > > > worked around.
> > > > > > > > >
> > > > > > > > > Apart from this issue only calling the pwm_get_state/pwm_=
apply_state
> > > > > > > > > combo once is also more effective.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pen=
gutronix.de>
> > > > > > > > > ---
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > There are now two reports about 01ccf903edd6 breaking a b=
acklight. As
> > > > > > > > > far as I understand the problem this is a combination of =
the backend pwm
> > > > > > > > > driver yielding surprising results and the pwm-bl driver =
doing things
> > > > > > > > > more complicated than necessary.
> > > > > > > > >
> > > > > > > > > So I guess this patch works around these problems. Still =
it would be
> > > > > > > > > interesting to find out the details in the imx driver tha=
t triggers the
> > > > > > > > > problem. So Adam, can you please instrument the pwm-imx27=
 driver to
> > > > > > > > > print *state at the beginning of pwm_imx27_apply() and th=
e end of
> > > > > > > > > pwm_imx27_get_state() and provide the results?
> > > > > > > > >
> > > > > > > > > Note I only compile tested this change.
> > > > > > > >
> > > > > > > > Hi Uwe,
> > > > > > > > I was just about to respond to the "pwm_bl on i.MX6Q broken=
 on 5.4-RC1+"
> > > > > > > > thread that I have a similar problem when you submitted thi=
s patch.
> > > > > > > >
> > > > > > > > So here are my few cents:
> > > > > > > >
> > > > > > > > My setup is as follows:
> > > > > > > >   - imx6dl-yapp4-draco with i.MX6Solo
> > > > > > > >   - backlight is controlled with inverted PWM signal
> > > > > > > >   - max brightness level =3D 32, default brightness level s=
et to 32 in DT.
> > > > > > > >
> > > > > > > > 1. Almost correct backlight behavior before 01ccf903edd6 ("=
pwm: Let
> > > > > > > >     pwm_get_state() return the last implemented state):
> > > > > > > >
> > > > > > > >   - System boots to userspace and backlight is enabled all =
the time from
> > > > > > > >     power up.
> > > > > > > >
> > > > > > > >     $ dmesg | grep state
> > > > > > > >     [    1.763381] get state end: -1811360608, enabled: 0
> > > > > > >
> > > > > > > What is -1811360608? When I wrote "print *state" above, I tho=
ught about
> > > > > > > something like:
> > > > > > >
> > > > > > >       pr_info("%s: period: %u, duty: %u, polarity: %d, enable=
d: %d",
> > > > > > >               __func__, state->period, state->duty_cycle, sta=
te->polarity, state->enabled);
> > > > > > >
> > > > > > > A quick look into drivers/pwm/pwm-imx27.c shows that this is =
another
> > > > > > > driver that yields duty_cycle =3D 0 when the hardware is off.
> > > > > >
> > > > > > It seems to me like the best recourse to fix this for now would=
 be to
> > > > > > patch up the drivers that return 0 when the hardware is off by =
caching
> > > > > > the currently configured duty cycle.
> > > > > >
> > > > > > How about the patch below?
> > > > > >
> > > > > > Thierry
> > > > > >
> > > > > > --- >8 ---
> > > > > >  From 15a52a7f1b910804fabd74a5882befd3f9d6bb37 Mon Sep 17 00:00=
:00 2001
> > > > > > From: Thierry Reding <thierry.reding@gmail.com>
> > > > > > Date: Thu, 17 Oct 2019 12:56:00 +0200
> > > > > > Subject: [PATCH] pwm: imx27: Cache duty cycle register value
> > > > > >
> > > > > > The hardware register containing the duty cycle value cannot be=
 accessed
> > > > > > when the PWM is disabled. This causes the ->get_state() callbac=
k to read
> > > > > > back a duty cycle value of 0, which can confuse consumer driver=
s.
> > > > > >
> > > > > > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > > > > > ---
> > > > > >   drivers/pwm/pwm-imx27.c | 31 ++++++++++++++++++++++++-------
> > > > > >   1 file changed, 24 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> > > > > > index ae11d8577f18..4113d5cd4c62 100644
> > > > > > --- a/drivers/pwm/pwm-imx27.c
> > > > > > +++ b/drivers/pwm/pwm-imx27.c
> > > > > > @@ -85,6 +85,13 @@ struct pwm_imx27_chip {
> > > > > >         struct clk      *clk_per;
> > > > > >         void __iomem    *mmio_base;
> > > > > >         struct pwm_chip chip;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * The driver cannot read the current duty cycle from t=
he hardware if
> > > > > > +        * the hardware is disabled. Cache the last programmed =
duty cycle
> > > > > > +        * value to return in that case.
> > > > > > +        */
> > > > > > +       unsigned int duty_cycle;
> > > > > >   };
> > > > > >   #define to_pwm_imx27_chip(chip)       container_of(chip, stru=
ct pwm_imx27_chip, chip)
> > > > > > @@ -155,14 +162,17 @@ static void pwm_imx27_get_state(struct pw=
m_chip *chip,
> > > > > >         tmp =3D NSEC_PER_SEC * (u64)(period + 2);
> > > > > >         state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_clk);
> > > > > > -       /* PWMSAR can be read only if PWM is enabled */
> > > > > > -       if (state->enabled) {
> > > > > > +       /*
> > > > > > +        * PWMSAR can be read only if PWM is enabled. If the PW=
M is disabled,
> > > > > > +        * use the cached value.
> > > > > > +        */
> > > > > > +       if (state->enabled)
> > > > > >                 val =3D readl(imx->mmio_base + MX3_PWMSAR);
> > > > > > -               tmp =3D NSEC_PER_SEC * (u64)(val);
> > > > > > -               state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp=
, pwm_clk);
> > > > > > -       } else {
> > > > > > -               state->duty_cycle =3D 0;
> > > > > > -       }
> > > > > > +       else
> > > > > > +               val =3D imx->duty_cycle;
> > > > > > +
> > > > > > +       tmp =3D NSEC_PER_SEC * (u64)(val);
> > > > > > +       state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, pwm_cl=
k);
> > > > > >         if (!state->enabled)
> > > > > >                 pwm_imx27_clk_disable_unprepare(chip);
> > > > > > @@ -261,6 +271,13 @@ static int pwm_imx27_apply(struct pwm_chip=
 *chip, struct pwm_device *pwm,
> > > > > >                 writel(duty_cycles, imx->mmio_base + MX3_PWMSAR=
);
> > > > > >                 writel(period_cycles, imx->mmio_base + MX3_PWMP=
R);
> > > > > > +               /*
> > > > > > +                * Store the duty cycle for future reference in=
 cases where
> > > > > > +                * the MX3_PWMSAR register can't be read (i.e. =
when the PWM
> > > > > > +                * is disabled).
> > > > > > +                */
> > > > > > +               imx->duty_cycle =3D duty_cycles;
> > > > > > +
> > > > >
> > > > > I wonder if it would be more sensible to do this in the pwm core
> > > > > instead. Currently there are two drivers known with this problem.=
 I
> > > > > wouldn't be surprised if there were more.
> > > >
> > > > I've inspected all the drivers and didn't spot any beyond cros-ec a=
nd
> > > > i.MX that have this problem. There's also no good way to do this in=
 the
> > > > core, because the core doesn't know whether or not the driver is ca=
pable
> > > > of returning the correct duty cycle on hardare readout. So the core
> > > > would have to rely on state->duty_cycle that is passed in, but then=
 the
> > > > offending commit becomes useless because the whole point was to ret=
urn
> > > > the state as written to hardware (rather than the software state wh=
ich
> > > > was being returned before that patch).
> > > >
> > > > > If we want to move clients to not rely on .period and .duty_cycle=
 for a
> > > > > disabled PWM (do we?) a single change in the core is also benefic=
ial
> > > > > compared to fixing several lowlevel drivers.
> > > >
> > > > These are really two orthogonal problems. We don't currently consid=
er
> > > > enabled =3D 0 to be equivalent to duty_cycle =3D 0 at an API level.=
 I'm not
> > > > prepared to do that at this point in the release cycle either.
> > > >
> > > > What this here has shown is that we have at least two drivers that =
don't
> > > > behave the way they are supposed to according to the API and they b=
reak
> > > > consumers. If they break for pwm-backlight, it's possible that they=
 will
> > > > break for other consumers as well. So the right thing to do is fix =
the
> > > > two drivers that are broken.
> > > >
> > > > After -rc1 we no longer experiment. Instead we clean up the messes =
we've
> > > > made. We can revisit the other points once mainline is fixed.
> > >
> > > Hi Thierry,
> > > I just tried your patch with v5.4-rc3 with this result:
> > >
> > > root@hydraco:~# dmesg | grep pwm_
> > > [    1.772089] pwm_imx27_get_state: period: 992970, duty: 0, polarity=
: 0, enabled: 0
> > > [    4.938759] pwm_imx27_apply: period: 500000, duty: 0, polarity: 1,=
 enabled: 0
> > > [    4.947431] pwm_imx27_get_state: period: 992970, duty: 0, polarity=
: 0, enabled: 0
> >
> > Okay... this is interesting. If I understand correctly, that first line
> > here is where the initial hardware readout happens. The second one is
> > the first time when the backlight is configured, so it sets period and
> > polarity. But then for some reason when we read out after that to read
> > what state was written... we see that actually nothing was written at
> > all.
> >
> > And we can see why in pwm_imx27_apply(): If the PWM is not enabled, we
> > don't actually program any of the registers, so it's not a surprise that
> > things fall apart.
> >
> > > [    4.956484] pwm_imx27_apply: period: 992970, duty: 992970, polarit=
y: 0, enabled: 0
> > > [    4.965473] pwm_imx27_get_state: period: 992970, duty: 0, polarity=
: 0, enabled: 0
> > > [    4.974410] pwm_imx27_apply: period: 992970, duty: 0, polarity: 0,=
 enabled: 1
> > > [    4.988617] pwm_imx27_get_state: period: 992970, duty: 0, polarity=
: 0, enabled: 1
> > >
> > > Backlight is on with full brightness at this stage.
> > >
> > > root@hydraco:/sys/class/backlight/backlight# cat brightness
> > > 32
> > >
> > > root@hydraco:/sys/class/backlight/backlight# echo 32 > brightness
> > > [  153.386391] pwm_imx27_apply: period: 992970, duty: 992970, polarit=
y: 0, enabled: 1
> > > [  153.398311] pwm_imx27_get_state: period: 992970, duty: 992970, pol=
arity: 0, enabled: 1
> > >
> > > Backlight goes down.
> > >
> > > root@hydraco:/sys/class/backlight/backlight# echo 1 > brightness
> > > [  168.506261] pwm_imx27_apply: period: 992970, duty: 15576, polarity=
: 0, enabled: 1
> > > [  168.518064] pwm_imx27_get_state: period: 992970, duty: 15576, pola=
rity: 0, enabled: 1
> > >
> > > Backlight goes up to almost full brightness.
> > >
> > > root@hydraco:/sys/class/backlight/backlight# echo 0 > brightness
> > > [  177.496265] pwm_imx27_apply: period: 992970, duty: 0, polarity: 0,=
 enabled: 0
> > > [  177.507602] pwm_imx27_get_state: period: 496485, duty: 7788, polar=
ity: 0, enabled: 0
> > >
> > > Backlight goes up to full brightness.
> > >
> > > So your patch does not solve my issue.
> > >
> > > The main problem I see is incorrect polarity setting. In my DT
> > > the pwm-backlight consumer requests PWM_POLARITY_INVERTED and
> > > period 500000ns. Though after reset the PWM HW registers are
> > > configured to normal polarity. This initial setting is read out
> > > and used by the consumer instead of the DT configuration.
> >
> > So the problem with the i.MX driver is that it doesn't actually write
> > the full state to the hardware and therefore the patch that caused these
> > things to break reads back an incomplete state. So we've basically got
> > two options: 1) make sure the hardware state is fully written or 2) make
> > sure that we return the cached state.
> >
> > I think 2) doesn't really make sense because it is conflicts with the
> > purpose of the ->get_state() callback. The only time where we should be
> > returning cached data is if the hardware registers don't contain the
> > information (as in the case of the cros-ec driver) or if we can't access
> > it for other reasons (such as in the case of i.MX's duty cycle).
> >
> > Does the attached patch help with your issue? The idea is to always
> > write the full state to the hardware, even if period and duty cycle are
> > unused when the PWM is disabled. That's really the kind of contract that
> > we have added with the offending patch in the core.
> >
> > It looks like all other drivers handle this more or less correctly, so
> > if we only need to fix up cros-ec and i.MX this seems like a realistic
> > way to fix things up. If other drivers are problematic in this regard,
> > we should probably revert and then fix the drivers before we can apply
> > that patch again.
>=20
> This patch combined with your previous patch appears to have worked.
> If you end up sending a patch series to fix this, go ahead and add
>=20
> Tested-by: Adam Ford <aford173@gmail.com> #imx6q-logicpd

Excellent! Thanks for testing this. I'll wait until tomorrow to see if
there's some feedback from Enric for the cros-ec change. I'll send out
the total of three patches again in the hopes that those are really
the only two cases that are broken.

Thierry

> > --- >8 ---
> > From 7040f0038e04a1caa6dda5b6f675a9fdee0271f4 Mon Sep 17 00:00:00 2001
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Date: Thu, 17 Oct 2019 17:11:41 +0200
> > Subject: [PATCH] pwm: imx27: Unconditionally write state to hardware
> >
> > The i.MX driver currently uses a shortcut and doesn't write all of the
> > state through to the hardware when the PWM is disabled. This causes an
> > inconsistent state to be read back by consumers with the result of them
> > malfunctioning.
> >
> > Fix this by always writing the full state through to the hardware
> > registers so that the correct state can always be read back.
> >
> > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > ---
> >  drivers/pwm/pwm-imx27.c | 120 ++++++++++++++++++++--------------------
> >  1 file changed, 59 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> > index 4113d5cd4c62..59d8b1289808 100644
> > --- a/drivers/pwm/pwm-imx27.c
> > +++ b/drivers/pwm/pwm-imx27.c
> > @@ -230,70 +230,68 @@ static int pwm_imx27_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
> >
> >         pwm_get_state(pwm, &cstate);
> >
> > -       if (state->enabled) {
> > -               c =3D clk_get_rate(imx->clk_per);
> > -               c *=3D state->period;
> > -
> > -               do_div(c, 1000000000);
> > -               period_cycles =3D c;
> > -
> > -               prescale =3D period_cycles / 0x10000 + 1;
> > -
> > -               period_cycles /=3D prescale;
> > -               c =3D (unsigned long long)period_cycles * state->duty_c=
ycle;
> > -               do_div(c, state->period);
> > -               duty_cycles =3D c;
> > -
> > -               /*
> > -                * according to imx pwm RM, the real period value shoul=
d be
> > -                * PERIOD value in PWMPR plus 2.
> > -                */
> > -               if (period_cycles > 2)
> > -                       period_cycles -=3D 2;
> > -               else
> > -                       period_cycles =3D 0;
> > -
> > -               /*
> > -                * Wait for a free FIFO slot if the PWM is already enab=
led, and
> > -                * flush the FIFO if the PWM was disabled and is about =
to be
> > -                * enabled.
> > -                */
> > -               if (cstate.enabled) {
> > -                       pwm_imx27_wait_fifo_slot(chip, pwm);
> > -               } else {
> > -                       ret =3D pwm_imx27_clk_prepare_enable(chip);
> > -                       if (ret)
> > -                               return ret;
> > -
> > -                       pwm_imx27_sw_reset(chip);
> > -               }
> > -
> > -               writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
> > -               writel(period_cycles, imx->mmio_base + MX3_PWMPR);
> > -
> > -               /*
> > -                * Store the duty cycle for future reference in cases w=
here
> > -                * the MX3_PWMSAR register can't be read (i.e. when the=
 PWM
> > -                * is disabled).
> > -                */
> > -               imx->duty_cycle =3D duty_cycles;
> > -
> > -               cr =3D MX3_PWMCR_PRESCALER_SET(prescale) |
> > -                    MX3_PWMCR_STOPEN | MX3_PWMCR_DOZEN | MX3_PWMCR_WAI=
TEN |
> > -                    FIELD_PREP(MX3_PWMCR_CLKSRC, MX3_PWMCR_CLKSRC_IPG_=
HIGH) |
> > -                    MX3_PWMCR_DBGEN | MX3_PWMCR_EN;
> > -
> > -               if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> > -                       cr |=3D FIELD_PREP(MX3_PWMCR_POUTC,
> > -                                       MX3_PWMCR_POUTC_INVERTED);
> > -
> > -               writel(cr, imx->mmio_base + MX3_PWMCR);
> > -       } else if (cstate.enabled) {
> > -               writel(0, imx->mmio_base + MX3_PWMCR);
> > +       c =3D clk_get_rate(imx->clk_per);
> > +       c *=3D state->period;
> >
> > -               pwm_imx27_clk_disable_unprepare(chip);
> > +       do_div(c, 1000000000);
> > +       period_cycles =3D c;
> > +
> > +       prescale =3D period_cycles / 0x10000 + 1;
> > +
> > +       period_cycles /=3D prescale;
> > +       c =3D (unsigned long long)period_cycles * state->duty_cycle;
> > +       do_div(c, state->period);
> > +       duty_cycles =3D c;
> > +
> > +       /*
> > +        * according to imx pwm RM, the real period value should be PER=
IOD
> > +        * value in PWMPR plus 2.
> > +        */
> > +       if (period_cycles > 2)
> > +               period_cycles -=3D 2;
> > +       else
> > +               period_cycles =3D 0;
> > +
> > +       /*
> > +        * Wait for a free FIFO slot if the PWM is already enabled, and=
 flush
> > +        * the FIFO if the PWM was disabled and is about to be enabled.
> > +        */
> > +       if (cstate.enabled) {
> > +               pwm_imx27_wait_fifo_slot(chip, pwm);
> > +       } else {
> > +               ret =3D pwm_imx27_clk_prepare_enable(chip);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               pwm_imx27_sw_reset(chip);
> >         }
> >
> > +       writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
> > +       writel(period_cycles, imx->mmio_base + MX3_PWMPR);
> > +
> > +       /*
> > +        * Store the duty cycle for future reference in cases where the
> > +        * MX3_PWMSAR register can't be read (i.e. when the PWM is disa=
bled).
> > +        */
> > +       imx->duty_cycle =3D duty_cycles;
> > +
> > +       cr =3D MX3_PWMCR_PRESCALER_SET(prescale) |
> > +            MX3_PWMCR_STOPEN | MX3_PWMCR_DOZEN | MX3_PWMCR_WAITEN |
> > +            FIELD_PREP(MX3_PWMCR_CLKSRC, MX3_PWMCR_CLKSRC_IPG_HIGH) |
> > +            MX3_PWMCR_DBGEN;
> > +
> > +       if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> > +               cr |=3D FIELD_PREP(MX3_PWMCR_POUTC,
> > +                               MX3_PWMCR_POUTC_INVERTED);
> > +
> > +       if (state->enabled)
> > +               cr |=3D MX3_PWMCR_EN;
> > +
> > +       writel(cr, imx->mmio_base + MX3_PWMCR);
> > +
> > +       if (!state->enabled && cstate.enabled)
> > +               pwm_imx27_clk_disable_unprepare(chip);
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.23.0
> >

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2ooTMACgkQ3SOs138+
s6Hnhw/8DoYUkTpL5Qxy0KKBONWJN50iR3WiUkIQbcu7I2RvnPVBrEI7B9ZFyBZZ
2wpaRAqc2+PNCpEq83+v82Z6Ian1+d+Ubm9n9DAInAKP/fpt7decAqwZ7+cN3ut0
O9tlbrHJpOK1E/Y3GFzkUpD04hkrMhNKtmrDa+EaUmzTOgMdLPQmCz/CNdL+bOh2
68szup338rvZzzX2upvsIyddyKiG0v6YgXKdCyX5AleWRsZoBCDNxTq6d+E7+WDD
uvy2RPto/MGgP12V/q/pLEwGxyEY3sghvCGN8Utivp88j86ZWez6NTsEKHwBWHtN
VOYsAZCKJdVYeWsadBmdozd3ZFy+vCqBcOErz73KjrS+tw66w+qPHMVjPjlcanKo
2CVCo+/TZ0yYfdwTnVPJOP5oJp7ygyuDs2o1srB9fC4iSWsjI+wIu5WvAkV1+ver
u4F8JvRiDCdet6ll4dT0NvvaUuaT4kOSY5/Qp5lZlRZAjivK83BAn6bFXxnkt6Az
larNqj+Wjv1fdL1aoB/Ri6YwSgujUVx6zLlu8U7PYdK3iT/cu3fzbHTIXSMos7RX
2fKhrZ99HPy415omFzFFrMnmypM6mjCTpy3hV8I0/+t86xGWxOQitphh8dP8yx0L
TG/GJacWuNEmlD8/TOuBPJSDk326VWUdIstV7KQOVnCBgr0ADSk=
=lLqx
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

--===============1809237559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1809237559==--
