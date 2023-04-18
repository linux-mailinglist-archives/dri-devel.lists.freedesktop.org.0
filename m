Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15416E67AB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744A110E288;
	Tue, 18 Apr 2023 14:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CC710E0A1;
 Tue, 18 Apr 2023 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681829897; x=1713365897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3J9tBCDIw8nLgtofZxUrAF7FLP/917N+s8bvwsveBXE=;
 b=U3+9cniOkC5D2SfY2g8lPybDgGMI/w5Q95Pmr1lXnY3O0EPIlJJ4nHoN
 fADn6UcWzrS2pISr7E2bgxRDX3t58sd+6wlFqxkgMnvxg2ao9bBWxds24
 5Izg6Qy7+pVtdfojDViZNXWIZYCdhJ9qPNJmF0J3y960r8wKDWCOSqdEG
 1ywj+1KgefZd9K3aQ8KiPnjE/0QuOrxo9HcU5k+vLzNvg+ANcOH1SlAVw
 39le7TvQ4rwSSg27oCrXd70CcHydcRQO6v1/fCozQ6wBIwsNqA1ypVG9F
 bbinOZwpM9+16NOE0Yk0hN3QZvvCWcQpl1BHb2uMK3aO7GR6cv6ITHhdb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410418053"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="410418053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="721538897"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="721538897"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:58:14 -0700
