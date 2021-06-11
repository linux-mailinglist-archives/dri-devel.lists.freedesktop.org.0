Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A53A3D81
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4AD6EE40;
	Fri, 11 Jun 2021 07:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEEA6EE40
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:49:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g204so7539715wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LQARVn33SBn9rxrAHtMqYtoc0xRy+L8gqLOk2rRTFXk=;
 b=RSCwpdIVyu22CG2YrjTRU6LUQnOaj2Ogk4DiLFS0O+ySiEwvCxtQh/Sh5FOs3rrZGB
 YF7QTSi76+4WJa85vSTI8MzFg5+qztCiyNjcQA8k8hci971MdxPTVwa53ZLHBrdcqPBg
 RNu+DroA8XSsUrELUPkMJufjHYRfKXLNIuf20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LQARVn33SBn9rxrAHtMqYtoc0xRy+L8gqLOk2rRTFXk=;
 b=jYatvjEmg1AZgOzgxAyH9U9nQHMmHnXlde9yzfKanikveGA6rIWLNw5z7ZQGWXoNE3
 TErBqbgmvu+/XlbzeC3Thlkxy1lmcodtjuM29qXf5GCbivnQdSDFy5M7tkpJvpi3uKMf
 KfxHu5E4XfbfnELdm17uKSk+VTdV2LnNh7IoWIZs6BH1LWugigloKfi7gcYux7kxE+NQ
 OEip8g+6c1Tn9Y3nMNOkYX+NNEuNEAZXssxQl0/x7YU4BXWYXLEu4RH5dOduw/C+yQq4
 TUGnR1Ckdk4DeX4RKPxgqCBx36Et3/jBnhDYw7VPWt156plAizboRwOGkLOQ0ba8v7AA
 wAhw==
X-Gm-Message-State: AOAM532chMWcx8KPhd0O376o6rOPoo5oLw9SuHvepTRfzs+7obyiy+KG
 dksY9qpv91xw43sYHgOGMRgxxnAei2P6kw==
X-Google-Smtp-Source: ABdhPJwyoSxwk5CUJ9B+4RV83Mo1ozV2dGXaJqXh8oA79RrHCbNTcTmGyzo89pQacO3tDJ15ik+0hQ==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr2545968wmk.77.1623397792939;
 Fri, 11 Jun 2021 00:49:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n7sm10970837wmq.37.2021.06.11.00.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 00:49:52 -0700 (PDT)
Date: Fri, 11 Jun 2021 09:49:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] dma-buf: some dma_fence_chain improvements
Message-ID: <YMMVnlo5tX5PbcrX@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610091800.1833-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:17:54AM +0200, Christian König wrote:
> The callback and the irq work are never used at the same
> time. Putting them into an union saves us 24 bytes and
> makes the structure only 120 bytes in size.

Yeah pushing below 128 bytes makes sense.

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 2 +-
>  include/linux/dma-fence-chain.h   | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 7d129e68ac70..1b4cb3e5cec9 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -137,6 +137,7 @@ static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>  	struct dma_fence_chain *chain;
>  
>  	chain = container_of(cb, typeof(*chain), cb);
> +	init_irq_work(&chain->work, dma_fence_chain_irq_work);
>  	irq_work_queue(&chain->work);
>  	dma_fence_put(f);
>  }
> @@ -239,7 +240,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  	rcu_assign_pointer(chain->prev, prev);
>  	chain->fence = fence;
>  	chain->prev_seqno = 0;
> -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
>  
>  	/* Try to reuse the context of the previous chain node. */
>  	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 10462a029da2..9d6a062be640 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -25,12 +25,14 @@
>   */
>  struct dma_fence_chain {
>  	struct dma_fence base;
> -	spinlock_t lock;
>  	struct dma_fence __rcu *prev;
>  	u64 prev_seqno;
>  	struct dma_fence *fence;
> -	struct dma_fence_cb cb;
> -	struct irq_work work;

Can you pls pull the kerneldoc inline here for these too and extend the
comments that @work is only used from the callback, at which point we
don't need @cb anymore? For union lifetime tricks we really should
document this in the datastructure docs.

With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I also think it'd be good to specify this clearly in the kerneldoc for
dma_fence_add_callback() with something like:

"Note that the registered @cb structure is no longer in use by the
signalling code by the time @func is called, and can therefore be used
again. This is useful when @func launches a work item because it allows us
to put both the struct dma_fence_cb and the work struct (e.g. struct
work_struct) into a union to save space."

Feel free to includ this in this patch here or do a separate one.

Cheers, Daniel

> +	union {
> +		struct dma_fence_cb cb;
> +		struct irq_work work;
> +	};
> +	spinlock_t lock;
>  };
>  
>  extern const struct dma_fence_ops dma_fence_chain_ops;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
