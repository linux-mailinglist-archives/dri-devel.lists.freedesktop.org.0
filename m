Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4C423360
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 00:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6015A6EC87;
	Tue,  5 Oct 2021 22:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616196EC87
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 22:19:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t9so2106386lfd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cm3t0jHYi60ikbjIFrElH5F3+z5ZebZ+trrzKBFfgQI=;
 b=qTAIEXIVB1/IgtvGdtrN/gmvUv6mTJMWYvN+by7UBNwUQz1edq9ynn5KZ4VakUYvgO
 zdJ521ZSZKHguY4o7B00h080n6+hpVFgPtipWPhr7vdfUedARgQ4xE4HH2lbru46MeqC
 A5BXLTY8VINH/AMBjZEF/K2gSikuRXhSI2fF9O8ZK3khdgYy8AFAvm2l22TZw2+cK0Up
 VqGWxTT463F7ck5TyDg0STieTJ5C+qvpbnUQ5kqq4ulMywcZp+kTXt8lcdefcaH+dgKu
 zq6l/FilsorGHNG/QzimfNCPZRYUNo7SlGD/xBo5UydUfU+gcPwF7E7ckKKrvoh9klYt
 Rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cm3t0jHYi60ikbjIFrElH5F3+z5ZebZ+trrzKBFfgQI=;
 b=7DZ0BkxUNuUSWO+svl9759yvBtIvsQSra0Wr6QhMYF55gKJpUwVIyrc54dL/jnz6v7
 LMx/KXuUMr47FKQjljHwXHO5qfxk7W8cx6K7vLYO0b6PX9SyIs9M1HDv9R4RbB5Jl7eY
 D0F7kpkSZE5V4uIuqP+rxXzhyVW9oMVPV3KizeOshKuLOWRh9RJRWpd1BNKplImHOaIq
 GyuriUyrnQoMOHtrCqbo43FfuotM/9AWPNxAchZMYuiWh1svre91pmmf4WfPCuVwUw2s
 mf85QKi1gI1tclkKmc32CRK4XRxLAU1SGXlOb8nmf+Fys7MhKdXjq+o8BGYc5bWX1yvh
 CFkA==
X-Gm-Message-State: AOAM533sJ+65Sg6YTLJtFT2bAi2tAiXBOeOUwu576JTJ6PWZJuSY3hUc
 Yw2EDnzou9siK31C4f/kqF8=
X-Google-Smtp-Source: ABdhPJx7DQPDGWTTKyBBQ7on8Zoc9EHE4rfD8+/mmsH+2cs2olWIZx3pD3Yp7kL6x0TZhEN3swGrdg==
X-Received: by 2002:a2e:5cc6:: with SMTP id q189mr24035068ljb.82.1633472379484; 
 Tue, 05 Oct 2021 15:19:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id d19sm2088024lfv.74.2021.10.05.15.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 15:19:39 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
Date: Wed, 6 Oct 2021 01:19:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

