Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C2474EADA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8262E10E350;
	Tue, 11 Jul 2023 09:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5BC10E350;
 Tue, 11 Jul 2023 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689068397; x=1720604397;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8edd3+OSU7T2MEeqFZUWUzRQV5wYeERRnVW4R86EJ6Q=;
 b=TMaCmvHC6jC3b9CaLmLatzL7yyZ5CPaxK/Wja5aBwuivWfsjkVPUCv5+
 tJTF/jYeCmWAl72ebcog77XKYLEt6fuoxLlCb8xeMlGZOYTOPlSwXLRav
 bJogUivq1q3jzrn0YjjGHMRRJNcQWBVuEwP0+3Lwov4Na2xbQ/eAUlYqq
 Yp9BGKjCapABzAF4RET06AkJ8Jl9d5VB4RiC4xWDw32spODcmd7XVCZ5m
 Yy1W/SR+zcF0DicxTOCS6qg5J/nBk+35GVjQVbWr78HBFy6r0+wKompkX
 W9HPC1Yv1S7nIjDmySUlA6WOb6R47Hpyk3iGFoLIHY3fQv2KS5IuAC/9l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368073038"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="368073038"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721040171"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="721040171"
Received: from rayhaanf-mobl.ger.corp.intel.com (HELO [10.213.205.242])
 ([10.213.205.242])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:39:55 -0700
Message-ID: <4f8f4ae9-76c3-af88-af44-b59a114b2415@linux.intel.com>
Date: Tue, 11 Jul 2023 10:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Add ability for tracking buffer
 objects per client
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-2-tvrtko.ursulin@linux.intel.com>
 <261b6cd8-3978-05ea-1348-c63e4599c518@intel.com>
 <e116c96f-e21c-255f-695a-a98a64fdb00f@linux.intel.com>
 <4dfc48d3-1111-1d3b-c03e-7c5820f2274d@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4dfc48d3-1111-1d3b-c03e-7c5820f2274d@intel.com>
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


On 11/07/2023 08:48, Iddamsetty, Aravind wrote:
> On 10-07-2023 18:50, Tvrtko Ursulin wrote:
>>
>> On 10/07/2023 11:44, Iddamsetty, Aravind wrote:
>>> On 07-07-2023 18:32, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> In order to show per client memory usage lets add some infrastructure
>>>> which enables tracking buffer objects owned by clients.
>>>>
>>>> We add a per client list protected by a new per client lock and to
>>>> support
>>>> delayed destruction (post client exit) we make tracked objects hold
>>>> references to the owning client.
>>>>
>>>> Also, object memory region teardown is moved to the existing RCU free
>>>> callback to allow safe dereference from the fdinfo RCU read section.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    | 13 +++++--
>>>>    .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 +++++++
>>>>    drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++++
>>>>    drivers/gpu/drm/i915/i915_drm_client.h        | 32 +++++++++++++++++
>>>>    4 files changed, 90 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 97ac6fb37958..3dc4fbb67d2b 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -105,6 +105,10 @@ void i915_gem_object_init(struct
>>>> drm_i915_gem_object *obj,
>>>>          INIT_LIST_HEAD(&obj->mm.link);
>>>>    +#ifdef CONFIG_PROC_FS
>>>> +    INIT_LIST_HEAD(&obj->client_link);
>>>> +#endif
>>>> +
>>>>        INIT_LIST_HEAD(&obj->lut_list);
>>>>        spin_lock_init(&obj->lut_lock);
>>>>    @@ -292,6 +296,10 @@ void __i915_gem_free_object_rcu(struct
>>>> rcu_head *head)
>>>>            container_of(head, typeof(*obj), rcu);
>>>>        struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>>    +    /* We need to keep this alive for RCU read access from fdinfo. */
>>>> +    if (obj->mm.n_placements > 1)
>>>> +        kfree(obj->mm.placements);
>>>> +
>>>>        i915_gem_object_free(obj);
>>>>          GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
>>>> @@ -388,9 +396,6 @@ void __i915_gem_free_object(struct
>>>> drm_i915_gem_object *obj)
>>>>        if (obj->ops->release)
>>>>            obj->ops->release(obj);
>>>>    -    if (obj->mm.n_placements > 1)
>>>> -        kfree(obj->mm.placements);
>>>> -
>>>>        if (obj->shares_resv_from)
>>>>            i915_vm_resv_put(obj->shares_resv_from);
>>>>    @@ -441,6 +446,8 @@ static void i915_gem_free_object(struct
>>>> drm_gem_object *gem_obj)
>>>>          GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
>>>>    +    i915_drm_client_remove_object(obj);
>>>> +
>>>>        /*
>>>>         * Before we free the object, make sure any pure RCU-only
>>>>         * read-side critical sections are complete, e.g.
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> index e72c57716bee..8de2b91b3edf 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> @@ -300,6 +300,18 @@ struct drm_i915_gem_object {
>>>>         */
>>>>        struct i915_address_space *shares_resv_from;
>>>>    +#ifdef CONFIG_PROC_FS
>>>> +    /**
>>>> +     * @client: @i915_drm_client which created the object
>>>> +     */
>>>> +    struct i915_drm_client *client;
>>>> +
>>>> +    /**
>>>> +     * @client_link: Link into @i915_drm_client.objects_list
>>>> +     */
>>>> +    struct list_head client_link;
>>>> +#endif
>>>> +
>>>>        union {
>>>>            struct rcu_head rcu;
>>>>            struct llist_node freed;
>>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>>> index 2a44b3876cb5..2e5e69edc0f9 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>>> @@ -28,6 +28,10 @@ struct i915_drm_client *i915_drm_client_alloc(void)
>>>>        kref_init(&client->kref);
>>>>        spin_lock_init(&client->ctx_lock);
>>>>        INIT_LIST_HEAD(&client->ctx_list);
>>>> +#ifdef CONFIG_PROC_FS
>>>> +    spin_lock_init(&client->objects_lock);
>>>> +    INIT_LIST_HEAD(&client->objects_list);
>>>> +#endif
>>>>          return client;
>>>>    }
>>>> @@ -108,4 +112,36 @@ void i915_drm_client_fdinfo(struct drm_printer
>>>> *p, struct drm_file *file)
>>>>        for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>>>>            show_client_class(p, i915, file_priv->client, i);
>>>>    }
>>>> +
>>>> +void i915_drm_client_add_object(struct i915_drm_client *client,
>>>> +                struct drm_i915_gem_object *obj)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    GEM_WARN_ON(obj->client);
>>>> +    GEM_WARN_ON(!list_empty(&obj->client_link));
>>>> +
>>>> +    spin_lock_irqsave(&client->objects_lock, flags);
>>>> +    obj->client = i915_drm_client_get(client);
>>>> +    list_add_tail_rcu(&obj->client_link, &client->objects_list);
>>>> +    spin_unlock_irqrestore(&client->objects_lock, flags);
>>>> +}
>>>
>>> would it be nice to mention that we use this client infra only to track
>>> internal objects. While the user created through file->object_idr added
>>> during handle creation time.
>>
>> In this series it is indeed only used for that.
>>
>> But it would be nicer to use it to track everything, so fdinfo readers
>> would not be hitting the idr lock, which would avoid injecting latency
>> to real DRM clients.
>>
>> The only fly in the ointment IMO is that I needed that drm core helper
>> to be able to track dmabuf imports. Possibly something for flink too,
>> did not look into that yet.
> 
> wouldn't dmabuf be tracked via object_idr as a new handle is created for it.

