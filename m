Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0D3D918D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2736E8D0;
	Wed, 28 Jul 2021 15:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001676E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:11:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z4so2968526wrv.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bmd0px3e+9Tzd5EO3Rr/x/u7koc5C3KDnqh38Pg2b74=;
 b=KmmhXoqsEOFVYzG7t0vbA17lNhy18DQXvTCYbnakG4kf/2rj3eGzUiflXMQQ6OMFMF
 0zXdHzXR/nk/Khu1hko3PrSSsaHJ8etS5RJLDI5wv6VymExg+QPzUIl0hlZXq29D87bO
 fyCyRHaSwjqJBcYRPiOc8w624CZMMQnXMOoGprCohyG2jiq0zi5s6y3U0Ix1SVidB5Yk
 iJexABdfHm0zhMrBt6tpDKEs9ZMLzbbJ84dNzrX4zeUDkNR6OadcuKePa7WotYJHddOy
 hZ0Q8jDpCy9btsIRF8ilyPhQcpQXDvIc3/RAuedXhSPTI3NFnhXFgE+ETWNg+Yi3EUPU
 suxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bmd0px3e+9Tzd5EO3Rr/x/u7koc5C3KDnqh38Pg2b74=;
 b=L/h/VAFJG2psU0rgoYf8hJCowPnicg/Fa4N12RZh7hbROLMK046gB+gaHy+0QH4u3c
 VNdBob9CzktpALrKVvQA2psA9Eyh6C0FAidR97YR7YyOW97Nq4nu0r4AP/ZQAsb2hvI1
 Cow3u23DZEebBQMcBtB/orQ6sYBhQdTHfDQyslhfHDMN0eTomtLArhHchCE4n6ss7pa9
 ku0ZWPUcWzPRQgmCg9EN3KctAuVM8cixAR/CPCCeM80e+PzaejUUlPA/8diVRoJPqDv5
 YM+zxVuKC5FLSOJX2DShJWBRJSYzgtcMifhNbOhJLC40BOQCEudE0hdxxAIfPctXWkkZ
 cHSw==
X-Gm-Message-State: AOAM533PcwX4iWizAs6PDm19QPZbi3VzCAUDpG8Zw2LS/BXJC2oevmCb
 g8nmzGrjdyWwdyIoPw/7NZYySWKljDGWIvBWOio=
X-Google-Smtp-Source: ABdhPJwpwQ5uyuhug9ZGdb/7QH6tRqOV6GPxT2oOoivt5Kbqf8SeS/5J8QsrzPQuK04fUVM2BYxkiDIl8jWt9ypCSJk=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr14768989wrm.327.1627485072367; 
 Wed, 28 Jul 2021 08:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
 <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
