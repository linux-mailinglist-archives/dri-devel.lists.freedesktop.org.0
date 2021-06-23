Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E353B18E8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841BB6E8B1;
	Wed, 23 Jun 2021 11:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB776E8B1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 11:30:34 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so1595789oti.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZsKlak8raKo1USCkpee9+MHLn1BeC8ojOqekRIveJhY=;
 b=TJQFL7yMRDxmH07ufbm24CPyE3O7awnu50RtQ1RkbnCAjfKHwdSduXJDiMO7WfIynm
 K6ftC1A4lfJRSPJkIid52allf9fjcqdmTcmmUkDZP+1u8nMlL0+HWbKRuXxSdGvCP6xU
 wQ5l7VLBEYhO0q+FB+4mL2EZBfqWY/e7rUVmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZsKlak8raKo1USCkpee9+MHLn1BeC8ojOqekRIveJhY=;
 b=Dk7hYXoqkteCnSGQ4ewUXUY5Z0BOxelGX9o7kRzPR0sovR/0PGApKynrvk5b1HxFWy
 cICSq/kxN2hLyO4BEKTZNlzfwb8hJ3PNowVOUAlAFRsBk5cTl2LWa/QKd/qH570XA6Uf
 1Ejc9RKdS4cosfxZRHzXU2SttFboULw5D4+rvJ9K1S7OadnZZ6jc70YQWBtn5VaziRM9
 Ls7Oc1Ptg80o5pJlpjuzBclDx+dAZnK3gVxVJsxQsn4lWkq6s5clkob826rqQpj9Oght
 uX6Mg5ps4yUM8LhsM9Mhgl+AWp6z0juqLWhhie7VRBYYD0i9SJKBmG1KlLb5Yntfi3SF
 FNaw==
X-Gm-Message-State: AOAM531YDaXl0KTqwnvByoZ+MX3G+m2lc1O+mQCpSlLGBtUb5O9QeZ19
 8LR116Aytdxph1eTtXNOOIF+nLHGhWh1Nftzb13BHw==
X-Google-Smtp-Source: ABdhPJzPwOBp9S0xwVLD7JXJsHcKKjq7GfqX4CLaga3ElNMtSA23us+goieTWmMFSInM8F0DIGqp+6QqHQamJ5nwOzE=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr7449126otb.281.1624447834176; 
 Wed, 23 Jun 2021 04:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210622130459.122723-1-christian.koenig@amd.com>
 <e01d3b99-ca6b-c6c2-a277-2fecf442ec16@gmail.com>
 <CAKMK7uEh53gCinsGjOBto7tU9YLuS3S1CFaE=jXUOMbEoTC8Og@mail.gmail.com>
 <87542463-7d0e-6d15-744b-46c6d0ce5e6b@gmail.com>
In-Reply-To: <87542463-7d0e-6d15-744b-46c6d0ce5e6b@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Jun 2021 13:30:22 +0200
Message-ID: <CAKMK7uE0ErW60UkhZ051nX9ai2H4m+-SF_N65b7u7q1OyjTQcw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v3
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 1:17 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.06.21 um 19:02 schrieb Daniel Vetter:
> > On Tue, Jun 22, 2021 at 3:07 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Crap, hit enter to early before adding a cover letter.
> >>
> >> This is the same patch as before, but as requested I'm keeping the
> >> exclusive fence handling as it is for now.
> >>
> >> Daniel can you double check this and/or make sure that it is tested?
> >>
> >> I only smoke tested it and the code is so complicated that I'm not sur=
e
> >> I catched all side effects.
> > So I've thought about this some more, and we actually have docs for
> > how this is supposed to work:
> >
> > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#implicit-f=
ence-poll-support
> >
> > Docs are pretty clear that we want both read and write for EPOLLOUT or
> > well both exclusive and shared fences. So I guess back to your actual
> > thing, but maybe we should get some acks from userspace people for it
> > (Michel, Pekka, Simon probably usual suspects).
>
> Ok, sounds good to me. Going to send out a patch rebased to
> drm-misc-fixes today.
>
> >
> > The other thing I brought up and I haven't seen you reply to (maybe
> > missed it) is whether we shouldn't just use dma_resv_get_fences(). We
> > need to do the refcounting anyway, and this avoids us having to
> > open-code this very nasty code. Finally, and imo most important, this
> > is what's also used in drm_gem_fence_array_add_implicit(), which many
> > drivers use to handle their implicit in-fences. So would be nice to
> > have exactly matching code between that and what dma-buf poll does for
> > "can I read" and "can I write".
> >
> > Thoughts?
>
> Yeah, I've seen that. Just didn't had time to answer.
>
> That goes into the same direction as my thinking that we need to
> centralize the RCU and synchronization handling in general.
>
> What I don't like about the approach is that dma_resv_get_fences() needs
> to allocate memory. For a lot of use cases including dma_buf_poll that
> is rather overkill.
>
> To unify the handling I think we should use the iterator I've create the
> prototype of. This way we only have an "for_write" parameter and the
> iterator in return gives you all the fences you need.

