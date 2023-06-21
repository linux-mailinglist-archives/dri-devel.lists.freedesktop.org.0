Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E9737C14
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB010E3DF;
	Wed, 21 Jun 2023 07:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C371C10E3DF;
 Wed, 21 Jun 2023 07:35:30 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-39cc64e4a44so2942012b6e.0; 
 Wed, 21 Jun 2023 00:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687332930; x=1689924930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L1lue740R0g/t80KBAIxVosZBzBF6vyjp2lWDdY+kew=;
 b=K/9YUFBjQbviQacHFmT9q27DTU5zs94jGz+CJnJvFzUjQLV1LUZNH9D5p2I8CyoQau
 jZwAAxhP49SvEf3FQI4Okk5AobscnneMDcYrpOsya78un7Y+vDwZtt3Y0+LbhzRvjcRE
 rdUjlBRHQNy7wUiAZUdosPa6kjUGd7v/RtdsgllswGIhcYqqWpOlvoSAAhiEUcHkQUwG
 2xyj/qtVYo29jkoMTVAiICpR8mskJaQ9xJKc8nC1XW2ltPmheWKsGZIoqIRszREaGmIJ
 LUkWg16UdY+/7IJBZCl9/WuCn6whb4mQdIbGHfW6JYlnvvgebdsEl4x/JBUx33PP3WPC
 qmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332930; x=1689924930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L1lue740R0g/t80KBAIxVosZBzBF6vyjp2lWDdY+kew=;
 b=XqxD2vWm1YsteEh2uAKmlfC2QZOIex57hMd1InkgUHhhxDC7qHll1mF6wLBfs3agdo
 dYpY5bDzCak1n8zYEU5WdG/DpQrV9di+Fn9k5Zu9t4IpPiv0toHTvbCruZWEZDcf9UrO
 rlgChh82sjYPJRQgP5GUIVFuwj8pldaCnmOC/R9f3+5fLIGjzEHXr+SMv2cQnPb0O/0v
 VSzpAeLfDTxmfYacBMvCJTmW/BFdmswMU1dAlT06zDJLncDuRL4IuSLL+y9XQwspL+ah
 K1GheOD66Jdgr0IiioOayngnTd21VPCprYDN+cRk64LbwNHiee8K0B/TEDYFnP/5RNCU
 j2xg==
X-Gm-Message-State: AC+VfDxKLX/1UonjDW33UcyXpDm9PWseRYDi2e+h3+y6jw+o+TwceQxV
 nmtjRTKLEoPFGhUAh7J+6cPxT2diM9E82fhH4Jp8EsnMyu5gFQ==
X-Google-Smtp-Source: ACHHUZ4Yb0MXTMssvsAhywNLzyWZdZgNOaRvqnSvGcVOh0J1ntVPKkI/HQp8DShl6zBQRyGrByc5wRC26mrEku1Xo6E=
X-Received: by 2002:aca:7c5:0:b0:398:1045:17ed with SMTP id
 188-20020aca07c5000000b00398104517edmr11221423oih.54.1687332929600; Wed, 21
 Jun 2023 00:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-8-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-8-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 21 Jun 2023 09:35:18 +0200
Message-ID: <CAH9NwWciO9LG24kooa9NXRVYTZTtVWOfM0VtR-5SYmmY-arFkQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/etnaviv: expedited MMU fault handling
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
> The GPU is halted when it hits a MMU exception, so there is no point in
> waiting for the job timeout to expire or try to work out if the GPU is
> still making progress in the timeout handler, as we know that the GPU
> won't make any more progress.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c   | 2 ++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h   | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 5 +++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index e62761032afe..74fdcaf52fc5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1531,6 +1531,8 @@ static irqreturn_t irq_handler(int irq, void *data)
>
>                 if (intr & VIVS_HI_INTR_ACKNOWLEDGE_MMU_EXCEPTION) {
>                         dump_mmu_fault(gpu);
> +                       gpu->state = ETNA_GPU_STATE_FAULT;
> +                       drm_sched_fault(&gpu->sched);
>                         intr &= ~VIVS_HI_INTR_ACKNOWLEDGE_MMU_EXCEPTION;
>                 }
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index a4a9253f0d52..d4b9a97f2c72 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -101,6 +101,7 @@ enum etnaviv_gpu_state {
>         ETNA_GPU_STATE_RESET,
>         ETNA_GPU_STATE_INITIALIZED,
>         ETNA_GPU_STATE_RUNNING,
> +       ETNA_GPU_STATE_FAULT,
>  };
>
>  struct etnaviv_gpu {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 1ae87dfd19c4..345fec6cb1a4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -55,8 +55,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>          */
>         dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
>         change = dma_addr - gpu->hangcheck_dma_addr;
> -       if (gpu->completed_fence != gpu->hangcheck_fence ||
> -           change < 0 || change > 16) {
> +       if (gpu->state == ETNA_GPU_STATE_RUNNING &&
> +           (gpu->completed_fence != gpu->hangcheck_fence ||
> +            change < 0 || change > 16)) {
>                 gpu->hangcheck_dma_addr = dma_addr;
>                 gpu->hangcheck_fence = gpu->completed_fence;
>                 goto out_no_timeout;
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
