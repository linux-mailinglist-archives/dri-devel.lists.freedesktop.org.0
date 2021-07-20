Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C23CF94E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BFA6E1DE;
	Tue, 20 Jul 2021 12:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CCB6E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:04:39 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 b24-20020a9d60d80000b02904d14e47202cso3899581otk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yJtrrNxgb1Ztf4F2tl56QqDiH/orFMfkFD31xqcv3go=;
 b=Rf6HLJn8OOnmhGZGB/ipx8f/ix7gYsrHHAD9De9xRU1LHsnFEKK4Vt20gt6d0luulV
 oSL5psknMqPUEY9SrtJwdyr8AEHTO09SLfSEROxFKJwsbK7M6F+bUp+m6Axyir+OtNrQ
 ue0TsUy/+PtqDfbSU/VUT/hCJvlVG11gXWgw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJtrrNxgb1Ztf4F2tl56QqDiH/orFMfkFD31xqcv3go=;
 b=qirIHTSYxmvninDnExCzqg9wHgTEXd1t4D4Gd9dTBmni17Zg23VbFAZVa7sLmNxyKY
 olbDa5JcOuRszrzem7j3DcRRu2sbC6TLHjsyjHelY/vH+Gz0/ovxX08estKj6FA2ERsQ
 9TaJDqR5f8xMSAZ1DrEQLnCAl34mpn/TECaels1sMnm/2bpn7D9NsGjo08fqV4BaEx1K
 J1sZPcOxK5GcbNnsX3HzA2otGo9gMnzLLUdMVa6+1ix4pj5Fi+GHnirv+b36J9e+5Qpu
 ysxkJqLHUo54ZK5uSwUlAHxFJfIpsb0955+QCIvm/n05lgWIhJ1CYYSZ89cJxj0j8ga4
 Fosw==
X-Gm-Message-State: AOAM531kK8p5eL2tYIXx7dHq0Dmy9HO59IuHtiL/25IwPKKPXw0xFrL9
 SjX3JrJ+gpRh5FDdBbe2U5ZxPBfDavP4taP2R5A4dQ==
X-Google-Smtp-Source: ABdhPJzBsEr/WIpnDaItiyicMCMIA0vXZ4UMZ6uvfoGiOppNweu2019YCu7xUl2k/4jkvmvPuZH0heWngBJE9fy0HbQ=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr8122799otp.188.1626782678681; 
 Tue, 20 Jul 2021 05:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210709120756.205856-1-christian.koenig@amd.com>
 <48c338fd-c0ab-39fb-a45d-17fd51fa47b7@gmail.com>
In-Reply-To: <48c338fd-c0ab-39fb-a45d-17fd51fa47b7@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 20 Jul 2021 14:04:27 +0200
Message-ID: <CAKMK7uH-f5FT2H6knhz=XJvLE3OOcWVm+5PmbxfAwXJKQYW-kA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v6
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 3:21 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Just a gentle ping. Or have I missed your reply?

Nah just got overwhelmed with dma-resv discussion and took a break. I
still think some igt (or reviewing what we have) would be good. We
could also just merge Jason's import/export series, since he's typed
the igts for that which us dma_buf poll.
-Daniel

