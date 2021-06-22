Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B23B057C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145626E4EC;
	Tue, 22 Jun 2021 13:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148256E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:07:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d11so21213276wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=uLBWOL3VOeGrHRgL8kvm1PDdHj2VWEO5BPMWiIWMcPw=;
 b=r80rhIJWpcG3K3ZDYR2kTg0fLHpbS6kAgUfsSFFslhd51gM+1BnN1nD7gXJQjjatEk
 U5NvIcOJ79ViazQFHFc6c0fU0/r8e5VVYnHtG49ZCoxrL/Ituan1iGcJu3NWl84q8+Me
 Eqn8X2iNHTBNSkYqwR4Vch2vu9REtTn3xL8Iv3bPNE7SFl7v6goOnBEQKu8kiwn5Fjvk
 UVZ8dwWQFC23tYnnvPc0bTaHFeU1ctgB356zlsPljERe2lYY0zyYiVr4IHZWEpzoaTPL
 ZFtMYfDidmx+SmzcxzmqfZizfSS7vlqsJ9Z0WV6J3WUEps+SYG7fQHO7/3IVl5mMNzey
 bNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uLBWOL3VOeGrHRgL8kvm1PDdHj2VWEO5BPMWiIWMcPw=;
 b=s+5vsrvd5Wu/+M9/WqmQOdy/KsgnWc/ZCf/SMklMaATVIol3il0OZ9OGv9rog0CUrl
 SEDCw3AN2yKzTkbVpROu83ww0Rh0TWR1UH03bziW6p1g/TrXdk4sr28u5h5VTrcR7xwa
 lqtEHqQnePMGOkpzwWRBN4I+xaT6U9LRUhUkxKxvbb1VO15SK6CbTWSIiQLhGYxUoXbc
 RGAhHBarWVLFSJo8av3z+t8bvPtaV/yotMylO/1vxmkxvRwx1BWJv05Tflr9k5Nsk+aa
 GRjJa60UMlR1mZUjEDAbF9cft0hLadPaOj7ambXzlPYphbOXXWc8KnXCtynuq1le0Pm3
 5dtA==
X-Gm-Message-State: AOAM5316jobFuI+F0JyN5s+TG7n4pr+dTzNo8TtiskKUfjXV9QyY4lz+
 +Vtmzl5miNAp+Hk3ooOetKm9XnZDPlY=
X-Google-Smtp-Source: ABdhPJxgc70o+pq5z9DwefWkgIXGuHwn43S9hI6WuIDIqvWr0v/beI9UJhb4/Fykm0CD64HDzKlwfQ==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr4733451wru.243.1624367249751; 
 Tue, 22 Jun 2021 06:07:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id z14sm10116233wrv.68.2021.06.22.06.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 06:07:28 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v3
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20210622130459.122723-1-christian.koenig@amd.com>
Message-ID: <e01d3b99-ca6b-c6c2-a277-2fecf442ec16@gmail.com>
Date: Tue, 22 Jun 2021 15:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622130459.122723-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Crap, hit enter to early before adding a cover letter.

This is the same patch as before, but as requested I'm keeping the 
exclusive fence handling as it is for now.

Daniel can you double check this and/or make sure that it is tested?

I only smoke tested it and the code is so complicated that I'm not sure 
I catched all side effects.

Regards,
Christian.

