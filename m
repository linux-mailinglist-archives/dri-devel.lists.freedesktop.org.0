Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BC3C852E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6346E296;
	Wed, 14 Jul 2021 13:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2B6E296
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 13:21:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u1so3240008wrs.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pcSQv9zjv/DRlyAS/nTdpmTiRa9y9dsQE8aHRK8M+C8=;
 b=UPlvqmkXDJO58COWUItb3zI3T/s4IYUHkg014Z4O/YtcN0kFAwzWHn1BG483NTUsru
 D4EbyKMlN42nX8Pelm0ctTKK/vvHnE+OoYTBVq6Uiag+AryPLK+HWTitAuxukFreUUkF
 aZTUM22ZFhN/6Nxnl020WR0s7BVE+eVEsoR3fp+Wfa5FakNS9C6EQlBUZ6BH6EBACUiZ
 1AwrnwM9HbkQj6FP80STXFdWYGGm6j91a1oRRMEHpa6s8M3C67sPL91+RBuXWzReylgs
 bILJ8NV8Gyqf+hTCKylMhAad2iL1PHOk74zcHa3VzYqUWHIIdSokH3qSV8VpnrxssEwM
 Ptrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pcSQv9zjv/DRlyAS/nTdpmTiRa9y9dsQE8aHRK8M+C8=;
 b=n+0giW4sjovC6I0osKjh3zGbO/xM4mUjht+ewAWIc0GzTI1tLFHRtM3Py4VKvZ19QW
 DT0eXeFQaXqMkfgtYkCFxVw2SEYqAzckPBrPt3aoWynrc/xxJO5tcZUTAOCbO+nk9udB
 4ZItcADSZ9H/8AH0lZbh1qb4xaKCEvGIetMrLc+QrrYYYua02Ak9URCuHLHsP0FyN/eb
 95nvWJHip9KTdp27JdY83dRCPZqLa382ixH6BumVWNiM8/kOIQv+UHvXSomwnCxdcVVQ
 WC2T0rk1x7peMFZl+a/P2kjGlk3goKhjBBl5n/RZgeWq+DlQAfZrRQsM44gaxhLzrsHd
 U4tA==
X-Gm-Message-State: AOAM530dyDg3x9hs0IbBZ1iJ7l4mMDKmDRalOB23xPh+6YSNY0NJ5ZpY
 qY0QADZRF/fMvV0sR2ASw76uDTFpy7w=
X-Google-Smtp-Source: ABdhPJyuVu3HqiM+VJuR0ppeEMdNA5TqeWZD6BRUbDqoQgKdvrzBfwk8cIOoZ864yTbQ/ELZob+K0g==
X-Received: by 2002:adf:fe0d:: with SMTP id n13mr12897220wrr.73.1626268880069; 
 Wed, 14 Jul 2021 06:21:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc?
 ([2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc])
 by smtp.gmail.com with ESMTPSA id 6sm5500987wmi.3.2021.07.14.06.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 06:21:19 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v6
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
References: <20210709120756.205856-1-christian.koenig@amd.com>
Message-ID: <48c338fd-c0ab-39fb-a45d-17fd51fa47b7@gmail.com>
Date: Wed, 14 Jul 2021 15:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120756.205856-1-christian.koenig@amd.com>
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

Just a gentle ping. Or have I missed your reply?

Thanks,
Christian.

