Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C67A86A6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129E710E4C9;
	Wed, 20 Sep 2023 14:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551A10E4C9;
 Wed, 20 Sep 2023 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695220499; x=1726756499;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sLpQI5jlczxYtnfDdaRiHyH0T7NOrjgN4vsg+1iJ6EY=;
 b=Itk2kcMQNagNRzwxpfDMKto5w4aqhWLFrjUVw+MXSFAj/3i5WGPINo9E
 Q5w2Wnonl3NMR+uoNpB+s6PoMdnm43TD3wAOOWXvkHMn/nbDt5ZqqBfbP
 5vJTiVLPvoaciOJW+R+rpRYLv9ln55Nhd1kzX868EHV0UlOGHB2pymaWD
 755Y8+RiPhyAUquNqs0ysXMssqbtZfPtmlp3tVt5oAM0ihLcxd5iTmYHp
 PYo0T5MpFnQyF29TRIcB3qmo7nxpA+2XbNh7Znv0LnMo42HfQZqGnt76d
 mo7H4qPCrwlpEhCI8u/oufiixM3cj8rpWHFiFAX7FVN1DN+VV+rePpqxk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380149222"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="380149222"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776026772"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="776026772"
Received: from conorbyr-mobl1.ger.corp.intel.com (HELO [10.213.199.161])
 ([10.213.199.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:22:51 -0700
Message-ID: <83cc1270-1924-cd39-8eab-c89b5b5a8ee7@linux.intel.com>
Date: Wed, 20 Sep 2023 15:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915: Implement fdinfo memory stats
 printing
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-6-tvrtko.ursulin@linux.intel.com>
 <SJ1PR11MB620442619CCB434B2A5A87EF811DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <SJ1PR11MB620442619CCB434B2A5A87EF811DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/08/2023 12:35, Upadhyay, Tejas wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Tvrtko
>> Ursulin
>> Sent: Friday, July 7, 2023 6:32 PM
>> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [Intel-gfx] [PATCH 5/5] drm/i915: Implement fdinfo memory stats
>> printing
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Use the newly added drm_print_memory_stats helper to show memory
>> utilisation of our objects in drm/driver specific fdinfo output.
>>
>> To collect the stats we walk the per memory regions object lists and
>> accumulate object size into the respective drm_memory_stats categories.
>>
>> Objects with multiple possible placements are reported in multiple regions for
>> total and shared sizes, while other categories are counted only for the
>> currently active region.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>> b/drivers/gpu/drm/i915/i915_drm_client.c
>> index ffccb6239789..5c77d6987d90 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)  }
>>
>>   #ifdef CONFIG_PROC_FS
>> +static void
>> +obj_meminfo(struct drm_i915_gem_object *obj,
>> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN]) {
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
> 
> Should not DMA_RESV_USAGE_BOOKKEEP also considered active (why only "rw")? Some app is syncing with syncjobs and has added dma_fence with DMA_RESV_USAGE_BOOKKEEP during execbuf while that BO is busy on waiting on work!

Hmm do we have a path which adds DMA_RESV_USAGE_BOOKKEEP usage in execbuf?

Rob, any comments here? Given how I basically lifted the logic from 
686b21b5f6ca ("drm: Add fdinfo memory stats"), does it sound plausible 
to upgrade the test against all fences?

Regards,

Tvrtko

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
>> +	idr_for_each_entry (&file->object_idr, obj, id)
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
>> @@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p,
>> struct drm_file *file)
>>   	 *
>> ****************************************************************
>> **
>>   	 */
>>
>> +	show_meminfo(p, file);
>> +
>>   	if (GRAPHICS_VER(i915) < 8)
>>   		return;
>>
>> --
>> 2.39.2
> 
