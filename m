Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA23F58F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 09:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DEE89C29;
	Tue, 24 Aug 2021 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D2E89C29;
 Tue, 24 Aug 2021 07:24:37 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id m39so10222885uad.9;
 Tue, 24 Aug 2021 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0juikW812VBEr2K9RD4WFSCpRfbIZvNgo4PBaFKAii0=;
 b=oRfvlKAUevtRxoFhasRf085BYoPjI/rP95sim4Rx8m0U2SSHS1ZlVMhMGsBnUY6GMO
 OvHX83tFSA3Y5sAwEeDlbzW0JAYJ0rtD8TrTe55FAu7ZQhKvctOuuJdPPke4gJKOCQ5W
 xmU/T4ttmsElx/jhTrtsRF5hprkxkZ+SdBEm0AawIVL1HDY9qALnDb5mICEB78YmmCIj
 5sti1aWDe4t2IoyFbiS12JYpo1dTn5CiduIoN7+j9vqOi4Q2WmX8taEsqZbgrjy0aI1e
 5wMK1y6o4PiFzQeTxhx5rXGarfJ+DENCNIOa3Jt2KXoCvWYtCfNSK9MQdXjNRGxS18Wy
 b+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0juikW812VBEr2K9RD4WFSCpRfbIZvNgo4PBaFKAii0=;
 b=EL2eZpOm4vI9iP9XgYL/u7uDmjOpGnGJdtp0DxNDXyIfTczBp1cy8IZgMOBUe35Nup
 rKklpC6RrS74SzVehdWwwFTD5ugEDcBusncVCwLIVvcQx+ianUPlW8CpwAhJjwcEYzOD
 ATwFfOk1W1tHK/j+4fmjzqBGrsSC60Kzb6ZubGQXX7Xjw2Lsdjlze1n9d6KqhWmpTNpo
 KEo/XssYFJaEmWvD6g/LR5evBgTpYdamXbmjMvT/mNIAAMeZsyI7GoVn6rGBQ0pv+lXb
 TW+Zg3ED4nVfZnO9tVTNLqRDyQIqXpH0aBBIkxQ/RHjEo0nJpQ+4Y9FLzp/QPWTfFyKi
 TEIg==
X-Gm-Message-State: AOAM533ASec1Ged7YZLLyqHzcmRbU+TfGAR4C62qAc4bikgONu4z+pHp
 /h+ZEX+jM3kRdNw+mHgxsMu5NhYEjp8kTiCeZHthS465R5Q=
X-Google-Smtp-Source: ABdhPJyQJ8rJ8eeCEFj1pkbWha43l6peFnbnpf0guZVDso6SKUZQW01cY6uHftnI4QkmbsOobAL32FjcqsUYCZn8ne0=
X-Received: by 2002:ab0:3314:: with SMTP id r20mr24696128uao.89.1629789876092; 
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
 <20210820201830.2005563-7-l.stach@pengutronix.de>
In-Reply-To: <20210820201830.2005563-7-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 24 Aug 2021 09:24:25 +0200
Message-ID: <CAH9NwWc=nyt4nJpTc8AfRaM4LnWy86LNWadhza5LyFyv4SiQPw@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/etnaviv: reference MMU context when setting up
 hardware state
To: Lucas Stach <l.stach@pengutronix.de>
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
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

Am Fr., 20. Aug. 2021 um 22:18 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Move the refcount manipulation of the MMU context to the point where the
> hardware state is programmed. At that point it is also known if a previous
> MMU state is still there, or the state needs to be reprogrammed with a
> potentially different context.
>
> Cc: stable@vger.kernel.org # 5.4
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c      | 24 +++++++++++-----------
>  drivers/gpu/drm/etnaviv/etnaviv_iommu.c    |  4 ++++
>  drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c |  8 ++++++++
>  3 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index f420c4f14657..1fa98ce870f7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -641,17 +641,19 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
>         gpu->fe_running = true;
>  }
>
> -static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu)
> +static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
> +                                         struct etnaviv_iommu_context *context)
>  {
> -       u32 address = etnaviv_cmdbuf_get_va(&gpu->buffer,
> -                               &gpu->mmu_context->cmdbuf_mapping);
>         u16 prefetch;
> +       u32 address;
>
>         /* setup the MMU */
> -       etnaviv_iommu_restore(gpu, gpu->mmu_context);
> +       etnaviv_iommu_restore(gpu, context);
>
>         /* Start command processor */
>         prefetch = etnaviv_buffer_init(gpu);
> +       address = etnaviv_cmdbuf_get_va(&gpu->buffer,
> +                                       &gpu->mmu_context->cmdbuf_mapping);
>
>         etnaviv_gpu_start_fe(gpu, address, prefetch);
>  }
> @@ -1369,14 +1371,12 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
>                 goto out_unlock;
>         }
>
> -       if (!gpu->fe_running) {
> -               gpu->mmu_context = etnaviv_iommu_context_get(submit->mmu_context);
> -               etnaviv_gpu_start_fe_idleloop(gpu);
> -       } else {
> -               if (submit->prev_mmu_context)
> -                       etnaviv_iommu_context_put(submit->prev_mmu_context);
> -               submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
> -       }
> +       if (!gpu->fe_running)
> +               etnaviv_gpu_start_fe_idleloop(gpu, submit->mmu_context);
> +
> +       if (submit->prev_mmu_context)
> +               etnaviv_iommu_context_put(submit->prev_mmu_context);
> +       submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
>
>         if (submit->nr_pmrs) {
>                 gpu->event[event[1]].sync_point = &sync_point_perfmon_sample_pre;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> index 1a7c89a67bea..afe5dd6a9925 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> @@ -92,6 +92,10 @@ static void etnaviv_iommuv1_restore(struct etnaviv_gpu *gpu,
>         struct etnaviv_iommuv1_context *v1_context = to_v1_context(context);
>         u32 pgtable;
>
> +       if (gpu->mmu_context)
> +               etnaviv_iommu_context_put(gpu->mmu_context);
> +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> +
>         /* set base addresses */
>         gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_RA, context->global->memory_base);
>         gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_FE, context->global->memory_base);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> index f8bf488e9d71..d664ae29ae20 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> @@ -172,6 +172,10 @@ static void etnaviv_iommuv2_restore_nonsec(struct etnaviv_gpu *gpu,
>         if (gpu_read(gpu, VIVS_MMUv2_CONTROL) & VIVS_MMUv2_CONTROL_ENABLE)
>                 return;
>
> +       if (gpu->mmu_context)
> +               etnaviv_iommu_context_put(gpu->mmu_context);
> +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> +
>         prefetch = etnaviv_buffer_config_mmuv2(gpu,
>                                 (u32)v2_context->mtlb_dma,
>                                 (u32)context->global->bad_page_dma);
> @@ -192,6 +196,10 @@ static void etnaviv_iommuv2_restore_sec(struct etnaviv_gpu *gpu,
>         if (gpu_read(gpu, VIVS_MMUv2_SEC_CONTROL) & VIVS_MMUv2_SEC_CONTROL_ENABLE)
>                 return;
>
> +       if (gpu->mmu_context)
> +               etnaviv_iommu_context_put(gpu->mmu_context);
> +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> +

I have seen this pattern now more than two times - maybe put the
assignment of a new mmu context into its own function?

>         gpu_write(gpu, VIVS_MMUv2_PTA_ADDRESS_LOW,
>                   lower_32_bits(context->global->v2.pta_dma));
>         gpu_write(gpu, VIVS_MMUv2_PTA_ADDRESS_HIGH,
> --
> 2.30.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
