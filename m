Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD804EB891
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 04:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6FD10E49C;
	Wed, 30 Mar 2022 02:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E758410E2E4;
 Wed, 30 Mar 2022 02:57:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u3so27355025wrg.3;
 Tue, 29 Mar 2022 19:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H5pCMOStN2vZePv5vrsJBjBFHU4dBOm5rohHS7DHSKo=;
 b=kBgpUZR2OsU47SDSTrmD9GkEw9wITyiVoBxHSsURPq6BQ8AgErCOkYFC8XPBE3jii4
 DQyVglEUjC8O3CF1UznGhIujoyTQEZwszTwas9yg486iyGToOcKeYzE4Z6H3sC4okbG2
 GvB9uT7tJcQpDDc0ai15Jd0ngE9UsUYMow/hdVQL1VvGPWQCFjfilMztO9ikYPaK01ET
 zKiGmhC6NAqV/ajXqqHoFsp1Sc8dcOHVJUauvNP845X6gEci1Mp2TAn1yTG0m+b8tkKt
 li4p4fjmhUTp3rQ/POxMmFpCGT7mo3Lvw5i79+oHtTHEU7EQRty+uowHfJ/BUxo+HZL4
 DGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5pCMOStN2vZePv5vrsJBjBFHU4dBOm5rohHS7DHSKo=;
 b=c2lYbjFm7UxdDvE5+faghQqSFJ6au5Hnm6SNtlL7Sk2AXMWtDkc+kofZV+r+k3szaT
 RKA/8VhNt1dFM+JAbgP/YwbHLc3bnRUwIi3Q4m0NIhYiF+ROQYtClBnJg68cCOE93AW8
 QN+UxhMtp3intZCJadv0j49EY11yyTcKGOS02bTLgCedFNS0Pp9uMwxZJjJtvHBwWAux
 QtZ9+dClNsjYa7oWx4/rJ57eiEvUGcxuvrUMm0xjtfJ4J+nYHBpZd0hgNqQKIpNoSFTQ
 OrkzRqPS7w8J+hEkKUruOwu3XLWfyf3kC9vDcAYGFtUmTVOgnsmnYu85gfZaluM7lxYm
 1qWQ==
X-Gm-Message-State: AOAM533FZ58UbjazdtlJYZ0buBlXfvjjzOnvd5npEI4ResunJGrdwqpS
 MRY4ipGuf4+tK62qEp/bI1OTC4Kkmhq51+40Q2k=
X-Google-Smtp-Source: ABdhPJwQ7AO9z0QHc10X1FJLzOlUZRQ7ha5VxhV+IfN1ZH6G1jkeV1VAl2l4G6ttc5FDi0g+rWfQ4U6JljQjCbbhTYw=
X-Received: by 2002:adf:f20f:0:b0:203:fc73:a9a0 with SMTP id
 p15-20020adff20f000000b00203fc73a9a0mr34859358wro.418.1648609049190; Tue, 29
 Mar 2022 19:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-10-robdclark@gmail.com>
 <CAA8EJpqHCfLLKHzA8jTmLhdJCne31eWYqKjXBtTDGko3CF1_Hg@mail.gmail.com>
