Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE941A65E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 06:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92D78992E;
	Tue, 28 Sep 2021 04:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F678992E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 04:16:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u18so85469240lfd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 21:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eL8IYhkBbLYcNm7LWC+avj2icvoXrApd/DMgvG7Twyg=;
 b=Eg8E7WnVcCUfLf8Ic979XRm2k2bRRRS5cfcByGjlYk3mZw++clN8E9Mu0gCn2g6jlc
 DvNLz5lv3HRmcDkWz/2pi56Sq9GD884uDlV0wwmN8zU1fcmA/urMrQR6/KXxqYfP7/v0
 mQoGiTMoWWRKzKyYckYDAauVPWpN/zkm1al4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eL8IYhkBbLYcNm7LWC+avj2icvoXrApd/DMgvG7Twyg=;
 b=DFJ5xfN+VEYlrQK7YMNYbg5wRwSzcaqVJkVCbnguYuRVlpLZdHK2TZWtvHqSXzQD2K
 HqZWU05Tw61ejVVLIXadXKMQPUAg//nbpG+6q21D2TBJv5JdEE3LMPvRK3bmbBKqelp4
 PBlJpVAF6f6WYsKArAkVr/tIiXkDPKdyc23658bc1TReJjso5z1KIUVAYiMlyJFYi/e+
 2zlCUMvLMQ+BCvCyoPbb1LK5JYDXhapGecHqf1sZK/zTCZ28rM7f/LH7xcQvMZTxCX0S
 5+GsyBpg6MAcgumQWDm0PXjQSZ5eW1Pc34ncCBJpmET6MHFQ/uYfbcPOqi5RjlGiQDf7
 ot/Q==
X-Gm-Message-State: AOAM530nqjDzaQfax3Iqsa7xx2NVLMeUWxU9WcOHRuejbKeNWi5u8r2O
 OB5T6H9B/14dyGYfZuO+FMeG/WnSYkWvsv8r+ihBFA==
X-Google-Smtp-Source: ABdhPJx8KGnrGRNzuf6NG48x9cD+ZD+NRNaWIdRd4p9u7i9UtAdmAM8/xxrYlRzBWfIl36gUQk5oYDUYQcbS4fqjI5U=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr3397436lfq.597.1632802602866; 
 Mon, 27 Sep 2021 21:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.3.I8bb7a91ecc411d56bc155763faa15f289d7fc074@changeid>
In-Reply-To: <20210927105928.v2.3.I8bb7a91ecc411d56bc155763faa15f289d7fc074@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Sep 2021 12:16:31 +0800
Message-ID: <CAGXv+5GxCHJM_CewS8dPTLc7NPC6jcKZvrUFat0nemzZpu8PUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dsi: Disable PLL clock on bind error
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Thomas Hebb <tommyhebb@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>
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

On Tue, Sep 28, 2021 at 2:00 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Fix some error handling here noticed in review of other changes.
>
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi
bridge driver")

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Additionally, I would move patch 2 and this patch before the first patch,
as these two fix a commit introduced in v5.0, while the first patch fixes
something introduced in v5.14. This would make automatic backporting cleaner.

> ---
>
> Changes in v2:
> - New
>
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index fa4080176719..0ed13d81fe60 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -943,7 +943,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
>         ret = clk_prepare_enable(dsi->grf_clk);
>         if (ret) {
>                 DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n", ret);
> -               goto out_pm_runtime;
> +               goto out_pll_clk;
>         }
>
>         dw_mipi_dsi_rockchip_config(dsi);
> @@ -955,17 +955,19 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
>         ret = rockchip_dsi_drm_create_encoder(dsi, drm_dev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
> -               goto out_pm_runtime;
> +               goto out_pll_clk;
>         }
>
>         ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
> -               goto out_pm_runtime;
> +               goto out_pll_clk;
>         }
>
>         return 0;
>
> +out_pll_clk:
> +       clk_disable_unprepare(dsi->pllref_clk);
>  out_pm_runtime:
>         pm_runtime_put(dsi->dev);
>         if (dsi->slave)
> --
> 2.33.0.685.g46640cef36-goog
>
