Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B097545DF73
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 18:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF106E1A4;
	Thu, 25 Nov 2021 17:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB056E591
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 17:15:51 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id m5so6432672ilh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uYJR7BpBUZnQlATvrNBpAhoCNJC2VJDDuo/0Wdks2I=;
 b=U1wy3xNctEYKtUSbQx4rQXWxWtAp3C6P5JqLjhqLydfu/j7qzEy22qOVSYZ8CT4Q0E
 KVf41IlVtfIa4dkrSkmRdOr7Mqn9KxanQNNnwy3jx2/d4CNhit0+YKJ3rmErXoNkDT9h
 EPVq9/nY4i12LhSgQ+wt8DA6NbflF6T7isKlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uYJR7BpBUZnQlATvrNBpAhoCNJC2VJDDuo/0Wdks2I=;
 b=zjyMdOw0oiSI/9aSYatS/CA+DcorhLrWc/fhxjA6gd+gD+RfWplHo3k+78qVc/jI1A
 fi6qhgsy7ZurYGnHFo5ljSVnB8oRvLcpWZnIUSdGKcQjr9KYllW3kMU/mPcXH18KJrI1
 +Syifa3DOWgsRZxplQ3qkjvcwaJYPkZgLUyRTCk8ZyQVeHHNWAx5fhq7I8VoQej1cvIq
 +1lis3oe6HvJUhcZjr25+F7wUBnAn/n+6lt1PkJR+X0WqSBLnePibLTIdilSTicdXlqY
 bBTj0Sw75ZGp82z1R3ThbxBSPypEbS7hW/ba20Eze2JX+0R6xh0QMmPG+MW84e1OMyps
 w/WA==
X-Gm-Message-State: AOAM5333kzbDN4nyxAMR+jm+w0TG75ybGeF485pI2z/D8iG3FTxrNimH
 inoX3nu8sGNCLR/nc//nDZ7/4gIdOJ+Nph0bj0vd1w==
X-Google-Smtp-Source: ABdhPJwllgvWyk4LNbY/PtxJGQlD+gEgV7b5sp6fqyvfUdRDRSzNrnZLFjdBH7EIEcEybhBkeEKxek8U1YU0hnor4HU=
X-Received: by 2002:a92:c54d:: with SMTP id a13mr23882839ilj.143.1637860551141; 
 Thu, 25 Nov 2021 09:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20210428193654.1498482-1-robdclark@gmail.com>
 <20210428193654.1498482-2-robdclark@gmail.com>
 <e6f04ed5-100d-6ef9-c272-1a1370e45579@linaro.org>
In-Reply-To: <e6f04ed5-100d-6ef9-c272-1a1370e45579@linaro.org>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 25 Nov 2021 09:20:57 -0800
Message-ID: <CAJs_Fx6cJSkU=+C7Fh14=xojn0n-ad9_qNFXuimFFm_X3WfUOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Handle ringbuffer overflow
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 11:36 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/04/2021 22:36, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Currently if userspace manages to fill up the ring faster than the GPU
> > can consume we (a) spin for up to 1sec, and then (b) overwrite the
> > ringbuffer contents from previous submits that the GPU is still busy
> > executing.  Which predictably goes rather badly.
> >
> > Instead, just skip flushing (updating WPTR) and reset ring->next back to
> > where it was before we tried writing the submit into the ringbuffer, and
> > return an error to userspace (which can then try again).
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Rob, you've posted this patch, but never merged it. Should it be merged
> at some point?

I think it is a bit less needed now, since drm/sched will limit the #
of in-flight submits (when I sent that patch, it was before conversion
to use drm/sched)

With a bit more locking re-work we could do something more clever like
just blocking until there is space in the ringbuffer.. but aren't
there quite yet.

BR,
-R

