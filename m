Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B83B84BB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC596E9DF;
	Wed, 30 Jun 2021 14:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EBD6E9DF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 14:07:35 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id 22so3125815oix.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a+oKkrTev0KMUowcfMo5m/4I8U8rMZfJzHYdHp+lGFc=;
 b=F4SMdi41to6kHeXP4nv3TUW/vcKnOq2jVmobfvypUiK/i35s5H3oYSYqX7vuFm75r/
 vgW6FSzM7plRyD6dKkqmlQn2r0NHA3vONe6qNWkr1Fe6Xz9wtgYP30ObhUoZgjqv/r++
 9S+ckBT/KgBE/VH5Ebt9S80KbrBT4v12ONU9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a+oKkrTev0KMUowcfMo5m/4I8U8rMZfJzHYdHp+lGFc=;
 b=l19uU+YBxxdw+nbokDy9M8Gj5Zj60aDZSI7efiS5c4fXEjxw4o8KQnXZXFYc0CIFq7
 3lQBOCfDOWsN6o+wwPD0Z0c3AP2u8GisECu2GP99MpD17W4dwAnv27Jd4RVuli44VBzo
 b7YGjVU9v5nHJot6cpS6a+qDolWgZqGLAdK7SVzyEZl+r7yjFUUVUXrc1FWk0as4ku0G
 cjOpzbMj3S1ZXv5euBstji6FhuQvJ7pYAHeGfNa6efi+N77Yio1Ega3T5ef6rY+xxN7Y
 I+6VIgN1qiufKa+puSLD1qsAuj2WUZZfzxeVPF4DhqqNyee8sdA6ztuCkfrIPmb8MOjC
 RSqg==
X-Gm-Message-State: AOAM530InB8FEORiMqmqMpx77V3akn0nGIkTWOWu3pegPFy8FaOcJvxT
 TTx0Nv0FBunA1KFShFGemgZzZ0urwi+NIajFel40BQ==
X-Google-Smtp-Source: ABdhPJw2N1mOH2jYzUgxCjqKqdACUe7ZUY+QcMI8TjfiCFyIXSSMLDQTbOZ7Lot0tv5XO8q6LFzm8IMijMZsDBAHBKM=
X-Received: by 2002:aca:4dc5:: with SMTP id a188mr4213359oib.128.1625062054984; 
 Wed, 30 Jun 2021 07:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210630123618.97534-1-christian.koenig@amd.com>
In-Reply-To: <20210630123618.97534-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 30 Jun 2021 16:07:23 +0200
Message-ID: <CAKMK7uFSzDv-ZPNECjQMzmF9PDHzYE0ovgMfP44AUkJCcm=7kw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v4
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

On Wed, Jun 30, 2021 at 2:36 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Daniel pointed me towards this function and there are multiple obvious pr=
oblems
> in the implementation.
>
> First of all the retry loop is not working as intended. In general the re=
try
> makes only sense if you grab the reference first and then check the seque=
nce
> values.
>
> Then we should always also wait for the exclusive fence.
>
> It's also good practice to keep the reference around when installing call=
backs
> to fences you don't own.
>
> And last the whole implementation was unnecessary complex and rather hard=
 to
> understand which could lead to probably unexpected behavior of the IOCTL.
>
> Fix all this by reworking the implementation from scratch. Dropping the
> whole RCU approach and taking the lock instead.
>
> Only mildly tested and needs a thoughtful review of the code.

prime_vgem.c has some basic stuff, but it might actually encoding the
broken behaviour. Would be good to extend/fix that I think so we don't
entirely rely on review. We can't really build easily on top of the
testcase Jason created for import/export, since for implicit sync we
need some driver that attaches the fences for us.

There's also a vc4 one, but I guess that's less useful for us :-)