In-Reply-To: <CAA8EJpqHCfLLKHzA8jTmLhdJCne31eWYqKjXBtTDGko3CF1_Hg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Mar 2022 19:58:20 -0700
Message-ID: <CAF6AEGtDfVHFArYHJ61sWK3ybV6xX-x9p=z=f-EP4NZBRLOPZg@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/msm: Add a way for userspace to allocate GPU iova
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 4:42 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The motivation at this point is mainly native userspace mesa driver in a
> > VM guest.  The one remaining synchronous "hotpath" is buffer allocation,
> > because guest needs to wait to know the bo's iova before it can start
> > emitting cmdstream/state that references the new bo.  By allocating the
> > iova in the guest userspace, we no longer need to wait for a response
> > from the host, but can just rely on the allocation request being
> > processed before the cmdstream submission.  Allocation faulures (OoM,
>
> failures
>
> > etc) would just be treated as context-lost (ie. GL_GUILTY_CONTEXT_RESET)
> > or subsequent allocations (or readpix, etc) can raise GL_OUT_OF_MEMORY.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor nits (above and below).
>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++
> >  drivers/gpu/drm/msm/msm_drv.c           | 21 +++++++++++
> >  drivers/gpu/drm/msm/msm_gem.c           | 48 +++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem.h           |  8 +++++
> >  drivers/gpu/drm/msm/msm_gem_vma.c       |  2 ++
> >  include/uapi/drm/msm_drm.h              |  3 ++
> >  6 files changed, 92 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 6385ab06632f..4caae0229518 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -281,6 +281,16 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> >         case MSM_PARAM_SUSPENDS:
> >                 *value = gpu->suspend_count;
> >                 return 0;
> > +       case MSM_PARAM_VA_START:
> > +               if (ctx->aspace == gpu->aspace)
> > +                       return -EINVAL;
> > +               *value = ctx->aspace->va_start;
> > +               return 0;
> > +       case MSM_PARAM_VA_SIZE:
> > +               if (ctx->aspace == gpu->aspace)
> > +                       return -EINVAL;
> > +               *value = ctx->aspace->va_size;
> > +               return 0;
> >         default:
> >                 DBG("%s: invalid param: %u", gpu->name, param);
> >                 return -EINVAL;
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index a5eed5738ac8..7394312cf075 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -719,6 +719,23 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
> >         return msm_gem_get_iova(obj, ctx->aspace, iova);
> >  }
> >
> > +static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
> > +               struct drm_file *file, struct drm_gem_object *obj,
> > +               uint64_t iova)
> > +{
> > +       struct msm_drm_private *priv = dev->dev_private;
> > +       struct msm_file_private *ctx = file->driver_priv;
> > +
> > +       if (!priv->gpu)
> > +               return -EINVAL;
> > +
> > +       /* Only supported if per-process address space is supported: */
> > +       if (priv->gpu->aspace == ctx->aspace)
> > +               return -EINVAL;
> > +
> > +       return msm_gem_set_iova(obj, ctx->aspace, iova);
> > +}
> > +
> >  static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> >                 struct drm_file *file)
> >  {
> > @@ -733,6 +750,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> >         switch (args->info) {
> >         case MSM_INFO_GET_OFFSET:
> >         case MSM_INFO_GET_IOVA:
> > +       case MSM_INFO_SET_IOVA:
> >                 /* value returned as immediate, not pointer, so len==0: */
> >                 if (args->len)
> >                         return -EINVAL;
> > @@ -757,6 +775,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> >         case MSM_INFO_GET_IOVA:
> >                 ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
> >                 break;
> > +       case MSM_INFO_SET_IOVA:
> > +               ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
> > +               break;
> >         case MSM_INFO_SET_NAME:
> >                 /* length check should leave room for terminating null: */
> >                 if (args->len >= sizeof(msm_obj->name)) {
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index bf4af17e2f1e..3122ba308f31 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -525,6 +525,54 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
> >         return ret;
> >  }
> >
> > +static int clear_iova(struct drm_gem_object *obj,
> > +                     struct msm_gem_address_space *aspace)
> > +{
> > +       struct msm_gem_vma *vma = lookup_vma(obj, aspace);
> > +
> > +       if (!vma)
> > +               return 0;
> > +
> > +       if (vma->inuse)
>
> msm_gem_vma_inuse() ?

Ahh, right, this was the exact motivation for msm_gem_vma_inuse() and
ofc I miss it while rebasing ;-)

And -EOPNOTSUPP elsewhere is a good idea.. I've fixed both locally,
and the commit msg.  Thanks!

BR,
-R

> > +               return -EBUSY;
> > +
> > +       msm_gem_purge_vma(vma->aspace, vma);
> > +       msm_gem_close_vma(vma->aspace, vma);
> > +       del_vma(vma);
> > +
> > +       return 0;
> > +}
> > +
> > +/*
> > + * Get the requested iova but don't pin it.  Fails if the requested iova is
> > + * not available.  Doesn't need a put because iovas are currently valid for
> > + * the life of the object.
> > + *
> > + * Setting an iova of zero will clear the vma.
> > + */
> > +int msm_gem_set_iova(struct drm_gem_object *obj,
> > +                    struct msm_gem_address_space *aspace, uint64_t iova)
> > +{
> > +       int ret = 0;
> > +
> > +       msm_gem_lock(obj);
> > +       if (!iova) {
> > +               ret = clear_iova(obj, aspace);
> > +       } else {
> > +               struct msm_gem_vma *vma;
> > +               vma = get_vma_locked(obj, aspace, iova, iova + obj->size);
> > +               if (IS_ERR(vma)) {
> > +                       ret = PTR_ERR(vma);
> > +               } else if (GEM_WARN_ON(vma->iova != iova)) {
> > +                       clear_iova(obj, aspace);
> > +                       ret = -ENOSPC;
> > +               }
> > +       }
> > +       msm_gem_unlock(obj);
> > +
> > +       return ret;
> > +}
> > +
> >  /*
> >   * Unpin a iova by updating the reference counts. The memory isn't actually
> >   * purged until something else (shrinker, mm_notifier, destroy, etc) decides
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index 38d66e1248b1..efa2e5c19f1e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -38,6 +38,12 @@ struct msm_gem_address_space {
> >
> >         /* @faults: the number of GPU hangs associated with this address space */
> >         int faults;
> > +
> > +       /** @va_start: lowest possible address to allocate */
> > +       uint64_t va_start;
> > +
> > +       /** @va_size: the size of the address space (in bytes) */
> > +       uint64_t va_size;
> >  };
> >
> >  struct msm_gem_address_space *
> > @@ -144,6 +150,8 @@ struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
> >                                            struct msm_gem_address_space *aspace);
> >  int msm_gem_get_iova(struct drm_gem_object *obj,
> >                 struct msm_gem_address_space *aspace, uint64_t *iova);
> > +int msm_gem_set_iova(struct drm_gem_object *obj,
> > +               struct msm_gem_address_space *aspace, uint64_t iova);
> >  int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
> >                 struct msm_gem_address_space *aspace, uint64_t *iova,
> >                 u64 range_start, u64 range_end);
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > index 6f9a402450f9..354f91aff573 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -182,6 +182,8 @@ msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
> >         spin_lock_init(&aspace->lock);
> >         aspace->name = name;
> >         aspace->mmu = mmu;
> > +       aspace->va_start = va_start;
> > +       aspace->va_size  = size;
> >
> >         drm_mm_init(&aspace->mm, va_start, size);
> >
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 794ad1948497..3c7b097c4e3d 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -84,6 +84,8 @@ struct drm_msm_timespec {
> >  #define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
> >  #define MSM_PARAM_COMM       0x0c  /* WO: override for task->comm */
> >  #define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
> > +#define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
> > +#define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
> >
> >  /* For backwards compat.  The original support for preemption was based on
> >   * a single ring per priority level so # of priority levels equals the #
> > @@ -135,6 +137,7 @@ struct drm_msm_gem_new {
> >  #define MSM_INFO_GET_IOVA      0x01   /* get iova, returned by value */
> >  #define MSM_INFO_SET_NAME      0x02   /* set the debug name (by pointer) */
> >  #define MSM_INFO_GET_NAME      0x03   /* get debug name, returned by pointer */
> > +#define MSM_INFO_SET_IOVA      0x04   /* set the iova, passed by value */
> >
> >  struct drm_msm_gem_info {
> >         __u32 handle;         /* in */
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
