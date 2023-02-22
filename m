Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4C69F2B0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB310E8B4;
	Wed, 22 Feb 2023 10:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C58A10E8B4;
 Wed, 22 Feb 2023 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677061626; x=1708597626;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ROYBNvdshjuHZw4os+dyBA0uMZJ7aJNn9ECIXz0QvQo=;
 b=bG8HfRdX10HH/bAjAhkfFX+Xlhltc1XafBKXvP4D1KdKFLq+yqDwkLDN
 41gIAUHLjBf+wIg3lLUgE6qa8ZOF24T1i/HvAO/YvuSDDTT4804ehZMrj
 fN04jTctlaz0CKe/MF7qcIRpuBHPJ6lUoUMH9J2rqvCHaqy+5kBxlGeXQ
 972OWncGSuuPyzFISdhKZrazIuD8hWs9vClN/txtxCFfJ5DdYshuU7OY4
 3TZE9zwIHcranHwsjUwchwHEa6pI9GLVIqR5iBw8h/0gA9B/wZ+rLly+b
 +kTR88rH175rfXHUhnx+slWVJEHbr6hpJiddFrGdTZhj+uRHNqtT7HHKU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330615651"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="330615651"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 02:27:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="846081123"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="846081123"
Received: from hhammad-mobl1.ger.corp.intel.com (HELO [10.213.231.87])
 ([10.213.231.87])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 02:27:02 -0800
Message-ID: <b056a87c-b6b2-25e0-25c7-f7d422793a3e@linux.intel.com>
Date: Wed, 22 Feb 2023 10:27:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 03/14] dma-buf/fence-chain: Add fence deadline support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-4-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230218211608.1630586-4-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2023 21:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Propagate the deadline to all the fences in the chain.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
> ---
>   drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a0d920576ba6..4684874af612 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -206,6 +206,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>   	dma_fence_free(fence);
>   }
>   
> +
> +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
> +					 ktime_t deadline)
> +{
> +	dma_fence_chain_for_each(fence, fence) {
> +		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> +		struct dma_fence *f = chain ? chain->fence : fence;

Low level comment - above two lines could be replaced with:

	struct dma_fence *f = dma_fence_chain_contained(fence);

Although to be fair I am not sure that wouldn't be making it less 
readable. From the point of view that fence might not be a chain, so 
dma_fence_chain_contained() reads a bit dodgy as an API.

Regards,

Tvrtko

> +
> +		dma_fence_set_deadline(f, deadline);
> +	}
> +}
> +
>   const struct dma_fence_ops dma_fence_chain_ops = {
>   	.use_64bit_seqno = true,
>   	.get_driver_name = dma_fence_chain_get_driver_name,
> @@ -213,6 +225,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>   	.enable_signaling = dma_fence_chain_enable_signaling,
>   	.signaled = dma_fence_chain_signaled,
>   	.release = dma_fence_chain_release,
> +	.set_deadline = dma_fence_chain_set_deadline,
>   };
>   EXPORT_SYMBOL(dma_fence_chain_ops);
>   
