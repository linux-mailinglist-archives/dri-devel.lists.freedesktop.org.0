Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13034944B35
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8AF10E945;
	Thu,  1 Aug 2024 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VSC6NQvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8614610E946;
 Thu,  1 Aug 2024 12:25:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso32663361fa.3; 
 Thu, 01 Aug 2024 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722515118; x=1723119918; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IE6qgZ4rcTyQeTCYx/z4n2FJeaYWlB8FUWK+7JYDiws=;
 b=VSC6NQvs1t0yjqs36eBKSbBKcOvKtQkH8JVCA2cTAP0UZ0vJ1YkUA0skvIcYxZk/UB
 EICvYxr8JkphNznUAEOHkrQgobZDd2rIs3nSiehBIXWhkg99fY2LrZ5KrFtHYM/lWC6w
 YlEETTCxXGjqpiLLDZHBs9zWCVmyonybAMdxaYk/53hdM/uRPJuFvEFkrpLhGic5oa5c
 6QgrECAiDAYehf1U6MRkVT+VrmvjjWbpfH7nCzCFN2S6Z/cngDB4ZuwohiSPuNSGKzYK
 nm7eGL6eFaAIRWjd/vWZvn0AYvJouG//UFoGhNEcXuMRZYJ2pYOT6GiCnBMb7blgUoZC
 lraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722515118; x=1723119918;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IE6qgZ4rcTyQeTCYx/z4n2FJeaYWlB8FUWK+7JYDiws=;
 b=o/Yih1id68QVJveVmc0SWc+OrGCPObQdFXAG64FfiCbwADla7kw0PCIHd1BnGuQsJ8
 RgJayt9WPdxGMtH8XlqHchKfGh8vVRh7VH045H1jUS6+xY4s/KHDVJFSunqEMLZdLEb7
 JZOdVctmJ0RCcbJNBtb2Hoiv9A64QOwvlYJ9d2cl376GxfzOQuIk59iokJCqYSjG4GJi
 FEuZ+SsM4EqcMF3D/H410xYIa77Yqek8i3ORVMIBPfR/emThHWY5TFYUaOhDYnnXr4n0
 p+o3bQ+eZGH8Jgb/N4DeQ5rZlV2Nz+4fydSGVk0Nv5yGECFYA0tWRVx3iEOO1ysWonsB
 9Otg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLojTopMnl0TC6mwzK19w4uO4zTs9OmtYnpEc2x1YpZRiKJOQ84whPK0CEcmUhYzfoUuTclyZxuwlES0yKZRDHXqrMfFMzicg2cmtBhdGM4l1HrN+Tusc3tjWVjAyV0of2osjpB1f/78nTcZNa/BmD
X-Gm-Message-State: AOJu0Ywdr33lxTrKFoiKRe1lzR3Gl97Ib1t6pYVCCHdDKkXJHChlYvOl
 brH/D9FwlvMqyZ3n6OBTyPIFdaufSxVcyOkOkok6yIN0fyDvQjle
X-Google-Smtp-Source: AGHT+IG943eA0ry+JhccUVZUIMThycHbSJevQ0g1kmn0332vlbW23arsJG6hBeaAFPOswQpq+lnHZg==
X-Received: by 2002:a2e:9cc9:0:b0:2ef:259f:a569 with SMTP id
 38308e7fff4ca-2f15aa872a4mr655561fa.15.1722515117536; 
 Thu, 01 Aug 2024 05:25:17 -0700 (PDT)
