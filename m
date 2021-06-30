Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E83B84FF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63CF89FA5;
	Wed, 30 Jun 2021 14:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA489FA5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 14:22:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id b2so4507156ejg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=V6i8g+/lrkWwqIm7WEuYQt3CKl72XoLYqb+LAUIPpEk=;
 b=bHgFWgT/OpzOpkPnBYQpp6JTuQJZ1VCrMBVL8cRFWKqXRJPKwMLcPm3W/cplRXXK+h
 yD5RhqlxoDvEsj7f6+84qLQWbTgLRQSPkss40b/wVYXfCrD+a/39RJjwHaQPL82aIlt4
 o3M8LOKOTWYMwwwhzUXtVUvwR3685Au+Ze7H6d5Rm7lY4PivlntpE7XABoRfCxDi0rll
 T6jKBtqhCE8VuGff6Y8cUxos6Gk81Qg2rZh7zGuJAy0SI4RlXjPwkyGONlka1bUfyOU4
 nEEMWPnGPXziDSAZVp+HmGWaI60ruNoZwPWsNo/1W7zgslLDp/cX78QsI0Pg62EXVClE
 DKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V6i8g+/lrkWwqIm7WEuYQt3CKl72XoLYqb+LAUIPpEk=;
 b=iIjhx1Te7i0MbKwH5EI/qcWbv8RTwdl7Vb9PLHC5sV+2ZYmw2U7n8X4POdgE9TT/zp
 LPw4Vvt5afpzQ5U+61rIo3eMO46Jei0ufdGdDdhBawAXDHW4nGK6PEhHOFPBsnyF9Ilj
 HHEyenVKBXOZMJ//zxc5NWEfUI+TUx4J1fc+qjdZLQdxDm8fmIkKzs9Wzn+xTsFv0l93
 Y0x/+TJKpntmS6te/n57jejyMVSW66WJh9kXuL/4N8zppZ9kUNMHzIcdcfpboiG7DLPD
 t/WMqMISN4SFthxUsCOWF3EKyKPlzoQhs6fUX5t1b68i4MuXlEulAmLDLXQZ8ACXfdaG
 uP+g==
X-Gm-Message-State: AOAM530TWwXV3ugqtvoYakWmYeGKaToOXZHfrOADg6nvmeae2BeSuxrS
 epeO8KRknbWJvrvaOcmmFfIyjLBectY=
X-Google-Smtp-Source: ABdhPJwDYymQMhfp370CGA62qRtZI1jDC/jYcOagMgYVxhg3RdzxJP7hxKnTY+gp6DIkMMRtnYdMAw==
X-Received: by 2002:a17:906:1704:: with SMTP id
 c4mr36068369eje.182.1625062938151; 
 Wed, 30 Jun 2021 07:22:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fd79:22d7:4c21:2421?
 ([2a02:908:1252:fb60:fd79:22d7:4c21:2421])
 by smtp.gmail.com with ESMTPSA id c15sm13015626edu.19.2021.06.30.07.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:22:17 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v4
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210630123618.97534-1-christian.koenig@amd.com>
 <CAKMK7uFSzDv-ZPNECjQMzmF9PDHzYE0ovgMfP44AUkJCcm=7kw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9b4213b4-e11b-7b2a-e651-01ccceea132d@gmail.com>
Date: Wed, 30 Jun 2021 16:22:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFSzDv-ZPNECjQMzmF9PDHzYE0ovgMfP44AUkJCcm=7kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 30.06.21 um 16:07 schrieb Daniel Vetter:
> On Wed, Jun 30, 2021 at 2:36 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Daniel pointed me towards this function and there are multiple obvious problems
>> in the implementation.
>>
>> First of all the retry loop is not working as intended. In general the retry
>> makes only sense if you grab the reference first and then check the sequence
>> values.
>>
>> Then we should always also wait for the exclusive fence.
>>
>> It's also good practice to keep the reference around when installing callbacks
>> to fences you don't own.
>>
>> And last the whole implementation was unnecessary complex and rather hard to
>> understand which could lead to probably unexpected behavior of the IOCTL.
>>
>> Fix all this by reworking the implementation from scratch. Dropping the
>> whole RCU approach and taking the lock instead.
>>
>> Only mildly tested and needs a thoughtful review of the code.
> prime_vgem.c has some basic stuff, but it might actually encoding the
> broken behaviour. Would be good to extend/fix that I think so we don't
> entirely rely on review. We can't really build easily on top of the
> testcase Jason created for import/export, since for implicit sync we
> need some driver that attaches the fences for us.

