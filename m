Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5D3992B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAB86ED0B;
	Wed,  2 Jun 2021 18:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930006ED0B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:41:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id dj8so4119053edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=6dNaqo16YNbAsXGnhMdUP5xsJobb1hb3C8Iq9An3aP8=;
 b=SxvCN8EyEcqVWzq5c1vDlHurFQ0FZZzqoKgNYx/Vvkeg6ahJIIMUL3Dean9OMPm0Ik
 IJW/Pk5NGOW3k8xOiHacDFzfgF9nVYJ35Yn4stsD2852SV1cLCkq0qGNaK+OocH7IWA7
 uezXmMZJggqeebEJ3trBzoFBc3MDXPDASpMr2Xg6sZQrkkIuSLqrNk98vsn9rrP6oOij
 eHMX7haJG+95PDwanTNjhaRH/JRIL50a6l1fStLzKj+rWz4oawHtJkm1We1YU4n+u6XO
 9epfUt/zfYQna5KwTo+THLvofUeu475eK8cjWtvYSkgv1gszIkzdHYuEHx2d994pKUIp
 2KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6dNaqo16YNbAsXGnhMdUP5xsJobb1hb3C8Iq9An3aP8=;
 b=JlzUnHDGXMV5r7ChzXbDqGwpejGiyorijslrWk3NwRL0zqMxjF1oiE7BFqtv8k7pTd
 yjjrpZe7gHSR3PPaQ9sqKYtbygnelxuYX8NyM9uAilEWEdS2UEqdFfY35ZELWGbZ+Z/l
 oXmpHprn9JRwqNfHHy1LEIcEripS0e7deQzqWiBDsRnXBul+MrrGsfbXIaR1FGFmJPr9
 /ISpYcCyLuZyNWe0ARvHjDXWloJlPvySnqtoLh9AghFB6J5JItTSw6+cAo+nBqIvhc6j
 eEmfGOmVC/ghqJMYRGj4GmtAlz7iG32riizKwAWR06sKwXl2oBg4jE1cu2klYxfMPFTI
 xRww==
X-Gm-Message-State: AOAM530kgKGRfftqALbda86X0ipNlB0X5RFYTZJDqgioIlojN812R+1s
 Fgytc6DZnJXiq47qTeHGcvvr2PZMuMI=
X-Google-Smtp-Source: ABdhPJzecZ/OKsN5zieUt+bR0lg1LDtUiP6sWWVIs71aH53y5p1fFZMGIjqFCMyGXQBT+edWiIsGQg==
X-Received: by 2002:a05:6402:4390:: with SMTP id
 o16mr40222718edc.79.1622659284175; 
 Wed, 02 Jun 2021 11:41:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id bq1sm378008ejb.66.2021.06.02.11.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:41:23 -0700 (PDT)
Subject: Re: [PATCH 02/10] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-2-christian.koenig@amd.com>
 <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
 <2354a311-c88f-04c5-0211-360c8116b811@gmail.com>
 <23afc41d-09ae-93f3-77b8-e18c8f72dd5a@shipmail.org>
 <b818e5f8-66a4-4df0-ba5b-cc22125d72a2@gmail.com>
 <2719e7af-dbba-2917-0e29-9e36fbc6de00@shipmail.org>
 <55f59f1e-f988-f58a-4e3f-7d419a846ae6@gmail.com>
 <d6f0b8e1-f4a2-cbbd-8b0c-6700ae4f7e58@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fd5e275a-0ed5-3242-07b4-125fcb4e1cfa@gmail.com>
