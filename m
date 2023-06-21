Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C167737C0B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129CC10E096;
	Wed, 21 Jun 2023 07:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82CF10E096;
 Wed, 21 Jun 2023 07:33:20 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-560a2e87bc7so752013eaf.0; 
 Wed, 21 Jun 2023 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687332799; x=1689924799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yZmJRmvGs63Sbc4+pRuQIRBBoeSOpejn00UglUbiNLI=;
 b=MBs56Sp4fDTWQzFFAKCaTnFs5nYgvfymwUYjbQ5T9XLO2emeLb+BQWt4mRwHEsB1G1
 MySXrqZg/xrlXvok4VJC89xNacmlTHMm5wiqOe6biJhA+fKX6bvopD4g0QGmuYKEYFkX
 JuKzenalIgU4kcEjyQ/gVyjaYe03I0cGCl5iEkXYjZFIakPg1CBePJVoDISsqUlUkX1r
 aoEfSu6Fgwe8b1TW5EPe4VXbL9Zjkyt2kflthPkl2ftPrmDziqkCVMiP7GZRnM5d/z+c
 /5F8Cmulw9i+n59x2gx4nbbigDHD4AbgjstRhQuDeWKimgmsehfgZw3Qhm0k+DA5Expw
 0H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332799; x=1689924799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yZmJRmvGs63Sbc4+pRuQIRBBoeSOpejn00UglUbiNLI=;
 b=JyjG1e/37o0TW+CAPv05bhjgUtd+smZj0v7k7OOxdxxEDhq6RuEF0c/jeNjmcRZ88H
 c9sjdLa0RyRCFQi9ybODm2GO583rYSnQ4RvHj1w74mHo14lNDgOnU40rSmZfJWPC3JEU
 xG0JpOFZjRt9VCz/X0LHGKkPKpuc/okn7SQc1wFRWfCRNV8aVnB3o10o7Fi5hL1wJab4
 GKZuEC4GctH2wAdN0KVIi9e1Zeitk/ved1Ie267d6bEZ353S8ui+flQKSshccvF/Zwzj
 LlVLxz9BzoZAVaBFgzrMVlh6trPT9A+Jx/H05Ej0S41BPXJ678FqDI62TOhQIPZJnDaD
 ovhg==
X-Gm-Message-State: AC+VfDyhJG7cpC6m+AqT6UqXRIqyZVZwnQhfORrq2kPxKu3r31TFdB8D
 qOS/aQqS9m99gf2cXqvgodHIU6W65nBMF0Whp37wfhbmq4HQ5Q==
X-Google-Smtp-Source: ACHHUZ4b6J0VwyWQJWIFL7nuSoy6hildslYaEbuW5h4yF7RMqNQlS/9xY6sWvfDRGwfPBCeiz+RVmZqQB6jvZfX5Q/o=
X-Received: by 2002:a4a:e64f:0:b0:55e:3fe1:9e72 with SMTP id
 q15-20020a4ae64f000000b0055e3fe19e72mr5958836oot.9.1687332798749; Wed, 21 Jun
 2023 00:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-6-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-6-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 21 Jun 2023 09:33:07 +0200
