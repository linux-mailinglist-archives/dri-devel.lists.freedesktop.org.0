Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F13B8715
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 18:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4C6EA06;
	Wed, 30 Jun 2021 16:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C086EA40
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 16:29:54 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id w127so3662561oig.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AiVOFJ4mK9DwfACSL2mwvmlenSe9Kdtaickp3diBABQ=;
 b=hHHe3Gz8CKTXgOWnIW83jh/oADW7xjeqH54WqWXHDkE4PXO8Dp1i2IBnXtbAZU2gK3
 yGJDDhphwf1VF3hZ/n7lJbA/UuY43XUlDcjj/8eYTVcaZsxiYRwLtQalZfWbE61zFSe/
 UMpmiy7CeKgOHzc8rfVi5L4jMCU2zsr7KGqwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AiVOFJ4mK9DwfACSL2mwvmlenSe9Kdtaickp3diBABQ=;
 b=mx6p7Af0jfqZfucf8VjfjCHuuThMZX8n8glm7jmh7Epwu1vI/5ProV32IGYCVXcElB
 Rmnmr4zRk7QaA55rP3H9m6ubxtn+P/V1RtcD5Rp0s1kTr/Excp1k+2JiOKsr/sQxzwh3
 v7kP8y4lhOk2h2FHkT9Wm1r/QaXhFBOLaUhwTM+kLDxMbW8G3O5YbcBJKvwsEVyyob/+
 yg/o4q3abhDpTtJi+OY9BX/bynIZHuECUDZinqOzr++KRNIAwfuHvaYpfstA2tC68EkE
 OdN3aY30bDFHHAlF9gu8q3mzme4cKKFtSoPOeAKX36MrMMaUnT1qoIpiGeo00ymPbLQx
 Xtcg==
X-Gm-Message-State: AOAM53314X4TxItVVAyFwq86YoCZO782GDu++BZwVcD358+O1JKYp5oc
 n6/dfcgmowMIoQX9xSJFc9Fli1HbCr9Sfax8s+qCfM1v2z7tAQ==
X-Google-Smtp-Source: ABdhPJxwRiGKARe6qisL4U0hqNwtbImMRoR7pv+/4bT0DASCce2NcIz/pssUa76WF88/VOURkkWx8dTm2TbBRhVbBw4=
X-Received: by 2002:aca:1a0c:: with SMTP id a12mr3562610oia.14.1625070593664; 
 Wed, 30 Jun 2021 09:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630123618.97534-1-christian.koenig@amd.com>
 <CAKMK7uFSzDv-ZPNECjQMzmF9PDHzYE0ovgMfP44AUkJCcm=7kw@mail.gmail.com>
 <9b4213b4-e11b-7b2a-e651-01ccceea132d@gmail.com>
In-Reply-To: <9b4213b4-e11b-7b2a-e651-01ccceea132d@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 30 Jun 2021 18:29:42 +0200
Message-ID: <CAKMK7uFowuBQSL4--b_CPaNEBT=M9bqeGYMaEQHZ=aUiXU4TRQ@mail.gmail.com>
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

On Wed, Jun 30, 2021 at 4:22 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 30.06.21 um 16:07 schrieb Daniel Vetter:
> > On Wed, Jun 30, 2021 at 2:36 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Daniel pointed me towards this function and there are multiple obvious=
 problems
> >> in the implementation.
> >>
> >> First of all the retry loop is not working as intended. In general the=
 retry
> >> makes only sense if you grab the reference first and then check the se=
quence
> >> values.
> >>
> >> Then we should always also wait for the exclusive fence.
> >>
> >> It's also good practice to keep the reference around when installing c=
allbacks
> >> to fences you don't own.
> >>
> >> And last the whole implementation was unnecessary complex and rather h=
ard to
> >> understand which could lead to probably unexpected behavior of the IOC=
TL.
> >>
> >> Fix all this by reworking the implementation from scratch. Dropping th=
e
> >> whole RCU approach and taking the lock instead.
> >>
> >> Only mildly tested and needs a thoughtful review of the code.
> > prime_vgem.c has some basic stuff, but it might actually encoding the
> > broken behaviour. Would be good to extend/fix that I think so we don't
> > entirely rely on review. We can't really build easily on top of the
> > testcase Jason created for import/export, since for implicit sync we
> > need some driver that attaches the fences for us.
>
> My question is if I can just send that to
> intel-gfx@lists.freedesktop.org and the CI will pick it up?

We do run all the prime_vgem tests.

Btw if you do an igt patch, you can tell CI to run that igt patch
series together with your kernel submission. Pretty useful for hackery
like this, documented how it works here:

https://intel-gfx-ci.01.org/test-with.html