Am 22.06.21 um 15:04 schrieb Christian König:
> Daniel pointed me towards this function and there are multiple obvious problems
> in the implementation.
>
> First of all the retry loop is not working as intended. In general the retry
> makes only sense if you grab the reference first and then check the sequence
> values.
>
> It's also good practice to keep the reference around when installing callbacks
> to fences you don't own.
>
> And last the whole implementation was unnecessary complex and rather hard to
> understand which could lead to probably unexpected behavior of the IOCTL.
>
> Fix all this by reworking the implementation from scratch.
>
> Only mildly tested and needs a thoughtful review of the code.
>
> v2: fix the reference counting as well
> v3: keep the excl fence handling as is for stable
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++----------------------
>   include/linux/dma-buf.h   |   2 +-
>   2 files changed, 55 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..e97c3a9d98d5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
>   	 * If you hit this BUG() it means someone dropped their ref to the
>   	 * dma-buf while still having pending operation to the buffer.
>   	 */
> -	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> +	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>   
>   	dmabuf->ops->release(dmabuf);
>   
> @@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	wake_up_locked_poll(dcb->poll, dcb->active);
>   	dcb->active = 0;
>   	spin_unlock_irqrestore(&dcb->poll->lock, flags);
> +	dma_fence_put(fence);
>   }
>   
>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   {
> +	struct dma_buf_poll_cb_t *dcb;
>   	struct dma_buf *dmabuf;
>   	struct dma_resv *resv;
>   	struct dma_resv_list *fobj;
>   	struct dma_fence *fence_excl;
> -	__poll_t events;
>   	unsigned shared_count, seq;
> +	struct dma_fence *fence;
> +	__poll_t events;
> +	int r, i;
>   
>   	dmabuf = file->private_data;
>   	if (!dmabuf || !dmabuf->resv)
> @@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   	if (!events)
>   		return 0;
>   
> +	dcb = events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
> +
> +	/* Only queue a new one if we are not still waiting for the old one */
> +	spin_lock_irq(&dmabuf->poll.lock);
> +	if (dcb->active)
> +		events = 0;
> +	else
> +		dcb->active = events;
> +	spin_unlock_irq(&dmabuf->poll.lock);
> +	if (!events)
> +		return 0;
> +
>   retry:
>   	seq = read_seqcount_begin(&resv->seq);
>   	rcu_read_lock();
>   
>   	fobj = rcu_dereference(resv->fence);
> -	if (fobj)
> +	if (fobj && events & EPOLLOUT)
>   		shared_count = fobj->shared_count;
>   	else
>   		shared_count = 0;
> -	fence_excl = rcu_dereference(resv->fence_excl);
> -	if (read_seqcount_retry(&resv->seq, seq)) {
> -		rcu_read_unlock();
> -		goto retry;
> -	}
>   
> -	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
> -		__poll_t pevents = EPOLLIN;
> -
> -		if (shared_count == 0)
> -			pevents |= EPOLLOUT;
> -
> -		spin_lock_irq(&dmabuf->poll.lock);
> -		if (dcb->active) {
> -			dcb->active |= pevents;
> -			events &= ~pevents;
> -		} else
> -			dcb->active = pevents;
> -		spin_unlock_irq(&dmabuf->poll.lock);
> -
> -		if (events & pevents) {
> -			if (!dma_fence_get_rcu(fence_excl)) {
> -				/* force a recheck */
> -				events &= ~pevents;
> -				dma_buf_poll_cb(NULL, &dcb->cb);
> -			} else if (!dma_fence_add_callback(fence_excl, &dcb->cb,
> -							   dma_buf_poll_cb)) {
> -				events &= ~pevents;
> -				dma_fence_put(fence_excl);
> -			} else {
> -				/*
> -				 * No callback queued, wake up any additional
> -				 * waiters.
> -				 */
> -				dma_fence_put(fence_excl);
> -				dma_buf_poll_cb(NULL, &dcb->cb);
> -			}
> +	for (i = 0; i < shared_count; ++i) {
> +		fence = rcu_dereference(fobj->shared[i]);
> +		fence = dma_fence_get_rcu(fence);
> +		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> +			/* Concurrent modify detected, force re-check */
> +			dma_fence_put(fence);
> +			rcu_read_unlock();
> +			goto retry;
>   		}
> -	}
>   
> -	if ((events & EPOLLOUT) && shared_count > 0) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
> -		int i;
> -
> -		/* Only queue a new callback if no event has fired yet */
> -		spin_lock_irq(&dmabuf->poll.lock);
> -		if (dcb->active)
> -			events &= ~EPOLLOUT;
> -		else
> -			dcb->active = EPOLLOUT;
> -		spin_unlock_irq(&dmabuf->poll.lock);
> -
> -		if (!(events & EPOLLOUT))
> +		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +		if (!r) {
> +			/* Callback queued */
> +			events = 0;
>   			goto out;
> +		}
> +		dma_fence_put(fence);
> +	}
>   
> -		for (i = 0; i < shared_count; ++i) {
> -			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
> -
> -			if (!dma_fence_get_rcu(fence)) {
> -				/*
> -				 * fence refcount dropped to zero, this means
> -				 * that fobj has been freed
> -				 *
> -				 * call dma_buf_poll_cb and force a recheck!
> -				 */
> -				events &= ~EPOLLOUT;
> -				dma_buf_poll_cb(NULL, &dcb->cb);
> -				break;
> -			}
> -			if (!dma_fence_add_callback(fence, &dcb->cb,
> -						    dma_buf_poll_cb)) {
> -				dma_fence_put(fence);
> -				events &= ~EPOLLOUT;
> -				break;
> -			}
> +	fence = dma_resv_get_excl(resv);
> +	if (fence && shared_count == 0) {
> +		fence = dma_fence_get_rcu(fence);
> +		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> +			/* Concurrent modify detected, force re-check */
>   			dma_fence_put(fence);
> +			rcu_read_unlock();
> +			goto retry;
> +
>   		}
>   
> -		/* No callback queued, wake up any additional waiters. */
> -		if (i == shared_count)
> -			dma_buf_poll_cb(NULL, &dcb->cb);
> +		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +		if (!r) {
> +			/* Callback queued */
> +			events = 0;
> +			goto out;
> +		}
> +		dma_fence_put(fence_excl);
>   	}
>   
> +	/* No callback queued, wake up any additional waiters. */
> +	dma_buf_poll_cb(NULL, &dcb->cb);
> +
>   out:
>   	rcu_read_unlock();
>   	return events;
> @@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	dmabuf->owner = exp_info->owner;
>   	spin_lock_init(&dmabuf->name_lock);
>   	init_waitqueue_head(&dmabuf->poll);
> -	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
> -	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
> +	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
> +	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
>   
>   	if (!resv) {
>   		resv = (struct dma_resv *)&dmabuf[1];
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..7e747ad54c81 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -329,7 +329,7 @@ struct dma_buf {
>   		wait_queue_head_t *poll;
>   
>   		__poll_t active;
> -	} cb_excl, cb_shared;
> +	} cb_in, cb_out;
>   };
>   
>   /**

