Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5043CD08
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2BB6E8BA;
	Wed, 27 Oct 2021 15:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E576E8BA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:06:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id q16so5249428ljg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEeOc3SRoTkeXEKVHoRlTI3OBL2wUysOvGNTyGSpDRc=;
 b=vBrX1hroP2zBuvD1iKJmnG7LMigUVOYCCUjI8nNnhrOkTN5QjBm3VWoeIohRkK94mM
 0iA0f/MUpH4lU1LpX3SUAg9Qb9ffQA0/D8+lP5Yzp3hO1Oc/dXHRmqswxRuT9K08TkOO
 JxqtHG9LNOmuEPBOqsrakS8A/PnsDc4pWHFk4nsd1CWrbhV3CP6XgVEYZVsOFiX/FjzB
 9hgAWNpXsxKJufJeQdlXOK36M6tMtnDPGse1nNhXhUmjKb5V5lpoDBCxHytpfbgd1la/
 VwvSyqBmg75weHCA9Vnyf+aKIJjXvgL/syNjDNOWymJZFrIy8+prLwST1MBBhfHGFO6k
 aaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEeOc3SRoTkeXEKVHoRlTI3OBL2wUysOvGNTyGSpDRc=;
 b=MxZC7QCedtjQVlpENqfOsx4HUx9C7239F5m9mMD2RNX2EKrvEUmhC0eay6G/n5OJBC
 4nkox0P5xfqND30v7I9aifJCh1WTKqZOtNqLcbYATg9q3BnCL2Pp2vbA6vQw5t8TmKTh
 lRdW9MTiZIbsQ0FquIemXvI7A/2nkRXZqxluu3Puk558LnxVQDOXa372iGbhuA/49UjL
 b5e13JxkEddAeC4KBc6rWzFcOf0cifFnx3tUWqAT0kmN43WVYJG0HSqY7sXCA7F1Q00/
 rxC619Hn0Unmo7ftzsuvj1JH6IjvLraEmo6fndTh6S4077QfRmk2nGNvGNFJ454z/zVM
 kDKA==
X-Gm-Message-State: AOAM530WGJd9lM2JOaTewCMIwgv+YfeSjZzI15gEIFZ/vinLSJ3XE7MP
 eipovYE7HZauywxlDd/nLG98JjThrOVjAJPf7X1PIw==
X-Google-Smtp-Source: ABdhPJysjKT4Qj/n7/ftR0oVtnZjTh7iTetwxvNQGH0ktAIGHoCGiRAbJE5llFkaZZ7c+ePHtcATzAPymmbQqNT848A=
X-Received: by 2002:a05:651c:11c4:: with SMTP id
 z4mr33240531ljo.463.1635347215604; 
 Wed, 27 Oct 2021 08:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-2-digetx@gmail.com>
In-Reply-To: <20211025224032.21012-2-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Oct 2021 17:06:19 +0200
Message-ID: <CAPDyKFr7VY73cQugSA5n-p_oXf43o1M-7s3-M+fnk0656h25UA@mail.gmail.com>
Subject: Re: [PATCH v14 01/39] soc/tegra: Enable runtime PM during OPP
 state-syncing
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

On Tue, 26 Oct 2021 at 00:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> GENPD core now can set up domain's performance state properly while device
> is RPM-suspended. Runtime PM of a device must be enabled during setup
> because GENPD checks whether device is suspended and check doesn't work
> while RPM is disabled. Instead of replicating the boilerplate RPM-enable
> code around OPP helper for each driver, let's make OPP helper to take care
> of enabling it.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Just a minor nitpick, see below. Nevertheless feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/soc/tegra/common.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index cd33e99249c3..d930a2b4facc 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>
>  #include <soc/tegra/common.h>
>  #include <soc/tegra/fuse.h>
> @@ -43,6 +44,7 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
>  {
>         unsigned long rate;
>         struct clk *clk;
> +       bool rpm_enabled;
>         int err;
>
>         clk = devm_clk_get(dev, NULL);
> @@ -57,8 +59,22 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
>                 return -EINVAL;
>         }
>
> +       /*
> +        * Runtime PM of the device must be enabled in order to set up
> +        * GENPD's performance properly because GENPD core checks whether
> +        * device is suspended and this check doesn't work while RPM is
> +        * disabled.
> +        */
> +       rpm_enabled = pm_runtime_enabled(dev);
> +       if (!rpm_enabled)
> +               pm_runtime_enable(dev);

This makes sure the OPP vote below gets cached in genpd for the
device. Instead, the vote is done the next time the device gets
runtime resumed.

I don't have an issue doing it like this, but at the same time it does
remove some flexibility for the drivers/subsystem that calls
tegra_core_dev_init_opp_state().

Isn't it better to leave this to be flexible - or you prefer to have
it done like this for everybody?

> +
>         /* first dummy rate-setting initializes voltage vote */
>         err = dev_pm_opp_set_rate(dev, rate);
> +
> +       if (!rpm_enabled)
> +               pm_runtime_disable(dev);
> +
>         if (err) {
>                 dev_err(dev, "failed to initialize OPP clock: %d\n", err);
>                 return err;

Kind regards
Uffe
