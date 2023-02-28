Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A796A5E3D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 18:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8C110E4EA;
	Tue, 28 Feb 2023 17:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581B510E4E4;
 Tue, 28 Feb 2023 17:32:42 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id c11so8673291oiw.2;
 Tue, 28 Feb 2023 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OS2xX+BtHdXwUDSZ5DQ0d8jK5T/XMeJmBIJDyEZsagY=;
 b=Nk5WmDPHrcSVCD7pd3bZdYSqH3SpwxNlDXtzxaRNnhlyNLqKXPSct1od4XkzI40QiQ
 z7EB7N5I5P5bQqUFd3+D9kddSyWv+K4d/FLj7tdhruhZfKeCm1tPz8SuHU7MIeEpP4nR
 CEcd0Gn6snBz9w+NqiM6PXs46XEfwxvCXEawKfwVjXX2WW4Of4tGiBKPoxjnhR+3c9bq
 2jG3Z/OCsq5/36H9wJsXaNo9SbWiBYkUi1nTFba1lFMx+JmIoNPwds9Bk3IOepBCJf82
 4PDgVRCudfjWL3UXzSRym3O+ly+A2gdLEvj91BXpZZzOD2dCRiStd0wwRoWUtvyJBllc
 oVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OS2xX+BtHdXwUDSZ5DQ0d8jK5T/XMeJmBIJDyEZsagY=;
 b=KCSCjeI/UvYU1k0zoMVHPyD5TQsNTTODSDD0dScr+m7LpDz/t5H0QJewvyWe73WXI7
 YsvveHRxdMtwfeHaA67m3rvjq+Y/jQW4hnJXb9+Sf81VzdT0XdUFMPPHWO7kIymXJ8/d
 IalLx9wFfY75/pYOTYw8yMyNfQvLG3ANdN2qqG5HKtSggnmVhjChfiEBBpfD4oM/BuDo
 7NSNJHMu6d9tm504VgHlA9IxbE7W85vz5XOrYdoUSMEbqsZeDIj3Qf7oD6x0F83SshQD
 smDmivmuTjNpbvGAlFiYSLaU9XVHyMrRfeZRYHyKhEpz1UVUKAnJzKw+wkMDbKG4VfMk
 IQ8Q==
X-Gm-Message-State: AO0yUKVAzWqecrFBROzwLcVl8nwEwQx28tfLxE99HgGK5jj1S9Nf88z3
 9V/dOCvBLJfHsFRZ52KyufSGGt+n5PkO+toZ6k+ByiLKnGw=
X-Google-Smtp-Source: AK7set9wDysrTDCY5oqefgdcjHb48vnAXtnE6xR8/CSF6XoQkO4OKA20wINQBgGtH/zvjgvAgUaBg0YapluvX8WDLFU=
X-Received: by 2002:a05:6808:278c:b0:384:23ed:1ff6 with SMTP id
 es12-20020a056808278c00b0038423ed1ff6mr1079335oib.3.1677605561422; Tue, 28
 Feb 2023 09:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-2-robdclark@gmail.com>
 <20230228112154.207dc66c@eldfell>
