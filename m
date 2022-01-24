Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6F49854A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819A310E350;
	Mon, 24 Jan 2022 16:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B025410E344;
 Mon, 24 Jan 2022 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643043159; x=1674579159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fu1nTdM6Ey9Y88os1dkd6NMK6cktB4QUGnnOy1VQzQ4=;
 b=E2Tmz2HzT7BKxc9+G5uFCWVOeQKMVTfyf4KqHKxwuTYzypK2DG9ve2Ns
 JbHkPmvU6uARobOnPdQbYTnweGKT54eQLO1fLkjLvZA5Gbea5y+vJO8Xu
 OqHuMhDlWT7JpgIGmgFqb9hLxsW1xdNhhBFAqTQCTyi63Rf944/veNUqw
 FJfDJTj17KACBqL8dN3jqd9FQr1v67h+tcREYTqFBcPw1t3jl3ehNfQP5
 HJ/EX2gOxEwA3NutBGHKdAZv1CBCaGgxeTskHYVGPoqzH2EA2A1ypLTs2
 kDECQoZh50b5Lb6LVikxj1KnKn8IQabpcN8L1netbDclzGwY4FX3pEbk5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="233452292"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="233452292"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:52:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="624141222"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70])
 ([10.249.254.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:52:34 -0800
Message-ID: <b609fb36-b4e0-738c-01d3-b74c760a9e82@linux.intel.com>
Date: Mon, 24 Jan 2022 17:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/11] dma-buf: add dma_fence_chain_contained helper
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 zackr@vmware.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-9-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220124130328.2376-9-christian.koenig@amd.com>
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


On 1/24/22 14:03, Christian König wrote:
> It's a reoccurring pattern that we need to extract the fence
> from a dma_fence_chain object. Add a helper for this.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/dma-buf/dma-fence-chain.c |  6 ++----
>   include/linux/dma-fence-chain.h   | 15 +++++++++++++++
>   2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 084c6927b735..06f8ef97c6e8 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -148,8 +148,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>   
>   	dma_fence_get(&head->base);
>   	dma_fence_chain_for_each(fence, &head->base) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> -		struct dma_fence *f = chain ? chain->fence : fence;
> +		struct dma_fence *f = dma_fence_chain_contained(fence);
>   
>   		dma_fence_get(f);
>   		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
> @@ -165,8 +164,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>   static bool dma_fence_chain_signaled(struct dma_fence *fence)
>   {
>   	dma_fence_chain_for_each(fence, fence) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> -		struct dma_fence *f = chain ? chain->fence : fence;
> +		struct dma_fence *f = dma_fence_chain_contained(fence);
>   
>   		if (!dma_fence_is_signaled(f)) {
>   			dma_fence_put(fence);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index ee906b659694..10d51bcdf7b7 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
>   	return container_of(fence, struct dma_fence_chain, base);
>   }
>   
> +/**
> + * dma_fence_chain_contained - return the contained fence
> + * @fence: the fence to test
> + *
> + * If the fence is a dma_fence_chain the function returns the fence contained
> + * inside the chain object, otherwise it returns the fence itself.
> + */
> +static inline struct dma_fence *
> +dma_fence_chain_contained(struct dma_fence *fence)
> +{
> +	struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> +
> +	return chain ? chain->fence : fence;
> +}
> +
>   /**
>    * dma_fence_chain_alloc
>    *
