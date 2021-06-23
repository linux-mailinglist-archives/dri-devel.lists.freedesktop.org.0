Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82483B1BBE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85906E8EA;
	Wed, 23 Jun 2021 13:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5ED6E8EC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:56:53 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso1554432oto.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R0KZEcOhsYUDvfRkuY/TPGkKhNyrdw78HhstDuqHrSE=;
 b=Gu1QmUUrn3yaVBVU2fSeDCa7P3mWsIcNWJYuFQT0P4iEWpOIMG4VGiIPE7hUemnSDk
 SEAH6x5lTcOAqyt6KA0NR7+fD8iiJydGwVQUE5es+NCartItOEoepNvduuunzJEjFRfG
 G/wypfXPfCUdiDm0C22GTsYdC9eYcRmo72Wuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R0KZEcOhsYUDvfRkuY/TPGkKhNyrdw78HhstDuqHrSE=;
 b=PscuZfKG6bC67U97bVVFyPEKav0mRYV19d+EWHNSnmXuUvOdrhgWRBw8R/uwAwEyvY
 tMFb76kQ4Jut5Zc2VIexf6ntThCeBlq1eJ6lfePD2NTDVzmV5YQEkuSJd6zl6IgQn6zE
 oedfP3gNnTzNAHN5Mm0GWCpY4sr6RU1wb0el39zfP8ihglxJoISiJ3kzT7Ugq3GzDpHr
 K6TzQt9esZxjedndRm55nYEBD+hLbIAtqPyCuaTItUk0mz4O9XDIBWLC38dKsrrPTkYF
 mbdE+4K56t1RTUjYLIuQqXY6d2FFcRSO15aE2K1nh1RwzhHh43yipwA4GNzStAZzK90r
 Dm4Q==
X-Gm-Message-State: AOAM531kVq1TJgsu1QIyah8RAyDAPpKU1USuwDjwKz/ZV1QjpLdYi6ul
 RLkWHkkmO1e5HneFdsuLXE6R3+KLe+lmy7lnex7rLw==
X-Google-Smtp-Source: ABdhPJxEfkFtFBLe1m70mL45QENBC3vuQwgZPFvYcbN8pJRDhYwIGq8VekW9s7h56mIlk56efKzqxB2REyMYWoi93XQ=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr35997oth.188.1624456612311; 
 Wed, 23 Jun 2021 06:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210622130459.122723-1-christian.koenig@amd.com>
 <e01d3b99-ca6b-c6c2-a277-2fecf442ec16@gmail.com>
 <CAKMK7uEh53gCinsGjOBto7tU9YLuS3S1CFaE=jXUOMbEoTC8Og@mail.gmail.com>
 <87542463-7d0e-6d15-744b-46c6d0ce5e6b@gmail.com>
 <CAKMK7uE0ErW60UkhZ051nX9ai2H4m+-SF_N65b7u7q1OyjTQcw@mail.gmail.com>
 <db1cb71b-de43-41f6-8bcd-b28b34058435@gmail.com>
In-Reply-To: <db1cb71b-de43-41f6-8bcd-b28b34058435@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Jun 2021 15:56:41 +0200
Message-ID: <CAKMK7uH7bVqci4KqaBm7WDjHd5iWSgYnYrVAomsYw8kvfrtbkQ@mail.gmail.com>
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

