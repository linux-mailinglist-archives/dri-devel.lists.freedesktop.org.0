Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF1738A05
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6910E250;
	Wed, 21 Jun 2023 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776F10E24F;
 Wed, 21 Jun 2023 15:44:51 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-55e04a83465so3993075eaf.3; 
 Wed, 21 Jun 2023 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687362290; x=1689954290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ozXF5QIPe1h+vTDy7+nqY7ReNgmMUT8yQHedMlExsqQ=;
 b=B6q3aqfsPvCtD6I1EKY7FGkAP1IAfDBy0IB59BtxMekq1+pdzMjca+BYmKY+a1rbii
 Tvrv9kIz1mgfXzfXBu8laMOXPS5q2x2VQkP94vz8wIgKOjAkC4EmkzszXhAksKk7JHPl
 W42mGUjRoyvGsy+5faSFq5RqvPUb8VC/+W/tof6HonyDKrc8bKUHrw538rYgUpLe86mD
 AcCkC89qcSJGK44bOmXZL444RtnuwDLRzvKStmMbsuhZqlT2ForinTBQdsnPe9WGEK1Q
 TMdVH9WaM0ltJ0EgA2n3aE4YrzG8/3pbf+fZJHNQ6nfolSDtFReuItWXHKdM0Chtn92P
 cdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687362290; x=1689954290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ozXF5QIPe1h+vTDy7+nqY7ReNgmMUT8yQHedMlExsqQ=;
 b=bZMe54sLBWNP3uU+2vEuxJgK8DCcy1wAIsY2aYPGI8zyq9jE3I1ADj/lyqb79jPv/u
 3s2ycP7CNDlHnhsWYK8ncCzuGztn7CHP8qA03VHTt0tobvwpcI/V23sjJNMkoAkWKUZG
 T71PplDQ+UmM5vTEEk14dRjg3IwhrvYw5/pC24s1SR1i5A9LtxywP/xnTCJtkEKcnhfO
 MiFxbxbE0P4iwiGHZmHp6fV83xNkxJNrWedhlXl4RHEXmpv0Z+wmdH0nnppgRA1J/io/
 Jau//pX7wmiCyfWkpLS7S/z0dkPTUxos6P04nkhQrIK+ctJv++vlpoHJ31/6peLIqcsZ
 fL7Q==
X-Gm-Message-State: AC+VfDyAK/7yrQxVKu6MD8bF6e8NkI9K1lw3lktJpVcO2sA2a9IXsV9q
 sNjewqe2drvRuDLrYQP6GV9bFZQHmwFnTLl1f3M=
X-Google-Smtp-Source: ACHHUZ6MMasdZGe8avriMkCRAA4vq9bezLA8BF/DF0gX9sLhxP9GEKELAcWm7MxrptZ2l5Fo4IaPyaKHH2ceg49ChWw=
X-Received: by 2002:a4a:a645:0:b0:560:b1ce:7025 with SMTP id
 j5-20020a4aa645000000b00560b1ce7025mr1342917oom.0.1687362290047; Wed, 21 Jun
 2023 08:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230414143810.572237-1-l.stach@pengutronix.de>
 <CAH9NwWfAuyLenoQHHdSZb2O87HHxu53JziL6Ro05F6yHdnZ+8A@mail.gmail.com>
In-Reply-To: <CAH9NwWfAuyLenoQHHdSZb2O87HHxu53JziL6Ro05F6yHdnZ+8A@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 21 Jun 2023 17:44:38 +0200
Message-ID: <CAH9NwWcf9tYG9Ua_b-TvvQHRY-j_VsAtGdkPBqwh4KH37B2qjQ@mail.gmail.com>
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

Hi Lucas,

Am Mo., 17. Apr. 2023 um 19:42 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> Hi Lucas
>
> >
> > gpu->mmu_context is the MMU context of the last job in the HW queue, which
> > isn't necessarily the same as the context from the bad job. Dump the MMU
> > context from the scheduler determined bad submit to make it work as intended.
> >
>
> Good catch!
>

I think this patch did not land yet. Do you have plans to add it to
etnaviv/next?

> > Fixes: 17e4660ae3d7 ("drm/etnaviv: implement per-process address spaces on MMUv2")
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>
> Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > index 44b5f3c35aab..898f84a0fc30 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > @@ -130,9 +130,9 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
> >                 return;
> >         etnaviv_dump_core = false;
> >
> > -       mutex_lock(&gpu->mmu_context->lock);
> > +       mutex_lock(&submit->mmu_context->lock);
> >
> > -       mmu_size = etnaviv_iommu_dump_size(gpu->mmu_context);
> > +       mmu_size = etnaviv_iommu_dump_size(submit->mmu_context);
> >
> >         /* We always dump registers, mmu, ring, hanging cmdbuf and end marker */
> >         n_obj = 5;
> > @@ -162,7 +162,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
> >         iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> >                         __GFP_NORETRY);
> >         if (!iter.start) {
> > -               mutex_unlock(&gpu->mmu_context->lock);
> > +               mutex_unlock(&submit->mmu_context->lock);
> >                 dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
> >                 return;
> >         }
> > @@ -174,18 +174,18 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
> >         memset(iter.hdr, 0, iter.data - iter.start);
> >
> >         etnaviv_core_dump_registers(&iter, gpu);
> > -       etnaviv_core_dump_mmu(&iter, gpu->mmu_context, mmu_size);
> > +       etnaviv_core_dump_mmu(&iter, submit->mmu_context, mmu_size);
> >         etnaviv_core_dump_mem(&iter, ETDUMP_BUF_RING, gpu->buffer.vaddr,
> >                               gpu->buffer.size,
> >                               etnaviv_cmdbuf_get_va(&gpu->buffer,
> > -                                       &gpu->mmu_context->cmdbuf_mapping));
> > +                                       &submit->mmu_context->cmdbuf_mapping));
> >
> >         etnaviv_core_dump_mem(&iter, ETDUMP_BUF_CMD,
> >                               submit->cmdbuf.vaddr, submit->cmdbuf.size,
> >                               etnaviv_cmdbuf_get_va(&submit->cmdbuf,
> > -                                       &gpu->mmu_context->cmdbuf_mapping));
> > +                                       &submit->mmu_context->cmdbuf_mapping));
> >
> > -       mutex_unlock(&gpu->mmu_context->lock);
> > +       mutex_unlock(&submit->mmu_context->lock);
> >
> >         /* Reserve space for the bomap */
> >         if (n_bomap_pages) {
> > --
> > 2.39.2
> >



-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
