Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E92D76E399
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6328D10E5DA;
	Thu,  3 Aug 2023 08:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0E010E5D9;
 Thu,  3 Aug 2023 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691052604; x=1722588604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=syY0BtLD97OIprqfM/dn9Th4zV4J0yr71K+w/x8xDQs=;
 b=EfKdgrq6N2qayPcfrifHssvqjclNp7QSZbEnWDtt7WfnAboVrB4A3O9M
 DSfIGp6EqjSHw7/Nb15hxv6fhG1uguK8iyUwpV3xrx7qCbERmY+tFYmVS
 m15FURU76tTfqMhpNUFEMQdddXvCmsw4z4+hh0+vkrrTRvQdZoRhgdawj
 SdCquUSz76GWmXrrNbuM6+2UfJ6OYmqV3EsmkAc1fsdJwPEjuBpGiuNGC
 4M1FVWebbw7cjJSyeNVyOZ0lDQLdUQo2o2OhUWLJ7NI2L2nbdILUXeIzw
 zPjJnyTLpgsp3KmRtK0jj7JFrwFIFX/O+KIVjA6ORvFklThMO1fY3nweD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436124211"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="436124211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764512671"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="764512671"
Received: from rrybakov-mobl1.ger.corp.intel.com (HELO [10.213.197.207])
 ([10.213.197.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:49:58 -0700
Message-ID: <b5904977-9693-34bc-55bf-28387b69e06a@linux.intel.com>
Date: Thu, 3 Aug 2023 09:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230727101352.1899466-1-tvrtko.ursulin@linux.intel.com>
 <20230727101352.1899466-6-tvrtko.ursulin@linux.intel.com>
 <fffae148-a609-4f1d-eae4-dbe253f43650@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fffae148-a609-4f1d-eae4-dbe253f43650@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/08/2023 06:15, Iddamsetty, Aravind wrote:
> On 27-07-2023 15:43, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Use the newly added drm_print_memory_stats helper to show memory
>> utilisation of our objects in drm/driver specific fdinfo output.
>>
>> To collect the stats we walk the per memory regions object lists
>> and accumulate object size into the respective drm_memory_stats
>> categories.
>>
>> Objects with multiple possible placements are reported in multiple
>> regions for total and shared sizes, while other categories are
>> counted only for the currently active region.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Rob Clark <robdclark@gmail.com>> ---
>>   drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>> index a61356012df8..9e7a6075ee25 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)
>>   }
>>   
>>   #ifdef CONFIG_PROC_FS
>> +static void
>> +obj_meminfo(struct drm_i915_gem_object *obj,
>> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
>> +{
>> +	struct intel_memory_region *mr;
>> +	u64 sz = obj->base.size;
>> +	enum intel_region_id id;
>> +	unsigned int i;
>> +
>> +	/* Attribute size and shared to all possible memory regions. */
>> +	for (i = 0; i < obj->mm.n_placements; i++) {
>> +		mr = obj->mm.placements[i];
>> +		id = mr->id;
>> +
>> +		if (obj->base.handle_count > 1)
>> +			stats[id].shared += sz;
>> +		else
>> +			stats[id].private += sz;
>> +	}
>> +
>> +	/* Attribute other categories to only the current region. */
>> +	mr = obj->mm.region;
>> +	if (mr)
>> +		id = mr->id;
>> +	else
>> +		id = INTEL_REGION_SMEM;
>> +
>> +	if (!obj->mm.n_placements) {
> 
> I guess we do not expect to have n_placements set to public objects, is
> that right?

I think they are the only ones which can have placements. It is via 
I915_GEM_CREATE_EXT_MEMORY_REGIONS userspace is able to create them.

My main conundrum in this patch is a few lines above, the loop which 
adds shared and private.

Question is, if an object can be either smem or lmem, how do we want to 
report it? This patch adds the size for all possible regions and 
resident and active only to the currently active. But perhaps that is 
wrong. Maybe I should change it is only against the active region and 
multiple regions are just ignored. Then if object is migrated do access 
patterns or memory pressure, the total size would migrate too.

I think I was trying to achieve something here (have more visibility on 
what kind of backing store clients are allocating) which maybe does not 
work to well with the current categories.

Namely if userspace allocates say one 1MiB object with placement in 
either smem or lmem, and it is currently resident in lmem, I wanted it 
to show as:

  total-smem: 1 MiB
  resident-smem: 0
  total-lmem: 1 MiB
  resident-lmem: 1 MiB

To constantly show how in theory client could be using memory from 
either region. Maybe that is misleading and should instead be:

  total-smem: 0
  resident-smem: 0
  total-lmem: 1 MiB
  resident-lmem: 1 MiB

?

And then if/when the same object gets migrated to smem it changes to 
(lets assume it is also not resident any more but got swapped out):

  total-smem: 1 MiB
  resident-smem: 0
  total-lmem: 0
  resident-lmem: 0

Regards,

Tvrtko

>> +		if (obj->base.handle_count > 1)
>> +			stats[id].shared += sz;
>> +		else
>> +			stats[id].private += sz;
>> +	}
>> +
>> +	if (i915_gem_object_has_pages(obj)) {
>> +		stats[id].resident += sz;
>> +
>> +		if (!dma_resv_test_signaled(obj->base.resv,
>> +					    dma_resv_usage_rw(true)))
>> +			stats[id].active += sz;
>> +		else if (i915_gem_object_is_shrinkable(obj) &&
>> +			 obj->mm.madv == I915_MADV_DONTNEED)
>> +			stats[id].purgeable += sz;
>> +	}
>> +}
>> +
>> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>> +{
>> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
>> +	struct drm_i915_file_private *fpriv = file->driver_priv;
>> +	struct i915_drm_client *client = fpriv->client;
>> +	struct drm_i915_private *i915 = fpriv->i915;
>> +	struct drm_i915_gem_object *obj;
>> +	struct intel_memory_region *mr;
>> +	struct list_head *pos;
>> +	unsigned int id;
>> +
>> +	/* Public objects. */
>> +	spin_lock(&file->table_lock);
>> +	idr_for_each_entry(&file->object_idr, obj, id)
>> +		obj_meminfo(obj, stats);
>> +	spin_unlock(&file->table_lock);
>> +
>> +	/* Internal objects. */
>> +	rcu_read_lock();
>> +	list_for_each_rcu(pos, &client->objects_list) {
>> +		obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
>> +							 client_link));
>> +		if (!obj)
>> +			continue;
>> +		obj_meminfo(obj, stats);
>> +		i915_gem_object_put(obj);
>> +	}
>> +	rcu_read_unlock();
>> +
>> +	for_each_memory_region(mr, i915, id)
>> +		drm_print_memory_stats(p,
>> +				       &stats[id],
>> +				       DRM_GEM_OBJECT_RESIDENT |
>> +				       DRM_GEM_OBJECT_PURGEABLE,
>> +				       mr->name);
>> +}
>> +
>>   static const char * const uabi_class_names[] = {
>>   	[I915_ENGINE_CLASS_RENDER] = "render",
>>   	[I915_ENGINE_CLASS_COPY] = "copy",
>> @@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>   	 * ******************************************************************
>>   	 */
>>   
>> +	show_meminfo(p, file);
>> +
>>   	if (GRAPHICS_VER(i915) < 8)
>>   		return;
>>
> 
> 
> 
