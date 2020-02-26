Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C316FE89
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 13:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5CA6E8D2;
	Wed, 26 Feb 2020 12:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405F6E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:00:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D59524656
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582718427;
 bh=Lclb0eH80v4u1g56pysWLfOwuGpVeARd8AovsC1TdI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jQ8h3U0jIhT99eGQBn9hk/2Iw7ZaCqRLCXNHtc1hpRdj62SoNyfT6kk7Nk8VxYRnk
 L4UmDMtjqWZFuLnMX5M6iNUb0xVPe6iwkdYR8uB4q3HW/4Ztq5EDp8pD9nrnfLmi9H
 Y+LFid+ArBR8644RWZH1QBtOhvRwr0BZhjoql64E=
Received: by mail-lj1-f175.google.com with SMTP id q8so2749489ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 04:00:27 -0800 (PST)
X-Gm-Message-State: APjAAAV3iEDaPu8fRcIsy627pH+C4HRNwNvXeriUsqY/WWz1Gbg+Yice
 E8ibZMVgPZNzam9yvu5XV5X/RsW3uzu6T0mg0Oo=
X-Google-Smtp-Source: APXvYqzLuH/y8h7tr6V7z1tXstBeYwFNMDWsa5vqeSxWdJeFfvmg8GAopYhFDRKEbrOZRb+7TJxkMX9L5sGVP8AX3yk=
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr2891153ljk.201.1582718425607; 
 Wed, 26 Feb 2020 04:00:25 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874@eucas1p2.samsung.com>
 <20200226101119.16578-1-m.szyprowski@samsung.com>
In-Reply-To: <20200226101119.16578-1-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 26 Feb 2020 13:00:14 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeCj8UABGiGdvaqwa42kizHLqfrKvHZ5CDOaS1eyiY9Dg@mail.gmail.com>
Message-ID: <CAJKOXPeCj8UABGiGdvaqwa42kizHLqfrKvHZ5CDOaS1eyiY9Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: dsi: silence warning about regulators during
 deferred probe
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Feb 2020 at 11:11, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.

You are doing actually more than you explained here. You fixed
inaccurate error code (EPROBE_DEFER) being returned in case of
failures of getting regulators.

This change makes sense but commit message looks too innocent.

Best regards,
Krzysztof

>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 08a8ce3f499c..a85365c56d4d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1773,8 +1773,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
>                                       dsi->supplies);
>         if (ret) {
> -               dev_info(dev, "failed to get regulators: %d\n", ret);
> -               return -EPROBE_DEFER;
> +               if (ret != -EPROBE_DEFER)
> +                       dev_info(dev, "failed to get regulators: %d\n", ret);
> +               return ret;
>         }
>
>         dsi->clks = devm_kcalloc(dev,
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
