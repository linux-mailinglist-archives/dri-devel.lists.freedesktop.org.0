Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB363D9DF9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9823C6EC9B;
	Thu, 29 Jul 2021 07:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6BC6EC97
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:03:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n11so3011810wmd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=yjmoZLiUD+FWnyezF+2h89AQ15fOMkle7vS/pk0BQrk=;
 b=CYR8Fi+P5EGNe3xUIak1oGG+oatnt/+x6BC4ocWfsDJ0OG6hWZPlm3OGOeViQJMCdI
 UWclXE36+8hC86zTZkKVWdW5btkVTJSQq2YTENMQL0xa7ZHmW9YQazg4/NvC/1R8g51w
 3PDiKAhYS6QM+IpddnmSyaPUtJ7Q4kq36fU0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=yjmoZLiUD+FWnyezF+2h89AQ15fOMkle7vS/pk0BQrk=;
 b=pPrfm45P+0URD/661jK5xLwaHszyLMGFisaXLXcolLM7H+20WNayCwgZkx6Blc1Wx7
 CjF8kqsS63kept0aXVDBsg0HlIuYcpUEE0SM6BetH5Ii6+Ox8bq+oRKnuMJQV83hHI86
 f7z6s/JzTNLCpliASHSwQSN8R9eEOJToo7uBu1F1wB+z1ehgJvmeJ7ZQFx71moGPRheR
 zuQS94Gs7YzdiqFyNaLhMr+RvM4TyE0ZJKAwUtsKmZgLAldufKLHDwgeM97HWBDmaqfb
 FBJo1QAArqUq+vAerUny5Lr91f6bW8RkYm0IYzQWbUaZn3JSyuct47bNR21jINtMyOKU
 EEIA==
X-Gm-Message-State: AOAM530B3Vv+rih391h+4og/3dwnq+Kb5iLccEkvvlpOSSHy4hXKx634
 zzUVHH/sLE+Wr8cbuj/iz0ykGw==
X-Google-Smtp-Source: ABdhPJxhDZGEhqp03BqW6NXSOqDd5aB+UkvkHgDcGsZFr8Q1/7QVZU8Ur8DP6zd16O+/MOBVdJtmzQ==
X-Received: by 2002:a05:600c:3587:: with SMTP id
 p7mr12841259wmq.27.1627542215139; 
 Thu, 29 Jul 2021 00:03:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p3sm8448882wmp.25.2021.07.29.00.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:03:34 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:03:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
Message-ID: <YQJSxEVUkZmfL5Cb@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
 <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
 <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com>
 <e5e71356-1c58-04ac-2609-70d268941b8d@amd.com>
 <CAF6AEGu3NMyRp1pC5iZQoHhKhu_xBFBqkkfbG36dx8bVzYdWMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu3NMyRp1pC5iZQoHhKhu_xBFBqkkfbG36dx8bVzYdWMA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 10:58:51AM -0700, Rob Clark wrote:
