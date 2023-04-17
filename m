Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DF6E4F74
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 19:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCB110E588;
	Mon, 17 Apr 2023 17:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D39510E0D4;
 Mon, 17 Apr 2023 17:42:28 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-18782426c4bso18237563fac.9; 
 Mon, 17 Apr 2023 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681753347; x=1684345347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4eNqP05voiY4cJzFVp4818baomQSBjqVrvQ3HutXj9Q=;
 b=I7RqE60/FDZvnlUc/Hc2zHsYwbfRunLUyH7Y5y9+f0ZuBug8YQxH6dI1R1KyXHAK20
 JHQS90XlbNAop7uekRzpuBxJx7IPTYyFORiJjn6eyUp2HqpYSi1/bKZ8/L1WrGBQzRlH
 eLPTGh8vyAflCCykXCLs+JW9MtnCkIJRw2jHB2uhMxlBmEeEn8Yl6nArIgbjM7+vDjiP
 en5GPd2ymIaq3cAMXxbFy3Xw9P06SIvyvyaDl8H0lb8qWs60WRnFmIh27gfS4evLcNCt
 4bkFuKC/rZNY2hA80iMXpev2sjZDknHayl7h3V0v9JO2mR1bOZUSyBs0eqtWWnWSIX/K
 J7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681753347; x=1684345347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4eNqP05voiY4cJzFVp4818baomQSBjqVrvQ3HutXj9Q=;
 b=GenLT6PjGVoCX7PAyhe3/2ijx2wcQJb7hKZaBIcbs/0V2xSVV20npbTke+5JqcQboR
 kkFrTgpJwfFIZhxZEZHNcppgY1hMuVfvsE4uAmaF68qdLRh6qRzReEkodcS6PDr+P5DA
 8Pi30n9ioxiINlKC3x1/4504bTaWN1wbUy8ov6vAin4LSKrnKZyyl9ATRwM0dREOEdWs
 3a15B1STZdrCUsMwS/HeYfA2aSXZcPjxafcR9H0onGbMnaqVgZYSAl1ZUjK7LcE/CUSp
 d79ZT+HnkHE1TBZyjJx9QD7VeolfhEVfVkH5Pg5Lhg0O74PsmFqT4OoIrd247lk/5qcb
 2QgQ==
X-Gm-Message-State: AAQBX9flfh4SdvuF/EmGcqEAFbzf0qsluz6eulSQiV5beM33XPZonAKR
 LGG4GJKZ2AzkT9LpRbtmbqNNb+xzwBnrsbslsTJGPYHppp0=
X-Google-Smtp-Source: AKy350YVVelr4MCDdF7/v07bFw6Y27tnHKCUjnzrNDgPiUPCHpOrE4KBzNFb2d3SbulgaaeBEDAAYxi4pvwCx8Dm/w4=
X-Received: by 2002:a05:6870:40d3:b0:187:88f8:e9b5 with SMTP id
 l19-20020a05687040d300b0018788f8e9b5mr7094627oal.6.1681753347093; Mon, 17 Apr
 2023 10:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230414143810.572237-1-l.stach@pengutronix.de>
In-Reply-To: <20230414143810.572237-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 17 Apr 2023 19:42:15 +0200
Message-ID: <CAH9NwWfAuyLenoQHHdSZb2O87HHxu53JziL6Ro05F6yHdnZ+8A@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix dumping of active MMU context
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
> gpu->mmu_context is the MMU context of the last job in the HW queue, which
> isn't necessarily the same as the context from the bad job. Dump the MMU
> context from the scheduler determined bad submit to make it work as intended.
>

Good catch!

> Fixes: 17e4660ae3d7 ("drm/etnaviv: implement per-process address spaces on MMUv2")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index 44b5f3c35aab..898f84a0fc30 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -130,9 +130,9 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>                 return;
>         etnaviv_dump_core = false;
>
> -       mutex_lock(&gpu->mmu_context->lock);
> +       mutex_lock(&submit->mmu_context->lock);
>
> -       mmu_size = etnaviv_iommu_dump_size(gpu->mmu_context);
> +       mmu_size = etnaviv_iommu_dump_size(submit->mmu_context);
>
>         /* We always dump registers, mmu, ring, hanging cmdbuf and end marker */
>         n_obj = 5;
> @@ -162,7 +162,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>         iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
>                         __GFP_NORETRY);
>         if (!iter.start) {
> -               mutex_unlock(&gpu->mmu_context->lock);
> +               mutex_unlock(&submit->mmu_context->lock);
>                 dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
>                 return;
>         }
> @@ -174,18 +174,18 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>         memset(iter.hdr, 0, iter.data - iter.start);
>
>         etnaviv_core_dump_registers(&iter, gpu);
> -       etnaviv_core_dump_mmu(&iter, gpu->mmu_context, mmu_size);
> +       etnaviv_core_dump_mmu(&iter, submit->mmu_context, mmu_size);
>         etnaviv_core_dump_mem(&iter, ETDUMP_BUF_RING, gpu->buffer.vaddr,
>                               gpu->buffer.size,
>                               etnaviv_cmdbuf_get_va(&gpu->buffer,
> -                                       &gpu->mmu_context->cmdbuf_mapping));
> +                                       &submit->mmu_context->cmdbuf_mapping));
>
>         etnaviv_core_dump_mem(&iter, ETDUMP_BUF_CMD,
>                               submit->cmdbuf.vaddr, submit->cmdbuf.size,
>                               etnaviv_cmdbuf_get_va(&submit->cmdbuf,
> -                                       &gpu->mmu_context->cmdbuf_mapping));
> +                                       &submit->mmu_context->cmdbuf_mapping));
>
> -       mutex_unlock(&gpu->mmu_context->lock);
> +       mutex_unlock(&submit->mmu_context->lock);
>
>         /* Reserve space for the bomap */
>         if (n_bomap_pages) {
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