In-Reply-To: <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Jul 2021 08:15:21 -0700
Message-ID: <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com>
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 4:37 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 28.07.21 um 09:03 schrieb Christian K=C3=B6nig:
> > Am 27.07.21 um 16:25 schrieb Rob Clark:
> >> On Tue, Jul 27, 2021 at 12:11 AM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>> Am 27.07.21 um 01:38 schrieb Rob Clark:
> >>>> From: Rob Clark <robdclark@chromium.org>
> >>>>
> >>>> Add a way to hint to the fence signaler of an upcoming deadline,
> >>>> such as
> >>>> vblank, which the fence waiter would prefer not to miss. This is to
> >>>> aid
> >>>> the fence signaler in making power management decisions, like boosti=
ng
> >>>> frequency as the deadline approaches and awareness of missing
> >>>> deadlines
> >>>> so that can be factored in to the frequency scaling.
> >>>>
> >>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>> ---
> >>>>    drivers/dma-buf/dma-fence.c | 39
> >>>> +++++++++++++++++++++++++++++++++++++
> >>>>    include/linux/dma-fence.h   | 17 ++++++++++++++++
> >>>>    2 files changed, 56 insertions(+)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence=
.c
> >>>> index ce0f5eff575d..2e0d25ab457e 100644
> >>>> --- a/drivers/dma-buf/dma-fence.c
> >>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence
> >>>> **fences, uint32_t count,
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >>>>
> >>>> +
> >>>> +/**
> >>>> + * dma_fence_set_deadline - set desired fence-wait deadline
> >>>> + * @fence:    the fence that is to be waited on
> >>>> + * @deadline: the time by which the waiter hopes for the fence to b=
e
> >>>> + *            signaled
> >>>> + *
> >>>> + * Inform the fence signaler of an upcoming deadline, such as
> >>>> vblank, by
> >>>> + * which point the waiter would prefer the fence to be signaled
> >>>> by.  This
> >>>> + * is intended to give feedback to the fence signaler to aid in pow=
er
> >>>> + * management decisions, such as boosting GPU frequency if a period=
ic
> >>>> + * vblank deadline is approaching.
> >>>> + */
> >>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> >>>> deadline)
> >>>> +{
> >>>> +     unsigned long flags;
> >>>> +
> >>>> +     if (dma_fence_is_signaled(fence))
> >>>> +             return;
> >>>> +
> >>>> +     spin_lock_irqsave(fence->lock, flags);
> >>>> +
> >>>> +     /* If we already have an earlier deadline, keep it: */
> >>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &=
&
> >>>> +         ktime_before(fence->deadline, deadline)) {
> >>>> +             spin_unlock_irqrestore(fence->lock, flags);
> >>>> +             return;
> >>>> +     }
> >>>> +
> >>>> +     fence->deadline =3D deadline;
> >>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> >>>> +
> >>>> +     spin_unlock_irqrestore(fence->lock, flags);
> >>>> +
> >>>> +     if (fence->ops->set_deadline)
> >>>> +             fence->ops->set_deadline(fence, deadline);
> >>>> +}
> >>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> >>>> +
> >>>>    /**
> >>>>     * dma_fence_init - Initialize a custom fence.
> >>>>     * @fence: the fence to initialize
> >>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> >>>> --- a/include/linux/dma-fence.h
> >>>> +++ b/include/linux/dma-fence.h
> >>>> @@ -88,6 +88,7 @@ struct dma_fence {
> >>>>                /* @timestamp replaced by @rcu on
> >>>> dma_fence_release() */
> >>>>                struct rcu_head rcu;
> >>>>        };
> >>>> +     ktime_t deadline;
> >>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding
> >>> the
> >>> deadline as extra field here.
> >>>
> >>> We tuned the dma_fence structure intentionally so that it is only 64
> >>> bytes.
> >> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
> >>
> >> We could push the ktime_t (and timer) down into the derived fence
> >> class, but I think there is going to need to be some extra storage
> >> *somewhere*.. maybe the fence signaler could get away with just
> >> storing the nearest upcoming deadline per fence-context instead?
> >
> > I would just push that into the driver instead.
> >
> > You most likely don't want the deadline per fence anyway in complex
> > scenarios, but rather per frame. And a frame is usually composed from
> > multiple fences.

Right, I ended up keeping track of the nearest deadline in patch 5/4
which added drm/msm support:

  https://patchwork.freedesktop.org/patch/447138/

But if we do have the ktime_t in dma_fence in dma_fence, we can add
some checks and avoid calling back to the driver if a later deadline
is set on a fence that already has an earlier deadline.  OTOH I
suppose I can push all that back to the driver to start, and we can
revisit once we have more drivers implementing deadline support.

>
> Thinking more about it we could probably kill the spinlock pointer and
> make the flags 32bit if we absolutely need that here.

If we had a 'struct dma_fence_context' we could push the spinlock, ops
pointer, and u64 context into that and replace with a single
dma_fence_context ptr, fwiw

BR,
-R

> But I still don't see the need for that, especially since most drivers
> probably won't implement it.
>
> Regards,
> Christian.
>
> >
> > Regards,
> > Christian.
> >
> >>
> >> BR,
> >> -R
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>        u64 context;
> >>>>        u64 seqno;
> >>>>        unsigned long flags;
> >>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> >>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
> >>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> >>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >>>>        DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
> >>>>    };
> >>>>
> >>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
> >>>>         */
> >>>>        void (*timeline_value_str)(struct dma_fence *fence,
> >>>>                                   char *str, int size);
> >>>> +
> >>>> +     /**
> >>>> +      * @set_deadline:
> >>>> +      *
> >>>> +      * Callback to allow a fence waiter to inform the fence
> >>>> signaler of an
> >>>> +      * upcoming deadline, such as vblank, by which point the
> >>>> waiter would
> >>>> +      * prefer the fence to be signaled by.  This is intended to
> >>>> give feedback
> >>>> +      * to the fence signaler to aid in power management
> >>>> decisions, such as
> >>>> +      * boosting GPU frequency.
> >>>> +      *
> >>>> +      * This callback is optional.
> >>>> +      */
> >>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline=
);
> >>>>    };
> >>>>
> >>>>    void dma_fence_init(struct dma_fence *fence, const struct
> >>>> dma_fence_ops *ops,
> >>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct
> >>>> dma_fence *fence, bool intr)
> >>>>        return ret < 0 ? ret : 0;
> >>>>    }
> >>>>
> >>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> >>>> deadline);
> >>>> +
> >>>>    struct dma_fence *dma_fence_get_stub(void);
> >>>>    struct dma_fence *dma_fence_allocate_private_stub(void);
> >>>>    u64 dma_fence_context_alloc(unsigned num);
> >
>
