Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625AA395942
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9126E8D6;
	Mon, 31 May 2021 10:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776D6E8D6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:54:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id q16so5046317pls.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cfy6DRXq6ljOfq2YCBqTmPMGCh7cF1e+Nv6/xZRuDY8=;
 b=fSg6clnVpmsaZhiKs1gJHe2zyGeJAcUON85LO3uJz/8hxZi5GWGW4/kYyuZN6UdrOu
 BDu0Q32uT2uspePyuicSfsx49R6yV9oR9vqrCA4OrMd0zuxEyQLeqKCpOg921AMHmuAV
 PP7/6hfbkyNYPv7OUYTuJNXYKLsZIvAMABpqCQGQ0tcSBUW8NeDGuurEU/frcQe0yMiv
 Q/hPJnxGVp6KPsLsiIGcPwWMqi/leMRIBwbKtVk564ar/IaR8RiapZYSeDnd3DC+wRcC
 U2BoN9TgEh//yoI2YEJZ9WvrCYxbR7RhKwKBywyVRc0gK+7COtFRVXJUqH452Yc31CW/
 8kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cfy6DRXq6ljOfq2YCBqTmPMGCh7cF1e+Nv6/xZRuDY8=;
 b=dcV5xIhK9lJGk7VF3df+A0xGKPlzfP2ew1AmLzfqfOdilIh3Pkisu5tjE2LHpMsMe+
 eDOPrDjNDRnytDptfp4oQlUYbqxpLiOTagziojtqU9n9JaybQiX4FhbcMiewIfzR5e/t
 9EYfeW0zAHb79X5PjieDcaKHRiMNr839IeQi1vtdNjdxYln/xWKCBU5OH8fLn0rVau1q
 91s7VUvwDmKQf/M9kLxkfDUfkruW74enUoknFLnJn2WJq9RcPXLMqhuHxxdES/YbzqCP
 ckjJQOyStEwUCl1FgCpzoWj7PgBwMH8DuAJLsMiuDMmVXR3Nva62KS9qoSAWClV/ITWF
 44Ig==
X-Gm-Message-State: AOAM531fB4c9VQ6dxYgltJZVJGZ2ZfBBtt1dQ8G3ZS6YPRHfa8CrQhRe
 1+cRV3Ho0NUu0Z5+xK6ye5CxDE0QpA3B396ZvA+Ysg==
X-Google-Smtp-Source: ABdhPJxDz2gIW1DZ83c0oElXPz5eTXwhSHNC3N8sUAP9Y6Mq9a9NDfbXGhgvPsGiUFlkWWMmrLXCQlGW+6jsuypk+6c=
X-Received: by 2002:a17:90b:308:: with SMTP id
 ay8mr19003707pjb.19.1622458463982; 
 Mon, 31 May 2021 03:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210517081601.1563193-1-yukuai3@huawei.com>
 <20210529095554.3150362-1-yukuai3@huawei.com>
In-Reply-To: <20210529095554.3150362-1-yukuai3@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 May 2021 12:54:13 +0200
Message-ID: <CAG3jFyt53-MhwgGGcmMVSap3xCE_cQOmN26Rj3TvHtWFeVLZWg@mail.gmail.com>
Subject: Re: [PATCH V2] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
 cdns_mhdp_probe()
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

Hey Yu,

I'm not finding your this patch with the correct tags. I'd expect the subject:
[PATCH v2] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
cdns_mhdp_probe()

Can you please resubmit using this title, just to be sure I merge the
right version of this code.

On Sat, 29 May 2021 at 11:46, Yu Kuai <yukuai3@huawei.com> wrote:
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
> 2.25.4
>
