Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C08283C65
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 18:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C6A89F8B;
	Mon,  5 Oct 2020 16:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EE989F6F;
 Mon,  5 Oct 2020 16:24:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v12so128853wmh.3;
 Mon, 05 Oct 2020 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3LEkhDU/AA7cKTByH3jwjB8lRoYVe85vRMCYUQuKdc=;
 b=QDGSDu4Ud31DARFO1dQKQMWXJnPteQd9E/xuAhEadtVSggMAstcby7BQNO50LkRh5f
 Z2I7ZGCnqjXyBVmBL7eVlYfISlITAV8440LdqLxkP4XmlXjFq3eGFsUjsNLNnpZpIlOW
 EJYmHZTPkFTfePiuACLloBF3+cvPPqHTywpJFaeuj8biPiY//EmrW2mjuDo/Yhrf404w
 6OZrPvRrxgmoE0Nrdp7qEy5oINETZWIJ8NUeKs7O3IxqrycOCb4WuDhJFbhF9VNg11j+
 Reoj2894WwlMk6olxRMlWC1fLwfWif4xJ0NleqMAEi8mnGMMhCyFQqe/7OnK1JGiCrN3
 OyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3LEkhDU/AA7cKTByH3jwjB8lRoYVe85vRMCYUQuKdc=;
 b=KfWdoBQTRLI2fg0MCc/dGLMOEziE/oJiLNLTbRehN4mAPAhX75d6GZQg4RWjrNfWD9
 XdvaMM8kKMVNm65ooHgrO2BS1OPhGivx3zVcMpjSzHOVXToDdxtwlxb1umNuxDOA8p8n
 pSJLPeCyVqCZ+b5KUuEPYEAqG0GE7WEhbIXQajNR7i2cDJQHjHgFR176MZDC+fxJi+ld
 B9Pq4QVqFffzV03G/AB8GUNCz+RHc4Kz/lkwFlZ9toGhEoJXUytrX59i+ctXjhKp/ACZ
 zGXkBEjl/ycKoIAo3+U18QLXe8gEO/dvPmiPl45U88amec1NcQmz+sY5gaDfASCfSMUG
 VLIA==
X-Gm-Message-State: AOAM530gE+Kkc9/p+o9Bt0SkureugGeFN9eliayOx+4XiyCPihyzvSuA
 Vjr4AM/FMQnNPcZFXHf10/hsdiJJRQRK+AKunw0=
X-Google-Smtp-Source: ABdhPJzcFl9WBj+9j4/lo/FIpmhOymkhqiKIf/Bxco7QOQaiUanS83HNyElpQDXuT7nE1orpv8o8UcbDwXVnWvJISNE=
X-Received: by 2002:a1c:6488:: with SMTP id y130mr197295wmb.94.1601915084738; 
 Mon, 05 Oct 2020 09:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-8-robdclark@gmail.com>
 <20201005135602.GR438822@phenom.ffwll.local>
In-Reply-To: <20201005135602.GR438822@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Oct 2020 09:24:33 -0700
Message-ID: <CAF6AEGvp6wvGu-gdCGgAR7MbrZPw9uqHmweA4YE-eZUWbvFu=A@mail.gmail.com>
Subject: Re: [PATCH 07/14] drm/msm: Refcount submits
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 6:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 04, 2020 at 12:21:39PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Before we remove dev->struct_mutex from the retire path, we have to deal
> > with the situation of a submit retiring before the submit ioctl returns.
> >
> > To deal with this, ring->submits will hold a reference to the submit,
> > which is dropped when the submit is retired.  And the submit ioctl path
> > holds it's own ref, which it drops when it is done with the submit.
> >
> > Also, add to submit list *after* getting/pinning bo's, to prevent badness
> > in case the completed fence is corrupted, and retire_worker mistakenly
> > believes the submit is done too early.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Why not embed the dma_fence instead of pointer and use that refcount? i915
> does that, and imo kinda makes sense instead of more refcounted things.
> But might not make sense for msm.

I guess that might work.. the one thing I'd be concerned about is that
the submit (indirectly) holds reference to the file ctx, so userspace
keeping around a fence fd by mistake could keep a set of pgtables live
unnecessarily..  I suppose we could re-work where we drop that
reference.

