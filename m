Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D339F318
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B647D6EB9D;
	Tue,  8 Jun 2021 09:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F506EB9A;
 Tue,  8 Jun 2021 09:57:24 +0000 (UTC)
IronPort-SDR: dpJ8iqeMshQfBrFeQorWkY34Ah3TuyiaIOMfh17lgWC0nEFB5dBpL6O3ewpNsxGbWfLd2AKrqt
 IjNsS6DMGstA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184497863"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="184497863"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:57:23 -0700
IronPort-SDR: /hdK1PNlNI5g+cP3Eyv8o4vvczEYtQFVh+GWXZtkXDbYrmHjC/ZNijYJqVbEkiDQVqWH3M6B48
 gi7y7js4ZCMw==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="485157306"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO [10.215.170.251])
 ([10.215.170.251])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:57:20 -0700
Subject: Re: [PATCH] drm/i915/gem/mman: only allow WC for lmem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210602093636.167070-1-matthew.auld@intel.com>
 <3af30ebb-a46b-2b21-57b0-988b2400ac08@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <f009f03e-ec03-e180-ac25-fff2e0ceb856@intel.com>
Date: Tue, 8 Jun 2021 10:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3af30ebb-a46b-2b21-57b0-988b2400ac08@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2021 13:00, Thomas Hellström wrote:
> Hi,
> 
> On 6/2/21 11:36 AM, Matthew Auld wrote:
>> For dgfx where we now have lmem and ttm, we can only support single mmap
>> mode for the lifetime of the object, and for lmem objects this should be
>> WC, so reject all other mapping modes for mmap_offset, including if the
>> object can be placed in both smem and lmem.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 ++++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index fd1c9714f8d8..32f88f236771 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -689,6 +689,10 @@ __assign_mmap_offset(struct drm_file *file,
>>           goto out;
>>       }
>> +    if (mmap_type != I915_MMAP_TYPE_WC &&
>> +        i915_gem_object_placements_contain_type(obj, 
>> INTEL_MEMORY_LOCAL))
>> +        return -ENODEV;
>> +
> 
> I think we will also have the restriction that any other objects on DGFX 
> can only be mapped cached? At least that's what the TTM code is 
> implementing currently.

Yeah, with this patch the caching mode should now at least be consistent 
for lmem objects, for smem we still need more patches.

> 
> 
>>       mmo = mmap_offset_attach(obj, mmap_type, file);
>>       if (IS_ERR(mmo)) {
>>           err = PTR_ERR(mmo);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 2be6109d0093..d4b0da8ed969 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -403,6 +403,28 @@ int i915_gem_object_read_from_page(struct 
>> drm_i915_gem_object *obj, u64 offset,
>>       return 0;
>>   }
>> +/**
>> + * i915_gem_object_placements_contain_type - Check whether the object 
>> can be
>> + * placed at certain memory type
>> + * @obj: Pointer to the object
>> + * @type: The memory type to check
>> + *
>> + * Return: True if the object can be placed in @type. False otherwise.
>> + */
>> +bool i915_gem_object_placements_contain_type(struct 
>> drm_i915_gem_object *obj,
>> +                         enum intel_memory_type type)
>> +{
>> +    unsigned int i;
>> +
>> +    /* TODO: consider maybe storing as a mask when doing 
>> gem_create_ext */
>> +    for (i = 0; i < obj->mm.n_placements; i++) {
>> +        if (obj->mm.placements[i]->type == type)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
> 
> Do we need something for the in-kernel mappings as well? Or just return 
> a mapping with the only allowed caching mode?

For lmem everything should already be WC for in-kernel mappings. For 
everything else which uses pin_map() we will need to default to cached. 
I guess just add a different helper for this? We should probably also 
adjust the obj->cache_level for dg1.

> 
> /Thomas
> 
> 