05.10.2021 16:10, Ulf Hansson пишет:
> On Sat, 2 Oct 2021 at 22:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 01.10.2021 15:32, Ulf Hansson пишет:
>>>> +static __maybe_unused int tegra_clock_pm_suspend(struct device *dev)
>>>> +{
>>>> +       struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
>>>> +
>>>> +       /*
>>>> +        * Power management of the clock is entangled with the Tegra PMC
>>>> +        * GENPD because PMC driver enables/disables clocks for toggling
>>>> +        * of the PD's on/off state.
>>>> +        *
>>>> +        * The PMC GENPD is resumed in NOIRQ phase, before RPM of the clocks
>>>> +        * becomes available, hence PMC can't use clocks at the early resume
>>>> +        * phase if RPM is involved. For example when 3d clock is enabled,
>>>> +        * it may enable the parent PLL clock that needs to be RPM-resumed.
>>>> +        *
>>>> +        * Secondly, the PLL clocks may be enabled by the low level suspend
>>>> +        * code, so we need to assume that PLL is in enabled state during
>>>> +        * suspend.
>>>> +        *
>>>> +        * We will keep PLLs and system clock resumed during suspend time.
>>>> +        * All PLLs on all SoCs are low power and system clock is always-on,
>>>> +        * so practically not much is changed here.
>>>> +        */
>>>> +
>>>> +       return clk_prepare(clk_dev->hw->clk);
>>> I am trying to understand, more exactly, what you intend to achieve
>>> with the clk_prepare() here. It looks a bit weird, to me. Can you try
>>> to elaborate a bit more on the use case?
>>
>> The Tegra GENPD driver enable/disable clocks when domain is turned on.
> 
> Okay. I noticed that in tegra_genpd_power_on(). And the same clocks
> are enabled/disabled also in tegra_genpd_power_off(), when powering
> off the PM domain.
> 
> So I guess the problem kind of exists for tegra_genpd_power_off() too?

Both OFF/ON are affected by the same problem. If domain was already
turned OFF before genpd_suspend_noirq(), then the OFF problem isn't visible.

I reproduced the OFF problem by removing the clk prepare/unprepare from
the suspend/resume of the clk driver and making some extra changes to
clock tree topology and etc to trigger the problem on Nexus 7.

tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13

I happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
-> GENPD -> I2C -> runtime-pm.

-13 is EACCES, it comes from the runtime PM of I2C device. RPM is
prohibited/disabled during late (NOIRQ) suspend by the drivers core.

>> This can't be done during early system resume, when domains are getting
>> turned on by the drivers core, because when clock is enabled, it's
>> getting prepared (RPM-resumed) and this preparation fails because
>> performance state of the clock goes up and it doesn't work during the
>> early resume time since I2C, which applies the state to hardware, is
>> suspended and can't work at that early time.
> 
> This sounds complicated and I still don't quite follow all of it, sorry.
> 
> So, tegra_genpd_power_on() gets called from genpd_resume_noirq(), when
> the first device of the attached devices to genpd gets resumed. And
> vice versa for tegra_genpd_power_off() and genpd_suspend_noirq().
> 
> Are you saying that trying to enable/disable clocks from
> tegra_genpd_power_on|off() in these paths doesn't work, because it
> would also require the performance state to be changed, which would
> fail because the I2C bus/driver is suspended?

Yes, but it's actually not I2C bus/driver that is suspended, it's
runtime PM that is unavailable during NOIRQ. The I2C driver itself is
suspended after domains are turned OFF and resumed before they are
enabled. It's just runtime PM API that is unavailable. I'm wondering if
this could be changed.

I'm also wondering if we could add some 'was_enabled' flag to GENPDs,
setting it by genpd_suspend_noirq() for the enabled domains, and then
powering-on GENPDs from genpd_resume_noirq() only if they were in the
enabled state during genpd_suspend_noirq() time. It actually puzzled me
for a quite long time why GENPD core enables domains unconditionally
during early resume. This should solve a part of the problem and it
makes suspend/resume a bit safer because there is a smaller chance to
crash hardware during suspend, at least it's easier to debug.

>> Secondly, Tegra has arch-specific low level assembly which touches
>> clocks during last phase of system suspend and in the beginning of
>> resume. Hence, clocks should stay prepared during suspend just because
>> technically clock should be prepared before it can be enabled.
> 
> So the low level code is gating and ungating the clock behind the back
> of the clock driver then? Why is that done like that, more exactly?

I revisited that code again, and it shouldn't touch the clocks.
I changed that code to not toggle the clocks [1] sometime ago, but
forgot about it.

[1] https://git.kernel.org/linus/680ae4452

>>> Is this rather about making sure that the clock's corresponding PM
>>> domain stays powered on during system suspend? In that case, I think
>>> there may be an alternative option....
>>>
>>
>> This is not about domain staying powered on, this is about keeping the
>> performance state of the domain high during suspend.
> 
> Right, so the PM domain managed in tegra_genpd_power_on|off() can
> still be powered on/off, as long as the clock remains ungated?

Not ungated, but prepared.
