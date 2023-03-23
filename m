Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602916C6A0B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423A610EA9E;
	Thu, 23 Mar 2023 13:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB2110EA9E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:54:17 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 14-20020a9d010e000000b0069f1287f557so7784395otu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679579656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjOvv/ZPDbSli/SQ67teItUX/ZV6UdqvrawXfnsTP9c=;
 b=fABtsO48pFpSWP4FcJ3dhrQvnIbnb6omivu7xuuBdoBA4dAX6OWqKUf4WBRar8getR
 uUDMYAy1h2w23MXumxi25yo+48vMiJEIn5x8S1NDp366vvkhUGWs+owx8UORr2HoHxlB
 ykH2TgdVhWu5Fksfm3zSNiK49GwWe2X3eh6MX118M+k0gIdAaLNdDqMqn75WkLB4TfR0
 r9/ieRqMhlAB9Kw0+rhmW7lPPju/rMRdNh0TgpA3bu3aA0pl3Qbg/wT4E4pMSI3LEu2y
 yN7mf0oNFNDE0wW+qiibGf6aTFeFcMYFoCHx22IFdOen1v8Yj2+ioZPS7pS0fo1NhOXY
 mGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjOvv/ZPDbSli/SQ67teItUX/ZV6UdqvrawXfnsTP9c=;
 b=trZUWOoWWLawXzm1JA4KXx1AUjrPaUOY5P+sNT91apSEwWLpSPjPBnSdIcCOCp02dl
 imZdYPLi8xy4zcT/WPNMaBu4OKihKb1VuMInK99BcvpvIlAMxDxPBJta3cp96HdFuYi2
 kaXWX0zh/ujnYVtxP9Z43RTFhRaDbouJN1kOVOASIODPLl8EM0Z5ggRP00uTMTAREe/D
 LGRxNozK35BEKcqHw2ZibtjlYqKRkqS4fb2uvr+pxVq/LJ7i1FDVwGOs+iMKwP146k7m
 7Cmn2V2zdnn9LUGHpHBHUBXda5l0w5H60BnqdYz1EDrgPVuzfJD+V8C19te8dtpO4lPG
 jfKg==
X-Gm-Message-State: AO0yUKWO2f/aeSXIY8eJi3vZrBx25a/JbjScFmb7UYnUpwySsEjeBmzM
 g8jV3Z6hZLkaQVjJ1caLS/cmFRHPCd2fZbDD8Uo=
X-Google-Smtp-Source: AK7set+pjqtGtPO6GLHBGh9hBOwDRWaRvZoOvDszymMlwhM38Q5UfQVowYMdv7Wz5SBe768rCFIMjR8hTTsUyroJSF4=
X-Received: by 2002:a05:6830:1483:b0:68b:cd1e:1ef1 with SMTP id
 s3-20020a056830148300b0068bcd1e1ef1mr2274617otq.7.1679579656288; Thu, 23 Mar
 2023 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
In-Reply-To: <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 23 Mar 2023 06:54:05 -0700
Message-ID: <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.03.23 um 23:44 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Container fences have burner contexts, which makes the trick to store a=
t
> > most one fence per context somewhat useless if we don't unwrap array or
> > chain fences.
>
> Mhm, we intentionally kept them not unwrapped since this way they only
> occupy one fence slot.
>
> But it might be better to unwrap them if you add many of those dependenci=
es.
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > tbh, I'm not sure why we weren't doing this already, unless there is
> > something I'm overlooking
> >
> >   drivers/gpu/drm/scheduler/sched_main.c | 43 +++++++++++++++++--------=
-
> >   1 file changed, 28 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index c2ee44d6224b..f59e5335afbb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -41,20 +41,21 @@
> >    * 4. Entities themselves maintain a queue of jobs that will be sched=
uled on
> >    *    the hardware.
> >    *
> >    * The jobs in a entity are always scheduled in the order that they w=
ere pushed.
> >    */
> >
> >   #include <linux/kthread.h>
> >   #include <linux/wait.h>
> >   #include <linux/sched.h>
> >   #include <linux/completion.h>
> > +#include <linux/dma-fence-unwrap.h>
> >   #include <linux/dma-resv.h>
> >   #include <uapi/linux/sched/types.h>
> >
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_gem.h>
> >   #include <drm/gpu_scheduler.h>
> >   #include <drm/spsc_queue.h>
> >
> >   #define CREATE_TRACE_POINTS
> >   #include "gpu_scheduler_trace.h"
> > @@ -665,41 +666,27 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >       sched =3D entity->rq->sched;
> >
> >       job->sched =3D sched;
> >       job->s_priority =3D entity->rq - sched->sched_rq;
> >       job->id =3D atomic64_inc_return(&sched->job_id_count);
> >
> >       drm_sched_fence_init(job->s_fence, job->entity);
> >   }
> >   EXPORT_SYMBOL(drm_sched_job_arm);
> >
> > -/**
> > - * drm_sched_job_add_dependency - adds the fence as a job dependency
> > - * @job: scheduler job to add the dependencies to
> > - * @fence: the dma_fence to add to the list of dependencies.
> > - *
> > - * Note that @fence is consumed in both the success and error cases.
> > - *
> > - * Returns:
> > - * 0 on success, or an error on failing to expand the array.
> > - */
> > -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > -                              struct dma_fence *fence)
> > +static int _add_dependency(struct drm_sched_job *job, struct dma_fence=
 *fence)