six of one, half-dozen of the other, I guess

BR,
-R

> -Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.h        |  1 -
> >  drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
> >  drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
> >  4 files changed, 35 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 50978e5db376..535f9e718e2d 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
> >
> >  bool msm_use_mmu(struct drm_device *dev);
> >
> > -void msm_gem_submit_free(struct msm_gem_submit *submit);
> >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >               struct drm_file *file);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index a1bf741b9b89..e05b1530aca6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
> >   * lasts for the duration of the submit-ioctl.
> >   */
> >  struct msm_gem_submit {
> > +     struct kref ref;
> >       struct drm_device *dev;
> >       struct msm_gpu *gpu;
> >       struct msm_gem_address_space *aspace;
> > @@ -169,6 +170,18 @@ struct msm_gem_submit {
> >       } bos[];
> >  };
> >
> > +void __msm_gem_submit_destroy(struct kref *kref);
> > +
> > +static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
> > +{
> > +     kref_get(&submit->ref);
> > +}
> > +
> > +static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
> > +{
> > +     kref_put(&submit->ref, __msm_gem_submit_destroy);
> > +}
> > +
> >  /* helper to determine of a buffer in submit should be dumped, used for both
> >   * devcoredump and debugfs cmdstream dumping:
> >   */
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index e1d1f005b3d4..7d653bdc92dc 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >       if (!submit)
> >               return NULL;
> >
> > +     kref_init(&submit->ref);
> >       submit->dev = dev;
> >       submit->aspace = queue->ctx->aspace;
> >       submit->gpu = gpu;
> > @@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >       return submit;
> >  }
> >
> > -void msm_gem_submit_free(struct msm_gem_submit *submit)
> > +void __msm_gem_submit_destroy(struct kref *kref)
> >  {
> > +     struct msm_gem_submit *submit =
> > +                     container_of(kref, struct msm_gem_submit, ref);
> > +
> >       dma_fence_put(submit->fence);
> > -     spin_lock(&submit->ring->submit_lock);
> > -     list_del(&submit->node);
> > -     spin_unlock(&submit->ring->submit_lock);
> >       put_pid(submit->pid);
> >       msm_submitqueue_put(submit->queue);
> >
> > @@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       submit_cleanup(submit);
> >       if (has_ww_ticket)
> >               ww_acquire_fini(&submit->ticket);
> > -     if (ret)
> > -             msm_gem_submit_free(submit);
> > +     msm_gem_submit_put(submit);
> >  out_unlock:
> >       if (ret && (out_fence_fd >= 0))
> >               put_unused_fd(out_fence_fd);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 8d1e254f964a..fd3fc6f36ab1 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >
> >       pm_runtime_mark_last_busy(&gpu->pdev->dev);
> >       pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > -     msm_gem_submit_free(submit);
> > +
> > +     spin_lock(&ring->submit_lock);
> > +     list_del(&submit->node);
> > +     spin_unlock(&ring->submit_lock);
> > +
> > +     msm_gem_submit_put(submit);
> >  }
> >
> >  static void retire_submits(struct msm_gpu *gpu)
> > @@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >
> >       submit->seqno = ++ring->seqno;
> >
> > -     spin_lock(&ring->submit_lock);
> > -     list_add_tail(&submit->node, &ring->submits);
> > -     spin_unlock(&ring->submit_lock);
> > -
> >       msm_rd_dump_submit(priv->rd, submit, NULL);
> >
> >       update_sw_cntrs(gpu);
> > @@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >               msm_gem_active_get(drm_obj, gpu);
> >       }
> >
> > +     /*
> > +      * ring->submits holds a ref to the submit, to deal with the case
> > +      * that a submit completes before msm_ioctl_gem_submit() returns.
> > +      */
> > +     msm_gem_submit_get(submit);
> > +
> > +     spin_lock(&ring->submit_lock);
> > +     list_add_tail(&submit->node, &ring->submits);
> > +     spin_unlock(&ring->submit_lock);
> > +
> >       gpu->funcs->submit(gpu, submit);
> >       priv->lastctx = submit->queue->ctx;
> >
> > --
> > 2.26.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
