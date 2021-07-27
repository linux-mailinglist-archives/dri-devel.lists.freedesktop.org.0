Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0420D3D7862
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F48A6E0C5;
	Tue, 27 Jul 2021 14:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAB16E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:21:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n11so7700109wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BczT7ZyrFkAsdjN1jQUscCX71jhMFsPYTZ2EwZuJGnI=;
 b=pH9cqLqPZE2JOS4NPl8FMME2xJGqCWbZRXc4ZftatLNOh+HwMJujmf2SmmRsNzKY1B
 F+TdP+N+FqOBX7PWRa03TA/Uw1h/UGKd8lnjNhC2t2avK3D8ih3+qp3iLlC5pc7aBwOq
 wknwZAY3xndcOr4l1Q4CLb2XleNa/ivCAK05rIhBTC6pOJ2TxoeH/s9tRTlq+Aej+s9g
 TdkR0kDwVPz9rezJjcsXdox3OJzousXuPuGXkdQLQSb6pq2KczW17dRKpqy8KSP5NaJT
 gIOWfA+926MXEvxW9ZTVC69hq+kWth7myyG0wc7XyGtTSA2TtjYmY3Qylipn80wKD6Yd
 Twqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BczT7ZyrFkAsdjN1jQUscCX71jhMFsPYTZ2EwZuJGnI=;
 b=KFSIfQUiiCxRw+7shmlWTpfA6lWAdokKtv3U2cndMO9JR10IAgM+iaH6xR7W1qqNBC
 ZiziF4IOYoUS/Ji13fKFMyKDfwyOJRgRwoellWSDgwBz0pV6CV7ppeu2FYX8d/n9ec0n
 8L9qjMBmbIy7XOB+cP+MIPkMCk6ctgGOPj12233669nSwFHs+tBQF8r4uC0clzMhFqO6
 U/g+FypoDvkzDlR1UaozYOzbtoJqLJzTA5yBqEro750mywtzL/P4y07jFoo4w71FCegf
 BJH3q7WRM1b//l6tW9n6wq7cE1rQtuXEDwIlaRVogxfL41e5m+Pve3UfNqxsn7uwh7sf
 FTkQ==
X-Gm-Message-State: AOAM5319ZO84pFVELVMw042JFRZ2ml4OeEaNOBOHnC5JwwhR19oHmX9d
 e9x4YtQvZqyvGzDUtD4NgvD9hxlB/mmjovaEBbM=
X-Google-Smtp-Source: ABdhPJyLHJioqCBgt/C/VONJpoX8G5sqCp3bgjzmqy2ko6oYKld58l9t1FtKkGfOU2wVxQrowpjzMjoedjvJJjTvJ8E=
X-Received: by 2002:a05:600c:4401:: with SMTP id
 u1mr4561306wmn.49.1627395675495; 
 Tue, 27 Jul 2021 07:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
In-Reply-To: <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Jul 2021 07:25:24 -0700
Message-ID: <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 12:11 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 27.07.21 um 01:38 schrieb Rob Clark:
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
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/dma-buf/dma-fence.c | 39 ++++++++++++++++++++++++++++++++++++=
+
> >   include/linux/dma-fence.h   | 17 ++++++++++++++++
> >   2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index ce0f5eff575d..2e0d25ab457e 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence **fenc=
es, uint32_t count,
> >   }
> >   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >
> > +
> > +/**
> > + * dma_fence_set_deadline - set desired fence-wait deadline
> > + * @fence:    the fence that is to be waited on
> > + * @deadline: the time by which the waiter hopes for the fence to be
> > + *            signaled
> > + *
> > + * Inform the fence signaler of an upcoming deadline, such as vblank, =
by
> > + * which point the waiter would prefer the fence to be signaled by.  T=
his
> > + * is intended to give feedback to the fence signaler to aid in power
> > + * management decisions, such as boosting GPU frequency if a periodic
> > + * vblank deadline is approaching.
> > + */
> > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> > +{
> > +     unsigned long flags;
> > +
> > +     if (dma_fence_is_signaled(fence))
> > +             return;
> > +
> > +     spin_lock_irqsave(fence->lock, flags);
> > +
> > +     /* If we already have an earlier deadline, keep it: */
> > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
> > +         ktime_before(fence->deadline, deadline)) {
> > +             spin_unlock_irqrestore(fence->lock, flags);
> > +             return;
> > +     }
> > +
> > +     fence->deadline =3D deadline;
> > +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> > +
> > +     spin_unlock_irqrestore(fence->lock, flags);
> > +
> > +     if (fence->ops->set_deadline)
> > +             fence->ops->set_deadline(fence, deadline);
> > +}
> > +EXPORT_SYMBOL(dma_fence_set_deadline);
> > +
> >   /**
> >    * dma_fence_init - Initialize a custom fence.
> >    * @fence: the fence to initialize
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -88,6 +88,7 @@ struct dma_fence {
> >               /* @timestamp replaced by @rcu on dma_fence_release() */
> >               struct rcu_head rcu;
> >       };
> > +     ktime_t deadline;
>
> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding the
> deadline as extra field here.
>
> We tuned the dma_fence structure intentionally so that it is only 64 byte=
s.

Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?

We could push the ktime_t (and timer) down into the derived fence
class, but I think there is going to need to be some extra storage
*somewhere*.. maybe the fence signaler could get away with just
storing the nearest upcoming deadline per fence-context instead?

BR,
-R

> Regards,
> Christian.
>
> >       u64 context;
> >       u64 seqno;
> >       unsigned long flags;
> > @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> >       DMA_FENCE_FLAG_SIGNALED_BIT,
> >       DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >       DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >       DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
> >   };
> >
> > @@ -261,6 +263,19 @@ struct dma_fence_ops {
> >        */
> >       void (*timeline_value_str)(struct dma_fence *fence,
> >                                  char *str, int size);
> > +
> > +     /**
> > +      * @set_deadline:
> > +      *
> > +      * Callback to allow a fence waiter to inform the fence signaler =
of an
> > +      * upcoming deadline, such as vblank, by which point the waiter w=
ould
> > +      * prefer the fence to be signaled by.  This is intended to give =
feedback
> > +      * to the fence signaler to aid in power management decisions, su=
ch as
> > +      * boosting GPU frequency.
> > +      *
> > +      * This callback is optional.
> > +      */
> > +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
> >   };
> >
> >   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_o=
ps *ops,
> > @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma=
_fence *fence, bool intr)
> >       return ret < 0 ? ret : 0;
> >   }
> >
> > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)=
;
> > +
> >   struct dma_fence *dma_fence_get_stub(void);
> >   struct dma_fence *dma_fence_allocate_private_stub(void);
> >   u64 dma_fence_context_alloc(unsigned num);
>