On Wed, Jun 23, 2021 at 2:42 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.06.21 um 13:30 schrieb Daniel Vetter:
> > On Wed, Jun 23, 2021 at 1:17 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 22.06.21 um 19:02 schrieb Daniel Vetter:
> >>> On Tue, Jun 22, 2021 at 3:07 PM Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>> Crap, hit enter to early before adding a cover letter.
> >>>>
> >>>> This is the same patch as before, but as requested I'm keeping the
> >>>> exclusive fence handling as it is for now.
> >>>>
> >>>> Daniel can you double check this and/or make sure that it is tested?
> >>>>
> >>>> I only smoke tested it and the code is so complicated that I'm not s=
ure
> >>>> I catched all side effects.
> >>> So I've thought about this some more, and we actually have docs for
> >>> how this is supposed to work:
> >>>
> >>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#implicit=
-fence-poll-support
> >>>
> >>> Docs are pretty clear that we want both read and write for EPOLLOUT o=
r
> >>> well both exclusive and shared fences. So I guess back to your actual
> >>> thing, but maybe we should get some acks from userspace people for it
> >>> (Michel, Pekka, Simon probably usual suspects).
> >> Ok, sounds good to me. Going to send out a patch rebased to
> >> drm-misc-fixes today.
> >>
> >>> The other thing I brought up and I haven't seen you reply to (maybe
> >>> missed it) is whether we shouldn't just use dma_resv_get_fences(). We
> >>> need to do the refcounting anyway, and this avoids us having to
> >>> open-code this very nasty code. Finally, and imo most important, this
> >>> is what's also used in drm_gem_fence_array_add_implicit(), which many
> >>> drivers use to handle their implicit in-fences. So would be nice to
> >>> have exactly matching code between that and what dma-buf poll does fo=
r
> >>> "can I read" and "can I write".
> >>>
> >>> Thoughts?
> >> Yeah, I've seen that. Just didn't had time to answer.
> >>
> >> That goes into the same direction as my thinking that we need to
> >> centralize the RCU and synchronization handling in general.
> >>
> >> What I don't like about the approach is that dma_resv_get_fences() nee=
ds
> >> to allocate memory. For a lot of use cases including dma_buf_poll that
> >> is rather overkill.
> >>
> >> To unify the handling I think we should use the iterator I've create t=
he
> >> prototype of. This way we only have an "for_write" parameter and the
> >> iterator in return gives you all the fences you need.
> > Yeah I think in general I agree, especially in the CS code a bunch of
> > temporary allocations aren't great. But in dma_buf_poll I don't think
> > it's a place where anyone cares. That's why I think we can just use
> > that here and forget about all the trickiness. The gem helper otoh
> > wants an iterator (without retry even, since it's holding dma-resv
> > lock).
>
> Well then I would rather say we make nails with heads and grab the
> reservation lock in dma_buf_poll.
>
> That has at least less overhead than allocating memory, cause
> essentially what dma_buf_poll needs is a
> dma_resv_get_next_unsignaled_or_null_fence().

I'm all ok with that plan, avoids even more complexity.

> >> When you then extend that  approach we could say we have an enum
> >> describing the use case. Something like:
> >> 1. For explicit sync, just give me all the must sync fences from memor=
y
> >> management.
> >> 2. For read, give me all the writers and memory management fences.
> >> 3. For write, give me all the readers and writers and memory managemen=
t
> >> fences.
> >> 4. For memory management, give me everything including things like PTE
> >> updates/TLB flushes.
> >>
> >> So instead of asking for some specific type of fence(s) the drivers
> >> tells the dma_resv object about their use case and in return get the
> >> fences they need to wait for.
> >>
> >> This essentially means that we move the decision what to wait for from
> >> the drivers into the dma_resv object, which I think would be a massive
> >> improvement.
> >>
> >> Functions like dma_resv_get_list(), dma_resv_get_excl(),
> >> dma_resv_get_excl_rcu() etc would then essentially be deprecated and
> >> instead you use dma_resv_get_fences(), dma_resv_for_each_fences(),
> >> dma_resv_wait_timeout(), dma_resv_test_signaled() with a proper use ca=
se.
> >>
> >> What do you think?
> > Yeah I think in general the direction makes sense, at least long term.
> > I think for now it's better to go with simplest solutions first until
> > we have everyone aligned on one set of rules, and have these rules
> > properly documented.
>
> I think that looks rather good now, doesn't it?

Well we have 2 out of 3 pieces:
- ttm drivers need to wait in their pin: fixed&documented
- drivers need to follow the rules for setting dma_resv fences: amdgpu
fixed, patch set for other drivers + docs from me on the list
- drivers must not break the fence DAG in dma-resv: tbd, both
auditing/fixing drives and documenting it.

So getting there, but not yet fully arrived.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>> Am 22.06.21 um 15:04 schrieb Christian K=C3=B6nig:
> >>>>> Daniel pointed me towards this function and there are multiple obvi=
ous problems
> >>>>> in the implementation.
> >>>>>
> >>>>> First of all the retry loop is not working as intended. In general =
the retry
> >>>>> makes only sense if you grab the reference first and then check the=
 sequence
> >>>>> values.
> >>>>>
> >>>>> It's also good practice to keep the reference around when installin=
g callbacks
> >>>>> to fences you don't own.
> >>>>>
> >>>>> And last the whole implementation was unnecessary complex and rathe=
r hard to
> >>>>> understand which could lead to probably unexpected behavior of the =
IOCTL.
> >>>>>
> >>>>> Fix all this by reworking the implementation from scratch.
> >>>>>
> >>>>> Only mildly tested and needs a thoughtful review of the code.
> >>>>>
> >>>>> v2: fix the reference counting as well
> >>>>> v3: keep the excl fence handling as is for stable
> >>>>>
> >>>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> CC: stable@vger.kernel.org
> >>>>> ---
> >>>>>     drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++---------------=
-------
> >>>>>     include/linux/dma-buf.h   |   2 +-
> >>>>>     2 files changed, 55 insertions(+), 80 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>>>> index eadd1eaa2fb5..e97c3a9d98d5 100644
> >>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry=
)
> >>>>>          * If you hit this BUG() it means someone dropped their ref=
 to the
