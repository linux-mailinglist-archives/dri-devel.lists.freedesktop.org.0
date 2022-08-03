Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBF589339
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 22:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6592B8B0;
	Wed,  3 Aug 2022 20:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266A618BFAA;
 Wed,  3 Aug 2022 20:28:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id x64so13781292iof.1;
 Wed, 03 Aug 2022 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qns3k2bMfWZ5++no4JhoINAIs2Mgvwk2maknIEZXZGA=;
 b=aEWJqLOnfAJre5C81Ylqs5yMywTkNY2DxE1pRS3Qa06+/3s5LtLaxsW7WkgO6B5/iM
 +6BWdNFChgc7bTjv3aUJZwTqbv0KgFnZFwS9WTQkvR4yi7GsiYdyQ3hplToWzIpt1xLl
 nKqSRu0Q+G1bONulaZMWnTzrfCqKqm1bjsfuB7HmTit/6A7yOCNnFyNCLWg9y07ZO4/J
 w7bMXsP5oQFM+/Jnwk7rvdi0mWNboq0GB1SXVeG5uMJ89rUXo9zV1ai9KmXDcQnc4P2J
 quCXLPa5enl2sXd9VRyx9l7hS16EtrjKd18Yvn92oBfx25bdm6+CG6rczOBbCrvgZb2e
 REZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qns3k2bMfWZ5++no4JhoINAIs2Mgvwk2maknIEZXZGA=;
 b=tUNp8nqcZLU0ibxKPJp7r3OkzqNrw7xsfpuCLumzz1a+gGkw/am7DVtb5AUKTa1Pyr
 RMsKudGeWISQ8KxdTBmBTWi72EbGVDwfN1f7XE6KUigUzZUyW03GQHCIi/fufiKWKmiG
 sgMdZE4ouXzemMRt6JCjrfgCatVTQqSHVy+WIw9ENGei0rvcNjmTjELBym9knxa/ATIQ
 i+mEMFKgBgJCNhl15/9+auW8WvVc/h0gluyFdpS0CR7XIyN07ZWV+0C6sOlmbM3iaKiR
 XdzoJQA4bTWbJcEq9js+N1MzkOkScFrVNWpVyjyxCyVk2taXMBUzKMLrPvuWmNR+jU11
 6KtQ==
X-Gm-Message-State: AJIora+Y/z+Wm8LlnGkkIUSw/JyXreevarN9MwMTEr+30fvSaCB/rrtk
 OmzkilRHfaQjqratxLMzv+wekPx6bxBAsPseRfU=
X-Google-Smtp-Source: AGRyM1uH9w+FBi6w0iZfzdHO3chJWDFvIKlbdmizYyLuuwR3oEBqq5s53/WwKRKL0zGMjQBFej7UhPKp3nXHYVah3Eg=
X-Received: by 2002:a05:6638:4883:b0:33f:7948:e685 with SMTP id
 ct3-20020a056638488300b0033f7948e685mr11202421jab.138.1659558516113; Wed, 03
 Aug 2022 13:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220803172302.1976981-1-robdclark@gmail.com>
 <c80d70b6-a7ad-5900-ea7a-f0f2157e4a40@quicinc.com>
In-Reply-To: <c80d70b6-a7ad-5900-ea7a-f0f2157e4a40@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Aug 2022 13:29:02 -0700
Message-ID: <CAF6AEGuDajmv=bnQ9hNgCbkB8ubpFhhoFZVL4881O=2B9xh+_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Move hangcheck timer restart
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 3, 2022 at 12:52 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 8/3/2022 10:53 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Don't directly restart the hangcheck timer from the timer handler, but
> > instead start it after the recover_worker replays remaining jobs.
> >
> > If the kthread is blocked for other reasons, there is no point to
> > immediately restart the timer.  Fixes a random symptom of the problem
> > fixed in the next patch.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index fba85f894314..8f9c48eabf7d 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -328,6 +328,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
> >   }
> >
> >   static void retire_submits(struct msm_gpu *gpu);
> > +static void hangcheck_timer_reset(struct msm_gpu *gpu);
> >
> >   static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> >   {
> > @@ -420,6 +421,8 @@ static void recover_worker(struct kthread_work *work)
> >       }
> >
> >       if (msm_gpu_active(gpu)) {
> > +             bool restart_hangcheck = false;
> > +
> >               /* retire completed submits, plus the one that hung: */
> >               retire_submits(gpu);
> >
> > @@ -436,10 +439,15 @@ static void recover_worker(struct kthread_work *work)
> >                       unsigned long flags;
> >
> >                       spin_lock_irqsave(&ring->submit_lock, flags);
> > -                     list_for_each_entry(submit, &ring->submits, node)
> > +                     list_for_each_entry(submit, &ring->submits, node) {
> >                               gpu->funcs->submit(gpu, submit);
> > +                             restart_hangcheck = true;
> > +                     }
> >                       spin_unlock_irqrestore(&ring->submit_lock, flags);
> >               }
> > +
> > +             if (restart_hangcheck)
> > +                     hangcheck_timer_reset(gpu);
> >       }
> >
> >       mutex_unlock(&gpu->lock);
> > @@ -515,10 +523,6 @@ static void hangcheck_handler(struct timer_list *t)
> >               kthread_queue_work(gpu->worker, &gpu->recover_work);
> >       }
> >
> > -     /* if still more pending work, reset the hangcheck timer: */
> In the scenario mentioned here, shouldn't we restart the timer?

yeah, actually the case where we don't want to restart the timer is
*only* when we schedule recover_work..

BR,
-R

>
> -Akhil.
> > -     if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
> > -             hangcheck_timer_reset(gpu);
> > -
> >       /* workaround for missing irq: */
> >       msm_gpu_retire(gpu);
> >   }
> >
>