> v2: fix the reference counting as well
> v3: keep the excl fence handling as is for stable
> v4: back to testing all fences, drop RCU
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>  drivers/dma-buf/dma-buf.c | 132 +++++++++++++-------------------------
>  include/linux/dma-buf.h   |   2 +-
>  2 files changed, 46 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..192c4d34704b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
>          * If you hit this BUG() it means someone dropped their ref to th=
e
>          * dma-buf while still having pending operation to the buffer.
>          */
> -       BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> +       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>
>         dmabuf->ops->release(dmabuf);
>
> @@ -202,16 +202,19 @@ static void dma_buf_poll_cb(struct dma_fence *fence=
, struct dma_fence_cb *cb)
>         wake_up_locked_poll(dcb->poll, dcb->active);
>         dcb->active =3D 0;
>         spin_unlock_irqrestore(&dcb->poll->lock, flags);
> +       dma_fence_put(fence);
>  }
>
>  static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  {
> +       struct dma_buf_poll_cb_t *dcb;
>         struct dma_buf *dmabuf;
>         struct dma_resv *resv;
>         struct dma_resv_list *fobj;
> -       struct dma_fence *fence_excl;
> +       struct dma_fence *fence;
> +       unsigned shared_count;
>         __poll_t events;
> -       unsigned shared_count, seq;
> +       int r, i;
>
>         dmabuf =3D file->private_data;
>         if (!dmabuf || !dmabuf->resv)
> @@ -225,101 +228,56 @@ static __poll_t dma_buf_poll(struct file *file, po=
ll_table *poll)
>         if (!events)
>                 return 0;
>
> -retry:
> -       seq =3D read_seqcount_begin(&resv->seq);
> -       rcu_read_lock();
> +       dcb =3D events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> +
> +       /* Only queue a new one if we are not still waiting for the old o=
ne */
> +       spin_lock_irq(&dmabuf->poll.lock);
> +       if (dcb->active)
> +               events =3D 0;
> +       else
> +               dcb->active =3D events;
> +       spin_unlock_irq(&dmabuf->poll.lock);
> +       if (!events)
> +               return 0;
> +
> +       dma_resv_lock(resv, NULL);
>
> -       fobj =3D rcu_dereference(resv->fence);
> -       if (fobj)
> +       fobj =3D dma_resv_get_list(resv);
> +       if (fobj && events & EPOLLOUT)
>                 shared_count =3D fobj->shared_count;
>         else
>                 shared_count =3D 0;
> -       fence_excl =3D rcu_dereference(resv->fence_excl);
> -       if (read_seqcount_retry(&resv->seq, seq)) {
> -               rcu_read_unlock();
> -               goto retry;
> -       }
>
> -       if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=3D 0)=
) {
> -               struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> -               __poll_t pevents =3D EPOLLIN;
> -
> -               if (shared_count =3D=3D 0)
> -                       pevents |=3D EPOLLOUT;
> -
> -               spin_lock_irq(&dmabuf->poll.lock);
> -               if (dcb->active) {
> -                       dcb->active |=3D pevents;
> -                       events &=3D ~pevents;
> -               } else
> -                       dcb->active =3D pevents;
> -               spin_unlock_irq(&dmabuf->poll.lock);
> -
> -               if (events & pevents) {
> -                       if (!dma_fence_get_rcu(fence_excl)) {
> -                               /* force a recheck */
> -                               events &=3D ~pevents;
> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> -                       } else if (!dma_fence_add_callback(fence_excl, &d=
cb->cb,
> -                                                          dma_buf_poll_c=
b)) {
> -                               events &=3D ~pevents;
> -                               dma_fence_put(fence_excl);
> -                       } else {
> -                               /*
> -                                * No callback queued, wake up any additi=
onal
> -                                * waiters.
> -                                */
> -                               dma_fence_put(fence_excl);
> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> -                       }
> +       for (i =3D 0; i < shared_count; ++i) {
> +               fence =3D rcu_dereference_protected(fobj->shared[i],
> +                                                 dma_resv_held(resv));
> +               dma_fence_get(fence);
> +               r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_pol=
l_cb);
> +               if (!r) {
> +                       /* Callback queued */
> +                       events =3D 0;

Why do you clear events here? There's more than EPOLLIN/OUT, and I
think you can also set both (and then we should be able to queue
both). I think a few more testcases for this would be really good. I
think the old code all handled that like I'd expect it to.

Cheers, Daniel

> +                       goto out;
>                 }
> +               dma_fence_put(fence);
>         }
>
> -       if ((events & EPOLLOUT) && shared_count > 0) {
> -               struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> -               int i;
> -
> -               /* Only queue a new callback if no event has fired yet */
> -               spin_lock_irq(&dmabuf->poll.lock);
> -               if (dcb->active)
> -                       events &=3D ~EPOLLOUT;
> -               else
> -                       dcb->active =3D EPOLLOUT;
> -               spin_unlock_irq(&dmabuf->poll.lock);
> -
> -               if (!(events & EPOLLOUT))
> +       fence =3D dma_resv_get_excl(resv);
> +       if (fence) {
> +               dma_fence_get(fence);
> +               r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_pol=
l_cb);
> +               if (!r) {
> +                       /* Callback queued */
> +                       events =3D 0;
>                         goto out;
> -
> -               for (i =3D 0; i < shared_count; ++i) {
> -                       struct dma_fence *fence =3D rcu_dereference(fobj-=
>shared[i]);
> -
> -                       if (!dma_fence_get_rcu(fence)) {
> -                               /*
> -                                * fence refcount dropped to zero, this m=
eans
> -                                * that fobj has been freed
> -                                *
> -                                * call dma_buf_poll_cb and force a reche=
ck!
> -                                */
> -                               events &=3D ~EPOLLOUT;
> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> -                               break;
> -                       }
> -                       if (!dma_fence_add_callback(fence, &dcb->cb,
> -                                                   dma_buf_poll_cb)) {
> -                               dma_fence_put(fence);
> -                               events &=3D ~EPOLLOUT;
> -                               break;
> -                       }
> -                       dma_fence_put(fence);
>                 }
> -
> -               /* No callback queued, wake up any additional waiters. */
> -               if (i =3D=3D shared_count)
> -                       dma_buf_poll_cb(NULL, &dcb->cb);
> +               dma_fence_put(fence);
>         }
>
> +       /* No callback queued, wake up any additional waiters. */
> +       dma_buf_poll_cb(NULL, &dcb->cb);
> +
>  out:
> -       rcu_read_unlock();
> +       dma_resv_unlock(resv);
>         return events;
>  }
>
> @@ -562,8 +520,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_e=
xport_info *exp_info)
>         dmabuf->owner =3D exp_info->owner;
>         spin_lock_init(&dmabuf->name_lock);
>         init_waitqueue_head(&dmabuf->poll);
> -       dmabuf->cb_excl.poll =3D dmabuf->cb_shared.poll =3D &dmabuf->poll=
;
> -       dmabuf->cb_excl.active =3D dmabuf->cb_shared.active =3D 0;
> +       dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
> +       dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
>
>         if (!resv) {
>                 resv =3D (struct dma_resv *)&dmabuf[1];
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..7e747ad54c81 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -329,7 +329,7 @@ struct dma_buf {
>                 wait_queue_head_t *poll;
>
>                 __poll_t active;
> -       } cb_excl, cb_shared;
> +       } cb_in, cb_out;
>  };
>
>  /**
> --
> 2.25.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
