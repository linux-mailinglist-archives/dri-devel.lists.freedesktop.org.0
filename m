Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102705339F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 11:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383D10F1D6;
	Wed, 25 May 2022 09:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24AC10F17F;
 Wed, 25 May 2022 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653471324; x=1685007324;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ePDzspSJAtASYEzTmeujXYMvbFnyVe50ToAs+XCbIAg=;
 b=AMFZ9fs5m7vPnFCKPmsPFm8q2/kNJfjLfTSIKL11/edcBOv9A+uEp9Pl
 PrdyU4BO7dD3xGAOhnWkf5OCrDbgZOuroYq5hwixCjaBYh8AO5oJXISs1
 0eIvKaWk4ispRyFPook5nme6caWqfr9ct6OiHUwDeMQTF/E8Q7+uD53LQ
 j0Y2mzdxbchTSpPq0QswuBAcK3uqT9VzY1NwFuObkCnINaFiOkj0QY057
 b0wwxJhsMyeTQJGIpyTT9rknMCWx4mV4G+121y2qcXTdRw6JujFjPd7D8
 2tPHgk8YroUE86ZJP7tQwFhONbzLZbyuXGrKTR9ZiZFVLnG/czF5XbSgP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="334412269"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="334412269"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 02:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="664341714"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2022 02:35:23 -0700
Received: from [10.249.136.113] (unknown [10.249.136.113])
 by linux.intel.com (Postfix) with ESMTP id 95931580AFE;
 Wed, 25 May 2022 02:35:21 -0700 (PDT)
Message-ID: <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
Date: Wed, 25 May 2022 12:35:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
In-Reply-To: <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/05/2022 12:26, Lionel Landwerlin wrote:
> On 25/05/2022 11:24, Christian König wrote:
>> Am 25.05.22 um 08:47 schrieb Lionel Landwerlin:
>>> On 09/02/2022 20:26, Christian König wrote:
>>>> It is illegal to add a dma_fence_chain as timeline point. Flatten out
>>>> the fences into a dma_fence_array instead.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_syncobj.c | 61 
>>>> ++++++++++++++++++++++++++++++++---
>>>>   1 file changed, 56 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>>>> b/drivers/gpu/drm/drm_syncobj.c
>>>> index c313a5b4549c..7e48dcd1bee4 100644
>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>> @@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct 
>>>> drm_device *dev, void *data,
>>>>                       &args->handle);
>>>>   }
>>>>   +
>>>> +/*
>>>> + * Try to flatten a dma_fence_chain into a dma_fence_array so that 
>>>> it can be
>>>> + * added as timeline fence to a chain again.
>>>> + */
>>>> +static int drm_syncobj_flatten_chain(struct dma_fence **f)
>>>> +{
>>>> +    struct dma_fence_chain *chain = to_dma_fence_chain(*f);
>>>> +    struct dma_fence *tmp, **fences;
>>>> +    struct dma_fence_array *array;
>>>> +    unsigned int count;
>>>> +
>>>> +    if (!chain)
>>>> +        return 0;
>>>> +
>>>> +    count = 0;
>>>> +    dma_fence_chain_for_each(tmp, &chain->base)
>>>> +        ++count;
>>>> +
>>>> +    fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
>>>> +    if (!fences)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    count = 0;
>>>> +    dma_fence_chain_for_each(tmp, &chain->base)
>>>> +        fences[count++] = dma_fence_get(tmp);
>>>> +
>>>> +    array = dma_fence_array_create(count, fences,
>>>> +                       dma_fence_context_alloc(1),
>>>
>>>
>>> Hi Christian,
>>>
>>>
>>> Sorry for the late answer to this.
>>>
>>>
>>> It appears this commit is trying to remove the warnings added by 
>>> "dma-buf: Warn about dma_fence_chain container rules"
>>
>> Yes, correct. We are now enforcing some rules with warnings and this 
>> here bubbled up.
>>
>>>
>>> But the context allocation you added just above is breaking some 
>>> tests. In particular igt@syncobj_timeline@transfer-timeline-point
>>>
>>> That test transfer points into the timeline at point 3 and expects 
>>> that we'll still on the previous points to complete.
>>
>> Hui what? I don't understand the problem you are seeing here. What 
>> exactly is the test doing?
>>
>>>
>>> In my opinion we should be reusing the previous context number if 
>>> there is one and only allocate if we don't have a point.
>>
>> Scratching my head what you mean with that. The functionality 
>> transfers a synchronization fence from one timeline to another.
>>
>> So as far as I can see the new point should be part of the timeline 
>> of the syncobj we are transferring to.
>>
>>> If the application wants to not depend on previous points for wait 
>>> operations, it can reset the syncobj prior to adding a new point.
>>
>> Well we should never lose synchronization. So what happens is that 
>> when we do the transfer all the fences of the source are flattened 
>> out into an array. And that array is then added as new point into the 
>> destination timeline.
>
>
> In this case would be broken :
>
>
> syncobjA <- signal point 1
>
> syncobjA <- import syncobjB point 1 into syncobjA point 2
>
> syncobjA <- query returns 0
>
>
> -Lionel


Err... Let's double check with my colleagues.

It seems we're running into a test failure in IGT with this patch, but 
now I have doubts that it's where the problem lies.


-Lionel


>
>
>>
>> Where exactly is the problem?
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>>
>>> Cheers,
>>>
>>>
>>> -Lionel
>>>
>>>
>>>
>>>> +                       1, false);
>>>> +    if (!array)
>>>> +        goto free_fences;
>>>> +
>>>> +    dma_fence_put(*f);
>>>> +    *f = &array->base;
>>>> +    return 0;
>>>> +
>>>> +free_fences:
>>>> +    while (count--)
>>>> +        dma_fence_put(fences[count]);
>>>> +
>>>> +    kfree(fences);
>>>> +    return -ENOMEM;
>>>> +}
>>>> +
>>>>   static int drm_syncobj_transfer_to_timeline(struct drm_file 
>>>> *file_private,
>>>>                           struct drm_syncobj_transfer *args)
>>>>   {
>>>>       struct drm_syncobj *timeline_syncobj = NULL;
>>>> -    struct dma_fence *fence;
>>>>       struct dma_fence_chain *chain;
>>>> +    struct dma_fence *fence;
>>>>       int ret;
>>>>         timeline_syncobj = drm_syncobj_find(file_private, 
>>>> args->dst_handle);
>>>> @@ -869,16 +914,22 @@ static int 
>>>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>>>                        args->src_point, args->flags,
>>>>                        &fence);
>>>>       if (ret)
>>>> -        goto err;
>>>> +        goto err_put_timeline;
>>>> +
>>>> +    ret = drm_syncobj_flatten_chain(&fence);
>>>> +    if (ret)
>>>> +        goto err_free_fence;
>>>> +
>>>>       chain = dma_fence_chain_alloc();
>>>>       if (!chain) {
>>>>           ret = -ENOMEM;
>>>> -        goto err1;
>>>> +        goto err_free_fence;
>>>>       }
>>>> +
>>>>       drm_syncobj_add_point(timeline_syncobj, chain, fence, 
>>>> args->dst_point);
>>>> -err1:
>>>> +err_free_fence:
>>>>       dma_fence_put(fence);
>>>> -err:
>>>> +err_put_timeline:
>>>>       drm_syncobj_put(timeline_syncobj);
>>>>         return ret;
>>>
>>>
>>
>

