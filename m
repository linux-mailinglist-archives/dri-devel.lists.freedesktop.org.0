Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8B2423DE1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610046E4B7;
	Wed,  6 Oct 2021 12:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CED6E4B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 12:39:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t9so9906937lfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 05:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pt+Sx1i9oC8cMVf+wV0+G1/1GyaW/f/U+87KiyoFd/E=;
 b=xMf9icJn0dugjBCs5EETJwxewMPK+UjZJs0KYkQ+tEswLY8Y3dBB9eTNHx1P1I74NS
 uUI5ilQPq4HQIhfoBn10OmK0TYfUpJUGARspsbdoXLABNOzo+QHCEBYNQqtp8KkfHt5y
 5rgwO4l1nEO/qkIK43xyczyY9zOTefr2lTBwMo3yoVkLR70uqjlAQwkhytRA6fQvBCmo
 38mmmmGjJXtf94GAftHcVeOr9+ASGdyzPc89mvgsEeg3ssJr7d0NZzeAChud6hgWLQ0x
 CaiyTsOATrGgHO8lc2Hzh8roRCTRT7QTYzscdKXQfmhYcgY68+9elxMF8yXF5L53e23A
 iVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pt+Sx1i9oC8cMVf+wV0+G1/1GyaW/f/U+87KiyoFd/E=;
 b=udVduGTYzsldJJdBJ+FGbu0WzuM7ypDuqV4uafdZGfGToun/dDfiatLRya3TgHuxnC
 krcuU93UFSHyPVjrBUNXQt44D0lRkGXdhe3fH++6V8f544E289JT8wxVlUV3GqH1t1rW
 b3iZOzopytbb78HDh0BEpPVKq/AGpeNLF5VAP8JhJNkaWF4plFRw+UPNeuWEGAr38Y0c
 nztOqw8dUXwpsItZ64nf8Zq6jTLL0kF8Oo0SkHx1zQGW9b1/ZZI12PM0PZEXvzSNBs9h
 beZv2KjHqJA5I3DQpqiZuxBdNecgl20d9sBmc5QpUc4V/HPKb6gdJwrUPbuBSXcsgoUg
 I0/A==
X-Gm-Message-State: AOAM531J/od9gXBG8ApUURH+dKYHlkLSz4rJsd5JjXu/7UiYSSkVeiRy
 P/CWPYgAV2LH3SMtTICBEPG+wEpGQzqgNhZkpZutLg==
X-Google-Smtp-Source: ABdhPJwaJVEKqlVek7TGUDap3J+eg+aVlfc7HMdVbc1X8zMSF/wwjX+qoHICL3q8G6NLzKZ0rQnEZO321GxsAccQSGs=
X-Received: by 2002:a05:651c:20b:: with SMTP id
 y11mr29225280ljn.463.1633523952478; 
 Wed, 06 Oct 2021 05:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
