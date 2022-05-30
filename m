Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A605378DE
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 12:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F215E10E295;
	Mon, 30 May 2022 10:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3810E1CF;
 Mon, 30 May 2022 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653905365; x=1685441365;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jvEQo2hR+MafbUkkbBqczoq0zg0Lmw32pAXxQ9XdKRM=;
 b=FW1HRnhexrvx/GT4+z++eZazrRB1JtzsjswfN4lfbqNRx3z4gSbPmNEs
 tQr9JxF5BADxzusSObHaey5rKw64zqyly3GRLtPAsVAZSvEaO4l+R/MvS
 HdwFtWnOhc2GWgl4gTl5RFkYkj/wC8n9CYUD0JeBn31rB455jfGCOwhvw
 Q/k+dmjR2dobjmkeKnlYdsLnaEeVknO5HV+MeaSstwsqWrfKgbKg7cj2D
 16RPwqzaEgnosdvFv2tmhJNI01mH5HcO6mocgeaP41EY3bxJO7wrK9eKk
 Wh3SNbrxC+21ULOjQDHnvME/CpG+CUxOxlf1S4cOOMNyr2DplJRteTS1u Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="275048823"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="275048823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 03:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="611378309"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2022 03:09:24 -0700
Received: from [10.249.137.127] (unknown [10.249.137.127])
 by linux.intel.com (Postfix) with ESMTP id EF099580ADE;
 Mon, 30 May 2022 03:09:22 -0700 (PDT)
Message-ID: <442b3a43-2b8b-e9be-6ee4-b4b2357c8cf0@intel.com>
Date: Mon, 30 May 2022 13:09:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
 <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
 <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
 <20220525215933.m4yhm3b653gt4knp@ldmartin-desk2>
 <b54b2cc7-f511-e6ce-72fa-da5c8cd5e7b4@gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <b54b2cc7-f511-e6ce-72fa-da5c8cd5e7b4@gmail.com>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2022 12:52, Christian König wrote:
> Am 25.05.22 um 23:59 schrieb Lucas De Marchi:
>> On Wed, May 25, 2022 at 12:38:51PM +0200, Christian König wrote:
>>> Am 25.05.22 um 11:35 schrieb Lionel Landwerlin:
>>>> [SNIP]
>>>>
>>>> Err... Let's double check with my colleagues.
>>>>
>>>> It seems we're running into a test failure in IGT with this patch, 
>>>> but now I have doubts that it's where the problem lies.
>>>
>>> Yeah, exactly that's what I couldn't understand as well.
>>>
>>> What you describe above should still work fine.
>>>
>>> Thanks for taking a look into this,
>>> Christian.
>>
>> With some additional prints:
>>
>> [  210.742634] Console: switching to colour dummy device 80x25
>> [  210.742686] [IGT] syncobj_timeline: executing
>> [  210.756988] [IGT] syncobj_timeline: starting subtest 
>> transfer-timeline-point
>> [  210.757364] [drm:drm_syncobj_transfer_ioctl] *ERROR* adding fence0 
>> signaled=1
>> [  210.764543] [drm:drm_syncobj_transfer_ioctl] *ERROR* resulting 
>> array fence signaled=0
>> [  210.800469] [IGT] syncobj_timeline: exiting, ret=98
>> [  210.825426] Console: switching to colour frame buffer device 240x67
>>
>>
>> still learning this part of the code but AFAICS the problem is because
>> when we are creating the array, the 'signaled' doesn't propagate to the
>> array.
>
> Yeah, but that is intentionally. The array should only signal when 
> requested.
>
> I still don't get what the test case here is checking.


There must be something I don't know about fence arrays.

You seem to say that creating an array of signaled fences will not make 
the array signaled.


This is the situation with this IGT test.

We started with a syncobj with point 1 & 2 signaled.

We take point 2 and import it as a new point 3 on the same syncobj.

We expect point 3 to be signaled as well and it's not.


Thanks,


-Lionel


>
> Regards,
> Christian.
>
>>
>> dma_fence_array_create() {
>>     ...
>>     atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>>     ...
>> }
>>
>> This is not considering the fact that some of the fences could already
>> have been signaled as is the case in the 
>> igt@syncobj_timeline@transfer-timeline-point
>> test. See 
>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11693/shard-dg1-12/igt@syncobj_timeline@transfer-timeline-point.html
>>
>> Quick patch on this function fixes it for me:
>>
>> ---------8<----------------
>> Subject: [PATCH] dma-buf: Honor already signaled fences on array 
>> creation
>>
>> When creating an array, array->num_pending is marked with the number of
>> fences. However the fences could alredy have been signaled. Propagate
>> num_pending to the array by looking at each individual fence the array
>> contains.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/dma-buf/dma-fence-array.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 5c8a7084577b..32f491c32fa0 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -158,6 +158,8 @@ struct dma_fence_array 
>> *dma_fence_array_create(int num_fences,
>>  {
>>      struct dma_fence_array *array;
>>      size_t size = sizeof(*array);
>> +    unsigned num_pending = 0;
>> +    struct dma_fence **f;
>>
>>      WARN_ON(!num_fences || !fences);
>>
>> @@ -173,7 +175,14 @@ struct dma_fence_array 
>> *dma_fence_array_create(int num_fences,
>>      init_irq_work(&array->work, irq_dma_fence_array_work);
>>
>>      array->num_fences = num_fences;
>> -    atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>> +
>> +    for (f = fences; f < fences + num_fences; f++)
>> +        num_pending += !dma_fence_is_signaled(*f);
>> +
>> +    if (signal_on_any)
>> +        num_pending = !!num_pending;
>> +
>> +    atomic_set(&array->num_pending, num_pending);
>>      array->fences = fences;
>>
>>      array->base.error = PENDING_ERROR;
>

