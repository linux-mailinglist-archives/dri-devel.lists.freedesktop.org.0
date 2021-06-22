Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71363B0B2E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 19:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF5B6E861;
	Tue, 22 Jun 2021 17:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8C6E83E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 17:10:04 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 t4-20020a9d66c40000b029045e885b18deso1747280otm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3BHcSG9rzgBHyJGzqD1Ji9FI/xiWNCAev65YJofOvzM=;
 b=D7g4EtzPW78iq/SebZwocnueocsdr97E0kFerSObKHQKj49fUMAVDhAbmScAGA/JOU
 ENWnpICwWbbWSZsCQ2G4C7/YQgxF2mJr1mTYi4cO2+79EWE7iC2FeHCVqUl0vem4SBwh
 suC9tICb+pjOSLh08KqTxM/aA9g5SU9IUkYz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3BHcSG9rzgBHyJGzqD1Ji9FI/xiWNCAev65YJofOvzM=;
 b=IpatD8LpRJbS138ddl9O6wpYVi7NH2nAw2/trrEywpNW1kiAkzygDaXAvRySlcv6iR
 0rT8fx4o1kECOouRpp+pG3luvtMcotIpquGppieoaZenUcKhQUNrsSZAqHtiXPwBBzPI
 9XRSr/onK6MH6yDG9/EcPo5U9OP/u398lkl6oZoO7sg9Rf94RbUl+uGyfdh2P+NVk7xf
 wg9F9cziaUKYmyMd28Huy4FxV0YjfBLDkmJAztMncmb2ZfyhzmJmKFL2vkpfGO8RftBK
 oaAZNVAMR9W6zHHUpNTnoolYj8qIbJTaiMq+5lNIX0/5AiODjPWAx1kSfLX2qr33nYRq
 J0FA==
X-Gm-Message-State: AOAM530cwFtfgeAjNbwGpfrx7pwGWhN98XzZL1U9WvW2EZS7ZbtG2FbB
 +ESx+xinlTaD3VQ8LrFPPOJ5vJPK55A4B7pYZsljoJ9C+oXuwA==
X-Google-Smtp-Source: ABdhPJwNauNybMr3e0nq65AAb1X5RKn5b8lLDFm07RMakEueiqKCNjYpBGvQs3IytJ265Xo36FT+qyMRkunAjtws4ZY=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr3884523otg.303.1624381370676; 
 Tue, 22 Jun 2021 10:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210622130459.122723-1-christian.koenig@amd.com>
 <e01d3b99-ca6b-c6c2-a277-2fecf442ec16@gmail.com>
In-Reply-To: <e01d3b99-ca6b-c6c2-a277-2fecf442ec16@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Jun 2021 19:02:39 +0200
Message-ID: <CAKMK7uEh53gCinsGjOBto7tU9YLuS3S1CFaE=jXUOMbEoTC8Og@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 3:07 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Crap, hit enter to early before adding a cover letter.
>
> This is the same patch as before, but as requested I'm keeping the
> exclusive fence handling as it is for now.
>
> Daniel can you double check this and/or make sure that it is tested?
>
> I only smoke tested it and the code is so complicated that I'm not sure
> I catched all side effects.

So I've thought about this some more, and we actually have docs for
how this is supposed to work:

https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#implicit-fence=
-poll-support

Docs are pretty clear that we want both read and write for EPOLLOUT or
well both exclusive and shared fences. So I guess back to your actual
thing, but maybe we should get some acks from userspace people for it
(Michel, Pekka, Simon probably usual suspects).

The other thing I brought up and I haven't seen you reply to (maybe
missed it) is whether we shouldn't just use dma_resv_get_fences(). We
need to do the refcounting anyway, and this avoids us having to
open-code this very nasty code. Finally, and imo most important, this
is what's also used in drm_gem_fence_array_add_implicit(), which many
drivers use to handle their implicit in-fences. So would be nice to
have exactly matching code between that and what dma-buf poll does for
"can I read" and "can I write".

Thoughts?
-Daniel