Yeah I think in general I agree, especially in the CS code a bunch of
temporary allocations aren't great. But in dma_buf_poll I don't think
it's a place where anyone cares. That's why I think we can just use
that here and forget about all the trickiness. The gem helper otoh
wants an iterator (without retry even, since it's holding dma-resv
lock).

> When you then extend that  approach we could say we have an enum
> describing the use case. Something like:
> 1. For explicit sync, just give me all the must sync fences from memory
> management.
> 2. For read, give me all the writers and memory management fences.
> 3. For write, give me all the readers and writers and memory management
> fences.
> 4. For memory management, give me everything including things like PTE
> updates/TLB flushes.
>
> So instead of asking for some specific type of fence(s) the drivers
> tells the dma_resv object about their use case and in return get the
> fences they need to wait for.
>
> This essentially means that we move the decision what to wait for from
> the drivers into the dma_resv object, which I think would be a massive
> improvement.
>
> Functions like dma_resv_get_list(), dma_resv_get_excl(),
> dma_resv_get_excl_rcu() etc would then essentially be deprecated and
> instead you use dma_resv_get_fences(), dma_resv_for_each_fences(),
> dma_resv_wait_timeout(), dma_resv_test_signaled() with a proper use case.
>
> What do you think?

Yeah I think in general the direction makes sense, at least long term.
I think for now it's better to go with simplest solutions first until
we have everyone aligned on one set of rules, and have these rules
properly documented.
-Daniel

> Christian.
>
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >> Am 22.06.21 um 15:04 schrieb Christian K=C3=B6nig:
> >>> Daniel pointed me towards this function and there are multiple obviou=
s problems
> >>> in the implementation.
> >>>
> >>> First of all the retry loop is not working as intended. In general th=
e retry
> >>> makes only sense if you grab the reference first and then check the s=
equence
> >>> values.
> >>>
> >>> It's also good practice to keep the reference around when installing =
callbacks
> >>> to fences you don't own.
> >>>
> >>> And last the whole implementation was unnecessary complex and rather =
hard to
> >>> understand which could lead to probably unexpected behavior of the IO=
CTL.
> >>>
> >>> Fix all this by reworking the implementation from scratch.
> >>>
> >>> Only mildly tested and needs a thoughtful review of the code.
> >>>
> >>> v2: fix the reference counting as well
> >>> v3: keep the excl fence handling as is for stable
> >>>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> CC: stable@vger.kernel.org
> >>> ---
> >>>    drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++------------------=
----
> >>>    include/linux/dma-buf.h   |   2 +-
> >>>    2 files changed, 55 insertions(+), 80 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>> index eadd1eaa2fb5..e97c3a9d98d5 100644
> >>> --- a/drivers/dma-buf/dma-buf.c
> >>> +++ b/drivers/dma-buf/dma-buf.c
> >>> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
> >>>         * If you hit this BUG() it means someone dropped their ref to=
 the
