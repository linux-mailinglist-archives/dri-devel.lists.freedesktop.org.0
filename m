Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE21545154
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 17:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206A12AD7C;
	Thu,  9 Jun 2022 15:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C812AD1F;
 Thu,  9 Jun 2022 15:55:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q15so24959890wrc.11;
 Thu, 09 Jun 2022 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HPTTw8mZS9qCqg/rFDlQPOOF9JZNn3O4I/G+LvFjh/Q=;
 b=QialQ71u5h76TuIsgfz8dTTuieX6GOZtpi/pEA88S5lSgzjPfNUnULivDt8ZjtB3dI
 w2nmUBrdFpsLA2f3HvxbN52Nulpu6anBFcWKoG7glkUpkkeW5Gm5DihmZq37IDWN1yCj
 F3zU+QPMH/8KPVo260ok04Z93xCfb66fWJY9TaZYzWMwJVzzxPratCF17+qvWV8ekncM
 acKNX+/0I+HxZCHM74fnO++RZjW+xKOs6cTGj6Jm2XWIWeQbNvMHmcBqV5qJZEtuLbcU
 j0HdGGdKJX7ehQLoWf6uTbbJS5VDltOz+WogObcsh20ovV76ST6GPBU978P23cPPWzQN
 KDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPTTw8mZS9qCqg/rFDlQPOOF9JZNn3O4I/G+LvFjh/Q=;
 b=YM2+mVWEHtSTDe4CJkiPNLLISlrqT363DubndrZsofv/RKszBtLJ7NFiJZhpaYmHfq
 UU9QhHqdDPREcpCWCwKY1cwn+MivADkK319FTmZbFHeuhGkrFnHhyAwsa255e1IqaMoP
 V5lA3GSQ08FGDfdwJR1nkAx5JOMPod7XoMaj/ToeblhMxYttlC4SDccN9NWUoTyV2RiH
 XSxQ0gLbup3eSgO61SCXAtCIPbpPeRma+8r8LuRAv3OteHd89hOe4jJ2bAu5s/NThR48
 AeIBHcHALYbulgd9rVjz4r/mu1amK15i03DD0g68L7Q4fJlGUOBpYxE0Qxdyb5CI0gc8
 4sTg==
X-Gm-Message-State: AOAM533cxYw3cb+N6N3NZQswVMDsqC9stlqS5fow5j81e01vaXC2YJjU
 7yv9ZTNravDysf+QKHOfvF8tFFDQd4smYpSmddU=
X-Google-Smtp-Source: ABdhPJy1Qwk8DTTOTC4BRQxtoXpppd8s00/nGGaO6B2/Pm9OwblAacmmt5Zq7YgvOZToG8V6Ig8bQnivX+/mNfU1Fas=
X-Received: by 2002:a5d:47c3:0:b0:219:b391:b748 with SMTP id
 o3-20020a5d47c3000000b00219b391b748mr4753347wrc.221.1654790099704; Thu, 09
 Jun 2022 08:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
In-Reply-To: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Jun 2022 08:54:47 -0700
Message-ID: <CAF6AEGvAJqWK7peyTBDjQH_XCT3=XfqKrxsdkYD4s=DxbR4r7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Grab the GPU runtime in a6xx routines, not the
 GMU one
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Eric Anholt <eric@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 9, 2022 at 7:34 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> From testing on sc7180-trogdor devices, reading the GMU registers
> needs the GMU clocks to be enabled. Those clocks get turned on in
> a6xx_gmu_resume(). Confusingly enough, that function is called as a
> result of the runtime_pm of the GPU "struct device", not the GMU
> "struct device".
>
> Let's grab a reference to the correct device. Incidentally, this makes
> us match the a5xx routine more closely.
>
> This is easily shown to fix crashes that happen if we change the GPU's
> pm_runtime usage to not use autosuspend. It's also believed to fix
> some long tail GPU crashes even with autosuspend.
>
> NOTE: the crashes I've seen were fixed by _only_ fixing
> a6xx_gpu_busy(). However, I believe that the same arguments should be
> made to a6xx_gmu_set_freq() so I've changed that function too.
>
> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..b79ad2e0649c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -129,13 +129,13 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>          * This can get called from devfreq while the hardware is idle. Don't
>          * bring up the power if it isn't already active
>          */
> -       if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)

IMHO, if we do end up using the GPU's runpm instead of the GMU's, we
should probably just move this _get_if_in_use() into msm_gpu_devfreq,
etc.  (And probably also this should be "<= 0".. I have that change
locally but haven't sent a patch yet

BR,
-R

>                 return;
>
>         if (!gmu->legacy) {
>                 a6xx_hfi_set_freq(gmu, perf_index);
>                 dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -               pm_runtime_put(gmu->dev);
> +               pm_runtime_put(&gpu->pdev->dev);
>                 return;
>         }
>
> @@ -159,7 +159,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
>         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -       pm_runtime_put(gmu->dev);
> +       pm_runtime_put(&gpu->pdev->dev);
>  }
>
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 841e47a0b06b..87568d0b6ef8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>         *out_sample_rate = 19200000;
>
>         /* Only read the gpu busy if the hardware is already active */
> -       if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
>                 return 0;
>
>         busy_cycles = gmu_read64(&a6xx_gpu->gmu,
> @@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>                         REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>
>
> -       pm_runtime_put(a6xx_gpu->gmu.dev);
> +       pm_runtime_put(&gpu->pdev->dev);
>
>         return busy_cycles;
>  }
> --
> 2.36.1.255.ge46751e96f-goog
>
