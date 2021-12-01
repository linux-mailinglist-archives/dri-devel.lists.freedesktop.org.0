Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB90464DC0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F426FB39;
	Wed,  1 Dec 2021 12:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247646FB38;
 Wed,  1 Dec 2021 12:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 3B3C43F566;
 Wed,  1 Dec 2021 13:16:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.738
X-Spam-Level: 
X-Spam-Status: No, score=-2.738 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.639,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rmu5eBW_eil8; Wed,  1 Dec 2021 13:16:13 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 322893F429;
 Wed,  1 Dec 2021 13:16:11 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.54])
 by mail1.shipmail.org (Postfix) with ESMTPSA id ED03B36256A;
 Wed,  1 Dec 2021 13:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638360971; bh=JoZEm0i+uOKd6rkwlk0acpTHPgi+T2+oCMOM2z+pctQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L/oZk5/JWWxfxCJrorqXMeJd1Z1DXAl+7Ur6Xvj1o6uT7Zp7ftBobdBuLmtNvYQoc
 6BKVobn8feHcICLGPr5Qhfgn/vyTJqKdoiFu3XlWKem6hJn4Hg1cE8oyjvmhrNWvbr
 ozHRcWtJ8WthLZ4t5Wdl7GTehDGGN0FegcihkAis=
Message-ID: <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
Date: Wed, 1 Dec 2021 13:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/1/21 12:25, Christian König wrote:
> Am 01.12.21 um 12:04 schrieb Thomas Hellström (Intel):
>>
>> On 12/1/21 11:32, Christian König wrote:
>>> Am 01.12.21 um 11:15 schrieb Thomas Hellström (Intel):
>>>> [SNIP]
>>>>>
>>>>> What we could do is to avoid all this by not calling the callback 
>>>>> with the lock held in the first place.
>>>>
>>>> If that's possible that might be a good idea, pls also see below.
>>>
>>> The problem with that is 
>>> dma_fence_signal_locked()/dma_fence_signal_timestamp_locked(). If we 
>>> could avoid using that or at least allow it to drop the lock then we 
>>> could call the callback without holding it.
>>>
>>> Somebody would need to audit the drivers and see if holding the lock 
>>> is really necessary anywhere.
>>>
>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>> /Thomas
>>>>>>>>
>>>>>>>> Oh, and a follow up question:
>>>>>>>>
>>>>>>>> If there was a way to break the recursion on final put() (using 
>>>>>>>> the same basic approach as patch 2 in this series uses to break 
>>>>>>>> recursion in enable_signaling()), so that none of these 
>>>>>>>> containers did require any special treatment, would it be worth 
>>>>>>>> pursuing? I guess it might be possible by having the callbacks 
>>>>>>>> drop the references rather than the loop in the final put. + a 
>>>>>>>> couple of changes in code iterating over the fence pointers.
>>>>>>>
>>>>>>> That won't really help, you just move the recursion from the 
>>>>>>> final put into the callback.
>>>>>>
>>>>>> How do we recurse from the callback? The introduced fence_put() 
>>>>>> of individual fence pointers
>>>>>> doesn't recurse anymore (at most 1 level), and any callback 
>>>>>> recursion is broken by the irq_work?
>>>>>
>>>>> Yeah, but then you would need to take another lock to avoid racing 
>>>>> with dma_fence_array_signaled().
>>>>>
>>>>>>
>>>>>> I figure the big amount of work would be to adjust code that 
>>>>>> iterates over the individual fence pointers to recognize that 
>>>>>> they are rcu protected.
>>>>>
>>>>> Could be that we could solve this with RCU, but that sounds like a 
>>>>> lot of churn for no gain at all.
>>>>>
>>>>> In other words even with the problems solved I think it would be a 
>>>>> really bad idea to allow chaining of dma_fence_array objects.
>>>>
>>>> Yes, that was really the question, Is it worth pursuing this? I'm 
>>>> not really suggesting we should allow this as an intentional 
>>>> feature. I'm worried, however, that if we allow these containers to 
>>>> start floating around cross-driver (or even internally) disguised 
>>>> as ordinary dma_fences, they would require a lot of driver special 
>>>> casing, or else completely unexpeced WARN_ON()s and lockdep splats 
>>>> would start to turn up, scaring people off from using them. And 
>>>> that would be a breeding ground for hairy driver-private constructs.
>>>
>>> Well the question is why we would want to do it?
>>>
>>> If it's to avoid inter driver lock dependencies by avoiding to call 
>>> the callback with the spinlock held, then yes please. We had tons of 
>>> problems with that, resulting in irq_work and work_item delegation 
>>> all over the place.
>>
>> Yes, that sounds like something desirable, but in these containers, 
>> what's causing the lock dependencies is the enable_signaling() 
>> callback that is typically called locked.
>>
>>
>>>
>>> If it's to allow nesting of dma_fence_array instances, then it's 
>>> most likely a really bad idea even if we fix all the locking order 
>>> problems.
>>
>> Well I think my use-case where I hit a dead end may illustrate what 
>> worries me here:
>>
>> 1) We use a dma-fence-array to coalesce all dependencies for ttm 
>> object migration.
>> 2) We use a dma-fence-chain to order the resulting dm_fence into a 
>> timeline because the TTM resource manager code requires that.
>>
>> Initially seemingly harmless to me.
>>
>> But after a sequence evict->alloc->clear, the dma-fence-chain feeds 
>> into the dma-fence-array for the clearing operation. Code still works 
>> fine, and no deep recursion, no warnings. But if I were to add 
>> another driver to the system that instead feeds a dma-fence-array 
>> into a dma-fence-chain, this would give me a lockdep splat.
>>
>> So then if somebody were to come up with the splendid idea of using a 
>> dma-fence-chain to initially coalesce fences, I'd hit the same 
>> problem or risk illegaly joining two dma-fence-chains together.
>>
>> To fix this, I would need to look at the incoming fences and iterate 
>> over any dma-fence-array or dma-fence-chain that is fed into the 
>> dma-fence-array to flatten out the input. In fact all dma-fence-array 
>> users would need to do that, and even dma-fence-chain users watching 
>> out for not joining chains together or accidently add an array that 
>> perhaps came as a disguised dma-fence from antother driver.
>>
>> So the purpose to me would be to allow these containers as input to 
>> eachother without a lot of in-driver special-casing, be it by 
>> breaking recursion on built-in flattening to avoid
>>
>> a) Hitting issues in the future or with existing interoperating drivers.
>> b) Avoid driver-private containers that also might break the 
>> interoperability. (For example the i915 currently driver-private 
>> dma_fence_work avoid all these problems, but we're attempting to 
>> address issues in common code rather than re-inventing stuff 
>> internally).
>
> I don't think that a dma_fence_array or dma_fence_chain is the right 
> thing to begin with in those use cases.
>
> When you want to coalesce the dependencies for a job you could either 
> use an xarray like Daniel did for the scheduler or some hashtable like 
> we use in amdgpu. But I don't see the need for exposing the dma_fence 
> interface for those.

This is because the interface to our migration code takes just a single 
dma-fence as dependency. Now this is of course something we need to look 
at to mitigate this, but see below.

>
> And why do you use dma_fence_chain to generate a timeline for TTM? 
> That should come naturally because all the moves must be ordered.

Oh, in this case because we're looking at adding stuff at the end of 
migration (like coalescing object shared fences and / or async unbind 
fences), which may not complete in order.

But that's not really the point, the point was that an (at least to me) 
seemingly harmless usage pattern, be it real or fictious, ends up giving 
you severe internal- or cross-driver headaches.

/Thomas


>
> Regards,
> Christian.
>
>
