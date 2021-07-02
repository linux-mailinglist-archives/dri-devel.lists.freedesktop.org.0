Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60223BA46C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89FA6E1E0;
	Fri,  2 Jul 2021 19:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4576E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:46:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a13so13724914wrf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JDcoPC4pRYfCDLPpTIQwu3QTLJsIGBmJYh/hG+p0yF8=;
 b=WTIqy6jiiHHkBttX4PMCZPaO9mfOFZtE+wW53odhFOURRsYIgfaupydeZCmymeqzGD
 e4yPWdO0Hx6uydcKhu7krGWu97UUPzguAOXZKfV4PCNtjS+uaPCBQMWCH0C5Vdmyu0co
 KQ4pcjXcyB+Rv0mcabTc694mdJOhuCXkFyl2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JDcoPC4pRYfCDLPpTIQwu3QTLJsIGBmJYh/hG+p0yF8=;
 b=C+MHcYEAF8YNKSOCze0GBNN9cxwjxtpC1wlmGl+2/0f2Madjs26dhBlW0UI3T0xX7G
 la2phwcUb0DlD82hoCRVpkAhf6MXNfPSq/C7mAj8lhyJJ0QyTApnp+AJ/atyxShpeEo1
 DgtNcX3rPhk2IldVx4d/ba51EteGxw2tNVIluTnxB8Me8EOdCo6rmmCliMWR9FTWMA3e
 SBFA+ROKfzwXrrbfGOqVvbrITbXkrO1Q184yXfVFdj2yrHfqPZ+u4eOdb/dRdngm3FNo
 ktjVeMDbybKB6eNfsYyghaAsWLs6Q6MhnXnz13y72uD0a9jAl1/WjJinJNhKE7/uRPQd
 ZFuQ==
X-Gm-Message-State: AOAM5327OGQxEFn24cY0tIK8PRR9cHPMCm+g63RX9CJQ6GbdgOt7ZPWL
 Gi5sHCnASJV2C8GY7RMnq3Gmmw==
X-Google-Smtp-Source: ABdhPJwH4ITX8encjEvPxYrCTdSa9tAf8oZyXafXSeBED0/pHiezDAsDvSQYbFhQk3GQjORtBgzJ7Q==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr1375783wri.261.1625255160350; 
 Fri, 02 Jul 2021 12:46:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm2709176wrx.41.2021.07.02.12.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:45:59 -0700 (PDT)
Date: Fri, 2 Jul 2021 21:45:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v5
Message-ID: <YN9s9oQWDHW5/nZP@phenom.ffwll.local>
References: <20210702103143.16824-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702103143.16824-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 12:31:43PM +0200, Christian König wrote:
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
>  drivers/dma-buf/dma-buf.c | 152 +++++++++++++++++---------------------
>  include/linux/dma-buf.h   |   2 +-
>  2 files changed, 68 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..439e2379e1cb 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
>  	 * If you hit this BUG() it means someone dropped their ref to the
>  	 * dma-buf while still having pending operation to the buffer.
>  	 */
> -	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> +	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>  
>  	dmabuf->ops->release(dmabuf);
>  
> @@ -202,16 +202,57 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	wake_up_locked_poll(dcb->poll, dcb->active);
>  	dcb->active = 0;
>  	spin_unlock_irqrestore(&dcb->poll->lock, flags);
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
>  }
>  
>  static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  {
>  	struct dma_buf *dmabuf;
>  	struct dma_resv *resv;
> -	struct dma_resv_list *fobj;
> -	struct dma_fence *fence_excl;
> +	unsigned shared_count;
>  	__poll_t events;
> -	unsigned shared_count, seq;
> +	int r, i;
>  
>  	dmabuf = file->private_data;
>  	if (!dmabuf || !dmabuf->resv)
> @@ -225,101 +266,42 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  	if (!events)
>  		return 0;
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
>  		spin_lock_irq(&dmabuf->poll.lock);
> -		if (dcb->active) {
> -			dcb->active |= pevents;
> -			events &= ~pevents;
> -		} else
> -			dcb->active = pevents;
> +		if (dcb->active)
> +			events &= ~EPOLLOUT;
> +		else
> +			dcb->active = EPOLLOUT;
>  		spin_unlock_irq(&dmabuf->poll.lock);
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
>  	}

Either I'm blind (it happens way too often) or your not clearing events
when you queue up the callback because the fences aren't signalled yet.
End result is that if there's not something else queue up already, we just
return the events userspace wants to wait for, immediately terminating the
wait.

Looks buggy.

I think we really need some tests here first. Or I just have no idea how
poll works internally :-)
-Daniel

>  
> -	if ((events & EPOLLOUT) && shared_count > 0) {
> -		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
> -		int i;
> +	if (events & EPOLLIN) {
> +		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
>  
> -		/* Only queue a new callback if no event has fired yet */
> +		/* Check that callback isn't busy */
>  		spin_lock_irq(&dmabuf->poll.lock);
>  		if (dcb->active)
> -			events &= ~EPOLLOUT;
> +			events &= ~EPOLLIN;
>  		else
> -			dcb->active = EPOLLOUT;
> +			dcb->active = EPOLLIN;
>  		spin_unlock_irq(&dmabuf->poll.lock);
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
>  			dma_buf_poll_cb(NULL, &dcb->cb);
>  	}
>  
> -out:
> -	rcu_read_unlock();
> +	dma_resv_unlock(resv);
>  	return events;
>  }
>  
> @@ -562,8 +544,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	dmabuf->owner = exp_info->owner;
>  	spin_lock_init(&dmabuf->name_lock);
>  	init_waitqueue_head(&dmabuf->poll);
> -	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
> -	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
> +	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
> +	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
>  
>  	if (!resv) {
>  		resv = (struct dma_resv *)&dmabuf[1];
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..7e747ad54c81 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -329,7 +329,7 @@ struct dma_buf {
>  		wait_queue_head_t *poll;
>  
>  		__poll_t active;
> -	} cb_excl, cb_shared;
> +	} cb_in, cb_out;
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
