Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BE4EFDCE
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 03:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE410E0AB;
	Sat,  2 Apr 2022 01:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB9B10E0A7;
 Sat,  2 Apr 2022 01:38:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i4so6499973wrb.5;
 Fri, 01 Apr 2022 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1zFiXUZ0a7K6cB0KxapBQj7/YhjnOq9LBFx0MAcvaE=;
 b=idG3h4r3I5URuzxWCjhV68hIvHziafuradEvPdn9gp5xA+gRYvJsH9/uR0zob0X1vJ
 lbp6XhOglOJ/OFYOcC5zpy7F/0T6CrEq6DfQcdgfP8AAveIJrDaKu9TW6BL2D4WS+MzC
 9osouoEFKgSTk4LsJJ3/rdDTtLswZuxs8ZcdmY8wFP9SzpQiD29ckuPaOoGEfpQFKJh/
 u0l4RKrja4OIuYqJMwz0F5Xs4XpsaOU19H7a9mTduvnpGR64HT8xcB39h4jlCNH/o+dS
 gi3UljWrNaldf14h7vveljqVwVUz0BDvBkRl9ySlq+UlBYsaOpf8V5b/CqpIc/RJLFzC
 jZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1zFiXUZ0a7K6cB0KxapBQj7/YhjnOq9LBFx0MAcvaE=;
 b=T+j+irGUWiYyOs/C17e9rc2+JFPhOqHtw2GIKXKZJCpBuxTiMC9KgUTeb5npwVZHfF
 YA3X/trHi1tJCzSVUkA6HxDwHCqbzhTWos/gt/PFhVDgZ8AxW2IFA/4E0eP5qiSAx5Ur
 A4VHWIyR6D8SNcpVraCVS87pqT1+TLrX/m7D7zVLJCw2C9fFujCh07r7jPhQzCc6Bv5A
 FHudOeOU+zzf36QXkFR2JhHgEg6S57Tse6J5T6rQE9w6hJhVOdvOFQeG20Y4zqumINOg
 P7rgUwWit2Sqx9IorTKIOdkQmHxbZs/fNfpAlDukw1g+F3x5e8UnjeRdq/qewzlOiRn+
 M2TA==
X-Gm-Message-State: AOAM533Exv7plCoUW5M51tqN5/YnvwrAbUstNEWF0zEne+3j0GkUbhHQ
 9vjLhUq9/QONfovXxwLf8n3YIMSCfr3DAGsysKw=
X-Google-Smtp-Source: ABdhPJyQaRA34ArqlVfLrP8FbGvyMz4G1MzseBCijrNFuh0ZKadZ2xrAIS6aUPZOYJZniU6pjkU3W3BdgIejCpW90Fg=
X-Received: by 2002:adf:f20f:0:b0:203:fc73:a9a0 with SMTP id
 p15-20020adff20f000000b00203fc73a9a0mr9602992wro.418.1648863502740; Fri, 01
 Apr 2022 18:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220327202643.4053-1-jonathan@marek.ca>
 <20220327202643.4053-3-jonathan@marek.ca>
In-Reply-To: <20220327202643.4053-3-jonathan@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 Apr 2022 18:39:16 -0700
Message-ID: <CAF6AEGstW7W5_a_q_nDXaF+BZV7-DseME1n=mVph4xSMZuU1Mw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/adreno: use a single register offset for
 gpu_read64/gpu_write64
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 27, 2022 at 1:27 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> The high half of 64-bit registers is always at +1 offset, so change these
> helpers to be more convenient by removing the unnecessary argument.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