> >>>>>          * dma-buf while still having pending operation to the buff=
er.
> >>>>>          */
> >>>>> -     BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> >>>>> +     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>>>>
> >>>>>         dmabuf->ops->release(dmabuf);
> >>>>>
> >>>>> @@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence =
*fence, struct dma_fence_cb *cb)
> >>>>>         wake_up_locked_poll(dcb->poll, dcb->active);
> >>>>>         dcb->active =3D 0;
> >>>>>         spin_unlock_irqrestore(&dcb->poll->lock, flags);
> >>>>> +     dma_fence_put(fence);
> >>>>>     }
> >>>>>
> >>>>>     static __poll_t dma_buf_poll(struct file *file, poll_table *pol=
l)
> >>>>>     {
> >>>>> +     struct dma_buf_poll_cb_t *dcb;
> >>>>>         struct dma_buf *dmabuf;
> >>>>>         struct dma_resv *resv;
> >>>>>         struct dma_resv_list *fobj;
> >>>>>         struct dma_fence *fence_excl;
> >>>>> -     __poll_t events;
> >>>>>         unsigned shared_count, seq;
> >>>>> +     struct dma_fence *fence;
> >>>>> +     __poll_t events;
> >>>>> +     int r, i;
> >>>>>
> >>>>>         dmabuf =3D file->private_data;
> >>>>>         if (!dmabuf || !dmabuf->resv)
> >>>>> @@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *fil=
e, poll_table *poll)
> >>>>>         if (!events)
> >>>>>                 return 0;
> >>>>>
> >>>>> +     dcb =3D events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> >>>>> +
> >>>>> +     /* Only queue a new one if we are not still waiting for the o=
ld one */
> >>>>> +     spin_lock_irq(&dmabuf->poll.lock);
> >>>>> +     if (dcb->active)
> >>>>> +             events =3D 0;
> >>>>> +     else
> >>>>> +             dcb->active =3D events;
> >>>>> +     spin_unlock_irq(&dmabuf->poll.lock);
> >>>>> +     if (!events)
> >>>>> +             return 0;
> >>>>> +
> >>>>>     retry:
> >>>>>         seq =3D read_seqcount_begin(&resv->seq);
> >>>>>         rcu_read_lock();
> >>>>>
> >>>>>         fobj =3D rcu_dereference(resv->fence);
> >>>>> -     if (fobj)
> >>>>> +     if (fobj && events & EPOLLOUT)
> >>>>>                 shared_count =3D fobj->shared_count;
> >>>>>         else
> >>>>>                 shared_count =3D 0;
> >>>>> -     fence_excl =3D rcu_dereference(resv->fence_excl);
> >>>>> -     if (read_seqcount_retry(&resv->seq, seq)) {
> >>>>> -             rcu_read_unlock();
> >>>>> -             goto retry;
> >>>>> -     }
> >>>>>
> >>>>> -     if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=
=3D 0)) {
> >>>>> -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> >>>>> -             __poll_t pevents =3D EPOLLIN;
> >>>>> -
> >>>>> -             if (shared_count =3D=3D 0)
> >>>>> -                     pevents |=3D EPOLLOUT;
> >>>>> -
> >>>>> -             spin_lock_irq(&dmabuf->poll.lock);
> >>>>> -             if (dcb->active) {
> >>>>> -                     dcb->active |=3D pevents;
> >>>>> -                     events &=3D ~pevents;
> >>>>> -             } else
> >>>>> -                     dcb->active =3D pevents;
> >>>>> -             spin_unlock_irq(&dmabuf->poll.lock);
> >>>>> -
> >>>>> -             if (events & pevents) {
> >>>>> -                     if (!dma_fence_get_rcu(fence_excl)) {
> >>>>> -                             /* force a recheck */
> >>>>> -                             events &=3D ~pevents;
> >>>>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>>>> -                     } else if (!dma_fence_add_callback(fence_excl=
, &dcb->cb,
> >>>>> -                                                        dma_buf_po=
ll_cb)) {
> >>>>> -                             events &=3D ~pevents;
> >>>>> -                             dma_fence_put(fence_excl);
> >>>>> -                     } else {
> >>>>> -                             /*
> >>>>> -                              * No callback queued, wake up any ad=
ditional
> >>>>> -                              * waiters.
> >>>>> -                              */
> >>>>> -                             dma_fence_put(fence_excl);
> >>>>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>>>> -                     }
> >>>>> +     for (i =3D 0; i < shared_count; ++i) {
> >>>>> +             fence =3D rcu_dereference(fobj->shared[i]);
> >>>>> +             fence =3D dma_fence_get_rcu(fence);
> >>>>> +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> >>>>> +                     /* Concurrent modify detected, force re-check=
 */
> >>>>> +                     dma_fence_put(fence);
> >>>>> +                     rcu_read_unlock();
> >>>>> +                     goto retry;
> >>>>>                 }
> >>>>> -     }
> >>>>>
> >>>>> -     if ((events & EPOLLOUT) && shared_count > 0) {
> >>>>> -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> >>>>> -             int i;
> >>>>> -
> >>>>> -             /* Only queue a new callback if no event has fired ye=
t */
> >>>>> -             spin_lock_irq(&dmabuf->poll.lock);
> >>>>> -             if (dcb->active)
> >>>>> -                     events &=3D ~EPOLLOUT;
> >>>>> -             else
> >>>>> -                     dcb->active =3D EPOLLOUT;
> >>>>> -             spin_unlock_irq(&dmabuf->poll.lock);
> >>>>> -
> >>>>> -             if (!(events & EPOLLOUT))
> >>>>> +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf=
_poll_cb);
> >>>>> +             if (!r) {
> >>>>> +                     /* Callback queued */
> >>>>> +                     events =3D 0;
> >>>>>                         goto out;
> >>>>> +             }
> >>>>> +             dma_fence_put(fence);
> >>>>> +     }
> >>>>>
> >>>>> -             for (i =3D 0; i < shared_count; ++i) {
> >>>>> -                     struct dma_fence *fence =3D rcu_dereference(f=
obj->shared[i]);
> >>>>> -
> >>>>> -                     if (!dma_fence_get_rcu(fence)) {
> >>>>> -                             /*
> >>>>> -                              * fence refcount dropped to zero, th=
is means
> >>>>> -                              * that fobj has been freed
> >>>>> -                              *
> >>>>> -                              * call dma_buf_poll_cb and force a r=
echeck!
> >>>>> -                              */
> >>>>> -                             events &=3D ~EPOLLOUT;
> >>>>> -                             dma_buf_poll_cb(NULL, &dcb->cb);
> >>>>> -                             break;
> >>>>> -                     }
> >>>>> -                     if (!dma_fence_add_callback(fence, &dcb->cb,
> >>>>> -                                                 dma_buf_poll_cb))=
 {
> >>>>> -                             dma_fence_put(fence);
> >>>>> -                             events &=3D ~EPOLLOUT;
> >>>>> -                             break;
> >>>>> -                     }
> >>>>> +     fence =3D dma_resv_get_excl(resv);
> >>>>> +     if (fence && shared_count =3D=3D 0) {
> >>>>> +             fence =3D dma_fence_get_rcu(fence);
> >>>>> +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> >>>>> +                     /* Concurrent modify detected, force re-check=
 */
> >>>>>                         dma_fence_put(fence);
> >>>>> +                     rcu_read_unlock();
> >>>>> +                     goto retry;
> >>>>> +
> >>>>>                 }
> >>>>>
> >>>>> -             /* No callback queued, wake up any additional waiters=
. */
> >>>>> -             if (i =3D=3D shared_count)
> >>>>> -                     dma_buf_poll_cb(NULL, &dcb->cb);
> >>>>> +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf=
_poll_cb);
> >>>>> +             if (!r) {
> >>>>> +                     /* Callback queued */
> >>>>> +                     events =3D 0;
> >>>>> +                     goto out;
> >>>>> +             }
> >>>>> +             dma_fence_put(fence_excl);
> >>>>>         }
> >>>>>
> >>>>> +     /* No callback queued, wake up any additional waiters. */
> >>>>> +     dma_buf_poll_cb(NULL, &dcb->cb);
> >>>>> +
> >>>>>     out:
> >>>>>         rcu_read_unlock();
> >>>>>         return events;
> >>>>> @@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma=
_buf_export_info *exp_info)
> >>>>>         dmabuf->owner =3D exp_info->owner;
> >>>>>         spin_lock_init(&dmabuf->name_lock);
> >>>>>         init_waitqueue_head(&dmabuf->poll);
> >>>>> -     dmabuf->cb_excl.poll =3D dmabuf->cb_shared.poll =3D &dmabuf->=
poll;
> >>>>> -     dmabuf->cb_excl.active =3D dmabuf->cb_shared.active =3D 0;
> >>>>> +     dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
> >>>>> +     dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> >>>>>
> >>>>>         if (!resv) {
> >>>>>                 resv =3D (struct dma_resv *)&dmabuf[1];
> >>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>> index efdc56b9d95f..7e747ad54c81 100644
> >>>>> --- a/include/linux/dma-buf.h
> >>>>> +++ b/include/linux/dma-buf.h
> >>>>> @@ -329,7 +329,7 @@ struct dma_buf {
> >>>>>                 wait_queue_head_t *poll;
> >>>>>
> >>>>>                 __poll_t active;
> >>>>> -     } cb_excl, cb_shared;
> >>>>> +     } cb_in, cb_out;
> >>>>>     };
> >>>>>
> >>>>>     /**
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
