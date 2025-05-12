Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB31AB313A
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C210E30C;
	Mon, 12 May 2025 08:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dzBlrOkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4236210E2F7;
 Mon, 12 May 2025 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAprPJUuPGpBa8hxnlWYzh5isytsazuWWvCnoY6Zv84=; b=dzBlrOkIIhaEE2LPhNok734Nwp
 0/zxnpmexjmWTncO3p7yCkc8IgwFRg7EJMZQayiq9i/7xtb1ssTgWE2gtvWw6Vz9pIHfSrIMgu0lN
 zE2ZrFibBKGdmOs3OTJD9WFUp97dFDnhrAmSkH9bsMFKk7Vp4ZUm+PGtDTs2nH7pd+mp/jjUai8H5
 a1qLj1Wc/6LHtUEvttgAQDVnN+4D28EsccwPLIOvAX0CDZu9nF2Nas1g2CvISsMqo9eRg3LRKwlWO
 mCmGu/Dd5URcJ6glFFlfMavORyYSDTVU5DcZpgObqKJp8kAcAfLVwDiv9w00h/ZMXpD3Y7ld6KxEY
 8ZbyTC0Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEOBo-006xus-4M; Mon, 12 May 2025 10:12:25 +0200
Message-ID: <7621e1ac-e759-4752-b790-e798150cff82@igalia.com>
Date: Mon, 12 May 2025 09:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/13] dma-fence: Use a flag for 64-bit seqnos
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 09/05/2025 16:33, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch (and dereference)
> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
> the fence->flags.
> 
> Drivers which were setting this flag are changed to use new
> dma_fence_init64() instead of dma_fence_init().


Note that due rebase slip up I lost the hunk which actually removes the 
bool from the ops struct. Fixed locally.

Regards,

Tvrtko

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/dma-buf/dma-fence-chain.c                | 5 ++---
>   drivers/dma-buf/dma-fence.c                      | 9 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c | 5 ++---
>   include/linux/dma-fence.h                        | 6 +++++-
>   4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 90424f23fd73..a8a90acf4f34 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>   }
>   
>   const struct dma_fence_ops dma_fence_chain_ops = {
> -	.use_64bit_seqno = true,
>   	.get_driver_name = dma_fence_chain_get_driver_name,
>   	.get_timeline_name = dma_fence_chain_get_timeline_name,
>   	.enable_signaling = dma_fence_chain_enable_signaling,
> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   			seqno = max(prev->seqno, seqno);
>   	}
>   
> -	dma_fence_init(&chain->base, &dma_fence_chain_ops,
> -		       &chain->lock, context, seqno);
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +			 context, seqno);
>   
>   	/*
>   	 * Chaining dma_fence_chain container together is only allowed through
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0cdd3e99d36..33661658f684 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1023,3 +1023,12 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	trace_dma_fence_init(fence);
>   }
>   EXPORT_SYMBOL(dma_fence_init);
> +
> +void
> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		 spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	dma_fence_init(fence, ops, lock, context, seqno);
> +	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> +}
> +EXPORT_SYMBOL(dma_fence_init64);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> index 51cddfa3f1e8..5d26797356a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>   }
>   
>   static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
> -	.use_64bit_seqno = true,
>   	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>   };
> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>   	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>   	spin_lock_init(&f->lock);
>   
> -	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> -		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
> +	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> +			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>   
>   	/* TODO: We probably need a separate wq here */
>   	dma_fence_get(&f->base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..ac6535716dbe 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -97,6 +97,7 @@ struct dma_fence {
>   };
>   
>   enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_SEQNO64_BIT,
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -262,6 +263,9 @@ struct dma_fence_ops {
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   		    spinlock_t *lock, u64 context, u64 seqno);
>   
> +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		      spinlock_t *lock, u64 context, u64 seqno);
> +
>   void dma_fence_release(struct kref *kref);
>   void dma_fence_free(struct dma_fence *fence);
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
> @@ -454,7 +458,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>   	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>   	 * do so.
>   	 */
> -	if (fence->ops->use_64bit_seqno)
> +	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>   		return f1 > f2;
>   
>   	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;