Message-ID: <CAH9NwWd3rOS57+f8Dx7r-kPXY58HcG3pH4LzibTvo2GvGmx5Gg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/etnaviv: better track GPU state
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Instead of only tracking if the FE is running, use a enum to better
> describe the various states the GPU can be in. This allows some
> additional validation to make sure that functions that expect a
> certain GPU state are only called when the GPU is actually in that
> state.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 25 ++++++++++++++++++-------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 10 +++++++++-
>  2 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index fb07d0e73802..96cbb290b869 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -576,7 +576,7 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>         /* We rely on the GPU running, so program the clock */
>         etnaviv_gpu_update_clock(gpu);
>
> -       gpu->fe_running = false;
> +       gpu->state = ETNA_GPU_STATE_RESET;
>         gpu->exec_state = -1;
>         if (gpu->mmu_context)
>                 etnaviv_iommu_context_put(gpu->mmu_context);
> @@ -651,8 +651,6 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
>                           VIVS_MMUv2_SEC_COMMAND_CONTROL_ENABLE |
>                           VIVS_MMUv2_SEC_COMMAND_CONTROL_PREFETCH(prefetch));
>         }
> -
> -       gpu->fe_running = true;
>  }
>
>  static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
> @@ -661,6 +659,8 @@ static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
>         u16 prefetch;
>         u32 address;
>
> +       WARN_ON(gpu->state != ETNA_GPU_STATE_INITIALIZED);
> +
>         /* setup the MMU */
>         etnaviv_iommu_restore(gpu, context);
>
> @@ -670,6 +670,8 @@ static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
>                                         &gpu->mmu_context->cmdbuf_mapping);
>
>         etnaviv_gpu_start_fe(gpu, address, prefetch);
> +
> +       gpu->state = ETNA_GPU_STATE_RUNNING;
>  }
>
>  static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
> @@ -705,6 +707,9 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
>
>  static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>  {
> +       WARN_ON(!(gpu->state == ETNA_GPU_STATE_IDENTIFIED ||
> +                 gpu->state == ETNA_GPU_STATE_RESET));
> +
>         if ((etnaviv_is_model_rev(gpu, GC320, 0x5007) ||
>              etnaviv_is_model_rev(gpu, GC320, 0x5220)) &&
>             gpu_read(gpu, VIVS_HI_CHIP_TIME) != 0x2062400) {
> @@ -751,6 +756,8 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>         etnaviv_gpu_setup_pulse_eater(gpu);
>
>         gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
> +
> +       gpu->state = ETNA_GPU_STATE_INITIALIZED;
>  }
>
>  int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> @@ -793,6 +800,8 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>             (gpu->identity.minor_features10 & chipMinorFeatures10_SECURITY_AHB))
>                 gpu->sec_mode = ETNA_SEC_KERNEL;
>
> +       gpu->state = ETNA_GPU_STATE_IDENTIFIED;
> +
>         ret = etnaviv_hw_reset(gpu);
>         if (ret) {
>                 dev_err(gpu->dev, "GPU reset failed\n");
> @@ -1368,7 +1377,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
>                 goto out_unlock;
>         }
>
> -       if (!gpu->fe_running)
> +       if (gpu->state == ETNA_GPU_STATE_INITIALIZED)
>                 etnaviv_gpu_start_fe_idleloop(gpu, submit->mmu_context);
>
>         if (submit->prev_mmu_context)
> @@ -1634,7 +1643,7 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
>
>  static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
>  {
> -       if (gpu->initialized && gpu->fe_running) {
> +       if (gpu->state == ETNA_GPU_STATE_RUNNING) {
>                 /* Replace the last WAIT with END */
>                 mutex_lock(&gpu->lock);
>                 etnaviv_buffer_end(gpu);
> @@ -1647,7 +1656,7 @@ static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
>                  */
>                 etnaviv_gpu_wait_idle(gpu, 100);
>
> -               gpu->fe_running = false;
> +               gpu->state = ETNA_GPU_STATE_INITIALIZED;
>         }
>
>         gpu->exec_state = -1;
> @@ -1918,6 +1927,8 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
>
>         etnaviv_gpu_hw_suspend(gpu);
>
> +       gpu->state = ETNA_GPU_STATE_IDENTIFIED;
> +
>         return etnaviv_gpu_clk_disable(gpu);
>  }
>
> @@ -1931,7 +1942,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
>                 return ret;
>
>         /* Re-initialise the basic hardware state */
> -       if (gpu->initialized) {
> +       if (gpu->state == ETNA_GPU_STATE_IDENTIFIED) {
>                 ret = etnaviv_gpu_hw_resume(gpu);
>                 if (ret) {
>                         etnaviv_gpu_clk_disable(gpu);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 98c6f9c320fc..33ecc1bf84b1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -95,6 +95,14 @@ struct clk;
>
>  #define ETNA_NR_EVENTS 30
>
> +enum etnaviv_gpu_state {
> +       ETNA_GPU_STATE_UNKNOWN = 0,
> +       ETNA_GPU_STATE_IDENTIFIED,
> +       ETNA_GPU_STATE_RESET,
> +       ETNA_GPU_STATE_INITIALIZED,
> +       ETNA_GPU_STATE_RUNNING,
> +};
> +
>  struct etnaviv_gpu {
>         struct drm_device *drm;
>         struct thermal_cooling_device *cooling;
> @@ -105,8 +113,8 @@ struct etnaviv_gpu {
>         struct workqueue_struct *wq;
>         struct mutex sched_lock;
>         struct drm_gpu_scheduler sched;
> +       enum etnaviv_gpu_state state;
>         bool initialized;
> -       bool fe_running;
>
>         /* 'ring'-buffer: */
>         struct etnaviv_cmdbuf buffer;
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
