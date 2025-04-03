Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E55A7A0F5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CE410E999;
	Thu,  3 Apr 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WAxALzSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92DE10E997;
 Thu,  3 Apr 2025 10:25:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AAE3843DF9;
 Thu,  3 Apr 2025 10:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4C6C4CEE3;
 Thu,  3 Apr 2025 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743675953;
 bh=Y9/JjJAnyFciSb9gRCH9l+cicpwYPTr2yg3ZDp1TJSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAxALzSesz8VNaOY9otLdh3s16xHmTqb9sTdv49jH6Cb/gbWzB8mOcn/QHElPh1Ci
 UV8gKr3iU2QVTH3M5dCwpMc9rPLZ68B01ebi8L5oUZqRT8bBEg3qFQ0GzOmtsG26Ca
 cEELM2NjI1OMJG2esNzR9sEJ4K+CvBaU2e1Q93dwe3BMInQ1x6/yigYwmPCtBsTB75
 Tvmh7HCZEILaJdy/h36a0GLLpuLiu/x6jkpPcgLrjFmWpfhDnjqR1t7MHRgv+hNISy
 r7G0JzveWH0Tljon7pheRV0OBLNfvJfLOKWwYghFLbt+bxIZpT44RVC4+mRxMqH95D
 Dj4CSnoFmz4bA==
Date: Thu, 3 Apr 2025 12:25:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-5iK-mIYPIhanX-@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>
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

On Thu, Apr 03, 2025 at 12:17:29PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-03 at 12:13 +0200, Philipp Stanner wrote:
> > -static int
> > -nouveau_fence_signal(struct nouveau_fence *fence)
> > +static void
> > +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
> > dma_fence_cb *cb)
> >  {
> > -	int drop = 0;
> > +	struct nouveau_fence_chan *fctx;
> > +	struct nouveau_fence *fence;
> > +
> > +	fence = container_of(dfence, struct nouveau_fence, base);
> > +	fctx = nouveau_fctx(fence);
> >  
> > -	dma_fence_signal_locked(&fence->base);
> >  	list_del(&fence->head);
> >  	rcu_assign_pointer(fence->channel, NULL);
> >  
> >  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
> > {
> > -		struct nouveau_fence_chan *fctx =
> > nouveau_fctx(fence);
> > -
> >  		if (!--fctx->notify_ref)
> > -			drop = 1;
> > +			nvif_event_block(&fctx->event);
> >  	}
> >  
> >  	dma_fence_put(&fence->base);
> 
> What I realized while coding this v2 is that we might want to think
> about whether we really want the dma_fence_put() in the fence callback?
> 
> It should work fine, since it's exactly identical to the previous
> code's behavior – but effectively it means that the driver's reference
> will be dropped whenever it signals that fence.

Not quite, it's the reference of the fence context's pending list.

When the fence is emitted, dma_fence_init() is called, which initializes the
reference count to 1. Subsequently, another reference is taken, when the fence
is added to the pending list. Once the fence is signaled and hence removed from
the pending list, we can (and have to) drop this reference.
