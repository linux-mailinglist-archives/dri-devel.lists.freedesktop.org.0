Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AD82832F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA3710E3C6;
	Tue,  9 Jan 2024 09:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A54C10E3C6;
 Tue,  9 Jan 2024 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704792619; x=1736328619;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=k9+uIpdU1KNnwWWNPsn7wlXwUafN9nHj7vXwtok3fKQ=;
 b=R2A3CeGpa8b1lxnW9A5BhjuszAI3VEbdwT39qH27qJnBBTMYZJHNlysg
 QoOcvB7QgtxxSI+hW6VUPeTh7qHCOox/9cOYiLww3to3YwVLxN8QBFwGH
 QY4Cymxn1taT9kJH5Oh01l2cFo3XqDamjrmaYPugRb997+nvV0yex26Lt
 uJ2HqHpovLBrSi1Q74WLXdzCrUGR1eYOzoB+8ni2cX9A63Yz1H7NKI+7f
 ksybxpxx5MRFJSC7Hsfz95cL0fqTHQY27pbgpZWVPw69/IizMT7Kbbvyh
 JMAcSls/bASgj4asVWFHiWvBJlXw0GJ5HN/sJ0Eay1M1sLYnmzDkGBSGZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395301214"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="395301214"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1028711891"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="1028711891"
Received: from larnott-mobl1.ger.corp.intel.com (HELO [10.213.222.67])
 ([10.213.222.67])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:30:17 -0800
Message-ID: <d2f7c614-228d-490c-9317-8eab0d87ee28@linux.intel.com>
Date: Tue, 9 Jan 2024 09:30:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
 <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/01/2024 07:56, Christian König wrote:
> Am 07.12.23 um 19:02 schrieb Alex Deucher:
>> Add shared stats.  Useful for seeing shared memory.
>>
>> v2: take dma-buf into account as well
>>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>>   3 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>> index 5706b282a0c7..c7df7fa3459f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, 
>> struct drm_file *file)
>>              stats.requested_visible_vram/1024UL);
>>       drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>>              stats.requested_gtt/1024UL);
>> +    drm_printf(p, "drm-shared-vram:\t%llu KiB\n", 
>> stats.vram_shared/1024UL);
>> +    drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", 
>> stats.gtt_shared/1024UL);
>> +    drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", 
>> stats.cpu_shared/1024UL);
>> +
>>       for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>>           if (!usage[hw_ip])
>>               continue;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index d79b4ca1ecfc..1b37d95475b8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>>                 struct amdgpu_mem_stats *stats)
>>   {
>>       uint64_t size = amdgpu_bo_size(bo);
>> +    struct drm_gem_object *obj;
>>       unsigned int domain;
>> +    bool shared;
>>       /* Abort if the BO doesn't currently have a backing store */
>>       if (!bo->tbo.resource)
>>           return;
>> +    obj = &bo->tbo.base;
>> +    shared = (obj->handle_count > 1) || obj->dma_buf;
> 
> I still think that looking at handle_count is the completely wrong 
> approach, we should really only look at obj->dma_buf.

Yeah it is all a bit tricky with the handle table walk. I don't think it 
is even possible to claim it is shared with obj->dma_buf could be the 
same process creating say via udmabuf and importing into drm. It is a 
wild scenario yes, but it could be private memory in that case. Not sure 
where it would leave us if we said this is just a limitation of a BO 
based tracking.

Would adding a new category "imported" help?

Hmm or we simply change drm-usage-stats.rst:

"""
- drm-shared-<region>: <uint> [KiB|MiB]

The total size of buffers that are shared with another file (ie. have 
more than than a single handle).
"""

Changing ie into eg coule be get our of jail free card to allow the 
"(obj->handle_count > 1) || obj->dma_buf;" condition?

Because of the shared with another _file_ wording would cover my wild 
udmabuf self-import case. Unless there are more such creative private 
import options.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>> +
>>       domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>>       switch (domain) {
>>       case AMDGPU_GEM_DOMAIN_VRAM:
>>           stats->vram += size;
>>           if (amdgpu_bo_in_cpu_visible_vram(bo))
>>               stats->visible_vram += size;
>> +        if (shared)
>> +            stats->vram_shared += size;
>>           break;
>>       case AMDGPU_GEM_DOMAIN_GTT:
>>           stats->gtt += size;
>> +        if (shared)
>> +            stats->gtt_shared += size;
>>           break;
>>       case AMDGPU_GEM_DOMAIN_CPU:
>>       default:
>>           stats->cpu += size;
>> +        if (shared)
>> +            stats->cpu_shared += size;
>>           break;
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index d28e21baef16..0503af75dc26 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>>   struct amdgpu_mem_stats {
>>       /* current VRAM usage, includes visible VRAM */
>>       uint64_t vram;
>> +    /* current shared VRAM usage, includes visible VRAM */
>> +    uint64_t vram_shared;
>>       /* current visible VRAM usage */
>>       uint64_t visible_vram;
>>       /* current GTT usage */
>>       uint64_t gtt;
>> +    /* current shared GTT usage */
>> +    uint64_t gtt_shared;
>>       /* current system memory usage */
>>       uint64_t cpu;
>> +    /* current shared system memory usage */
>> +    uint64_t cpu_shared;
>>       /* sum of evicted buffers, includes visible VRAM */
>>       uint64_t evicted_vram;
>>       /* sum of evicted buffers due to CPU access */
> 