> >>>         * dma-buf while still having pending operation to the buffer.
> >>>         */
> >>> -     BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> >>> +     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>>
> >>>        dmabuf->ops->release(dmabuf);
> >>>
> >>> @@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence *f=
ence, struct dma_fence_cb *cb)
> >>>        wake_up_locked_poll(dcb->poll, dcb->active);
> >>>        dcb->active =3D 0;
> >>>        spin_unlock_irqrestore(&dcb->poll->lock, flags);
> >>> +     dma_fence_put(fence);
> >>>    }
> >>>
> >>>    static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >>>    {
> >>> +     struct dma_buf_poll_cb_t *dcb;
> >>>        struct dma_buf *dmabuf;
> >>>        struct dma_resv *resv;
> >>>        struct dma_resv_list *fobj;
> >>>        struct dma_fence *fence_excl;
> >>> -     __poll_t events;
> >>>        unsigned shared_count, seq;
> >>> +     struct dma_fence *fence;
> >>> +     __poll_t events;
> >>> +     int r, i;
> >>>
> >>>        dmabuf =3D file->private_data;
> >>>        if (!dmabuf || !dmabuf->resv)
> >>> @@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *file,=
 poll_table *poll)
> >>>        if (!events)
> >>>                return 0;
> >>>
> >>> +     dcb =3D events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> >>> +
> >>> +     /* Only queue a new one if we are not still waiting for the old=
 one */
