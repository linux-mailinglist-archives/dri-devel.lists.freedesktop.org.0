Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC786135105
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 02:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463708977A;
	Thu,  9 Jan 2020 01:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9352E8977A;
 Thu,  9 Jan 2020 01:40:25 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 73so1912239uac.6;
 Wed, 08 Jan 2020 17:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EXrOHI0rPi3ZuFPJIqyUf/PJTOpSTIQdBQ/2r/kzMwo=;
 b=bKMI1HCaU2aPP+HPH9FRI8agfIif+v7ZyaKNB46GnyGAQttH1fg9FDzyE4sjTs+8Pj
 kwCSDlEMf3R4OqzNN7EHF6fZeEyqAIMElLySHFAGqTp3IbFDoUbruRb6WcZuAx5ObnAD
 FRC2Vhlhzt71qwYaZSXWNXme8j4THRMynvCm4NaqRFHmM43yYGMhmn6uW20HQZYOY16C
 RfcGUvvn99hHFVjjKLlsZI4ZeCBodC9qLjI/qDmfT8sjztq/8R2Iv3zs9mcAOVK3EcoR
 WjlQ7nZ/pNCoqeK9EnfhEfWukIKq0+e5CQ7T+sfmms50UTQETaQWEmM1R0Ihtzglexe/
 +3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXrOHI0rPi3ZuFPJIqyUf/PJTOpSTIQdBQ/2r/kzMwo=;
 b=bxo82f/BhTe1qUvJqrN2o958kPpstHIPCFL8cXzSKBdTUvVKqzQe3Kh8cUNjFqKB26
 IFb6GIxeHB2WQTIwQ8zSbVvipot7I5lNIdQlSOS8xYH6zi4VPGsX9QI83lXVSXBjb5rv
 b2OWWbYM8erSSQmy51bytB7PVA8Ar97JwiadnYfoMUuFXZqb2EXHvESiAV4ec7Ngs/Tc
 vU3OZpKVe98OrBZH9dfBa8LdbSaHg4vD5XFeoodF1r1WXvuiILzdsgGYiHv1PpEjOlGW
 iUMwam1dNfcH9W0cHSWDXtu/1jSE45S7omWmJnujevG4rW0BD8z3AaKy9KHd4vTyOtWe
 v9GQ==
X-Gm-Message-State: APjAAAWuAsSde90o0fx9CM8J4Q597oRzDzkFMmAyLf/VYhr3gQunLJEM
 LXRLbMhnGCw4ZPKMIRnZMs7CfWMp6s2WO+Ojnu8=
X-Google-Smtp-Source: APXvYqzvB+b95+3JWVO62SMFVVGLGgxNF/YJsHgfb6+AEBjdvg0/Pq2CTTufrZnx9DxBwIaeWlB7oswcgC7ZYE061eA=
X-Received: by 2002:ab0:21cb:: with SMTP id u11mr5254404uan.16.1578534024595; 
 Wed, 08 Jan 2020 17:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20200101103831.22429-1-yuq825@gmail.com>
 <CA+E=qVfhNeHqSYrxD_v5pQ-kZZvM0xZp+5Tue_VOpn6yAhu7BQ@mail.gmail.com>
 <df5a905a-71e3-5553-f654-687ab6b3b146@imkreisrum.de>
In-Reply-To: <df5a905a-71e3-5553-f654-687ab6b3b146@imkreisrum.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 9 Jan 2020 09:40:11 +0800
Message-ID: <CAKGbVbtFDydpKJnXerP6u+VbhK_X=uYg2r=jwT50eQb=Puq0hw@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: use drm_sched_fault for error task handling
To: Andreas Baierl <list@imkreisrum.de>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, applied to drm-misc-next.

Regards,
Qiang

