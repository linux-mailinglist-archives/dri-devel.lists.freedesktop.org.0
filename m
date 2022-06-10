Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC4546904
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 17:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1917C10FF28;
	Fri, 10 Jun 2022 15:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CA010FFDB;
 Fri, 10 Jun 2022 15:06:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1200819wmr.5; 
 Fri, 10 Jun 2022 08:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bi4K7x/v9c7h2U0344y+aXpiaAr2Kxmyzj1YY0pkjmg=;
 b=B+Ks1u07Co56HPLtvw33sVYlSWqTqbHLWSdb2YneHJaALzn3ewFBRuqLPPL0EQyqY0
 XJsEKwHhcLQN+wj+FbSYpIRP4gTSqqefV8gfTa35IP+XUAxd5++lPo21n+YGkBv7GF/I
 7XexB4SmapOhaWsDCkPGmnnLB7u2/QLLL7C5wnvrVsS02+K/fPFdfhOP6AuSNa2YcCmC
 xq67mSZTxLKKBAS0jnEm7Inmk8jOrm2ngouJJrnJcSdHr4RzwKSc0i62XljGm4bxBT5p
 cZVk3VdzyIqnjlW4hwE4RCRTbS1WXB4JqLCrolGrODwZAwUXraSVUOoy6HNEdwrZMOeO
 0hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bi4K7x/v9c7h2U0344y+aXpiaAr2Kxmyzj1YY0pkjmg=;
 b=HD8GB3kGxDBzY86cKM360RLovTYkrpq9NivRuBKXyidRjTrh2ToBd/M0DjXhZGskW5
 Wzn/COCfK1OASF8480wYYmCYEe8o8SfEPinM+4YoJMB319cHLfArHvUxKk2FJIO08Bvz
 CXDlZtU1vr/Bi9PESbe0TpTNUVkE+wRPLCOYWEltMuCYNWE/oW5jknO3vB1WDSTBpDT0
 uO9qX/c45rdeO/tTIs6OSFwxiljVX7Y0JLnVjzs0xeRrrRH6SKgKYWjU8o4GVN8ooRkY
 CX7lOF9o08OL8r4yjvVfwcAraeymXJ9CWF9sae+wA6y1ckH5fC8lRhMSz9rql9rGP8rg
 KYnQ==
X-Gm-Message-State: AOAM531YSHcWKpTsW1L+J8fdexUMpnrSllvMagUJws+DsDJhXdwMlI1k
 KOt7dfoqXFD1vFgBOUshiytwibcCKsUzpQxuNb0=
X-Google-Smtp-Source: ABdhPJwmPMsWfgK8jA+UTDoUSKOclITUPEo+dcxRxpTtvWiwAc1d8ilTLAr4XyPb5p73ABZNpqfFRYMGhOqGPgWC4Ck=
X-Received: by 2002:a05:600c:4f87:b0:39c:8091:31e0 with SMTP id
 n7-20020a05600c4f8700b0039c809131e0mr221931wmq.84.1654873599489; Fri, 10 Jun
 2022 08:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220609170859.v3.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
