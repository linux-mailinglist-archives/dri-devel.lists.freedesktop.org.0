Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84746495AFE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EE210E92F;
	Fri, 21 Jan 2022 07:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF210E916
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 74DAC3F52F;
 Fri, 21 Jan 2022 08:41:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztpjkw7MC_nI; Fri, 21 Jan 2022 08:41:15 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 911D73F36E;
 Fri, 21 Jan 2022 08:41:13 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.55.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EF55B36021F;
 Fri, 21 Jan 2022 08:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1642750873; bh=J7x+B28uN49SMZuI8wIJMtVPVYV8cmBtaTSP49CgU8E=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Eq4Y1IVj9UYOnrhtdi2e8lLF6MPhqGF+hPWmTPfZBnV3zX0ibuSqtZNeFkIqJrJ0+
 jgFZ0b0cM4SLYurhMy77RlYA+uvfMI5Pw5vG2Bc3x4bMiLZlhroI3feoN5FU0YOcWo
 SEIrAYTKUMjED9moHyHSCsQxVxnqiGYglb4giZiE=
Message-ID: <93c4213e-41ff-1afa-be40-7ec6789c63da@shipmail.org>
Date: Fri, 21 Jan 2022 08:41:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/9] dma-buf: consolidate dma_fence
 subclass checking
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220120132747.2348-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 1/20/22 14:27, Christian König wrote:
> Consolidate the wrapper functions to check for dma_fence
> subclasses in the dma_fence header.
>
> This makes it easier to document and also check the different
> requirements for fence containers in the subclasses.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   include/linux/dma-fence-array.h | 15 +------------
>   include/linux/dma-fence-chain.h |  3 +--
>   include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 16 deletions(-)
>
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 303dd712220f..fec374f69e12 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -45,19 +45,6 @@ struct dma_fence_array {
>   	struct irq_work work;
>   };
>   
> -extern const struct dma_fence_ops dma_fence_array_ops;
> -
> -/**
> - * dma_fence_is_array - check if a fence is from the array subsclass
> - * @fence: fence to test
> - *
> - * Return true if it is a dma_fence_array and false otherwise.
> - */
> -static inline bool dma_fence_is_array(struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_array_ops;
> -}
> -
>   /**
>    * to_dma_fence_array - cast a fence to a dma_fence_array
>    * @fence: fence to cast to a dma_fence_array
> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>   static inline struct dma_fence_array *
>   to_dma_fence_array(struct dma_fence *fence)
>   {
> -	if (fence->ops != &dma_fence_array_ops)
> +	if (!fence || !dma_fence_is_array(fence))
>   		return NULL;
>   
>   	return container_of(fence, struct dma_fence_array, base);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 54fe3443fd2c..ee906b659694 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>   	spinlock_t lock;
>   };
>   
> -extern const struct dma_fence_ops dma_fence_chain_ops;
>   
>   /**
>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>   static inline struct dma_fence_chain *
>   to_dma_fence_chain(struct dma_fence *fence)
>   {
> -	if (!fence || fence->ops != &dma_fence_chain_ops)
> +	if (!fence || !dma_fence_is_chain(fence))
>   		return NULL;
>   
>   	return container_of(fence, struct dma_fence_chain, base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 1ea691753bd3..775cdc0b4f24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   
> +extern const struct dma_fence_ops dma_fence_array_ops;
> +extern const struct dma_fence_ops dma_fence_chain_ops;
> +
> +/**
> + * dma_fence_is_array - check if a fence is from the array subclass
> + * @fence: the fence to test
> + *
> + * Return true if it is a dma_fence_array and false otherwise.
> + */
> +static inline bool dma_fence_is_array(struct dma_fence *fence)
> +{
> +	return fence->ops == &dma_fence_array_ops;
> +}
> +
> +/**
> + * dma_fence_is_chain - check if a fence is from the chain subclass
> + * @fence: the fence to test
> + *
> + * Return true if it is a dma_fence_chain and false otherwise.
> + */
> +static inline bool dma_fence_is_chain(struct dma_fence *fence)
> +{
> +	return fence->ops == &dma_fence_chain_ops;
> +}
> +
> +/**
> + * dma_fence_is_container - check if a fence is a container for other fences
> + * @fence: the fence to test
> + *
> + * Return true if this fence is a container for other fences, false otherwise.
> + * This is important since we can't build up large fence structure or otherwise
> + * we run into recursion during operation on those fences.
> + */
> +static inline bool dma_fence_is_container(struct dma_fence *fence)
> +{
> +	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
> +}

What's the strategy here moving forward if we add more dma_resv 
containers, or if a driver adds a container that similarly has risc of 
recursion? Should we perhaps add an ops bool for this, or require that 
all dma_resv containers that has this limitation be part of the dma-buf 
subsystem rather than driver-specific?

Thanks,
/Thomas


> +
>   #endif /* __LINUX_DMA_FENCE_H */