On Tue, Jan 7, 2020 at 4:16 PM Andreas Baierl <list@imkreisrum.de> wrote:
>
> Am 03.01.2020 um 06:46 schrieb Vasily Khoruzhick:
> > On Wed, Jan 1, 2020 at 2:39 AM Qiang Yu <yuq825@gmail.com> wrote:
> >> drm_sched_job_timedout works with drm_sched_stop as a pair,
> >> so we'd better use the drm_sched_fault helper to make the
> >> error and timeout handling go the same path.
> >>
> >> This also fixes application hang when task error.
> >>
> >> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > LGTM in general.
> >
> > Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >
> > Erico, Andreas, could you test this patch on actual hardware? I'll
> > have pretty limited access to the hardware for next few weeks, so I
> > won't be able to test it myself.
> I've tested that one on top of a recent kernel (3a562aee727a) on a
> Mali450/ Allwinner H5 device with deqp and got no regressions and kernel
> issues.
> So...
>
> Tested-by: Andreas Baierl <ichgeh@imkreisrum.de>
> >> ---
> >>   drivers/gpu/drm/lima/lima_sched.c | 35 ++++++++-----------------------
> >>   drivers/gpu/drm/lima/lima_sched.h |  2 --
> >>   2 files changed, 9 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> >> index f522c5f99729..a31a90c380b6 100644
> >> --- a/drivers/gpu/drm/lima/lima_sched.c
> >> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >> @@ -255,13 +255,17 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
> >>          return task->fence;
> >>   }
> >>
> >> -static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
> >> -                                        struct lima_sched_task *task)
> >> +static void lima_sched_timedout_job(struct drm_sched_job *job)
> >>   {
> >> +       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
> >> +       struct lima_sched_task *task = to_lima_task(job);
> >> +
> >> +       if (!pipe->error)
> >> +               DRM_ERROR("lima job timeout\n");
> >> +
> >>          drm_sched_stop(&pipe->base, &task->base);
> >>
> >> -       if (task)
> >> -               drm_sched_increase_karma(&task->base);
> >> +       drm_sched_increase_karma(&task->base);
> >>
> >>          pipe->task_error(pipe);
> >>
> >> @@ -284,16 +288,6 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
> >>          drm_sched_start(&pipe->base, true);
> >>   }
> >>
> >> -static void lima_sched_timedout_job(struct drm_sched_job *job)
> >> -{
> >> -       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
> >> -       struct lima_sched_task *task = to_lima_task(job);
> >> -
> >> -       DRM_ERROR("lima job timeout\n");
> >> -
> >> -       lima_sched_handle_error_task(pipe, task);
> >> -}
> >> -
> >>   static void lima_sched_free_job(struct drm_sched_job *job)
> >>   {
> >>          struct lima_sched_task *task = to_lima_task(job);
> >> @@ -318,15 +312,6 @@ static const struct drm_sched_backend_ops lima_sched_ops = {
> >>          .free_job = lima_sched_free_job,
> >>   };
> >>
> >> -static void lima_sched_error_work(struct work_struct *work)
> >> -{
> >> -       struct lima_sched_pipe *pipe =
> >> -               container_of(work, struct lima_sched_pipe, error_work);
> >> -       struct lima_sched_task *task = pipe->current_task;
> >> -
> >> -       lima_sched_handle_error_task(pipe, task);
> >> -}
> >> -
> >>   int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >>   {
> >>          unsigned int timeout = lima_sched_timeout_ms > 0 ?
> >> @@ -335,8 +320,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >>          pipe->fence_context = dma_fence_context_alloc(1);
> >>          spin_lock_init(&pipe->fence_lock);
> >>
> >> -       INIT_WORK(&pipe->error_work, lima_sched_error_work);
> >> -
> >>          return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
> >>                                msecs_to_jiffies(timeout), name);
> >>   }
> >> @@ -349,7 +332,7 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> >>   void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
> >>   {
> >>          if (pipe->error)
> >> -               schedule_work(&pipe->error_work);
> >> +               drm_sched_fault(&pipe->base);
> >>          else {
> >>                  struct lima_sched_task *task = pipe->current_task;
> >>
> >> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> >> index 928af91c1118..1d814fecbcc0 100644
> >> --- a/drivers/gpu/drm/lima/lima_sched.h
> >> +++ b/drivers/gpu/drm/lima/lima_sched.h
> >> @@ -68,8 +68,6 @@ struct lima_sched_pipe {
> >>          void (*task_fini)(struct lima_sched_pipe *pipe);
> >>          void (*task_error)(struct lima_sched_pipe *pipe);
> >>          void (*task_mmu_error)(struct lima_sched_pipe *pipe);
> >> -
> >> -       struct work_struct error_work;
> >>   };
> >>
> >>   int lima_sched_task_init(struct lima_sched_task *task,
> >> --
> >> 2.17.1
> >>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
