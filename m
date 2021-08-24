Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719B3F5A32
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 10:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10927898BC;
	Tue, 24 Aug 2021 08:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535E78982F;
 Tue, 24 Aug 2021 08:52:11 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id a185so1710921vke.13;
 Tue, 24 Aug 2021 01:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UANStODlvGjdD9CplNFInpuTcqC0HUZ8cbC5NgD6gY4=;
 b=FUjvKZnnmYWm4NpkUDg9WXhD8xlWx+ILWvJd0rjxNi09llRv0aBAKx7wwIsZKQw/kY
 Wp2lAMyII2s7cJIgRwWLKWrIvqq4B1bFPg9M+TbIGpo1/KS5Hzg0TqgpobzbchL57WcI
 TQwN3SZmGUJ8akErnNFBWhluv9kKutjjdfH5qa/OfxlglKKHod7vJXo7DZ3fteaOhFSg
 Ls7kHJhGleFluW9C49MB0xMhq50VudfeFl6Q6KERdBxyzQMCBwk1oASFOPFaE3IGZzDo
 XwXtvuWQID05k4zCESBiTZI+4BurM8Q0agwmCkfJ3sW4nc4cATI5od2ixDSGQnuN2mw6
 N9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UANStODlvGjdD9CplNFInpuTcqC0HUZ8cbC5NgD6gY4=;
 b=sfbFSWUWg9qcvjnXw6P9e6Jl19DKY1AeNEv1N29xMtVj/u0SJSD6mrADnG0QZHNV4u
 gW7j0h26SjeTeU0KSdQjoNVxe8SblTW+KHF/ez4jMMwWlJCOqX5rP8MCTtiboBMxirJ9
 wZJB6lDLzS1tx5C5VobsgK+7tlJI7kNDhZxFkaME0sDlhBrrRptoUau8Az/8XGry5Ylp
 rAjv0OdokcuwYifw7QOs8U9IrAIcejdeFNnfFBHT5CdAyhVaSjn59ryL26YoCDJYrZwH
 Ab0CAMLaBU1ZPpf1YMZA+r8j1h+jPMvZSZKiRESchbvJhC6TVryrDeHw1U79OWFXFh/G
 GU/g==
X-Gm-Message-State: AOAM530q7PLiIRadcsAnris1Ex/4Fg4vnm5HqNdkfSpPznLTGQYHPr+4
 ZCW6OLpi1wXCj34wH+TVkwAh12wJfPJqr9OtL6k=
X-Google-Smtp-Source: ABdhPJyHCkKDw+iIJ8jCBR+Ey/CWp6dYAnYURxYMzemBY5zkPXY0nxILWurW08lNmKSA1h3e/6R5V3ZfX3wrRPxo44k=
X-Received: by 2002:ac5:ca03:: with SMTP id c3mr3173627vkm.5.1629795130408;
 Tue, 24 Aug 2021 01:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
 <20210820201830.2005563-7-l.stach@pengutronix.de>
 <CAH9NwWc=nyt4nJpTc8AfRaM4LnWy86LNWadhza5LyFyv4SiQPw@mail.gmail.com>
 <f6c8190a1291fe7fa0159de6c2a111efc713053f.camel@pengutronix.de>
In-Reply-To: <f6c8190a1291fe7fa0159de6c2a111efc713053f.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 24 Aug 2021 10:51:59 +0200
Message-ID: <CAH9NwWd17mOLcg=ZAx_FAMwHuQSwvYx_eRW-4st2K9nHOqHAFg@mail.gmail.com>
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

Hi Lucas