>
> > ---
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  3 +++
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++-
> >   drivers/gpu/drm/msm/msm_gem_submit.c    |  7 +++++-
> >   drivers/gpu/drm/msm/msm_gpu.c           | 33 +++++++++++++++++++++++--
> >   drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h    |  5 ++++
> >   7 files changed, 72 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index ce13d49e615b..0c8faad3b328 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -36,6 +36,9 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >               OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
> >       }
> >
> > +     if (unlikely(ring->overflow))
> > +             return;
> > +
> >       spin_lock_irqsave(&ring->preempt_lock, flags);
> >
> >       /* Copy the shadow to the actual register */
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index d553f62f4eeb..4a4728a774c0 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -68,6 +68,9 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> >               OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
> >       }
> >
> > +     if (unlikely(ring->overflow))
> > +             return;
> > +
> >       spin_lock_irqsave(&ring->preempt_lock, flags);
> >
> >       /* Copy the shadow to the actual register */
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 0f184c3dd9d9..a658777e07b1 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -467,6 +467,9 @@ void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, u32 reg)
> >   {
> >       uint32_t wptr;
> >
> > +     if (unlikely(ring->overflow))
> > +             return;
> > +
> >       /* Copy the shadow to the actual register */
> >       ring->cur = ring->next;
> >
> > @@ -788,12 +791,31 @@ static uint32_t ring_freewords(struct msm_ringbuffer *ring)
> >       return (rptr + (size - 1) - wptr) % size;
> >   }
> >
> > +static bool space_avail(struct msm_ringbuffer *ring, uint32_t ndwords)
> > +{
> > +     if (ring_freewords(ring) >= ndwords)
> > +             return true;
> > +
> > +     /* We don't have a good way to know in general when the RPTR has
> > +      * advanced.. newer things that use CP_WHERE_AM_I to update the
> > +      * shadow rptr could possibly insert a packet to generate an irq.
> > +      * But that doesn't cover older GPUs.  But if the ringbuffer is
> > +      * full, it could take a while before it is empty again, so just
> > +      * insert a blind sleep to avoid a busy loop.
> > +      */
> > +     msleep(1);
> > +
> > +     return false;
> > +}
> > +
> >   void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
> >   {
> > -     if (spin_until(ring_freewords(ring) >= ndwords))
> > +     if (spin_until(space_avail(ring, ndwords))) {
> >               DRM_DEV_ERROR(ring->gpu->dev->dev,
> >                       "timeout waiting for space in ringbuffer %d\n",
> >                       ring->id);
> > +             ring->overflow = true;
> > +     }
> >   }
> >
> >   /* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 5480852bdeda..4bc669460fda 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -683,6 +683,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       submitid = atomic_inc_return(&ident) - 1;
> >
> >       ring = gpu->rb[queue->prio];
> > +
> > +     GEM_WARN_ON(ring->overflow);
> > +
> >       trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
> >               args->nr_bos, args->nr_cmds);
> >
> > @@ -829,7 +832,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >               }
> >       }
> >
> > -     msm_gpu_submit(gpu, submit);
> > +     ret = msm_gpu_submit(gpu, submit);
> > +     if (ret)
> > +             goto out;
> >
> >       args->fence = submit->fence->seqno;
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index ab7c167b0623..7655ad9108c8 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -787,7 +787,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
> >   }
> >
> >   /* add bo's to gpu's ring, and kick gpu: */
> > -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > +int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >   {
> >       struct drm_device *dev = gpu->dev;
> >       struct msm_drm_private *priv = dev->dev_private;
> > @@ -834,9 +834,38 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >       spin_unlock(&ring->submit_lock);
> >
> >       gpu->funcs->submit(gpu, submit);
> > -     priv->lastctx = submit->queue->ctx;
> >
> >       hangcheck_timer_reset(gpu);
> > +
> > +     if (unlikely(ring->overflow)) {
> > +             /*
> > +              * Reset the ptr back to before the submit, so the GPU
> > +              * doesn't see a partial submit:
> > +              */
> > +             ring->next = ring->cur;
> > +
> > +             /*
> > +              * Clear the overflow flag, hopefully the next submit on
> > +              * the ring actually fits
> > +              */
> > +             ring->overflow = false;
> > +
> > +             /*
> > +              * One might be tempted to remove the submit from the
> > +              * submits list, and drop it's reference (and drop the
> > +              * active reference for all the bos).  But we can't
> > +              * really signal the fence attached to obj->resv without
> > +              * disturbing other fences on the timeline.  So instead
> > +              * just leave it and let it retire normally when a
> > +              * later submit completes.
> > +              */
> > +
> > +             return -ENOSPC;
> > +     }
> > +
> > +     priv->lastctx = submit->queue->ctx;
> > +
> > +     return 0;
> >   }
> >
> >   /*
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index d7cd02cd2109..2dd2ef1f8328 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -302,7 +302,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
> >               uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
> >
> >   void msm_gpu_retire(struct msm_gpu *gpu);
> > -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
> > +int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
> >
> >   int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >               struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > index fe55d4a1aa16..d8ad9818c389 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -40,6 +40,8 @@ struct msm_ringbuffer {
> >       struct drm_gem_object *bo;
> >       uint32_t *start, *end, *cur, *next;
> >
> > +     bool overflow;
> > +
> >       /*
> >        * List of in-flight submits on this ring.  Protected by submit_lock.
> >        */
> > @@ -69,6 +71,9 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring);
> >   static inline void
> >   OUT_RING(struct msm_ringbuffer *ring, uint32_t data)
> >   {
> > +     if (ring->overflow)
> > +             return;
> > +
> >       /*
> >        * ring->next points to the current command being written - it won't be
> >        * committed as ring->cur until the flush
> >
>
>
> --
> With best wishes
> Dmitry
