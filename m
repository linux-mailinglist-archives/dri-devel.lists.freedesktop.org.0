Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E53BF938
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C806E8AD;
	Thu,  8 Jul 2021 11:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9E6E8AD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:42:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso4761079wme.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=G5mprsCVHU834JEiN9xCDQ2MsYsL+MP6rfK7a88TjOY=;
 b=BzhsYVb06WK2jj89WprBuCFvXY0rWyYpgEWRMSs9oYeU8SC5pcoSaEtTnPaxkTGwyd
 vOK8YgiuR5a2OVzKYBpiW2aPG4lbt8vXtnkYp5cbbGRT53trDTIfjCkUvzx8xTkeI3pT
 Qif81daLNTyvaFv05mm0yv1UStiI1lm4UvrkCFJV39JWU6eVwYA+5X1YACCpsy8DvE6J
 R86Pgswu8s2QzsS0323Q0Q7PS/bIBjNdr5ZDIxnQwIzqrYOap/f5WJJcahbnaq0SLRXP
 8mVn2S/S7zIHOJShJ7B5gIPQoPezHNn+5YznD7MrBIIISan+bX93Xq2YWY5Vvhdt19h3
 xYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=G5mprsCVHU834JEiN9xCDQ2MsYsL+MP6rfK7a88TjOY=;
 b=uA8arMpegZ8/HsipXg3RW13fQJy6PIGTulyLq58ffWSk94xJBXJ4K+dEnfP5gLVvMU
 Q2ORCXhPcKRRbB8Q1DxTcLjJMt1usaRc3wcCqlvDmtCIEAU9vnXOFrbUaZSuweaR+L12
 ZriZJSpQ48t9jkaG0q66x42jWwWeM8w6WXv2ZOxLj5Rc6JSZknDtjwtD4Waq3Jb18OX0
 5337IaRRMdqLjUsty7nEXrPSi2ONPy/0juLunqu79Erh7aLVw9feNbyTOwK4n5Cn88rv
 0FqVMRFEqnUOKOo7qCk6cDLzMvAFsHJCeC2Wlc4u91BbYuTFMoPznFOHI98J7WfNF25M
 XqNQ==
X-Gm-Message-State: AOAM532VmMebd2c2L7b/+nG4knyUUF5Q+JRTpqGi8gBRwO88WruUX1wc
 HonExqdLIeUYK4+fWA2xAFM=
X-Google-Smtp-Source: ABdhPJy8sso+/FrtmUcf+fKjIp+y6+atxE+smy6GDFxUNRi2JY9cGPaO94h6t/eUtNW+ADG97jiDbA==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr1468443wmj.73.1625744520793; 
 Thu, 08 Jul 2021 04:42:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e?
 ([2a02:908:1252:fb60:bc19:c1e3:6307:7e3e])
 by smtp.gmail.com with ESMTPSA id y11sm5950974wmi.33.2021.07.08.04.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:42:00 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v5
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, roberto.sassu@huawei.com
References: <20210708111916.7291-1-christian.koenig@amd.com>
Message-ID: <02c2cbbd-8bee-6f54-9ffd-ecd5e63ce830@gmail.com>
Date: Thu, 8 Jul 2021 13:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708111916.7291-1-christian.koenig@amd.com>
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

Sorry that was the wrong patch.

Still not feeling that well :(

Christian.

Am 08.07.21 um 13:19 schrieb Christian König:
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
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-buf.c | 152 +++++++++++++++++---------------------
>   include/linux/dma-buf.h   |   2 +-
>   2 files changed, 68 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..439e2379e1cb 100644
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
> @@ -225,101 +266,42 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
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
> -
> -	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
> -		__poll_t pevents = EPOLLIN;
> +	dma_resv_lock(resv, NULL);
>   
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
>   	}
>   
> -out:
> -	rcu_read_unlock();
> +	dma_resv_unlock(resv);
>   	return events;
>   }
>   
> @@ -562,8 +544,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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