Date: Wed, 2 Jun 2021 20:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d6f0b8e1-f4a2-cbbd-8b0c-6700ae4f7e58@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.21 um 17:28 schrieb Thomas Hellström (Intel):
> Hi!
>
> On 6/2/21 4:17 PM, Christian König wrote:
>> Am 02.06.21 um 16:13 schrieb Thomas Hellström (Intel):
>>>
>>> On 6/2/21 3:07 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 02.06.21 um 14:33 schrieb Thomas Hellström (Intel):
>>>>>
>>>>> On 6/2/21 2:11 PM, Christian König wrote:
>>>>>> Am 02.06.21 um 13:44 schrieb Thomas Hellström (Intel):
>>>>>>>
>>>>>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>>>>>> Start with the range manager to make the resource object the base
>>>>>>>> class for the allocated nodes.
>>>>>>>>
>>>>>>>> While at it cleanup a lot of the code around that.
>>>>>>>>
>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
>>>>>>>>   drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
>>>>>>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
>>>>>>>>   drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
>>>>>>>>   drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
>>>>>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 56 
>>>>>>>> ++++++++++++++++++-------
>>>>>>>>   drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
>>>>>>>>   include/drm/ttm/ttm_bo_driver.h         | 26 ------------
>>>>>>>>   include/drm/ttm/ttm_range_manager.h     | 43 +++++++++++++++++++
>>>>>>>>   include/drm/ttm/ttm_resource.h          |  3 ++
>>>>>>>>   10 files changed, 111 insertions(+), 50 deletions(-)
>>>>>>>>   create mode 100644 include/drm/ttm/ttm_range_manager.h
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>> index 69db89261650..df1f185faae9 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>> @@ -45,6 +45,7 @@
>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>     #include <drm/amdgpu_drm.h>
>>>>>>>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>>>>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> index 83e7258c7f90..17a4c5d47b6a 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> @@ -17,6 +17,8 @@
>>>>>>>>   #include <drm/drm_prime.h>
>>>>>>>>   #include <drm/drm_simple_kms_helper.h>
>>>>>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>> +
>>>>>>>>   static const struct drm_gem_object_funcs 
>>>>>>>> drm_gem_vram_object_funcs;
>>>>>>>>     /**
>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>> index 65430912ff72..b08b8efeefba 100644
>>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>> @@ -26,6 +26,8 @@
>>>>>>>>   #include <linux/limits.h>
>>>>>>>>   #include <linux/swiotlb.h>
>>>>>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>> +
>>>>>>>>   #include "nouveau_drv.h"
>>>>>>>>   #include "nouveau_gem.h"
>>>>>>>>   #include "nouveau_mem.h"
>>>>>>>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c 
>>>>>>>> b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>> index 8aa87b8edb9c..19fd39d9a00c 100644
>>>>>>>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>> @@ -32,6 +32,7 @@
>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>     #include "qxl_drv.h"
>>>>>>>>   #include "qxl_object.h"
>>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>>>>>>>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>> index cdffa9b65108..ad2a5a791bba 100644
>>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>> @@ -45,6 +45,7 @@
>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>     #include "radeon_reg.h"
>>>>>>>>   #include "radeon.h"
>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>>>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>> index b9d5da6e6a81..ce5d07ca384c 100644
>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>> @@ -29,12 +29,13 @@
>>>>>>>>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>>>>>>>>    */
>>>>>>>>   -#include <drm/ttm/ttm_bo_driver.h>
>>>>>>>> +#include <drm/ttm/ttm_device.h>
>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>> +#include <drm/ttm/ttm_bo_api.h>
>>>>>>>>   #include <drm/drm_mm.h>
>>>>>>>>   #include <linux/slab.h>
>>>>>>>>   #include <linux/spinlock.h>
>>>>>>>> -#include <linux/module.h>
>>>>>>>>     /*
>>>>>>>>    * Currently we use a spinlock for the lock, but a mutex 
>>>>>>>> *may* be
>>>>>>>> @@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct 
>>>>>>>> ttm_resource_manager *man,
>>>>>>>>                      struct ttm_resource *mem)
>>>>>>>>   {
>>>>>>>>       struct ttm_range_manager *rman = to_range_manager(man);
>>>>>>>> +    struct ttm_range_mgr_node *node;
>>>>>>>>       struct drm_mm *mm = &rman->mm;
>>>>>>>> -    struct drm_mm_node *node;
>>>>>>>>       enum drm_mm_insert_mode mode;
>>>>>>>>       unsigned long lpfn;
>>>>>>>>       int ret;
>>>>>>>> @@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct 
>>>>>>>> ttm_resource_manager *man,
>>>>>>>>       if (!lpfn)
>>>>>>>>           lpfn = man->size;
>>>>>>>>   -    node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>>>>>> +    node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>>>>>>>
>>>>>>> I'm still a bit confused  about the situation where a driver 
>>>>>>> wants to attach private data to a struct ttm_resource without 
>>>>>>> having to re-implement its own range manager?
>>>>>>>
>>>>>>> Could be cached sg-tables, list of GPU bindings etc. Wouldn't 
>>>>>>> work with the above unless we have a void *driver_private member 
>>>>>>> on the struct ttm_resource. Is that the plan going forward here? 
>>>>>>> Or that the driver actually does the re-implementation?
>>>>>>
>>>>>> I don't really understand your concern here. The basic idea is 
>>>>>> that drivers use ttm_resource as a base class for their own 
>>>>>> implementation.
>>>>>>
>>>>>> See for example how nouveau does that:
>>>>>>
>>>>>> struct nouveau_mem {
>>>>>>         struct ttm_resource base;
>>>>>>         struct nouveau_cli *cli;
>>>>>>         u8 kind;
>>>>>>         u8 comp;
>>>>>>         struct nvif_mem mem;
>>>>>>         struct nvif_vma vma[2];
>>>>>> };
>>>>>>
>>>>>> The range manager is helping driver specific resource managers 
>>>>>> which want to implement something drm_mm_nodes based. E.g. 
>>>>>> amdgpu_gtt_mgr and amdgpu_vram_mgr, but it can also be used stand 
>>>>>> alone.
>>>>>>
>>>>>> The ttm_range_mgr_node can then be used as base class for this 
>>>>>> functionality. I already want to move some more code from 
>>>>>> amdgpu_vram_mgr.c into the range manager, but that is just minor 
>>>>>> cleanup work.
>>>>>>
>>>>> Sure but if you embed a ttm_range_mgr_node in your struct 
>>>>> i915_resource, and wanted to use the ttm range manager for it, it 
>>>>> would allocate a struct ttm_range_mgr_node rather than a struct 
>>>>> i915_resource? Or am I missing something?
>>>>
>>>> Yes, that's the general idea I'm targeting for. I'm just not fully 
>>>> there yet.
>>>
>>> Hmm, I don't fully understand the reply, I described a buggy 
>>> scenario and you replied that's what we're targeting for?
>>
>> Ok, I don't seem to understand what you mean here. What is buggy on 
>> that?
>
> The buggy thing I'm trying to describe is a scenario where I want to 
> have a struct i915_ttm_resource which embeds a struct 
> ttm_range_mgr_node, but there is no way I can tell the generic ttm 
> range manager to allocate a struct i915_ttm_resource instead of a 
> struct ttm_range_mgr_node.
>
> So what I want to be able to do: I have
>
> struct i915_ttm_resource {
>         struct i915_gpu_bindings gpu_bindings;
>         struct ttm_range_mgr_node range_node;
> };
>
> Now I want to be able to share common code as much as possible and use 
> the generic ttm_range_manager here. How would I go about doing that 
> with the proposed changes?

Ah, yes that is the part I haven't moved over yet. In other words that 
is not possible yet.

Christian.


>
> Thanks,
>
> Thomas
>
>
>
>
>
>
>
>
>
>
>>
>>> I assume you mean we're going to get an init() method for the range 
>>> manager, and a destroy method for the struct ttm_resource?
>>
>> Well the ttm_range_manager is just another component implementing 
>> some functionality by extending the ttm_resource object.
>>
>> We currently don't have a destroy function for ttm_resource object 
>> because that isn't necessary at the moment. But I'm probably going to 
>> add one at some point.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>

