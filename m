Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F81539D0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB716F955;
	Wed,  5 Feb 2020 21:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC76E9F8;
 Wed,  5 Feb 2020 21:00:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so3570024eds.8;
 Wed, 05 Feb 2020 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QafzbCfeHnYtXe2+wnlYbUjzoLaATFtLI4O/t7cFl+Q=;
 b=LLzqOyPgxOYxX2fFIZXbsrOnO82CGToxLSKJphbGKsqy7jnlCooFy6MJczAqo/EXur
 55P20+vFkQoPMccuFsAxmtoa2yhFIvMbrfqgkCRJR1owQXd2gVUildcoaos3GRwLUaGL
 L57KXeAoHd1C4uKFyP0AxqtTwbzRgAGKUR9qi9Gm4O+Dj076hTIb6Q//1PBXzr01kWr3
 WG1M53aL46oCcDHx/S22c+JjxJCq6E9afR+6PjaqC3KEzXpSV8lCSjvZeJU1euvWLHIK
 CZ/9psDHd+gGs7F6fW/jLre0cKE8h3rl4yd3GW6XVPvhtNFDO4uRqi2WUgzHhhya0o7S
 GlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QafzbCfeHnYtXe2+wnlYbUjzoLaATFtLI4O/t7cFl+Q=;
 b=c8IF1qCocfXtxZ4SkWRWNLmY8pzZPAkK6ziGv4ZXgiGsBaqXfbL23qwJSTYwmN8nuT
 H492smTVnq9d/aN9IfuP53TAxhq30sVIKYVrObpW2+9ha13ckA+Ms0aZTlcmvUeHWsJG
 mqVZtiIPNtLd8LIUiG/n2zV5Z2LlG34g5k3w+JmuOIJt+l5/n5sujlJ6TrlIyU48YBJ1
 EXRW+TOlHpYjUUc1SekssNRoeMzVWdvo8BRDEjt5H42Mb6wCDPLKhQDRI+r6+dpka66t
 1qFLJz5lFyg1PxzUgkkecQNFNOuzeBr5EN2Xka62BZ5vSdhlQds1AJqR28F7V2/owg50
 WiRA==
X-Gm-Message-State: APjAAAWNXcIOQweA5Epx5a8MSaDfCSyEu6lV6gQm85H3rBseuOp4IfW0
 RY890Iv/JhvKIkingIs5B+WqGMiRQjNXS7OoTik=
X-Google-Smtp-Source: APXvYqzJzAjae+HUS9sVrAOjE8CO08MVfB1MqrAfFev2UPGSewtP0Vpp1kdw0wYbnvLZ9/+mFWRyadg3lVl4W+pI7kc=
X-Received: by 2002:a17:906:af99:: with SMTP id
 mj25mr31219735ejb.293.1580936401142; 
 Wed, 05 Feb 2020 13:00:01 -0800 (PST)
MIME-Version: 1.0
References: <1580935697-28195-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580935697-28195-1-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Feb 2020 12:59:49 -0800
Message-ID: <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix a6xx GMU shutdown sequence
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 5, 2020 at 12:48 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> updating the VBIF flush in a6xx_gmu_shutdown and instead
> inserted the new sequence into a6xx_pm_suspend along with a redundant
> GMU idle.
>
> Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> the appropriate place in the shutdown routine and remove the redundant
> idle call.
>
> v2: Remove newly unused variable that was triggering a warning
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 -----------------------------------
>  2 files changed, 31 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 983afea..748cd37 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -796,12 +796,41 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu)
>         return true;
>  }
>
> +#define GBIF_CLIENT_HALT_MASK             BIT(0)
> +#define GBIF_ARB_HALT_MASK                BIT(1)
> +
> +static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
> +{
> +       struct msm_gpu *gpu = &adreno_gpu->base;
> +
> +       if (!a6xx_has_gbif(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> +               spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
> +                                                               0xf) == 0xf);
> +               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +
> +               return;
> +       }
> +
> +       /* Halt new client requests on GBIF */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> +       spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +                       (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> +
> +       /* Halt all AXI requests on GBIF */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> +       spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> +                       (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> +
> +       /* The GBIF halt needs to be explicitly cleared */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> +}
> +
>  /* Gracefully try to shut down the GMU and by extension the GPU */
>  static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  {
>         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> -       struct msm_gpu *gpu = &adreno_gpu->base;
>         u32 val;
>
>         /*
> @@ -819,11 +848,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>                         return;
>                 }
>
> -               /* Clear the VBIF pipe before shutting down */
> -               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -               spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) & 0xf)
> -                       == 0xf);
> -               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +               a6xx_bus_clear_pending_transactions(adreno_gpu);
>
>                 /* tell the GMU we want to slumber */
>                 a6xx_gmu_notify_slumber(gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..b580e47 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -748,39 +748,6 @@ static const u32 a6xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
>         REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A6XX_CP_RB_CNTL),
>  };
>
> -#define GBIF_CLIENT_HALT_MASK             BIT(0)
> -#define GBIF_ARB_HALT_MASK                BIT(1)
> -
> -static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
> -{
> -       struct msm_gpu *gpu = &adreno_gpu->base;
> -
> -       if(!a6xx_has_gbif(adreno_gpu)){
> -               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -               spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
> -                                                               0xf) == 0xf);
> -               gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> -
> -               return;
> -       }
> -
> -       /* Halt new client requests on GBIF */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> -       spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> -                       (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> -
> -       /* Halt all AXI requests on GBIF */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> -       spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> -                       (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> -
> -       /*
> -        * GMU needs DDR access in slumber path. Deassert GBIF halt now
> -        * to allow for GMU to access system memory.
> -        */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -}
> -
>  static int a6xx_pm_resume(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -805,16 +772,6 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>
>         devfreq_suspend_device(gpu->devfreq.devfreq);
>
> -       /*
> -        * Make sure the GMU is idle before continuing (because some transitions
> -        * may use VBIF
> -        */
> -       a6xx_gmu_wait_for_idle(&a6xx_gpu->gmu);
> -
> -       /* Clear the VBIF pipe before shutting down */
> -       /* FIXME: This accesses the GPU - do we need to make sure it is on? */
> -       a6xx_bus_clear_pending_transactions(adreno_gpu);
> -
>         return a6xx_gmu_stop(a6xx_gpu);
>  }
>
> --
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
