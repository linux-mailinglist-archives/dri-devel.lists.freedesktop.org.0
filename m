Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52E41EF4A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4E6ECF3;
	Fri,  1 Oct 2021 14:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8BD6E550
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:19:37 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m3so38942256lfu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TmYkpMVtb1uSKsqX5euv7WOyLfzbmtOSlOndqVN+8j0=;
 b=duQY39xT4Fb3Hr1PnbXTs56tkaQqjpQAgYJH7QSZorCPxuVu1w1xjBo4K+zxv2eT/i
 Gv8vFaPicQua766hZYd2Z4sFxKAhudSPsUf76DMai8U3Fw5bbvcx7fO5WW1P2A848bGM
 ZQq9OG2u50UNu3Jjx5+mQA6VDCrE6ml8Fh35xGIGRw6EE6eRYolYKa9p+8rWD2ZvBilp
 uWVK4oDlCgf7DxNBdPej6J24qlMnSVWJnHXL2sfU57hu2pnNnIEFwtPnFm56+42awhNu
 cSD+lRwaEeSCzPyePp37ympdEiAHaEdnn7LGs+wYp5tVdUW4CxRCTuk1HbDpdUV4ipuJ
 BGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmYkpMVtb1uSKsqX5euv7WOyLfzbmtOSlOndqVN+8j0=;
 b=6c8LscDUu9jV4MDsd0PVBZa38JPWOXKgjCGLQqJDFONWn8QhNvakgFNX/dJUTMmSIa
 MpcCFm7a8OOvx/5jrd/190zkMcsZVYANRoDRnn7Xg/4hfCH+p/cVyszV2yO1nQOWvzBX
 OSxLtug/B5Xe69UpSxaKhv/Qs982lUmYg1Xbqo5QCRUUdp4RDMwFpCn+ix2O3cuUuyNv
 oktuwkf3A9IfpCmcaHq7jIRdO4xbPSedADvVQXj1NtTDEoZb/Rv4mDs3qLi4WCGFC0mj
 Ufb04oS1A3dRPqPvhjG5w95vLTHWC57lxG3vzqpsEQPI6b5P2Dz12CqgSbWQh6XSoCuV
 jxKQ==
X-Gm-Message-State: AOAM530HJ9fe0EE/we2lUlrhGySUu0pb0NOW3hgRac0LVaTub7TsOoGX
 kv1lCxJFcT/kRJrTDCME+rtyi7AqWqfyXpsqLqMa1RB69ME=
X-Google-Smtp-Source: ABdhPJykzVLbDQqRsm8qwArsDUIjqMsOFjOioC0Mnou3m3mAAqwDg9NoSSc7iCu+AIdRWsUjvdPXt+LHd7gC+IctUuw=
X-Received: by 2002:a05:6512:2397:: with SMTP id
 c23mr5560648lfv.358.1633097975362; 
 Fri, 01 Oct 2021 07:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-18-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-18-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:18:59 +0200
Message-ID: <CAPDyKFoC7Kn9FPjAZLisSKWyYaXr1j2GnyQGNTVg_Dsuku-muA@mail.gmail.com>
Subject: Re: [PATCH v13 17/35] bus: tegra-gmi: Add runtime PM and OPP support
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
> The GMI bus on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now GMI must be resumed using
> runtime PM API in order to initialize the GMI power state. Add runtime PM
> and OPP support to the GMI driver.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/bus/tegra-gmi.c | 52 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
> index a6570789f7af..72ef8a8c236b 100644
> --- a/drivers/bus/tegra-gmi.c
> +++ b/drivers/bus/tegra-gmi.c
> @@ -13,8 +13,11 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>
> +#include <soc/tegra/common.h>
> +
>  #define TEGRA_GMI_CONFIG               0x00
>  #define TEGRA_GMI_CONFIG_GO            BIT(31)
>  #define TEGRA_GMI_BUS_WIDTH_32BIT      BIT(30)
> @@ -54,9 +57,9 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
>  {
>         int err;
>
> -       err = clk_prepare_enable(gmi->clk);
> -       if (err < 0) {
> -               dev_err(gmi->dev, "failed to enable clock: %d\n", err);
> +       err = pm_runtime_resume_and_get(gmi->dev);
> +       if (err) {
> +               pm_runtime_disable(gmi->dev);
>                 return err;
>         }
>
> @@ -83,7 +86,8 @@ static void tegra_gmi_disable(struct tegra_gmi *gmi)
>         writel(config, gmi->base + TEGRA_GMI_CONFIG);
>
>         reset_control_assert(gmi->rst);
> -       clk_disable_unprepare(gmi->clk);
> +
> +       pm_runtime_put(gmi->dev);
>  }
>
>  static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
> @@ -213,6 +217,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>         if (!gmi)
>                 return -ENOMEM;
>
> +       platform_set_drvdata(pdev, gmi);
>         gmi->dev = dev;
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -232,6 +237,14 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>                 return PTR_ERR(gmi->rst);
>         }
>
> +       err = devm_pm_runtime_enable(gmi->dev);
> +       if (err)
> +               return err;
> +
> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +       if (err)
> +               return err;
> +
>         err = tegra_gmi_parse_dt(gmi);
>         if (err)
>                 return err;
> @@ -247,8 +260,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       platform_set_drvdata(pdev, gmi);
> -
>         return 0;
>  }
>
> @@ -262,6 +273,34 @@ static int tegra_gmi_remove(struct platform_device *pdev)

Similar comment as for patch13, for the ->remove() callback.

This problem, which sometimes also exists in the error path in
->probe() (according to my comments in patch13), seems to be a common
issue in the series. I will therefore not continue to repeat my
comment on this for the remaining patches in the series, I think I
have made my point. :-)

Kind regards
Uffe
