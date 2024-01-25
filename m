Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967A83CAC9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7B10E31E;
	Thu, 25 Jan 2024 18:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC3910E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:23:12 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a28cfca3c45so165948866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706206931; x=1706811731; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4qdybqG7xbkh+aIXYiEtoKHBpIybkg9SQxRi0kQlQrI=;
 b=J96UiIJ0dHE8QJtYRGg5LN7x2z0c6+Ug+rvmeDKkRa8a6D5LmlvMVuNjXAIDepc45s
 AIBTiui6zqLeG31NCyA5fc253VifZSsubKj7UKtfLHrKwEXsu1ExeJi7aJj2mnbYGfjh
 T32u57UH/6D+1xG9z0f9YGndpHCSDErDlrN+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706206931; x=1706811731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qdybqG7xbkh+aIXYiEtoKHBpIybkg9SQxRi0kQlQrI=;
 b=Zvf9MoyoOVIBpkTwHVAofy/AdGsYbydLbLG1l3QAtjFtqUk4mlglutbW762DCALW6O
 mm1lHpHbT72nTPPT2p3oAlDnfeMSP63zqKYngBqwxTN6ak8uudfURusex4Shugl+TFgC
 oDGeBRUkpPOCVtaTjAdTC2e0Ffs1AIs/PnxD2pysaaJXBLu1Tm6m2hhqHtLAF5jCS20Z
 dW8ii+k/YrbxBWz1J9ua1gMSf6fjqw6Iq2hGW5AaSGN4/vPsGStXQlmA4jRamfsnG8jM
 Um2ldkZiHOmP+YMCctNa8+vzxjwEsB1jfBr+6ybWNWaxq/X2g4Y4Bxm4O2oYLuIbVxPQ
 OUPQ==
X-Gm-Message-State: AOJu0Yy3SWw/29TiZD4yF62KUaFiLDNtTos6Rh3ViWiLCM28I08ndPXc
 AeqP4rZPgx45S2gwu9XTY/Rxw5paxi0Iu/1QVA06fv37bPCHeQo31bntaTUeYKFV2Gd6YO7SnQs
 1
X-Google-Smtp-Source: AGHT+IHdXDCqB8OQAPrRVjufUIi2QUQrN0xCMNUIY2nKYm6nix9kUk9CJyxfp3u8Czz5GvE4jmdhfw==
X-Received: by 2002:a17:906:38da:b0:a31:296b:b673 with SMTP id
 r26-20020a17090638da00b00a31296bb673mr1930907ejd.3.1706206930900; 
 Thu, 25 Jan 2024 10:22:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cw5-20020a170907160500b00a3009e3f8a9sm1298208ejd.17.2024.01.25.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:22:10 -0800 (PST)
