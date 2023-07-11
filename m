Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A557F74EB06
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1898E89343;
	Tue, 11 Jul 2023 09:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ED889343;
 Tue, 11 Jul 2023 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689068670; x=1720604670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/PgbY2GVJahO4tfTrmkNIHxQgrj7kFLA2OKT/k5sftw=;
 b=bu8hMmY2KgLO7DlQFuWkV6doiFUYB0dafvwD2Ebk7EIL75AjtoQ89mXD
 K+kwNnbP/5tUIK3H0zLJh9/pX9nrveLphb6XKmcZUDtlpGAtEL3PgTCfl
 2lpGX/87VVDmYsGhlunB12QD6rpmzN0HqwOdolEXa6oq0fr0xwbf9arGw
 QprlkvZwTQe7HfkuKXTzT72gD95qH51LwECvfCweFO+/UmKj1aETQBIrK
 k9qSGftvEHgUfMrU3RvkH3iA/WM0Jrm2a5hcYzN6Yn1N/7muQO39HNe7P
 ft0joqz9T2YgTN5yYnuqyJTxbXa1GfuzkD0G0aOfv8F4Wfz0Vsx1ekW4N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368073961"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="368073961"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721040683"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="721040683"
Received: from rayhaanf-mobl.ger.corp.intel.com (HELO [10.213.205.242])
 ([10.213.205.242])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:44:28 -0700
Message-ID: <7a41e871-bca8-116e-5adb-7e5f3e6da47a@linux.intel.com>
Date: Tue, 11 Jul 2023 10:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915: Account ring buffer and context
 state storage
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-5-tvrtko.ursulin@linux.intel.com>
 <488e77bf-c5f7-8dba-9f1a-7932b5e601d0@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <488e77bf-c5f7-8dba-9f1a-7932b5e601d0@intel.com>
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


On 11/07/2023 10:29, Iddamsetty, Aravind wrote:
> 
> 
> On 07-07-2023 18:32, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Account ring buffers and logical context space against the owning client
>> memory usage stats.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_context.c | 13 +++++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.c  | 10 ++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.h  |  8 ++++++++
>>   3 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>> index a53b26178f0a..8a395b9201e9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>> @@ -6,6 +6,7 @@
>>   #include "gem/i915_gem_context.h"
>>   #include "gem/i915_gem_pm.h"
>>   
>> +#include "i915_drm_client.h"
>>   #include "i915_drv.h"
>>   #include "i915_trace.h"
>>   
>> @@ -50,6 +51,7 @@ intel_context_create(struct intel_engine_cs *engine)
>>   
>>   int intel_context_alloc_state(struct intel_context *ce)
>>   {
>> +	struct i915_gem_context *ctx;
>>   	int err = 0;
>>   
>>   	if (mutex_lock_interruptible(&ce->pin_mutex))
>> @@ -66,6 +68,17 @@ int intel_context_alloc_state(struct intel_context *ce)
>>   			goto unlock;
>>   
>>   		set_bit(CONTEXT_ALLOC_BIT, &ce->flags);
>> +
>> +		rcu_read_lock();
>> +		ctx = rcu_dereference(ce->gem_context);
>> +		if (ctx && !kref_get_unless_zero(&ctx->ref))
>> +			ctx = NULL;
>> +		rcu_read_unlock();
>> +		if (ctx) {
>> +			if (ctx->client)
>> +				i915_drm_client_add_context(ctx->client, ce);
>> +			i915_gem_context_put(ctx);
>> +		}
>>   	}
>>   
>>   unlock:
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>> index 2e5e69edc0f9..ffccb6239789 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -144,4 +144,14 @@ bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>>   
>>   	return true;
>>   }
>> +
>> +void i915_drm_client_add_context(struct i915_drm_client *client,
>> +				 struct intel_context *ce)
> 
> do you think we can rename to i915_drm_client_add_context_objects?

I like it, will do, thanks!

Regards,

Tvrtko

> 
>> +{
>> +	if (ce->state)
>> +		i915_drm_client_add_object(client, ce->state->obj);
>> +
>> +	if (ce->ring != ce->engine->legacy.ring && ce->ring->vma)
>> +		i915_drm_client_add_object(client, ce->ring->vma->obj);
>> +}
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
>> index 5f58fdf7dcb8..39616b10a51f 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>> @@ -14,6 +14,7 @@
>>   
>>   #include "i915_file_private.h"
>>   #include "gem/i915_gem_object_types.h"
>> +#include "gt/intel_context_types.h"
>>   
>>   #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>>   
>> @@ -70,6 +71,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>>   void i915_drm_client_add_object(struct i915_drm_client *client,
>>   				struct drm_i915_gem_object *obj);
>>   bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
>> +void i915_drm_client_add_context(struct i915_drm_client *client,
>> +				 struct intel_context *ce);
>>   #else
>>   static inline void i915_drm_client_add_object(struct i915_drm_client *client,
>>   					      struct drm_i915_gem_object *obj)
>> @@ -79,6 +82,11 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
>>   static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>>   {
>>   }
>> +
>> +static inline void i915_drm_client_add_context(struct i915_drm_client *client,
>> +					       struct intel_context *ce)
>> +{
>> +}
>>   #endif
>>   
>>   #endif /* !__I915_DRM_CLIENT_H__ */
> 
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Thanks,
> Aravind.
