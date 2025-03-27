Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB4A72D8D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5F810E2B8;
	Thu, 27 Mar 2025 10:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IF/yDhX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ACB10E271;
 Thu, 27 Mar 2025 10:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A5FD443B2;
 Thu, 27 Mar 2025 10:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF91C4CEDD;
 Thu, 27 Mar 2025 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743070524;
 bh=UzJiYS3JI1YoDbd0y1pICIatHn+gHECMIdSbHA/EmNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IF/yDhX4zMqBX+2n/33ESUGZKPBxUOxclq/H7/KyL31PlithIZmAadrar2WfKieru
 kwWURPZqMj4DfHpEZUK1DPUiHjP1pFeEUup3Zoqw7Fo5P56LJI8G87JiUsSCVi4Zba
 E5v/BVtlvZl5s7rLPpFiUsDD2v3/AU/BegTiFEk6eXj6UwmSct5lPJqftbr08h8c14
 U88bbZcZl8cIZOlzu9MppbqXFM4V7LdXkRFdEPcOWoGfCJ7cKQfy5woFoiTd1HI5eZ
 08grf+TTozHVLwNwkjysOVjYwA6PS5wYnrFKVrBL6MqNX1I5We5Hit8Rd77nKk6wrh
 blQxlBGR3PmUg==
Date: Thu, 27 Mar 2025 11:15:19 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-UlN4pIwct-q83Y@pollux>
References: <20250327084256.11201-2-phasta@kernel.org>
 <8882f3d5-6e00-4aae-af3f-7df447158fda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8882f3d5-6e00-4aae-af3f-7df447158fda@amd.com>
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

On Thu, Mar 27, 2025 at 09:56:01AM +0100, Christian König wrote:
> Am 27.03.25 um 09:42 schrieb Philipp Stanner:
> > Nouveau currently relies on the assumption that dma_fences will only
> > ever get signalled through nouveau_fence_signal(), which takes care of
> > removing a signalled fence from the list nouveau_fence_chan.pending.
> >
> > This self-imposed rule is violated in nouveau_fence_done(), where
> > dma_fence_is_signaled() can signal the fence without removing it from
> > the list. This enables accesses to already signalled fences through the
> > list, which is a bug.
> >
> > Furthermore, it must always be possible to use standard dma_fence
> > methods an a dma_fence and observe valid behavior. The canonical way of
> > ensuring that signalling a fence has additional effects is to add those
> > effects to a callback and register it on the fence.
> 
> Good catch.
> 
> >
> > Move the code from nouveau_fence_signal() into a dma_fence callback.
> > Register that callback when creating the fence.
> 
> But that's a really ugly approach.
> 
> Either nouveau shouldn't implement the signaled callback or make sure that when returning true from the signaled callback the fence is also removed from the pending list.

I think the idea of the fix is to not cover one additional case (i.e.
dma_fence_is_signaled()), but all cases.

For instance, what if only dma_fence_signal() is called on this fence? Then it
would still not be removed from the pending list, etc.

I'm all for a better solution, but I think it should cover all cases.

> 
> >
> > Cc: <stable@vger.kernel.org> # 4.10+
> > Fixes: f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > I'm not entirely sure what Fixes-Tag is appropriate. The last time the
> > line causing the signalled fence in the list was touched is the commit
> > listed above.

You could search for the commit that introduced the code before commit
f54d1867005c. This one is surely not correct.

However, in cases where you can't find the commit that introduced the problem,
since the bug was always present, you can also drop Fixes: and Cc stable only.

> 
> Yeah, that's most likely not correct. My educated guess is that the bug was always there just never discovered.
> 
> Regards,
> Christian.
> 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_fence.c | 41 ++++++++++++++++---------
> >  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
> >  2 files changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 7cc84472cece..b2c2241a8803 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -50,24 +50,22 @@ nouveau_fctx(struct nouveau_fence *fence)
> >  	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
> >  }
> >  
> > -static int
> > -nouveau_fence_signal(struct nouveau_fence *fence)
> > +static void
> > +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct dma_fence_cb *cb)
> >  {
> > -	int drop = 0;
> > +	struct nouveau_fence_chan *fctx;
> > +	struct nouveau_fence *fence;
> > +
> > +	fence = container_of(dfence, struct nouveau_fence, base);
> > +	fctx = nouveau_fctx(fence);
> >  
> > -	dma_fence_signal_locked(&fence->base);
> >  	list_del(&fence->head);
> >  	rcu_assign_pointer(fence->channel, NULL);
> >  
> > -	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
> > -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> > -
> > -		if (!--fctx->notify_ref)
> > -			drop = 1;
> > -	}
> > +	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
> > +		--fctx->notify_ref;
> >  
> >  	dma_fence_put(&fence->base);
> > -	return drop;
> >  }
> >  
> >  static struct nouveau_fence *
> > @@ -93,7 +91,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
> >  		if (error)
> >  			dma_fence_set_error(&fence->base, error);
> >  
> > -		if (nouveau_fence_signal(fence))
> > +		dma_fence_signal_locked(&fence->base);
> > +		if (fctx->notify_ref == 0)
> >  			nvif_event_block(&fctx->event);
> >  	}
> >  	fctx->killed = 1;
> > @@ -131,7 +130,6 @@ static int
> >  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
> >  {
> >  	struct nouveau_fence *fence;
> > -	int drop = 0;
> >  	u32 seq = fctx->read(chan);
> >  
> >  	while (!list_empty(&fctx->pending)) {
> > @@ -140,10 +138,10 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
> >  		if ((int)(seq - fence->base.seqno) < 0)
> >  			break;
> >  
> > -		drop |= nouveau_fence_signal(fence);
> > +		dma_fence_signal_locked(&fence->base);
> >  	}
> >  
> > -	return drop;
> > +	return fctx->notify_ref == 0 ? 1 : 0;

This seems to introduce a new bug.

Since the fence is removed from the pending list through the callback, we may
not enter the code paths calling nouveau_fence_update() anymore. In fact, I
think you can remove nouveau_fence_update() entirely and just call

	nvif_event_block(&fctx->event);

directly from the callback if !--fctx->notify_ref.