Date: Thu, 25 Jan 2024 19:22:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] nouveau: rip out fence irq allow/block sequences.
Message-ID: <ZbKm0EqOVe9Ihqgz@phenom.ffwll.local>
References: <20240123072538.1290035-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123072538.1290035-1-airlied@gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 05:25:38PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> fences are signalled on nvidia hw using non-stall interrupts.
> 
> non-stall interrupts are not latched from my reading.
> 
> When nouveau emits a fence, it requests a NON_STALL signalling,
> but it only calls the interface to allow the non-stall irq to happen
> after it has already emitted the fence. A recent change
> eacabb546271 ("nouveau: push event block/allowing out of the fence context")
> made this worse by pushing out the fence allow/block to a workqueue.
> 
> However I can't see how this could ever work great, since when
> enable signalling is called, the semaphore has already been emitted
> to the ring, and the hw could already have tried to set the bits,
> but it's been masked off. Changing the allowed mask later won't make
> the interrupt get called again.
> 
> For now rip all of this out.
> 
> This fixes a bunch of stalls seen running VK CTS sync tests.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 77 +++++--------------------
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  2 -
>  2 files changed, 16 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 5057d976fa57..d6d50cdccf75 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -50,24 +50,14 @@ nouveau_fctx(struct nouveau_fence *fence)
>  	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
>  }
>  
> -static int
> +static void
>  nouveau_fence_signal(struct nouveau_fence *fence)
>  {
> -	int drop = 0;
> -
>  	dma_fence_signal_locked(&fence->base);
>  	list_del(&fence->head);
>  	rcu_assign_pointer(fence->channel, NULL);
>  
> -	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
> -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -
> -		if (atomic_dec_and_test(&fctx->notify_ref))
> -			drop = 1;
> -	}
> -
>  	dma_fence_put(&fence->base);
> -	return drop;
>  }
>  
>  static struct nouveau_fence *
> @@ -93,8 +83,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  		if (error)
>  			dma_fence_set_error(&fence->base, error);
>  
> -		if (nouveau_fence_signal(fence))
> -			nvif_event_block(&fctx->event);
> +		nouveau_fence_signal(fence);
>  	}
>  	fctx->killed = 1;
>  	spin_unlock_irqrestore(&fctx->lock, flags);
> @@ -103,8 +92,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  void
>  nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
>  {
> -	cancel_work_sync(&fctx->allow_block_work);
>  	nouveau_fence_context_kill(fctx, 0);
> +	nvif_event_block(&fctx->event);
>  	nvif_event_dtor(&fctx->event);
>  	fctx->dead = 1;
>  
> @@ -127,11 +116,10 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
>  	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
>  }
>  
> -static int
> +static void
>  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
>  {
>  	struct nouveau_fence *fence;
> -	int drop = 0;
>  	u32 seq = fctx->read(chan);
>  
>  	while (!list_empty(&fctx->pending)) {
> @@ -140,10 +128,8 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
>  		if ((int)(seq - fence->base.seqno) < 0)
>  			break;
>  
> -		drop |= nouveau_fence_signal(fence);
> +		nouveau_fence_signal(fence);
>  	}
> -
> -	return drop;
>  }
>  
>  static int
> @@ -160,26 +146,13 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc
>  
>  		fence = list_entry(fctx->pending.next, typeof(*fence), head);
>  		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (nouveau_fence_update(chan, fctx))
> -			ret = NVIF_EVENT_DROP;
> +		nouveau_fence_update(chan, fctx);
>  	}
>  	spin_unlock_irqrestore(&fctx->lock, flags);
>  
>  	return ret;
>  }
>  
> -static void
> -nouveau_fence_work_allow_block(struct work_struct *work)
> -{
> -	struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
> -						       allow_block_work);
> -
> -	if (atomic_read(&fctx->notify_ref) == 0)
> -		nvif_event_block(&fctx->event);
> -	else
> -		nvif_event_allow(&fctx->event);
> -}
> -
>  void
>  nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
>  {
> @@ -191,7 +164,6 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  	} args;
>  	int ret;
>  
> -	INIT_WORK(&fctx->allow_block_work, nouveau_fence_work_allow_block);
>  	INIT_LIST_HEAD(&fctx->flip);
>  	INIT_LIST_HEAD(&fctx->pending);
>  	spin_lock_init(&fctx->lock);
> @@ -216,6 +188,12 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  			      &args.base, sizeof(args), &fctx->event);
>  
>  	WARN_ON(ret);
> +
> +	/*
> +	 * Always allow non-stall irq events - previously this code tried to
> +	 * enable/disable them, but that just seems racy as nonstall irqs are unlatched.
> +	 */
> +	nvif_event_allow(&fctx->event);
>  }
>  
>  int
> @@ -247,8 +225,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  			return -ENODEV;
>  		}
>  
> -		if (nouveau_fence_update(chan, fctx))
> -			nvif_event_block(&fctx->event);
> +		nouveau_fence_update(chan, fctx);
>  
>  		list_add_tail(&fence->head, &fctx->pending);
>  		spin_unlock_irq(&fctx->lock);
> @@ -271,8 +248,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
>  
>  		spin_lock_irqsave(&fctx->lock, flags);
>  		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (chan && nouveau_fence_update(chan, fctx))
> -			nvif_event_block(&fctx->event);
> +		if (chan)
> +			nouveau_fence_update(chan, fctx);
>  		spin_unlock_irqrestore(&fctx->lock, flags);
>  	}
>  	return dma_fence_is_signaled(&fence->base);
> @@ -530,32 +507,10 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
>  	.release = nouveau_fence_release
>  };
>  
> -static bool nouveau_fence_enable_signaling(struct dma_fence *f)
> -{
> -	struct nouveau_fence *fence = from_fence(f);
> -	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -	bool ret;
> -	bool do_work;
> -
> -	if (atomic_inc_return(&fctx->notify_ref) == 0)
> -		do_work = true;
> -
> -	ret = nouveau_fence_no_signaling(f);
> -	if (ret)
> -		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
> -	else if (atomic_dec_and_test(&fctx->notify_ref))
> -		do_work = true;
> -
> -	if (do_work)
> -		schedule_work(&fctx->allow_block_work);
> -
> -	return ret;
> -}
> -
>  static const struct dma_fence_ops nouveau_fence_ops_uevent = {
>  	.get_driver_name = nouveau_fence_get_get_driver_name,
>  	.get_timeline_name = nouveau_fence_get_timeline_name,
> -	.enable_signaling = nouveau_fence_enable_signaling,
> +	.enable_signaling = nouveau_fence_no_signaling,

I think you can rip nouveau_fence_no_signaling out too, it doesn't do
anything more than what the signalling codepath does too.

But maybe separate path since maybe this makes an existing leak more of a
sieve, but it really should be an existing one since you cannot assume
that someone external will ever look at whether your fence is signalled or
not.
-Sima

>  	.signaled = nouveau_fence_is_signaled,
>  	.release = nouveau_fence_release
>  };
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 28f5cf013b89..380bb0397ed2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -46,8 +46,6 @@ struct nouveau_fence_chan {
>  	char name[32];
>  
>  	struct nvif_event event;
> -	struct work_struct allow_block_work;
> -	atomic_t notify_ref;
>  	int dead, killed;
>  };
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