>
> Thanks,
> Christian.
>
> Am 09.07.21 um 14:07 schrieb Christian K=C3=B6nig:
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
> > Then we should always also wait for the exclusive fence.
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
> > Fix all this by reworking the implementation from scratch. Dropping the
> > whole RCU approach and taking the lock instead.
> >
> > Only mildly tested and needs a thoughtful review of the code.
> >
> > v2: fix the reference counting as well
> > v3: keep the excl fence handling as is for stable
> > v4: back to testing all fences, drop RCU
> > v5: handle in and out separately
> > v6: add missing clear of events
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > CC: stable@vger.kernel.org
> > ---
> >   drivers/dma-buf/dma-buf.c | 156 +++++++++++++++++--------------------=
-
> >   include/linux/dma-buf.h   |   2 +-
> >   2 files changed, 72 insertions(+), 86 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index eadd1eaa2fb5..39e1ef872829 100644
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
> > @@ -202,16 +202,57 @@ static void dma_buf_poll_cb(struct dma_fence *fen=
ce, struct dma_fence_cb *cb)
> >       wake_up_locked_poll(dcb->poll, dcb->active);
> >       dcb->active =3D 0;
> >       spin_unlock_irqrestore(&dcb->poll->lock, flags);
> > +     dma_fence_put(fence);
> > +}
> > +
> > +static bool dma_buf_poll_shared(struct dma_resv *resv,
> > +                             struct dma_buf_poll_cb_t *dcb)
> > +{
> > +     struct dma_resv_list *fobj =3D dma_resv_get_list(resv);
> > +     struct dma_fence *fence;
> > +     int i, r;
> > +
> > +     if (!fobj)
> > +             return false;
> > +
> > +     for (i =3D 0; i < fobj->shared_count; ++i) {
> > +             fence =3D rcu_dereference_protected(fobj->shared[i],
> > +                                               dma_resv_held(resv));
> > +             dma_fence_get(fence);
> > +             r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_pol=
l_cb);
> > +             if (!r)
> > +                     return true;
> > +             dma_fence_put(fence);
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static bool dma_buf_poll_excl(struct dma_resv *resv,
> > +                           struct dma_buf_poll_cb_t *dcb)
> > +{
> > +     struct dma_fence *fence =3D dma_resv_get_excl(resv);
> > +     int r;
> > +
> > +     if (!fence)
> > +             return false;
> > +
> > +     dma_fence_get(fence);
> > +     r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> > +     if (!r)
> > +             return true;
> > +     dma_fence_put(fence);
> > +
> > +     return false;
> >   }
> >
> >   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >   {
> >       struct dma_buf *dmabuf;
> >       struct dma_resv *resv;
> > -     struct dma_resv_list *fobj;
> > -     struct dma_fence *fence_excl;
> > +     unsigned shared_count;
> >       __poll_t events;
> > -     unsigned shared_count, seq;
> > +     int r, i;
> >
> >       dmabuf =3D file->private_data;
> >       if (!dmabuf || !dmabuf->resv)
> > @@ -225,101 +266,46 @@ static __poll_t dma_buf_poll(struct file *file, =
poll_table *poll)
> >       if (!events)
> >               return 0;
> >
> > -retry:
> > -     seq =3D read_seqcount_begin(&resv->seq);
> > -     rcu_read_lock();
> > -
> > -     fobj =3D rcu_dereference(resv->fence);
> > -     if (fobj)
> > -             shared_count =3D fobj->shared_count;
> > -     else
> > -             shared_count =3D 0;
> > -     fence_excl =3D rcu_dereference(resv->fence_excl);
> > -     if (read_seqcount_retry(&resv->seq, seq)) {
> > -             rcu_read_unlock();
> > -             goto retry;
> > -     }
> > +     dma_resv_lock(resv, NULL);
> >
> > -     if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=3D 0)=
) {
> > -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> > -             __poll_t pevents =3D EPOLLIN;
> > -
> > -             if (shared_count =3D=3D 0)
> > -                     pevents |=3D EPOLLOUT;
> > +     if (events & EPOLLOUT) {
> > +             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_out;
> >
> > +             /* Check that callback isn't busy */
> >               spin_lock_irq(&dmabuf->poll.lock);
> > -             if (dcb->active) {
> > -                     dcb->active |=3D pevents;
> > -                     events &=3D ~pevents;
> > -             } else
> > -                     dcb->active =3D pevents;
> > +             if (dcb->active)
> > +                     events &=3D ~EPOLLOUT;
> > +             else
> > +                     dcb->active =3D EPOLLOUT;
> >               spin_unlock_irq(&dmabuf->poll.lock);
> >
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
> > -             }
> > +             if (events & EPOLLOUT && !dma_buf_poll_shared(resv, dcb) =
&&
> > +                 !dma_buf_poll_excl(resv, dcb))
> > +                     /* No callback queued, wake up any other waiters =
*/
> > +                     dma_buf_poll_cb(NULL, &dcb->cb);
> > +             else
> > +                     events &=3D ~EPOLLOUT;
> >       }
> >
> > -     if ((events & EPOLLOUT) && shared_count > 0) {
> > -             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> > -             int i;
> > +     if (events & EPOLLIN) {
> > +             struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_in;
> >
> > -             /* Only queue a new callback if no event has fired yet */
> > +             /* Check that callback isn't busy */
> >               spin_lock_irq(&dmabuf->poll.lock);
> >               if (dcb->active)
> > -                     events &=3D ~EPOLLOUT;
> > +                     events &=3D ~EPOLLIN;
> >               else
> > -                     dcb->active =3D EPOLLOUT;
> > +                     dcb->active =3D EPOLLIN;
> >               spin_unlock_irq(&dmabuf->poll.lock);
> >
> > -             if (!(events & EPOLLOUT))
> > -                     goto out;
> > -
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
> > -                     dma_fence_put(fence);
> > -             }
> > -
> > -             /* No callback queued, wake up any additional waiters. */
> > -             if (i =3D=3D shared_count)
> > +             if (events & EPOLLIN && !dma_buf_poll_excl(resv, dcb))
> > +                     /* No callback queued, wake up any other waiters =
*/
> >                       dma_buf_poll_cb(NULL, &dcb->cb);
> > +             else
> > +                     events &=3D ~EPOLLIN;
> >       }
> >
> > -out:
> > -     rcu_read_unlock();
> > +     dma_resv_unlock(resv);
> >       return events;
> >   }
> >
> > @@ -562,8 +548,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
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
