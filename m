Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DF4401B1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 20:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD34A6E043;
	Fri, 29 Oct 2021 18:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF526E043
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 18:06:55 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id w193so14565311oie.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 11:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5+xv1sYACq7ekC+Hz2Y0cCbNG5PRGqC0Z37yaKBG5NI=;
 b=LgbTsyVk5MkoeoMx7YC7hukiLlKf3L6zy330LvdhCOKjPpwnsXdgCDD6u6/GRf+5yp
 OmaFDLEhPEaLoUQNUN8CalwjUSVkhqtuM4WbHYrtl6fH+4oiTLcVXBECS0QPpLdvM1t4
 cGbglqdQqmC1EbKRk9uK3PIu0iZg8Mdat+lcno3Zii+bHwxI/1LJM1fKyu6eAIVVamQF
 cqrogQ9InPW+ArVPSllDz9ASKokDQp9K2omvJijZuKRj2ax75ynTxmx6KJvq/ZyvjNXl
 stBhWgyZEhJ67aekwqLN1e9JOBxZqEqvCJnwWz7FLe+/8y/pv+TROuc2pz5sLnKXBvWQ
 ejJA==
X-Gm-Message-State: AOAM531BMfcKOJR61LszCf1vZGrWAFHtMaKMP0T/AzrjhRsozNTsMa7d
 UswJib3YTsQqQG0+vXKWrIyJvKFm9NLuekV1fMo=
X-Google-Smtp-Source: ABdhPJyOQcK/yH8YWrJNxVYGyhhICBtBpU/kmrIuW/r1/0glQukNI66xy0DXMlLLQgevqp7sBswHRDfWJcvpb+2DdN8=
X-Received: by 2002:a05:6808:128d:: with SMTP id
 a13mr612592oiw.51.1635530814547; 
 Fri, 29 Oct 2021 11:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
 <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
 <CAJZ5v0i9OtA1nDiv8UXuF3ASdENFYJFV7+nMWm6Pcu=kw8k1aQ@mail.gmail.com>
 <4dc8a6bd-4072-ccbf-513b-221d286bd6d5@gmail.com>
In-Reply-To: <4dc8a6bd-4072-ccbf-513b-221d286bd6d5@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 29 Oct 2021 20:06:43 +0200
Message-ID: <CAJZ5v0hKQf-xZq2fx1pA5oxMqP_XJV=AG0Rqu7BKRUZGDz6H5Q@mail.gmail.com>
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-clk <linux-clk@vger.kernel.org>, David Heidelberg <david@ixit.cz>
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

On Fri, Oct 29, 2021 at 6:29 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 29.10.2021 18:56, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Oct 29, 2021 at 5:20 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> 26.10.2021 01:40, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> +     ret =3D devm_pm_runtime_enable(&pdev->dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D pm_runtime_resume_and_get(&pdev->dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>>       /* Set maximum frequency of the IP */
> >>> -     ret =3D clk_set_rate(pwm->clk, pwm->soc->max_frequency);
> >>> +     ret =3D dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
> >>>       if (ret < 0) {
> >>>               dev_err(&pdev->dev, "Failed to set max frequency: %d\n"=
, ret);
> >>> -             return ret;
> >>> +             goto put_pm;
> >>>       }
> >>>
> >>>       /*
> >>> @@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device=
 *pdev)
> >>>       if (IS_ERR(pwm->rst)) {
> >>>               ret =3D PTR_ERR(pwm->rst);
> >>>               dev_err(&pdev->dev, "Reset control is not found: %d\n",=
 ret);
> >>> -             return ret;
> >>> +             goto put_pm;
> >>>       }
> >>>
> >>>       reset_control_deassert(pwm->rst);
> >>> @@ -291,10 +307,15 @@ static int tegra_pwm_probe(struct platform_devi=
ce *pdev)
> >>>       if (ret < 0) {
> >>>               dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
> >>>               reset_control_assert(pwm->rst);
> >>> -             return ret;
> >>> +             goto put_pm;
> >>>       }
> >>>
> >>> +     pm_runtime_put(&pdev->dev);
> >>> +
> >>>       return 0;
> >>> +put_pm:
> >>> +     pm_runtime_put_sync_suspend(&pdev->dev);
> >>> +     return ret;
> >>>  }
> >>>
> >>>  static int tegra_pwm_remove(struct platform_device *pdev)
> >>> @@ -305,20 +326,44 @@ static int tegra_pwm_remove(struct platform_dev=
ice *pdev)
> >>>
> >>>       reset_control_assert(pc->rst);
> >>>
> >>> +     pm_runtime_force_suspend(&pdev->dev);
> >>
> >> I just noticed that RPM core doesn't reset RPM-enable count of a devic=
e
> >> on driver's unbind (pm_runtime_reinit). It was a bad idea to use
> >> devm_pm_runtime_enable() + pm_runtime_force_suspend() here, since RPM =
is
> >> disabled twice on driver's removal, and thus, RPM will never be enable=
d
> >> again.
> >>
> >> I'll fix it for PWM and other drivers in this series, in v15.
> >
> > Well, for the record, IMV using pm_runtime_force_suspend() is
> > generally a questionable idea.
> >
>
> Please clarify why it's a questionable idea.

There are a few reasons.

Generally speaking, it makes assumptions that may not be satisfied.

For instance, it assumes that the driver will never have to work with
the ACPI PM domain, because the ACPI PM domain has a separate set of
callbacks for system-wide suspend and resume and they are not the same
as its PM-runtime callbacks, so if the driver is combined with the
ACPI PM domain, running pm_runtime_force_suspend() may not work as
expected.

Next, it assumes that PM-runtime is actually enabled for the device
and the RPM_STATUS of it is valid when it is running.

Further, it assumes that the PM-runtime suspend callback of the driver
will always be suitable for system-wide suspend which may not be the
case if the device can generate wakeup signals and it is not allowed
to wake up the system from sleep by user space.

Next, if the driver has to work with a PM domain (other than the ACPI
one) or bus type that doesn't take the pm_runtime_force_suspend()
explicitly into account, it may end up running the runtime-suspend
callback provided by that entity from within its system-wide suspend
callback which may not work as expected.

I guess I could add a few if I had to.
