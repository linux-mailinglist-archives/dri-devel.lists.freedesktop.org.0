Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3556A922
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13C11207E;
	Thu,  7 Jul 2022 17:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303FA11207E;
 Thu,  7 Jul 2022 17:10:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id l42so1350019wms.5;
 Thu, 07 Jul 2022 10:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VA3SbJt6EBSMC9jnydWIaREGnbjiJhUGWyogd1VBc60=;
 b=bFUBCIKLe6IQ6qKpFInDA68vnotWBxMQeNgiY+32c5hZkyDPLBon+btxmBjOaT4Y00
 JEGKosj0QpNEYt24iNH0xhzZFolz6hudOUcUNksNXyUHGLj0VzjJJrQdoICPPCeQAoH0
 DNvlgcB66YwPwmwNcbRIrvhSVV1O2QMWt3cEd+xRKme9rXjw1u541IIxhfiBT+M0zYzF
 Mqaras7dlF18CgSZuMfGSCvJ5Z8yuTSqJm/NBEIIdZ0jcHSzXf7rD1600FpqAYDYVz37
 VcIBDJZVjXEDiihGtQUD991TWP3ma0P3tfhIYqHjumqI0h3Y8MFStDNct6Mqh9AEK/bq
 I9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VA3SbJt6EBSMC9jnydWIaREGnbjiJhUGWyogd1VBc60=;
 b=xJI4REvn4nK7bkMuez4J3fQVkXF+U2C3I1CUIkGTRGe8SL7nJf7MfSIPGRUbecQvXE
 75oQMZO9WPHGJm65cK9CYE5ijwbtKxGWGZAahIQntHdBfz2yxeJI/HpmlbSvlfcGH+pB
 BPijP1EucOCG+1VUpRDVjtxhAGbN+GddJOrLJDqGhELhgjXyT+BhmCqWN2fsOUQAJkb7
 GtVpXZxIgykv3AqXzechaT6sg5eUUDDvUayu1lsOmSCQdYwUI1TEF6zXGSsRJNH/zpcg
 oZ14BYIVpx+WPCnw/Kt7ZC6ckXhcClC+XPNxq6ea/shZK1LGWqSfBlBn0nWbI7wWVtV7
 Fu1g==
X-Gm-Message-State: AJIora/DnVDslc/L/ENm6KwNJcruzO9Y4Q/hGNbVvAaPFKtnNG0+iUiC
 TGRkJfSOD4kJw3/+Je7mx/wVgDgJESaHaSykLGQ=
X-Google-Smtp-Source: AGRyM1uKOuyzI23A8kLJo8W49G7VbTQ+827LPYXQYYmMTeuOaUGs/FqsFT/Z7LFMdUkclpe5ALdeM3qoqjfBfNwZMXk=
X-Received: by 2002:a05:600c:3593:b0:3a1:8909:b5b2 with SMTP id
 p19-20020a05600c359300b003a18909b5b2mr5728498wmq.77.1657213813592; Thu, 07
 Jul 2022 10:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220707213950.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
In-Reply-To: <20220707213950.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Jul 2022 10:10:01 -0700
Message-ID: <CAF6AEGudkkUvYjy_7engFGrQy2scdskmc1SRpKN3x0MOxOr1ug@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm: Fix cx collapse issue during recovery
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 7, 2022 at 9:11 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> There are some hardware logic under CX domain. For a successful
> recovery, we should ensure cx headswitch collapses to ensure all the
> stale states are cleard out. This is especially true to for a6xx family
> where we can GMU co-processor.
>
> Currently, cx doesn't collapse due to a devlink between gpu and its
> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> that the iommu driver removes its vote on cx gdsc.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 42ed9a3..57a7ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1210,8 +1210,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>
> -       gpu->funcs->pm_suspend(gpu);
> -       gpu->funcs->pm_resume(gpu);
> +       /*
> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> +        * First drop the usage count from all active submits
> +        */
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_put(&gpu->pdev->dev);

Would pm_runtime_force_suspend/resume() work instead?

BR,
-R

> +
> +       /* And the final one from recover worker */
> +       pm_runtime_put_sync(&gpu->pdev->dev);
> +
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_get(&gpu->pdev->dev);
> +
> +       pm_runtime_get_sync(&gpu->pdev->dev);
>
>         msm_gpu_hw_init(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index f75ff4b..48171b6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -444,9 +444,7 @@ static void recover_worker(struct kthread_work *work)
>                 /* retire completed submits, plus the one that hung: */
>                 retire_submits(gpu);
>
> -               pm_runtime_get_sync(&gpu->pdev->dev);
>                 gpu->funcs->recover(gpu);
> -               pm_runtime_put_sync(&gpu->pdev->dev);
>
>                 /*
>                  * Replay all remaining submits starting with highest priority
> --
> 2.7.4
>
