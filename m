Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E807C58E9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2710E91A;
	Wed, 11 Oct 2023 16:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5CC10E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:14:17 +0000 (UTC)
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
 by cmsmtp with ESMTP
 id qEXUqtsqlqBU3qbqiq6Woi; Wed, 11 Oct 2023 16:14:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id qbqhqaAWPFJJgqbqhqfJhT; Wed, 11 Oct 2023 16:14:15 +0000
X-Authority-Analysis: v=2.4 cv=XNAj9CtE c=1 sm=1 tr=0 ts=6526c9d7
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=V7xphIdJqzxAJ2XP6soA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IglXiu7clxmjc6NnMmyD4jz2gwc1+yZr7itwJnzvAag=; b=xt/Tb6mHGkEDAh4cK7S1dC9YrF
 Ndo23soGJTyTAu3uPEpBks1653WuqTh2RNwMKZBwa/ZscUhiKV5rrGUcELLkvzCHlxV7LwGGz9lle
 Rt1XSM4N3QugUJxGUlk0KGEc89mdad7gJ/wwviLO7zJ91SyJzF1Fon6J2fRVewGEsGemkGKNYiclv
 k2T39BjJcRgXe9Y7ZV5j0qNYvnM2mK7lQ9m85tPw8EIk9/rCGsKMIfSGppfDRXMwQLBevv+qmScCo
 y66LDAm+8vUF4TB+o4sXQ0nROLR3mid6Lf7MbYslf6jnqu7tH8M9AKzrrRjWtmGLtT3L5EzLvzQ4c
 +rL4Io2w==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:58052
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1)
 (envelope-from <gustavo@embeddedor.com>) id 1qqbqg-002zCK-1C;
 Wed, 11 Oct 2023 11:14:14 -0500
Message-ID: <0d63e8aa-5836-40e7-8f8a-2be10fbaac4a@embeddedor.com>
Date: Wed, 11 Oct 2023 10:13:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] dma-buf: Fix NULL pointer dereference in
 dma_fence_enable_sw_signaling()
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <ZSarP0/+hG8/87//@work> <202310110903.FE533CBCD@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202310110903.FE533CBCD@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qqbqg-002zCK-1C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.7])
 [187.162.21.192]:58052
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCntaGjkG2MyCz6h6Xs4KrHF+7wpSZL18Gr4oiZYu9J7t1FL6rsTCh/N/7m68s4oz83oAa5E+cTMlE0YLtAi/7LVk2V/Cbjzw1sVoJPQN1w7e4xuAqg8
 eUna+wTyy76Clvl3K3A0IarQuBrxGF9T9k5XD0Ugqs+dtsvhWlmLW40o0wCL4K0SW6H9spGWfUvEg9bLHo6NsegEm/vWnDAXv3bkqJex7PvSMt62DPKNmHRv
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/11/23 10:03, Kees Cook wrote:
> On Wed, Oct 11, 2023 at 08:03:43AM -0600, Gustavo A. R. Silva wrote:
>> Currently, a NULL pointer dereference will happen in function
>> `dma_fence_enable_sw_signaling()` (at line 615), in case `chain`
>> is not allocated in `mock_chain()` and this function returns
>> `NULL` (at line 86). See below:
>>
>> drivers/dma-buf/st-dma-fence-chain.c:
>>   86         chain = mock_chain(NULL, f, 1);
>>   87         if (!chain)
>>   88                 err = -ENOMEM;
>>   89
>>   90         dma_fence_enable_sw_signaling(chain);
> 
> Instead of the larger patch, should line 88 here just do a "return
> -ENOMEM" instead?

Nope. I would have to add a `goto` to skip `dma_fence_enable_sw_signaling(chain)`.

I originally thought of that, but as other _signaling() functions have
sanity-checks inside, I decided to go with that solution.

This bug has been there since Sep 2022. So, adding a sanity check inside that
function should prevent any other issue of this same kind to enter the codebase
and stay there for years.

--
Gustavo

> 
> -Kees
> 
>>
>> drivers/dma-buf/dma-fence.c:
>>   611 void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>   612 {
>>   613         unsigned long flags;
>>   614
>>   615         spin_lock_irqsave(fence->lock, flags);
>> 			       ^^^^^^^^^^^
>> 				    |
>> 			  NULL pointer reference
>> 			  if fence == NULL
>>
>>   616         __dma_fence_enable_signaling(fence);
>>   617         spin_unlock_irqrestore(fence->lock, flags);
>>   618 }
>>
>> Fix this by adding a NULL check before dereferencing `fence` in
>> `dma_fence_enable_sw_signaling()`. This will prevent any other NULL
>> pointer dereference when the `fence` passed as an argument is `NULL`.
>>
>> Addresses-Coverity: ("Dereference after null check")
>> Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for selftests")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/dma-buf/dma-fence.c | 9 ++++++++-
>>   include/linux/dma-fence.h   | 2 +-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 8aa8f8cb7071..4d2f13560d0f 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -607,14 +607,21 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>    * This will request for sw signaling to be enabled, to make the fence
>>    * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
>>    * internally.
>> + *
>> + * Returns 0 on success and a negative error value when @fence is NULL.
>>    */
>> -void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>> +int dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>   {
>>   	unsigned long flags;
>>   
>> +	if (!fence)
>> +		return -EINVAL;
>> +
>>   	spin_lock_irqsave(fence->lock, flags);
>>   	__dma_fence_enable_signaling(fence);
>>   	spin_unlock_irqrestore(fence->lock, flags);
>> +
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>   
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index ebe78bd3d121..1e4025e925e6 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -399,7 +399,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
>>   			   dma_fence_func_t func);
>>   bool dma_fence_remove_callback(struct dma_fence *fence,
>>   			       struct dma_fence_cb *cb);
>> -void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>> +int dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>   
>>   /**
>>    * dma_fence_is_signaled_locked - Return an indication if the fence
>> -- 
>> 2.34.1
>>
>>
> 
