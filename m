Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D07AB010
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 12:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C11210E64F;
	Fri, 22 Sep 2023 10:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3838210E64D;
 Fri, 22 Sep 2023 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695380269; x=1726916269;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uu7zwVoaYmq7wMUAefZNGAjUs/mXIzVLO76QcfWChSM=;
 b=MwbhCRq7H7cjy/8SVoHsQFqUifSpZ98F/A4q0npuqkKPaxxA9VOYyqGB
 vIeJlr087z/FTvCsxk6lsk6U+9X/IGU1Cak2dhYSNjHubvbfj6dHNPXy9
 5+87Pod25m5+ND4zwTTNJI8bbRK+wKalbRqhdJiPzW1BTJszNWcjtAfMw
 yvFxOqm3oSOQJM7wNZ27CjJitxloTbhTA0ZiKW85/IAKVXI5OSufXzLMj
 UbtpFycGrIaxE+AmzWHoCeXJ25jUj/ewHDO7ykSJEeQn+LYPMAGShQUGv
 /RFw+TY6TcLjvMzbZBjeEKsO9kZINS7974hbwtjng3X1+w+xz+2jf0Y6g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384634622"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="384634622"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 03:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="871208694"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="871208694"
Received: from placki-mobl.ger.corp.intel.com (HELO [10.213.200.149])
 ([10.213.200.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 03:57:46 -0700
Message-ID: <31738ef5-c207-bd20-8405-64bdc97bcfbe@linux.intel.com>
Date: Fri, 22 Sep 2023 11:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
 <20230921114852.192862-6-tvrtko.ursulin@linux.intel.com>
 <652f7064-2523-f810-3075-d66196fc42e2@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <652f7064-2523-f810-3075-d66196fc42e2@intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2023 09:48, Iddamsetty, Aravind wrote:
> 
> 
> On 21-09-2023 17:18, Tvrtko Ursulin wrote:
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
> 
> I guess you forgot to correct this.

Ah yes, will fix.

> 
>> counted only for the currently active region.
>>
>> v2:
>>   * Only account against the active region.
>>   * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
>> ---
>>   drivers/gpu/drm/i915/i915_drm_client.c | 64 ++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>> index a61356012df8..94abc2fb2ea6 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -45,6 +45,68 @@ void __i915_drm_client_free(struct kref *kref)
>>   }
>>   
>>   #ifdef CONFIG_PROC_FS
>> +static void
>> +obj_meminfo(struct drm_i915_gem_object *obj,
>> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
>> +{
>> +	const enum intel_region_id id = obj->mm.region ?
>> +					obj->mm.region->id : INTEL_REGION_SMEM;
>> +	const u64 sz = obj->base.size;
>> +
>> +	if (obj->base.handle_count > 1)
>> +		stats[id].shared += sz;
>> +	else
>> +		stats[id].private += sz;
>> +
>> +	if (i915_gem_object_has_pages(obj)) {
>> +		stats[id].resident += sz;
>> +
>> +		if (!dma_resv_test_signaled(obj->base.resv,
>> +					    DMA_RESV_USAGE_BOOKKEEP))
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
>> @@ -106,6 +168,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>   	 * ******************************************************************
>>   	 */
>>   
>> +	show_meminfo(p, file);
>> +
>>   	if (GRAPHICS_VER(i915) < 8)
>>   		return;
>>   
> 
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thank you! Would you be able to also look at the IGTs I posted yesterday?

Regards,

Tvrtko