>
> Regards,
> Christian.
>
> Am 22.06.21 um 15:04 schrieb Christian K=C3=B6nig:
> > Daniel pointed me towards this function and there are multiple obvious =
problems
> > in the implementation.
> >
> > First of all the retry loop is not working as intended. In general the =
retry
> > makes only sense if you grab the reference first and then check the seq=
uence
> > values.
> >
> > It's also good practice to keep the reference around when installing ca=
llbacks
> > to fences you don't own.
> >
> > And last the whole implementation was unnecessary complex and rather ha=
rd to
> > understand which could lead to probably unexpected behavior of the IOCT=
L.
> >
> > Fix all this by reworking the implementation from scratch.
> >
> > Only mildly tested and needs a thoughtful review of the code.
> >
> > v2: fix the reference counting as well
> > v3: keep the excl fence handling as is for stable
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > CC: stable@vger.kernel.org
> > ---
> >   drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++---------------------=
-
> >   include/linux/dma-buf.h   |   2 +-
> >   2 files changed, 55 insertions(+), 80 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index eadd1eaa2fb5..e97c3a9d98d5 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
> >        * If you hit this BUG() it means someone dropped their ref to th=
e
> >        * dma-buf while still having pending operation to the buffer.
> >        */
> > -     BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> > +     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >
> >       dmabuf->ops->release(dmabuf);
> >
> > @@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence *fen=
ce, struct dma_fence_cb *cb)
> >       wake_up_locked_poll(dcb->poll, dcb->active);
> >       dcb->active =3D 0;
> >       spin_unlock_irqrestore(&dcb->poll->lock, flags);
> > +     dma_fence_put(fence);
> >   }
> >
> >   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >   {
> > +     struct dma_buf_poll_cb_t *dcb;
> >       struct dma_buf *dmabuf;
> >       struct dma_resv *resv;
> >       struct dma_resv_list *fobj;
> >       struct dma_fence *fence_excl;
> > -     __poll_t events;
> >       unsigned shared_count, seq;
> > +     struct dma_fence *fence;
> > +     __poll_t events;
> > +     int r, i;
> >
> >       dmabuf =3D file->private_data;
> >       if (!dmabuf || !dmabuf->resv)
> > @@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *file, p=
oll_table *poll)
> >       if (!events)
> >               return 0;
> >
> > +     dcb =3D events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> > +
> > +     /* Only queue a new one if we are not still waiting for the old o=
ne */
> > +     spin_lock_irq(&dmabuf->poll.lock);
> > +     if (dcb->active)
> > +             events =3D 0;
> > +     else
> > +             dcb->active =3D events;
> > +     spin_unlock_irq(&dmabuf->poll.lock);
> > +     if (!events)
> > +             return 0;
> > +
> >   retry:
> >       seq =3D read_seqcount_begin(&resv->seq);
> >       rcu_read_lock();
> >
> >       fobj =3D rcu_dereference(resv->fence);
> > -     if (fobj)
> > +     if (fobj && events & EPOLLOUT)
> >               shared_count =3D fobj->shared_count;
> >       else
> >               shared_count =3D 0;
> > -     fence_excl =3D rcu_dereference(resv->fence_excl);
> > -     if (read_seqcount_retry(&resv->seq, seq)) {
> > -             rcu_read_unlock();
> > -             goto retry;
> > -     }
> >
> > -     if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=3D 0)=
) {
> > -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> > -             __poll_t pevents =3D EPOLLIN;
> > -
> > -             if (shared_count =3D=3D 0)
> > -                     pevents |=3D EPOLLOUT;
> > -
> > -             spin_lock_irq(&dmabuf->poll.lock);
> > -             if (dcb->active) {
> > -                     dcb->active |=3D pevents;
> > -                     events &=3D ~pevents;
> > -             } else
> > -                     dcb->active =3D pevents;
> > -             spin_unlock_irq(&dmabuf->poll.lock);
> > -
> > -             if (events & pevents) {
> > -                     if (!dma_fence_get_rcu(fence_excl)) {
> > -                             /* force a recheck */
> > -                             events &=3D ~pevents;
> > -                             dma_buf_poll_cb(NULL, &dcb->cb);
> > -                     } else if (!dma_fence_add_callback(fence_excl, &d=
cb->cb,
> > -                                                        dma_buf_poll_c=
b)) {
> > -                             events &=3D ~pevents;
> > -                             dma_fence_put(fence_excl);
> > -                     } else {
> > -                             /*
> > -                              * No callback queued, wake up any additi=
onal
> > -                              * waiters.
> > -                              */
> > -                             dma_fence_put(fence_excl);
> > -                             dma_buf_poll_cb(NULL, &dcb->cb);
> > -                     }
> > +     for (i =3D 0; i < shared_count; ++i) {
> > +             fence =3D rcu_dereference(fobj->shared[i]);
> > +             fence =3D dma_fence_get_rcu(fence);
> > +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> > +                     /* Concurrent modify detected, force re-check */
> > +                     dma_fence_put(fence);
> > +                     rcu_read_unlock();
> > +                     goto retry;
> >               }
> > -     }
> >
> > -     if ((events & EPOLLOUT) && shared_count > 0) {
> > -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> > -             int i;
> > -
> > -             /* Only queue a new callback if no event has fired yet */
> > -             spin_lock_irq(&dmabuf->poll.lock);
> > -             if (dcb->active)
> > -                     events &=3D ~EPOLLOUT;
> > -             else
> > -                     dcb->active =3D EPOLLOUT;
> > -             spin_unlock_irq(&dmabuf->poll.lock);
> > -
> > -             if (!(events & EPOLLOUT))
> > +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_pol=
l_cb);
> > +             if (!r) {
> > +                     /* Callback queued */
> > +                     events =3D 0;
> >                       goto out;
> > +             }
> > +             dma_fence_put(fence);
> > +     }
> >
> > -             for (i =3D 0; i < shared_count; ++i) {
> > -                     struct dma_fence *fence =3D rcu_dereference(fobj-=
>shared[i]);
> > -
> > -                     if (!dma_fence_get_rcu(fence)) {
> > -                             /*
> > -                              * fence refcount dropped to zero, this m=
eans
> > -                              * that fobj has been freed
> > -                              *
> > -                              * call dma_buf_poll_cb and force a reche=
ck!
> > -                              */
> > -                             events &=3D ~EPOLLOUT;
> > -                             dma_buf_poll_cb(NULL, &dcb->cb);
> > -                             break;
> > -                     }
> > -                     if (!dma_fence_add_callback(fence, &dcb->cb,
> > -                                                 dma_buf_poll_cb)) {
> > -                             dma_fence_put(fence);
> > -                             events &=3D ~EPOLLOUT;
> > -                             break;
> > -                     }
> > +     fence =3D dma_resv_get_excl(resv);
> > +     if (fence && shared_count =3D=3D 0) {
> > +             fence =3D dma_fence_get_rcu(fence);
> > +             if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> > +                     /* Concurrent modify detected, force re-check */
> >                       dma_fence_put(fence);
> > +                     rcu_read_unlock();
> > +                     goto retry;
> > +
> >               }
> >
> > -             /* No callback queued, wake up any additional waiters. */
> > -             if (i =3D=3D shared_count)
> > -                     dma_buf_poll_cb(NULL, &dcb->cb);
> > +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_pol=
l_cb);
> > +             if (!r) {
> > +                     /* Callback queued */
> > +                     events =3D 0;
> > +                     goto out;
> > +             }
> > +             dma_fence_put(fence_excl);
> >       }
> >
> > +     /* No callback queued, wake up any additional waiters. */
> > +     dma_buf_poll_cb(NULL, &dcb->cb);
> > +
> >   out:
> >       rcu_read_unlock();
> >       return events;
> > @@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
> >       dmabuf->owner =3D exp_info->owner;
> >       spin_lock_init(&dmabuf->name_lock);
> >       init_waitqueue_head(&dmabuf->poll);
> > -     dmabuf->cb_excl.poll =3D dmabuf->cb_shared.poll =3D &dmabuf->poll=
;
> > -     dmabuf->cb_excl.active =3D dmabuf->cb_shared.active =3D 0;
> > +     dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
> > +     dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> >
> >       if (!resv) {
> >               resv =3D (struct dma_resv *)&dmabuf[1];
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index efdc56b9d95f..7e747ad54c81 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -329,7 +329,7 @@ struct dma_buf {
> >               wait_queue_head_t *poll;
> >
> >               __poll_t active;
> > -     } cb_excl, cb_shared;
> > +     } cb_in, cb_out;
> >   };
> >
> >   /**
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
