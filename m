Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174640F9DB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714CD6ED14;
	Fri, 17 Sep 2021 14:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07D16ED11;
 Fri, 17 Sep 2021 14:00:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="219613883"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="219613883"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 07:00:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="554648383"
Received: from abogusze-mobl.ger.corp.intel.com (HELO [10.213.217.122])
 ([10.213.217.122])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 06:59:58 -0700
Subject: Re: [PATCH] drm/i915/debugfs: Do not report currently active engine
 when describing objects
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210915114153.951670-1-tvrtko.ursulin@linux.intel.com>
 <YUSNdZsDxWnxWL6F@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <37a7fb9e-5b27-be4a-3ce6-99b8082993b2@linux.intel.com>
Date: Fri, 17 Sep 2021 14:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUSNdZsDxWnxWL6F@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 17/09/2021 13:43, Daniel Vetter wrote:
> On Wed, Sep 15, 2021 at 12:41:53PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> It is not very useful to have code which tries to report a rapidly
>> transient state which will not report anything majority of the time,
>> especially since it is currently only used from
>> <debugfs>/i915_gem_framebuffers.
> 
> Maybe mention that this is motiveated by Christian's series to rework all
> the fence iteration stuff.

It actually isn't. It predates me noticing his series and is from the 
time I was looking at all the dma_fence_is_i915() call sites. One part 
of the rationale was fewer users the better.

> Also iirc the history here, this was for figuring out hangs. When the gpu
> is dead, the last-write stuff isn't very transient anymore (until reset).
> But we have error state capture now since forever, so this can go.

In this case say 8-9 seconds before it gets cleared so yes, still agreed 
it is not very useful.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks!

Regards,

Tvrtko

> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 -----------------
>>   drivers/gpu/drm/i915/i915_debugfs.c        |  5 -----
>>   2 files changed, 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 48112b9d76df..3043fcbd31bd 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>>   	i915_gem_object_unpin_pages(obj);
>>   }
>>   
>> -static inline struct intel_engine_cs *
>> -i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>> -{
>> -	struct intel_engine_cs *engine = NULL;
>> -	struct dma_fence *fence;
>> -
>> -	rcu_read_lock();
>> -	fence = dma_resv_get_excl_unlocked(obj->base.resv);
>> -	rcu_read_unlock();
>> -
>> -	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
>> -		engine = to_request(fence)->engine;
>> -	dma_fence_put(fence);
>> -
>> -	return engine;
>> -}
>> -
>>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>>   					 unsigned int cache_level);
>>   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>> index 04351a851586..1795af81bf41 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -139,7 +139,6 @@ void
>>   i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>>   {
>>   	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
>> -	struct intel_engine_cs *engine;
>>   	struct i915_vma *vma;
>>   	int pin_count = 0;
>>   
>> @@ -229,10 +228,6 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>>   		seq_printf(m, " (stolen: %08llx)", obj->stolen->start);
>>   	if (i915_gem_object_is_framebuffer(obj))
>>   		seq_printf(m, " (fb)");
>> -
>> -	engine = i915_gem_object_last_write_engine(obj);
>> -	if (engine)
>> -		seq_printf(m, " (%s)", engine->name);
>>   }
>>   
>>   static int i915_gem_object_info(struct seq_file *m, void *data)
>> -- 
>> 2.30.2
>>
> 
