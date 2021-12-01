Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC8464B8E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 11:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A6D6F5B4;
	Wed,  1 Dec 2021 10:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 565 seconds by postgrey-1.36 at gabe;
 Wed, 01 Dec 2021 10:25:29 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF76F5B4;
 Wed,  1 Dec 2021 10:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 16FAD3F3B3;
 Wed,  1 Dec 2021 11:16:02 +0100 (CET)
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
 with ESMTP id 5XLpvDYEWWnm; Wed,  1 Dec 2021 11:16:00 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id DB0183F27F;
 Wed,  1 Dec 2021 11:15:59 +0100 (CET)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 699B536256A;
 Wed,  1 Dec 2021 11:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638353759; bh=ccUzI4OwRxrmYh6goQk2dMUaiYd/BXAPoDZdeFjeLvE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DhiJm29V+knoT2EPt8JV/ECYyDhKcmuAHJc5cnv2nTO4cbEvu5psWUqsOtxy6QDIi
 Hf5kCbavflmQiCzvU4T3NHM4SUghDNaocMZojPyv4kEsivKIeZZ/0maWDEkLOK1Fxa
 0ENNqaXMA0kZxh/wxfOazXXlOepAaYMkJn26NsFE=
Message-ID: <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
Date: Wed, 1 Dec 2021 11:15:59 +0100
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
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


On 12/1/21 09:36, Christian König wrote:
> Am 01.12.21 um 09:23 schrieb Thomas Hellström (Intel):
>>  [SNIP]
>>>>>> Jason and I came up with a deep dive iterator for his use case, 
>>>>>> but I
>>>>>> think we don't want to use that any more after my dma_resv rework.
>>>>>>
>>>>>> In other words when you need to create a new dma_fence_array you
>>>>>> flatten
>>>>>> out the existing construct which is at worst case
>>>>>> dma_fence_chain->dma_fence_array->dma_fence.
>>>>> Ok, Are there any cross-driver contract here, Like every driver 
>>>>> using a
>>>>> dma_fence_array need to check for dma_fence_chain and flatten like
>>>>> above?
>>>
>>> So far we only discussed that on the mailing list but haven't made 
>>> any documentation for that.
>>
>> OK, one other cross-driver pitfall I see is if someone accidently 
>> joins two fence chains together by creating a fence chain unknowingly 
>> using another fence chain as the @fence argument?
>
> That would indeed be illegal and we should probably add a WARN_ON() 
> for that.
>
>>
>> The third cross-driver pitfall IMHO is the locking dependency these 
>> containers add. Other drivers (read at least i915) may have defined 
>> slightly different locking orders and that should also be addressed 
>> if needed, but that requires a cross driver agreement what the 
>> locking orders really are. Patch 1 actually addresses this, while 
>> keeping the container lockdep warnings for deep recursions, so at 
>> least I think that could serve as a discussion starter.
>
> No, drivers should never make any assumptions on that.

Yes that i915 assumption of taking the lock of the last signaled fence 
first goes back a while in time. We should look at fixing that up, and 
document any (possibly forbidden) assumptions about fence lock locking 
orders to avoid it happening again, if there is no common cross-driver 
locking order that can be agreed.

>
> E.g. when you need to take a look from a callback you must guarantee 
> that you never have that lock taken when you call any of the dma_fence 
> functions. Your patch breaks the lockdep annotation for that.

I'm pretty sure that could be fixed in a satisfactory way if needed.

>
> What we could do is to avoid all this by not calling the callback with 
> the lock held in the first place.

If that's possible that might be a good idea, pls also see below.

>
>>>
>>>>>
>>>>> /Thomas
>>>>
>>>> Oh, and a follow up question:
>>>>
>>>> If there was a way to break the recursion on final put() (using the 
>>>> same basic approach as patch 2 in this series uses to break 
>>>> recursion in enable_signaling()), so that none of these containers 
>>>> did require any special treatment, would it be worth pursuing? I 
>>>> guess it might be possible by having the callbacks drop the 
>>>> references rather than the loop in the final put. + a couple of 
>>>> changes in code iterating over the fence pointers.
>>>
>>> That won't really help, you just move the recursion from the final 
>>> put into the callback.
>>
>> How do we recurse from the callback? The introduced fence_put() of 
>> individual fence pointers
>> doesn't recurse anymore (at most 1 level), and any callback recursion 
>> is broken by the irq_work?
>
> Yeah, but then you would need to take another lock to avoid racing 
> with dma_fence_array_signaled().
>
>>
>> I figure the big amount of work would be to adjust code that iterates 
>> over the individual fence pointers to recognize that they are rcu 
>> protected.
>
> Could be that we could solve this with RCU, but that sounds like a lot 
> of churn for no gain at all.
>
> In other words even with the problems solved I think it would be a 
> really bad idea to allow chaining of dma_fence_array objects.

Yes, that was really the question, Is it worth pursuing this? I'm not 
really suggesting we should allow this as an intentional feature. I'm 
worried, however, that if we allow these containers to start floating 
around cross-driver (or even internally) disguised as ordinary 
dma_fences, they would require a lot of driver special casing, or else 
completely unexpeced WARN_ON()s and lockdep splats would start to turn 
up, scaring people off from using them. And that would be a breeding 
ground for hairy driver-private constructs.

/Thomas


>
> Christian.
>
>>
>>
>> Thanks,
>>
>> /Thomas
>>
>>
