Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11A3713FB
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5226E8A1;
	Mon,  3 May 2021 11:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5056F6E8A1;
 Mon,  3 May 2021 11:08:01 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id x22so1782432uav.8;
 Mon, 03 May 2021 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nd/tvd+BREgQ8+TItMl2enNb3kdsmIGNJMt10Lab01U=;
 b=BLKNSv4NhMENnx75Xfs9RISYT4y1ofAQmjsKyDSC0DkTRcLllruyGE+baZzbqjO4b8
 fziaTbH5Tm7wIn5fLQx3PAdTJ/cVI4WGD2Ei0n0S0UF96HMTK/Ik2FWeU4vbKgImMC8l
 F3kaA0pmjiywDETOUkIWfkcPXSz2+nMaj+YMwjAMnYxZEJtw+QWNskuKFbTq9s2An7w6
 fbm0U2v/DMz5dfa3+LeGEP8art94x5e9Zqv+QzKh9coZ3z3IXPwLUkeVe3EVaqwttdWE
 7fGljjgQjoV+ty8xBPZ9ooE/cEoNSAThaGhrZJKW6++gD+rgNzKO2LFPT9y5D/BC1+9V
 jYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nd/tvd+BREgQ8+TItMl2enNb3kdsmIGNJMt10Lab01U=;
 b=BhSos16pSwVV2yEFxTgeHoE10ds1OzSCdPfVtf93rfIdpne8f5cVbff3szhGzNBUBg
 U71grxv79l1mJufqwm9xoamWBT4MzfLpbfoo0etnTBxpCC/51r21nIXUFrIQXGzTx6F3
 3vOhnt+6GBzGZP+5gXhWvp9eMy4ADFYOgiPImM6uwdiQV8+MRNv19JUeiT5yKvVNSH6L
 UUW/OcxDc+vPc90+3vVfCyXfB/G07QQCN31gTZ2hLNKIhRvVc0GXfeKIe/9/nI9gT+wX
 vM87e6NWotPsy6yChQ7VqDINhlCfBtvPmaSYTOqNsPa/3GyRZFjIxR26Xu4VC0sriHDf
 MxGQ==
X-Gm-Message-State: AOAM532sXzh0qKU0vKTphM1EpsHGpErAh1Kg+Nf7JCaW39U+S6O4Pvy2
 1jqqK7SXCq0TCFRQQkMTRkQhoP7jEK/0HI6M4mRHPXXctglfYw==
X-Google-Smtp-Source: ABdhPJzcjnHLCz9H5DMwXo+wp/kfkXqblq4YQLm9V1X20dOFiC9GA8f0tPuMUPbYGs0mOCug6FNJ+3kwY3wXM5Floi8=
X-Received: by 2002:ab0:1648:: with SMTP id l8mr13471321uae.124.1620040080385; 
 Mon, 03 May 2021 04:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210503102422.1384502-1-l.stach@pengutronix.de>
In-Reply-To: <20210503102422.1384502-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 3 May 2021 13:07:56 +0200
Message-ID: <CAH9NwWfhM9hLcrUQCEieQzVG0Kh5XfjCBc3h3MLy693CpM=G7w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: rework linear window offset calculation
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de, Primoz Fiser <primoz.fiser@norik.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mo., 3. Mai 2021 um 12:24 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> The current calculation based on the required_dma mask can be significantly
> off, so that the linear window only overlaps a small part of the DRAM
> address space. This can lead to the command buffer being unmappable, which
> is obviously bad.
>
> Rework the linear window offset calculation to be based on the command buffer
> physical address, making sure that the command buffer is always mappable.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 52 +++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index c6404b8d067f..a454b13e8106 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -27,10 +27,6 @@
>  #include "state_hi.xml.h"
>  #include "cmdstream.xml.h"
>
> -#ifndef PHYS_OFFSET
> -#define PHYS_OFFSET 0
> -#endif
> -
>  static const struct platform_device_id gpu_ids[] = {
>         { .name = "etnaviv-gpu,2d" },
>         { },
> @@ -724,6 +720,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>  int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  {
>         struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> +       dma_addr_t cmdbuf_paddr;
>         int ret, i;
>
>         ret = pm_runtime_get_sync(gpu->dev);
> @@ -766,28 +763,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>         if (ret)
>                 goto fail;
>
> -       /*
> -        * Set the GPU linear window to be at the end of the DMA window, where
> -        * the CMA area is likely to reside. This ensures that we are able to
> -        * map the command buffers while having the linear window overlap as
> -        * much RAM as possible, so we can optimize mappings for other buffers.
> -        *
> -        * For 3D cores only do this if MC2.0 is present, as with MC1.0 it leads
> -        * to different views of the memory on the individual engines.
> -        */
> -       if (!(gpu->identity.features & chipFeatures_PIPE_3D) ||
> -           (gpu->identity.minor_features0 & chipMinorFeatures0_MC20)) {
> -               u32 dma_mask = (u32)dma_get_required_mask(gpu->dev);
> -               if (dma_mask < PHYS_OFFSET + SZ_2G)
> -                       priv->mmu_global->memory_base = PHYS_OFFSET;
> -               else
> -                       priv->mmu_global->memory_base = dma_mask - SZ_2G + 1;
> -       } else if (PHYS_OFFSET >= SZ_2G) {
> -               dev_info(gpu->dev, "Need to move linear window on MC1.0, disabling TS\n");
> -               priv->mmu_global->memory_base = PHYS_OFFSET;
> -               gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
> -       }
> -
>         /*
>          * If the GPU is part of a system with DMA addressing limitations,
>          * request pages for our SHM backend buffers from the DMA32 zone to
> @@ -804,6 +779,31 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>                 goto fail;
>         }
>
> +       /*
> +        * Set the GPU linear window to cover the cmdbuf region, as the GPU
> +        * won't be able to start execution otherwise. The alignment to 128M is
> +        * chosen arbitrarily but helps in debugging, as the MMU offset
> +        * calculations are much more straight forward this way.
> +        *
> +        * On MC1.0 cores the linear window offset is ignored by the TS engine,
> +        * leading to inconsistent memory views. Avoid using the offset on those
> +        * cores if possible, otherwise disable the TS feature.
> +        */
> +       cmdbuf_paddr = ALIGN_DOWN(etnaviv_cmdbuf_get_pa(&gpu->buffer), SZ_128M);
> +
> +       if (!(gpu->identity.features & chipFeatures_PIPE_3D) ||
> +           (gpu->identity.minor_features0 & chipMinorFeatures0_MC20)) {
> +               if (cmdbuf_paddr >= SZ_2G)
> +                       priv->mmu_global->memory_base = SZ_2G;
> +               else
> +                       priv->mmu_global->memory_base = cmdbuf_paddr;
> +       } else if (cmdbuf_paddr + SZ_128M >= SZ_2G) {
> +               dev_info(gpu->dev,
> +                        "Need to move linear window on MC1.0, disabling TS\n");
> +               gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
> +               priv->mmu_global->memory_base = SZ_2G;
> +       }
> +
>         /* Setup event management */
>         spin_lock_init(&gpu->event_spinlock);
>         init_completion(&gpu->event_free);
> --
> 2.29.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