My question is if I can just send that to 
intel-gfx@lists.freedesktop.org and the CI will pick it up?

>
> There's also a vc4 one, but I guess that's less useful for us :-)
>
>> v2: fix the reference counting as well
>> v3: keep the excl fence handling as is for stable
>> v4: back to testing all fences, drop RCU
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
>> ---
>>   drivers/dma-buf/dma-buf.c | 132 +++++++++++++-------------------------
>>   include/linux/dma-buf.h   |   2 +-
>>   2 files changed, 46 insertions(+), 88 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index eadd1eaa2fb5..192c4d34704b 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
>>           * If you hit this BUG() it means someone dropped their ref to the
>>           * dma-buf while still having pending operation to the buffer.
>>           */
>> -       BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>> +       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>
>>          dmabuf->ops->release(dmabuf);
>>
>> @@ -202,16 +202,19 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>          wake_up_locked_poll(dcb->poll, dcb->active);
>>          dcb->active = 0;
>>          spin_unlock_irqrestore(&dcb->poll->lock, flags);
>> +       dma_fence_put(fence);
>>   }
>>
>>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>>   {
>> +       struct dma_buf_poll_cb_t *dcb;
>>          struct dma_buf *dmabuf;
>>          struct dma_resv *resv;
>>          struct dma_resv_list *fobj;
>> -       struct dma_fence *fence_excl;
>> +       struct dma_fence *fence;
>> +       unsigned shared_count;
>>          __poll_t events;
>> -       unsigned shared_count, seq;
>> +       int r, i;
>>
>>          dmabuf = file->private_data;
>>          if (!dmabuf || !dmabuf->resv)
>> @@ -225,101 +228,56 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>>          if (!events)
>>                  return 0;
>>
>> -retry:
>> -       seq = read_seqcount_begin(&resv->seq);
>> -       rcu_read_lock();
>> +       dcb = events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
>> +
>> +       /* Only queue a new one if we are not still waiting for the old one */
>> +       spin_lock_irq(&dmabuf->poll.lock);
>> +       if (dcb->active)
>> +               events = 0;
>> +       else
>> +               dcb->active = events;
>> +       spin_unlock_irq(&dmabuf->poll.lock);
>> +       if (!events)
>> +               return 0;
>> +
>> +       dma_resv_lock(resv, NULL);
>>
>> -       fobj = rcu_dereference(resv->fence);
>> -       if (fobj)
>> +       fobj = dma_resv_get_list(resv);
>> +       if (fobj && events & EPOLLOUT)
>>                  shared_count = fobj->shared_count;
>>          else
>>                  shared_count = 0;
>> -       fence_excl = rcu_dereference(resv->fence_excl);
>> -       if (read_seqcount_retry(&resv->seq, seq)) {
>> -               rcu_read_unlock();
>> -               goto retry;
>> -       }
>>
>> -       if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
>> -               struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
>> -               __poll_t pevents = EPOLLIN;
>> -
>> -               if (shared_count == 0)
>> -                       pevents |= EPOLLOUT;
>> -
>> -               spin_lock_irq(&dmabuf->poll.lock);
>> -               if (dcb->active) {
>> -                       dcb->active |= pevents;
>> -                       events &= ~pevents;
>> -               } else
>> -                       dcb->active = pevents;
>> -               spin_unlock_irq(&dmabuf->poll.lock);
>> -
>> -               if (events & pevents) {
>> -                       if (!dma_fence_get_rcu(fence_excl)) {
>> -                               /* force a recheck */
>> -                               events &= ~pevents;
>> -                               dma_buf_poll_cb(NULL, &dcb->cb);
>> -                       } else if (!dma_fence_add_callback(fence_excl, &dcb->cb,
>> -                                                          dma_buf_poll_cb)) {
>> -                               events &= ~pevents;
>> -                               dma_fence_put(fence_excl);
>> -                       } else {
>> -                               /*
>> -                                * No callback queued, wake up any additional
>> -                                * waiters.
>> -                                */
>> -                               dma_fence_put(fence_excl);
>> -                               dma_buf_poll_cb(NULL, &dcb->cb);
>> -                       }
>> +       for (i = 0; i < shared_count; ++i) {
>> +               fence = rcu_dereference_protected(fobj->shared[i],
>> +                                                 dma_resv_held(resv));
>> +               dma_fence_get(fence);
>> +               r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
>> +               if (!r) {
>> +                       /* Callback queued */
>> +                       events = 0;
> Why do you clear events here? There's more than EPOLLIN/OUT, and I
> think you can also set both (and then we should be able to queue
> both). I think a few more testcases for this would be really good. I
> think the old code all handled that like I'd expect it to.

Yeah, that's exactly the stuff I was wondering about since I'm not so 
familiar with the poll interface.

Going to fix that.

Thanks,
Christian.

>
> Cheers, Daniel
>
>> +                       goto out;
>>                  }
>> +               dma_fence_put(fence);
>>          }
>>
>> -       if ((events & EPOLLOUT) && shared_count > 0) {
>> -               struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
>> -               int i;
>> -
>> -               /* Only queue a new callback if no event has fired yet */
>> -               spin_lock_irq(&dmabuf->poll.lock);
>> -               if (dcb->active)
>> -                       events &= ~EPOLLOUT;
>> -               else
>> -                       dcb->active = EPOLLOUT;
>> -               spin_unlock_irq(&dmabuf->poll.lock);
>> -
>> -               if (!(events & EPOLLOUT))
>> +       fence = dma_resv_get_excl(resv);
>> +       if (fence) {
>> +               dma_fence_get(fence);
>> +               r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
>> +               if (!r) {
>> +                       /* Callback queued */
>> +                       events = 0;
>>                          goto out;
>> -
>> -               for (i = 0; i < shared_count; ++i) {
>> -                       struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
>> -
>> -                       if (!dma_fence_get_rcu(fence)) {
>> -                               /*
>> -                                * fence refcount dropped to zero, this means
>> -                                * that fobj has been freed
>> -                                *
>> -                                * call dma_buf_poll_cb and force a recheck!
>> -                                */
>> -                               events &= ~EPOLLOUT;
>> -                               dma_buf_poll_cb(NULL, &dcb->cb);
>> -                               break;
>> -                       }
>> -                       if (!dma_fence_add_callback(fence, &dcb->cb,
>> -                                                   dma_buf_poll_cb)) {
>> -                               dma_fence_put(fence);
>> -                               events &= ~EPOLLOUT;
>> -                               break;
>> -                       }
>> -                       dma_fence_put(fence);
>>                  }
>> -
>> -               /* No callback queued, wake up any additional waiters. */
>> -               if (i == shared_count)
>> -                       dma_buf_poll_cb(NULL, &dcb->cb);
>> +               dma_fence_put(fence);
>>          }
>>
>> +       /* No callback queued, wake up any additional waiters. */
>> +       dma_buf_poll_cb(NULL, &dcb->cb);
>> +
>>   out:
>> -       rcu_read_unlock();
>> +       dma_resv_unlock(resv);
>>          return events;
>>   }
>>
>> @@ -562,8 +520,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>          dmabuf->owner = exp_info->owner;
>>          spin_lock_init(&dmabuf->name_lock);
>>          init_waitqueue_head(&dmabuf->poll);
>> -       dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
>> -       dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
>> +       dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
>> +       dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
>>
>>          if (!resv) {
>>                  resv = (struct dma_resv *)&dmabuf[1];
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index efdc56b9d95f..7e747ad54c81 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -329,7 +329,7 @@ struct dma_buf {
>>                  wait_queue_head_t *poll;
>>
>>                  __poll_t active;
>> -       } cb_excl, cb_shared;
>> +       } cb_in, cb_out;
>>   };
>>
>>   /**
>> --
>> 2.25.1
>>
>

