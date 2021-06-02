Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23973398912
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840D86E3EE;
	Wed,  2 Jun 2021 12:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8B06E3EE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:11:50 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id k7so3443880ejv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=tTp1g7mzJCZvO8mc+gL6JvJp+VhaBMjn3b40DrShSN4=;
 b=pmLOz4GiBWNNTgKO4LvLtL26cJeJl6nzzBv+sJSgU+CJtiwjxMw8glam2omqCzsEzl
 81bO+fdplznM+vZpmCDjeKBU/lMsinUdxLS4ABRYeZtjSc7D7vg5NIcT0j6z0U4q0/Gm
 Jwvq9qv4A14HaKj3WDH3RXQrTI0JKoVx0D0PIVQ5tliQZYVl0/+3tD2ra9bqcrzYx47l
 cIW7KFVWGsyy29qmA1bHtil4dJU2db/P1nAtuBHY/CXwWa9YyJXKA13S3jlnrDAXNBCa
 eHs4E566pv46Kh0YrdmXbTBrXlmzC7Q3FwUYP7Wx6ibGpLqpS3M8f7JRm3t9xGloOggy
 QLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tTp1g7mzJCZvO8mc+gL6JvJp+VhaBMjn3b40DrShSN4=;
 b=LDPbWwPmjoNZyqpOqnHnUbOB0BhVamwQ1YkWBz9YOAZb+uMBnTJNx3UfdDPjBq0Aqf
 gc+QArnV/pV3p6MLo+4uWonZl3qmpZ0wrk+pa2tNZ3Ib685ad3zmaps9qFJncmin8w9/
 vqtwNPhcleW0nFEBNb1ei4WE7KQ7RweGg5CJlRBK96bNOvjV0R3/lLcGM0qTxD6OAW7J
 xPok862mYPT9/vLZAtJJHoCTlmGtXgnvRqJkZ5NwDW60LJ4SqBylxr8RxgZZhPwfYDLl
 gtuWAEhcCzU3MrdxseDH9iDFzvhka0hKe4iztsglcWOoWAgXquqyONrBNHnzuKb8VQh8
 77iA==
X-Gm-Message-State: AOAM530wN5IJWd1r2LOwpspE9PseJ3c3EysW8VqQggy2MYpZD6pHVOCl
 0xybI9dA+t+38djrwSpZRh+AEDV1c3g=
X-Google-Smtp-Source: ABdhPJyuvww6IRmZYXYO1JNwZAZrLzd7imjdlm/hYzxUXLr5UWwcB9075ekpGE72jN3CFG0MmB5tEA==
X-Received: by 2002:a17:906:f0cd:: with SMTP id
 dk13mr33944541ejb.11.1622635909421; 
 Wed, 02 Jun 2021 05:11:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id g11sm1238161edt.85.2021.06.02.05.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:11:49 -0700 (PDT)
Subject: Re: [PATCH 02/10] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-2-christian.koenig@amd.com>
 <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2354a311-c88f-04c5-0211-360c8116b811@gmail.com>
Date: Wed, 2 Jun 2021 14:11:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
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

Am 02.06.21 um 13:44 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 12:09 PM, Christian König wrote:
>> Start with the range manager to make the resource object the base
>> class for the allocated nodes.
>>
>> While at it cleanup a lot of the code around that.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
>>   drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
>>   drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
>>   drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 56 ++++++++++++++++++-------
>>   drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
>>   include/drm/ttm/ttm_bo_driver.h         | 26 ------------
>>   include/drm/ttm/ttm_range_manager.h     | 43 +++++++++++++++++++
>>   include/drm/ttm/ttm_resource.h          |  3 ++
>>   10 files changed, 111 insertions(+), 50 deletions(-)
>>   create mode 100644 include/drm/ttm/ttm_range_manager.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 69db89261650..df1f185faae9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -45,6 +45,7 @@
>>   #include <drm/ttm/ttm_bo_api.h>
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>> +#include <drm/ttm/ttm_range_manager.h>
>>     #include <drm/amdgpu_drm.h>
>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 83e7258c7f90..17a4c5d47b6a 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -17,6 +17,8 @@
>>   #include <drm/drm_prime.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   +#include <drm/ttm/ttm_range_manager.h>
>> +
>>   static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>>     /**
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> index 65430912ff72..b08b8efeefba 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> @@ -26,6 +26,8 @@
>>   #include <linux/limits.h>
>>   #include <linux/swiotlb.h>
>>   +#include <drm/ttm/ttm_range_manager.h>
>> +
>>   #include "nouveau_drv.h"
>>   #include "nouveau_gem.h"
>>   #include "nouveau_mem.h"
>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c 
>> b/drivers/gpu/drm/qxl/qxl_ttm.c
>> index 8aa87b8edb9c..19fd39d9a00c 100644
>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>> @@ -32,6 +32,7 @@
>>   #include <drm/ttm/ttm_bo_api.h>
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>> +#include <drm/ttm/ttm_range_manager.h>
>>     #include "qxl_drv.h"
>>   #include "qxl_object.h"
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index cdffa9b65108..ad2a5a791bba 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -45,6 +45,7 @@
>>   #include <drm/ttm/ttm_bo_api.h>
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>> +#include <drm/ttm/ttm_range_manager.h>
>>     #include "radeon_reg.h"
>>   #include "radeon.h"
>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index b9d5da6e6a81..ce5d07ca384c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -29,12 +29,13 @@
>>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>>    */
>>   -#include <drm/ttm/ttm_bo_driver.h>
>> +#include <drm/ttm/ttm_device.h>
>>   #include <drm/ttm/ttm_placement.h>
>> +#include <drm/ttm/ttm_range_manager.h>
>> +#include <drm/ttm/ttm_bo_api.h>
>>   #include <drm/drm_mm.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>> -#include <linux/module.h>
>>     /*
>>    * Currently we use a spinlock for the lock, but a mutex *may* be
>> @@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct 
>> ttm_resource_manager *man,
>>                      struct ttm_resource *mem)
>>   {
>>       struct ttm_range_manager *rman = to_range_manager(man);
>> +    struct ttm_range_mgr_node *node;
>>       struct drm_mm *mm = &rman->mm;
>> -    struct drm_mm_node *node;
>>       enum drm_mm_insert_mode mode;
>>       unsigned long lpfn;
>>       int ret;
>> @@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct 
>> ttm_resource_manager *man,
>>       if (!lpfn)
>>           lpfn = man->size;
>>   -    node = kzalloc(sizeof(*node), GFP_KERNEL);
>> +    node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>
> I'm still a bit confused  about the situation where a driver wants to 
> attach private data to a struct ttm_resource without having to 
> re-implement its own range manager?
>
> Could be cached sg-tables, list of GPU bindings etc. Wouldn't work 
> with the above unless we have a void *driver_private member on the 
> struct ttm_resource. Is that the plan going forward here? Or that the 
> driver actually does the re-implementation?

I don't really understand your concern here. The basic idea is that 
drivers use ttm_resource as a base class for their own implementation.

See for example how nouveau does that:

struct nouveau_mem {
         struct ttm_resource base;
         struct nouveau_cli *cli;
         u8 kind;
         u8 comp;
         struct nvif_mem mem;
         struct nvif_vma vma[2];
};

The range manager is helping driver specific resource managers which 
want to implement something drm_mm_nodes based. E.g. amdgpu_gtt_mgr and 
amdgpu_vram_mgr, but it can also be used stand alone.

The ttm_range_mgr_node can then be used as base class for this 
functionality. I already want to move some more code from 
amdgpu_vram_mgr.c into the range manager, but that is just minor cleanup 
work.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>

