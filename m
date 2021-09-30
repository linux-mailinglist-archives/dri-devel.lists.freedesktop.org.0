Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB641E1E5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 20:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5DD6E452;
	Thu, 30 Sep 2021 18:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEECC6E44E;
 Thu, 30 Sep 2021 18:59:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u18so11724745wrg.5;
 Thu, 30 Sep 2021 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtHR/5mhoD+jbjzzofM3zeDSQMp6/bJoeja1COQo/fU=;
 b=Rue0cEAxWW1ZqJcStxVmkOOQUKd4yTba2mlu7wbp4BiLmo71fXj5pV5d7nddvA/HnP
 Qo8Dez5nAUTT6TwQswJl0YMZVKam36NG8MGhA13s7sDCEYjn4YEuZ3nKa/8ZsxE5M0gc
 CMyRMJqhEOoft3QEH2iyBrSUJvodvt/NX6xaRiBaV61stg1sG7vi3QvkBJ9M20UItNqC
 36YNk/3N/AhDPuM7dmQz7Zgm33zhHLqRcaMZXZ8M3BxlBsNgX7VCpg1Xzk/GM0WJbN+6
 CWf1eLXxhsg1uIH+u+OYfANqlH3nQK5IJehFNEkxCQFj29TQ6maZ5mIKm2eJrpHe26CS
 kntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtHR/5mhoD+jbjzzofM3zeDSQMp6/bJoeja1COQo/fU=;
 b=5/6qTdRGS5Ry7JLq1bP+NZEWCnGjv5ApcwK8ND/s3SJflXfmpdD2Q6aVVqIoE1dZxT
 6aM9LLxEN4zdLcc3NecmkuZDLwUXrBconax02E3+Oq72rrovwtsJnti185jlckufxlZC
 wtqgX9OxOjbX2Zj9asG645g9D1oOCzhzZAhDviFAFPb0+MQIwMrWQAZujTWCIBaSi1BT
 lGMNnuzES12L6XIgrTIF0xkultDugQfKi9NIaW47Ahw/m5h6btPgAdUb9yLm7ciAEsOM
 3oSDGuaSBac1K7tgApmlsW9t7OWArLu4Be0shonw0Tv9ZUT/8nkG4Sf1bdvazwUpylvN
 uhJg==
X-Gm-Message-State: AOAM532jT1cLASEq+28JV3sN3wfNNVrVpejW29hJFsPdiciNKfsSXOEM
 c4iAMT4+skCR0Y3mUcEb37eXUKR/eidJuNyVCMs=
X-Google-Smtp-Source: ABdhPJyOIvWASHtDgHpnHFcHjfxBLo7tND0WZ5iE6kG/zeFv6A54nYbuesLwzfSUvaEg9mH6wThtBhkPpQlVazxPeuE=
X-Received: by 2002:a5d:544c:: with SMTP id w12mr8240896wrv.398.1633028368278; 
 Thu, 30 Sep 2021 11:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210930182506.1236811-1-robdclark@gmail.com>
 <CAKMK7uF1kfUD1mc4UScvVG0Su9HiN6M388YhT0jO+iGExxnVtw@mail.gmail.com>
In-Reply-To: <CAKMK7uF1kfUD1mc4UScvVG0Su9HiN6M388YhT0jO+iGExxnVtw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 30 Sep 2021 12:04:02 -0700
Message-ID: <CAF6AEGsNAzpzB4_bVSS9VcQwKEi_N+rdXMx3VYrL8ktf7oueZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Track current ctx by seqno
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>, 
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Yangtao Li <tiny.windzz@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Sep 30, 2021 at 11:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Sep 30, 2021 at 8:20 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In theory a context can be destroyed and a new one allocated at the same
> > address, making the pointer comparision to detect when we don't need to
> > update the current pagetables invalid.  Instead assign a sequence number
> > to each context on creation, and use this for the check.
> >
> > Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Usually the weak reference pattern is to wrap a spinlock or something
> around it and clear it out on destruction. Or hold a full reference
> (e.g. on intel hw the hw goes unhappy if there's no context/pagetables
> at all, so we always need some). But I guess this works too.

yeah, the seqno approach was so that gen agnostic code didn't have to
go fishing around in a6xx_gpu..

I guess the downside is userspace could open/close the dev file 2^32
times without submitting any rendering to trigger the same sort of
issue.  But there are plenty of easier ways for userspace to trigger
faults if it wanted.

BR,
-R

> -Daniel
>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++++++++-
> >  drivers/gpu/drm/msm/msm_drv.c         |  3 +++
> >  drivers/gpu/drm/msm/msm_drv.h         |  1 +
> >  4 files changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 5e1ae3df42ba..e0a8b2fd1ff0 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> >         u32 asid;
> >         u64 memptr = rbmemptr(ring, ttbr0);
> >
> > -       if (ctx == a6xx_gpu->cur_ctx)
> > +       if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
> >                 return;
> >
> >         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> > @@ -139,7 +139,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> >         OUT_PKT7(ring, CP_EVENT_WRITE, 1);
> >         OUT_RING(ring, 0x31);
> >
> > -       a6xx_gpu->cur_ctx = ctx;
> > +       a6xx_gpu->cur_ctx_seqno = ctx->seqno;
> >  }
> >
> >  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > @@ -1081,7 +1081,7 @@ static int hw_init(struct msm_gpu *gpu)
> >         /* Always come up on rb 0 */
> >         a6xx_gpu->cur_ring = gpu->rb[0];
> >
> > -       a6xx_gpu->cur_ctx = NULL;
> > +       a6xx_gpu->cur_ctx_seqno = 0;
> >
> >         /* Enable the SQE_to start the CP engine */
> >         gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > index 0bc2d062f54a..8e5527c881b1 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -19,7 +19,16 @@ struct a6xx_gpu {
> >         uint64_t sqe_iova;
> >
> >         struct msm_ringbuffer *cur_ring;
> > -       struct msm_file_private *cur_ctx;
> > +
> > +       /**
> > +        * cur_ctx_seqno:
> > +        *
> > +        * The ctx->seqno value of the context with current pgtables
> > +        * installed.  Tracked by seqno rather than pointer value to
> > +        * avoid dangling pointers, and cases where a ctx can be freed
> > +        * and a new one created with the same address.
> > +        */
> > +       int cur_ctx_seqno;
> >
> >         struct a6xx_gmu gmu;
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 624078b3adf2..30c1efc3d8a0 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -711,6 +711,7 @@ static void load_gpu(struct drm_device *dev)
> >
> >  static int context_init(struct drm_device *dev, struct drm_file *file)
> >  {
> > +       static atomic_t ident = ATOMIC_INIT(0);
> >         struct msm_drm_private *priv = dev->dev_private;
> >         struct msm_file_private *ctx;
> >
> > @@ -727,6 +728,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
> >         ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
> >         file->driver_priv = ctx;
> >
> > +       ctx->seqno = atomic_inc_return(&ident);
> > +
> >         return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index de062450add4..8633d0059a3e 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -59,6 +59,7 @@ struct msm_file_private {
> >         int queueid;
> >         struct msm_gem_address_space *aspace;
> >         struct kref ref;
> > +       int seqno;
> >  };
> >
> >  enum msm_mdp_plane_property {
> > --
> > 2.31.1
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