Received: from trashcan ([222.118.21.173]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fce64sm19345452f8f.61.2024.08.01.05.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 05:25:16 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:22:29 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Message-ID: <Zqt9Cxu7FsSALi4y@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com>
 <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
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

On Mon, Jul 29, 2024 at 06:26:45PM +0100, Connor Abbott wrote:
> On Thu, Jul 11, 2024 at 11:10 AM Vladimir Lypak
> <vladimir.lypak@gmail.com> wrote:
> >
> > On A5XX GPUs when preemption is used it's invietable to enter a soft
> > lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
> > This appears as full UI lockup and not detected as GPU hang (because
> > it's not). This happens due to not triggering preemption when it was
> > needed. Sometimes this state can be recovered by some new submit but
> > generally it won't happen because applications are waiting for old
> > submits to retire.
> >
> > One of the reasons why this happens is a race between a5xx_submit and
> > a5xx_preempt_trigger called from IRQ during submit retire. Former thread
> > updates ring->cur of previously empty and not current ring right after
> > latter checks it for emptiness. Then both threads can just exit because
> > for first one preempt_state wasn't NONE yet and for second one all rings
> > appeared to be empty.
> >
> > To prevent such situations from happening we need to establish guarantee
> > for preempt_trigger to be called after each submit. To implement it this
> > patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
> > should switch to non-empty or higher priority ring. Also we find next
> > ring in new preemption state "EVALUATE". If the thread that updated some
> > ring with new submit sees this state it should wait until it passes.
> >
> > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
> >  3 files changed, 30 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index 6c80d3003966..266744ee1d5f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
> >         }
> >
> >         a5xx_flush(gpu, ring, true);
> > -       a5xx_preempt_trigger(gpu);
> > +       a5xx_preempt_trigger(gpu, true);
> >
> >         /* we might not necessarily have a cmd from userspace to
> >          * trigger an event to know that submit has completed, so
> > @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >         a5xx_flush(gpu, ring, false);
> >
> >         /* Check to see if we need to start preemption */
> > -       a5xx_preempt_trigger(gpu);
> > +       a5xx_preempt_trigger(gpu, true);
> >  }
> >
> >  static const struct adreno_five_hwcg_regs {
> > @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
> >                 a5xx_gpmu_err_irq(gpu);
> >
> >         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> > -               a5xx_preempt_trigger(gpu);
> > +               a5xx_preempt_trigger(gpu, false);
> >                 msm_gpu_retire(gpu);
> >         }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > index c7187bcc5e90..1120824853d4 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
> >   * through the process.
> >   *
> >   * PREEMPT_NONE - no preemption in progress.  Next state START.
> > - * PREEMPT_START - The trigger is evaulating if preemption is possible. Next
> > - * states: TRIGGERED, NONE
> > + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possible. Next
> > + * states: START, ABORT
> >   * PREEMPT_ABORT - An intermediate state before moving back to NONE. Next
> >   * state: NONE.
> > + * PREEMPT_START - The trigger is preparing for preemption. Next state:
> > + * TRIGGERED
> >   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
> >   * states: FAULTED, PENDING
> >   * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
> > @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
> >
> >  enum preempt_state {
> >         PREEMPT_NONE = 0,
> > -       PREEMPT_START,
> > +       PREEMPT_EVALUATE,
> >         PREEMPT_ABORT,
> > +       PREEMPT_START,
> >         PREEMPT_TRIGGERED,
> >         PREEMPT_FAULTED,
> >         PREEMPT_PENDING,
> > @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
> >
> >  void a5xx_preempt_init(struct msm_gpu *gpu);
> >  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> > -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
> >  void a5xx_preempt_irq(struct msm_gpu *gpu);
> >  void a5xx_preempt_fini(struct msm_gpu *gpu);
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > index 67a8ef4adf6b..f8d09a83c5ae 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
> >  }
> >
> >  /* Try to trigger a preemption switch */
> > -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
> >  {
> >         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >         struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> >         unsigned long flags;
> >         struct msm_ringbuffer *ring;
> > +       enum preempt_state state;
> >
> >         if (gpu->nr_rings == 1)
> >                 return;
> >
> >         /*
> > -        * Try to start preemption by moving from NONE to START. If
> > -        * unsuccessful, a preemption is already in flight
> > +        * Try to start preemption by moving from NONE to EVALUATE. If current
> > +        * state is EVALUATE/ABORT we can't just quit because then we can't
> > +        * guarantee that preempt_trigger will be called after ring is updated
> > +        * by new submit.
> >          */
> > -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
> > +       state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> > +                              PREEMPT_EVALUATE);
> > +       while (new_submit && (state == PREEMPT_EVALUATE ||
> > +                             state == PREEMPT_ABORT)) {
> 
> This isn't enough because even if new_submit is false then we may
> still need to guarantee that evaluation happens. We've seen a hang in
> a scenario like:
> 
> 1. A job is submitted and executed on ring 0.
> 2. A job is submitted on ring 2 while ring 0 is still active but
> almost finished.
> 3. The submission thread starts evaluating and sees that ring 0 is still busy.
> 4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
> 5. The IRQ tries to trigger a preemption but the state is still
> PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
> 6. The submission thread finishes update_wptr() and finally sets the
> state to PREEMPT_NONE too late.
> 
> Then we never preempt to ring 2 and there's a soft lockup.

Thanks, i've missed that. It would need to always wait to prevent such
scenario. The next patch prevented this from happening for me so i have
overlooked it.

Alternatively there is another approach which should perform better: to
let evaluation stage run in parallel.

Also i've tried serializing preemption handling on ordered workqueue and
GPU kthread worker. It's a lot simpler but latency from IRQ doesn't look
good:

           flush-trigger    SW_IRQ-pending   flush_IRQ-trigger
    uSecs    1    2    3       1    2    3       1    2    3
     0-10 1515   43   65    4423   39   24     647    0    2
    10-20 1484  453  103     446  414  309     399    1    1
    20-40  827 1802  358      19  819  587       2   21    6
    40-60    7 1264  397       1  368  329       0   30   14
    60-80    4  311  115       0  181  178       0   24   12
   80-120    2   36  251       0  250  188       0    9   13
  120-160    0    4  244       0  176  248       0  226  150
  160-200    0    1  278       0  221  235       0   86   78
  200-400    0    2 1266       0 1318 1186       0  476  688
  400-700    0    0  553       0  745 1028       0  150  106
 700-1000    0    0  121       0  264  366       0   65   28
1000-1500    0    0   61       0  160  205       0   21    8
    >2000    0    0   12       0   71   48       0    0    0

1 - current implementation but with evaluation in parallel.
2 - serialized on ordered workqueue.
3 - serialized on GPU kthread_worker.

Vladimir

> 
> Connor
> 
> > +               cpu_relax();
> > +               state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> > +                                      PREEMPT_EVALUATE);
> > +       }
> > +
> > +       if (state != PREEMPT_NONE)
> >                 return;
> >
> >         /* Get the next ring to preempt to */
> > @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
> >                 return;
> >         }
> >
> > +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> > +
> >         /* Make sure the wptr doesn't update while we're in motion */
> >         spin_lock_irqsave(&ring->preempt_lock, flags);
> >         a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
> > @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
> >         update_wptr(gpu, a5xx_gpu->cur_ring);
> >
> >         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> > +
> > +       a5xx_preempt_trigger(gpu, false);
> >  }
> >
> >  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> > --
> > 2.45.2
> >
