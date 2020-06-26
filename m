Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F520B40D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEC66E040;
	Fri, 26 Jun 2020 14:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37CB6E040
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:59:22 +0000 (UTC)
IronPort-SDR: CoQ457CAsarFzhH/N0gXMhaUux6MdZ3onNW4CrbSoa7pm1FoQoxzF9+q+hgQVlvfwoADcnAJWJ
 hOZCQvP5aMOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143585963"
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="143585963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 07:56:33 -0700
IronPort-SDR: eFbCUkj768kU24weCs6pW+hJtqgA6T9Nd5RkOYsU1bGg+0ZU8kkj8nfh3KyF8102A7QDYxAqXr
 upUnRamWIFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="320021080"
Received: from marisaku-mobl.ger.corp.intel.com (HELO [10.252.49.150])
 ([10.252.49.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2020 07:56:32 -0700
Subject: Re: [PATCH] dma-buf: document dma-fence-chain purpose/behavior
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200626122100.55123-1-lionel.g.landwerlin@intel.com>
 <159318136926.13600.10560903966095562565@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <b5e6ac4d-eff9-b2ef-a05d-9f8674f1d471@intel.com>
Date: Fri, 26 Jun 2020 17:56:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159318136926.13600.10560903966095562565@build.alporthouse.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/06/2020 17:22, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-06-26 13:21:00)
>> Trying to explain a bit how this thing works. In my opinion diagrams
>> are a bit easier to understand than words.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   drivers/dma-buf/dma-fence-chain.c | 37 +++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index 3d123502ff12..ac90ddf37b55 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -9,6 +9,43 @@
>>   
>>   #include <linux/dma-fence-chain.h>
>>   
>> +/**
>> + * DOC: DMA fence chains overview
>> + *
>> + * DMA fence chains, represented by &struct dma_fence_chain, are a kernel
>> + * internal synchronization primitive providing a wrapping mechanism of other
>> + * DMA fences in the form a single link list.
>> + *
>> + * One of the use case of this primitive is to implement Vulkan timeline
>> + * semaphores (see VK_KHR_timeline_semaphore extension or Vulkan specification
>> + * 1.2).
>> + *
>> + * Each DMA fence chain item wraps 2 items :
>> + *
>> + * - A previous DMA fence.
>> + *
>> + * - A DMA fence associated to the current &struct dma_fence_chain.
>> + *
>> + * A DMA fence chain becomes signaled when its previous fence as well as its
>> + * associated fence are signaled. If a chain of dma fence chains is created,
>> + * this property recurses, meaning that any dma fence chain element in the
>> + * list becomes signaled only if its associated fence and all the previous
>> + * fences in the chain are also signaled.
>> + *
>> + * A DMA fence chain's seqno is specified through dma_fence_chain_init(). This
>> + * value is lower bound to the seqno of the previous fence to ensure the chain
>> + * is monotically increasing.
>> + *
>> + * By traversing the chain's linked list, one can compute a seqno number
>> + * associated with the chain such that is the highest number for which all
>> + * previous fences have signaled.
> Next fence - 1 == highest seqno for all previous fences.
>
> Ok, what about the end point then? If you ask for a seqno higher than
> the last fence. Since that is not yet defined, it is an error, right?


Correct, find_seqno() will return -EINVAL in that case.


-Lionel


> Otherwise, we could interpret the highest possible seqno for the last
> fence as meaning U64_MAX.
> -Chris


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
