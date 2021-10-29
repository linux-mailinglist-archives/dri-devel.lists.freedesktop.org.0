Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A843FFF1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 17:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0892189C16;
	Fri, 29 Oct 2021 15:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9047789C16
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 15:56:30 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id o4so13943010oia.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/SMjFsF1c2jJAFrAQjbA6gkypuYLRMtEM9UCUe5CB44=;
 b=Po4MFRS0XQcQzUJconspRggetb0A7xSKqO49EhxidxPr8qVlB+9yqznoVw0TxWIUgt
 9+eRPInPiL7kJ3eySv+CbTWbfRsMfUAFZrRSf+pQ2JP2xt8gXO+Ss3ZO3FSxKcLN/fDF
 Vdan4m3w2yP/ubzEC7H1IqB6Qi0exGYqaFL0E8SAzSz0ZRt54Bu+m/LlWiiHtitCrnCB
 MPzGE8qk2tfE//tXBbjb2Nwrb3xZ8R9NtGnCvBVeAzaUoDpzATBXAfPpDBuAlwo/KY1u
 PoWZlzlDGv9olU/2ocao6Bt74ZYV88P2fjFnVlsA08eJZGhRwps6I5Qd/A4dF5Ws+kYJ
 IUMw==
X-Gm-Message-State: AOAM532Hnix5UgNkqxAbTvW5oqxIbLoteiLmkTvXdcJG9MC2Nmc0UA0/
 xRGeneiPGrR0io/Qawe5ob8Dj6D5EWM583JPYkw=
X-Google-Smtp-Source: ABdhPJyt4UMxkF1vsuAi+BGZn90y8TkCvU/MAtayV4OwG5udI4L0shq0uzCyV4nG28Fc/pQknaSM5LL0g9M7DRCchMM=
X-Received: by 2002:a05:6808:128d:: with SMTP id a13mr2577oiw.51.1635522989816; 
 Fri, 29 Oct 2021 08:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
 <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
In-Reply-To: <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 29 Oct 2021 17:56:18 +0200
Message-ID: <CAJZ5v0i9OtA1nDiv8UXuF3ASdENFYJFV7+nMWm6Pcu=kw8k1aQ@mail.gmail.com>
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
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

On Fri, Oct 29, 2021 at 5:20 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 26.10.2021 01:40, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +     ret =3D devm_pm_runtime_enable(&pdev->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(&pdev->dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       /* Set maximum frequency of the IP */
> > -     ret =3D clk_set_rate(pwm->clk, pwm->soc->max_frequency);
> > +     ret =3D dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "Failed to set max frequency: %d\n", =
ret);
> > -             return ret;
> > +             goto put_pm;
> >       }
> >
> >       /*
> > @@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *=
pdev)
> >       if (IS_ERR(pwm->rst)) {
> >               ret =3D PTR_ERR(pwm->rst);
> >               dev_err(&pdev->dev, "Reset control is not found: %d\n", r=
et);
> > -             return ret;
> > +             goto put_pm;
> >       }
> >
> >       reset_control_deassert(pwm->rst);
> > @@ -291,10 +307,15 @@ static int tegra_pwm_probe(struct platform_device=
 *pdev)
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
> >               reset_control_assert(pwm->rst);
> > -             return ret;
> > +             goto put_pm;
> >       }
> >
> > +     pm_runtime_put(&pdev->dev);
> > +
> >       return 0;
> > +put_pm:
> > +     pm_runtime_put_sync_suspend(&pdev->dev);
> > +     return ret;
> >  }
> >
> >  static int tegra_pwm_remove(struct platform_device *pdev)
> > @@ -305,20 +326,44 @@ static int tegra_pwm_remove(struct platform_devic=
e *pdev)
> >
> >       reset_control_assert(pc->rst);
> >
> > +     pm_runtime_force_suspend(&pdev->dev);
>
> I just noticed that RPM core doesn't reset RPM-enable count of a device
> on driver's unbind (pm_runtime_reinit). It was a bad idea to use
> devm_pm_runtime_enable() + pm_runtime_force_suspend() here, since RPM is
> disabled twice on driver's removal, and thus, RPM will never be enabled
> again.
>
> I'll fix it for PWM and other drivers in this series, in v15.

Well, for the record, IMV using pm_runtime_force_suspend() is
generally a questionable idea.