Am Di., 24. Aug. 2021 um 09:54 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Am Dienstag, dem 24.08.2021 um 09:24 +0200 schrieb Christian Gmeiner:
> > Am Fr., 20. Aug. 2021 um 22:18 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> > >
> > > Move the refcount manipulation of the MMU context to the point where the
> > > hardware state is programmed. At that point it is also known if a previous
> > > MMU state is still there, or the state needs to be reprogrammed with a
> > > potentially different context.
> > >
> > > Cc: stable@vger.kernel.org # 5.4
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > Tested-by: Michael Walle <michael@walle.cc>
> > > ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c      | 24 +++++++++++-----------
> > >  drivers/gpu/drm/etnaviv/etnaviv_iommu.c    |  4 ++++
> > >  drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c |  8 ++++++++
> > >  3 files changed, 24 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > index f420c4f14657..1fa98ce870f7 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > @@ -641,17 +641,19 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
> > >         gpu->fe_running = true;
> > >  }
> > >
> > > -static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu)
> > > +static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
> > > +                                         struct etnaviv_iommu_context *context)
> > >  {
> > > -       u32 address = etnaviv_cmdbuf_get_va(&gpu->buffer,
> > > -                               &gpu->mmu_context->cmdbuf_mapping);
> > >         u16 prefetch;
> > > +       u32 address;
> > >
> > >         /* setup the MMU */
> > > -       etnaviv_iommu_restore(gpu, gpu->mmu_context);
> > > +       etnaviv_iommu_restore(gpu, context);
> > >
> > >         /* Start command processor */
> > >         prefetch = etnaviv_buffer_init(gpu);
> > > +       address = etnaviv_cmdbuf_get_va(&gpu->buffer,
> > > +                                       &gpu->mmu_context->cmdbuf_mapping);
> > >
> > >         etnaviv_gpu_start_fe(gpu, address, prefetch);
> > >  }
> > > @@ -1369,14 +1371,12 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
> > >                 goto out_unlock;
> > >         }
> > >
> > > -       if (!gpu->fe_running) {
> > > -               gpu->mmu_context = etnaviv_iommu_context_get(submit->mmu_context);
> > > -               etnaviv_gpu_start_fe_idleloop(gpu);
> > > -       } else {
> > > -               if (submit->prev_mmu_context)
> > > -                       etnaviv_iommu_context_put(submit->prev_mmu_context);
> > > -               submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
> > > -       }
> > > +       if (!gpu->fe_running)
> > > +               etnaviv_gpu_start_fe_idleloop(gpu, submit->mmu_context);
> > > +
> > > +       if (submit->prev_mmu_context)
> > > +               etnaviv_iommu_context_put(submit->prev_mmu_context);
> > > +       submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
> > >
> > >         if (submit->nr_pmrs) {
> > >                 gpu->event[event[1]].sync_point = &sync_point_perfmon_sample_pre;
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> > > index 1a7c89a67bea..afe5dd6a9925 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> > > @@ -92,6 +92,10 @@ static void etnaviv_iommuv1_restore(struct etnaviv_gpu *gpu,
> > >         struct etnaviv_iommuv1_context *v1_context = to_v1_context(context);
> > >         u32 pgtable;
> > >
> > > +       if (gpu->mmu_context)
> > > +               etnaviv_iommu_context_put(gpu->mmu_context);
> > > +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> > > +
> > >         /* set base addresses */
> > >         gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_RA, context->global->memory_base);
> > >         gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_FE, context->global->memory_base);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> > > index f8bf488e9d71..d664ae29ae20 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> > > @@ -172,6 +172,10 @@ static void etnaviv_iommuv2_restore_nonsec(struct etnaviv_gpu *gpu,
> > >         if (gpu_read(gpu, VIVS_MMUv2_CONTROL) & VIVS_MMUv2_CONTROL_ENABLE)
> > >                 return;
> > >
> > > +       if (gpu->mmu_context)
> > > +               etnaviv_iommu_context_put(gpu->mmu_context);
> > > +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> > > +
> > >         prefetch = etnaviv_buffer_config_mmuv2(gpu,
> > >                                 (u32)v2_context->mtlb_dma,
> > >                                 (u32)context->global->bad_page_dma);
> > > @@ -192,6 +196,10 @@ static void etnaviv_iommuv2_restore_sec(struct etnaviv_gpu *gpu,
> > >         if (gpu_read(gpu, VIVS_MMUv2_SEC_CONTROL) & VIVS_MMUv2_SEC_CONTROL_ENABLE)
> > >                 return;
> > >
> > > +       if (gpu->mmu_context)
> > > +               etnaviv_iommu_context_put(gpu->mmu_context);
> > > +       gpu->mmu_context = etnaviv_iommu_context_get(context);
> > > +
> >
> > I have seen this pattern now more than two times - maybe put the
> > assignment of a new mmu context into its own function?
> >
> Yea, I thought about having some Gallium style reference handling
> functions, but that would change the code even more. Since I intend to
> have this series go into stable I wanted to keep the changes to a
> minimum for now. I was already on the fence with the first patch in
> this series, but that one provides very obvious legibility
> improvements, making it easier to review this series.
>
> Would you agree to leave it like that for the stable series and clean
> it up in a follow up change?
>

Sure... sounds like a good plan.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