In-Reply-To: <20230228112154.207dc66c@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 09:32:30 -0800
Message-ID: <CAF6AEGu3eCqK3ooWrArF9XS06Ad9cFjQn=kvwCVoioRjYJ9NmQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] dma-buf/dma-fence: Add deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 1:21 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 27 Feb 2023 11:35:07 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a way to hint to the fence signaler of an upcoming deadline, such a=
s
> > vblank, which the fence waiter would prefer not to miss.  This is to ai=
d
> > the fence signaler in making power management decisions, like boosting
> > frequency as the deadline approaches and awareness of missing deadlines
> > so that can be factored in to the frequency scaling.
> >
> > v2: Drop dma_fence::deadline and related logic to filter duplicate
> >     deadlines, to avoid increasing dma_fence size.  The fence-context
> >     implementation will need similar logic to track deadlines of all
> >     the fences on the same timeline.  [ckoenig]
> > v3: Clarify locking wrt. set_deadline callback
> > v4: Clarify in docs comment that this is a hint
> > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > v6: More docs
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >  Documentation/driver-api/dma-buf.rst |  6 +++
> >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++++++
> >  include/linux/dma-fence.h            | 20 ++++++++++
> >  3 files changed, 85 insertions(+)
> >
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 622b8156d212..183e480d8cea 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> >     :doc: fence signalling annotation
> >
> > +DMA Fence Deadline Hints
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > +   :doc: deadline hints
> > +
> >  DMA Fences Functions Reference
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 0de0482cd36e..e103e821d993 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **fenc=
es, uint32_t count,
> >  }
> >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >
> > +/**
> > + * DOC: deadline hints
> > + *
> > + * In an ideal world, it would be possible to pipeline a workload suff=
iciently
> > + * that a utilization based device frequency governor could arrive at =
a minimum
> > + * frequency that meets the requirements of the use-case, in order to =
minimize
> > + * power consumption.  But in the real world there are many workloads =
which
> > + * defy this ideal.  For example, but not limited to:
> > + *
> > + * * Workloads that ping-pong between device and CPU, with alternating=
 periods
> > + *   of CPU waiting for device, and device waiting on CPU.  This can r=
esult in
> > + *   devfreq and cpufreq seeing idle time in their respective domains =
and in
> > + *   result reduce frequency.
> > + *
> > + * * Workloads that interact with a periodic time based deadline, such=
 as double
> > + *   buffered GPU rendering vs vblank sync'd page flipping.  In this s=
cenario,
> > + *   missing a vblank deadline results in an *increase* in idle time o=
n the GPU
> > + *   (since it has to wait an additional vblank period), sending a sin=
gle to
>
> Hi Rob,
>
> s/single/signal/ ?

oops, yes

> > + *   the GPU's devfreq to reduce frequency, when in fact the opposite =
is what is
> > + *   needed.
> > + *
> > + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_f=
ence_set_deadline.
> > + * The deadline hint provides a way for the waiting driver, or userspa=
ce, to
> > + * convey an appropriate sense of urgency to the signaling driver.
> > + *
> > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for use=
rspace
> > + * facing APIs).  The time could either be some point in the future (s=
uch as
> > + * the vblank based deadline for page-flipping, or the start of a comp=
ositor's
> > + * composition cycle), or the current time to indicate an immediate de=
adline
> > + * hint (Ie. forward progress cannot be made until this fence is signa=
led).
>
> As "current time" not a special value, but just an absolute timestamp
> like any other, deadlines already in the past must also be accepted?

Yes, well "current time" is already in the past after the next clock
tick, so deadlines already passed should be accepted.  I've been
trying to avoid advocating zero as a special value, but I guess
realistically we don't have a rollover problem for a couple hundred
years.  In any case, I think `deadline < now` should be allowed (ie.
what if you were preempted in the process of setting a deadline, etc)

I'll try to clarify this in the next version.

BR,
-R

> > + *
> > + * Multiple deadlines may be set on a given fence, even in parallel.  =
See the
> > + * documentation for &dma_fence_ops.set_deadline.
> > + *
> > + * The deadline hint is just that, a hint.  The driver that created th=
e fence
> > + * may react by increasing frequency, making different scheduling choi=
ces, etc.
> > + * Or doing nothing at all.
> > + */
>
> Yes! Thank you for writing this! Well explained.
>
> > +
> > +/**
> > + * dma_fence_set_deadline - set desired fence-wait deadline hint
> > + * @fence:    the fence that is to be waited on
> > + * @deadline: the time by which the waiter hopes for the fence to be
> > + *            signaled
> > + *
> > + * Give the fence signaler a hint about an upcoming deadline, such as
> > + * vblank, by which point the waiter would prefer the fence to be
> > + * signaled by.  This is intended to give feedback to the fence signal=
er
> > + * to aid in power management decisions, such as boosting GPU frequenc=
y
> > + * if a periodic vblank deadline is approaching but the fence is not
> > + * yet signaled..
> > + */
> > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> > +{
> > +     if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> > +             fence->ops->set_deadline(fence, deadline);
> > +}
> > +EXPORT_SYMBOL(dma_fence_set_deadline);
> > +
> >  /**
> >   * dma_fence_describe - Dump fence describtion into seq_file
> >   * @fence: the 6fence to describe
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 775cdc0b4f24..87c0d846dbb4 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -257,6 +257,24 @@ struct dma_fence_ops {
> >        */
> >       void (*timeline_value_str)(struct dma_fence *fence,
> >                                  char *str, int size);
> > +
> > +     /**
> > +      * @set_deadline:
> > +      *
> > +      * Callback to allow a fence waiter to inform the fence signaler =
of
> > +      * an upcoming deadline, such as vblank, by which point the waite=
r
> > +      * would prefer the fence to be signaled by.  This is intended to
> > +      * give feedback to the fence signaler to aid in power management
> > +      * decisions, such as boosting GPU frequency.
> > +      *
> > +      * This is called without &dma_fence.lock held, it can be called
> > +      * multiple times and from any context.  Locking is up to the cal=
lee
> > +      * if it has some state to manage.  If multiple deadlines are set=
,
> > +      * the expectation is to track the soonest one.
> > +      *
> > +      * This callback is optional.
> > +      */
> > +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
> >  };
> >
> >  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_op=
s *ops,
> > @@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma=
_fence *fence, bool intr)
> >       return ret < 0 ? ret : 0;
> >  }
> >
> > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)=
;
> > +
> >  struct dma_fence *dma_fence_get_stub(void);
> >  struct dma_fence *dma_fence_allocate_private_stub(void);
> >  u64 dma_fence_context_alloc(unsigned num);
>
> This is exactly what I wanted to see. Already
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>
>
> Thanks,
> pq