> On Wed, Jul 28, 2021 at 10:23 AM Christian König
> <christian.koenig@amd.com> wrote:
> >
> >
> >
> > Am 28.07.21 um 17:15 schrieb Rob Clark:
> > > On Wed, Jul 28, 2021 at 4:37 AM Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >> Am 28.07.21 um 09:03 schrieb Christian König:
> > >>> Am 27.07.21 um 16:25 schrieb Rob Clark:
> > >>>> On Tue, Jul 27, 2021 at 12:11 AM Christian König
> > >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
> > >>>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>>
> > >>>>>> Add a way to hint to the fence signaler of an upcoming deadline,
> > >>>>>> such as
> > >>>>>> vblank, which the fence waiter would prefer not to miss. This is to
> > >>>>>> aid
> > >>>>>> the fence signaler in making power management decisions, like boosting
> > >>>>>> frequency as the deadline approaches and awareness of missing
> > >>>>>> deadlines
> > >>>>>> so that can be factored in to the frequency scaling.
> > >>>>>>
> > >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >>>>>> ---
> > >>>>>>     drivers/dma-buf/dma-fence.c | 39
> > >>>>>> +++++++++++++++++++++++++++++++++++++
> > >>>>>>     include/linux/dma-fence.h   | 17 ++++++++++++++++
> > >>>>>>     2 files changed, 56 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > >>>>>> index ce0f5eff575d..2e0d25ab457e 100644
> > >>>>>> --- a/drivers/dma-buf/dma-fence.c
> > >>>>>> +++ b/drivers/dma-buf/dma-fence.c
> > >>>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence
> > >>>>>> **fences, uint32_t count,
> > >>>>>>     }
> > >>>>>>     EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > >>>>>>
> > >>>>>> +
> > >>>>>> +/**
> > >>>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
> > >>>>>> + * @fence:    the fence that is to be waited on
> > >>>>>> + * @deadline: the time by which the waiter hopes for the fence to be
> > >>>>>> + *            signaled
> > >>>>>> + *
> > >>>>>> + * Inform the fence signaler of an upcoming deadline, such as
> > >>>>>> vblank, by
> > >>>>>> + * which point the waiter would prefer the fence to be signaled
> > >>>>>> by.  This
> > >>>>>> + * is intended to give feedback to the fence signaler to aid in power
> > >>>>>> + * management decisions, such as boosting GPU frequency if a periodic
> > >>>>>> + * vblank deadline is approaching.
> > >>>>>> + */
> > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> > >>>>>> deadline)
> > >>>>>> +{
> > >>>>>> +     unsigned long flags;
> > >>>>>> +
> > >>>>>> +     if (dma_fence_is_signaled(fence))
> > >>>>>> +             return;
> > >>>>>> +
> > >>>>>> +     spin_lock_irqsave(fence->lock, flags);
> > >>>>>> +
> > >>>>>> +     /* If we already have an earlier deadline, keep it: */
> > >>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
> > >>>>>> +         ktime_before(fence->deadline, deadline)) {
> > >>>>>> +             spin_unlock_irqrestore(fence->lock, flags);
> > >>>>>> +             return;
> > >>>>>> +     }
> > >>>>>> +
> > >>>>>> +     fence->deadline = deadline;
> > >>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> > >>>>>> +
> > >>>>>> +     spin_unlock_irqrestore(fence->lock, flags);
> > >>>>>> +
> > >>>>>> +     if (fence->ops->set_deadline)
> > >>>>>> +             fence->ops->set_deadline(fence, deadline);
> > >>>>>> +}
> > >>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> > >>>>>> +
> > >>>>>>     /**
> > >>>>>>      * dma_fence_init - Initialize a custom fence.
> > >>>>>>      * @fence: the fence to initialize
> > >>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > >>>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> > >>>>>> --- a/include/linux/dma-fence.h
> > >>>>>> +++ b/include/linux/dma-fence.h
> > >>>>>> @@ -88,6 +88,7 @@ struct dma_fence {
> > >>>>>>                 /* @timestamp replaced by @rcu on
> > >>>>>> dma_fence_release() */
> > >>>>>>                 struct rcu_head rcu;
> > >>>>>>         };
> > >>>>>> +     ktime_t deadline;
> > >>>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding
> > >>>>> the
> > >>>>> deadline as extra field here.
> > >>>>>
> > >>>>> We tuned the dma_fence structure intentionally so that it is only 64
> > >>>>> bytes.
> > >>>> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
> > >>>>
> > >>>> We could push the ktime_t (and timer) down into the derived fence
> > >>>> class, but I think there is going to need to be some extra storage
> > >>>> *somewhere*.. maybe the fence signaler could get away with just
> > >>>> storing the nearest upcoming deadline per fence-context instead?
> > >>> I would just push that into the driver instead.
> > >>>
> > >>> You most likely don't want the deadline per fence anyway in complex
> > >>> scenarios, but rather per frame. And a frame is usually composed from
> > >>> multiple fences.
> > > Right, I ended up keeping track of the nearest deadline in patch 5/4
> > > which added drm/msm support:
> > >
> > >    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F447138%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cce6ace85263d448bbc9f08d951d9f06c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630819606427306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ameszAOlClaZNeUDlYr37ZdIytVXNgiEUKuctjXLqZ0%3D&amp;reserved=0
> > >
> > > But if we do have the ktime_t in dma_fence in dma_fence, we can add
> > > some checks and avoid calling back to the driver if a later deadline
> > > is set on a fence that already has an earlier deadline.  OTOH I
> > > suppose I can push all that back to the driver to start, and we can
> > > revisit once we have more drivers implementing deadline support.
> >
> > I still think that all of this is rather specific to your use case and
> > have strong doubt that anybody else will implement that.
> 
> i915 does already have a similar thing in it's hand-rolled atomic
> commit path.  So I think msm won't be the only one.  It should be also
> useful to the other mobile GPUs with a gpu vs kms driver split,
> although looking at the other gpu devfreq implementations, I don't
> think they've yet gotten to this point in the fine tuning..