> >>> +     spin_lock_irq(&dmabuf->poll.lock);
> >>> +     if (dcb->active)
> >>> +             events =3D 0;
> >>> +     else
> >>> +             dcb->active =3D events;
> >>> +     spin_unlock_irq(&dmabuf->poll.lock);
> >>> +     if (!events)
> >>> +             return 0;
> >>> +
> >>>    retry:
> >>>        seq =3D read_seqcount_begin(&resv->seq);
> >>>        rcu_read_lock();
> >>>
> >>>        fobj =3D rcu_dereference(resv->fence);
> >>> -     if (fobj)
> >>> +     if (fobj && events & EPOLLOUT)
> >>>                shared_count =3D fobj->shared_count;
> >>>        else
> >>>                shared_count =3D 0;
> >>> -     fence_excl =3D rcu_dereference(resv->fence_excl);
> >>> -     if (read_seqcount_retry(&resv->seq, seq)) {
> >>> -             rcu_read_unlock();
> >>> -             goto retry;
> >>> -     }
> >>>
> >>> -     if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=3D =
0)) {
> >>> -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> >>> -             __poll_t pevents =3D EPOLLIN;
> >>> -
> >>> -             if (shared_count =3D=3D 0)
> >>> -                     pevents |=3D EPOLLOUT;
> >>> -
> >>> -             spin_lock_irq(&dmabuf->poll.lock);
> >>> -             if (dcb->active) {
> >>> -                     dcb->active |=3D pevents;
> >>> -                     events &=3D ~pevents;
> >>> -             } else
> >>> -                     dcb->active =3D pevents;
> >>> -             spin_unlock_irq(&dmabuf->poll.lock);
> >>> -
> >>> -             if (events & pevents) {
> >>> -                     if (!dma_fence_get_rcu(fence_excl)) {
> >>> -                             /* force a recheck */
> >>> -                             events &=3D ~pevents;
> >>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>> -                     } else if (!dma_fence_add_callback(fence_excl, =
&dcb->cb,
> >>> -                                                        dma_buf_poll=
_cb)) {
> >>> -                             events &=3D ~pevents;
> >>> -                             dma_fence_put(fence_excl);
> >>> -                     } else {
> >>> -                             /*
> >>> -                              * No callback queued, wake up any addi=
tional
> >>> -                              * waiters.
> >>> -                              */
> >>> -                             dma_fence_put(fence_excl);
> >>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>> -                     }
> >>> +     for (i =3D 0; i < shared_count; ++i) {
> >>> +             fence =3D rcu_dereference(fobj->shared[i]);
> >>> +             fence =3D dma_fence_get_rcu(fence);
> >>> +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> >>> +                     /* Concurrent modify detected, force re-check *=
/
> >>> +                     dma_fence_put(fence);
> >>> +                     rcu_read_unlock();
> >>> +                     goto retry;
> >>>                }
> >>> -     }
> >>>
> >>> -     if ((events & EPOLLOUT) && shared_count > 0) {
> >>> -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> >>> -             int i;
> >>> -
> >>> -             /* Only queue a new callback if no event has fired yet =
*/
> >>> -             spin_lock_irq(&dmabuf->poll.lock);
> >>> -             if (dcb->active)
> >>> -                     events &=3D ~EPOLLOUT;
> >>> -             else
> >>> -                     dcb->active =3D EPOLLOUT;
> >>> -             spin_unlock_irq(&dmabuf->poll.lock);
> >>> -
> >>> -             if (!(events & EPOLLOUT))
> >>> +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_p=
oll_cb);
> >>> +             if (!r) {
> >>> +                     /* Callback queued */
> >>> +                     events =3D 0;
> >>>                        goto out;
> >>> +             }
> >>> +             dma_fence_put(fence);
> >>> +     }
> >>>
> >>> -             for (i =3D 0; i < shared_count; ++i) {
> >>> -                     struct dma_fence *fence =3D rcu_dereference(fob=
j->shared[i]);
> >>> -
> >>> -                     if (!dma_fence_get_rcu(fence)) {
> >>> -                             /*
> >>> -                              * fence refcount dropped to zero, this=
 means
> >>> -                              * that fobj has been freed
> >>> -                              *
> >>> -                              * call dma_buf_poll_cb and force a rec=
heck!
> >>> -                              */
> >>> -                             events &=3D ~EPOLLOUT;
> >>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>> -                             break;
> >>> -                     }
> >>> -                     if (!dma_fence_add_callback(fence, &dcb->cb,
> >>> -                                                 dma_buf_poll_cb)) {
> >>> -                             dma_fence_put(fence);
> >>> -                             events &=3D ~EPOLLOUT;
> >>> -                             break;
> >>> -                     }
> >>> +     fence =3D dma_resv_get_excl(resv);
> >>> +     if (fence && shared_count =3D=3D 0) {
> >>> +             fence =3D dma_fence_get_rcu(fence);
> >>> +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> >>> +                     /* Concurrent modify detected, force re-check *=
/
> >>>                        dma_fence_put(fence);
> >>> +                     rcu_read_unlock();
> >>> +                     goto retry;
> >>> +
> >>>                }
> >>>
> >>> -             /* No callback queued, wake up any additional waiters. =
*/
> >>> -             if (i =3D=3D shared_count)
> >>> -                     dma_buf_poll_cb(NULL, &dcb->cb);
> >>> +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_p=
oll_cb);
> >>> +             if (!r) {
> >>> +                     /* Callback queued */
> >>> +                     events =3D 0;
> >>> +                     goto out;
> >>> +             }
> >>> +             dma_fence_put(fence_excl);
> >>>        }
> >>>
> >>> +     /* No callback queued, wake up any additional waiters. */
> >>> +     dma_buf_poll_cb(NULL, &dcb->cb);
> >>> +
> >>>    out:
> >>>        rcu_read_unlock();
> >>>        return events;
> >>> @@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma_b=
uf_export_info *exp_info)
> >>>        dmabuf->owner =3D exp_info->owner;
> >>>        spin_lock_init(&dmabuf->name_lock);
> >>>        init_waitqueue_head(&dmabuf->poll);
> >>> -     dmabuf->cb_excl.poll =3D dmabuf->cb_shared.poll =3D &dmabuf->po=
ll;
> >>> -     dmabuf->cb_excl.active =3D dmabuf->cb_shared.active =3D 0;
> >>> +     dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
> >>> +     dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> >>>
> >>>        if (!resv) {
> >>>                resv =3D (struct dma_resv *)&dmabuf[1];
> >>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>> index efdc56b9d95f..7e747ad54c81 100644
> >>> --- a/include/linux/dma-buf.h
> >>> +++ b/include/linux/dma-buf.h
> >>> @@ -329,7 +329,7 @@ struct dma_buf {
> >>>                wait_queue_head_t *poll;
> >>>
> >>>                __poll_t active;
> >>> -     } cb_excl, cb_shared;
> >>> +     } cb_in, cb_out;
> >>>    };
> >>>
> >>>    /**
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
