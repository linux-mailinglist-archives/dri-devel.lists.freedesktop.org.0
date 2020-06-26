Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929020B37D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8756ECB0;
	Fri, 26 Jun 2020 14:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771246ECB0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:22:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21625812-1500050 for multiple; Fri, 26 Jun 2020 15:22:50 +0100
MIME-Version: 1.0
In-Reply-To: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
References: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] dma-buf: document dma-fence-chain purpose/behavior
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Date: Fri, 26 Jun 2020 15:22:49 +0100
Message-ID: <159318136926.13600.10560903966095562565@build.alporthouse.com>
User-Agent: alot/0.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-06-26 13:21:00)
> Trying to explain a bit how this thing works. In my opinion diagrams
> are a bit easier to understand than words.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 3d123502ff12..ac90ddf37b55 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -9,6 +9,43 @@
>  
>  #include <linux/dma-fence-chain.h>
>  
> +/**
> + * DOC: DMA fence chains overview
> + *
> + * DMA fence chains, represented by &struct dma_fence_chain, are a kernel
> + * internal synchronization primitive providing a wrapping mechanism of other
> + * DMA fences in the form a single link list.
> + *
> + * One of the use case of this primitive is to implement Vulkan timeline
> + * semaphores (see VK_KHR_timeline_semaphore extension or Vulkan specification
> + * 1.2).
> + *
> + * Each DMA fence chain item wraps 2 items :
> + *
> + * - A previous DMA fence.
> + *
> + * - A DMA fence associated to the current &struct dma_fence_chain.
> + *
> + * A DMA fence chain becomes signaled when its previous fence as well as its
> + * associated fence are signaled. If a chain of dma fence chains is created,
> + * this property recurses, meaning that any dma fence chain element in the
> + * list becomes signaled only if its associated fence and all the previous
> + * fences in the chain are also signaled.
> + *
> + * A DMA fence chain's seqno is specified through dma_fence_chain_init(). This
> + * value is lower bound to the seqno of the previous fence to ensure the chain
> + * is monotically increasing.
> + *
> + * By traversing the chain's linked list, one can compute a seqno number
> + * associated with the chain such that is the highest number for which all
> + * previous fences have signaled.

Next fence - 1 == highest seqno for all previous fences.

Ok, what about the end point then? If you ask for a seqno higher than
the last fence. Since that is not yet defined, it is an error, right?
Otherwise, we could interpret the highest possible seqno for the last
fence as meaning U64_MAX.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
