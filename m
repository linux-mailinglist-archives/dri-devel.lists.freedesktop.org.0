Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110C41EF22
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942486ECF1;
	Fri,  1 Oct 2021 14:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149266ECF1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:07:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so39305218lfr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ccy11Z40KixrI11cltYn5ZcJWVQJimHuRt26MAfNhAc=;
 b=mmVOZyqaAUMBtkBBuhdoApFSqfWX3cINwimlNhKZZQP7bUFuplZ9/aIK4LLMO7vJCr
 qyOqhGyIhI6KCEeiPZLwsC2b07LxNGLnpuzcmV6qFpBXMzpeNGktITcYb5/i+tzmqwrz
 7cx5/5peX588jl+VQ6N9Q3TMW7Iyn5I2zgmwHgFqykeahAizRFvqAC2iniw39z6abLEf
 On4jq92Ck02U2dkeqDjvca7VUTt4ZNUqTok0sAkszvDNL97AkFeYH3gKMQAjfU2Ojvja
 rqUwI5xXgPNFICuQzirzLNc0KSzY72zsy/ztBJ8fxgCLJn6zrD/25W2AyKPQmJOLsPTv
 M6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ccy11Z40KixrI11cltYn5ZcJWVQJimHuRt26MAfNhAc=;
 b=O0JjJAm9SKNM3Ic+6L3+GgLQJAMc0YDrOzcuINZu8f93MOpc0yB7/yAwPmFFAKxb59
 c9as5tuLqCgMhFEKojHr63qhAmFLI4NZisjsEpUS4YAVfbWu2kX59uzmVBszdTqFvgdr
 7VZ1SfnKwEGvyZWTVs49N8jpFtcEkVIh3Pxr0eBqiVXzbbsFpcgycxU9QxKsf4u2LLh+
 DniZk9MLFAUVaIsFyLkpJK5NptW7RGs4mL200SuG74rCY0sj99c7KfS3mIjkCze459z2
 oFBJWoy7U+71jCpIEtxYGBsvUERaFCdyQtHq2UKUSfeP6T2gc/oLj/CzDyKIVuLBPVJV
 OL/g==
X-Gm-Message-State: AOAM5317HpgJ3g/syNpyWRI6WWAPr0KtQFvVsAz/pnWin0RHxeBMUrki
 Aif8w5HgCYBxPJMhpeze6Dl79VbSzKyqYOgn3JjyOQ==
X-Google-Smtp-Source: ABdhPJxCT1fIjn0eX7h16hKPoCW6SQiHV9gFT4j/a+Ne56Lp+H5G5HrNrutb2Cfj1iLro5ZcopboLjBeTUlfzWnHMBA=
X-Received: by 2002:a2e:898c:: with SMTP id c12mr12102788lji.16.1633097254789; 
 Fri, 01 Oct 2021 07:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-15-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-15-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:06:58 +0200
Message-ID: <CAPDyKFoZdmnmcdoWsD36uQesSjz8KJOq0JxY5tNbHgO_xMy+_g@mail.gmail.com>
Subject: Re: [PATCH v13 14/35] drm/tegra: gr3d: Support generic power domain
 and runtime PM
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

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add runtime power management and support generic power domains.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr3d.c | 388 ++++++++++++++++++++++++++++++-----

[...]

> +
> +static int gr3d_probe(struct platform_device *pdev)
> +{
> +       struct host1x_syncpt **syncpts;
> +       struct gr3d *gr3d;
> +       unsigned int i;
> +       int err;
> +
> +       gr3d = devm_kzalloc(&pdev->dev, sizeof(*gr3d), GFP_KERNEL);
> +       if (!gr3d)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, gr3d);
> +
> +       gr3d->soc = of_device_get_match_data(&pdev->dev);
> +
> +       syncpts = devm_kzalloc(&pdev->dev, sizeof(*syncpts), GFP_KERNEL);
> +       if (!syncpts)
> +               return -ENOMEM;
> +
> +       err = gr3d_get_clocks(&pdev->dev, gr3d);
> +       if (err)
> +               return err;
> +
> +       err = gr3d_get_resets(&pdev->dev, gr3d);
> +       if (err)
> +               return err;
> +
> +       err = gr3d_init_power(&pdev->dev, gr3d);
> +       if (err)
> +               return err;
> +
>         INIT_LIST_HEAD(&gr3d->client.base.list);
>         gr3d->client.base.ops = &gr3d_client_ops;
>         gr3d->client.base.dev = &pdev->dev;
> @@ -352,20 +552,36 @@ static int gr3d_probe(struct platform_device *pdev)
>         gr3d->client.version = gr3d->soc->version;
>         gr3d->client.ops = &gr3d_ops;
>
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 200);
> +
> +       err = devm_pm_opp_register_set_opp_helper(&pdev->dev, gr3d_set_opp);
> +       if (err)
> +               goto disable_rpm;
> +
> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +       if (err)
> +               goto disable_rpm;
> +
>         err = host1x_client_register(&gr3d->client.base);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to register host1x client: %d\n",
>                         err);
> -               return err;
> +               goto disable_rpm;
>         }
>
>         /* initialize address register map */
>         for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
>                 set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
>
> -       platform_set_drvdata(pdev, gr3d);
> -
>         return 0;
> +
> +disable_rpm:
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);

Similar comment as for patch13.

> +
> +       return err;
>  }
>
>  static int gr3d_remove(struct platform_device *pdev)
> @@ -380,23 +596,83 @@ static int gr3d_remove(struct platform_device *pdev)
>                 return err;
>         }
>
> -       if (gr3d->clk_secondary) {
> -               reset_control_assert(gr3d->rst_secondary);
> -               tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
> -               clk_disable_unprepare(gr3d->clk_secondary);
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);

Similar comment as for patch13. You may want to use
pm_runtime_force_suspend() in favor of pm_runtime_disable().

> +
> +       return 0;
> +}

[...]

I was looking for a call to dev_pm_opp_set_rate(), but couldn't find
it. Isn't that needed when changing the rate of the clock?

Kind regards
Uffe
