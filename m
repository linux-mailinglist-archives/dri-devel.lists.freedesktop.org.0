Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AA43FF8B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 17:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423526E154;
	Fri, 29 Oct 2021 15:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8176E154
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 15:29:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u11so21823161lfs.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zb5to8IVmbXLcOuzy5HbR2D8SvYMJeBSxxm0t+10yes=;
 b=jJdFEoGn8EIaT8Neu3EZWdJ0T5kC3jtTFduArBVtuDx6mWscceXNrcx8A7PEO5SBFt
 VxxBXXtewNAOyGL9NISwbn8uqUJ5agsj+UemHZbI2/6GXh0Tr7GVCB0sMxna8iiURDvP
 v9RHYsHtNaNk3Z5iFWB2866iTaQva51DvN9TpWrWrCbscBsIE0cO9GtkiubMAwsrOnIj
 yM8X/+Go+hn6MacM8IB9wZCUBNon7GCbqfRHOQnFdCG8KGX3ZiGnYkm2SdJYeEhRuB4s
 y7d2vyxzyYm6MajX8LroWwZMrNJxTMCADiRhF8UTkbgJfaP60pk1oD6GF5HsVYx/WHnM
 NnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zb5to8IVmbXLcOuzy5HbR2D8SvYMJeBSxxm0t+10yes=;
 b=HAki3K+kE/Zzs3pUov+JbrvFGmxBx8AMPl055XZ9WEnim5o0h1kwka3bx0Kf2NBrv7
 WY/TMpNMYhw12ss0B8vc+FMgWIjhI+6w5l2nn8iFapLOjDUZbAIu6U2UUuR6FAinMtgg
 sLbb5ZK7ytMyla9VbNrM8XDCHGPr2MTMcdBv2PCCZRwdpEvLN582oAz7BwbPgoAWyOUz
 DQV6qt/57LDTx+49VyxzVKz5bTnFWNeiZMdrMPM2HvdyxwbGDOq+Q9HrJKh/LKwE+3Z1
 BtYHylEBKRIkFJ6DrTBb/q6yXar8Y5/J2NpNX0pLpAxUX/ENzGmasl2qIOW3vRq+rIeV
 w6xw==
X-Gm-Message-State: AOAM530v+eU1gZQZraiEJl1wUBK6vqyodLqfmJzJ7hizxAK06Flpyi7p
 01hyy+MPkFs/ZZSVYOLNPQRJ4tvYAYH31GFjKZWwFg==
X-Google-Smtp-Source: ABdhPJz3Gt3DD4ggJlW5a/iffQ9H3If6jJ5fMxiXKNlpkM72XuoMKE2zri1Er8kmZWdw04yhv5F2a0V1Eko88RxRgy4=
X-Received: by 2002:ac2:5328:: with SMTP id f8mr11555895lfh.233.1635521371526; 
 Fri, 29 Oct 2021 08:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
 <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
In-Reply-To: <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 29 Oct 2021 17:28:55 +0200
Message-ID: <CAPDyKFoa5eQTrNxyiFevUCWitUecX=hi=y7qv1dC2mqk0+0XBA@mail.gmail.com>
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
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

On Fri, 29 Oct 2021 at 17:20, Dmitry Osipenko <digetx@gmail.com> wrote:
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

Good catch - and sorry for not spotting it while reviewing!

Maybe devm_pm_runtime_enable() isn't that useful after all? Should we
suggest to remove it so others don't fall into the same trap?

Kind regards
Uffe