>
> >
> > There's also a vc4 one, but I guess that's less useful for us :-)
> >
> >> v2: fix the reference counting as well
> >> v3: keep the excl fence handling as is for stable
> >> v4: back to testing all fences, drop RCU
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> CC: stable@vger.kernel.org
> >> ---
> >>   drivers/dma-buf/dma-buf.c | 132 +++++++++++++-----------------------=
--
> >>   include/linux/dma-buf.h   |   2 +-
> >>   2 files changed, 46 insertions(+), 88 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index eadd1eaa2fb5..192c4d34704b 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
> >>           * If you hit this BUG() it means someone dropped their ref t=
o the
> >>           * dma-buf while still having pending operation to the buffer=
.
> >>           */
> >> -       BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> >> +       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>
> >>          dmabuf->ops->release(dmabuf);
> >>
> >> @@ -202,16 +202,19 @@ static void dma_buf_poll_cb(struct dma_fence *fe=
nce, struct dma_fence_cb *cb)
> >>          wake_up_locked_poll(dcb->poll, dcb->active);
> >>          dcb->active =3D 0;
> >>          spin_unlock_irqrestore(&dcb->poll->lock, flags);
> >> +       dma_fence_put(fence);
> >>   }
> >>
> >>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >>   {
> >> +       struct dma_buf_poll_cb_t *dcb;
> >>          struct dma_buf *dmabuf;
> >>          struct dma_resv *resv;
> >>          struct dma_resv_list *fobj;
> >> -       struct dma_fence *fence_excl;
> >> +       struct dma_fence *fence;
> >> +       unsigned shared_count;
> >>          __poll_t events;
> >> -       unsigned shared_count, seq;
> >> +       int r, i;
> >>
> >>          dmabuf =3D file->private_data;
> >>          if (!dmabuf || !dmabuf->resv)
> >> @@ -225,101 +228,56 @@ static __poll_t dma_buf_poll(struct file *file,=
 poll_table *poll)
> >>          if (!events)
> >>                  return 0;
> >>
> >> -retry:
> >> -       seq =3D read_seqcount_begin(&resv->seq);
> >> -       rcu_read_lock();
> >> +       dcb =3D events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> >> +
> >> +       /* Only queue a new one if we are not still waiting for the ol=
d one */
> >> +       spin_lock_irq(&dmabuf->poll.lock);
> >> +       if (dcb->active)
> >> +               events =3D 0;
> >> +       else
> >> +               dcb->active =3D events;
> >> +       spin_unlock_irq(&dmabuf->poll.lock);
> >> +       if (!events)
> >> +               return 0;
> >> +
> >> +       dma_resv_lock(resv, NULL);
> >>
> >> -       fobj =3D rcu_dereference(resv->fence);
> >> -       if (fobj)
> >> +       fobj =3D dma_resv_get_list(resv);
> >> +       if (fobj && events & EPOLLOUT)
> >>                  shared_count =3D fobj->shared_count;
> >>          else
> >>                  shared_count =3D 0;
> >> -       fence_excl =3D rcu_dereference(resv->fence_excl);
> >> -       if (read_seqcount_retry(&resv->seq, seq)) {
> >> -               rcu_read_unlock();
> >> -               goto retry;
> >> -       }
> >>
> >> -       if (fence_excl && (!(events & EPOLLOUT) || shared_count =3D=3D=
 0)) {
> >> -               struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_excl;
> >> -               __poll_t pevents =3D EPOLLIN;
> >> -
> >> -               if (shared_count =3D=3D 0)
> >> -                       pevents |=3D EPOLLOUT;
> >> -
> >> -               spin_lock_irq(&dmabuf->poll.lock);
> >> -               if (dcb->active) {
> >> -                       dcb->active |=3D pevents;
> >> -                       events &=3D ~pevents;
> >> -               } else
> >> -                       dcb->active =3D pevents;
> >> -               spin_unlock_irq(&dmabuf->poll.lock);
> >> -
> >> -               if (events & pevents) {
> >> -                       if (!dma_fence_get_rcu(fence_excl)) {
> >> -                               /* force a recheck */
> >> -                               events &=3D ~pevents;
> >> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> >> -                       } else if (!dma_fence_add_callback(fence_excl,=
 &dcb->cb,
> >> -                                                          dma_buf_pol=
l_cb)) {
> >> -                               events &=3D ~pevents;
> >> -                               dma_fence_put(fence_excl);
> >> -                       } else {
> >> -                               /*
> >> -                                * No callback queued, wake up any add=
itional
> >> -                                * waiters.
> >> -                                */
> >> -                               dma_fence_put(fence_excl);
> >> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> >> -                       }
> >> +       for (i =3D 0; i < shared_count; ++i) {
> >> +               fence =3D rcu_dereference_protected(fobj->shared[i],
> >> +                                                 dma_resv_held(resv))=
;
> >> +               dma_fence_get(fence);
> >> +               r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_=
poll_cb);
> >> +               if (!r) {
> >> +                       /* Callback queued */
> >> +                       events =3D 0;
> > Why do you clear events here? There's more than EPOLLIN/OUT, and I
> > think you can also set both (and then we should be able to queue
> > both). I think a few more testcases for this would be really good. I
> > think the old code all handled that like I'd expect it to.
>
> Yeah, that's exactly the stuff I was wondering about since I'm not so
> familiar with the poll interface.

tbh I don't have much clue either, I think we need to decide this with
some testcases. The poll support in the kernel is pretty impressive
amounts of magic since it works for all variants of poll. At least I
think it's rather much clever and tricky to understand as an outsider
...
-Daniel

> Going to fix that.
>
> Thanks,
> Christian.
>
> >
> > Cheers, Daniel
> >
> >> +                       goto out;
> >>                  }
> >> +               dma_fence_put(fence);
> >>          }
> >>
> >> -       if ((events & EPOLLOUT) && shared_count > 0) {
> >> -               struct dma_buf_poll_cb_t *dcb =3D &dmabuf->cb_shared;
> >> -               int i;
> >> -
> >> -               /* Only queue a new callback if no event has fired yet=
 */
> >> -               spin_lock_irq(&dmabuf->poll.lock);
> >> -               if (dcb->active)
> >> -                       events &=3D ~EPOLLOUT;
> >> -               else
> >> -                       dcb->active =3D EPOLLOUT;
> >> -               spin_unlock_irq(&dmabuf->poll.lock);
> >> -
> >> -               if (!(events & EPOLLOUT))
> >> +       fence =3D dma_resv_get_excl(resv);
> >> +       if (fence) {
> >> +               dma_fence_get(fence);
> >> +               r =3D dma_fence_add_callback(fence, &dcb->cb, dma_buf_=
poll_cb);
> >> +               if (!r) {
> >> +                       /* Callback queued */
> >> +                       events =3D 0;
> >>                          goto out;
> >> -
> >> -               for (i =3D 0; i < shared_count; ++i) {
> >> -                       struct dma_fence *fence =3D rcu_dereference(fo=
bj->shared[i]);
> >> -
> >> -                       if (!dma_fence_get_rcu(fence)) {
> >> -                               /*
> >> -                                * fence refcount dropped to zero, thi=
s means
> >> -                                * that fobj has been freed
> >> -                                *
> >> -                                * call dma_buf_poll_cb and force a re=
check!
> >> -                                */
> >> -                               events &=3D ~EPOLLOUT;
> >> -                               dma_buf_poll_cb(NULL, &dcb->cb);
> >> -                               break;
> >> -                       }
> >> -                       if (!dma_fence_add_callback(fence, &dcb->cb,
> >> -                                                   dma_buf_poll_cb)) =
{
> >> -                               dma_fence_put(fence);
> >> -                               events &=3D ~EPOLLOUT;
> >> -                               break;
> >> -                       }
> >> -                       dma_fence_put(fence);
> >>                  }
> >> -
> >> -               /* No callback queued, wake up any additional waiters.=
 */
> >> -               if (i =3D=3D shared_count)
> >> -                       dma_buf_poll_cb(NULL, &dcb->cb);
> >> +               dma_fence_put(fence);
> >>          }
> >>
> >> +       /* No callback queued, wake up any additional waiters. */
> >> +       dma_buf_poll_cb(NULL, &dcb->cb);
> >> +
> >>   out:
> >> -       rcu_read_unlock();
> >> +       dma_resv_unlock(resv);
> >>          return events;
> >>   }
> >>
> >> @@ -562,8 +520,8 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >>          dmabuf->owner =3D exp_info->owner;
> >>          spin_lock_init(&dmabuf->name_lock);
> >>          init_waitqueue_head(&dmabuf->poll);
> >> -       dmabuf->cb_excl.poll =3D dmabuf->cb_shared.poll =3D &dmabuf->p=
oll;
> >> -       dmabuf->cb_excl.active =3D dmabuf->cb_shared.active =3D 0;
> >> +       dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
> >> +       dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> >>
> >>          if (!resv) {
> >>                  resv =3D (struct dma_resv *)&dmabuf[1];
> >> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >> index efdc56b9d95f..7e747ad54c81 100644
> >> --- a/include/linux/dma-buf.h
> >> +++ b/include/linux/dma-buf.h
> >> @@ -329,7 +329,7 @@ struct dma_buf {
> >>                  wait_queue_head_t *poll;
> >>
> >>                  __poll_t active;
> >> -       } cb_excl, cb_shared;
> >> +       } cb_in, cb_out;
> >>   };
> >>
> >>   /**
> >> --
> >> 2.25.1
> >>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
