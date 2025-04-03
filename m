Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A7A7A2E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2D10E22C;
	Thu,  3 Apr 2025 12:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I9Qonby/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952E510E21E;
 Thu,  3 Apr 2025 12:31:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A4F15C4670;
 Thu,  3 Apr 2025 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5ACC4CEE3;
 Thu,  3 Apr 2025 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743683467;
 bh=CnLDYb7XZk5vPljE2pxTY39nAE8xucWgsLuFG2jWdfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9Qonby/7j19j+SswfqKWHC0aQs6UqsHf+JxuilqUVw+7fb2RYNWrQuJg25ADCyio
 Lu+wroI7lUcJJUf8GD49OVNn5AiM2qmqipnAx4BMAO9PQ2YQfgc2uyfGFD3iUG98dI
 2DLlPAgRLxNXTX4pMs/wGiMpUwN5dC/BdkKaF5igkRMHGLyY2/TWqFvcisvLyhFDzo
 mwCgOn9WwMaYNnhembITGhZ0LcTSgvkpZV3nBjWYh7ipLNEe5CrXvqcyZZSwrNKvkV
 b7VT8d0QoScZyCN9NAW2XtGUEacqRMbHQm1LJbHAtPWAM4YsqOwv6omYV//5l+/qF8
 ZQlTbfkeuoOhA==
Date: Thu, 3 Apr 2025 14:31:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-5_hh8kPv8btF6k@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
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

On Thu, Apr 03, 2025 at 02:08:06PM +0200, Christian König wrote:
> Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> 
> > @@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
> >  			       &fctx->lock, fctx->context, ++fctx->sequence);
> >  	kref_get(&fctx->fence_ref);
> >  
> > +	fence->cb.func = nouveau_fence_cleanup_cb;
> > +	/* Adding a callback runs into __dma_fence_enable_signaling(), which will
> > +	 * ultimately run into nouveau_fence_no_signaling(), where a WARN_ON
> > +	 * would fire because the refcount can be dropped there.
> > +	 *
> > +	 * Increment the refcount here temporarily to work around that.
> > +	 */
> > +	dma_fence_get(&fence->base);
> > +	ret = dma_fence_add_callback(&fence->base, &fence->cb, nouveau_fence_cleanup_cb);
> 
> That looks like a really really awkward approach. The driver basically uses a the DMA fence infrastructure as middle layer and callbacks into itself to cleanup it's own structures.
> 
> Additional to that we don't guarantee any callback order for the DMA fence and so it can be that mix cleaning up the callback with other work which is certainly not good when you want to guarantee that the cleanup happens under the same lock.
> 
> Instead the call to dma_fence_signal_locked() should probably be removed from nouveau_fence_signal() and into nouveau_fence_context_kill() and nouveau_fence_update().
> 
> This way nouveau_fence_is_signaled() can call this function as well.

Yes, I think this would work as well. It wouldn't work if only
dma_fence_signal() is called on this fence, but that should be fine.

So, I agree that's probably the better approach.

> BTW: nouveau_fence_no_signaling() looks completely broken as well. It calls nouveau_fence_is_signaled() and then list_del() on the fence head.

It does indeed look broken, as in the fence may not be signaled at all. If at
all, it should call dma_fence_is_signaled() instead.

> As far as I can see that is completely superfluous and should probably be dropped. IIRC I once had a patch to clean that up but it was dropped for some reason.

Agreed, to me it looks unnecessary as well.