In-Reply-To: <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 Oct 2021 14:38:35 +0200
Message-ID: <CAPDyKFq_-HGPRNiNDmnEbuah0mUYoRUWVs1SvbQ6VNMMwEcXjA@mail.gmail.com>
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 6 Oct 2021 at 00:19, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 05.10.2021 16:10, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, 2 Oct 2021 at 22:44, Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> 01.10.2021 15:32, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> +static __maybe_unused int tegra_clock_pm_suspend(struct device *dev=
)
> >>>> +{
> >>>> +       struct tegra_clk_device *clk_dev =3D dev_get_drvdata(dev);
> >>>> +
> >>>> +       /*
> >>>> +        * Power management of the clock is entangled with the Tegra=
 PMC
> >>>> +        * GENPD because PMC driver enables/disables clocks for togg=
ling
> >>>> +        * of the PD's on/off state.
> >>>> +        *
> >>>> +        * The PMC GENPD is resumed in NOIRQ phase, before RPM of th=
e clocks
> >>>> +        * becomes available, hence PMC can't use clocks at the earl=
y resume
> >>>> +        * phase if RPM is involved. For example when 3d clock is en=
abled,
> >>>> +        * it may enable the parent PLL clock that needs to be RPM-r=
esumed.
> >>>> +        *
> >>>> +        * Secondly, the PLL clocks may be enabled by the low level =
suspend
> >>>> +        * code, so we need to assume that PLL is in enabled state d=
uring
> >>>> +        * suspend.
> >>>> +        *
> >>>> +        * We will keep PLLs and system clock resumed during suspend=
 time.
> >>>> +        * All PLLs on all SoCs are low power and system clock is al=
ways-on,
> >>>> +        * so practically not much is changed here.
> >>>> +        */
> >>>> +
> >>>> +       return clk_prepare(clk_dev->hw->clk);
> >>> I am trying to understand, more exactly, what you intend to achieve
> >>> with the clk_prepare() here. It looks a bit weird, to me. Can you try
> >>> to elaborate a bit more on the use case?
> >>
> >> The Tegra GENPD driver enable/disable clocks when domain is turned on.
> >
> > Okay. I noticed that in tegra_genpd_power_on(). And the same clocks
> > are enabled/disabled also in tegra_genpd_power_off(), when powering
> > off the PM domain.
> >
> > So I guess the problem kind of exists for tegra_genpd_power_off() too?
>
> Both OFF/ON are affected by the same problem. If domain was already
> turned OFF before genpd_suspend_noirq(), then the OFF problem isn't visib=
le.
>
> I reproduced the OFF problem by removing the clk prepare/unprepare from
> the suspend/resume of the clk driver and making some extra changes to
> clock tree topology and etc to trigger the problem on Nexus 7.
>
> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
>
> I happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
> -> GENPD -> I2C -> runtime-pm.
>
> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
> prohibited/disabled during late (NOIRQ) suspend by the drivers core.

Thanks for the clarification!

>
> >> This can't be done during early system resume, when domains are gettin=
g
> >> turned on by the drivers core, because when clock is enabled, it's
> >> getting prepared (RPM-resumed) and this preparation fails because
> >> performance state of the clock goes up and it doesn't work during the
> >> early resume time since I2C, which applies the state to hardware, is
> >> suspended and can't work at that early time.
> >
> > This sounds complicated and I still don't quite follow all of it, sorry=
.
> >
> > So, tegra_genpd_power_on() gets called from genpd_resume_noirq(), when
> > the first device of the attached devices to genpd gets resumed. And
> > vice versa for tegra_genpd_power_off() and genpd_suspend_noirq().
> >
> > Are you saying that trying to enable/disable clocks from
> > tegra_genpd_power_on|off() in these paths doesn't work, because it
> > would also require the performance state to be changed, which would
> > fail because the I2C bus/driver is suspended?
>
> Yes, but it's actually not I2C bus/driver that is suspended, it's
> runtime PM that is unavailable during NOIRQ. The I2C driver itself is
> suspended after domains are turned OFF and resumed before they are
> enabled. It's just runtime PM API that is unavailable. I'm wondering if
> this could be changed.

In principle what you ask for, is if we can avoid calling
__pm_runtime_disable() in __device_suspend_late() (and vice versa in
device_resume_early()).

I think the short answer is no, at least from a generic point of view.
Maybe we can figure out a way to allow this on a per device basis, as
an opt-in solution. I am not sure what Rafael would think about this,
let's see.

Another option to address the problem is already available to use for
these kinds of cases. This would be to add also a pair of
->suspend|resume() callbacks to I2C driver. Along the lines of the
below.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.=
c
index c883044715f3..589bf872ab25 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1918,6 +1918,7 @@ static int __maybe_unused
tegra_i2c_resume(struct device *dev)
 }

 static const struct dev_pm_ops tegra_i2c_pm =3D {
+       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_put_noidle, pm_runtime_get_sync)
        SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
        SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_res=
ume,
                           NULL)

In this way, the device would already be runtime resumed, if there is
call to pm_runtime_get_sync() from the clock framework due to the
clk_prepare|unprepare() being called. If that also turns out to happen
*after* runtime PM has been disabled for the device, the call to
pm_runtime_get_sync() would still succeed (returning 1, see
rpm_resume()), rather than a negative error code.

Yes, we may end up runtime resuming the device during system suspend,
even if it turns out not to be needed. Although, that doesn't seem to
be the case for the Tegra I2C driver, right?

>
> I'm also wondering if we could add some 'was_enabled' flag to GENPDs,
> setting it by genpd_suspend_noirq() for the enabled domains, and then
> powering-on GENPDs from genpd_resume_noirq() only if they were in the
> enabled state during genpd_suspend_noirq() time. It actually puzzled me
> for a quite long time why GENPD core enables domains unconditionally
> during early resume. This should solve a part of the problem and it
> makes suspend/resume a bit safer because there is a smaller chance to
> crash hardware during suspend, at least it's easier to debug.

Just because the PM domain was already off at genpd_suspend_noirq(),
doesn't mean that it can stay powered off at genpd_resume_noirq(). At
least as is today.

The main reason why genpd_resume_noirq() powers on the PM domain, is
because it's not possible for the consumer drivers to rely on runtime
PM to do it (because runtime PM has been disabled by the PM core).

>
> >> Secondly, Tegra has arch-specific low level assembly which touches
> >> clocks during last phase of system suspend and in the beginning of
> >> resume. Hence, clocks should stay prepared during suspend just because
> >> technically clock should be prepared before it can be enabled.
> >
> > So the low level code is gating and ungating the clock behind the back
> > of the clock driver then? Why is that done like that, more exactly?
>
> I revisited that code again, and it shouldn't touch the clocks.
> I changed that code to not toggle the clocks [1] sometime ago, but
> forgot about it.
>
> [1] https://git.kernel.org/linus/680ae4452
>
> >>> Is this rather about making sure that the clock's corresponding PM
> >>> domain stays powered on during system suspend? In that case, I think
> >>> there may be an alternative option....
> >>>
> >>
> >> This is not about domain staying powered on, this is about keeping the
> >> performance state of the domain high during suspend.
> >
> > Right, so the PM domain managed in tegra_genpd_power_on|off() can
> > still be powered on/off, as long as the clock remains ungated?
>
> Not ungated, but prepared.

Okay, thanks for clarifying!

In summary, it sounds like you should be able to fix this problem in
the I2C driver as I suggested above. If that works, that seems much
better.

Moreover, it would leave the clocks gated/unprepared when the system
is fully suspended, which I guess is better from an energy point of
view?

Kind regards
Uffe
