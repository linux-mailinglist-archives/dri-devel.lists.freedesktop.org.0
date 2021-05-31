Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC95395E15
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8496E4AB;
	Mon, 31 May 2021 13:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5FB6E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 13:52:51 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id x10so4350821plg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IF1aTpQct9sJ+gq1IJA/M4omf+v9Ka1E7+gOZVm10aM=;
 b=e+6fWrmznbU4d7VPIa7bEUQ88+n0IjOWNHrTpuBM/+1AK7iKt500h0t5mVJRSfjXQX
 Hchvbamg/rjKsbf5vaIy2z9A4odpvQ1+RyxpYvcYZK2sKTDBKN1To9KIJdPtHszWtAGC
 pUFuN8tSY0VWh53ZcD/DkOwjNS5fy4+x/PCP/B2O02NYHSV5g7edwJKMVgidF3zCedmI
 4TYTKUuJuFSY+KlhzNJHGbAXV6HcbkrlqMovDugqwot5g6DhvuHFbAkWLUxP8T650vfA
 gX26OGQXgVeB6XilX29VyHWIpNkIOVSlKpcT5wlNDncxDLptcC0yB+GniIFfmM5B1aeW
 xtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IF1aTpQct9sJ+gq1IJA/M4omf+v9Ka1E7+gOZVm10aM=;
 b=V9okorZoGpErFJVXdzjnITORiqQiwBQei/jdC+HoYoI06ZZgYlZrkmlBS3tEbKSITk
 Y0uhQzRjwErINmdxHwKMwRbMaV8qGNJKYoqwDXPqWD6UF/0yg6mxwiQXiIBV+vEZNtGz
 AaewlqOnTNhuGy5V/pfzvG2s7o2rJW5REqngAMowqpZBXuT6JsSHt2QPcSx6cQanx9cM
 OykZ1cVGXFNksQMJzxCsYkZ7UCI5kUmCLV/if2QkTYgz/y4RSMPH8Uh3fRmO9g7mBYSX
 tDAaEILWlDEHNYT79X2iLoWoQV+Mc1srr0o3FixjznOMJ1fKJsV0y6mTZxodx/7ZmtoR
 ihhQ==
X-Gm-Message-State: AOAM532Lgy5uvQkng2Zaq6UDgLDVtap44W49fgU368QW10YOZpu/O6Fa
 SpELEDU7qudG8sAQl0l8yIpFUvNrNmlPugcGFH2L2Q==
X-Google-Smtp-Source: ABdhPJzL5nrqH2nouf+M4B7+QBQmpfIZlVABN9xXH8wmvc/7J63WraTekrOucN8N6yiNpFtbhFQEnWakPlzhGGG4Cck=
X-Received: by 2002:a17:90a:43a6:: with SMTP id
 r35mr11166114pjg.222.1622469170762; 
 Mon, 31 May 2021 06:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210531135622.3348252-1-yukuai3@huawei.com>
In-Reply-To: <20210531135622.3348252-1-yukuai3@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 May 2021 15:52:39 +0200
Message-ID: <CAG3jFyuSheggFGh-6+H7EypHbb7pO=XcsiAYtS5DxB2HdBwt=g@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
To: Yu Kuai <yukuai3@huawei.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 yi.zhang@huawei.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added r-b tag and merged to drm-misc next.

https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next

Thanks for the submission, and sorry about making you jump through all
those hoops.

On Mon, 31 May 2021 at 15:47, Yu Kuai <yukuai3@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
> changes in V2:
>  - change error message.
>
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 0cd8f40fb690..eab959a59214 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2478,9 +2478,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>         clk_prepare_enable(clk);
>
>         pm_runtime_enable(dev);
> -       ret = pm_runtime_get_sync(dev);
> +       ret = pm_runtime_resume_and_get(dev);
>         if (ret < 0) {
> -               dev_err(dev, "pm_runtime_get_sync failed\n");
> +               dev_err(dev, "pm_runtime_resume_and_get failed\n");
>                 pm_runtime_disable(dev);
>                 goto clk_disable;
>         }
> --
> 2.31.1
>