Message-ID: <a83f4f2c-f745-cb50-e05a-86862ab0ea96@linux.intel.com>
Date: Tue, 18 Apr 2023 15:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 6/6] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/04/2023 15:39, Rob Clark wrote:
> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Show how more driver specific set of memory stats could be shown,
>> more specifically where object can reside in multiple regions, showing all
>> the supported stats, and where there is more to show than just user visible
>> objects.
>>
>> WIP...
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_driver.c     |   5 ++
>>   drivers/gpu/drm/i915/i915_drm_client.c | 102 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
>>   drivers/gpu/drm/i915/i915_drv.h        |   2 +
>>   4 files changed, 117 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 6493548c69bf..4c70206cbc27 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_driver = {
>>          .dumb_create = i915_gem_dumb_create,
>>          .dumb_map_offset = i915_gem_dumb_mmap_offset,
>>
>> +#ifdef CONFIG_PROC_FS
>> +       .query_fdinfo_memory_regions = i915_query_fdinfo_memory_regions,
>> +       .query_fdinfo_memory_stats = i915_query_fdinfo_memory_stats,
>> +#endif
>> +
>>          .ioctls = i915_ioctls,
>>          .num_ioctls = ARRAY_SIZE(i915_ioctls),
>>          .fops = &i915_driver_fops,
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>> index c654984189f7..65857c68bdb3 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -12,6 +12,7 @@
>>   #include <drm/drm_print.h>
>>
>>   #include "gem/i915_gem_context.h"
>> +#include "intel_memory_region.h"
>>   #include "i915_drm_client.h"
>>   #include "i915_file_private.h"
>>   #include "i915_gem.h"
>> @@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>          for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>>                  show_client_class(p, i915, file_priv->client, i);
>>   }
>> +
>> +char **
>> +i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned int *num)
>> +{
>> +       struct drm_i915_private *i915 = to_i915(dev);
>> +       struct intel_memory_region *mr;
>> +       enum intel_region_id id;
>> +
>> +       /* FIXME move to init */
>> +       for_each_memory_region(mr, i915, id) {
>> +               if (!i915->mm.region_names[id])
>> +                       i915->mm.region_names[id] = mr->name;
>> +       }
>> +
>> +       *num = id;
>> +
>> +       return i915->mm.region_names;
>> +}
>> +
>> +static void
>> +add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
>> +{
>> +        struct intel_memory_region *mr;
>> +       u64 sz = obj->base.size;
>> +        enum intel_region_id id;
>> +       unsigned int i;
>> +
>> +       if (!obj)
>> +               return;
>> +
>> +       /* Attribute size and shared to all possible memory regions. */
>> +       for (i = 0; i < obj->mm.n_placements; i++) {
>> +               mr = obj->mm.placements[i];
>> +               id = mr->id;
>> +
>> +               stats[id].size += sz;
> 
> This implies that summing up all of the categories is not the same as
> the toplevel stats that I was proposing

Correct, my categories are a bit different. You had private and shared as two mutually exclusive buckets, and then resident as subset of either/both. I have size as analogue to VmSize and resident as a subset of that, analogue to VmRss.

Shared is a bit wishy-washy, not sure about that one in either proposals. It can be either imported or exported buffers, but in essence I think it fits better as a subset of total size.

Regards,

Tvrtko

>> +               if (obj->base.handle_count > 1)
>> +                       stats[id].shared += sz;
>> +       }
>> +
>> +       /* Attribute other categories to only the current region. */
>> +       mr = obj->mm.region;
>> +       if (mr)
>> +               id = mr->id;
>> +       else
>> +               id = INTEL_REGION_SMEM;
>> +
>> +       if (!i915_gem_object_has_pages(obj))
>> +               return;
>> +
>> +       stats[id].resident += sz;
>> +
>> +       if (!dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(true)))
>> +               stats[id].active += sz;
>> +       else if (i915_gem_object_is_shrinkable(obj) &&
>> +               obj->mm.madv == I915_MADV_DONTNEED)
>> +               stats[id].purgeable += sz;
>> +}
>> +
>> +void
>> +i915_query_fdinfo_memory_stats(struct drm_file *file,
>> +                              struct drm_fdinfo_memory_stat *stats)
>> +{
>> +       struct drm_i915_file_private *file_priv = file->driver_priv;
>> +       struct i915_drm_client *client = file_priv->client;
>> +       struct drm_gem_object *drm_obj;
>> +       struct i915_gem_context *ctx;
>> +       int id;
>> +
>> +       /*
>> +        * FIXME - we can do this better and in fewer passes if we are to start
>> +        * exporting proper memory stats.
>> +        */
>> +
>> +       /* User created objects */
>> +       spin_lock(&file->table_lock);
>> +       idr_for_each_entry(&file->object_idr, drm_obj, id)
>> +               add_obj(to_intel_bo(drm_obj), stats);
>> +       spin_unlock(&file->table_lock);
>> +
>> +       /* Contexts, rings, timelines, page tables, ... */
>> +       rcu_read_lock();
>> +       list_for_each_entry_rcu(ctx, &client->ctx_list, client_link) {
>> +               struct i915_gem_engines_iter it;
>> +               struct intel_context *ce;
>> +
>> +               for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
>> +                       /* FIXME races?! */
>> +                       if (ce->state)
>> +                               add_obj(ce->state->obj, stats);
>> +                       if (ce->timeline && ce->timeline->hwsp_ggtt)
>> +                               add_obj(ce->timeline->hwsp_ggtt->obj, stats);
>> +                       if (ce->ring && ce->ring->vma)
>> +                               add_obj(ce->ring->vma->obj, stats);
>> +               }
>> +
>> +               /* TODO  vtx->vm page table backing objects */
>> +       }
>> +       rcu_read_unlock();
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
>> index 4c18b99e10a4..622936c51903 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>> @@ -14,7 +14,10 @@
>>
>>   #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>>
>> +struct drm_device;
>>   struct drm_file;
>> +struct drm_fdinfo_memory_stat;
>> +struct drm_gem_object;
>>   struct drm_printer;
>>
>>   struct i915_drm_client {
>> @@ -49,6 +52,11 @@ struct i915_drm_client *i915_drm_client_alloc(void);
>>
>>   #ifdef CONFIG_PROC_FS
>>   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>> +
>> +char **i915_query_fdinfo_memory_regions(struct drm_device *dev,
>> +                                       unsigned int *num);
>> +void i915_query_fdinfo_memory_stats(struct drm_file *file,
>> +                                   struct drm_fdinfo_memory_stat *stats);
>>   #endif
>>
>>   #endif /* !__I915_DRM_CLIENT_H__ */
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index eb739fb9cdbb..b84d2f0ed2cb 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -161,6 +161,8 @@ struct i915_gem_mm {
>>
>>          struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
>>
>> +       char *region_names[INTEL_REGION_UNKNOWN];
>> +
>>          struct notifier_block oom_notifier;
>>          struct notifier_block vmap_notifier;
>>          struct shrinker shrinker;
>> --
>> 2.37.2
>>
