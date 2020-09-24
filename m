Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71858276663
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 04:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563936EA55;
	Thu, 24 Sep 2020 02:29:31 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5EA6EA55
 for <dri-devel@freedesktop.org>; Thu, 24 Sep 2020 02:29:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so1990040wrn.13
 for <dri-devel@freedesktop.org>; Wed, 23 Sep 2020 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LmgnskKNdRwe1qMZiFFEjTpDq5C71vnbi9wDTaf6LeQ=;
 b=AIX/e+6ZaAmWlWsJjmnct4HwhoY/jjEdZVhwWwSbA5B4Drk//ccsh6V30yNcRItNLy
 micW54cd0LeJXdNQ0waKSVXr36c0LL5HVXya0nXmQggKaUC+8YsJ3oWjC/dEbBDbvl1h
 kCpZlZP8+gd3z/A6o4B5qBfR5DNO8H4mECAGCdgmslRqm4tI29nZO+Rt/5aQk4kLRxqV
 9vtRiRUgn9UnnxvLgLh7VYDe1Awv1Qynyi7/dzEpfwcHillGUvxWQpMCytYpbUZsT4ap
 IwtUXWZFfPjJP34wE7TCCfmxvcUwDC3xB8XhCWIs1wAxWsMQzu97KIqly05RmYD503aU
 +Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmgnskKNdRwe1qMZiFFEjTpDq5C71vnbi9wDTaf6LeQ=;
 b=lWDTYGr5EBAgvOB4gHmrENiOlQsmCARASf5+Yvd8o7w3tUxzOV/i2mkx05Uu3rPMiS
 ikzpm7hIDtJbz11xnEGBplh2pcB8N4D5l4C/j+igjlpg7NIEFxjWwPzjwvdEpHx2wErh
 Pt2qopAukGzM73i98kNQ/zJaIbE8AP1y2R0l+GuD21LaB4cxVUX0RdkCTQRSRg8hAcBC
 Y9DrBAx7Elhrn8mkY/N2PEOUxlpcvi2LOWQwOdQ3oNGJo2205Dbs9Do1/BsHukGgKYx5
 M8fQ/5yWsIinD44aFR1SLKZt2THrbvGcIlfOI7O12IOlECOVjuonHXiocdu/2QrYRisu
 JIFg==
X-Gm-Message-State: AOAM533m/ydEw2fcSPJSHevAuhFKOtJSi+ml3j7HS59/wD7srGItpc15
 0qOmDpzK1WYioeHDFVcjkwXAImY/NF0E+f1nbGA=
X-Google-Smtp-Source: ABdhPJxpETAyf8GANMGmvUcaximmB2hVNwam1RsIPn05W2wNiL2ekIeh8YoLaFtl0uLCB+H2VgDcF9RKQgpd9Ingb58=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr2320238wrm.147.1600914568494; 
 Wed, 23 Sep 2020 19:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
 <20200923145047.GB31425@jcrouse1-lnx.qualcomm.com>
 <df7a93b7-240f-bb52-9e3c-eeb346a4574e@codeaurora.org>