In-Reply-To: <20220609170859.v3.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Jun 2022 08:06:26 -0700
Message-ID: <CAF6AEGvRWKy-5DW1Dnp417YmCc1UVPBNZm21U_wPM7R0U2B9cw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: Avoid unclocked GMU register access in 6xx
 gpu_busy
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Eric Anholt <eric@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 9, 2022 at 5:10 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> From testing on sc7180-trogdor devices, reading the GMU registers
> needs the GMU clocks to be enabled. Those clocks get turned on in
> a6xx_gmu_resume(). Confusingly enough, that function is called as a
> result of the runtime_pm of the GPU "struct device", not the GMU
> "struct device". Unfortunately the current a6xx_gpu_busy() grabs a
> reference to the GMU's "struct device".
>
> The fact that we were grabbing the wrong reference was easily seen to
> cause crashes that happen if we change the GPU's pm_runtime usage to
> not use autosuspend. It's also believed to cause some long tail GPU
> crashes even with autosuspend.
>
> We could look at changing it so that we do pm_runtime_get_if_in_use()
> on the GPU's "struct device", but then we run into a different
> problem. pm_runtime_get_if_in_use() will return 0 for the GPU's
> "struct device" the whole time when we're in the "autosuspend
> delay". That is, when we drop the last reference to the GPU but we're
> waiting a period before actually suspending then we'll think the GPU
> is off. One reason that's bad is that if the GPU didn't actually turn
> off then the cycle counter doesn't lose state and that throws off all
> of our calculations.
>
> Let's change the code to keep track of the suspend state of
> devfreq. msm_devfreq_suspend() is always called before we actually
> suspend the GPU and msm_devfreq_resume() after we resume it. This
> means we can use the suspended state to know if we're powered or not.
>
> NOTE: one might wonder when exactly our status function is called when
> devfreq is supposed to be disabled. The stack crawl I captured was:
>   msm_devfreq_get_dev_status
>   devfreq_simple_ondemand_func
>   devfreq_update_target
>   qos_notifier_call
>   qos_max_notifier_call
>   blocking_notifier_call_chain
>   pm_qos_update_target
>   freq_qos_apply
>   apply_constraint
>   __dev_pm_qos_update_request
>   dev_pm_qos_update_request
>   msm_devfreq_idle_work
>
> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Totally rewrote to not use the pm_runtime functions.
> - Moved the code to be common for all adreno GPUs.
>
> Changes in v2:
> - Move the set_freq runtime pm grab to the GPU file.
> - Use <= for the pm_runtime test, not ==.
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  8 ------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 13 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
>  drivers/gpu/drm/msm/msm_gpu.h         |  9 ++++++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 39 +++++++++++++++++++++------
>  6 files changed, 51 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index c424e9a37669..3dcec7acb384 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1666,18 +1666,10 @@ static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>  {
>         u64 busy_cycles;
>
> -       /* Only read the gpu busy if the hardware is already active */
> -       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0) {
> -               *out_sample_rate = 1;
> -               return 0;
> -       }
> -
>         busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
>                         REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
>         *out_sample_rate = clk_get_rate(gpu->core_clk);
>
> -       pm_runtime_put(&gpu->pdev->dev);
> -
>         return busy_cycles;
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..dc715d88ff21 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -102,7 +102,8 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
>                 A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
>  }
>
> -void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> +                      bool suspended)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -127,15 +128,16 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>
>         /*
>          * This can get called from devfreq while the hardware is idle. Don't
> -        * bring up the power if it isn't already active
> +        * bring up the power if it isn't already active. All we're doing here
> +        * is updating the frequency so that when we come back online we're at
> +        * the right rate.
>          */
> -       if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> +       if (suspended)
>                 return;
>
>         if (!gmu->legacy) {
>                 a6xx_hfi_set_freq(gmu, perf_index);
>                 dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -               pm_runtime_put(gmu->dev);
>                 return;
>         }
>
> @@ -159,7 +161,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
>         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -       pm_runtime_put(gmu->dev);
>  }
>
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> @@ -895,7 +896,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>                 return;
>
>         gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
> -       a6xx_gmu_set_freq(gpu, gpu_opp);
> +       a6xx_gmu_set_freq(gpu, gpu_opp, false);
>         dev_pm_opp_put(gpu_opp);
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 42ed9a3c4905..8c02a67f29f2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1658,27 +1658,21 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>         /* 19.2MHz */
>         *out_sample_rate = 19200000;
>
> -       /* Only read the gpu busy if the hardware is already active */
> -       if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
> -               return 0;
> -
>         busy_cycles = gmu_read64(&a6xx_gpu->gmu,
>                         REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
>                         REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>
> -
> -       pm_runtime_put(a6xx_gpu->gmu.dev);
> -
>         return busy_cycles;
>  }
>
> -static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> +static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> +                             bool suspended)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>
>         mutex_lock(&a6xx_gpu->gmu.lock);
> -       a6xx_gmu_set_freq(gpu, opp);
> +       a6xx_gmu_set_freq(gpu, opp, suspended);
>         mutex_unlock(&a6xx_gpu->gmu.lock);
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 86e0a7c3fe6d..ab853f61db63 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -77,7 +77,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>
> -void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp);
> +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> +                      bool suspended);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6def00883046..7ced1a30d4e8 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -68,7 +68,8 @@ struct msm_gpu_funcs {
>         struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
>         int (*gpu_state_put)(struct msm_gpu_state *state);
>         unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
> -       void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
> +       void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> +                            bool suspended);