Yeah I have a dream that maybe i915 will use the atomic commit helpers, I
originally wrote them with i915 in mind :-) even had patches!

I also think we'll need this eventually in other areas, Android also has
some hacks like this to make sure idle->first touch doesn't suck and
similar things.
-Daniel

> 
> BR,
> -R
> 
> > >> Thinking more about it we could probably kill the spinlock pointer and
> > >> make the flags 32bit if we absolutely need that here.
> > > If we had a 'struct dma_fence_context' we could push the spinlock, ops
> > > pointer, and u64 context into that and replace with a single
> > > dma_fence_context ptr, fwiw
> >
> > That won't work. We have a lot of use cases where you can't allocate
> > memory, but must allocate a context.
> >
> > Christian.
> >
> > >
> > > BR,
> > > -R
> > >
> > >> But I still don't see the need for that, especially since most drivers
> > >> probably won't implement it.
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > >>> Regards,
> > >>> Christian.
> > >>>
> > >>>> BR,
> > >>>> -R
> > >>>>
> > >>>>> Regards,
> > >>>>> Christian.
> > >>>>>
> > >>>>>>         u64 context;
> > >>>>>>         u64 seqno;
> > >>>>>>         unsigned long flags;
> > >>>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> > >>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
> > >>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > >>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > >>>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > >>>>>>         DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
> > >>>>>>     };
> > >>>>>>
> > >>>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
> > >>>>>>          */
> > >>>>>>         void (*timeline_value_str)(struct dma_fence *fence,
> > >>>>>>                                    char *str, int size);
> > >>>>>> +
> > >>>>>> +     /**
> > >>>>>> +      * @set_deadline:
> > >>>>>> +      *
> > >>>>>> +      * Callback to allow a fence waiter to inform the fence
> > >>>>>> signaler of an
> > >>>>>> +      * upcoming deadline, such as vblank, by which point the
> > >>>>>> waiter would
> > >>>>>> +      * prefer the fence to be signaled by.  This is intended to
> > >>>>>> give feedback
> > >>>>>> +      * to the fence signaler to aid in power management
> > >>>>>> decisions, such as
> > >>>>>> +      * boosting GPU frequency.
> > >>>>>> +      *
> > >>>>>> +      * This callback is optional.
> > >>>>>> +      */
> > >>>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
> > >>>>>>     };
> > >>>>>>
> > >>>>>>     void dma_fence_init(struct dma_fence *fence, const struct
> > >>>>>> dma_fence_ops *ops,
> > >>>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct
> > >>>>>> dma_fence *fence, bool intr)
> > >>>>>>         return ret < 0 ? ret : 0;
> > >>>>>>     }
> > >>>>>>
> > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> > >>>>>> deadline);
> > >>>>>> +
> > >>>>>>     struct dma_fence *dma_fence_get_stub(void);
> > >>>>>>     struct dma_fence *dma_fence_allocate_private_stub(void);
> > >>>>>>     u64 dma_fence_context_alloc(unsigned num);
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
