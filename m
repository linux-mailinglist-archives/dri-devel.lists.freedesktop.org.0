Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4D73A6F8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 19:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE710E07C;
	Thu, 22 Jun 2023 17:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ADA10E01F;
 Thu, 22 Jun 2023 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687453731; x=1718989731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Cf+dpIYfAbSBeiWlETELLtCHHrcSgMWgIRdJXuiqLaE=;
 b=nicibwG0x6SZ68yxH1a7avLcbIeR/E51LExxCtTg5xQdUlbc5sL4zESY
 HNUmxOhz0qgn6EIpkeo+VFpZr2LkNO80+6uyIE5pfvUhwY9nhT5UpeX4n
 HWGSCQBLhMX+CTDFeI1VGHQTpgnGoIZGlXUrOYHwUBlMFBDr8imb4PYnj
 h8g7cX3DIY0sP52xoIOTkupkaGbfG/HTFpIDXozhTRHHBeVMI5GDTtc/p
 implGM17DHq+FHz6v1kUnMYd+A08Mi5Mq5Q0Ph3iilKw2CE/o8lKapCrr
 WjDbxmoYih6lkVT/oqGpNTOUMHj5rQHF/K3phBOqg9TPyzT7wnUu7rwTe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363104862"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="363104862"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 10:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045277900"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="1045277900"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO [10.249.254.173])
 ([10.249.254.173])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 10:03:59 -0700
Message-ID: <ef5d91b8-c68b-5edc-d611-6a4dbf55c945@linux.intel.com>
Date: Thu, 22 Jun 2023 19:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/ttm: Don't leak a resource on
 eviction error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
 <ZJRSyp7fT6VXpow7@ashyti-mobl2.lan>
 <3a089ebb-7389-3d3e-beb0-13a8d64eb04d@linux.intel.com>
 <196a7f74-66ac-1eae-4795-a42691f4793e@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <196a7f74-66ac-1eae-4795-a42691f4793e@amd.com>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/23 16:48, Christian König wrote:
>
>
> Am 22.06.23 um 16:08 schrieb Thomas Hellström:
>>
>> On 6/22/23 15:55, Andi Shyti wrote:
>>> Hi Thomas,
>>>
>>> On Thu, Jun 22, 2023 at 12:14:11PM +0200, Thomas Hellström wrote:
>>>> On eviction errors other than -EMULTIHOP we were leaking a resource.
>>>> Fix.
>>>>
>>>> Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")
>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Huang Rui <ray.huang@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: <stable@vger.kernel.org> # v5.15+
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
>>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 615d30c4262d..89530f2a027f 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -462,14 +462,14 @@ static int ttm_bo_evict(struct 
>>>> ttm_buffer_object *bo,
>>>>       ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>>>>       if (ret == -EMULTIHOP) {
>>>>           ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
>>>> -        if (ret) {
>>>> -            if (ret != -ERESTARTSYS && ret != -EINTR)
>>>> -                pr_err("Buffer eviction failed\n");
>>>> -            ttm_resource_free(bo, &evict_mem);
>>>> -            goto out;
>>>> -        }
>>>> -        /* try and move to final place now. */
>>>> -        goto bounce;
>>>> +        if (!ret)
>>>> +            /* try and move to final place now. */
>>>> +            goto bounce;
>>> As we are at this, can't we replace this with a while()? Goto's
>>> used instead of a while loop are a fist in the eye...
>>
>> I'm completely OK with that. this patch already did away with one of 
>> them. Let's hear Christian's opinion first, though.
>
> I'm not a fan of that goto either, but could we somehow avoid the 
> while(1) ? E.g. something like do { } while (!ret) after handling the 
> multihop?

I think the construct that makes it most obvious what's happening, 
although it needs two tests for -EMULTIHOP is something like

do {
....
    if (ret != -EMULTIHOP)
       break;
    ....
} while (ret ==-EMULTIHOP);

Will be out tomorrow, though, so I don't have time to respin before Monday.

/Thomas


>
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>
>>
>>
>>>
>>> It looks even better:
>>>
>>>     while (1) {
>>>         ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>>>         if (!ret)
>>>             break;
>>>
>>>         if (ret == -EMULTIHOP)
>>>             ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem,
>>>                             ctx, &hop);
>>>
>>>         /* try again */
>>>         if (!ret)
>>>             continue;
>>>
>>>         ttm_resource_free(bo, &evict_mem);
>>>         if (ret != -ERESTARTSYS && ret != -EINTR)
>>>             pr_err("Buffer eviction failed\n");
>>>
>>>         break;
>>>     }
>>>
>>> Andi
>>>
>>>> +    }
>>>> +    if (ret) {
>>>> +        ttm_resource_free(bo, &evict_mem);
>>>> +        if (ret != -ERESTARTSYS && ret != -EINTR)
>>>> +            pr_err("Buffer eviction failed\n");
>>>>       }
>>>>   out:
>>>>       return ret;
>>>> -- 
>>>> 2.40.1
>