nit, I suppose we should add a comment that gpu_set_freq()/gpu_busy()
should *not* call runpm get/put as they are called with lock held

Otherwise looks good to me.. kinda sad that we have to track the
suspended state behind runpm's back, but I don't really see any better
way.

Reviewed-by: Rob Clark <robdclark@gmail.com>

>         struct msm_gem_address_space *(*create_address_space)
>                 (struct msm_gpu *gpu, struct platform_device *pdev);
>         struct msm_gem_address_space *(*create_private_address_space)
> @@ -92,6 +93,9 @@ struct msm_gpu_devfreq {
>         /** devfreq: devfreq instance */
>         struct devfreq *devfreq;
>
> +       /** lock: lock for "suspended", "busy_cycles", and "time" */
> +       struct mutex lock;
> +
>         /**
>          * idle_constraint:
>          *
> @@ -135,6 +139,9 @@ struct msm_gpu_devfreq {
>          * elapsed
>          */
>         struct msm_hrtimer_work boost_work;
> +
> +       /** suspended: tracks if we're suspended */
> +       bool suspended;
>  };
>
>  struct msm_gpu {
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d2539ca78c29..ea94bc18e72e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,6 +20,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>                 u32 flags)
>  {
>         struct msm_gpu *gpu = dev_to_gpu(dev);
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
>         struct dev_pm_opp *opp;
>
>         /*
> @@ -32,10 +33,13 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>
>         trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
>
> -       if (gpu->funcs->gpu_set_freq)
> -               gpu->funcs->gpu_set_freq(gpu, opp);
> -       else
> +       if (gpu->funcs->gpu_set_freq) {
> +               mutex_lock(&df->lock);
> +               gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
> +               mutex_unlock(&df->lock);
> +       } else {
>                 clk_set_rate(gpu->core_clk, *freq);
> +       }
>
>         dev_pm_opp_put(opp);
>
> @@ -58,15 +62,24 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
>         unsigned long sample_rate;
>         ktime_t time;
>
> +       mutex_lock(&df->lock);
> +
>         status->current_frequency = get_freq(gpu);
> -       busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
>         time = ktime_get();
> -
> -       busy_time = busy_cycles - df->busy_cycles;
>         status->total_time = ktime_us_delta(time, df->time);
> +       df->time = time;
>
> +       if (df->suspended) {
> +               mutex_unlock(&df->lock);
> +               status->busy_time = 0;
> +               return;
> +       }
> +
> +       busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
> +       busy_time = busy_cycles - df->busy_cycles;
>         df->busy_cycles = busy_cycles;
> -       df->time = time;
> +
> +       mutex_unlock(&df->lock);
>
>         busy_time *= USEC_PER_SEC;
>         do_div(busy_time, sample_rate);
> @@ -175,6 +188,8 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>         if (!gpu->funcs->gpu_busy)
>                 return;
>
> +       mutex_init(&df->lock);
> +
>         dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
>                                DEV_PM_QOS_MAX_FREQUENCY,
>                                PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
> @@ -244,12 +259,16 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
>  void msm_devfreq_resume(struct msm_gpu *gpu)
>  {
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       unsigned long sample_rate;
>
>         if (!has_devfreq(gpu))
>                 return;
>
> -       df->busy_cycles = 0;
> +       mutex_lock(&df->lock);
> +       df->busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
>         df->time = ktime_get();
> +       df->suspended = false;
> +       mutex_unlock(&df->lock);
>
>         devfreq_resume_device(df->devfreq);
>  }
> @@ -261,6 +280,10 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
>         if (!has_devfreq(gpu))
>                 return;
>
> +       mutex_lock(&df->lock);
> +       df->suspended = true;
> +       mutex_unlock(&df->lock);
> +
>         devfreq_suspend_device(df->devfreq);
>
>         cancel_idle_work(df);
> --
> 2.36.1.476.g0c4daa206d-goog
>