Am 09.07.21 um 14:07 schrieb Christian König:
> Daniel pointed me towards this function and there are multiple obvious problems
> in the implementation.
>
> First of all the retry loop is not working as intended. In general the retry
> makes only sense if you grab the reference first and then check the sequence
> values.
>
> Then we should always also wait for the exclusive fence.
>
> It's also good practice to keep the reference around when installing callbacks
> to fences you don't own.
>
> And last the whole implementation was unnecessary complex and rather hard to
> understand which could lead to probably unexpected behavior of the IOCTL.
>
> Fix all this by reworking the implementation from scratch. Dropping the
> whole RCU approach and taking the lock instead.
>
> Only mildly tested and needs a thoughtful review of the code.
>
> v2: fix the reference counting as well
> v3: keep the excl fence handling as is for stable
> v4: back to testing all fences, drop RCU
> v5: handle in and out separately
> v6: add missing clear of events
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-buf.c | 156 +++++++++++++++++---------------------
>   include/linux/dma-buf.h   |   2 +-
>   2 files changed, 72 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..39e1ef872829 100644
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
> @@ -202,16 +202,57 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	wake_up_locked_poll(dcb->poll, dcb->active);
>   	dcb->active = 0;
>   	spin_unlock_irqrestore(&dcb->poll->lock, flags);
> +	dma_fence_put(fence);
> +}
> +
> +static bool dma_buf_poll_shared(struct dma_resv *resv,
> +				struct dma_buf_poll_cb_t *dcb)
> +{
> +	struct dma_resv_list *fobj = dma_resv_get_list(resv);
> +	struct dma_fence *fence;
> +	int i, r;
> +
> +	if (!fobj)
> +		return false;
> +
> +	for (i = 0; i < fobj->shared_count; ++i) {
> +		fence = rcu_dereference_protected(fobj->shared[i],
> +						  dma_resv_held(resv));
> +		dma_fence_get(fence);
> +		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +		if (!r)
> +			return true;
> +		dma_fence_put(fence);
> +	}
> +
> +	return false;
> +}
> +
> +static bool dma_buf_poll_excl(struct dma_resv *resv,
> +			      struct dma_buf_poll_cb_t *dcb)
> +{
> +	struct dma_fence *fence = dma_resv_get_excl(resv);
> +	int r;
> +
> +	if (!fence)
> +		return false;
> +
> +	dma_fence_get(fence);
> +	r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +	if (!r)
> +		return true;
> +	dma_fence_put(fence);
> +
> +	return false;
>   }
>   
>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   {
>   	struct dma_buf *dmabuf;
>   	struct dma_resv *resv;
> -	struct dma_resv_list *fobj;
> -	struct dma_fence *fence_excl;
> +	unsigned shared_count;
>   	__poll_t events;
> -	unsigned shared_count, seq;
> +	int r, i;
>   
>   	dmabuf = file->private_data;
>   	if (!dmabuf || !dmabuf->resv)
> @@ -225,101 +266,46 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   	if (!events)
>   		return 0;
>   
> -retry:
> -	seq = read_seqcount_begin(&resv->seq);
> -	rcu_read_lock();
> -
> -	fobj = rcu_dereference(resv->fence);
> -	if (fobj)
> -		shared_count = fobj->shared_count;
> -	else
> -		shared_count = 0;
> -	fence_excl = rcu_dereference(resv->fence_excl);
> -	if (read_seqcount_retry(&resv->seq, seq)) {
> -		rcu_read_unlock();
> -		goto retry;
> -	}
> +	dma_resv_lock(resv, NULL);
>   
> -	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
> -		__poll_t pevents = EPOLLIN;
> -
> -		if (shared_count == 0)
> -			pevents |= EPOLLOUT;
> +	if (events & EPOLLOUT) {
> +		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_out;
>   
> +		/* Check that callback isn't busy */
>   		spin_lock_irq(&dmabuf->poll.lock);
> -		if (dcb->active) {
> -			dcb->active |= pevents;
> -			events &= ~pevents;
> -		} else
> -			dcb->active = pevents;
> +		if (dcb->active)
> +			events &= ~EPOLLOUT;
> +		else
> +			dcb->active = EPOLLOUT;
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
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
> -		}
> +		if (events & EPOLLOUT && !dma_buf_poll_shared(resv, dcb) &&
> +		    !dma_buf_poll_excl(resv, dcb))
> +			/* No callback queued, wake up any other waiters */
> +			dma_buf_poll_cb(NULL, &dcb->cb);
> +		else
> +			events &= ~EPOLLOUT;
>   	}
>   
> -	if ((events & EPOLLOUT) && shared_count > 0) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
> -		int i;
> +	if (events & EPOLLIN) {
> +		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
>   
> -		/* Only queue a new callback if no event has fired yet */
> +		/* Check that callback isn't busy */
>   		spin_lock_irq(&dmabuf->poll.lock);
>   		if (dcb->active)
> -			events &= ~EPOLLOUT;
> +			events &= ~EPOLLIN;
>   		else
> -			dcb->active = EPOLLOUT;
> +			dcb->active = EPOLLIN;
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
> -		if (!(events & EPOLLOUT))
> -			goto out;
> -
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
> -			dma_fence_put(fence);
> -		}
> -
> -		/* No callback queued, wake up any additional waiters. */
> -		if (i == shared_count)
> +		if (events & EPOLLIN && !dma_buf_poll_excl(resv, dcb))
> +			/* No callback queued, wake up any other waiters */
>   			dma_buf_poll_cb(NULL, &dcb->cb);
> +		else
> +			events &= ~EPOLLIN;
>   	}
>   
> -out:
> -	rcu_read_unlock();
> +	dma_resv_unlock(resv);
>   	return events;
>   }
>   
> @@ -562,8 +548,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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

