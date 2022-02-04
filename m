Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2944A97E8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BA610EFBF;
	Fri,  4 Feb 2022 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A510C10EFBF;
 Fri,  4 Feb 2022 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643971012; x=1675507012;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eWvItRcMoOSBs3A7yLi26vNjmLkOpVwdmoiUB35HhSU=;
 b=jGCdKEcDmLVx2XFu6Yf7OtFapd0IlkZVa5VO5RzXj5pIO8WNAT1rBCE0
 YJzSEUDckBU0+JPWO5hn37TGsuSEa5lg7ljnf4aT/jJwZhNOUj3W6qak7
 FbPcBa+RVmdszlH7jUrt6T/iqOXb2FuyB0FjLdl4SPG4vRuy5XExk4GwU
 P6yteueOd0n+vXQM1N/BUDdo2Q09VOskCtPc7ce5M3TedF9w29ppWUsuc
 Rf4zpNQSe5hewMiEXQjxBJwlALVMUHfi/M4dPriZ9YWKMBvckaNs3XrUE
 Xp9lTK/cd815JOCrTt4adXs5gy4B10NBPjTvFu8Ya3OKic5p9IGkYt5It g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228998909"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="228998909"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 02:36:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="524272982"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 02:36:49 -0800
Message-ID: <e64122b610d97d7bc2eef7ce8d66c9928a32e8c1.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] dma-buf: consolidate dma_fence subclass checking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 sumit.semwal@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org,  linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Date: Fri, 04 Feb 2022 11:36:46 +0100
In-Reply-To: <20220204100429.2049-2-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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

On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
> Consolidate the wrapper functions to check for dma_fence
> subclasses in the dma_fence header.
> 
> This makes it easier to document and also check the different
> requirements for fence containers in the subclasses.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I'd probably still opt for a fence ops is_container member, but won't
insist.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  include/linux/dma-fence-array.h | 15 +------------
>  include/linux/dma-fence-chain.h |  3 +--
>  include/linux/dma-fence.h       | 38
> +++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-
> fence-array.h
> index 303dd712220f..fec374f69e12 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -45,19 +45,6 @@ struct dma_fence_array {
>         struct irq_work work;
>  };
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
> -       return fence->ops == &dma_fence_array_ops;
> -}
> -
>  /**
>   * to_dma_fence_array - cast a fence to a dma_fence_array
>   * @fence: fence to cast to a dma_fence_array
> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct
> dma_fence *fence)
>  static inline struct dma_fence_array *
>  to_dma_fence_array(struct dma_fence *fence)
>  {
> -       if (fence->ops != &dma_fence_array_ops)
> +       if (!fence || !dma_fence_is_array(fence))
>                 return NULL;
>  
>         return container_of(fence, struct dma_fence_array, base);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-
> fence-chain.h
> index 54fe3443fd2c..ee906b659694 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>         spinlock_t lock;
>  };
>  
> -extern const struct dma_fence_ops dma_fence_chain_ops;
>  
>  /**
>   * to_dma_fence_chain - cast a fence to a dma_fence_chain
> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops
> dma_fence_chain_ops;
>  static inline struct dma_fence_chain *
>  to_dma_fence_chain(struct dma_fence *fence)
>  {
> -       if (!fence || fence->ops != &dma_fence_chain_ops)
> +       if (!fence || !dma_fence_is_chain(fence))
>                 return NULL;
>  
>         return container_of(fence, struct dma_fence_chain, base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 1ea691753bd3..775cdc0b4f24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);
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
> +       return fence->ops == &dma_fence_array_ops;
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
> +       return fence->ops == &dma_fence_chain_ops;
> +}
> +
> +/**
> + * dma_fence_is_container - check if a fence is a container for
> other fences
> + * @fence: the fence to test
> + *
> + * Return true if this fence is a container for other fences, false
> otherwise.
> + * This is important since we can't build up large fence structure
> or otherwise
> + * we run into recursion during operation on those fences.
> + */
> +static inline bool dma_fence_is_container(struct dma_fence *fence)
> +{
> +       return dma_fence_is_array(fence) ||
> dma_fence_is_chain(fence);
> +}
> +
>  #endif /* __LINUX_DMA_FENCE_H */


