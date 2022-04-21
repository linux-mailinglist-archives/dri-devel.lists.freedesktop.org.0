Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE18509F91
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5D710E067;
	Thu, 21 Apr 2022 12:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4310E067
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:25:10 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n18so4695192plg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKhg142Wlk6AFjo5SyNKNuZ+EL/BpZej/wWvDH5mY50=;
 b=KQYDKUEOG7XGEF9CzfRneviC28oNECGV9wp4aaL6EO+HgbCyRazvNKSFAbOT3P3Byi
 hlSbIYZ3jvc+HU0wFz+UMeUTJrvJ9CsmhF+gAWZU9Zrj7C82UCPP1ug/4U2oFVyDkpJr
 EnuQMngI1SmLb7LmceYO+/yMj6t5yugx1ealPoYKNV9Zf8cnxf/zRCS3qkYKYcYKHjsi
 W5tynycj2yVt1Ga8MfNUhR53+S+i1hXYVncuX6A/c6P3azWo3kC5jMi6tjBa0C63HrNd
 IlTQdDg01AaKjBz79yKG18xannJDGgPdxk5A30kKhVlS+cmk1xPdjRNB3kXAwQZwWfhI
 Pm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKhg142Wlk6AFjo5SyNKNuZ+EL/BpZej/wWvDH5mY50=;
 b=r4hikXbMw0SXjVzoJreuZ4+VZJ36jha48iLke/8TaXzAzdrIeFz2HEI/1iLr+EzABR
 mm09/Dq6jqQbWnEv9ZFRcwikTgP7HaebIUb8A4BENjlpbMjT+r+rsWXy3bjm770F8ZSZ
 NsUHkFEMFEoo1JB4q5qfgQPitUVXMUwXLoH09AwyFR75NhwRRGv5Df3aXlMKCiq5QIzD
 wzIEBTXEj3+9gmD16z9a383YGCEHM1/0pvslxxtd0L+GtbjTzw3sSIPYFpCCGb2Tvuc4
 lW6etIHBBmfGFy/rl9F+su0zH2tsHa2Ve4s7AmUdYelVVDFP3/cfuQ+5K3qUiWWKOO8M
 l/Jg==
X-Gm-Message-State: AOAM533wsmOVvCFih2MYYcUb8mTFLeKbiwurNuzadSMLDP0eEyciXLny
 XLxTjHZ8s02dkIKFYwQhoUb7cM7MG80eEYtdBcXmgg==
X-Google-Smtp-Source: ABdhPJzzylUC2KC2I6WRbmhpdKZNMmOHuFcuihTnLQb/yX1aMnKuJbhRKQxowIfN7z1NZ/z1KaCl7oplC8mRCrBTnRY=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr10066726pjb.179.1650543910393; Thu, 21
 Apr 2022 05:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <202204031935.5SkYsM2M-lkp@intel.com>
 <20220420011644.25730-1-linmq006@gmail.com>
In-Reply-To: <20220420011644.25730-1-linmq006@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 21 Apr 2022 14:24:59 +0200
Message-ID: <CAG3jFyt5EG=OBk+pVwwHeeh_XgsCV82p-KiLcnL_yv8L1wUZ8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Fix error handling in analogix_dp_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Yakir Yang <kuankuan.y@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 at 03:16, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> In the error handling path, the clk_prepare_enable() function
> call should be balanced by a corresponding 'clk_disable_unprepare()'
> call , as already done in the remove function.
>
> Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - remove the wrong return statement.
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index eb590fb8e8d0..474ef88015ae 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1698,8 +1698,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(dp->reg_base))
> -               return ERR_CAST(dp->reg_base);
> +       if (IS_ERR(dp->reg_base)) {
> +               ret = PTR_ERR(dp->reg_base);
> +               goto err_disable_clk;
> +       }
>
>         dp->force_hpd = of_property_read_bool(dev->of_node, "force-hpd");
>
> @@ -1711,7 +1713,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>         if (IS_ERR(dp->hpd_gpiod)) {
>                 dev_err(dev, "error getting HDP GPIO: %ld\n",
>                         PTR_ERR(dp->hpd_gpiod));
> -               return ERR_CAST(dp->hpd_gpiod);
> +               ret = PTR_ERR(dp->hpd_gpiod);
> +               goto err_disable_clk;
>         }
>
>         if (dp->hpd_gpiod) {
> @@ -1731,7 +1734,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>
>         if (dp->irq == -ENXIO) {
>                 dev_err(&pdev->dev, "failed to get irq\n");
> -               return ERR_PTR(-ENODEV);
> +               ret = -ENODEV;
> +               goto err_disable_clk;
>         }
>
>         ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
> @@ -1740,11 +1744,15 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>                                         irq_flags, "analogix-dp", dp);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to request irq\n");
> -               return ERR_PTR(ret);
> +               goto err_disable_clk;
>         }
>         disable_irq(dp->irq);
>
>         return dp;
> +
> +err_disable_clk:
> +       clk_disable_unprepare(dp->clock);
> +       return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