I'd been meaning to do this for a while.. so I think I'll cherry-pick
this ahead of the rest of the series

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++++++-------------
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 25 ++++++-------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +--
>  drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++-----
>  6 files changed, 27 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 0c6b2a6d0b4c9..da5e18bd74a45 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -606,8 +606,7 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
>
>  static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
> -       *value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO,
> -               REG_A4XX_RBBM_PERFCTR_CP_0_HI);
> +       *value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 407f50a15faa4..1916cb759cd5c 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -605,11 +605,9 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
>                 a5xx_ucode_check_version(a5xx_gpu, a5xx_gpu->pfp_bo);
>         }
>
> -       gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO,
> -               REG_A5XX_CP_ME_INSTR_BASE_HI, a5xx_gpu->pm4_iova);
> +       gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO, a5xx_gpu->pm4_iova);
>
> -       gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO,
> -               REG_A5XX_CP_PFP_INSTR_BASE_HI, a5xx_gpu->pfp_iova);
> +       gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO, a5xx_gpu->pfp_iova);
>
>         return 0;
>  }
> @@ -868,8 +866,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>          * memory rendering at this point in time and we don't want to block off
>          * part of the virtual memory space.
>          */
> -       gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
> -               REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
> +       gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
>         gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
>
>         /* Put the GPU into 64 bit by default */
> @@ -908,8 +905,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 return ret;
>
>         /* Set the ringbuffer address */
> -       gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
> -               gpu->rb[0]->iova);
> +       gpu_write64(gpu, REG_A5XX_CP_RB_BASE, gpu->rb[0]->iova);
>
>         /*
>          * If the microcode supports the WHERE_AM_I opcode then we can use that
> @@ -936,7 +932,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 }
>
>                 gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
> -                       REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
> +                       shadowptr(a5xx_gpu, gpu->rb[0]));
>         } else if (gpu->nr_rings > 1) {
>                 /* Disable preemption if WHERE_AM_I isn't available */
>                 a5xx_preempt_fini(gpu);
> @@ -1239,9 +1235,9 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>                 gpu_read(gpu, REG_A5XX_RBBM_STATUS),
>                 gpu_read(gpu, REG_A5XX_CP_RB_RPTR),
>                 gpu_read(gpu, REG_A5XX_CP_RB_WPTR),
> -               gpu_read64(gpu, REG_A5XX_CP_IB1_BASE, REG_A5XX_CP_IB1_BASE_HI),
> +               gpu_read64(gpu, REG_A5XX_CP_IB1_BASE),
>                 gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
> -               gpu_read64(gpu, REG_A5XX_CP_IB2_BASE, REG_A5XX_CP_IB2_BASE_HI),
> +               gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
>                 gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>
>         /* Turn off the hangcheck timer to keep it from bothering us */
> @@ -1427,8 +1423,7 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>
>  static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
> -       *value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
> -               REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
> +       *value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
>
>         return 0;
>  }
> @@ -1465,8 +1460,7 @@ static int a5xx_crashdumper_run(struct msm_gpu *gpu,
>         if (IS_ERR_OR_NULL(dumper->ptr))
>                 return -EINVAL;
>
> -       gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO,
> -               REG_A5XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
> +       gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
>
>         gpu_write(gpu, REG_A5XX_CP_CRASH_DUMP_CNTL, 1);
>
> @@ -1670,8 +1664,7 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
>         if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
>                 return 0;
>
> -       busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
> -                       REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
> +       busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO);
>
>         busy_time = busy_cycles - gpu->devfreq.busy_cycles;
>         do_div(busy_time, clk_get_rate(gpu->core_clk) / 1000000);
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 8abc9a2b114a2..7658e89844b46 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -137,7 +137,6 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
>
>         /* Set the address of the incoming preemption record */
>         gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_LO,
> -               REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_HI,
>                 a5xx_gpu->preempt_iova[ring->id]);
>
>         a5xx_gpu->next_ring = ring;
> @@ -211,8 +210,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
>         }
>
>         /* Write a 0 to signal that we aren't switching pagetables */
> -       gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO,
> -               REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_HI, 0);
> +       gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO, 0);
>
>         /* Reset the preemption state */
>         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 83c31b2ad865b..a624cb2df233b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -246,8 +246,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>         OUT_RING(ring, submit->seqno);
>
>         trace_msm_gpu_submit_flush(submit,
> -               gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -                       REG_A6XX_CP_ALWAYS_ON_COUNTER_HI));
> +               gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO));
>
>         a6xx_flush(gpu, ring);
>  }
> @@ -878,8 +877,7 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
>                 }
>         }
>
> -       gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE,
> -               REG_A6XX_CP_SQE_INSTR_BASE+1, a6xx_gpu->sqe_iova);
> +       gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>
>         return 0;
>  }
> @@ -926,8 +924,7 @@ static int hw_init(struct msm_gpu *gpu)
>          * memory rendering at this point in time and we don't want to block off
>          * part of the virtual memory space.
>          */
> -       gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
> -               REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
> +       gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
>         gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
>
>         /* Turn on 64 bit addressing for all blocks */
> @@ -976,11 +973,8 @@ static int hw_init(struct msm_gpu *gpu)
>
>         if (!adreno_is_a650_family(adreno_gpu)) {
>                 /* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
> -               gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
> -                       REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
> -
> +               gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>                 gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
> -                       REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
>                         0x00100000 + adreno_gpu->gmem - 1);
>         }
>
> @@ -1072,8 +1066,7 @@ static int hw_init(struct msm_gpu *gpu)
>                 goto out;
>
>         /* Set the ringbuffer address */
> -       gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
> -               gpu->rb[0]->iova);
> +       gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>
>         /* Targets that support extended APRIV can use the RPTR shadow from
>          * hardware but all the other ones need to disable the feature. Targets
> @@ -1105,7 +1098,6 @@ static int hw_init(struct msm_gpu *gpu)
>                 }
>
>                 gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
> -                       REG_A6XX_CP_RB_RPTR_ADDR_HI,
>                         shadowptr(a6xx_gpu, gpu->rb[0]));
>         }
>
> @@ -1394,9 +1386,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>                 gpu_read(gpu, REG_A6XX_RBBM_STATUS),
>                 gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
>                 gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
> -               gpu_read64(gpu, REG_A6XX_CP_IB1_BASE, REG_A6XX_CP_IB1_BASE_HI),
> +               gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>                 gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
> -               gpu_read64(gpu, REG_A6XX_CP_IB2_BASE, REG_A6XX_CP_IB2_BASE_HI),
> +               gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>                 gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>
>         /* Turn off the hangcheck timer to keep it from bothering us */
> @@ -1607,8 +1599,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>         /* Force the GPU power on so we can read this register */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>
> -       *value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -                           REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
> +       *value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
>
>         a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 55f443328d8e7..c61b233aff09b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -147,8 +147,7 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
>         /* Make sure all pending memory writes are posted */
>         wmb();
>
> -       gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO,
> -               REG_A6XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
> +       gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
>
>         gpu_write(gpu, REG_A6XX_CP_CRASH_DUMP_CNTL, 1);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 02419f2ca2bc5..f7fca687d45de 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -503,7 +503,7 @@ static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
>         msm_rmw(gpu->mmio + (reg << 2), mask, or);
>  }
>
> -static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
> +static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
>  {
>         u64 val;
>
> @@ -521,17 +521,17 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
>          * when the lo is read, so make sure to read the lo first to trigger
>          * that
>          */
> -       val = (u64) msm_readl(gpu->mmio + (lo << 2));
> -       val |= ((u64) msm_readl(gpu->mmio + (hi << 2)) << 32);
> +       val = (u64) msm_readl(gpu->mmio + (reg << 2));
> +       val |= ((u64) msm_readl(gpu->mmio + ((reg + 1) << 2)) << 32);
>
>         return val;
>  }
>
> -static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
> +static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
>  {
>         /* Why not a writeq here? Read the screed above */
> -       msm_writel(lower_32_bits(val), gpu->mmio + (lo << 2));
> -       msm_writel(upper_32_bits(val), gpu->mmio + (hi << 2));
> +       msm_writel(lower_32_bits(val), gpu->mmio + (reg << 2));
> +       msm_writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
>  }
>
>  int msm_gpu_pm_suspend(struct msm_gpu *gpu);
> --
> 2.26.1
>