>
> Please keep the drm_sched_job_ prefix here even for static functions.
> The symbol _add_dependency just sucks in a backtrace, especially when
> it's tail optimized.
>
> >   {
> >       struct dma_fence *entry;
> >       unsigned long index;
> >       u32 id =3D 0;
> >       int ret;
> >
> > -     if (!fence)
> > -             return 0;
> > -
> >       /* Deduplicate if we already depend on a fence from the same cont=
ext.
> >        * This lets the size of the array of deps scale with the number =
of
> >        * engines involved, rather than the number of BOs.
> >        */
> >       xa_for_each(&job->dependencies, index, entry) {
> >               if (entry->context !=3D fence->context)
> >                       continue;
> >
> >               if (dma_fence_is_later(fence, entry)) {
> >                       dma_fence_put(entry);
> > @@ -709,20 +696,46 @@ int drm_sched_job_add_dependency(struct drm_sched=
_job *job,
> >               }
> >               return 0;
> >       }
> >
> >       ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GF=
P_KERNEL);
> >       if (ret !=3D 0)
> >               dma_fence_put(fence);
> >
> >       return ret;
> >   }
> > +
> > +/**
> > + * drm_sched_job_add_dependency - adds the fence as a job dependency
> > + * @job: scheduler job to add the dependencies to
> > + * @fence: the dma_fence to add to the list of dependencies.
> > + *
> > + * Note that @fence is consumed in both the success and error cases.
> > + *
> > + * Returns:
> > + * 0 on success, or an error on failing to expand the array.
> > + */
> > +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > +                              struct dma_fence *fence)
>
> Maybe name the new function drm_sched_job_unwrap_add_dependency or
> something like this.
>
> I need to double check, but I think for some cases we don't need or
> don't even want this in the driver.

I'd be curious to know the cases where you don't want this.. one thing
I was thinking about, what if you have a container fence with two
contained fences.  One is on the same ctx as the job, one is not but
signals sooner.  You end up artificially waiting on both, which seems
sub-optimal.

Anyways, I can make this a new entrypoint which unwraps, and/or rename
the internal static function, if we think this is a good idea.

BR,
-R

> Christian.
>
> > +{
> > +     struct dma_fence_unwrap iter;
> > +     struct dma_fence *f;
> > +     int ret =3D 0;
> > +
> > +     dma_fence_unwrap_for_each (f, &iter, fence) {
> > +             ret =3D _add_dependency(job, f);
> > +             if (ret)
> > +                     break;
> > +     }
> > +
> > +     return ret;
> > +}
> >   EXPORT_SYMBOL(drm_sched_job_add_dependency);
> >
> >   /**
> >    * drm_sched_job_add_resv_dependencies - add all fences from the resv=
 to the job
> >    * @job: scheduler job to add the dependencies to
> >    * @resv: the dma_resv object to get the fences from
> >    * @usage: the dma_resv_usage to use to filter the fences
> >    *
> >    * This adds all fences matching the given usage from @resv to @job.
> >    * Must be called with the @resv lock held.
>