Yes it is/would. I was talking about hypothetically not using object_idr 
and instead tracking everything via the mechanism introduced in this 
patch, which would allow for lockless fdinfo reads for everything. If 
you remember I had that approach in an earlier version but it needed a 
patch to drm code to split the prime helpers (or so) and also did not 
cover the question on how to handle flink.

Regards,

Tvrtko

> 
> Thanks,
> Aravind.
>>
>> In the light of all that I can mention in the cover letter next time
>> round. It is a bit stale anyway (the cover letter).
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +    struct i915_drm_client *client = fetch_and_zero(&obj->client);
>>>> +    unsigned long flags;
>>>> +
>>>> +    /* Object may not be associated with a client. */
>>>> +    if (!client)
>>>> +        return false;
>>>> +
>>>> +    spin_lock_irqsave(&client->objects_lock, flags);
>>>> +    list_del_rcu(&obj->client_link);
>>>> +    spin_unlock_irqrestore(&client->objects_lock, flags);
>>>> +
>>>> +    i915_drm_client_put(client);
>>>> +
>>>> +    return true;
>>>> +}
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h
>>>> b/drivers/gpu/drm/i915/i915_drm_client.h
>>>> index 67816c912bca..5f58fdf7dcb8 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>>>> @@ -12,6 +12,9 @@
>>>>      #include <uapi/drm/i915_drm.h>
>>>>    +#include "i915_file_private.h"
>>>> +#include "gem/i915_gem_object_types.h"
>>>> +
>>>>    #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>>>>      struct drm_file;
>>>> @@ -25,6 +28,20 @@ struct i915_drm_client {
>>>>        spinlock_t ctx_lock; /* For add/remove from ctx_list. */
>>>>        struct list_head ctx_list; /* List of contexts belonging to
>>>> client. */
>>>>    +#ifdef CONFIG_PROC_FS
>>>> +    /**
>>>> +     * @objects_lock: lock protecting @objects_list
>>>> +     */
>>>> +    spinlock_t objects_lock;
>>>> +
>>>> +    /**
>>>> +     * @objects_list: list of objects created by this client
>>>> +     *
>>>> +     * Protected by @objects_lock.
>>>> +     */
>>>> +    struct list_head objects_list;
>>>> +#endif
>>>> +
>>>>        /**
>>>>         * @past_runtime: Accumulation of pphwsp runtimes from closed
>>>> contexts.
>>>>         */
>>>> @@ -49,4 +66,19 @@ struct i915_drm_client *i915_drm_client_alloc(void);
>>>>      void i915_drm_client_fdinfo(struct drm_printer *p, struct
>>>> drm_file *file);
>>>>    +#ifdef CONFIG_PROC_FS
>>>> +void i915_drm_client_add_object(struct i915_drm_client *client,
>>>> +                struct drm_i915_gem_object *obj);
>>>> +bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
>>>> +#else
>>>> +static inline void i915_drm_client_add_object(struct i915_drm_client
>>>> *client,
>>>> +                          struct drm_i915_gem_object *obj)
>>>> +{
>>>> +}
>>>> +
>>>> +static inline bool i915_drm_client_remove_object(struct
>>>> drm_i915_gem_object *obj)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>>    #endif /* !__I915_DRM_CLIENT_H__ */
