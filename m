Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A143EEC17
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862789F38;
	Tue, 17 Aug 2021 12:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C33B89F38
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 12:05:16 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id f6so12991557vso.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zp99VySxCP/C+XoDYPyxq/KzXedadDuj5suqohF5Fvg=;
 b=nFsjYjBXuhreAiAOicko40FJ2Ek7yGZ95EL78+psS1PBgU/zV/hVvGucyeNGB/VHuA
 CZvLcibDFKv0his4Xlc/kKpRR4KmuVlfNPdCOjLa9yqFMDSVDsx+N86gbova/TWvfOvh
 UN5fcZIAF+gxZrptxSzZ1Ic8Wvj0+yF7hFtRm/gqHM41KJ03TLeAZhinYWrAoSrnataU
 dyVF+WhuUoCZmS68K3nFSjCbBWA101ONrhbvx8clVKf/1q6HwW6DBCFaGKFGnYrUqvgr
 aL45tUdh4eNundsr+ZCDy2CWtZ6BTR2SQU6gRUHinuEuOmjdznvPCL+5j+0D/G8oV6sT
 gR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zp99VySxCP/C+XoDYPyxq/KzXedadDuj5suqohF5Fvg=;
 b=Ogu/KsfusLHf+csuqyqlIewbeI6/Kf5U1oKzx9m1burgmWT05HidLyrSyVaoHvP3ZS
 ooaTX7vaqpVUpIevSlc9oBynwp+ETT3p5l4CrESBugzlLfGjxa7yZwtupsErlBRKZxz6
 q2xFfR7yTfkYJhRf2vBVaZRNIDFhmQlHJx7EMrRzDzxaVJuzIBMZGMRQ1I+3KG/F3tmA
 PGG8vRGMpUBUVg+qd5ZXKWJRBgGDpts2sCvaCLZAHpTA6usyPf1pEnQdSJCieKuId9cU
 ruznRYnm2ahXihRM4cwYwrFLFmIDq3x97liRP1rYZOUC2eo7Pq7iBW899PGUIdT78cOg
 4/gA==
X-Gm-Message-State: AOAM5338sJrFH2XCPFyZAMb4sNP4OLSVA4mwhMxy1tDibGehcra9VWMm
 AEhZ7WWoaM6qo+yelbJrqOk/rgTwZ9u2nqAJqY5Snw==
X-Google-Smtp-Source: ABdhPJyAoDZB8D567sM7+DgXNNDfJZjhAOy3SVS/bltXL11iGgVxqJXFnX1rcCitBmOIa8V8M0KZWwa23CQNDRPlT28=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr2357440vso.48.1629201915619; 
 Tue, 17 Aug 2021 05:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-12-digetx@gmail.com>
In-Reply-To: <20210817012754.8710-12-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Aug 2021 14:04:38 +0200
Message-ID: <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/34] gpu: host1x: Add runtime PM and OPP support
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 17 Aug 2021 at 03:30, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add runtime PM and OPP support to the Host1x driver. It's required for
> enabling system-wide DVFS and supporting dynamic power management using
> a generic power domain. For the starter we will keep host1x always-on
> because dynamic power management require a major refactoring of the driver
> code since lot's of code paths will need the RPM handling and we're going
> to remove some of these paths in the future. Host1x doesn't consume much
> power so it is good enough, we at least need to resume Host1x in order
> to initialize the power state.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

[...]

> +
>  static int host1x_probe(struct platform_device *pdev)
>  {
>         struct host1x *host;
> @@ -394,6 +423,10 @@ static int host1x_probe(struct platform_device *pdev)
>         /* set common host1x device data */
>         platform_set_drvdata(pdev, host);
>
> +       err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
> +       if (err)
> +               return err;
> +
>         host->regs = devm_ioremap_resource(&pdev->dev, regs);
>         if (IS_ERR(host->regs))
>                 return PTR_ERR(host->regs);
> @@ -423,12 +456,9 @@ static int host1x_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       host->rst = devm_reset_control_get(&pdev->dev, "host1x");
> -       if (IS_ERR(host->rst)) {
> -               err = PTR_ERR(host->rst);
> -               dev_err(&pdev->dev, "failed to get reset: %d\n", err);
> +       err = host1x_get_resets(host);
> +       if (err)
>                 return err;
> -       }
>
>         err = host1x_iommu_init(host);
>         if (err < 0) {
> @@ -443,22 +473,10 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto iommu_exit;
>         }
>
> -       err = clk_prepare_enable(host->clk);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "failed to enable clock\n");
> -               goto free_channels;
> -       }
> -
> -       err = reset_control_deassert(host->rst);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
> -               goto unprepare_disable;
> -       }
> -

Removing the clk_prepare_enable() and reset_control_deassert() from
host1x_probe(), might not be a good idea. See more about why, below.

>         err = host1x_syncpt_init(host);
>         if (err) {
>                 dev_err(&pdev->dev, "failed to initialize syncpts\n");
> -               goto reset_assert;
> +               goto free_channels;
>         }
>
>         err = host1x_intr_init(host, syncpt_irq);
> @@ -467,10 +485,14 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto deinit_syncpt;
>         }
>
> -       host1x_debug_init(host);
> +       pm_runtime_enable(&pdev->dev);
>
> -       if (host->info->has_hypervisor)
> -               host1x_setup_sid_table(host);
> +       /* the driver's code isn't ready yet for the dynamic RPM */
> +       err = pm_runtime_resume_and_get(&pdev->dev);

If the driver is being built with the CONFIG_PM Kconfig option being
unset, pm_runtime_resume_and_get() will return 0 to indicate success -
and without calling the ->runtime_resume() callback.
In other words, the clock will remain gated and the reset will not be
deasserted, likely causing the driver to be malfunctioning.

If the driver isn't ever being built with CONFIG_PM unset, feel free
to ignore my above comments.

Otherwise, if it needs to work both with and without CONFIG_PM being
set, you may use the following pattern in host1x_probe() to deploy
runtime PM support:

"Enable the needed resources to probe the device"
pm_runtime_get_noresume()
pm_runtime_set_active()
pm_runtime_enable()

"Before successfully completing probe"
pm_runtime_put()

> +       if (err)
> +               goto deinit_intr;
> +
> +       host1x_debug_init(host);
>
>         err = host1x_register(host);
>         if (err < 0)
> @@ -486,13 +508,13 @@ static int host1x_probe(struct platform_device *pdev)
>         host1x_unregister(host);
>  deinit_debugfs:
>         host1x_debug_deinit(host);
> +
> +       pm_runtime_put(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);
> +deinit_intr:
>         host1x_intr_deinit(host);
>  deinit_syncpt:
>         host1x_syncpt_deinit(host);
> -reset_assert:
> -       reset_control_assert(host->rst);
> -unprepare_disable:
> -       clk_disable_unprepare(host->clk);
>  free_channels:
>         host1x_channel_list_free(&host->channel_list);
>  iommu_exit:

[...]

Kind regards
Uffe
