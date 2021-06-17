Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D03ABAB3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A46E96A;
	Thu, 17 Jun 2021 17:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFF26E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:34:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c5so7664266wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nHCPfJCtHEokO2pbQ+qKgZ1mpfZ6YXE9ArDYOQxo4zE=;
 b=PaF23vHx4VPr0sFi+ml9adleGitlGQ0AwyUz+MXgzg5s+9ebp1blkiKurlWKRiKaO9
 c8uEjFYx+d0boc3ZTXh3N6yAh3lWNq+/lbMUOJKmSKwoW4XbjHMWVH5qFbYv3o3t4qQO
 3VBxm9YId+cSIJ06gw1fPcJEH2FBUiECbo+Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nHCPfJCtHEokO2pbQ+qKgZ1mpfZ6YXE9ArDYOQxo4zE=;
 b=Hbe2oITWW/fnDYcsxv7FbQXLO6WxSeT+JVunkHIGmFug4ArvElRC8mhKYl/2qultBo
 cwrs57O2f4ueJ9bvVnAp4Y2AtvbuFm9XsL4GMe/vOjQznZmqQJIf8YYlU56gt4Oxfx9S
 Qqmeto+Rc2sljzxT3kZBbg64ByKWTVgNLAu/8vAiiuUURYFzM4i7Sf5F2qlZky8uYXz0
 LvHxmfyMlieVmFWn7mLi89JLXN0H0ImhuUP3iaZxIlVmUDTYsotr7CRG+cZG+wvlFTA3
 U2I73sFYyFezQjQYJMMijfB0KchUWcGY4Im9Ducn0ey/zf9AkuSAZhCloKo/xYt2xAj6
 6lEA==
X-Gm-Message-State: AOAM530D1jZ5osaxUY1lN+KK2LOhGUJJL8L0250aNZjZDwqEUoU1Q0QE
 ml21v6ZZJBwxR2/4HqUwLVtYa7H3kurARw==
X-Google-Smtp-Source: ABdhPJwt8dGfV2jqmMxRZBJo+W4TFGFhXgvVY6hEMSsnxoWw+3ZNMnx85/8wUu0JKdrCnCTUWEYbEw==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr7118241wrs.421.1623951263712; 
 Thu, 17 Jun 2021 10:34:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm5058319wmq.43.2021.06.17.10.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:34:23 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:34:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll
Message-ID: <YMuHnQGMhtbz1U0x@phenom.ffwll.local>
References: <20210615112117.32838-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210615112117.32838-1-christian.koenig@amd.com>
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
Cc: jason@jlekstrand.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 01:21:17PM +0200, Christian König wrote:
> Daniel pointed me towards this function and there are multiple obvious problems
> in the implementation.
> 
> First of all the retry loop is not working as intended. In general the retry
> makes only sense if you grab the reference first and then check the retry. Then
> we skipped checking the exclusive fence when shared fences were present. And
> last the whole implementation was unnecessary complex and rather hard to
> understand which could lead to probably unexpected behavior of the IOCTL.
> 
> Fix all this by reworking the implementation from scratch.

Can't we split this a bit?

The other thing I'm wondering, instead of open-coding this and breaking
our heads trying to make sure we got it right. Can't we reuse
dma_resv_get_fences? That's what a lot of drivers use already to get a
consistent copy of the fence set without holding the lock.

I think then the actual semantics, i.e. do we need to include the
exclusive fence or not, stick out more.
-Daniel

> 
> Only mildly tested and needs a thoughtful review of the code.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 132 +++++++++++++++-----------------------
>  include/linux/dma-buf.h   |   2 +-
>  2 files changed, 54 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..1bd00e18291f 100644
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
> @@ -206,12 +206,15 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  
>  static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  {
> +	struct dma_buf_poll_cb_t *dcb;
>  	struct dma_buf *dmabuf;
>  	struct dma_resv *resv;
>  	struct dma_resv_list *fobj;
>  	struct dma_fence *fence_excl;
> -	__poll_t events;
>  	unsigned shared_count, seq;
> +	struct dma_fence *fence;
> +	__poll_t events;
> +	int r, i;
>  
>  	dmabuf = file->private_data;
>  	if (!dmabuf || !dmabuf->resv)
> @@ -225,99 +228,70 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  	if (!events)
>  		return 0;
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
>  retry:
>  	seq = read_seqcount_begin(&resv->seq);
>  	rcu_read_lock();
>  
>  	fobj = rcu_dereference(resv->fence);
> -	if (fobj)
> +	if (fobj && events & EPOLLOUT)
>  		shared_count = fobj->shared_count;
>  	else
>  		shared_count = 0;
> -	fence_excl = dma_resv_excl_fence(resv);
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
>  		}
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
> +		dma_fence_put(fence);
> +		if (!r) {
> +			/* Callback queued */
> +			events = 0;
>  			goto out;
> +		}
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
> +	fence = dma_resv_excl_fence(resv);
> +	if (fence) {
> +		fence = dma_fence_get_rcu(fence);
> +		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
> +			/* Concurrent modify detected, force re-check */
>  			dma_fence_put(fence);
> +			rcu_read_unlock();
> +			goto retry;
> +
>  		}
>  
> -		/* No callback queued, wake up any additional waiters. */
> -		if (i == shared_count)
> -			dma_buf_poll_cb(NULL, &dcb->cb);
> +		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> +		dma_fence_put(fence_excl);
> +		if (!r) {
> +			/* Callback queued */
> +			events = 0;
> +			goto out;
> +		}
>  	}
>  
> +	/* No callback queued, wake up any additional waiters. */
> +	dma_buf_poll_cb(NULL, &dcb->cb);
> +
>  out:
>  	rcu_read_unlock();
>  	return events;
> @@ -562,8 +536,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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
