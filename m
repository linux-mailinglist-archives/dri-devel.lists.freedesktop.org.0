Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC6382845
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4CF6E91E;
	Mon, 17 May 2021 09:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693876E91E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 09:27:50 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso4214731pjx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZwRMoqcaR++/qsLAMyEgC+MY+iTWFtr0y91F+kn7q8k=;
 b=Z8swXdkk+dKfh+aLLxhLi8lWlp4mkbfMy/81Cjd4MDnE64ZghW9ZueJEk6L84nQFA6
 krBrRuJPLVECGL2IL+Pf+70BMzd2l9DshYECpaD+MbqUho81FRck40Nf9k9R2ifYg4Zc
 k4evgSLsNrwHG6f5yfnZu+YwptE5N7AGmXlBTk1135zokyikVgbHGlT6XbVOJK/5oyTZ
 FoCiPmAEIMuS9CMOZJg5CaNe8QYbxV8zkeAcbJLI+H+jXju78FuAwBGLhNYbRvmo2cnN
 Q3uNMB4x8bi45RqbF55ZR1ZcG9eETFmNpYRbrY41TsFGjDtY/NzK+GZhbi2MwfSABUwi
 CkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZwRMoqcaR++/qsLAMyEgC+MY+iTWFtr0y91F+kn7q8k=;
 b=HxMHh8lFzdbQNOiq2U4xofOy1K3RqvhI9AJ6Q2Edc6v8xmQ/DNOV/6QDzttLGwZRkC
 EmO1yML2kIVkC1MoHvxC/XkJZc46g54vvWhjE7GHL37YgekQBlk+sQQpELeJr4yToGoM
 SjBfNtF4viEn2W9EtPUFEGq2MQfxSDYh6Xc3A41W6WAfKui6HWxKVn4FzD0Gvn+lLSCm
 kN/mvic/5fIGVKpZyfKUPh0JlpaSwjbZWUcyJvR7Ax+DpNVCYup4kkDunGvyrvXCoAyf
 5SbvFmbPKPx5sfN+BrNLnu0c/VJQK2p4bNWBm4V3YrgCdLHQ4+GpQv+l+pccfVbA9vzE
 V1tQ==
X-Gm-Message-State: AOAM5316EgYTH3gxiMATgtm+4uGmMy3+9yrx6BaU/5YE/FNUKAJ+LH61
 VvbYcsEduKdJ5VzhxqA7mMUWuqTXW+eRspZCLwWmEQ==
X-Google-Smtp-Source: ABdhPJydTvFkg9dPdtjhuUxgGffLzT1pa4jhJl8umCT+4dwADgxZnkhU5/LAv8lw46BvzqEzkVDm+zHeE9Ii18tTSYg=
X-Received: by 2002:a17:902:4:b029:ee:8f40:ecbf with SMTP id
 4-20020a1709020004b02900ee8f40ecbfmr58725953pla.28.1621243669932; Mon, 17 May
 2021 02:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210517081601.1563193-1-yukuai3@huawei.com>
In-Reply-To: <20210517081601.1563193-1-yukuai3@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 May 2021 11:27:38 +0200
Message-ID: <CAG3jFyvjD+Gf5C+sWA8Qi9Hp-tJHeCjqbWX5Fds3m41nCLreyA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
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

On Mon, 17 May 2021 at 10:08, Yu Kuai <yukuai3@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 0cd8f40fb690..305489d48c16 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2478,7 +2478,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>         clk_prepare_enable(clk);
>
>         pm_runtime_enable(dev);
> -       ret = pm_runtime_get_sync(dev);
> +       ret = pm_runtime_resume_and_get(dev);
>         if (ret < 0) {
>                 dev_err(dev, "pm_runtime_get_sync failed\n");
>                 pm_runtime_disable(dev);

The code is correct as it is. If pm_runtime_get_sync() fails and
increments[1] the pm.usage_count variable, that isn't a problem since
pm_runtime_disable() disables pm, and resets pm.usage_count variable
to zero[2].

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L384
[2] https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L1383