In-Reply-To: <df7a93b7-240f-bb52-9e3c-eeb346a4574e@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Sep 2020 19:29:17 -0700
Message-ID: <CAF6AEGsfrjOH4ZGga6Tg706vRwJohU97gV7eVML2i3DSDD8tXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: Fix premature purging of BO
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Jonathan <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 11:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 9/23/2020 8:20 PM, Jordan Crouse wrote:
> > On Tue, Sep 22, 2020 at 08:25:26PM +0530, Akhil P Oommen wrote:
> >> In the case where we have a back-to-back submission that shares the same
> >> BO, this BO will be prematurely moved to inactive_list while retiring the
> >> first submit. But it will be still part of the second submit which is
> >> being processed by the GPU. Now, if the shrinker happens to be triggered at
> >> this point, it will result in a premature purging of this BO.
> >>
> >> To fix this, we need to refcount BO while doing submit and retire. Then,
> >> it should be moved to inactive list when this refcount becomes 0.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> Changes in v2:
> >>      1. Keep Active List around
> >>      2. Put back the deleted WARN_ON
> >>
> >>   drivers/gpu/drm/msm/msm_drv.h |  5 ++---
> >>   drivers/gpu/drm/msm/msm_gem.c | 32 ++++++++++++++++----------------
> >>   drivers/gpu/drm/msm/msm_gem.h |  4 +++-
> >>   drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
> >>   4 files changed, 28 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> >> index 3193274..28e3c8d 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
> >>   int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
> >>   int msm_gem_sync_object(struct drm_gem_object *obj,
> >>              struct msm_fence_context *fctx, bool exclusive);
> >> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> >> -            struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
> >> -void msm_gem_move_to_inactive(struct drm_gem_object *obj);
> >> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
> >> +void msm_gem_active_put(struct drm_gem_object *obj);
> >>   int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
> >>   int msm_gem_cpu_fini(struct drm_gem_object *obj);
> >>   void msm_gem_free_object(struct drm_gem_object *obj);
> >> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> >> index 76a6c52..14e14ca 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem.c
> >> +++ b/drivers/gpu/drm/msm/msm_gem.c
> >> @@ -743,31 +743,31 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
> >>      return 0;
> >>   }
> >>
> >> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> >> -            struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
> >> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
> >>   {
> >>      struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >> +    WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> >>      WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
> >> -    msm_obj->gpu = gpu;
> >> -    if (exclusive)
> >> -            dma_resv_add_excl_fence(obj->resv, fence);
> >> -    else
> >> -            dma_resv_add_shared_fence(obj->resv, fence);
> >> -    list_del_init(&msm_obj->mm_list);
> >> -    list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> >> +
> >> +    if (!atomic_fetch_inc(&msm_obj->active_count)) {
> >> +            msm_obj->gpu = gpu;
> >> +            list_del_init(&msm_obj->mm_list);
> >> +            list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> >> +    }
> >
> > I'm not sure if all the renaming and reorganization are really needed here -
> > this is the meat of the change and it would have fit in reasonably well with the
> > existing function design.
> This happened due to the way I implemented the v1 patch. In the
> hindsight, I think you are right.
>

fwiw, I'd already pushed v2 to msm-next.. I guess it could have been a
smaller diff-stat, but I don't really object to the other changes
(which were replacing things that were already a result of how things
had previously evolved)

BR,
-R

> Akhil.
> >
> >>   }
> >>
> >> -void msm_gem_move_to_inactive(struct drm_gem_object *obj)
> >> +void msm_gem_active_put(struct drm_gem_object *obj)
> >>   {
> >> -    struct drm_device *dev = obj->dev;
> >> -    struct msm_drm_private *priv = dev->dev_private;
> >>      struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >> +    struct msm_drm_private *priv = obj->dev->dev_private;
> >>
> >> -    WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> >> +    WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> >>
> >> -    msm_obj->gpu = NULL;
> >> -    list_del_init(&msm_obj->mm_list);
> >> -    list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> >> +    if (!atomic_dec_return(&msm_obj->active_count)) {
> >> +            msm_obj->gpu = NULL;
> >> +            list_del_init(&msm_obj->mm_list);
> >> +            list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> >> +    }
> >
> > Same.
> >
> > Jordan
> >>   }
> >>
> >>   int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
> >> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> >> index 7b1c7a5..a1bf741 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem.h
> >> +++ b/drivers/gpu/drm/msm/msm_gem.h
> >> @@ -88,12 +88,14 @@ struct msm_gem_object {
> >>      struct mutex lock; /* Protects resources associated with bo */
> >>
> >>      char name[32]; /* Identifier to print for the debugfs files */
> >> +
> >> +    atomic_t active_count;
> >>   };
> >>   #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
> >>
> >>   static inline bool is_active(struct msm_gem_object *msm_obj)
> >>   {
> >> -    return msm_obj->gpu != NULL;
> >> +    return atomic_read(&msm_obj->active_count);
> >>   }
> >>
> >>   static inline bool is_purgeable(struct msm_gem_object *msm_obj)
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> >> index 29c8d73c..55d1648 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >>
> >>      for (i = 0; i < submit->nr_bos; i++) {
> >>              struct msm_gem_object *msm_obj = submit->bos[i].obj;
> >> -            /* move to inactive: */
> >> -            msm_gem_move_to_inactive(&msm_obj->base);
> >> +
> >> +            msm_gem_active_put(&msm_obj->base);
> >>              msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> >>              drm_gem_object_put_locked(&msm_obj->base);
> >>      }
> >> @@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >>
> >>      for (i = 0; i < submit->nr_bos; i++) {
> >>              struct msm_gem_object *msm_obj = submit->bos[i].obj;
> >> +            struct drm_gem_object *drm_obj = &msm_obj->base;
> >>              uint64_t iova;
> >>
> >>              /* can't happen yet.. but when we add 2d support we'll have
> >> @@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >>              msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
> >>
> >>              if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
> >> -                    msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
> >> +                    dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
> >>              else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
> >> -                    msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
> >> +                    dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
> >> +
> >> +            msm_gem_active_get(drm_obj, gpu);
> >>      }
> >>
> >>      gpu->funcs->submit(gpu, submit);
> >> --
> >> 2.7.4
> >>
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
